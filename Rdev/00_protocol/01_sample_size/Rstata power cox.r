# Rstata power cox.r
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








#####################################################################################################################
#@@@@ MH) To minimize the sample size requirement ====
# look for a large difference between groups (delta)
# look for a small variance (sigma) 
# Cf) for proportions, variance is a funciton of proportion (i.e., sigma^2 = np(1-p) <= n/4). -> small variance when p is close to 0 or 1~!
# look for a large acceptable type I error rate (z_{1-alpha/2}): 0.05 rather than 0.01
# look for a small acceptable power (z_{1-beta}): 0.8 rather than 0.9





#####################################################################################################################
#@@ two proportion ====

?ES.h
# Compute effect size h for two proportions
# Usage
# ES.h(p1, p2)

pwr.2p.test(h = ES.h(p1 = 0.025, p2 = 0.0125), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
stata.out = stata("power twoproportions 0.025 0.0125, power (0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > pwr.2p.test(h = ES.h(p1 = 0.025, p2 = 0.0125), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.09348514
#               n = 1796.186
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: same sample sizes
# 
# > stata.out = stata("power twoproportions 0.025 0.0125, power (0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.025 0.0125, power (0.8)
# 
# Performing iteration ...
# 
# Estimated sample sizes for a two-sample proportions test
# Pearson's chi-squared test 
# Ho: p2 = p1  versus  Ha: p2 != p1
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =   -0.0125  (difference)
#            p1 =    0.0250
#            p2 =    0.0125
# 
# Estimated sample sizes:
# 
#             N =     3,696
#   N per group =     1,848
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL





#####################################################################################################################
#@@ Cox ====


log(2)
stata("power cox, hratio(2) eventprob(.0125)", data.in = NULL, data.out = F, stata.version = 15.1) #----
stata("power cox 0.6931472, eventprob(.0125)", data.in = NULL, data.out = F, stata.version = 15.1) #----
# > log(2)
# [1] 0.6931472
# > stata("power cox, hratio(2) eventprob(.0125)", data.in = NULL, data.out = F, stata.version = 15.1) #----
# . power cox, hratio(2) eventprob(.0125)
# 
# Estimated sample size for Cox PH regression
# Wald test
# Ho: beta1 = 0  versus  Ha: beta1 != 0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.6931  (coefficient)
#        hratio =    2.0000
#            sd =    0.5000
# 
# Censoring:
# 
#          Pr_E =    0.0125
# 
# Estimated number of events and sample size:
# 
#             E =        66
#             N =     5,228
# > stata("power cox 0.6931472, eventprob(.0125)", data.in = NULL, data.out = F, stata.version = 15.1) #----
# . power cox 0.6931472, eventprob(.0125)
# 
# Estimated sample size for Cox PH regression
# Wald test
# Ho: beta1 = 0  versus  Ha: beta1 != 0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.6931  (coefficient)
#            b1 =    0.6931
#            sd =    0.5000
# 
# Censoring:
# 
#          Pr_E =    0.0125
# 
# Estimated number of events and sample size:
# 
#             E =        66
#             N =     5,228










#####################################################################################################################
#####################################################################################################################
#####################################################################################################################
#####################################################################################################################

alpha=0.05
beta=0.20
qnorm(1-alpha/2)
qnorm(1-beta)
# > alpha=0.05
# > beta=0.20
# > qnorm(1-alpha/2)
# [1] 1.959964
# > qnorm(1-beta)
# [1] 0.8416212



#####################################################################################################################
# http://powerandsamplesize.com/Calculators/Test-Time-To-Event-Data/Cox-PH-2-Sided-Equality ----
hr=2
hr0=1
pE=0.8
pA=0.5
alpha=0.05
beta=0.20
(n=((qnorm(1-alpha/2)+qnorm(1-beta))/(log(hr)-log(hr0)))^2/(pA*(1-pA)*pE))
ceiling(n) # 82
(Power=pnorm((log(hr)-log(hr0))*sqrt(n*pA*(1-pA)*pE)-qnorm(1-alpha/2)))
# > (n=((qnorm(1-alpha/2)+qnorm(1-beta))/(log(hr)-log(hr0)))^2/(pA*(1-pA)*pE))
# [1] 81.68207
# > ceiling(n) # 82
# [1] 82
# > (Power=pnorm((log(hr)-log(hr0))*sqrt(n*pA*(1-pA)*pE)-qnorm(1-alpha/2)))
# [1] 0.8


stata("power cox, hratio(2) eventprob(0.8)", data.in = NULL, data.out = F, stata.version = 15.1) #----
# > stata("power cox, hratio(2) eventprob(0.8)", data.in = NULL, data.out = F, stata.version = 15.1) #----
# . power cox, hratio(2) eventprob(0.8)
# 
# Estimated sample size for Cox PH regression
# Wald test
# Ho: beta1 = 0  versus  Ha: beta1 != 0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.6931  (coefficient)
#        hratio =    2.0000
#            sd =    0.5000
# 
# Censoring:
# 
#          Pr_E =    0.8000
# 
# Estimated number of events and sample size:
# 
#             E =        66
#             N =        82





#@ end ----
