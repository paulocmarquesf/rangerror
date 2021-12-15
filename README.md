# rangerror

Confidence intervals for the random forest generalization error

https://arxiv.org/abs/2112.06101

```
devtools::install_github("paulocmarquesf/rangerror")

library(ranger)
library(rangerror)
library(MASS)

rf <- ranger(medv ~ ., data = Boston, num.trees = 1000, keep.inbag = TRUE)

oob_ci(rf)
```
