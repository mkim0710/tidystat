# Rstata power onemean twomeans.r

library(tidyverse)
library(pwr)
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



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://stats.idre.ucla.edu/stata/faq/how-can-i-compute-power-for-contingency-tables-in-stata/
# power twoproportions p1 p2, n1(numlist) n2(numlist) [options]

# https://www.stata.com/features/overview/power-and-sample-size/





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@@@ MH) To minimize the sample size requirement ====
# look for a large difference between groups (delta)
# look for a small variance (sigma) 
# Cf) for proportions, variance is a funciton of proportion (i.e., sigma^2 = np(1-p) <= n/4). -> small variance when p is close to 0 or 1~!
# look for a large acceptable type I error rate (z_{1-alpha/2}): 0.05 rather than 0.01
# look for a small acceptable power (z_{1-beta}): 0.8 rather than 0.9





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ t-test for one sample mean =====
# Null hypothesis (H0):         mu0 = 80
# Alternative hypothesis (H1):  mu1 = 70
# (pooled) sd = 20
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# => n? 34



# ?power.t.test
# Usage
# power.t.test(n = NULL, delta = NULL, sd = 1, sig.level = 0.05,
#              power = NULL,
#              type = c("two.sample", "one.sample", "paired"),
#              alternative = c("two.sided", "one.sided"),
#              strict = FALSE, tol = .Machine$double.eps^0.25)
# Arguments
# n	
# number of observations (per group)
# delta	
# true difference in means
# sd	
# standard deviation
# sig.level	
# significance level (Type I error probability)
# power	
# power of test (1 minus Type II error probability)
# type	
# string specifying the type of t test. Can be abbreviated.
# alternative	
# one- or two-sided test. Can be abbreviated.
# strict	
# use strict interpretation in two-sided case
# tol	
# numerical tolerance used in root finding, the default providing (at least) four significant digits.
# 
# Details
# Exactly one of the parameters n, delta, power, sd, and sig.level must be passed as NULL, and that parameter is determined from the others. Notice that the last two have non-NULL defaults, so NULL must be explicitly passed if you want to compute them.
# 
# If strict = TRUE is used, the power will include the probability of rejection in the opposite direction of the true effect, in the two-sided case. Without this the power will be half the significance level if the true difference is zero.


# ?pwr.t.test
# Usage
# pwr.t.test(n = NULL, d = NULL, sig.level = 0.05, power = NULL, 
#     type = c("two.sample", "one.sample", "paired"),
#     alternative = c("two.sided", "less", "greater"))
# 
# Arguments
# n	
# Number of observations (per sample)
# d	
# Effect size (Cohen's d) - difference between the means divided by the pooled standard deviation
# sig.level	
# Significance level (Type I error probability)
# power	
# Power of test (1 minus Type II error probability)
# type	
# Type of t test : one- two- or paired-samples
# alternative	
# a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less"
# 
# Details
# Exactly one of the parameters 'd','n','power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.




mu1 = 80
mu2 = 70
sd = 20
power.t.test(delta = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > power.t.test(delta = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      One-sample t test power calculation 
# 
#               n = 33.3672
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided


mu1 = 80
mu2 = 70
sd = 20
pwr.t.test(d = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.t.test(d = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      One-sample t test power calculation 
# 
#               n = 33.36713
#               d = 0.5
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided

stata.out = stata("power onemean 80 70, sd(20) alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power onemean 80 70, sd(20) alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power onemean 80 70, sd(20) alpha(0.05) power(0.8)
# 
# Performing iteration ...
# 
# Estimated sample size for a one-sample mean test
# t test
# Ho: m = m0  versus  Ha: m != m0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =   -0.5000
#            m0 =   80.0000
#            ma =   70.0000
#            sd =   20.0000
# 
# Estimated sample size:
# 
#             N =        34
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'






#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ t-test for two sample mean comparison (sample size ratio = 1) =====
# Null hypothesis (H0):         mu2 - mu1 = 0
# Alternative hypothesis (H1):  mu2 - mu1 = 10
# sd1 = 20
# sd2 = 20
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n1:n2 = 1:1
# => n1? n2?







mu1 = 80
mu2 = 70
sd1 = 20
sd2 = 20
sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
power.t.test(delta = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > power.t.test(delta = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Two-sample t test power calculation 
# 
#               n = 63.76576
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number in *each* group


mu1 = 80
mu2 = 70
sd1 = 20
sd2 = 20
sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Two-sample t test power calculation 
# 
#               n = 63.76561
#               d = 0.5
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number in *each* group

stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80)
# 
# Performing iteration ...
# 
# Estimated sample sizes for a two-sample means test
# Satterthwaite's t test assuming unequal variances
# Ho: m2 = m1  versus  Ha: m2 != m1
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =  -10.0000
#            m1 =   80.0000
#            m2 =   70.0000
#           sd1 =   20.0000
#           sd2 =   20.0000
# 
# Estimated sample sizes:
# 
#             N =       128
#   N per group =        64
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ t-test for two sample mean comparison (when sample size of one group is fixed) =====
# Null hypothesis (H0):         mu2 - mu1 = 0
# Alternative hypothesis (H1):  mu2 - mu1 = 10
# sd1 = 20
# sd2 = 20
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n1 = 40   # n1 is the control group, and n2 is the experimental group
# => n2?


# ?pwr.t2n.test
# Usage
# pwr.t2n.test(n1 = NULL, n2= NULL, d = NULL, sig.level = 0.05, power = NULL,
#  alternative = c("two.sided", 
#         "less","greater"))
# Arguments
# n1	
# Number of observations in the first sample
# n2	
# Number of observations in the second sample
# d	
# Effect size
# sig.level	
# Significance level (Type I error probability)
# power	
# Power of test (1 minus Type II error probability)
# alternative	
# a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less"
# 
# Details
# Exactly one of the parameters 'd','n1','n2','power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.


n1 = 40
mu1 = 80
mu2 = 70
sd1 = 20
sd2 = 20
sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.t2n.test(n1 = n1, n2 = NULL, d = (mu1 - mu2) / sd_pooled, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.t2n.test(n1 = n1, n2 = NULL, d = (mu1 - mu2) / sd_pooled, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      t test power calculation 
# 
#              n1 = 40
#              n2 = 153.0969
#               d = 0.5
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided



stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) n1(40) compute(n2)", data.in = NULL, data.out = T, stata.version = 15.1) # n1 is the control group, and n2 is the experimental group #----
stata.out
stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) n2(40) compute(n1)", data.in = NULL, data.out = T, stata.version = 15.1) # n1 is the control group, and n2 is the experimental group #----
stata.out
# > stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) n1(40) compute(n2)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) n1(40) compute(
# > n2)
# 
# Performing iteration ...
# 
# Estimated sample sizes for a two-sample means test
# Satterthwaite's t test assuming unequal variances
# Ho: m2 = m1  versus  Ha: m2 != m1
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =  -10.0000
#            m1 =   80.0000
#            m2 =   70.0000
#           sd1 =   20.0000
#           sd2 =   20.0000
#            N1 =        40
# 
# Estimated sample sizes:
# 
#             N =       213
#            N2 =       173
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) n2(40) compute(n1)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) n2(40) compute(
# > n1)
# 
# Performing iteration ...
# 
# Estimated sample sizes for a two-sample means test
# Satterthwaite's t test assuming unequal variances
# Ho: m2 = m1  versus  Ha: m2 != m1
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =  -10.0000
#            m1 =   80.0000
#            m2 =   70.0000
#           sd1 =   20.0000
#           sd2 =   20.0000
#            N2 =        40
# 
# Estimated sample sizes:
# 
#             N =       213
#            N1 =       173
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'








#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ t-test for two sample mean comparison (sample size ratio = Nexperimental/Ncontrol = 1/5) =====
# Null hypothesis (H0):         mu2 - mu1 = 0
# Alternative hypothesis (H1):  mu2 - mu1 = 10
# sd1 = 20
# sd2 = 20
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n2:n1 = 1:5  # n1 is the control group, and n2 is the experimental group
# => n1? n2?

stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) nratio(0.2)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) nratio(0.2)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80) nratio(0.2)
# 
# Performing iteration ...
# 
# Estimated sample sizes for a two-sample means test
# Satterthwaite's t test assuming unequal variances
# Ho: m2 = m1  versus  Ha: m2 != m1
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =  -10.0000
#            m1 =   80.0000
#            m2 =   70.0000
#           sd1 =   20.0000
#           sd2 =   20.0000
#         N2/N1 =    0.2000
# 
# Estimated sample sizes:
# 
#             N =       236
#            N1 =       196
#            N2 =        40
#         N2/N1 =    0.2041
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ matched case-control two sample mean comparison (sample size ratio = 1) ====
# Null hypothesis (H0):         mu2 - mu1 = 0
# Alternative hypothesis (H1):  mu2 - mu1 = 10
# sd1 = 20
# sd2 = 20
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n1:n2 = 1:1
# => n1? n2?


mu1 = 80
mu2 = 70
sd1 = 20
sd2 = 20
sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
power.t.test(d = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
power.t.test(d = (mu1 - mu2) / sd_pooled, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
power.t.test(d = (mu1 - mu2) / sd_pooled, type="paired", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > power.t.test(d = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Two-sample t test power calculation 
# 
#               n = 63.76576
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number in *each* group
# 
# > power.t.test(d = (mu1 - mu2) / sd_pooled, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      One-sample t test power calculation 
# 
#               n = 33.3672
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# > power.t.test(d = (mu1 - mu2) / sd_pooled, type="paired", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Paired t test power calculation 
# 
#               n = 33.3672
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs



mu1 = 80
mu2 = 70
sd1 = 20
sd2 = 20
sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="paired", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Two-sample t test power calculation 
# 
#               n = 63.76561
#               d = 0.5
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number in *each* group
# 
# > pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      One-sample t test power calculation 
# 
#               n = 33.36713
#               d = 0.5
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# > pwr.t.test(d = (mu1 - mu2) / sd_pooled, type="paired", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Paired t test power calculation 
# 
#               n = 33.36713
#               d = 0.5
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number of *pairs*



# https://stats.idre.ucla.edu/stata/dae/power-analysis-for-paired-sample-t-test/
stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
stata.out = stata("power onemean 0 10, sd(20) alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
stata.out = stata("sampsi 0 10, sd(20) alpha(0.05) power(0.80) onesamp", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twomeans 80 70, sd1(20) sd2(20) alpha(0.05) power(0.80)
# 
# Performing iteration ...
# 
# Estimated sample sizes for a two-sample means test
# Satterthwaite's t test assuming unequal variances
# Ho: m2 = m1  versus  Ha: m2 != m1
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =  -10.0000
#            m1 =   80.0000
#            m2 =   70.0000
#           sd1 =   20.0000
#           sd2 =   20.0000
# 
# Estimated sample sizes:
# 
#             N =       128
#   N per group =        64
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power onemean 0 10, sd(20) alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power onemean 0 10, sd(20) alpha(0.05) power(0.80)
# 
# Performing iteration ...
# 
# Estimated sample size for a one-sample mean test
# t test
# Ho: m = m0  versus  Ha: m != m0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.5000
#            m0 =    0.0000
#            ma =   10.0000
#            sd =   20.0000
# 
# Estimated sample size:
# 
#             N =        34
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out = stata("sampsi 0 10, sd(20) alpha(0.05) power(0.80) onesamp", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . sampsi 0 10, sd(20) alpha(0.05) power(0.80) onesamp
# 
# Estimated sample size for one-sample comparison of mean
#   to hypothesized value
# 
# Test Ho: m =      0, where m is the mean in the population
# 
# Assumptions:
# 
#          alpha =   0.0500  (two-sided)
#          power =   0.8000
#  alternative m =       10
#             sd =       20
# 
# Estimated required sample size:
# 
#              n =       32
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL









#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ matched case-control ====


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













#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

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


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# http://powerandsamplesize.com/Calculators/Test-1-Mean/1-Sample-Equality ----
mu=2
mu0=1.5
sd=1
alpha=0.05
beta=0.20
(n=(sd*(qnorm(1-alpha/2)+qnorm(1-beta))/(mu-mu0))^2)
ceiling(n)# 32
z=(mu-mu0)/sd*sqrt(n)
(Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))
# > (n=(sd*(qnorm(1-alpha/2)+qnorm(1-beta))/(mu-mu0))^2)
# [1] 31.39552
# > ceiling(n)# 32
# [1] 32
# > z=(mu-mu0)/sd*sqrt(n)
# > (Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))
# [1] 0.800001

mu1 = 1.5
mu2 = 2
sd = 1
power.t.test(delta = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
power.t.test(delta = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided", strict = T) #----
# > power.t.test(delta = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      One-sample t test power calculation 
# 
#               n = 33.3672
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# > power.t.test(delta = (mu1 - mu2) / sd, type="one.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided", strict = T) #----
# 
#      One-sample t test power calculation 
# 
#               n = 33.36713
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# http://powerandsamplesize.com/Calculators/Compare-2-Means/2-Sample-Equality ----
muA=5
muB=10
kappa=1
sd=10
alpha=0.05
beta=0.20
(nB=(1+1/kappa)*(sd*(qnorm(1-alpha/2)+qnorm(1-beta))/(muA-muB))^2)
ceiling(nB) # 63
z=(muA-muB)/(sd*sqrt((1+1/kappa)/nB))
(Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))
# > (nB=(1+1/kappa)*(sd*(qnorm(1-alpha/2)+qnorm(1-beta))/(muA-muB))^2)
# [1] 62.79104
# > ceiling(nB) # 63
# [1] 63
# > z=(muA-muB)/(sd*sqrt((1+1/kappa)/nB))
# > (Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))
# [1] 0.800001


mu1 = 5
mu2 = 10
sd1 = 10
sd2 = 10
sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
power.t.test(delta = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > power.t.test(delta = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Two-sample t test power calculation 
# 
#               n = 63.76576
#           delta = 0.5
#              sd = 1
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number in *each* group




#@ end -----
