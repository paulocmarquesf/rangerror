library(ranger)
library(rangerror)
library(MASS)

rf <- ranger(medv ~ ., data = Boston, num.trees = 1000, keep.inbag = TRUE)
sqrt(rf$prediction.error)
sqrt(oob_ci(rf))
