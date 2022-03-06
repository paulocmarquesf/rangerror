# rangerror

Confidence intervals for the random forest generalization error.

  > https://arxiv.org/abs/2112.06101

```r
devtools::install_github("paulocmarquesf/rangerror")

library(ranger)
library(MASS)

set.seed(42)

rf <- ranger(medv ~ ., data = Boston, num.trees = 10^3, keep.inbag = TRUE)

sqrt(rangerror::oob_ci(rf))
```

```
    2.5%    97.5% 
2.764147 3.663428 
```
