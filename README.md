# rangerror

Confidence intervals for the random forest generalization error as described in:

  > https://arxiv.org/abs/2112.06101

```r
devtools::install_github("paulocmarquesf/rangerror")

library(ranger)
library(MASS)

rf <- ranger(medv ~ ., data = Boston, num.trees = 1000, keep.inbag = TRUE)

rangerror::oob_ci(rf)
```

```
   2.5%    97.5% 
2.724513 3.755303
```
