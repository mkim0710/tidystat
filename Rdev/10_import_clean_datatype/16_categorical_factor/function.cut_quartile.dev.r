# function.cut_quartile.dev.r




# 0:10 %>% cut(4) |> dput() #-----  
# 0:10 %>% cut(4, include.lowest = T) |> dput() #-----  
# 0:10 %>% cut(4, include.lowest = T, right = T) |> dput() #-----  
# 0:10 %>% cut(4, include.lowest = T, right = F) |> dput() #-----  
# 0:10 %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) |> dput() #-----  
# # > 0:10 %>% cut(4) |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("(-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# # > 0:10 %>% cut(4, include.lowest = T) |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# # > 0:10 %>% cut(4, include.lowest = T, right = T) |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# # > 0:10 %>% cut(4, include.lowest = T, right = F) |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5)", "[2.5,5)", "[5,7.5)", "[7.5,10]"), class = "factor")
# # > 0:10 %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10.01]"), class = c("ordered", "factor"))
# 
# 
# 
# 0:10 %>% quantile(probs = 1:4/4) |> dput() #-----  
# # > 0:10 %>% quantile(probs = 1:4/4) |> dput() #-----  
# # c(`25%` = 2.5, `50%` = 5, `75%` = 7.5, `100%` = 10)
# 
# 
# 0:10 %>% {cut(., breaks = quantile(., probs = 1:4/4))} |> dput() #-----  
# 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} |> dput() #-----  
# 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} |> dput() #-----  
# 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} |> dput() #-----  
# # > 0:10 %>% {cut(., breaks = quantile(., probs = 1:4/4))} |> dput() #-----  
# # structure(c(NA, NA, NA, 1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L), .Label = c("(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# # > 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} |> dput() #-----  
# # structure(c(NA, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("(0,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# # > 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[0,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# # > 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} |> dput() #-----  
# # structure(c(1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L), .Label = c("[0,2.5)", "[2.5,5)", "[5,7.5)", "[7.5,10]"), class = "factor")





c(0:10, rep(10,5)) %>% cut(4) |> dput() #-----
c(0:10, rep(10,5)) %>% cut(4, include.lowest = T) |> dput() #-----
c(0:10, rep(10,5)) %>% cut(4, include.lowest = T, right = T) |> dput() #-----
c(0:10, rep(10,5)) %>% cut(4, include.lowest = T, right = F) |> dput() #-----
c(0:10, rep(10,5)) %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) |> dput() #-----
# > 0:10 %>% cut(4) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("(-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = T) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = F) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5)", "[2.5,5)", "[5,7.5)", "[7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10.01]"), class = c("ordered", "factor"))



c(0:10, rep(10,5)) %>% quantile(probs = 1:4/4) |> dput() #-----
# > c(0:10, rep(10,5)) %>% quantile(probs = 1:4/4) |> dput() #-----  
# c(`25%` = 3.75, `50%` = 7.5, `75%` = 10, `100%` = 10)


c(0:10, rep(10,5)) %>% {cut(., breaks = quantile(., probs = 1:4/4))} |> dput() #-----
c(0:10, rep(10,5)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} |> dput() #-----
c(0:10, rep(10,5)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} |> dput() #-----
c(0:10, rep(10,5)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} |> dput() #-----
# > c(0:10, rep(10,5)) %>% {cut(., breaks = quantile(., probs = 1:4/4))} |> dput() #-----  
# Error in cut.default(., breaks = quantile(., probs = 1:4/4)) : 
#   'breaks' are not unique
# > c(0:10, rep(10,5)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} |> dput() #-----  
# Error in cut.default(., breaks = c(0, quantile(., probs = 1:4/4))) : 
#   'breaks' are not unique
# > c(0:10, rep(10,5)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} |> dput() #-----  
# Error in cut.default(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T) : 
#   'breaks' are not unique
# > c(0:10, rep(10,5)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} |> dput() #-----  
# Error in cut.default(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T,  : 
#   'breaks' are not unique






c(0:10, rep(10,3)) %>% cut(4) |> dput() #-----
c(0:10, rep(10,3)) %>% cut(4, include.lowest = T) |> dput() #-----
c(0:10, rep(10,3)) %>% cut(4, include.lowest = T, right = T) |> dput() #-----
c(0:10, rep(10,3)) %>% cut(4, include.lowest = T, right = F) |> dput() #-----
c(0:10, rep(10,3)) %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) |> dput() #-----
# > 0:10 %>% cut(4) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("(-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = T) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = F) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5)", "[2.5,5)", "[5,7.5)", "[7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) |> dput() #-----  
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10.01]"), class = c("ordered", "factor"))



c(0:10, rep(10,3)) %>% quantile(probs = 1:4/4) |> dput() #-----
# > c(0:10, rep(10,3)) %>% quantile(probs = 1:4/4) |> dput() #-----  
# c(`25%` = 3.25, `50%` = 6.5, `75%` = 9.75, `100%` = 10)


c(0:10, rep(10,3)) %>% {cut(., breaks = quantile(., probs = 1:4/4))} |> dput() #-----
c(0:10, rep(10,3)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} |> dput() #-----
c(0:10, rep(10,3)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} |> dput() #-----
c(0:10, rep(10,3)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} |> dput() #-----
# > c(0:10, rep(10,3)) %>% {cut(., breaks = quantile(., probs = 1:4/4))} |> dput() #-----  
# structure(c(NA, NA, NA, NA, 1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L, 3L), .Label = c("(3.25,6.5]", "(6.5,9.75]", "(9.75,10]"), class = "factor")
# > c(0:10, rep(10,3)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} |> dput() #-----  
# structure(c(NA, 1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L, 4L), .Label = c("(0,3.25]", "(3.25,6.5]", "(6.5,9.75]", "(9.75,10]"), class = "factor")
# > c(0:10, rep(10,3)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} |> dput() #-----  
# structure(c(1L, 1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L, 4L), .Label = c("[0,3.25]", "(3.25,6.5]", "(6.5,9.75]", "(9.75,10]"), class = "factor")
# > c(0:10, rep(10,3)) %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} |> dput() #-----  
# structure(c(1L, 1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L, 4L), .Label = c("[0,3.25)", "[3.25,6.5)", "[6.5,9.75)", "[9.75,10]"), class = "factor")







# #@ https://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html =====  
# 
# One of the nine quantile algorithms discussed in Hyndman and Fan (1996), selected by type, is employed.
# All sample quantiles are defined as weighted averages of consecutive order statistics. Sample quantiles of type i are defined by:
# Q[i](p) = (1 - γ) x[j] + γ x[j+1],
# where 1 ≤ i ≤ 9, (j-m)/n ≤ p < (j-m+1)/n, x[j] is the jth order statistic, n is the sample size, the value of γ is a function of j = floor(np + m) and g = np + m - j, and m is a constant determined by the sample quantile type.
# 
# 
# Discontinuous sample quantile types 1, 2, and 3
# For types 1, 2 and 3, Q[i](p) is a discontinuous function of p, with m = 0 when i = 1 and i = 2, and m = -1/2 when i = 3.
# 
# Type 1
# Inverse of empirical distribution function. γ = 0 if g = 0, and 1 otherwise.
# 
# Type 2
# Similar to type 1 but with averaging at discontinuities. γ = 0.5 if g = 0, and 1 otherwise.
# 
# Type 3
# SAS definition: nearest even order statistic. γ = 0 if g = 0 and j is even, and 1 otherwise.
# 
# 
# Continuous sample quantile types 4 through 9
# For types 4 through 9, Q[i](p) is a continuous function of p, with gamma = g and m given below. The sample quantiles can be obtained equivalently by linear interpolation between the points (p[k],x[k]) where x[k] is the kth order statistic. Specific expressions for p[k] are given below.
# 
# Type 4
# m = 0. p[k] = k / n. That is, linear interpolation of the empirical cdf.
# 
# Type 5
# m = 1/2. p[k] = (k - 0.5) / n. That is a piecewise linear function where the knots are the values midway through the steps of the empirical cdf. This is popular amongst hydrologists.
# 
# Type 6
# m = p. p[k] = k / (n + 1). Thus p[k] = E[F(x[k])]. This is used by Minitab and by SPSS.
# 
# Type 7
# m = 1-p. p[k] = (k - 1) / (n - 1). In this case, p[k] = mode[F(x[k])]. This is used by S.
# 
# Type 8
# m = (p+1)/3. p[k] = (k - 1/3) / (n + 1/3). Then p[k] =~ median[F(x[k])]. The resulting quantile estimates are approximately median-unbiased regardless of the distribution of x.
# 
# Type 9
# m = p/4 + 3/8. p[k] = (k - 3/8) / (n + 1/4). The resulting quantile estimates are approximately unbiased for the expected order statistics if x is normally distributed.
# 
# Further details are provided in Hyndman and Fan (1996) who recommended type 8. The default method is type 7, as used by S and by R < 2.0.0.
# 
# Author(s)
# of the version used in R >= 2.0.0, Ivan Frohne and Rob J Hyndman.
# 
# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.
# Hyndman, R. J. and Fan, Y. (1996) Sample quantiles in statistical packages, American Statistician 50, 361–365. doi: 10.2307/2684934.














#@ end -----  


