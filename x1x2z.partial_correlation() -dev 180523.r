# x1x2z.partial_correlation() -dev 180523.r


# @@ old function -----  

# @ x1x2z.partial_correlation() ==========  
x1x2z.partial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall")) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    x1.binary2numeric = function.binary2numeric(x1)
    x2.binary2numeric = function.binary2numeric(x2)
    
    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    out = map(
        seq_along(cor_method)
        , function(i) {
            unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i])
            partial_cor = cor(resid1, resid2, method = cor_method[i])
            list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
        }
    )
    names(out) = cor_method
    out = out %>% map(unlist)
    out = out |> as.data.frame() 
    out = out %>% t |> as.data.frame()
    out
}


# @ test: stackloss) x1x2z.partial_correlation() ------  
library(tidyverse)
str(stackloss)
# > str(stackloss)
# 'data.frame':	21 obs. of  4 variables:
#  $ Air.Flow  : num  80 80 75 62 62 62 62 62 58 58 ...
#  $ Water.Temp: num  27 27 25 24 22 23 24 24 23 18 ...
#  $ Acid.Conc.: num  89 88 90 87 87 87 93 93 87 80 ...
#  $ stack.loss: num  42 37 37 28 18 18 19 20 15 14 ...
x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
#          unadjusted_cor partial_cor
# pearson       0.7818523   0.7356413
# spearman      0.7330699   0.5976564
# kendall       0.5955500   0.4455219

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str()
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str()
# 'data.frame':	3 obs. of  2 variables:
#  $ unadjusted_cor: num  0.782 0.733 0.596
#  $ partial_cor   : num  0.736 0.598 0.446


# @ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation() ------  
# > tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024


# @ dissect function ----  

x1 = stackloss$Air.Flow
x2 = stackloss$Water.Temp
z = stackloss$Acid.Conc.
x1 |> str()
x2 |> str()
z |> str()
# > x1 |> str()
#  num [1:21] 80 80 75 62 62 62 62 62 58 58 ...
# > x2 |> str()
#  num [1:21] 27 27 25 24 22 23 24 24 23 18 ...
# > z |> str()
#  num [1:21] 89 88 90 87 87 87 93 93 87 80 ...
cor_method = c("pearson", "spearman", "kendall")

x1.binary2numeric = function.binary2numeric(x1)
x2.binary2numeric = function.binary2numeric(x2)
x1.binary2numeric |> str()
x2.binary2numeric |> str()
# > x1.binary2numeric |> str()
#  num [1:21] 80 80 75 62 62 62 62 62 58 58 ...
# > x2.binary2numeric |> str()
#  num [1:21] 27 27 25 24 22 23 24 24 23 18 ...

resid1 = lm(x1.binary2numeric ~ z)$residuals
resid2 = lm(x2.binary2numeric ~ z)$residuals

out = map(
    seq_along(cor_method)
    , function(i) {
        unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i])
        partial_cor = cor(resid1, resid2, method = cor_method[i])
        list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
    }
)
names(out) = cor_method
out = out %>% map(unlist)
out = out |> as.data.frame() 
out = out %>% t |> as.data.frame()
out
# > out
#          unadjusted_cor partial_cor
# pearson       0.7818523   0.7356413
# spearman      0.7330699   0.5976564
# kendall       0.5955500   0.4455219



# @@ new function 180523 =====  

x1x2z.partial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall"), p.value = F) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    x1.binary2numeric = function.binary2numeric(x1)
    x2.binary2numeric = function.binary2numeric(x2)
    
    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    if (p.value == F) {
        out = map(
            seq_along(cor_method)
            , function(i) {
                unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i])
                partial_cor = cor(resid1, resid2, method = cor_method[i])
                list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
            }
        )
    } else if (p.value == T) {
        out = map(
            seq_along(cor_method)
            , function(i) {
                unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> unlist()
                names(unadjusted_cor) = paste0("unadjusted_cor", names(unadjusted_cor))
                names(unadjusted_cor)[1] = "unadjusted_cor"
                partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> unlist()
                names(partial_cor) = paste0("partial_cor", names(partial_cor))
                names(partial_cor)[1] = "partial_cor"
                as.list(c(unadjusted_cor, partial_cor))
            }
        )
    }
    names(out) = cor_method
    out = out %>% map(unlist)
    out = out |> as.data.frame() 
    out = out %>% t |> as.data.frame()
    out
}

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T)
# Error in (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE,  : 
#   arguments imply differing number of rows: 10, 6
# In addition: Warning messages:
# 1: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 2: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 3: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 4: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#  
#  Hide Traceback
#  
#  Rerun with Debug
#  Error in (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE,  : 
#   arguments imply differing number of rows: 10, 6 
# 14.
# stop(gettextf("arguments imply differing number of rows: %s", 
#     paste(unique(nrows), collapse = ", ")), domain = NA) 
# 13.
# (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE, 
#     fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors()) 
# {
#     data.row.names <- if (check.rows && is.null(row.names))  ... 
# 12.
# do.call(data.frame, c(x, alis)) 
# 11.
# as.data.frame.list(.) 
# 10.
# as.data.frame(.) 
# 9.
# function_list[[k]](value) 
# 8.
# withVisible(function_list[[k]](value)) 
# 7.
# freduce(value, `_function_list`) 
# 6.
# `_fseq`(`_lhs`) 
# 5.
# eval(quote(`_fseq`(`_lhs`)), env, env) 
# 4.
# eval(quote(`_fseq`(`_lhs`)), env, env) 
# 3.
# withVisible(eval(quote(`_fseq`(`_lhs`)), env, env)) 
# 2.
# out |> as.data.frame() 
# 1.
# x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, 
#     z = stackloss$Acid.Conc., p.value = T) 


# ?cor.test
# @ cor.test() -----  
cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
# List of 9
#  $ statistic  : Named num 5.47
#   ..- attr(*, "names")= chr "t"
#  $ parameter  : Named int 19
#   ..- attr(*, "names")= chr "df"
#  $ p.value    : num 2.84e-05
#  $ estimate   : Named num 0.782
#   ..- attr(*, "names")= chr "cor"
#  $ null.value : Named num 0
#   ..- attr(*, "names")= chr "correlation"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Pearson's product-moment correlation"
#  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
#  $ conf.int   : atomic [1:2] 0.529 0.907
#   ..- attr(*, "conf.level")= num 0.95
#  - attr(*, "class")= chr "htest"
# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
# List of 8
#  $ statistic  : Named num 411
#   ..- attr(*, "names")= chr "S"
#  $ parameter  : NULL
#  $ p.value    : num 0.000157
#  $ estimate   : Named num 0.733
#   ..- attr(*, "names")= chr "rho"
#  $ null.value : Named num 0
#   ..- attr(*, "names")= chr "rho"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Spearman's rank correlation rho"
#  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
#  - attr(*, "class")= chr "htest"
# Warning message:
# In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
#   Cannot compute exact p-value with ties
# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
# List of 8
#  $ statistic  : Named num 3.4
#   ..- attr(*, "names")= chr "z"
#  $ parameter  : NULL
#  $ p.value    : num 0.000671
#  $ estimate   : Named num 0.596
#   ..- attr(*, "names")= chr "tau"
#  $ null.value : Named num 0
#   ..- attr(*, "names")= chr "tau"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Kendall's rank correlation tau"
#  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
#  - attr(*, "class")= chr "htest"
# Warning message:
# In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") :
#   Cannot compute exact p-value with ties

cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
# List of 4
#  $ estimate : Named num 0.733
#   ..- attr(*, "names")= chr "rho"
#  $ NA       : NULL
#  $ p.value  : num 0.000157
#  $ statistic: Named num 411
#   ..- attr(*, "names")= chr "S"
# Warning message:
# In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
#   Cannot compute exact p-value with ties


# @ dissect function ----  

x1 = stackloss$Air.Flow
x2 = stackloss$Water.Temp
z = stackloss$Acid.Conc.
x1 |> str()
x2 |> str()
z |> str()
# > x1 |> str()
#  num [1:21] 80 80 75 62 62 62 62 62 58 58 ...
# > x2 |> str()
#  num [1:21] 27 27 25 24 22 23 24 24 23 18 ...
# > z |> str()
#  num [1:21] 89 88 90 87 87 87 93 93 87 80 ...
cor_method = c("pearson", "spearman", "kendall")

x1.binary2numeric = function.binary2numeric(x1)
x2.binary2numeric = function.binary2numeric(x2)
x1.binary2numeric |> str()
x2.binary2numeric |> str()
# > x1.binary2numeric |> str()
#  num [1:21] 80 80 75 62 62 62 62 62 58 58 ...
# > x2.binary2numeric |> str()
#  num [1:21] 27 27 25 24 22 23 24 24 23 18 ...

resid1 = lm(x1.binary2numeric ~ z)$residuals
resid2 = lm(x2.binary2numeric ~ z)$residuals

# out = map(
#     seq_along(cor_method)
#     , function(i) {
#         unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i])
#         partial_cor = cor(resid1, resid2, method = cor_method[i])
#         list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
#     }
# )


out = map(
    seq_along(cor_method)
    , function(i) {
        unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> unlist()
        names(unadjusted_cor) = paste0("unadjusted_cor", names(unadjusted_cor))
        names(unadjusted_cor)[1] = "unadjusted_cor"
        partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> unlist()
        names(partial_cor) = paste0("partial_cor", names(partial_cor))
        names(partial_cor)[1] = "partial_cor"
        as.list(c(unadjusted_cor, partial_cor))
    }
)
names(out) = cor_method
out |> str()
# Warning messages:
# 1: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 2: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 3: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 4: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# > names(out) = cor_method
# > out |> str()
# List of 3
#  $ pearson :List of 10
#   ..$ unadjusted_cor           : num 0.782
#   ..$ unadjusted_corconf.int1  : num 0.529
#   ..$ unadjusted_corconf.int2  : num 0.907
#   ..$ unadjusted_corp.value    : num 2.84e-05
#   ..$ unadjusted_corstatistic.t: num 5.47
#   ..$ partial_cor              : num 0.736
#   ..$ partial_corconf.int1     : num 0.445
#   ..$ partial_corconf.int2     : num 0.886
#   ..$ partial_corp.value       : num 0.000144
#   ..$ partial_corstatistic.t   : num 4.73
#  $ spearman:List of 6
#   ..$ unadjusted_cor           : num 0.733
#   ..$ unadjusted_corp.value    : num 0.000157
#   ..$ unadjusted_corstatistic.S: num 411
#   ..$ partial_cor              : num 0.598
#   ..$ partial_corp.value       : num 0.00422
#   ..$ partial_corstatistic.S   : num 620
#  $ kendall :List of 6
#   ..$ unadjusted_cor           : num 0.596
#   ..$ unadjusted_corp.value    : num 0.000671
#   ..$ unadjusted_corstatistic.z: num 3.4
#   ..$ partial_cor              : num 0.446
#   ..$ partial_corp.value       : num 0.00531
#   ..$ partial_corstatistic.z   : num 2.79

# out = out %>% map(unlist)
# out |> str()
# # > out |> str()
# # List of 3
# #  $ pearson : Named num [1:10] 7.82e-01 5.29e-01 9.07e-01 2.84e-05 5.47 ...
# #   ..- attr(*, "names")= chr [1:10] "unadjusted_cor" "unadjusted_corconf.int1" "unadjusted_corconf.int2" "unadjusted_corp.value" ...
# #  $ spearman: Named num [1:6] 7.33e-01 1.57e-04 4.11e+02 5.98e-01 4.22e-03 ...
# #   ..- attr(*, "names")= chr [1:6] "unadjusted_cor" "unadjusted_corp.value" "unadjusted_corstatistic.S" "partial_cor" ...
# #  $ kendall : Named num [1:6] 0.59555 0.000671 3.401353 0.445522 0.005307 ...
# #   ..- attr(*, "names")= chr [1:6] "unadjusted_cor" "unadjusted_corp.value" "unadjusted_corstatistic.z" "partial_cor" ...
# out = out |> as.data.frame() 
# # > out = out |> as.data.frame()
# # Error in (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE,  : 
# #   arguments imply differing number of rows: 10, 6
# out = out %>% t |> as.data.frame()
# out
# # > out
# #          unadjusted_cor partial_cor
# # pearson       0.7818523   0.7356413
# # spearman      0.7330699   0.5976564
# # kendall       0.5955500   0.4455219


out |> str()
out %>% map(unlist) |> str()
# > out %>% map(unlist) |> str()
# List of 3
#  $ pearson : Named num [1:10] 7.82e-01 5.29e-01 9.07e-01 2.84e-05 5.47 ...
#   ..- attr(*, "names")= chr [1:10] "unadjusted_cor" "unadjusted_corconf.int1" "unadjusted_corconf.int2" "unadjusted_corp.value" ...
#  $ spearman: Named num [1:6] 7.33e-01 1.57e-04 4.11e+02 5.98e-01 4.22e-03 ...
#   ..- attr(*, "names")= chr [1:6] "unadjusted_cor" "unadjusted_corp.value" "unadjusted_corstatistic.S" "partial_cor" ...
#  $ kendall : Named num [1:6] 0.59555 0.000671 3.401353 0.445522 0.005307 ...
#   ..- attr(*, "names")= chr [1:6] "unadjusted_cor" "unadjusted_corp.value" "unadjusted_corstatistic.z" "partial_cor" ...
out %>% map(unlist) %>% enframe %>% unnest |> as.data.frame()
# > out %>% map(unlist) %>% enframe %>% unnest |> as.data.frame()
#        name        value
# 1   pearson 7.818523e-01
# 2   pearson 5.285640e-01
# 3   pearson 9.073086e-01
# 4   pearson 2.836516e-05
# 5   pearson 5.466261e+00
# 6   pearson 7.356413e-01
# 7   pearson 4.453981e-01
# 8   pearson 8.859727e-01
# 9   pearson 1.444546e-04
# 10  pearson 4.733867e+00
# 11 spearman 7.330699e-01
# 12 spearman 1.566183e-04
# 13 spearman 4.110723e+02
# 14 spearman 5.976564e-01
# 15 spearman 4.220475e-03
# 16 spearman 6.196092e+02
# 17  kendall 5.955500e-01
# 18  kendall 6.705318e-04
# 19  kendall 3.401353e+00
# 20  kendall 4.455219e-01
# 21  kendall 5.306637e-03
# 22  kendall 2.787806e+00
out |> unlist() |> str()
# > out |> unlist() |> str()
#  Named num [1:22] 7.82e-01 5.29e-01 9.07e-01 2.84e-05 5.47 ...
#  - attr(*, "names")= chr [1:22] "pearson.unadjusted_cor" "pearson.unadjusted_corconf.int1" "pearson.unadjusted_corconf.int2" "pearson.unadjusted_corp.value" ...

# ?flatten
out %>% flatten |> str()
# > out %>% flatten |> str()
# List of 22
#  $ unadjusted_cor           : num 0.782
#  $ unadjusted_corconf.int1  : num 0.529
#  $ unadjusted_corconf.int2  : num 0.907
#  $ unadjusted_corp.value    : num 2.84e-05
#  $ unadjusted_corstatistic.t: num 5.47
#  $ partial_cor              : num 0.736
#  $ partial_corconf.int1     : num 0.445
#  $ partial_corconf.int2     : num 0.886
#  $ partial_corp.value       : num 0.000144
#  $ partial_corstatistic.t   : num 4.73
#  $ unadjusted_cor           : num 0.733
#  $ unadjusted_corp.value    : num 0.000157
#  $ unadjusted_corstatistic.S: num 411
#  $ partial_cor              : num 0.598
#  $ partial_corp.value       : num 0.00422
#  $ partial_corstatistic.S   : num 620
#  $ unadjusted_cor           : num 0.596
#  $ unadjusted_corp.value    : num 0.000671
#  $ unadjusted_corstatistic.z: num 3.4
#  $ partial_cor              : num 0.446
#  $ partial_corp.value       : num 0.00531
#  $ partial_corstatistic.z   : num 2.79

out %>% flatten_dfr(.id = ".id") |> str()
# > out %>% flatten_dfr(.id = ".id") |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	1 obs. of  15 variables:
#  $ .id                      : chr "1"
#  $ unadjusted_cor           : num 0.596
#  $ unadjusted_corconf.int1  : num 0.529
#  $ unadjusted_corconf.int2  : num 0.907
#  $ unadjusted_corp.value    : num 0.000671
#  $ unadjusted_corstatistic.t: num 5.47
#  $ partial_cor              : num 0.446
#  $ partial_corconf.int1     : num 0.445
#  $ partial_corconf.int2     : num 0.886
#  $ partial_corp.value       : num 0.00531
#  $ partial_corstatistic.t   : num 4.73
#  $ unadjusted_corstatistic.S: num 411
#  $ partial_corstatistic.S   : num 620
#  $ unadjusted_corstatistic.z: num 3.4
#  $ partial_corstatistic.z   : num 2.79


out %>% map(flatten) |> str()
# > out %>% map(flatten) |> str()
# List of 3
#  $ pearson :List of 10
#   ..$ unadjusted_cor           : num 0.782
#   ..$ unadjusted_corconf.int1  : num 0.529
#   ..$ unadjusted_corconf.int2  : num 0.907
#   ..$ unadjusted_corp.value    : num 2.84e-05
#   ..$ unadjusted_corstatistic.t: num 5.47
#   ..$ partial_cor              : num 0.736
#   ..$ partial_corconf.int1     : num 0.445
#   ..$ partial_corconf.int2     : num 0.886
#   ..$ partial_corp.value       : num 0.000144
#   ..$ partial_corstatistic.t   : num 4.73
#  $ spearman:List of 6
#   ..$ unadjusted_cor           : num 0.733
#   ..$ unadjusted_corp.value    : num 0.000157
#   ..$ unadjusted_corstatistic.S: num 411
#   ..$ partial_cor              : num 0.598
#   ..$ partial_corp.value       : num 0.00422
#   ..$ partial_corstatistic.S   : num 620
#  $ kendall :List of 6
#   ..$ unadjusted_cor           : num 0.596
#   ..$ unadjusted_corp.value    : num 0.000671
#   ..$ unadjusted_corstatistic.z: num 3.4
#   ..$ partial_cor              : num 0.446
#   ..$ partial_corp.value       : num 0.00531
#   ..$ partial_corstatistic.z   : num 2.79

out %>% bind_rows |> rownames_to_column()
# > out %>% bind_rows |> rownames_to_column()
# # A tibble: 3 x 15
#   rowname unadjusted_cor unadjusted_corco~ unadjusted_corco~ unadjusted_corp.~ unadjusted_corsta~ partial_cor partial_corconf~ partial_corconf~
#   <chr>            <dbl>             <dbl>             <dbl>             <dbl>              <dbl>       <dbl>            <dbl>            <dbl>
# 1 1                0.782             0.529             0.907         0.0000284               5.47       0.736            0.445            0.886
# 2 2                0.733            NA                NA             0.000157               NA          0.598           NA               NA    
# 3 3                0.596            NA                NA             0.000671               NA          0.446           NA               NA    
# # ... with 6 more variables: partial_corp.value <dbl>, partial_corstatistic.t <dbl>, unadjusted_corstatistic.S <dbl>,
# #   partial_corstatistic.S <dbl>, unadjusted_corstatistic.z <dbl>, partial_corstatistic.z <dbl>


out %>% bind_rows |> as.data.frame() |> str()
# > out %>% bind_rows |> as.data.frame() |> str()
# 'data.frame':	3 obs. of  14 variables:
#  $ unadjusted_cor           : num  0.782 0.733 0.596
#  $ unadjusted_corconf.int1  : num  0.529 NA NA
#  $ unadjusted_corconf.int2  : num  0.907 NA NA
#  $ unadjusted_corp.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_corstatistic.t: num  5.47 NA NA
#  $ partial_cor              : num  0.736 0.598 0.446
#  $ partial_corconf.int1     : num  0.445 NA NA
#  $ partial_corconf.int2     : num  0.886 NA NA
#  $ partial_corp.value       : num  0.000144 0.00422 0.005307
#  $ partial_corstatistic.t   : num  4.73 NA NA
#  $ unadjusted_corstatistic.S: num  NA 411 NA
#  $ partial_corstatistic.S   : num  NA 620 NA
#  $ unadjusted_corstatistic.z: num  NA NA 3.4
#  $ partial_corstatistic.z   : num  NA NA 2.79



out %>% bind_rows |> as.data.frame() %>% select(starts_with("unadjusted"), starts_with("partial")) |> str()
# > out %>% bind_rows |> as.data.frame() %>% select(starts_with("unadjusted"), starts_with("partial")) |> str()
# 'data.frame':	3 obs. of  14 variables:
#  $ unadjusted_cor           : num  0.782 0.733 0.596
#  $ unadjusted_corconf.int1  : num  0.529 NA NA
#  $ unadjusted_corconf.int2  : num  0.907 NA NA
#  $ unadjusted_corp.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_corstatistic.t: num  5.47 NA NA
#  $ unadjusted_corstatistic.S: num  NA 411 NA
#  $ unadjusted_corstatistic.z: num  NA NA 3.4
#  $ partial_cor              : num  0.736 0.598 0.446
#  $ partial_corconf.int1     : num  0.445 NA NA
#  $ partial_corconf.int2     : num  0.886 NA NA
#  $ partial_corp.value       : num  0.000144 0.00422 0.005307
#  $ partial_corstatistic.t   : num  4.73 NA NA
#  $ partial_corstatistic.S   : num  NA 620 NA
#  $ partial_corstatistic.z   : num  NA NA 2.79

cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} %>% {.$conf.int}

cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()


tmp2 = cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} 
tmp2$NA
# > tmp2$NA
# Error: unexpected numeric constant in "tmp$NA"
tmp2$`NA`
# > tmp2$`NA`
# NULL

# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
# List of 8
#  $ statistic  : Named num 411
#   ..- attr(*, "names")= chr "S"
#  $ parameter  : NULL
#  $ p.value    : num 0.000157
#  $ estimate   : Named num 0.733
#   ..- attr(*, "names")= chr "rho"
#  $ null.value : Named num 0
#   ..- attr(*, "names")= chr "rho"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Spearman's rank correlation rho"
#  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
#  - attr(*, "class")= chr "htest"
# Warning message:
# In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
#   Cannot compute exact p-value with ties



cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} %>% compact |> str()
# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} %>% compact |> str()
# List of 3
#  $ estimate : Named num 0.733
#   ..- attr(*, "names")= chr "rho"
#  $ p.value  : num 0.000157
#  $ statistic: Named num 411
#   ..- attr(*, "names")= chr "S"
# Warning message:
# In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
#   Cannot compute exact p-value with ties

cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% confint
# > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% confint
# Error in UseMethod("vcov") : 
#   no applicable method for 'vcov' applied to an object of class "htest"
# In addition: Warning message:
# In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
#   Cannot compute exact p-value with ties

lm(stackloss$Air.Flow ~ stackloss$Water.Temp) |> str()
# > lm(stackloss$Air.Flow ~ stackloss$Water.Temp) |> str()
# List of 12
#  $ coefficients : Named num [1:2] 12.59 2.27
#   ..- attr(*, "names")= chr [1:2] "(Intercept)" "stackloss$Water.Temp"
#  $ residuals    : Named num [1:21] 6.18 6.18 5.72 -5.02 -0.48 ...
#   ..- attr(*, "names")= chr [1:21] "1" "2" "3" "4" ...
#  $ effects      : Named num [1:21] -276.92 -32.06 3.85 -6.62 -1.55 ...
#   ..- attr(*, "names")= chr [1:21] "(Intercept)" "stackloss$Water.Temp" "" "" ...
#  $ rank         : int 2
#  $ fitted.values: Named num [1:21] 73.8 73.8 69.3 67 62.5 ...
#   ..- attr(*, "names")= chr [1:21] "1" "2" "3" "4" ...
#  $ assign       : int [1:2] 0 1
#  $ qr           :List of 5
#   ..$ qr   : num [1:21, 1:2] -4.583 0.218 0.218 0.218 0.218 ...
#   .. ..- attr(*, "dimnames")=List of 2
#   .. .. ..$ : chr [1:21] "1" "2" "3" "4" ...
#   .. .. ..$ : chr [1:2] "(Intercept)" "stackloss$Water.Temp"
#   .. ..- attr(*, "assign")= int [1:2] 0 1
#   ..$ qraux: num [1:2] 1.22 1.34
#   ..$ pivot: int [1:2] 1 2
#   ..$ tol  : num 1e-07
#   ..$ rank : int 2
#   ..- attr(*, "class")= chr "qr"
#  $ df.residual  : int 19
#  $ xlevels      : Named list()
#  $ call         : language lm(formula = stackloss$Air.Flow ~ stackloss$Water.Temp)
#  $ terms        :Classes 'terms', 'formula'  language stackloss$Air.Flow ~ stackloss$Water.Temp
#   .. ..- attr(*, "variables")= language list(stackloss$Air.Flow, stackloss$Water.Temp)
#   .. ..- attr(*, "factors")= int [1:2, 1] 0 1
#   .. .. ..- attr(*, "dimnames")=List of 2
#   .. .. .. ..$ : chr [1:2] "stackloss$Air.Flow" "stackloss$Water.Temp"
#   .. .. .. ..$ : chr "stackloss$Water.Temp"
#   .. ..- attr(*, "term.labels")= chr "stackloss$Water.Temp"
#   .. ..- attr(*, "order")= int 1
#   .. ..- attr(*, "intercept")= int 1
#   .. ..- attr(*, "response")= int 1
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   .. ..- attr(*, "predvars")= language list(stackloss$Air.Flow, stackloss$Water.Temp)
#   .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
#   .. .. ..- attr(*, "names")= chr [1:2] "stackloss$Air.Flow" "stackloss$Water.Temp"
#  $ model        :'data.frame':	21 obs. of  2 variables:
#   ..$ stackloss$Air.Flow  : num [1:21] 80 80 75 62 62 62 62 62 58 58 ...
#   ..$ stackloss$Water.Temp: num [1:21] 27 27 25 24 22 23 24 24 23 18 ...
#   ..- attr(*, "terms")=Classes 'terms', 'formula'  language stackloss$Air.Flow ~ stackloss$Water.Temp
#   .. .. ..- attr(*, "variables")= language list(stackloss$Air.Flow, stackloss$Water.Temp)
#   .. .. ..- attr(*, "factors")= int [1:2, 1] 0 1
#   .. .. .. ..- attr(*, "dimnames")=List of 2
#   .. .. .. .. ..$ : chr [1:2] "stackloss$Air.Flow" "stackloss$Water.Temp"
#   .. .. .. .. ..$ : chr "stackloss$Water.Temp"
#   .. .. ..- attr(*, "term.labels")= chr "stackloss$Water.Temp"
#   .. .. ..- attr(*, "order")= int 1
#   .. .. ..- attr(*, "intercept")= int 1
#   .. .. ..- attr(*, "response")= int 1
#   .. .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   .. .. ..- attr(*, "predvars")= language list(stackloss$Air.Flow, stackloss$Water.Temp)
#   .. .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
#   .. .. .. ..- attr(*, "names")= chr [1:2] "stackloss$Air.Flow" "stackloss$Water.Temp"
#  - attr(*, "class")= chr "lm"

lm(stackloss$Air.Flow ~ stackloss$Water.Temp) %>% confint
# > lm(stackloss$Air.Flow ~ stackloss$Water.Temp) %>% confint
#                          2.5 %   97.5 %
# (Intercept)          -5.925957 31.10041
# stackloss$Water.Temp  1.399508  3.13624

lm(stackloss$Air.Flow ~ stackloss$Water.Temp) %>% confint |> str()
# > lm(stackloss$Air.Flow ~ stackloss$Water.Temp) %>% confint |> str()
#  num [1:2, 1:2] -5.93 1.4 31.1 3.14
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:2] "(Intercept)" "stackloss$Water.Temp"
#   ..$ : chr [1:2] "2.5 %" "97.5 %"

lm(stackloss$Air.Flow ~ stackloss$Water.Temp) |> summary()
# > lm(stackloss$Air.Flow ~ stackloss$Water.Temp) |> summary()
# 
# Call:
# lm(formula = stackloss$Air.Flow ~ stackloss$Water.Temp)
# 
# Residuals:
#    Min     1Q Median     3Q    Max 
# -7.945 -5.016 -1.945  4.591 12.055 
# 
# Coefficients:
#                      Estimate Std. Error t value Pr(>|t|)    
# (Intercept)           12.5872     8.8452   1.423    0.171    
# stackloss$Water.Temp   2.2679     0.4149   5.466 2.84e-05 ***
# ---
# Signif. codes:  0 ¡®***¡¯ 0.001 ¡®**¡¯ 0.01 ¡®*¡¯ 0.05 ¡®.¡¯ 0.1 ¡® ¡¯ 1
# 
# Residual standard error: 5.865 on 19 degrees of freedom
# Multiple R-squared:  0.6113,	Adjusted R-squared:  0.5908 
# F-statistic: 29.88 on 1 and 19 DF,  p-value: 2.837e-05

glm(stackloss$Air.Flow ~ stackloss$Water.Temp) %>% confint |> str()
# > glm(stackloss$Air.Flow ~ stackloss$Water.Temp) %>% confint |> str()
# Waiting for profiling to be done...
#  num [1:2, 1:2] -4.75 1.45 29.92 3.08
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:2] "(Intercept)" "stackloss$Water.Temp"
#   ..$ : chr [1:2] "2.5 %" "97.5 %"


glm(stackloss$Air.Flow ~ stackloss$Water.Temp) |> summary()


glm((stackloss$Air.Flow/abs(stackloss$Air.Flow) + 1)/2 ~ stackloss$Water.Temp, family = binomial) |> summary()
# > glm((stackloss$Air.Flow/abs(stackloss$Air.Flow) + 1)/2 ~ stackloss$Water.Temp, family = binomial) |> summary()
# 
# Call:
# glm(formula = (stackloss$Air.Flow/abs(stackloss$Air.Flow) + 1)/2 ~ 
#     stackloss$Water.Temp, family = binomial)
# 
# Deviance Residuals: 
#       Min         1Q     Median         3Q        Max  
# 3.971e-06  3.971e-06  3.971e-06  3.971e-06  3.971e-06  
# 
# Coefficients:
#                        Estimate Std. Error z value Pr(>|z|)
# (Intercept)           2.557e+01  3.258e+05       0        1
# stackloss$Water.Temp -3.081e-07  1.528e+04       0        1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
#     Null deviance: 0.0000e+00  on 20  degrees of freedom
# Residual deviance: 3.3117e-10  on 19  degrees of freedom
# AIC: 4
# 
# Number of Fisher Scoring iterations: 24



# @@ new function 180523 v2 -----  
out = map(
    seq_along(cor_method)
    , function(i) {
        #@ cf) output from cor.test() ----
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
        # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # # List of 9
        # #  $ statistic  : Named num 5.47
        # #   ..- attr(*, "names")= chr "t"
        # #  $ parameter  : Named int 19
        # #   ..- attr(*, "names")= chr "df"
        # #  $ p.value    : num 2.84e-05
        # #  $ estimate   : Named num 0.782
        # #   ..- attr(*, "names")= chr "cor"
        # #  $ null.value : Named num 0
        # #   ..- attr(*, "names")= chr "correlation"
        # #  $ alternative: chr "two.sided"
        # #  $ method     : chr "Pearson's product-moment correlation"
        # #  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
        # #  $ conf.int   : atomic [1:2] 0.529 0.907
        # #   ..- attr(*, "conf.level")= num 0.95
        # #  - attr(*, "class")= chr "htest"
        #@ caution) attr(statistic, "names") = "t" if method == "pearson", "S" (CAPITAL) if method == "spearman", "z" if method == "kendall"
        #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        #@ caution) $conf.int has a vector of length 2.
        #@ caution) When cor_method == "spearman" | "kendall", cor.test() may produce NA for conf.int & produce warning message as follows:
        # # Warning message:
        # # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        # #   Cannot compute exact p-value with ties
        #@ caution)  %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} may make $`NA` when there is no $conf.int
        # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
        # List of 4
        #  $ estimate : Named num 0.733
        #   ..- attr(*, "names")= chr "rho"
        #  $ NA       : NULL
        #  $ p.value  : num 0.000157
        #  $ statistic: Named num 411
        #   ..- attr(*, "names")= chr "S"
        # Warning message:
        # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        #   Cannot compute exact p-value with ties
        unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(unadjusted_cor$conf.int)) unadjusted_cor$conf.int = unadjusted_cor$conf.int %>% setNames(c("LL", "UL"))
        names(unadjusted_cor) = paste0("unadjusted_cor.", names(unadjusted_cor))  # caution) autio
        names(unadjusted_cor)[1] = "unadjusted_cor"
        partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        names(partial_cor) = paste0("partial_cor.", names(partial_cor))
        names(partial_cor)[1] = "partial_cor"
        c(unadjusted_cor, partial_cor)  # concategate two lists
    }
) %>% setNames(cor_method)

out$pearson$unadjusted_cor.conf.int
out$pearson$unadjusted_cor.conf.int |> str()
# > out$pearson$unadjusted_cor.conf.int
#        LL        UL 
# 0.5285640 0.9073086 
# attr(,"conf.level")
# [1] 0.95
# > out$pearson$unadjusted_cor.conf.int |> str()
#  atomic [1:2] 0.529 0.907
#  - attr(*, "conf.level")= num 0.95

out$pearson$unadjusted_cor.conf.int %>% setNames(c("LL", "UL"))
out$pearson$unadjusted_cor.conf.int %>% setNames(c("LL", "UL")) |> str()
# > out$pearson$unadjusted_cor.conf.int %>% setNames(c("LL", "UL"))
#        LL        UL 
# 0.5285640 0.9073086 
# attr(,"conf.level")
# [1] 0.95
# > out$pearson$unadjusted_cor.conf.int %>% setNames(c("LL", "UL")) |> str()
#  atomic [1:2] 0.529 0.907
#  - attr(*, "conf.level")= num 0.95

out$pearson$unadjusted_cor.conf.int |> as.vector() %>% setNames(c("LL", "UL"))
out$pearson$unadjusted_cor.conf.int |> as.vector() %>% setNames(c("LL", "UL")) |> str()
# > out$pearson$unadjusted_cor.conf.int |> as.vector() %>% setNames(c("LL", "UL"))
#        LL        UL 
# 0.5285640 0.9073086 
# > out$pearson$unadjusted_cor.conf.int |> as.vector() %>% setNames(c("LL", "UL")) |> str()
#  Named num [1:2] 0.529 0.907
#  - attr(*, "names")= chr [1:2] "LL" "UL"
out |> str()
# > out |> str()
# List of 3
#  $ pearson :List of 8
#   ..$ unadjusted_cor          : Named num 0.782
#   .. ..- attr(*, "names")= chr "cor"
#   ..$ unadjusted_cor.conf.int : atomic [1:2] 0.529 0.907
#   .. ..- attr(*, "conf.level")= num 0.95
#   ..$ unadjusted_cor.p.value  : num 2.84e-05
#   ..$ unadjusted_cor.statistic: Named num 5.47
#   .. ..- attr(*, "names")= chr "t"
#   ..$ partial_cor             : Named num 0.736
#   .. ..- attr(*, "names")= chr "cor"
#   ..$ partial_cor.conf.int    : atomic [1:2] 0.445 0.886
#   .. ..- attr(*, "conf.level")= num 0.95
#   ..$ partial_cor.p.value     : num 0.000144
#   ..$ partial_cor.statistic   : Named num 4.73
#   .. ..- attr(*, "names")= chr "t"
#  $ spearman:List of 8
#   ..$ unadjusted_cor          : Named num 0.733
#   .. ..- attr(*, "names")= chr "rho"
#   ..$ unadjusted_cor.NA       : NULL
#   ..$ unadjusted_cor.p.value  : num 0.000157
#   ..$ unadjusted_cor.statistic: Named num 411
#   .. ..- attr(*, "names")= chr "S"
#   ..$ partial_cor             : Named num 0.598
#   .. ..- attr(*, "names")= chr "rho"
#   ..$ partial_cor.NA          : NULL
#   ..$ partial_cor.p.value     : num 0.00422
#   ..$ partial_cor.statistic   : Named num 620
#   .. ..- attr(*, "names")= chr "S"
#  $ kendall :List of 8
#   ..$ unadjusted_cor          : Named num 0.596
#   .. ..- attr(*, "names")= chr "tau"
#   ..$ unadjusted_cor.NA       : NULL
#   ..$ unadjusted_cor.p.value  : num 0.000671
#   ..$ unadjusted_cor.statistic: Named num 3.4
#   .. ..- attr(*, "names")= chr "z"
#   ..$ partial_cor             : Named num 0.446
#   .. ..- attr(*, "names")= chr "tau"
#   ..$ partial_cor.NA          : NULL
#   ..$ partial_cor.p.value     : num 0.00531
#   ..$ partial_cor.statistic   : Named num 2.79
#   .. ..- attr(*, "names")= chr "z"


cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(estimate, conf.int, p.value, statistic) |> str() 
# > cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(estimate, conf.int, p.value, statistic) |> str()
# Error in dots_splice(...) : object 'estimate' not found
# In addition: Warning message:
# In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = "kendall") :
#   Cannot compute exact p-value with ties

cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(c("estimate", "conf.int", "p.value", "statistic")) |> str() 
# > cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(c("estimate", "conf.int", "p.value", "statistic")) |> str()
# Error: Index 1 must have length 1
# In addition: Warning message:
# In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = "kendall") :
#   Cannot compute exact p-value with ties

cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(("estimate", "conf.int", "p.value", "statistic")) |> str()
# > cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(("estimate", "conf.int", "p.value", "statistic")) |> str()
# Error: unexpected ',' in "cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck(("estimate","

cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck("estimate", "conf.int", "p.value", "statistic") |> str() 
# > cor.test(x1.binary2numeric, x2.binary2numeric, method = "kendall") %>% pluck("estimate", "conf.int", "p.value", "statistic") |> str()
#  NULL
# Warning message:
# In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = "kendall") :
#   Cannot compute exact p-value with ties

out$spearman |> str()



out |> unlist() |> str()
# > out |> unlist() |> str()
#  Named num [1:22] 7.82e-01 5.29e-01 9.07e-01 2.84e-05 5.47 ...
#  - attr(*, "names")= chr [1:22] "pearson.unadjusted_cor.cor" "pearson.unadjusted_cor.conf.int1" "pearson.unadjusted_cor.conf.int2" "pearson.unadjusted_cor.p.value" ...

out |> unlist() |> as.data.frame()
# > out |> unlist() |> as.data.frame()
#                                                .
# pearson.unadjusted_cor.cor          7.818523e-01
# pearson.unadjusted_cor.conf.int1    5.285640e-01
# pearson.unadjusted_cor.conf.int2    9.073086e-01
# pearson.unadjusted_cor.p.value      2.836516e-05
# pearson.unadjusted_cor.statistic.t  5.466261e+00
# pearson.partial_cor.cor             7.356413e-01
# pearson.partial_cor.conf.int1       4.453981e-01
# pearson.partial_cor.conf.int2       8.859727e-01
# pearson.partial_cor.p.value         1.444546e-04
# pearson.partial_cor.statistic.t     4.733867e+00
# spearman.unadjusted_cor.rho         7.330699e-01
# spearman.unadjusted_cor.p.value     1.566183e-04
# spearman.unadjusted_cor.statistic.S 4.110723e+02
# spearman.partial_cor.rho            5.976564e-01
# spearman.partial_cor.p.value        4.220475e-03
# spearman.partial_cor.statistic.S    6.196092e+02
# kendall.unadjusted_cor.tau          5.955500e-01
# kendall.unadjusted_cor.p.value      6.705318e-04
# kendall.unadjusted_cor.statistic.z  3.401353e+00
# kendall.partial_cor.tau             4.455219e-01
# kendall.partial_cor.p.value         5.306637e-03
# kendall.partial_cor.statistic.z     2.787806e+00





out %>% bind_rows
# > out %>% bind_rows
# Error in bind_rows_(x, .id) : Argument 2 must be length 1, not 2
out %>% bind_rows(.id = ".id")
# > out %>% bind_rows(.id = ".id")
# Error in bind_rows_(x, .id) : Argument 2 must be length 1, not 2

out %>% map(unname) |> str()
# > out %>% map(unname) |> str()
# List of 3
#  $ pearson :List of 8
#   ..$ : Named num 0.782
#   .. ..- attr(*, "names")= chr "cor"
#   ..$ : atomic [1:2] 0.529 0.907
#   .. ..- attr(*, "conf.level")= num 0.95
#   ..$ : num 2.84e-05
#   ..$ : Named num 5.47
#   .. ..- attr(*, "names")= chr "t"
#   ..$ : Named num 0.736
#   .. ..- attr(*, "names")= chr "cor"
#   ..$ : atomic [1:2] 0.445 0.886
#   .. ..- attr(*, "conf.level")= num 0.95
#   ..$ : num 0.000144
#   ..$ : Named num 4.73
#   .. ..- attr(*, "names")= chr "t"
#  $ spearman:List of 8
#   ..$ : Named num 0.733
#   .. ..- attr(*, "names")= chr "rho"
#   ..$ : NULL
#   ..$ : num 0.000157
#   ..$ : Named num 411
#   .. ..- attr(*, "names")= chr "S"
#   ..$ : Named num 0.598
#   .. ..- attr(*, "names")= chr "rho"
#   ..$ : NULL
#   ..$ : num 0.00422
#   ..$ : Named num 620
#   .. ..- attr(*, "names")= chr "S"
#  $ kendall :List of 8
#   ..$ : Named num 0.596
#   .. ..- attr(*, "names")= chr "tau"
#   ..$ : NULL
#   ..$ : num 0.000671
#   ..$ : Named num 3.4
#   .. ..- attr(*, "names")= chr "z"
#   ..$ : Named num 0.446
#   .. ..- attr(*, "names")= chr "tau"
#   ..$ : NULL
#   ..$ : num 0.00531
#   ..$ : Named num 2.79
#   .. ..- attr(*, "names")= chr "z"

out %>% map(function(ls) ls %>% map(unname)) |> str()



# > out %>% bind_rows |> as.data.frame() |> str()
# 'data.frame':	3 obs. of  14 variables:
#  $ unadjusted_cor           : num  0.782 0.733 0.596
#  $ unadjusted_corconf.int1  : num  0.529 NA NA
#  $ unadjusted_corconf.int2  : num  0.907 NA NA
#  $ unadjusted_corp.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_corstatistic.t: num  5.47 NA NA
#  $ partial_cor              : num  0.736 0.598 0.446
#  $ partial_corconf.int1     : num  0.445 NA NA
#  $ partial_corconf.int2     : num  0.886 NA NA
#  $ partial_corp.value       : num  0.000144 0.00422 0.005307
#  $ partial_corstatistic.t   : num  4.73 NA NA
#  $ unadjusted_corstatistic.S: num  NA 411 NA
#  $ partial_corstatistic.S   : num  NA 620 NA
#  $ unadjusted_corstatistic.z: num  NA NA 3.4
#  $ partial_corstatistic.z   : num  NA NA 2.79









# @@ new function 180523 v3 -----  
out = map(
    seq_along(cor_method)
    , function(i) {
        #@ cf) output from cor.test() ----
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
        # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # # List of 9
        # #  $ statistic  : Named num 5.47
        # #   ..- attr(*, "names")= chr "t"
        # #  $ parameter  : Named int 19
        # #   ..- attr(*, "names")= chr "df"
        # #  $ p.value    : num 2.84e-05
        # #  $ estimate   : Named num 0.782
        # #   ..- attr(*, "names")= chr "cor"
        # #  $ null.value : Named num 0
        # #   ..- attr(*, "names")= chr "correlation"
        # #  $ alternative: chr "two.sided"
        # #  $ method     : chr "Pearson's product-moment correlation"
        # #  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
        # #  $ conf.int   : atomic [1:2] 0.529 0.907
        # #   ..- attr(*, "conf.level")= num 0.95
        # #  - attr(*, "class")= chr "htest"
        #@ caution) attr(statistic, "names") = "t" if method == "pearson", "S" (CAPITAL) if method == "spearman", "z" if method == "kendall"
        #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        #@ caution) $conf.int has a vector of length 2.
        #@ caution) When cor_method == "spearman" | "kendall", cor.test() may produce NA for conf.int & produce warning message as follows:
        # # Warning message:
        # # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        # #   Cannot compute exact p-value with ties
        #@ caution)  %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} may make $`NA` when there is no $conf.int
        # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
        # List of 4
        #  $ estimate : Named num 0.733
        #   ..- attr(*, "names")= chr "rho"
        #  $ NA       : NULL
        #  $ p.value  : num 0.000157
        #  $ statistic: Named num 411
        #   ..- attr(*, "names")= chr "S"
        # Warning message:
        # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        #   Cannot compute exact p-value with ties
        unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} %>% compact  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        names(unadjusted_cor) = paste0("unadjusted_cor.", names(unadjusted_cor))  # caution) autio
        names(unadjusted_cor)[1] = "unadjusted_cor"
        partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} %>% compact  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        names(partial_cor) = paste0("partial_cor.", names(partial_cor))
        names(partial_cor)[1] = "partial_cor"
        c(unadjusted_cor, partial_cor)  # concategate two lists
    }
) %>% setNames(cor_method)
out |> str()




out %>% bind_rows |> as.data.frame() %>% select(starts_with("unadjusted"), starts_with("partial")) |> str()




# @@ new function 180523 v4 -----  
out = map(
    seq_along(cor_method)
    , function(i) {
        #@ cf) output from cor.test() ----
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
        # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # # List of 9
        # #  $ statistic  : Named num 5.47
        # #   ..- attr(*, "names")= chr "t"
        # #  $ parameter  : Named int 19
        # #   ..- attr(*, "names")= chr "df"
        # #  $ p.value    : num 2.84e-05
        # #  $ estimate   : Named num 0.782
        # #   ..- attr(*, "names")= chr "cor"
        # #  $ null.value : Named num 0
        # #   ..- attr(*, "names")= chr "correlation"
        # #  $ alternative: chr "two.sided"
        # #  $ method     : chr "Pearson's product-moment correlation"
        # #  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
        # #  $ conf.int   : atomic [1:2] 0.529 0.907
        # #   ..- attr(*, "conf.level")= num 0.95
        # #  - attr(*, "class")= chr "htest"
        #@ caution) attr(statistic, "names") = "t" if method == "pearson", "S" (CAPITAL) if method == "spearman", "z" if method == "kendall"
        #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        #@ caution) $conf.int has a vector of length 2.
        #@ caution) When cor_method == "spearman" | "kendall", cor.test() may produce NA for conf.int & produce warning message as follows:
        # # Warning message:
        # # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        # #   Cannot compute exact p-value with ties
        #@ caution)  %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} may make $`NA` when there is no $conf.int
        # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
        # List of 4
        #  $ estimate : Named num 0.733
        #   ..- attr(*, "names")= chr "rho"
        #  $ NA       : NULL
        #  $ p.value  : num 0.000157
        #  $ statistic: Named num 411
        #   ..- attr(*, "names")= chr "S"
        # Warning message:
        # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        #   Cannot compute exact p-value with ties
        unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(unadjusted_cor$conf.int)) unadjusted_cor$conf.int = unadjusted_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
        names(unadjusted_cor) = paste0("unadjusted_cor.", names(unadjusted_cor)) 
        names(unadjusted_cor)[1] = "unadjusted_cor"
        partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(partial_cor$conf.int)) partial_cor$conf.int = partial_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
        names(partial_cor) = paste0("partial_cor.", names(partial_cor))
        names(partial_cor)[1] = "partial_cor"
        c(unadjusted_cor, partial_cor)  # concategate two lists
    }
) %>% setNames(cor_method)

out$pearson$unadjusted_cor.conf.int
out$pearson$unadjusted_cor.conf.int |> str()
# > out$pearson$unadjusted_cor.conf.int
#        LL        UL 
# 0.5285640 0.9073086 
# > out$pearson$unadjusted_cor.conf.int |> str()
#  Named num [1:2] 0.529 0.907
#  - attr(*, "names")= chr [1:2] "LL" "UL"

out |> str()
# > out |> str() -----  
# List of 3
#  $ pearson :List of 8
#   ..$ unadjusted_cor          : Named num 0.782
#   .. ..- attr(*, "names")= chr "cor"
#   ..$ unadjusted_cor.conf.int : Named num [1:2] 0.529 0.907
#   .. ..- attr(*, "names")= chr [1:2] "LL" "UL"
#   ..$ unadjusted_cor.p.value  : num 2.84e-05
#   ..$ unadjusted_cor.statistic: Named num 5.47
#   .. ..- attr(*, "names")= chr "t"
#   ..$ partial_cor             : Named num 0.736
#   .. ..- attr(*, "names")= chr "cor"
#   ..$ partial_cor.conf.int    : Named num [1:2] 0.445 0.886
#   .. ..- attr(*, "names")= chr [1:2] "LL" "UL"
#   ..$ partial_cor.p.value     : num 0.000144
#   ..$ partial_cor.statistic   : Named num 4.73
#   .. ..- attr(*, "names")= chr "t"
#  $ spearman:List of 8
#   ..$ unadjusted_cor          : Named num 0.733
#   .. ..- attr(*, "names")= chr "rho"
#   ..$ unadjusted_cor.NA       : NULL
#   ..$ unadjusted_cor.p.value  : num 0.000157
#   ..$ unadjusted_cor.statistic: Named num 411
#   .. ..- attr(*, "names")= chr "S"
#   ..$ partial_cor             : Named num 0.598
#   .. ..- attr(*, "names")= chr "rho"
#   ..$ partial_cor.NA          : NULL
#   ..$ partial_cor.p.value     : num 0.00422
#   ..$ partial_cor.statistic   : Named num 620
#   .. ..- attr(*, "names")= chr "S"
#  $ kendall :List of 8
#   ..$ unadjusted_cor          : Named num 0.596
#   .. ..- attr(*, "names")= chr "tau"
#   ..$ unadjusted_cor.NA       : NULL
#   ..$ unadjusted_cor.p.value  : num 0.000671
#   ..$ unadjusted_cor.statistic: Named num 3.4
#   .. ..- attr(*, "names")= chr "z"
#   ..$ partial_cor             : Named num 0.446
#   .. ..- attr(*, "names")= chr "tau"
#   ..$ partial_cor.NA          : NULL
#   ..$ partial_cor.p.value     : num 0.00531
#   ..$ partial_cor.statistic   : Named num 2.79
#   .. ..- attr(*, "names")= chr "z"

out |> unlist() |> as.data.frame()
# > out |> unlist() |> as.data.frame() ----  
#                                                .
# pearson.unadjusted_cor.cor          7.818523e-01
# pearson.unadjusted_cor.conf.int.LL  5.285640e-01
# pearson.unadjusted_cor.conf.int.UL  9.073086e-01
# pearson.unadjusted_cor.p.value      2.836516e-05
# pearson.unadjusted_cor.statistic.t  5.466261e+00
# pearson.partial_cor.cor             7.356413e-01
# pearson.partial_cor.conf.int.LL     4.453981e-01
# pearson.partial_cor.conf.int.UL     8.859727e-01
# pearson.partial_cor.p.value         1.444546e-04
# pearson.partial_cor.statistic.t     4.733867e+00
# spearman.unadjusted_cor.rho         7.330699e-01
# spearman.unadjusted_cor.p.value     1.566183e-04
# spearman.unadjusted_cor.statistic.S 4.110723e+02
# spearman.partial_cor.rho            5.976564e-01
# spearman.partial_cor.p.value        4.220475e-03
# spearman.partial_cor.statistic.S    6.196092e+02
# kendall.unadjusted_cor.tau          5.955500e-01
# kendall.unadjusted_cor.p.value      6.705318e-04
# kendall.unadjusted_cor.statistic.z  3.401353e+00
# kendall.partial_cor.tau             4.455219e-01
# kendall.partial_cor.p.value         5.306637e-03
# kendall.partial_cor.statistic.z     2.787806e+00


out %>% map(unlist) %>% map(as.data.frame)
# > out %>% map(unlist) %>% map(as.data.frame) ----  
# $pearson
#                                 .x[[i]]
# unadjusted_cor.cor         7.818523e-01
# unadjusted_cor.conf.int.LL 5.285640e-01
# unadjusted_cor.conf.int.UL 9.073086e-01
# unadjusted_cor.p.value     2.836516e-05
# unadjusted_cor.statistic.t 5.466261e+00
# partial_cor.cor            7.356413e-01
# partial_cor.conf.int.LL    4.453981e-01
# partial_cor.conf.int.UL    8.859727e-01
# partial_cor.p.value        1.444546e-04
# partial_cor.statistic.t    4.733867e+00
# 
# $spearman
#                                 .x[[i]]
# unadjusted_cor.rho         7.330699e-01
# unadjusted_cor.p.value     1.566183e-04
# unadjusted_cor.statistic.S 4.110723e+02
# partial_cor.rho            5.976564e-01
# partial_cor.p.value        4.220475e-03
# partial_cor.statistic.S    6.196092e+02
# 
# $kendall
#                                 .x[[i]]
# unadjusted_cor.tau         0.5955500004
# unadjusted_cor.p.value     0.0006705318
# unadjusted_cor.statistic.z 3.4013529855
# partial_cor.tau            0.4455218871
# partial_cor.p.value        0.0053066369
# partial_cor.statistic.z    2.7878056469


out %>% map(unlist) %>% map(as_tibble) %>% map(rownames_to_column) %>% bind_rows(.id = "method")
# > out %>% map(unlist) %>% map(as_tibble) %>% map(rownames_to_column) %>% bind_rows(.id = "method") -----  
# # A tibble: 22 x 3
#    method  rowname                        value
#    <chr>   <chr>                          <dbl>
#  1 pearson unadjusted_cor.cor         0.782    
#  2 pearson unadjusted_cor.conf.int.LL 0.529    
#  3 pearson unadjusted_cor.conf.int.UL 0.907    
#  4 pearson unadjusted_cor.p.value     0.0000284
#  5 pearson unadjusted_cor.statistic.t 5.47     
#  6 pearson partial_cor.cor            0.736    
#  7 pearson partial_cor.conf.int.LL    0.445    
#  8 pearson partial_cor.conf.int.UL    0.886    
#  9 pearson partial_cor.p.value        0.000144 
# 10 pearson partial_cor.statistic.t    4.73     
# # ... with 12 more rows


out %>% map(unlist) %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") |> str()
# > out %>% map(unlist) %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	3 obs. of  19 variables:
#  $ method                    : chr  "pearson" "spearman" "kendall"
#  $ unadjusted_cor.cor        : num  0.782 NA NA
#  $ unadjusted_cor.conf.int.LL: num  0.529 NA NA
#  $ unadjusted_cor.conf.int.UL: num  0.907 NA NA
#  $ unadjusted_cor.p.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_cor.statistic.t: num  5.47 NA NA
#  $ partial_cor.cor           : num  0.736 NA NA
#  $ partial_cor.conf.int.LL   : num  0.445 NA NA
#  $ partial_cor.conf.int.UL   : num  0.886 NA NA
#  $ partial_cor.p.value       : num  0.000144 0.00422 0.005307
#  $ partial_cor.statistic.t   : num  4.73 NA NA
#  $ unadjusted_cor.rho        : num  NA 0.733 NA
#  $ unadjusted_cor.statistic.S: num  NA 411 NA
#  $ partial_cor.rho           : num  NA 0.598 NA
#  $ partial_cor.statistic.S   : num  NA 620 NA
#  $ unadjusted_cor.tau        : num  NA NA 0.596
#  $ unadjusted_cor.statistic.z: num  NA NA 3.4
#  $ partial_cor.tau           : num  NA NA 0.446
#  $ partial_cor.statistic.z   : num  NA NA 2.79






# @@ new function 180523 v5 -----  
out = map(
    seq_along(cor_method)
    , function(i) {
        #@ cf) output from cor.test() ----
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
        # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
        # # List of 9
        # #  $ statistic  : Named num 5.47
        # #   ..- attr(*, "names")= chr "t"
        # #  $ parameter  : Named int 19
        # #   ..- attr(*, "names")= chr "df"
        # #  $ p.value    : num 2.84e-05
        # #  $ estimate   : Named num 0.782
        # #   ..- attr(*, "names")= chr "cor"
        # #  $ null.value : Named num 0
        # #   ..- attr(*, "names")= chr "correlation"
        # #  $ alternative: chr "two.sided"
        # #  $ method     : chr "Pearson's product-moment correlation"
        # #  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
        # #  $ conf.int   : atomic [1:2] 0.529 0.907
        # #   ..- attr(*, "conf.level")= num 0.95
        # #  - attr(*, "class")= chr "htest"
        #@ caution) attr(statistic, "names") = "t" if method == "pearson", "S" (CAPITAL) if method == "spearman", "z" if method == "kendall"
        #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        #@ caution) $conf.int has a vector of length 2.
        #@ caution) When cor_method == "spearman" | "kendall", cor.test() may produce NA for conf.int & produce warning message as follows:
        # # Warning message:
        # # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        # #   Cannot compute exact p-value with ties
        #@ caution)  %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} may make $`NA` when there is no $conf.int
        # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
        # List of 4
        #  $ estimate : Named num 0.733
        #   ..- attr(*, "names")= chr "rho"
        #  $ NA       : NULL
        #  $ p.value  : num 0.000157
        #  $ statistic: Named num 411
        #   ..- attr(*, "names")= chr "S"
        # Warning message:
        # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
        #   Cannot compute exact p-value with ties
        unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(unadjusted_cor$conf.int)) unadjusted_cor$conf.int = unadjusted_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
        names(unadjusted_cor) = paste0("unadjusted_cor.", names(unadjusted_cor))
        unadjusted_cor = unadjusted_cor |> unlist()  #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        names(unadjusted_cor)[1] = "unadjusted_cor"
        partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(partial_cor$conf.int)) partial_cor$conf.int = partial_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
        partial_cor = partial_cor |> unlist()  #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        names(partial_cor) = paste0("partial_cor.", names(partial_cor))
        names(partial_cor)[1] = "partial_cor"
        c(unadjusted_cor, partial_cor)  # concategate two lists
    }
) %>% setNames(cor_method)

out$pearson$unadjusted_cor.conf.int
out$pearson$unadjusted_cor.conf.int |> str()
# > out$pearson$unadjusted_cor.conf.int
#        LL        UL 
# 0.5285640 0.9073086 
# > out$pearson$unadjusted_cor.conf.int |> str()
#  Named num [1:2] 0.529 0.907
#  - attr(*, "names")= chr [1:2] "LL" "UL"

out |> str()

out %>% map(as_tibble)

out %>% map(t) 
# > out %>% map(t)
# $pearson
#      unadjusted_cor unadjusted_cor.conf.int.LL unadjusted_cor.conf.int.UL unadjusted_cor.p.value unadjusted_cor.statistic.t partial_cor partial_cor.conf.int.LL partial_cor.conf.int.UL partial_cor.p.value
# [1,]      0.7818523                   0.528564                  0.9073086           2.836516e-05                   5.466261   0.7356413               0.4453981               0.8859727        0.0001444546
#      partial_cor.statistic.t
# [1,]                4.733867
# 
# $spearman
#      unadjusted_cor unadjusted_cor.p.value unadjusted_cor.statistic.S partial_cor partial_cor.p.value partial_cor.statistic.S
# [1,]      0.7330699           0.0001566183                   411.0723   0.5976564         0.004220475                619.6092
# 
# $kendall
#      unadjusted_cor unadjusted_cor.p.value unadjusted_cor.statistic.z partial_cor partial_cor.p.value partial_cor.statistic.z
# [1,]        0.59555           0.0006705318                   3.401353   0.4455219         0.005306637                2.787806

out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = ".id") |> rownames_to_column() |> str()
# > out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = ".id") |> rownames_to_column() |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	3 obs. of  16 variables:
#  $ rowname                   : chr  "1" "2" "3"
#  $ .id                       : chr  "pearson" "spearman" "kendall"
#  $ unadjusted_cor            : num  0.782 0.733 0.596
#  $ unadjusted_cor.conf.int.LL: num  0.529 NA NA
#  $ unadjusted_cor.conf.int.UL: num  0.907 NA NA
#  $ unadjusted_cor.p.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_cor.statistic.t: num  5.47 NA NA
#  $ partial_cor               : num  0.736 0.598 0.446
#  $ partial_cor.conf.int.LL   : num  0.445 NA NA
#  $ partial_cor.conf.int.UL   : num  0.886 NA NA
#  $ partial_cor.p.value       : num  0.000144 0.00422 0.005307
#  $ partial_cor.statistic.t   : num  4.73 NA NA
#  $ unadjusted_cor.statistic.S: num  NA 411 NA
#  $ partial_cor.statistic.S   : num  NA 620 NA
#  $ unadjusted_cor.statistic.z: num  NA NA 3.4
#  $ partial_cor.statistic.z   : num  NA NA 2.79


out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") |> str()
# > out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	3 obs. of  15 variables:
#  $ method                    : chr  "pearson" "spearman" "kendall"
#  $ unadjusted_cor            : num  0.782 0.733 0.596
#  $ unadjusted_cor.conf.int.LL: num  0.529 NA NA
#  $ unadjusted_cor.conf.int.UL: num  0.907 NA NA
#  $ unadjusted_cor.p.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_cor.statistic.t: num  5.47 NA NA
#  $ partial_cor               : num  0.736 0.598 0.446
#  $ partial_cor.conf.int.LL   : num  0.445 NA NA
#  $ partial_cor.conf.int.UL   : num  0.886 NA NA
#  $ partial_cor.p.value       : num  0.000144 0.00422 0.005307
#  $ partial_cor.statistic.t   : num  4.73 NA NA
#  $ unadjusted_cor.statistic.S: num  NA 411 NA
#  $ partial_cor.statistic.S   : num  NA 620 NA
#  $ unadjusted_cor.statistic.z: num  NA NA 3.4
#  $ partial_cor.statistic.z   : num  NA NA 2.79

out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") %>% select(method, starts_with("unadjusted_cor"), starts_with("partial_cor")) |> str()
# > out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") %>% select(method, starts_with("unadjusted_cor"), starts_with("partial_cor")) |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	3 obs. of  15 variables:
#  $ method                    : chr  "pearson" "spearman" "kendall"
#  $ unadjusted_cor            : num  0.782 0.733 0.596
#  $ unadjusted_cor.conf.int.LL: num  0.529 NA NA
#  $ unadjusted_cor.conf.int.UL: num  0.907 NA NA
#  $ unadjusted_cor.p.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_cor.statistic.t: num  5.47 NA NA
#  $ unadjusted_cor.statistic.S: num  NA 411 NA
#  $ unadjusted_cor.statistic.z: num  NA NA 3.4
#  $ partial_cor               : num  0.736 0.598 0.446
#  $ partial_cor.conf.int.LL   : num  0.445 NA NA
#  $ partial_cor.conf.int.UL   : num  0.886 NA NA
#  $ partial_cor.p.value       : num  0.000144 0.00422 0.005307
#  $ partial_cor.statistic.t   : num  4.73 NA NA
#  $ partial_cor.statistic.S   : num  NA 620 NA
#  $ partial_cor.statistic.z   : num  NA NA 2.79



# @ x1x2z.partial_correlation() revision 180523 v5 ==========  
x1x2z.partial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall"), p.value = F) {  # revision 180523 v5
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    x1.binary2numeric = function.binary2numeric(x1)
    x2.binary2numeric = function.binary2numeric(x2)
    
    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    if (p.value == F) {
        out = map(
            seq_along(cor_method)
            , function(i) {
                unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i])
                partial_cor = cor(resid1, resid2, method = cor_method[i])
                list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor) |> unlist()
            }
        ) %>% setNames(cor_method)
    } else if (p.value == T) {
        out = map(
            seq_along(cor_method)
            , function(i) {
                #@ cf) output from cor.test() ----
                # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
                # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str()
                # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str()
                # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str()
                # # List of 9
                # #  $ statistic  : Named num 5.47
                # #   ..- attr(*, "names")= chr "t"
                # #  $ parameter  : Named int 19
                # #   ..- attr(*, "names")= chr "df"
                # #  $ p.value    : num 2.84e-05
                # #  $ estimate   : Named num 0.782
                # #   ..- attr(*, "names")= chr "cor"
                # #  $ null.value : Named num 0
                # #   ..- attr(*, "names")= chr "correlation"
                # #  $ alternative: chr "two.sided"
                # #  $ method     : chr "Pearson's product-moment correlation"
                # #  $ data.name  : chr "stackloss$Air.Flow and stackloss$Water.Temp"
                # #  $ conf.int   : atomic [1:2] 0.529 0.907
                # #   ..- attr(*, "conf.level")= num 0.95
                # #  - attr(*, "class")= chr "htest"
                #@ caution) attr(statistic, "names") = "t" if method == "pearson", "S" (CAPITAL) if method == "spearman", "z" if method == "kendall"
                #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
                #@ caution) $conf.int has a vector of length 2.
                #@ caution) When cor_method == "spearman" | "kendall", cor.test() may produce NA for conf.int & produce warning message as follows:
                # # Warning message:
                # # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
                # #   Cannot compute exact p-value with ties
                #@ caution)  %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} may make $`NA` when there is no $conf.int
                # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str()
                # List of 4
                #  $ estimate : Named num 0.733
                #   ..- attr(*, "names")= chr "rho"
                #  $ NA       : NULL
                #  $ p.value  : num 0.000157
                #  $ statistic: Named num 411
                #   ..- attr(*, "names")= chr "S"
                # Warning message:
                # In cor.test.default(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") :
                #   Cannot compute exact p-value with ties
                unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
                if (!is.null(unadjusted_cor$conf.int)) unadjusted_cor$conf.int = unadjusted_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
                names(unadjusted_cor) = paste0("unadjusted_cor.", names(unadjusted_cor))
                unadjusted_cor = unadjusted_cor |> unlist()  #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
                names(unadjusted_cor)[1] = "unadjusted_cor"
                partial_cor = cor.test(resid1, resid2, method = cor_method[i]) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
                if (!is.null(partial_cor$conf.int)) partial_cor$conf.int = partial_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
                partial_cor = partial_cor |> unlist()  #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
                names(partial_cor) = paste0("partial_cor.", names(partial_cor))
                names(partial_cor)[1] = "partial_cor"
                c(unadjusted_cor, partial_cor)  # concategate two named vectors (unlist)
            }
        ) %>% setNames(cor_method)
    }
    
    out %>% map(t) %>% map(as_tibble) %>% bind_rows(.id = "method") %>% select(method, starts_with("unadjusted_cor"), starts_with("partial_cor"))
}


# @ test: stackloss) x1x2z.partial_correlation() ------  
library(tidyverse)
str(stackloss)
# > str(stackloss)
# 'data.frame':	21 obs. of  4 variables:
#  $ Air.Flow  : num  80 80 75 62 62 62 62 62 58 58 ...
#  $ Water.Temp: num  27 27 25 24 22 23 24 24 23 18 ...
#  $ Acid.Conc.: num  89 88 90 87 87 87 93 93 87 80 ...
#  $ stack.loss: num  42 37 37 28 18 18 19 20 15 14 ...

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # A tibble: 3 x 3
#   method   unadjusted_cor partial_cor
#   <chr>             <dbl>       <dbl>
# 1 pearson           0.782       0.736
# 2 spearman          0.733       0.598
# 3 kendall           0.596       0.446

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str()
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	3 obs. of  3 variables:
#  $ method        : chr  "pearson" "spearman" "kendall"
#  $ unadjusted_cor: num  0.782 0.733 0.596
#  $ partial_cor   : num  0.736 0.598 0.446

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # A tibble: 3 x 15
#   method  unadjusted_cor unadjusted_cor.c~ unadjusted_cor.c~ unadjusted_cor.p~ unadjusted_cor.~ unadjusted_cor.~ unadjusted_cor.~ partial_cor partial_cor.con~
#   <chr>            <dbl>             <dbl>             <dbl>             <dbl>            <dbl>            <dbl>            <dbl>       <dbl>            <dbl>
# 1 pearson          0.782             0.529             0.907         0.0000284             5.47              NA             NA          0.736            0.445
# 2 spearm~          0.733            NA                NA             0.000157             NA                411.            NA          0.598           NA    
# 3 kendall          0.596            NA                NA             0.000671             NA                 NA              3.40       0.446           NA    
# # ... with 5 more variables: partial_cor.conf.int.UL <dbl>, partial_cor.p.value <dbl>, partial_cor.statistic.t <dbl>, partial_cor.statistic.S <dbl>,
# #   partial_cor.statistic.z <dbl>
# Warning messages:
# 1: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 2: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 3: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 4: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T) |> str()
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	3 obs. of  15 variables:
#  $ method                    : chr  "pearson" "spearman" "kendall"
#  $ unadjusted_cor            : num  0.782 0.733 0.596
#  $ unadjusted_cor.conf.int.LL: num  0.529 NA NA
#  $ unadjusted_cor.conf.int.UL: num  0.907 NA NA
#  $ unadjusted_cor.p.value    : num  2.84e-05 1.57e-04 6.71e-04
#  $ unadjusted_cor.statistic.t: num  5.47 NA NA
#  $ unadjusted_cor.statistic.S: num  NA 411 NA
#  $ unadjusted_cor.statistic.z: num  NA NA 3.4
#  $ partial_cor               : num  0.736 0.598 0.446
#  $ partial_cor.conf.int.LL   : num  0.445 NA NA
#  $ partial_cor.conf.int.UL   : num  0.886 NA NA
#  $ partial_cor.p.value       : num  0.000144 0.00422 0.005307
#  $ partial_cor.statistic.t   : num  4.73 NA NA
#  $ partial_cor.statistic.S   : num  NA 620 NA
#  $ partial_cor.statistic.z   : num  NA NA 2.79
# Warning messages:
# 1: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 2: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 3: In cor.test.default(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) :
#   Cannot compute exact p-value with ties
# 4: In cor.test.default(resid1, resid2, method = cor_method[i]) :
#   Cannot compute exact p-value with ties


# @ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation() ------  
# > tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024





# @ end ----  


