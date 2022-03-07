library(ranger)
library(rangerror)
library(mlbench)

data(Glass)

rf <- ranger(Type ~ ., data = Glass, num.trees = 1000, keep.inbag = TRUE)
rf$prediction.error
oob_ci(rf)
