# rangerror

Confidence intervals for the random forest generalization error

https://arxiv.org/abs/2112.06101

```
devtools::install_github("paulocmarquesf/rangerror")

library(ranger)

rf <- ranger(medv ~ ., data = MASS::Boston, num.trees = 1000, keep.inbag = TRUE)

rangerror::oob_ci(rf)
```
