#@ x1x2z.partial_correlation_dbl() -dev 180523.r  


## @ old x1x2z.partial_correlation_dbl() ==========  
x1x2z.partial_correlation_dbl = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    if (convert_binary2numeric == T) {
        x1.binary2numeric = function.binary2numeric(x1)
        x2.binary2numeric = function.binary2numeric(x2)
    } else if (length(levels(x1)) > 2) {
        stop("error - length(levels(x1)) > 2")
    } else if (length(levels(x2)) > 2) {
        stop("error - length(levels(x2)) > 2")
    } else {
        x1.binary2numeric = (x1)
        x2.binary2numeric = (x2)
    }

    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method)
    partial_cor = cor(resid1, resid2, method = cor_method)
    out = list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
    names(out) = paste0(names(out), "_", cor_method)
    out = unlist(out)
    out
}

## @ test: stackloss) x1x2z.partial_correlation_dbl() ------  
x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# unadjusted_cor_pearson    partial_cor_pearson
#              0.7818523              0.7356413

## @ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation_dbl() ------  
tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T)
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#  Show Traceback
#
#  Rerun with Debug
#  Error in cor(x1.binary2numeric, x2.binary2numeric, method = cor_method) :
#   'x' must be numeric In addition: Warning messages:
# 1: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 2: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# 3: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 4: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T)
# unadjusted_cor_pearson    partial_cor_pearson
#            -0.01201250            -0.01699817





## @ x1x2z.partial_correlation_dbl() revision 180523 ==========  
x1x2z.partial_correlation_dbl = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F, p.value = F) {  # revision 180523
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    if (convert_binary2numeric == T) {
        x1.binary2numeric = function.binary2numeric(x1)
        x2.binary2numeric = function.binary2numeric(x2)
    } else if (length(levels(x1)) > 2) {
        stop("error - length(levels(x1)) > 2")
    } else if (length(levels(x2)) > 2) {
        stop("error - length(levels(x2)) > 2")
    } else {
        x1.binary2numeric = (x1)
        x2.binary2numeric = (x2)
    }

    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    if (p.value == F) {
        unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method)
        partial_cor = cor(resid1, resid2, method = cor_method)
        out = list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor) |> unlist()
    } else if (p.value == T) {
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
        unadjusted_cor = cor.test(x1.binary2numeric, x2.binary2numeric, method = cor_method) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(unadjusted_cor$conf.int)) unadjusted_cor$conf.int = unadjusted_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
        names(unadjusted_cor) = paste0("unadjusted_cor.", names(unadjusted_cor))
        unadjusted_cor = unadjusted_cor |> unlist()  #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        names(unadjusted_cor)[1] = "unadjusted_cor"
        partial_cor = cor.test(resid1, resid2, method = cor_method) %>% {.[c("estimate", "conf.int", "p.value", "statistic")]}  # output is a list of named vectors. $conf.int has a vector of length 2. unlist() will make a named vector.
        if (!is.null(partial_cor$conf.int)) partial_cor$conf.int = partial_cor$conf.int |> as.vector() %>% setNames(c("LL", "UL"))
        partial_cor = partial_cor |> unlist()  #@ caution) attr(estimate, "names") = "cor" if method == "pearson", "rho" if method == "spearman", "tau" if method == "kendall"
        names(partial_cor) = paste0("partial_cor.", names(partial_cor))
        names(partial_cor)[1] = "partial_cor"
        out = c(unadjusted_cor, partial_cor)  # concategate two named vectors (unlist)
    }
    names(out) = paste0(names(out), "_", cor_method)
    out
}



## @ test: stackloss) x1x2z.partial_correlation_dbl() ------  
x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# unadjusted_cor_pearson    partial_cor_pearson
#              0.7818523              0.7356413

x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T)
x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T) |> str()
# > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T)
#             unadjusted_cor_pearson unadjusted_cor.conf.int.LL_pearson 
#                       7.818523e-01                       5.285640e-01 
# unadjusted_cor.conf.int.UL_pearson     unadjusted_cor.p.value_pearson 
#                       9.073086e-01                       2.836516e-05 
# unadjusted_cor.statistic.t_pearson                partial_cor_pearson 
#                       5.466261e+00                       7.356413e-01 
#    partial_cor.conf.int.LL_pearson    partial_cor.conf.int.UL_pearson 
#                       4.453981e-01                       8.859727e-01 
#        partial_cor.p.value_pearson    partial_cor.statistic.t_pearson 
#                       1.444546e-04                       4.733867e+00 
# > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T) |> str()
#  Named num [1:10] 7.82e-01 5.29e-01 9.07e-01 2.84e-05 5.47 ...
#  - attr(*, "names")= chr [1:10] "unadjusted_cor_pearson" "unadjusted_cor.conf.int.LL_pearson" "unadjusted_cor.conf.int.UL_pearson" "unadjusted_cor.p.value_pearson" ...


## @ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation_dbl() ------  
tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
tmp.df |> as_tibble()
# > tmp.df |> as_tibble()
# # A tibble: 78 x 4
#    Var1  Var2  Var3   Freq
#  * <fct> <fct> <fct> <int>
#  1 A     A     A         1
#  2 B     A     A         2
#  3 B     A     A         2
#  4 A     B     A         3
#  5 A     B     A         3
#  6 A     B     A         3
#  7 B     B     A         4
#  8 B     B     A         4
#  9 B     B     A         4
# 10 B     B     A         4
# # ... with 68 more rows
x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T)
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#  Show Traceback
#
#  Rerun with Debug
#  Error in cor(x1.binary2numeric, x2.binary2numeric, method = cor_method) :
#   'x' must be numeric In addition: Warning messages:
# 1: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 2: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# 3: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 4: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T)
# unadjusted_cor_pearson    partial_cor_pearson
#            -0.01201250            -0.01699817


x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T, p.value = T)
x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T, p.value = T) |> str()
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T, p.value = T)
#             unadjusted_cor_pearson unadjusted_cor.conf.int.LL_pearson 
#                        -0.01201250                        -0.23391796 
# unadjusted_cor.conf.int.UL_pearson     unadjusted_cor.p.value_pearson 
#                         0.21108251                         0.91686588 
# unadjusted_cor.statistic.t_pearson                partial_cor_pearson 
#                        -0.10473010                        -0.01699817 
#    partial_cor.conf.int.LL_pearson    partial_cor.conf.int.UL_pearson 
#                        -0.23862629                         0.20631299 
#        partial_cor.p.value_pearson    partial_cor.statistic.t_pearson 
#                         0.88257114                        -0.14820801 
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T, p.value = T) |> str()
#  Named num [1:10] -0.012 -0.234 0.211 0.917 -0.105 ...
#  - attr(*, "names")= chr [1:10] "unadjusted_cor_pearson" "unadjusted_cor.conf.int.LL_pearson" "unadjusted_cor.conf.int.UL_pearson" "unadjusted_cor.p.value_pearson" ...


