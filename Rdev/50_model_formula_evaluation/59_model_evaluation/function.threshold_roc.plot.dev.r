# function.threshold_roc.plot.dev.r

# https://blog.revolutionanalytics.com/2016/11/calculating-auc.html =====


library(tidyverse)
df_actual_prediction = tibble(
    actual = c(1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0)
    , prediction = c(20, 19, 18, 17, 16, 15, 14, 13, 11.5, 11.5, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
)


library(pROC)
roc_obj <- roc(df_actual_prediction$actual, df_actual_prediction$prediction)
auc(roc_obj)
# > auc(roc_obj)
# Area under the curve: 0.825

roc_obj[c("sensitivities", "specificities")] %>% as_tibble
# > roc_obj[c("response", "predictor", "sensitivities", "specificities")] %>% as_tibble
# # A tibble: 20 x 4
#    response predictor sensitivities specificities
#       <dbl>     <dbl>         <dbl>         <dbl>
#  1        1      20             1             0  
#  2        1      19             1             0.1
#  3        1      18             1             0.2
#  4        1      17             1             0.3
#  5        0      16             1             0.4
#  6        1      15             0.9           0.4
#  7        1      14             0.9           0.5
#  8        0      13             0.9           0.6
#  9        1      11.5           0.8           0.6
# 10        0      11.5           0.8           0.7
# 11        1      10             0.7           0.7
# 12        0       9             0.6           0.8
# 13        1       8             0.6           0.9
# 14        0       7             0.5           0.9
# 15        0       6             0.4           0.9
# 16        1       5             0.4           1  
# 17        0       4             0.3           1  
# 18        0       3             0.2           1  
# 19        0       2             0.1           1  
# 20        0       1             0             1  








#@ -----
function.vec_actual_prediction.threshold_roc = function(vec_actual, vec_prediction) {
    if (length(vec_actual) != length(vec_prediction)) {
        warning("length(vec_actual) != length(vec_prediction)")
        out = NA
        attr(out, "ErrorMessage") = "length(vec_actual) != length(vec_prediction)"
    } else {
        out = tibble(threshold = vec_prediction %>% unique %>% sort(decreasing = F) %>% {(. + lag(.))/2} %>% replace_na(-Inf) %>% {c(., Inf)} ) %>%
            mutate(
                TP = threshold %>% map_dbl(function(i) {sum(vec_actual == T & vec_prediction >= i)})
                , FP = threshold %>% map_dbl(function(i) {sum(vec_actual != T & vec_prediction >= i)})
                , FN = threshold %>% map_dbl(function(i) {sum(vec_actual == T & vec_prediction < i)})
                , TN = threshold %>% map_dbl(function(i) {sum(vec_actual != T & vec_prediction < i)})
                , total = TP + FP + FN + TN
                , Sensitivity = TP/(TP+FN)
                , Specificity = TN/(TN+FP)
                , PPV = TP/(TP+FP)
                , NPV = TN/(TN+FN)
                , TPR = Sensitivity
                , FPR = 1 - Specificity
                # https://en.wikipedia.org/wiki/F1_score
                , F1score = 2/(1/Sensitivity+1/PPV)
                , F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)
                , F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)
                , OR = TN * TP / FN / FP
                , LRp = TP/(TP+FN) / FP*(FP+TN)
                , LRn = FN/(TP+FN) / TN*(FP+TN)
                , phi = (TP*TN - FN*FP) / {as.numeric(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5
                , SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)
                , TN_expected = TN/(TN+FP)*TN/(TN+FN)
                # , FN_expected = 
                # , FP_expected = 
                , TP_expected = TP/(TP+FP)*TP/(TP+FN)
                , ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)
                # , ChanceAgreement = TN/(TN+FP)*TN/(TN+FN) + TP/(TP+FP)*TP/(TP+FN)
                , Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement) 
            )
        attributes(out)$vec_actual = vec_actual
        attributes(out)$vec_prediction = vec_prediction
        class(out) = c(class(out), "object.threshold_roc")
    }
    out
}

vec_actual_prediction.treshold_roc = function.vec_actual_prediction.threshold_roc(df_actual_prediction$actual, df_actual_prediction$prediction) #-----
vec_actual_prediction.treshold_roc %>% arrange(FPR, TPR) %>% 
    ggplot(aes(x = FPR, y = TPR)) + geom_point() + geom_line() + coord_cartesian(xlim = c(0,1), ylim = c(0,1))
vec_actual_prediction.treshold_roc %>% arrange(1 - Specificity, Sensitivity) %>% 
    ggplot(aes(x = 1 - Specificity, y = Sensitivity)) + geom_point() + geom_line() + coord_cartesian(xlim = c(0,1), ylim = c(0,1))
vec_actual_prediction.treshold_roc
vec_actual_prediction.treshold_roc %>% str #----
# > vec_actual_prediction.treshold_roc %>% str #----
# Classes ‘tbl_df’, ‘tbl’, ‘object.threshold_roc’ and 'data.frame':	20 obs. of  24 variables:
#  $ threshold      : num  -Inf 1.5 2.5 3.5 4.5 ...
#  $ TP             : num  10 10 10 10 10 9 9 9 8 8 ...
#  $ FP             : num  10 9 8 7 6 6 5 4 4 3 ...
#  $ FN             : num  0 0 0 0 0 1 1 1 2 2 ...
#  $ TN             : num  0 1 2 3 4 4 5 6 6 7 ...
#  $ total          : num  20 20 20 20 20 20 20 20 20 20 ...
#  $ Sensitivity    : num  1 1 1 1 1 0.9 0.9 0.9 0.8 0.8 ...
#  $ Specificity    : num  0 0.1 0.2 0.3 0.4 0.4 0.5 0.6 0.6 0.7 ...
#  $ PPV            : num  0.5 0.526 0.556 0.588 0.625 ...
#  $ NPV            : num  NaN 1 1 1 1 ...
#  $ TPR            : num  1 1 1 1 1 0.9 0.9 0.9 0.8 0.8 ...
#  $ FPR            : num  1 0.9 0.8 0.7 0.6 0.6 0.5 0.4 0.4 0.3 ...
#  $ F1score        : num  0.667 0.69 0.714 0.741 0.769 ...
#  $ F2score        : num  0.833 0.847 0.862 0.877 0.893 ...
#  $ F.5score       : num  0.556 0.581 0.61 0.641 0.676 ...
#  $ OR             : num  NaN Inf Inf Inf Inf ...
#  $ LRp            : num  1 1.11 1.25 1.43 1.67 ...
#  $ LRn            : num  NaN 0 0 0 0 ...
#  $ phi            : num  NaN 0.229 0.333 0.42 0.5 ...
#  $ SimpleAgreement: num  0.5 0.55 0.6 0.65 0.7 0.65 0.7 0.75 0.7 0.75 ...
#  $ TN_expected    : num  NaN 0.1 0.2 0.3 0.4 ...
#  $ TP_expected    : num  0.5 0.526 0.556 0.588 0.625 ...
#  $ ChanceAgreement: num  NaN 0.01 0.02 0.03 0.04 ...
#  $ Cohen_kappa    : num  NaN 0.545 0.592 0.639 0.687 ...
#  - attr(*, "vec_actual")= num  1 1 1 1 0 1 1 0 1 0 ...
#  - attr(*, "vec_prediction")= num  20 19 18 17 16 15 14 13 11.5 11.5 ...



#@ -----
function.df_actual_prediction.threshold_roc = function(df_actual_prediction, varname4actual = "actual", varname4prediction = "prediction") {
    out = tibble(threshold = df_actual_prediction[[varname4prediction]] %>% unique %>% sort(decreasing = F) %>% {(. + lag(.))/2} %>% replace_na(-Inf) %>% {c(., Inf)} ) %>%
        mutate(
            TP = threshold %>% map_dbl(function(i) {sum(df_actual_prediction[[varname4actual]] == T & df_actual_prediction[[varname4prediction]] >= i)})
            , FP = threshold %>% map_dbl(function(i) {sum(df_actual_prediction[[varname4actual]] != T & df_actual_prediction[[varname4prediction]] >= i)})
            , FN = threshold %>% map_dbl(function(i) {sum(df_actual_prediction[[varname4actual]] == T & df_actual_prediction[[varname4prediction]] < i)})
            , TN = threshold %>% map_dbl(function(i) {sum(df_actual_prediction[[varname4actual]] != T & df_actual_prediction[[varname4prediction]] < i)})
            , total = TP + FP + FN + TN
            , Sensitivity = TP/(TP+FN)
            , Specificity = TN/(TN+FP)
            , PPV = TP/(TP+FP)
            , NPV = TN/(TN+FN)
            , TPR = Sensitivity
            , FPR = 1 - Specificity
            # https://en.wikipedia.org/wiki/F1_score
            , F1score = 2/(1/Sensitivity+1/PPV)
            , F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)
            , F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)
            , OR = TN * TP / FN / FP
            , LRp = TP/(TP+FN) / FP*(FP+TN)
            , LRn = FN/(TP+FN) / TN*(FP+TN)
            , phi = (TP*TN - FN*FP) / {as.numeric(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5
            , SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)
            , TN_expected = TN/(TN+FP)*TN/(TN+FN)
            # , FN_expected = 
            # , FP_expected = 
            , TP_expected = TP/(TP+FP)*TP/(TP+FN)
            , ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)
            # , ChanceAgreement = TN/(TN+FP)*TN/(TN+FN) + TP/(TP+FP)*TP/(TP+FN)
            , Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement) 
        )
    attributes(out)$df_actual_prediction = df_actual_prediction
    class(out) = c(class(out), "object.threshold_roc")
    out
}

df_actual_prediction.treshold_roc = df_actual_prediction %>% function.df_actual_prediction.threshold_roc #-----
df_actual_prediction.treshold_roc
df_actual_prediction.treshold_roc %>% str #----
# > df_actual_prediction.treshold_roc
# # A tibble: 20 x 24
#    threshold    TP    FP    FN    TN total Sensitivity Specificity     PPV     NPV   TPR   FPR F1score F2score F.5score     OR    LRp     LRn     phi
#  *     <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>       <dbl>       <dbl>   <dbl>   <dbl> <dbl> <dbl>   <dbl>   <dbl>    <dbl>  <dbl>  <dbl>   <dbl>   <dbl>
#  1    -Inf      10    10     0     0    20         1           0     0.5   NaN       1   1       0.667   0.833    0.556 NaN      1    NaN     NaN    
#  2       1.5    10     9     0     1    20         1           0.1   0.526   1       1   0.9     0.690   0.847    0.581 Inf      1.11   0       0.229
#  3       2.5    10     8     0     2    20         1           0.2   0.556   1       1   0.8     0.714   0.862    0.610 Inf      1.25   0       0.333
#  4       3.5    10     7     0     3    20         1           0.3   0.588   1       1   0.7     0.741   0.877    0.641 Inf      1.43   0       0.420
#  5       4.5    10     6     0     4    20         1           0.4   0.625   1       1   0.6     0.769   0.893    0.676 Inf      1.67   0       0.5  
#  6       5.5     9     6     1     4    20         0.9         0.4   0.6     0.8     0.9 0.6     0.72    0.818    0.643   6      1.5    0.25    0.346
#  7       6.5     9     5     1     5    20         0.9         0.5   0.643   0.833   0.9 0.5     0.75    0.833    0.682   9      1.8    0.2     0.436
#  8       7.5     9     4     1     6    20         0.9         0.6   0.692   0.857   0.9 0.4     0.783   0.849    0.726  13.5    2.25   0.167   0.524
#  9       8.5     8     4     2     6    20         0.8         0.6   0.667   0.75    0.8 0.4     0.727   0.769    0.690   6      2      0.333   0.408
# 10       9.5     8     3     2     7    20         0.8         0.7   0.727   0.778   0.8 0.3     0.762   0.784    0.741   9.33   2.67   0.286   0.503
# 11      10.8     7     3     3     7    20         0.7         0.7   0.7     0.7     0.7 0.3     0.7     0.7      0.7     5.44   2.33   0.429   0.4  
# 12      12.2     6     2     4     8    20         0.6         0.8   0.75    0.667   0.6 0.200   0.667   0.625    0.714   6      3      0.5     0.408
# 13      13.5     6     1     4     9    20         0.6         0.9   0.857   0.692   0.6 0.100   0.706   0.638    0.789  13.5    6      0.444   0.524
# 14      14.5     5     1     5     9    20         0.5         0.9   0.833   0.643   0.5 0.100   0.625   0.543    0.735   9      5      0.556   0.436
# 15      15.5     4     1     6     9    20         0.4         0.9   0.8     0.6     0.4 0.100   0.533   0.444    0.667   6      4      0.667   0.346
# 16      16.5     4     0     6    10    20         0.4         1     1       0.625   0.4 0       0.571   0.455    0.769 Inf    Inf      0.6     0.5  
# 17      17.5     3     0     7    10    20         0.3         1     1       0.588   0.3 0       0.462   0.349    0.682 Inf    Inf      0.7     0.420
# 18      18.5     2     0     8    10    20         0.2         1     1       0.556   0.2 0       0.333   0.238    0.556 Inf    Inf      0.8     0.333
# 19      19.5     1     0     9    10    20         0.1         1     1       0.526   0.1 0       0.182   0.122    0.357 Inf    Inf      0.900   0.229
# 20     Inf       0     0    10    10    20         0           1   NaN       0.5     0   0     NaN     NaN      NaN     NaN    NaN      1     NaN    
# # ... with 5 more variables: SimpleAgreement <dbl>, TN_expected <dbl>, TP_expected <dbl>, ChanceAgreement <dbl>, Cohen_kappa <dbl>
# > df_actual_prediction.treshold_roc %>% str #----
# Classes ‘tbl_df’, ‘tbl’, ‘object.threshold_roc’ and 'data.frame':	20 obs. of  24 variables:
#  $ threshold      : num  -Inf 1.5 2.5 3.5 4.5 ...
#  $ TP             : num  10 10 10 10 10 9 9 9 8 8 ...
#  $ FP             : num  10 9 8 7 6 6 5 4 4 3 ...
#  $ FN             : num  0 0 0 0 0 1 1 1 2 2 ...
#  $ TN             : num  0 1 2 3 4 4 5 6 6 7 ...
#  $ total          : num  20 20 20 20 20 20 20 20 20 20 ...
#  $ Sensitivity    : num  1 1 1 1 1 0.9 0.9 0.9 0.8 0.8 ...
#  $ Specificity    : num  0 0.1 0.2 0.3 0.4 0.4 0.5 0.6 0.6 0.7 ...
#  $ PPV            : num  0.5 0.526 0.556 0.588 0.625 ...
#  $ NPV            : num  NaN 1 1 1 1 ...
#  $ TPR            : num  1 1 1 1 1 0.9 0.9 0.9 0.8 0.8 ...
#  $ FPR            : num  1 0.9 0.8 0.7 0.6 0.6 0.5 0.4 0.4 0.3 ...
#  $ F1score        : num  0.667 0.69 0.714 0.741 0.769 ...
#  $ F2score        : num  0.833 0.847 0.862 0.877 0.893 ...
#  $ F.5score       : num  0.556 0.581 0.61 0.641 0.676 ...
#  $ OR             : num  NaN Inf Inf Inf Inf ...
#  $ LRp            : num  1 1.11 1.25 1.43 1.67 ...
#  $ LRn            : num  NaN 0 0 0 0 ...
#  $ phi            : num  NaN 0.229 0.333 0.42 0.5 ...
#  $ SimpleAgreement: num  0.5 0.55 0.6 0.65 0.7 0.65 0.7 0.75 0.7 0.75 ...
#  $ TN_expected    : num  NaN 0.1 0.2 0.3 0.4 ...
#  $ TP_expected    : num  0.5 0.526 0.556 0.588 0.625 ...
#  $ ChanceAgreement: num  NaN 0.01 0.02 0.03 0.04 ...
#  $ Cohen_kappa    : num  NaN 0.545 0.592 0.639 0.687 ...
#  - attr(*, "df_actual_prediction")=Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  2 variables:
#   ..$ actual: num  1 1 1 1 0 1 1 0 1 0 ...
#   ..$ prediction : num  20 19 18 17 16 15 14 13 11.5 11.5 ...


df_actual_prediction.treshold_roc %>% arrange(FPR, TPR) %>% 
    ggplot(aes(x = FPR, y = TPR)) + geom_point() + geom_line() + coord_cartesian(xlim = c(0,1), ylim = c(0,1))


df_actual_prediction.treshold_roc %>% arrange(1 - Specificity, Sensitivity) %>% 
    ggplot(aes(x = 1 - Specificity, y = Sensitivity)) + geom_point() + geom_line() + coord_cartesian(xlim = c(0,1), ylim = c(0,1))




function.threshold_roc.auc = function(object.threshold_roc) {
    # codes borrowed from: https://blog.revolutionanalytics.com/2016/11/calculating-auc.html
    if(!"object.threshold_roc" %in% class(object.threshold_roc)) stop('!"object.threshold_roc" %in% class(object.threshold_roc)')
    tmp_df = object.threshold_roc %>% 
        mutate(
            TPR = Sensitivity
            , FPR = 1 - Specificity
        ) %>% 
        arrange(FPR, TPR) %>% 
        mutate(
            dFPR = c(diff(FPR), 0)
            , dTPR = c(diff(TPR), 0)
        )
    # inputs already sorted, best predictions first 
    tmp_df %>% with(sum(TPR * dFPR) + sum(dTPR * dFPR)/2)
}

df_actual_prediction.treshold_roc %>% function.threshold_roc.auc #----
# > df_actual_prediction.treshold_roc %>% function.threshold_roc.auc #----
# [1] 0.825






#@ -----
function.vec_actual_prediction.auc = function(vec_actual, vec_prediction) {
    if (length(vec_actual) != length(vec_prediction)) {
        warning("length(vec_actual) != length(vec_prediction)")
        out = NA
        attr(out, "ErrorMessage") = "length(vec_actual) != length(vec_prediction)"
    } else {
        out = tibble(threshold = vec_prediction %>% unique %>% sort(decreasing = F) %>% {(. + lag(.))/2} %>% replace_na(-Inf) %>% {c(., Inf)} ) %>%
            mutate(
                TP = threshold %>% map_dbl(function(i) {sum(vec_actual == T & vec_prediction >= i)})
                , FP = threshold %>% map_dbl(function(i) {sum(vec_actual != T & vec_prediction >= i)})
                , FN = threshold %>% map_dbl(function(i) {sum(vec_actual == T & vec_prediction < i)})
                , TN = threshold %>% map_dbl(function(i) {sum(vec_actual != T & vec_prediction < i)})
                , Sensitivity = TP/(TP+FN)
                , Specificity = TN/(TN+FP)
            )
        attributes(out)$vec_actual = vec_actual
        attributes(out)$vec_prediction = vec_prediction
        class(out) = c(class(out), "object.threshold_roc")
    }
    object.threshold_roc = out
    tmp_df = object.threshold_roc %>% 
        mutate(
            TPR = Sensitivity
            , FPR = 1 - Specificity
        ) %>% 
        arrange(FPR, TPR) %>% 
        mutate(
            dFPR = c(diff(FPR), 0)
            , dTPR = c(diff(TPR), 0)
        )
    # inputs already sorted, best predictions first 
    tmp_df %>% with(sum(TPR * dFPR) + sum(dTPR * dFPR)/2)
}

function.vec_actual_prediction.auc(df_actual_prediction$actual, df_actual_prediction$prediction) #-----
# > function.vec_actual_prediction.auc(df_actual_prediction$actual, df_actual_prediction$prediction) #-----
# [1] 0.825
















function.threshold_roc.plot = function(object.threshold_roc) {
    # codes borrowed from: https://blog.revolutionanalytics.com/2016/11/calculating-auc.html
    if(!"object.threshold_roc" %in% class(object.threshold_roc)) stop('!"object.threshold_roc" %in% class(object.threshold_roc)')
    tmp_df = object.threshold_roc %>% arrange(FPR, TPR) %>% mutate(
          dFPR = c(diff(FPR), 0)
          , dTPR = c(diff(TPR), 0)
    )
    
    rectangle <- function(x, y, width, height, density=12, angle=-45, ...) 
        polygon(c(x,x,x+width,x+width), c(y,y+height,y+height,y), 
                density=density, angle=angle, ...)
    
    plot(0:10/10, 0:10/10, type='n', xlab="FPR", ylab="TPR")
    abline(h=0:10/10, col="lightblue")
    abline(v=0:10/10, col="lightblue")
    with(tmp_df, {
        mapply(rectangle, x=FPR, y=0,   
               width=dFPR, height=TPR, col="green", lwd=2)
        mapply(rectangle, x=FPR, y=TPR, 
               width=dFPR, height=dTPR, col="blue", lwd=2)
        
        lines(FPR, TPR, type='b', lwd=3, col="red")
        # mtext(paste0("AUROC = ", sum(TPR * dFPR) + sum(dTPR * dFPR)/2), side = 1)
        text(x = 0.5, y = 0.1, paste0("AUROC = ", sum(TPR * dFPR) + sum(dTPR * dFPR)/2))
        
    })
    
}
# df_actual_prediction %>% function.threshold_roc.plot
# # > df_actual_prediction %>% function.threshold_roc.plot
# #  Show Traceback
# #  
# #  Rerun with Debug
# #  Error in function.threshold_roc.plot(.) : 
# #   !"object.threshold_roc" %in% class(object.threshold_roc) 

df_actual_prediction.treshold_roc %>% function.threshold_roc.plot


#@ end ----
