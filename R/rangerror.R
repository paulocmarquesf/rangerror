get_mode <- function(x) {
   u <- unique(x)
   u[which.max(tabulate(match(x, u)))]
}

#' Out-of-bag confidence interval (see paper)
#'
#' Computes a confidence interval for the random forest generalization error.
#' @param rf A ranger object
#' @param conf_level Confidence level (defaults to 0.95)
#' @param M Number of bootstrap replications (defaults to 10^3)
#' @export
oob_ci <- function(rf, conf_level = 0.95, M = 10^3) {
   if (is.null(rf$inbag.counts)) {
       stop("You need to set keep.inbag = TRUE in the ranger() call.")
   }

   txt <- as.character(rf$call)[2]
   response <- unlist(regmatches(txt, gregexpr("^\\w+", txt)))
   df <- get(rf$call$data)
   n <- nrow(df)
   B <- rf$num.trees

   y_hat <- predict(rf, data = df, predict.all = TRUE)$predictions
   out <- matrix(unlist(lapply(rf$inbag.count, function(x) x == 0)), nrow = B, byrow = TRUE)

   if (rf$treetype == "Classification") {
       gamma_hat <- sapply(1:n, function(i) as.integer(df[[response]][i]) != get_mode(y_hat[i, out[, i]]))
       return(quantile(rowMeans(matrix(sample(gamma_hat, size = M*n, replace = TRUE), nrow = M)), probs = c((1 - conf_level)/2, (1 + conf_level)/2)))
   } else if (rf$treetype == "Regression") {
       gamma_hat <- sapply(1:n, function(i) (df[[response]][i] - mean(y_hat[i, out[, i]]))^2)
       return(sqrt(quantile(rowMeans(matrix(sample(gamma_hat, size = M*n, replace = TRUE), nrow = M)), probs = c((1 - conf_level)/2, (1 + conf_level)/2))))
   } else {
       stop("Should be a Classification or a Regression forest.")
   }
}
