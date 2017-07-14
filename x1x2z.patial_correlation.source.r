# x1x2z.patial_correlation.source.r
# 170704
# source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")



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

#@ test ------
# > str(stackloss)
# 'data.frame':	21 obs. of  4 variables:
#  $ Air.Flow  : num  80 80 75 62 62 62 62 62 58 58 ...
#  $ Water.Temp: num  27 27 25 24 22 23 24 24 23 18 ...
#  $ Acid.Conc.: num  89 88 90 87 87 87 93 93 87 80 ...
#  $ stack.loss: num  42 37 37 28 18 18 19 20 15 14 ...

# > x1x2z.partial_correlation(
# +   x1 = stackloss$Air.Flow
# +   , x2 = stackloss$Water.Temp
# +   , z = stackloss$Acid.Conc.)
#          unadjusted_cor partial_cor
# pearson       0.7818523   0.7356413
# spearman      0.7330699   0.5976564
# kendall       0.5955500   0.4455219
