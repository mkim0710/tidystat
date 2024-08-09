# Rstata power mcc.r
# Rstata power oneproportion twoproportions.r
# Rstata power onemean twomeans.r

library(tidyverse)
library(pwr)
library(RStata)
library(RStata)
options("RStata.StataPath" = "\"C:\\Program Files (x86)\\Stata15\\Stata-64\"")
options("RStata.StataVersion" = 15)
dput(options("RStata.StataPath"))
dput(options("RStata.StataVersion"))
# > chooseStataBin()
# [1] "\"C:\\Program Files (x86)\\Stata15\\Stata-64\""
# > dput(options("RStata.StataPath"))
# list(RStata.StataPath = "\"C:\\Program Files (x86)\\Stata15\\Stata-64\"")
# > dput(options("RStata.StataVersion"))
# list(RStata.StataVersion = NULL)


# https://www.statmethods.net/stats/power.html
# https://cran.r-project.org/web/packages/pwr/vignettes/pwr-vignette.html
# pwr.p.test: one-sample proportion test
# pwr.2p.test: two-sample proportion test
# pwr.2p2n.test: two-sample proportion test (unequal sample sizes)
# pwr.t.test: two-sample, one-sample and paired t-tests
# pwr.t2n.test: two-sample t-tests (unequal sample sizes)
# pwr.anova.test: one-way balanced ANOVA
# pwr.r.test: correlation test
# pwr.chisq.test: chi-squared test (goodness of fit and association)
# pwr.f2.test: test for the general linear model


# https://stats.idre.ucla.edu/stata/faq/how-can-i-compute-power-for-contingency-tables-in-stata/
# power twoproportions p1 p2, n1(numlist) n2(numlist) [options]







#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@@@ MH) To minimize the sample size requirement ====  
# look for a large difference between groups (delta)
# look for a small variance (sigma) 
# Cf) for proportions, variance is a funciton of proportion (i.e., sigma^2 = np(1-p) <= n/4). -> small variance when p is close to 0 or 1~!
# look for a large acceptable type I error rate (z_{1-alpha/2}): 0.05 rather than 0.01
# look for a small acceptable power (z_{1-beta}): 0.8 rather than 0.9






#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ matched case-control ====  


stata.out = stata("power mcc (0.15 0.2 0.25), oratio(1.2 1.5 1.8 2.1 2.4) m(5)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power mcc (0.15 0.2 0.25), oratio(1.2 1.5 1.8 2.1 2.4) m(5)", data.in = NULL, data.out = T, stata.version = 15.1) #----  
# . power mcc (0.15 0.2 0.25), oratio(1.2 1.5 1.8 2.1 2.4) m(5)
# 
# Performing iteration ...
# 
# Estimated sample size for a matched case-control study
# Asymptotic z test, 1:5 matched design
# Ho: OR = 1  versus  Ha: OR != 1
# 
#   +-----------------------------------------------------------------+
#   |   alpha   power       N   delta       M      p0  oratio    corr |
#   |-----------------------------------------------------------------|
#   |     .05      .8   2,053     1.2       5     .15     1.2       0 |
#   |     .05      .8     378     1.5       5     .15     1.5       0 |
#   |     .05      .8     168     1.8       5     .15     1.8       0 |
#   |     .05      .8     100     2.1       5     .15     2.1       0 |
#   |     .05      .8      68     2.4       5     .15     2.4       0 |
#   |     .05      .8   1,656     1.2       5      .2     1.2       0 |
#   |     .05      .8     310     1.5       5      .2     1.5       0 |
#   |     .05      .8     140     1.8       5      .2     1.8       0 |
#   |     .05      .8      84     2.1       5      .2     2.1       0 |
#   |     .05      .8      58     2.4       5      .2     2.4       0 |
#   |     .05      .8   1,430     1.2       5     .25     1.2       0 |
#   |     .05      .8     272     1.5       5     .25     1.5       0 |
#   |     .05      .8     124     1.8       5     .25     1.8       0 |
#   |     .05      .8      76     2.1       5     .25     2.1       0 |
#   |     .05      .8      53     2.4       5     .25     2.4       0 |
#   +-----------------------------------------------------------------+
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL


