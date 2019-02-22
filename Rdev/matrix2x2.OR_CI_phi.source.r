matrix2x2.phi = function(matrix2x2) {
    # library(tidyverse)
    if(length(matrix2x2) == 4) {
        n00 = matrix2x2[1,1]
        n01 = matrix2x2[1,2]
        n10 = matrix2x2[2,1]
        n11 = matrix2x2[2,2]
        phi = (n11 * n00 - n10 * n01) / { (n10+n11)*(n00+n01)*(n00+n10)*(n01+n11) } ^.5
    } else {
        print("error: not matrix2x2")
    }
    phi
}

# matrix2x2.cor = function(matrix2x2) {
#   library(tidyverse)
#   if(length(matrix2x2) == 4) {
#     out = list()
#     tmp.df = matrix2x2 %>% as.table %>% as.data.frame
#     tmp.df2 = tmp.df[unlist(map(1:nrow(tmp.df), function(i) rep(i, tmp.df$Freq[i]))), ] %>% map_df(as.numeric)
#     out$pearson = cor(tmp.df2$Var1, tmp.df2$Var2, method = "pearson")
#     out$kendall = cor(tmp.df2$Var1, tmp.df2$Var2, method = "kendall")
#     out$spearman = cor(tmp.df2$Var1, tmp.df2$Var2, method = "spearman")
#   } else {
#     print("error: not matrix2x2")
#   }
#   out
# }

matrix2x2.OR_CI_phi = function(matrix2x2) {
    # source("https://github.com/mkim0710/tidystat/raw/master/matrix2x2.OR_CI_phi.source.r")
    # version 170630
    # library(tidyverse)
    out = list()
    if(length(matrix2x2) == 4) {
        OR = matrix2x2[1,1] * matrix2x2[2,2] / matrix2x2[1,2] / matrix2x2[2,1]
        SE_ln_OR = sqrt(1/matrix2x2[1,1] + 1/matrix2x2[1,2] + 1/matrix2x2[2,1] + 1/matrix2x2[2,2])
        out$OR = OR
        out$OR_LowerLimit = exp( log(OR) - 1.96 * SE_ln_OR )
        out$OR_UpperLimit = exp( log(OR) + 1.96 * SE_ln_OR )
        
        out$phi = matrix2x2.phi(matrix2x2)
        
    } else {
        print("error: not matrix2x2")
    }
    out %>% as.tibble
}


#@ test --------
# > matrix2x2.OR_CI_phi(matrix(1:4, nrow = 2))
# # A tibble: 1 x 4
#          OR OR_LowerLimit OR_UpperLimit         phi
#       <dbl>         <dbl>         <dbl>       <dbl>
# 1 0.6666667    0.03938062      11.28587 -0.08908708
# > matrix2x2.OR_CI_phi(matrix(c(1, 1, 1, 1), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit   phi
#   <dbl>         <dbl>         <dbl> <dbl>
# 1     1    0.01984109      50.40044     0
# > matrix2x2.OR_CI_phi(matrix(c(1, 2, 1, 2), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit   phi
#   <dbl>         <dbl>         <dbl> <dbl>
# 1     1    0.03354661      29.80927     0
# > matrix2x2.OR_CI_phi(matrix(c(9, 9, 9, 9), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit   phi
#   <dbl>         <dbl>         <dbl> <dbl>
# 1     1      0.270721       3.69384     0
# > matrix2x2.OR_CI_phi(matrix(c(2, 1, 1, 2), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit       phi
#   <dbl>         <dbl>         <dbl>     <dbl>
# 1     4     0.1341864      119.2371 0.3333333
# > matrix2x2.OR_CI_phi(matrix(c(1, 1, 1, 4), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit   phi
#   <dbl>         <dbl>         <dbl> <dbl>
# 1     4     0.1168171      136.9663   0.3
# > matrix2x2.OR_CI_phi(matrix(c(3, 1, 1, 3), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit   phi
#   <dbl>         <dbl>         <dbl> <dbl>
# 1     9     0.3666154        220.94   0.5
# > matrix2x2.OR_CI_phi(matrix(c(1, 1, 1, 9), nrow = 2))
# # A tibble: 1 x 4
#      OR OR_LowerLimit OR_UpperLimit   phi
#   <dbl>         <dbl>         <dbl> <dbl>
# 1     9     0.2836851      285.5279   0.4

