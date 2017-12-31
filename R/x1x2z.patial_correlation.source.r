# x1x2z.patial_correlation.source.r
# 170704
# source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")


function.binary2numeric = function(x) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.binary2numeric.source.r")
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    if (is.character(x)) {
        x = as.factor(x)
    }
    if (length(levels(x)) == 2) {
        x = as.numeric(x)
    } else if (length(levels(x)) > 2) {
        print("error - length(levels(x)) > 2")
    }
    if (is.logical(x)) {
        x = as.numeric(x)
    } 
    x
}

array3d_R_C_strata2df = function(array3d_R_C_strata) {
    # library(tidyverse)
    x1x2z.df = array3d_R_C_strata %>% as.table %>% as.data.frame
    
    index = map(1:nrow(x1x2z.df), function(i) rep(i, x1x2z.df[i,4])) %>% unlist
    out = x1x2z.df[index, ]
    # out = out %>% map_df(as.numeric)
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


#@ x1x2z.partial_correlation() ==========
x1x2z.partial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall")) {
    # source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")
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
    out = out %>% as.data.frame 
    out = out %>% t %>% as.data.frame
    out
}

# #@ test: stackloss) x1x2z.partial_correlation() ------
# str(stackloss)
# # > str(stackloss)
# # 'data.frame':	21 obs. of  4 variables:
# #  $ Air.Flow  : num  80 80 75 62 62 62 62 62 58 58 ...
# #  $ Water.Temp: num  27 27 25 24 22 23 24 24 23 18 ...
# #  $ Acid.Conc.: num  89 88 90 87 87 87 93 93 87 80 ...
# #  $ stack.loss: num  42 37 37 28 18 18 19 20 15 14 ...
# x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# #          unadjusted_cor partial_cor
# # pearson       0.7818523   0.7356413
# # spearman      0.7330699   0.5976564
# # kendall       0.5955500   0.4455219
# 
# #@ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation() ------
# # > tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# # > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# #          unadjusted_cor partial_cor
# # pearson      -0.0120125 -0.01699817
# # spearman     -0.0120125  0.16198062
# # kendall      -0.0120125  0.14541024
# 
# #@ test: data) x1x2z.partial_correlation() ------
# library(tidyverse)
# n = 100
# data = data_frame(
#   PERSON_ID = as.factor(1:(n * 2))
#   , MatchingPairID = as.factor((1:(n * 2) + 1) %/% 2)
#   , isExposed = rep(c(F,T), n) 
#   , Strata = as.factor( (((1:(n * 2) + 1) %/% 2) %% 3) - 1 )
# )
# data = data %>% mutate(Outcome = (isExposed * 2 - 1) + as.numeric(as.character(Strata)) )
# set.seed(1)
# data = data %>% mutate(Outcome = Outcome + rnorm(2 * n, 0, 2) )
# data$Outcome.gt0 = (data$Outcome > 0)
# data$diff2_1 = data$Outcome / 2 + rnorm(2 * n, 0, 3)
# data$Outcome2 = data$Outcome + data$diff2_1
# data$Outcome2.gt0 = (data$Outcome2 > 0)
# data$diff3_1 = (data$isExposed * data$Outcome) / 2 + rnorm(2 * n, 0, 3)
# data$Outcome3 = data$Outcome + data$diff3_1
# data$Outcome3.gt0 = (data$Outcome3 > 0)
# data
# data %>% summary
# cor(map_df(data[,c(-1,-2)], as.numeric)) %>% round(3)
# # > data
# # # A tibble: 200 x 12
# #    PERSON_ID MatchingPairID isExposed Strata    Outcome Outcome.gt0    diff2_1  Outcome2 Outcome2.gt0    diff3_1     Outcome3 Outcome3.gt0
# #       <fctr>         <fctr>     <lgl> <fctr>      <dbl>       <lgl>      <dbl>     <dbl>        <lgl>      <dbl>        <dbl>        <lgl>
# #  1         1              1     FALSE      0 -2.2529076       FALSE  0.1017517 -2.151156        FALSE  3.2233229  0.970415253         TRUE
# #  2         2              1      TRUE      0  1.3672866        TRUE  5.7502632  7.117550         TRUE  6.3706076  7.737894295         TRUE
# #  3         3              2     FALSE      1 -1.6712572       FALSE  3.9241367  2.252879         TRUE -1.8089919 -3.480249136        FALSE
# #  4         4              2      TRUE      1  5.1905616        TRUE  1.6025574  6.793119         TRUE  1.4226773  6.613238944         TRUE
# #  5         5              3     FALSE     -1 -1.3409845       FALSE -7.5261988 -8.867183        FALSE -1.2486661 -2.589650551        FALSE
# #  6         6              3      TRUE     -1 -1.6409368       FALSE  6.6725164  5.031580         TRUE -1.9474407 -3.588377421        FALSE
# #  7         7              4     FALSE      0 -0.0251419       FALSE  1.9886276  1.963486         TRUE -1.0998928 -1.125034732        FALSE
# #  8         8              4      TRUE      0  2.4766494        TRUE  2.8623067  5.338956         TRUE  0.3512923  2.827941757         TRUE
# #  9         9              5     FALSE      1  1.1515627        TRUE  0.5355828  1.687145         TRUE  4.3254612  5.477023934         TRUE
# # 10        10              5      TRUE      1  1.3892232        TRUE  2.2249369  3.614160         TRUE -1.3980033 -0.008780037        FALSE
# # # ... with 190 more rows
# # > data %>% summary
# #    PERSON_ID   MatchingPairID isExposed       Strata     Outcome         Outcome.gt0        diff2_1           Outcome2         Outcome2.gt0       diff3_1           Outcome3         Outcome3.gt0   
# #  1      :  1   1      :  2    Mode :logical   -1:66   Min.   :-5.32995   Mode :logical   Min.   :-8.4106   Min.   :-11.64243   Mode :logical   Min.   :-8.7316   Min.   :-11.24646   Mode :logical  
# #  2      :  1   2      :  2    FALSE:100       0 :68   1st Qu.:-1.32357   FALSE:100       1st Qu.:-1.8846   1st Qu.: -2.60940   FALSE:102       1st Qu.:-2.1801   1st Qu.: -3.06493   FALSE:99       
# #  3      :  1   3      :  2    TRUE :100       1 :66   Median :-0.01147   TRUE :100       Median : 0.3495   Median : -0.07705   TRUE :98        Median :-0.1832   Median :  0.07467   TRUE :101      
# #  4      :  1   4      :  2                            Mean   : 0.07108                   Mean   : 0.1575   Mean   :  0.22853                   Mean   : 0.1242   Mean   :  0.19523                  
# #  5      :  1   5      :  2                            3rd Qu.: 1.39749                   3rd Qu.: 2.3364   3rd Qu.:  2.96400                   3rd Qu.: 2.4894   3rd Qu.:  2.70353                  
# #  6      :  1   6      :  2                            Max.   : 6.41221                   Max.   : 7.5134   Max.   : 12.83850                   Max.   :11.4308   Max.   : 15.30026                  
# #  (Other):194   (Other):188                                                                                                                                                                          
# # > cor(map_df(data[,c(-1,-2)], as.numeric)) %>% round(3)
# #              isExposed Strata Outcome Outcome.gt0 diff2_1 Outcome2 Outcome2.gt0 diff3_1 Outcome3 Outcome3.gt0
# # isExposed        1.000  0.000   0.411       0.340   0.216    0.361        0.380   0.130    0.299        0.230
# # Strata           0.000  1.000   0.398       0.295   0.047    0.233        0.246   0.129    0.292        0.234
# # Outcome          0.411  0.398   1.000       0.789   0.334    0.740        0.578   0.276    0.698        0.517
# # Outcome.gt0      0.340  0.295   0.789       1.000   0.257    0.579        0.500   0.209    0.544        0.430
# # diff2_1          0.216  0.047   0.334       0.257   1.000    0.881        0.706   0.077    0.221        0.102
# # Outcome2         0.361  0.233   0.740       0.579   0.881    1.000        0.794   0.194    0.508        0.332
# # Outcome2.gt0     0.380  0.246   0.578       0.500   0.706    0.794        1.000   0.127    0.379        0.270
# # diff3_1          0.130  0.129   0.276       0.209   0.077    0.194        0.127   1.000    0.881        0.698
# # Outcome3         0.299  0.292   0.698       0.544   0.221    0.508        0.379   0.881    1.000        0.775
# # Outcome3.gt0     0.230  0.234   0.517       0.430   0.102    0.332        0.270   0.698    0.775        1.000
# 
# x1x2z.partial_correlation(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# # > x1x2z.partial_correlation(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# #          unadjusted_cor partial_cor
# # pearson       0.7398992   0.7254627
# # spearman      0.7164329   0.7058021
# # kendall       0.5272362   0.5164824
# # > x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# #          unadjusted_cor partial_cor
# # pearson          0.5001   0.4620831
# # spearman         0.5001   0.4821798
# # kendall          0.5001   0.4479482
# # > x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# # [1] "error - length(levels(x)) > 2"
# #  Show Traceback
# #  
# #  Rerun with Debug
# #  Error in cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) : 
# #   'y' must be numeric In addition: Warning messages:
# # 1: In model.response(mf, "numeric") :
# #   using type = "numeric" with a factor response will be ignored
# # 2: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors





#@ x1x2z.partial_correlation_dbl() ==========
x1x2z.partial_correlation_dbl = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F) {
    # source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")
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

# #@ test: stackloss) x1x2z.partial_correlation_dbl() ------
# x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # unadjusted_cor_pearson    partial_cor_pearson
# #              0.7818523              0.7356413
# 
# #@ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation_dbl() ------
# tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T)
# # > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# #          unadjusted_cor partial_cor
# # pearson      -0.0120125 -0.01699817
# # spearman     -0.0120125  0.16198062
# # kendall      -0.0120125  0.14541024
# # > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# #  Show Traceback
# #  
# #  Rerun with Debug
# #  Error in cor(x1.binary2numeric, x2.binary2numeric, method = cor_method) : 
# #   'x' must be numeric In addition: Warning messages:
# # 1: In model.response(mf, "numeric") :
# #   using type = "numeric" with a factor response will be ignored
# # 2: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# # 3: In model.response(mf, "numeric") :
# #   using type = "numeric" with a factor response will be ignored
# # 4: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# # > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T)
# # unadjusted_cor_pearson    partial_cor_pearson 
# #            -0.01201250            -0.01699817 
# 
# #@ test: data) x1x2z.partial_correlation_dbl() ------------
# x1x2z.partial_correlation_dbl(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# # > x1x2z.partial_correlation_dbl(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# # unadjusted_cor_pearson    partial_cor_pearson 
# #              0.7398992              0.7254627 
# # > x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# # unadjusted_cor_pearson    partial_cor_pearson 
# #              0.5001000              0.4620831 
# # > x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# # Error in x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Strata,  : 
# #   error - length(levels(x2)) > 2




#@ x1x2z.partial_correlation_scalar() ==========
x1x2z.partial_correlation_scalar = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F) {
    # source("https://github.com/mkim0710/tidystat/raw/master/x1x2z.patial_correlation.source.r")
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
    
    # unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method)
    partial_cor = cor(resid1, resid2, method = cor_method)
    # out = list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
    # names(out) = paste0(names(out), "_", cor_method)
    # out = unlist(out)
    # out
    partial_cor
}

# #@ test: stackloss) x1x2z.partial_correlation_scalar() ------
# x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# x1x2z.partial_correlation_scalar(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# #          unadjusted_cor partial_cor
# # pearson       0.7818523   0.7356413
# # spearman      0.7330699   0.5976564
# # kendall       0.5955500   0.4455219
# # > x1x2z.partial_correlation_scalar(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# # [1] 0.7356413
# 
# 
# 
# #@ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation_scalar() ------
# tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# x1x2z.partial_correlation_scalar(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# # > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# #          unadjusted_cor partial_cor
# # pearson      -0.0120125 -0.01699817
# # spearman     -0.0120125  0.16198062
# # kendall      -0.0120125  0.14541024
# # > x1x2z.partial_correlation_scalar(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# # [1] -0.01699817
# # Warning messages:
# # 1: In model.response(mf, "numeric") :
# #   using type = "numeric" with a factor response will be ignored
# # 2: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# # 3: In model.response(mf, "numeric") :
# #   using type = "numeric" with a factor response will be ignored
# # 4: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# 
# 
# 
# #@ test: data) x1x2z.partial_correlation_scalar() ------------
# x1x2z.partial_correlation_scalar(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# # > x1x2z.partial_correlation_scalar(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# # [1] 0.7254627
# # > x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# # [1] 0.4620831
# # > x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# # Error in x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Strata,  : 
# #   error - length(levels(x2)) > 2

