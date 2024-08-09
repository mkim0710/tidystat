
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


x1x2z.partial_correlation0 = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall")) {
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
x1x2z.partial_correlation_dbl0 = function(x1, x2, z, cor_method = "pearson") {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    x1.binary2numeric = function.binary2numeric(x1)
    x2.binary2numeric = function.binary2numeric(x2)
    
    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method)
    partial_cor = cor(resid1, resid2, method = cor_method)
    out = list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
    names(out) = paste0(names(out), "_", cor_method)
    out = unlist(out)
    out
}
x1x2z.partial_correlation_dbl1 = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F) {
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
x1x2z.partial_correlation_scalar0 = function(x1, x2, z, cor_method = "pearson") {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # library(tidyverse)
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    x1.binary2numeric = function.binary2numeric(x1)
    x2.binary2numeric = function.binary2numeric(x2)
    
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
x1x2z.partial_correlation_scalar1 = function(x1, x2, z, cor_method = "pearson", convert_binary2numeric = F) {
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
    
    # unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method)
    partial_cor = cor(resid1, resid2, method = cor_method)
    # out = list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
    # names(out) = paste0(names(out), "_", cor_method)
    # out = unlist(out)
    # out
    partial_cor
}


# @ test: stackloss) x1x2z.partial_correlation_dbl() ------  
x1x2z.partial_correlation0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
x1x2z.partial_correlation_dbl0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
x1x2z.partial_correlation_dbl1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
x1x2z.partial_correlation_scalar0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
x1x2z.partial_correlation_scalar1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
# > x1x2z.partial_correlation0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
#         unadjusted_cor partial_cor
# pearson      0.7818523   0.7356413
# > x1x2z.partial_correlation_dbl0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
# unadjusted_cor_pearson    partial_cor_pearson 
#              0.7818523              0.7356413 
# > x1x2z.partial_correlation_dbl1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
# unadjusted_cor_pearson    partial_cor_pearson 
#              0.7818523              0.7356413 
# > x1x2z.partial_correlation_scalar0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
# [1] 0.7356413
# > x1x2z.partial_correlation_scalar1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
# [1] 0.7356413

system.time(replicate(10^3, x1x2z.partial_correlation0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
system.time(replicate(10^3, x1x2z.partial_correlation_dbl0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
system.time(replicate(10^3, x1x2z.partial_correlation_dbl1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
system.time(replicate(10^3, x1x2z.partial_correlation_scalar0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
system.time(replicate(10^3, x1x2z.partial_correlation_scalar1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
# > system.time(replicate(10^4, x1x2z.partial_correlation0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
#  사용자  시스템 elapsed 
#   33.33    0.00   33.55 
# > system.time(replicate(10^4, x1x2z.partial_correlation_dbl0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
#  사용자  시스템 elapsed 
#   24.39    0.00   24.67 
# > system.time(replicate(10^4, x1x2z.partial_correlation_dbl1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
#  사용자  시스템 elapsed 
#   24.28    0.01   24.43 
# > system.time(replicate(10^4, x1x2z.partial_correlation_scalar0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
#  사용자  시스템 elapsed 
#   23.58    0.02   23.75 
# > system.time(replicate(10^4, x1x2z.partial_correlation_scalar1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
#  사용자  시스템 elapsed 
#   23.47    0.00   23.46 



library(microbenchmark)
mbm = microbenchmark(
    fun0 = x1x2z.partial_correlation0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
    , fun_vec0 = x1x2z.partial_correlation_dbl0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
    , fun_vec1 = x1x2z.partial_correlation_dbl1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
    , fun_scalar0 = x1x2z.partial_correlation_scalar0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
    , fun_scalar1 = x1x2z.partial_correlation_scalar1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")
)
autoplot(mbm)
mbm
# > mbm
# Unit: milliseconds
#         expr      min       lq     mean   median       uq      max neval cld
#         fun0 3.028478 3.099277 3.215144 3.131915 3.178780 5.105262   100   b
#     fun_vec0 2.196291 2.289853 2.449412 2.309436 2.347765 5.096894   100  a 
#     fun_vec1 2.177880 2.275962 2.399377 2.296548 2.332199 3.896483   100  a 
#  fun_scalar0 2.185579 2.221230 2.365001 2.236795 2.293034 5.809241   100  a 
#  fun_scalar1 2.098544 2.209681 2.361697 2.227758 2.285166 7.521149   100  a 


mbm = microbenchmark(
    fun0 = replicate(10^2, x1x2z.partial_correlation0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson"))
    , fun_vec0 = replicate(10^2, x1x2z.partial_correlation_dbl0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson"))
    , fun_vec1 = replicate(10^2, x1x2z.partial_correlation_dbl1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson"))
    , fun_scalar0 = replicate(10^2, x1x2z.partial_correlation_scalar0(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson"))
    , fun_scalar1 = replicate(10^2, x1x2z.partial_correlation_scalar1(x1 = stackloss$Air.Flow, x2 = stackloss$Water.Temp, z = stackloss$Acid.Conc., cor_method = "pearson")))
autoplot(mbm)
mbm
# > mbm
# Unit: milliseconds
#         expr      min       lq     mean   median       uq      max neval cld
#         fun0 315.0557 321.5646 329.3020 326.9641 332.8848 486.3844   100   c
#     fun_vec0 231.9204 236.4976 243.6641 239.9537 244.3950 416.1861   100  b 
#     fun_vec1 231.4306 235.4265 240.7211 239.4082 243.6034 287.7833   100 ab 
#  fun_scalar0 224.8956 229.7388 235.8978 233.8790 237.8563 395.2188   100 a  
#  fun_scalar1 221.0346 229.1260 235.9905 233.5680 237.7102 403.6421   100 a  

