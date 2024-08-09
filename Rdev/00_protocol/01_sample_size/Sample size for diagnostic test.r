# Sample size for diagnostic test.r
# 2014 JBI) Sample size estimation in diagnostic test studies of biomedical informatics.pdf
# https://www.ncbi.nlm.nih.gov/pubmed/24582925

# Sensitivity = TP/(TP+FN)
# Specificity = TN/(TN+FP)
# PPV = TP/(TP+FP)
# # NPV = TN/(TN+FN)
# # LRp = TP/(TP+FN) / FP*(FP+TN)
# # LRn = FN/(TP+FN) / TN*(FP+TN)

# nCase = TP+FP
# nCtrl = FN+FP
# Prevalence = (TP+FP)/(TP+FP+FN+TN) = nCase/(nCase+nCtrl)






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


qnorm(1-alpha/2)
qnorm(1-alpha/2)^2
# > qnorm(1-alpha/2)
# [1] 1.959964
# > qnorm(1-alpha/2)^2
# [1] 3.841459

( qnorm(1-alpha/2) + qnorm(1-beta) )
( qnorm(1-alpha/2) + qnorm(1-beta) )^2
# > ( qnorm(1-alpha/2) + qnorm(1-beta) )
# [1] 2.801585
# > ( qnorm(1-alpha/2) + qnorm(1-beta) )^2
# [1] 7.84888








#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# 2014 JBI) Sample size estimation in diagnostic test studies of biomedical informatics.pdf
# https://www.ncbi.nlm.nih.gov/pubmed/24582925

# @@@ Sample size for adequate sensitivity & specificity =====  
alpha=0.05
beta=0.20
p = 0.8
Prevalence = 0.1
p0 = p + 0.07

({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2  })#----
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / Prevalence })# Sample size for adequate sensitivity =====
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / (1-Prevalence) })# Sample size for adequate specificity =====
# > ({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----  
# [1] 256.29
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2  })#----  
# [1] 125.4354
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / Prevalence })# Sample size for adequate sensitivity =====  
# [1] 1254.354
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / (1-Prevalence) })# Sample size for adequate specificity =====  
# [1] 139.3727




# @@@ Sample size for adequate sensitivity & specificity =====  
alpha=0.05
beta=0.20
p = 0.8
Prevalence = 0.1
p0 = p + 0.1

({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2  })#----
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / Prevalence })# Sample size for adequate sensitivity =====
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / (1-Prevalence) })# Sample size for adequate specificity =====
# > ({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----  
# [1] 125.5821
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2  })#----  
# [1] 61.46334
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / Prevalence })# Sample size for adequate sensitivity =====  
# [1] 614.6334
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / (1-Prevalence) })# Sample size for adequate specificity =====  
# [1] 68.2926



# @@@ Sample size for adequate sensitivity & specificity =====  
alpha=0.05
beta=0.20
p = 0.7
Prevalence = 0.1
p0 = p + 0.1

({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2  })#----
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / Prevalence })# Sample size for adequate sensitivity =====
({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / (1-Prevalence) })# Sample size for adequate specificity =====
# > ({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----  
# [1] 164.8265
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2  })#----  
# [1] 80.67064
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / Prevalence })# Sample size for adequate sensitivity =====  
# [1] 806.7064
# > ({  n = p * (1-p) * ( qnorm(1-alpha/2) / (p-p0) )^2 / (1-Prevalence) })# Sample size for adequate specificity =====  
# [1] 89.63404








#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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
({  n = p * (1-p) * ( ( qnorm(1-alpha/2) + qnorm(1-beta) ) / (p-p0) )^2  })#----
# > (n=p*(1-p)*((qnorm(1-alpha/2)+qnorm(1-beta))/(p-p0))^2)#----  
# [1] 49.0555
# > ceiling(n) # 50
# [1] 50
# > z=(p-p0)/sqrt(p*(1-p)/n)
# > (Power=pnorm(z-qnorm(1-alpha/2))+pnorm(-z-qnorm(1-alpha/2)))
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







