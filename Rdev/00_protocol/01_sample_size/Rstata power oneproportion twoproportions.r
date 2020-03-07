# Rstata power oneproportion twoproportions.r
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
#@@ test for one sample proportion =====
# Null hypothesis (H0):         p0 = 0.5
# Alternative hypothesis (H1):  p1 = 0.7
# sd = (n*p0*(1-p0))^0.5  -> also a function of n~!!   # under null?!
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# => n? 


?pwr.p.test
# Usage
# pwr.p.test(h = NULL, n = NULL, sig.level = 0.05, power = NULL,
#     alternative = c("two.sided","less","greater"))
# Arguments
# h	
# Effect size
# n	
# Number of observations
# sig.level	
# Significance level (Type I error probability)
# power	
# Power of test (1 minus Type II error probability)
# alternative	
# a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less"
# 
# Details
# These calculations use arcsine transformation of the proportion (see Cohen (1988))
# 
# Exactly one of the parameters 'h','n','power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.

p1 = 0.5
p2 = 0.7
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#               n = 46.34804
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# > pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#               n = 92.69608
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: same sample sizes



stata.out = stata("power oneproportion 0.5 0.7, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power oneproportion 0.5 0.7, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power oneproportion 0.5 0.7, alpha(0.05) power(0.8)
# 
# Performing iteration ...
# 
# Estimated sample size for a one-sample proportion test
# Score z test
# Ho: p = p0  versus  Ha: p != p0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.2000
#            p0 =    0.5000
#            pa =    0.7000
# 
# Estimated sample size:
# 
#             N =        47
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.5 0.7, alpha(0.05) power(0.8)
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
#         delta =    0.2000  (difference)
#            p1 =    0.5000
#            p2 =    0.7000
# 
# Estimated sample sizes:
# 
#             N =       186
#   N per group =        93
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'





#####################################################################################################################
#@@ test for two sample proportion comparison (sample size ratio = 1) =====
# Null hypothesis (H0):         p2 - p1 = 0
# Alternative hypothesis (H1):  p2 - p1 = 0.2
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n1:n2 = 1:1
# => n1? n2?


?power.prop.test  # Caution) this is for Two-Sample Test for Proportions~!!! -----
# Usage
# power.prop.test(n = NULL, p1 = NULL, p2 = NULL, sig.level = 0.05,
#                 power = NULL,
#                 alternative = c("two.sided", "one.sided"),
#                 strict = FALSE, tol = .Machine$double.eps^0.25)
# Arguments
# n	
# number of observations (per group)
# p1	
# probability in one group
# p2	
# probability in other group
# sig.level	
# significance level (Type I error probability)
# power	
# power of test (1 minus Type II error probability)
# alternative	
# one- or two-sided test. Can be abbreviated.
# strict	
# use strict interpretation in two-sided case
# tol	
# numerical tolerance used in root finding, the default providing (at least) four significant digits.
# 
# Details
# Exactly one of the parameters n, p1, p2, power, and sig.level must be passed as NULL, and that parameter is determined from the others. Notice that sig.level has a non-NULL default so NULL must be explicitly passed if you want it computed.
# 
# If strict = TRUE is used, the power will include the probability of rejection in the opposite direction of the true effect, in the two-sided case. Without this the power will be half the significance level if the true difference is zero.
# 
# Note that not all conditions can be satisfied, e.g., for
# 
# power.prop.test(n=30, p1=0.90, p2=NULL, power=0.8, strict=TRUE)
# there is no proportion p2 between p1 = 0.9 and 1, as you'd need a sample size of at least n = 74 to yield the desired power for (p1,p2) = (0.9, 1).
# 
# For these impossible conditions, currently a warning (warning) is signalled which may become an error (stop) in the future.



p1 = 0.5
p2 = 0.7
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
power.prop.test(p1 = p1, p2 = p2, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > power.prop.test(p1 = p1, p2 = p2, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Two-sample comparison of proportions power calculation 
# 
#               n = 92.99884
#              p1 = 0.5
#              p2 = 0.7
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: n is number in *each* group


?pwr.2p.test
# Usage
# pwr.2p.test(h = NULL, n = NULL, sig.level = 0.05, power = NULL, 
#     alternative = c("two.sided","less","greater"))
# Arguments
# h	
# Effect size
# n	
# Number of observations (per sample)
# sig.level	
# Significance level (Type I error probability)
# power	
# Power of test (1 minus Type II error probability)
# alternative	
# a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less"
# 
# Details
# Exactly one of the parameters 'h','n', 'power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.

?ES.h
# ES.h {pwr}	R Documentation
# Effect size calculation for proportions
# Description
# Compute effect size h for two proportions
# 
# Usage
# ES.h(p1, p2)
# Arguments
# p1	
# First proportion
# p2	
# Second proportion
# 
# Details
# The effect size is 2*asin(sqrt(p1))-2*asin(sqrt(p2))



# p1 = 0.5
# p2 = 0.7
# n = pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided")$n
# mu1 = p1
# mu2 = p2
# sd1 = (1/n*p1*(1-p1))^0.5
# sd2 = (1/n*p2*(1-p2))^0.5
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
# power.t.test(delta = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# # > power.t.test(delta = (mu1 - mu2) / sd_pooled, type="two.sample", sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# # 
# #      Two-sample t test power calculation 
# # 
# #               n = 2.4077
# #           delta = 4.015104
# #              sd = 1
# #       sig.level = 0.05
# #           power = 0.8
# #     alternative = two.sided
# # 
# # NOTE: n is number in *each* group



p1 = 0.5
p2 = 0.7
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#               n = 92.69608
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: same sample sizes

stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.5 0.7, alpha(0.05) power(0.80)
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
#         delta =    0.2000  (difference)
#            p1 =    0.5000
#            p2 =    0.7000
# 
# Estimated sample sizes:
# 
#             N =       186
#   N per group =        93
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL







#####################################################################################################################
#@@ test for two sample proportion comparison (when sample size of one group is fixed) =====
# Null hypothesis (H0):         p2 - p1 = 0
# Alternative hypothesis (H1):  p2 - p1 = 0.2
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n1 = 40   # n1 is the control group, and n2 is the experimental group
# => n2?


?pwr.2p2n.test
# Usage
# pwr.2p2n.test(h = NULL, n1 = NULL, n2 = NULL, sig.level = 0.05, power = NULL,
#     alternative = c("two.sided", "less","greater"))
# Arguments
# h	
# Effect size
# n1	
# Number of observations in the first sample
# n2	
# Number of observationsz in the second sample
# sig.level	
# Significance level (Type I error probability)
# power	
# Power of test (1 minus Type II error probability)
# alternative	
# a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less"
# 
# Details
# Exactly one of the parameters 'h','n1', 'n2', 'power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.




p1 = 0.5
p2 = 0.7
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.2p2n.test(h = ES.h(p1 = p1, p2 = p2), n1 = 50, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.2p2n.test(h = ES.h(p1 = p1, p2 = p2), n2 = 50, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#               n = 92.69608
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: same sample sizes
# 
# > pwr.2p2n.test(h = ES.h(p1 = p1, p2 = p2), n1 = 50, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#              n1 = 50
#              n2 = 634.5639
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: different sample sizes
# > pwr.2p2n.test(h = ES.h(p1 = p1, p2 = p2), n2 = 50, sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#              n1 = 634.5639
#              n2 = 50
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: different sample sizes


stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80) n1(50) compute(n2)", data.in = NULL, data.out = T, stata.version = 15.1)  # n1 is the control group, and n2 is the experimental group #----
stata.out
stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80) n2(50) compute(n1)", data.in = NULL, data.out = T, stata.version = 15.1)  # n1 is the control group, and n2 is the experimental group #----
stata.out
# > stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.5 0.7, alpha(0.05) power(0.80)
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
#         delta =    0.2000  (difference)
#            p1 =    0.5000
#            p2 =    0.7000
# 
# Estimated sample sizes:
# 
#             N =       186
#   N per group =        93
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80) n1(50) compute(n2)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.5 0.7, alpha(0.05) power(0.80) n1(50) compute(n2)
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
#         delta =    0.2000  (difference)
#            p1 =    0.5000
#            p2 =    0.7000
#            N1 =        50
# 
# Estimated sample sizes:
# 
#             N =       449
#            N2 =       399
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80) n2(50) compute(n1)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.5 0.7, alpha(0.05) power(0.80) n2(50) compute(n1)
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
#         delta =    0.2000  (difference)
#            p1 =    0.5000
#            p2 =    0.7000
#            N2 =        50
# 
# Estimated sample sizes:
# 
#             N =       773
#            N1 =       723
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'








#####################################################################################################################
#@@ test for two sample proportion comparison (sample size ratio = Nexperimental/Ncontrol = 1/5) =====
# Null hypothesis (H0):         p2 - p1 = 0
# Alternative hypothesis (H1):  p2 - p1 = 0.2
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# desired power = 0.8
# desired alpha = 0.05 for two-sided test
# n2:n1 = 1:5  # n1 is the control group, and n2 is the experimental group
# => n1? n2?




stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80) nratio(0.2)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power twoproportions 0.5 0.7, alpha(0.05) power(0.80) nratio(0.2)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.5 0.7, alpha(0.05) power(0.80) nratio(0.2)
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
#         delta =    0.2000  (difference)
#            p1 =    0.5000
#            p2 =    0.7000
#         N2/N1 =    0.2000
# 
# Estimated sample sizes:
# 
#             N =       339
#            N1 =       282
#            N2 =        57
#         N2/N1 =    0.2021
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'

















#####################################################################################################################
#@@ Cox ====

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
# http://powerandsamplesize.com/Calculators/Test-1-Proportion/1-Sample-Equality ----
# Chow S, Shao J, Wang H. 2008. Sample Size Calculations in Clinical Research. 2nd Ed. Chapman & Hall/CRC Biostatistics Series. page 85.
# Chow S, Shao J, Wang H, Lokhnygina Y. 2017. Sample Size Calculations in Clinical Research. 3rd Ed. Chapman & Hall/CRC Biostatistics Series. page 85.
# Chapter 4 Large Sample Tests for Proportions
# 4.1 One-Sample Design                            
# 4.1.1 Test for Equality

p=0.5
p0=0.3
alpha=0.05
beta=0.20
(   n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2   )#----
ceiling(n) # 50
z = (p-p0) / sqrt( p*(1-p) / n )
(   Power = pnorm( z - qnorm(1-alpha/2) ) + pnorm( -z - qnorm(1-alpha/2) )   )#----
# > (n=p*(1-p)*((qnorm(1-alpha/2)+qnorm(1-beta))/(p-p0))^2)#----
# [1] 49.0555
# > ceiling(n) # 50
# [1] 50
# > z=(p-p0)/sqrt(p*(1-p)/n)
# > (Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))#----
# [1] 0.800001




p1 = 0.3
p2 = 0.5
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#               n = 46.34804
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# > pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4115168
#               n = 92.69608
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: same sample sizes


stata.out = stata("power oneproportion 0.3 0.5, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
stata.out = stata("power twoproportions 0.3 0.5, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power oneproportion 0.3 0.5, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power oneproportion 0.3 0.5, alpha(0.05) power(0.8)
# 
# Performing iteration ...
# 
# Estimated sample size for a one-sample proportion test
# Score z test
# Ho: p = p0  versus  Ha: p != p0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.2000
#            p0 =    0.3000
#            pa =    0.5000
# 
# Estimated sample size:
# 
#             N =        44
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power twoproportions 0.3 0.5, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.3 0.5, alpha(0.05) power(0.8)
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
#         delta =    0.2000  (difference)
#            p1 =    0.3000
#            p2 =    0.5000
# 
# Estimated sample sizes:
# 
#             N =       186
#   N per group =        93
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'







#####################################################################################################################
# http://powerandsamplesize.com/Calculators/Compare-2-Proportions/2-Sample-Equality ----
# Chow S, Shao J, Wang H. 2008. Sample Size Calculations in Clinical Research. 2nd Ed. Chapman & Hall/CRC Biostatistics Series. page 89.
# Chow S, Shao J, Wang H, Lokhnygina Y. 2017. Sample Size Calculations in Clinical Research. 3rd Ed. Chapman & Hall/CRC Biostatistics Series. page 85.
# Chapter 4 Large Sample Tests for Proportions
# 4.2 Two-Sample Parallel Design
# 4.2.1 Test for Equality

pA=0.65
pB=0.85
kappa=1
alpha=0.05
beta=0.20
(    nB = ( pA*(1-pA)/kappa + pB*(1-pB) ) * ( (qnorm(1-alpha/2) + qnorm(1-beta)) / (pA-pB) )^2    )#----
ceiling(nB) # 70
z=(pA-pB)/sqrt(pA*(1-pA)/nB/kappa+pB*(1-pB)/nB)
(    Power = pnorm( z - qnorm(1-alpha/2) ) + pnorm( -z - qnorm(1-alpha/2) )    )#----
# > (nB=(pA*(1-pA)/kappa+pB*(1-pB))*((qnorm(1-alpha/2)+qnorm(1-beta))/(pA-pB))^2)#----
# [1] 69.65881
# > ceiling(nB) # 70
# [1] 70
# > z=(pA-pB)/sqrt(pA*(1-pA)/nB/kappa+pB*(1-pB)/nB)
# > (Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))#----
# [1] 0.800001



p1 = 0.65
p2 = 0.85
# sd1 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!
# sd2 = (1/n*p1*(1-p1))^0.5  -> also a function of n~!!  # under null?!
# sd_pooled = ( (sd1^2 + sd2^2)/2 )^0.5
pwr.p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# > pwr.p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4707048
#               n = 35.42495
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# > pwr.2p.test(h = ES.h(p1 = p1, p2 = p2), sig.level = 0.05, power = 0.8, alternative = "two.sided") #----
# 
#      Difference of proportion power calculation for binomial distribution (arcsine transformation) 
# 
#               h = 0.4707048
#               n = 70.84991
#       sig.level = 0.05
#           power = 0.8
#     alternative = two.sided
# 
# NOTE: same sample sizes


stata.out = stata("power oneproportion 0.65 0.85, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
stata.out = stata("power twoproportions 0.65 0.85, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
stata.out
# > stata.out = stata("power oneproportion 0.65 0.85, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power oneproportion 0.65 0.85, alpha(0.05) power(0.8)
# 
# Performing iteration ...
# 
# Estimated sample size for a one-sample proportion test
# Score z test
# Ho: p = p0  versus  Ha: p != p0
# 
# Study parameters:
# 
#         alpha =    0.0500
#         power =    0.8000
#         delta =    0.2000
#            p0 =    0.6500
#            pa =    0.8500
# 
# Estimated sample size:
# 
#             N =        39
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'
# > stata.out
# NULL
# > stata.out = stata("power twoproportions 0.65 0.85, alpha(0.05) power(0.8)", data.in = NULL, data.out = T, stata.version = 15.1) #----
# . power twoproportions 0.65 0.85, alpha(0.05) power(0.8)
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
#         delta =    0.2000  (difference)
#            p1 =    0.6500
#            p2 =    0.8500
# 
# Estimated sample sizes:
# 
#             N =       146
#   N per group =        73
# Error in foreign::read.dta(dtaOutFile, ...) : 
#   unable to open file: 'No such file or directory'










#####################################################################################################################
#####################################################################################################################
# http://powerandsamplesize.com/Calculators/Test-Odds-Ratio/Equality ----
pA=0.40
pB=0.25
kappa=1
alpha=0.05
beta=0.20
(OR=pA*(1-pB)/pB/(1-pA))#----
(nB=(1/(kappa*pA*(1-pA))+1/(pB*(1-pB)))*((qnorm(1-alpha/2)+qnorm(1-beta))/log(OR))^2)#----
ceiling(nB) # 156
z=log(OR)*sqrt(nB)/sqrt(1/(kappa*pA*(1-pA))+1/(pB*(1-pB)))
(Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))#----
# > (OR=pA*(1-pB)/pB/(1-pA))#----
# [1] 2
# > (nB=(1/(kappa*pA*(1-pA))+1/(pB*(1-pB)))*((qnorm(1-alpha/2)+qnorm(1-beta))/log(OR))^2)#----
# [1] 155.1959
# > ceiling(nB) # 156
# [1] 156
# > z=log(OR)*sqrt(nB)/sqrt(1/(kappa*pA*(1-pA))+1/(pB*(1-pB)))
# > (Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))#----
# [1] 0.800001




#@ end -----
