# rangerror

Confidence intervals for the random forest generalization error.

  > https://arxiv.org/abs/2112.06101

```r
devtools::install_github("paulocmarquesf/rangerror")

library(ranger)
library(rangerror)
library(MASS)
library(mlbench)

set.seed(42)
```

### Regression (Boston housing)

```
rf <- ranger(medv ~ ., data = Boston, num.trees = 10^3, keep.inbag = TRUE)

sqrt(oob_ci(rf))
```

```
    2.5%    97.5%
2.764147 3.663428
```

### Classification (Forensic glass)

```r
data(Glass)

rf <- ranger(Type ~ ., data = Glass, num.trees = 10^3, keep.inbag = TRUE)

oob_ci(rf)
```

```
     2.5%     97.5%
0.1401869 0.2523364
```
