# x1x2z.patial_correlation.source.r
# 170704
# source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")

array3d_R_C_strata2df = function(array3d_R_C_strata) {
  library(tidyverse)
  x1x2z.df = array3d_R_C_strata %>% as.table %>% as.data.frame

  index = map(1:nrow(x1x2z.df), function(i) rep(i, x1x2z.df[i,4])) %>% unlist
  out = x1x2z.df[index, ]
  # out = out %>% map_df(as.numeric)
  out
}

x1x2z.patial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall")) {
  # source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")
  library(tidyverse)
  resid1 = lm(x1 ~ z)$residuals
  resid2 = lm(x2 ~ z)$residuals
  out = map(x
    seq_along(cor_method)
    , function(i) {
      unadjusted_cor = cor(x1, x2, method = cor_method[i])
      partial_cor = cor(resid1, resid2, method = cor_method[i])
      list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
    }
    )
  names(out) = cor_method
  out = out %>% map(unlist)
  out = out %>% as.data.frame 
  out = out %>% t %>% as.data.frame
  out
}

              

x1x2z.partial_correlation_dbl = function(x1, x2, z, cor_method = "pearson") {
  # source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")
  library(tidyverse)
  resid1 = lm(x1 ~ z)$residuals
  resid2 = lm(x2 ~ z)$residuals

  unadjusted_cor = cor(x1, x2, method = cor_method)
  partial_cor = cor(resid1, resid2, method = cor_method)
  out = list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
  names(out) = paste0(names(out), "_", cor_method)
  out = unlist(out)
  out
}              
  
              
              
#@ test) array3d_R_C_strata2df() --------
# > array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3))) %>% as.tibble()
# # A tibble: 78 x 4
#      Var1   Var2   Var3  Freq
#  * <fctr> <fctr> <fctr> <int>
#  1      A      A      A     1
#  2      B      A      A     2
#  3      B      A      A     2
#  4      A      B      A     3
#  5      A      B      A     3
#  6      A      B      A     3
#  7      B      B      A     4
#  8      B      B      A     4
#  9      B      B      A     4
# 10      B      B      A     4
# # ... with 68 more rows

#@ test) x1x2z.partial_correlation() ------
# > tmp.df.numeric = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3))) %>% map_df(as.numeric)
# > x1x2z.partial_correlation(x1 = tmp.df.numeric[[1]], x2 = tmp.df.numeric[[2]], z = tmp.df.numeric[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01615193
# spearman     -0.0120125  0.16380120
# kendall      -0.0120125  0.14719397


#@ test: stackloss) x1x2z.partial_correlation() ------
# > str(stackloss)
# 'data.frame':	21 obs. of  4 variables:
#  $ Air.Flow  : num  80 80 75 62 62 62 62 62 58 58 ...
#  $ Water.Temp: num  27 27 25 24 22 23 24 24 23 18 ...
#  $ Acid.Conc.: num  89 88 90 87 87 87 93 93 87 80 ...
#  $ stack.loss: num  42 37 37 28 18 18 19 20 15 14 ...

# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
#          unadjusted_cor partial_cor
# pearson       0.7818523   0.7356413
# spearman      0.7330699   0.5976564
# kendall       0.5955500   0.4455219

              
 
#@ test) x1x2z.partial_correlation_dbl() ------
# > tmp.df.numeric = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3))) %>% map_df(as.numeric)
# > x1x2z.partial_correlation_dbl(x1 = tmp.df.numeric[[1]], x2 = tmp.df.numeric[[2]], z = tmp.df.numeric[[3]])
# unadjusted_cor_pearson    partial_cor_pearson 
#            -0.01201250            -0.01615193              
              
#@ test: stackloss) x1x2z.partial_correlation_dbl() ------
# > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# unadjusted_cor_pearson    partial_cor_pearson 
#              0.7818523              0.7356413 
              
              
              
