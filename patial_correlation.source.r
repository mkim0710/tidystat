# patial_correlation.source.r
# 170704
# source("https://github.com/mkim0710/tidystat/raw/master/patial_correlation.source.r")



patial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall")) {
  library(tidyverse)
  resid1 = lm(x1 ~ z)$residuals
  resid2 = lm(x2 ~ z)$residuals
  out = map(
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


