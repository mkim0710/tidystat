# x1x2z.patial_correlation.dev.r
# 170704
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")


function.binary2numeric = function(x) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.binary2numeric.dev.r")
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
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    x1x2z.df = array3d_R_C_strata |> as.table() |> as.data.frame()
    
    index = map(1:nrow(x1x2z.df), function(i) rep(i, x1x2z.df[i,4])) |> unlist()
    out = x1x2z.df[index, ]
    # out = out %>% map_df(as.numeric)
    out
}

## @ test) array3d_R_C_strata2df() --------  
# > array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3))) |> as_tibble()
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



## @ x1x2z.partial_correlation() revision 180523 v5 ==========  
x1x2z.partial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall"), p.value = F) {  # revision 180523 v5
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    
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
                # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str(max.level = 2, give.attr = TRUE)
                # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str(max.level = 2, give.attr = TRUE)
                # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str(max.level = 2, give.attr = TRUE)
                # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str(max.level = 2, give.attr = TRUE)
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
                # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str(max.level = 2, give.attr = TRUE)
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


## @ test: stackloss) x1x2z.partial_correlation() ------  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
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

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str(max.level = 2, give.attr = TRUE)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str(max.level = 2, give.attr = TRUE)
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

x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T) |> str(max.level = 2, give.attr = TRUE)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.) |> str(max.level = 2, give.attr = TRUE)
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


## @ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation() ------  
# > tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024




## @ test: data) x1x2z.partial_correlation() ------  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
n = 100
data = data_frame(
  PERSON_ID = as.factor(1:(n * 2))
  , MatchingPairID = as.factor((1:(n * 2) + 1) %/% 2)
  , isExposed = rep(c(F,T), n)
  , Strata = as.factor( (((1:(n * 2) + 1) %/% 2) %% 3) - 1 )
)
data = data %>% mutate(Outcome = (isExposed * 2 - 1) + as.numeric(as.character(Strata)) )
set.seed(1)
data = data %>% mutate(Outcome = Outcome + rnorm(2 * n, 0, 2) )
data$Outcome.gt0 = (data$Outcome > 0)
data$diff2_1 = data$Outcome / 2 + rnorm(2 * n, 0, 3)
data$Outcome2 = data$Outcome + data$diff2_1
data$Outcome2.gt0 = (data$Outcome2 > 0)
data$diff3_1 = (data$isExposed * data$Outcome) / 2 + rnorm(2 * n, 0, 3)
data$Outcome3 = data$Outcome + data$diff3_1
data$Outcome3.gt0 = (data$Outcome3 > 0)
data
data |> summary()
cor(map_df(data[,c(-1,-2)], as.numeric)) %>% round(3)
# > data
# # A tibble: 200 x 12
#    PERSON_ID MatchingPairID isExposed Strata    Outcome Outcome.gt0    diff2_1  Outcome2 Outcome2.gt0    diff3_1     Outcome3 Outcome3.gt0
#       <fctr>         <fctr>     <lgl> <fctr>      <dbl>       <lgl>      <dbl>     <dbl>        <lgl>      <dbl>        <dbl>        <lgl>
#  1         1              1     FALSE      0 -2.2529076       FALSE  0.1017517 -2.151156        FALSE  3.2233229  0.970415253         TRUE
#  2         2              1      TRUE      0  1.3672866        TRUE  5.7502632  7.117550         TRUE  6.3706076  7.737894295         TRUE
#  3         3              2     FALSE      1 -1.6712572       FALSE  3.9241367  2.252879         TRUE -1.8089919 -3.480249136        FALSE
#  4         4              2      TRUE      1  5.1905616        TRUE  1.6025574  6.793119         TRUE  1.4226773  6.613238944         TRUE
#  5         5              3     FALSE     -1 -1.3409845       FALSE -7.5261988 -8.867183        FALSE -1.2486661 -2.589650551        FALSE
#  6         6              3      TRUE     -1 -1.6409368       FALSE  6.6725164  5.031580         TRUE -1.9474407 -3.588377421        FALSE
#  7         7              4     FALSE      0 -0.0251419       FALSE  1.9886276  1.963486         TRUE -1.0998928 -1.125034732        FALSE
#  8         8              4      TRUE      0  2.4766494        TRUE  2.8623067  5.338956         TRUE  0.3512923  2.827941757         TRUE
#  9         9              5     FALSE      1  1.1515627        TRUE  0.5355828  1.687145         TRUE  4.3254612  5.477023934         TRUE
# 10        10              5      TRUE      1  1.3892232        TRUE  2.2249369  3.614160         TRUE -1.3980033 -0.008780037        FALSE
# # ... with 190 more rows
# > data |> summary()
#    PERSON_ID   MatchingPairID isExposed       Strata     Outcome         Outcome.gt0        diff2_1           Outcome2         Outcome2.gt0       diff3_1           Outcome3         Outcome3.gt0
#  1      :  1   1      :  2    Mode :logical   -1:66   Min.   :-5.32995   Mode :logical   Min.   :-8.4106   Min.   :-11.64243   Mode :logical   Min.   :-8.7316   Min.   :-11.24646   Mode :logical
#  2      :  1   2      :  2    FALSE:100       0 :68   1st Qu.:-1.32357   FALSE:100       1st Qu.:-1.8846   1st Qu.: -2.60940   FALSE:102       1st Qu.:-2.1801   1st Qu.: -3.06493   FALSE:99
#  3      :  1   3      :  2    TRUE :100       1 :66   Median :-0.01147   TRUE :100       Median : 0.3495   Median : -0.07705   TRUE :98        Median :-0.1832   Median :  0.07467   TRUE :101
#  4      :  1   4      :  2                            Mean   : 0.07108                   Mean   : 0.1575   Mean   :  0.22853                   Mean   : 0.1242   Mean   :  0.19523
#  5      :  1   5      :  2                            3rd Qu.: 1.39749                   3rd Qu.: 2.3364   3rd Qu.:  2.96400                   3rd Qu.: 2.4894   3rd Qu.:  2.70353
#  6      :  1   6      :  2                            Max.   : 6.41221                   Max.   : 7.5134   Max.   : 12.83850                   Max.   :11.4308   Max.   : 15.30026
#  (Other):194   (Other):188
# > cor(map_df(data[,c(-1,-2)], as.numeric)) %>% round(3)
#              isExposed Strata Outcome Outcome.gt0 diff2_1 Outcome2 Outcome2.gt0 diff3_1 Outcome3 Outcome3.gt0
# isExposed        1.000  0.000   0.411       0.340   0.216    0.361        0.380   0.130    0.299        0.230
# Strata           0.000  1.000   0.398       0.295   0.047    0.233        0.246   0.129    0.292        0.234
# Outcome          0.411  0.398   1.000       0.789   0.334    0.740        0.578   0.276    0.698        0.517
# Outcome.gt0      0.340  0.295   0.789       1.000   0.257    0.579        0.500   0.209    0.544        0.430
# diff2_1          0.216  0.047   0.334       0.257   1.000    0.881        0.706   0.077    0.221        0.102
# Outcome2         0.361  0.233   0.740       0.579   0.881    1.000        0.794   0.194    0.508        0.332
# Outcome2.gt0     0.380  0.246   0.578       0.500   0.706    0.794        1.000   0.127    0.379        0.270
# diff3_1          0.130  0.129   0.276       0.209   0.077    0.194        0.127   1.000    0.881        0.698
# Outcome3         0.299  0.292   0.698       0.544   0.221    0.508        0.379   0.881    1.000        0.775
# Outcome3.gt0     0.230  0.234   0.517       0.430   0.102    0.332        0.270   0.698    0.775        1.000

x1x2z.partial_correlation(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# > x1x2z.partial_correlation(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# # A tibble: 3 x 3
#   method   unadjusted_cor partial_cor
#   <chr>             <dbl>       <dbl>
# 1 pearson           0.740       0.725
# 2 spearman          0.716       0.706
# 3 kendall           0.527       0.516
# > x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# # A tibble: 3 x 3
#   method   unadjusted_cor partial_cor
#   <chr>             <dbl>       <dbl>
# 1 pearson           0.500       0.462
# 2 spearman          0.500       0.482
# 3 kendall           0.500       0.448
# > x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# [1] "error - length(levels(x)) > 2"
# Error in cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) : 
#   'y' must be numeric
# In addition: Warning messages:
# 1: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 2: In Ops.factor(y, z$residuals) :
#  Hide Traceback
#  
#  Rerun with Debug
#  Error in cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) : 
#   'y' must be numeric 
# 8.
# stop("'y' must be numeric") 
# 7.
# cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i]) 
# 6.
# .f(.x[[i]], ...) 
# 5.
# map(seq_along(cor_method), function(i) {
#     unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, 
#         method = cor_method[i])
#     partial_cor = cor(resid1, resid2, method = cor_method[i]) ... 
# 4.
# eval(lhs, parent, parent) 
# 3.
# eval(lhs, parent, parent) 
# 2.
# map(seq_along(cor_method), function(i) {
#     unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, 
#         method = cor_method[i])
#     partial_cor = cor(resid1, resid2, method = cor_method[i]) ... 
# 1.
# x1x2z.partial_correlation(x1 = data$Outcome.gt0, x2 = data$Strata, 
#     z = data$isExposed) 







## @ x1x2z.partial_correlation_dbl() revision 180523 ==========  
x1x2z.partial_correlation_dbl = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F, p.value = F) {  # revision 180523
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    
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
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str(max.level = 2, give.attr = TRUE)
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") |> str(max.level = 2, give.attr = TRUE)
        # cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "kendall") |> str(max.level = 2, give.attr = TRUE)
        # # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "pearson") |> str(max.level = 2, give.attr = TRUE)
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
        # > cor.test(stackloss$Air.Flow, stackloss$Water.Temp, method = "spearman") %>% {.[c("estimate", "conf.int", "p.value", "statistic")]} |> str(max.level = 2, give.attr = TRUE)
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
x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T) |> str(max.level = 2, give.attr = TRUE)
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
# > x1x2z.partial_correlation_dbl(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., p.value = T) |> str(max.level = 2, give.attr = TRUE)
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
x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T, p.value = T) |> str(max.level = 2, give.attr = TRUE)
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
# > x1x2z.partial_correlation_dbl(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], convert_binary2numeric = T, p.value = T) |> str(max.level = 2, give.attr = TRUE)
#  Named num [1:10] -0.012 -0.234 0.211 0.917 -0.105 ...
#  - attr(*, "names")= chr [1:10] "unadjusted_cor_pearson" "unadjusted_cor.conf.int.LL_pearson" "unadjusted_cor.conf.int.UL_pearson" "unadjusted_cor.p.value_pearson" ...




## @ test: data) x1x2z.partial_correlation_dbl() ------------  
x1x2z.partial_correlation_dbl(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# > x1x2z.partial_correlation_dbl(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# unadjusted_cor_pearson    partial_cor_pearson
#              0.7398992              0.7254627
# > x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# unadjusted_cor_pearson    partial_cor_pearson
#              0.5001000              0.4620831
# > x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# Error in x1x2z.partial_correlation_dbl(x1 = data$Outcome.gt0, x2 = data$Strata,  :
#   error - length(levels(x2)) > 2




## @ x1x2z.partial_correlation_scalar() ==========  
x1x2z.partial_correlation_scalar = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    
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

## @ test: stackloss) x1x2z.partial_correlation_scalar() ------  
x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
x1x2z.partial_correlation_scalar(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# > x1x2z.partial_correlation(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
#          unadjusted_cor partial_cor
# pearson       0.7818523   0.7356413
# spearman      0.7330699   0.5976564
# kendall       0.5955500   0.4455219
# > x1x2z.partial_correlation_scalar(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc.)
# [1] 0.7356413



## @ test: array(1:12, dim = c(2, 2, 3)) ) x1x2z.partial_correlation_scalar() ------  
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
x1x2z.partial_correlation_scalar(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024
# > x1x2z.partial_correlation_scalar(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
# [1] -0.01699817
# Warning messages:
# 1: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 2: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors
# 3: In model.response(mf, "numeric") :
#   using type = "numeric" with a factor response will be ignored
# 4: In Ops.factor(y, z$residuals) : ¡®-¡¯ not meaningful for factors



## @ test: data) x1x2z.partial_correlation_scalar() ------------  
x1x2z.partial_correlation_scalar(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# > x1x2z.partial_correlation_scalar(x1 = data$Outcome, x2 = data$Outcome2, z = data$Strata)
# [1] 0.7254627
# > x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Outcome2.gt0, z = data$Strata)
# [1] 0.4620831
# > x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Strata, z = data$isExposed)
# Error in x1x2z.partial_correlation_scalar(x1 = data$Outcome.gt0, x2 = data$Strata,  :
#   error - length(levels(x2)) > 2

