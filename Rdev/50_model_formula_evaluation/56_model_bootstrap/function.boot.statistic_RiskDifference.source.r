
function.boot.statistic_RiskDifference = function(data, index, glm.formula, glm.weights = NULL, ...) {
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/56_model_bootstrap/function.boot.statistic_RiskDifference.source.r

    # The boot() function calls the statistic function R times. (The first argument should be data & the second argument should be indices?)
    # A function that produces the k statistics to be bootstrapped (k=1 if bootstrapping a single statistic). 
    # The function should include an indices parameter that the boot() function can use to select cases for each replication (see the examples in the text).
    # If there is a set of statistics (for example, a set of regression coefficients), the function should return a vector.
    
    data.resampled = data[index, ]  # allows boot to select sample 
    
    data.resampled.PersonTime.glmOutcome_Exposure_k = glm(formula = glm.formula, family = binomial, data = data.resampled, weights = glm.weights)
    
    RiskDifference.vec = data.resampled %>% select(k) %>% distinct %>% arrange(k) %>% {rbind(mutate(., Exposure = 0), mutate(., Exposure = 1))} %>% 
        mutate(pNoEvent_k = 1 - predict(data.resampled.PersonTime.glmOutcome_Exposure_k, newdata = ., type = "response")) %>% 
        group_by(Exposure) %>% mutate(pNoEvent_k.cumprod = pNoEvent_k %>% cumprod) %>% 
        filter(k == max(k)) %>% 
        select(k, Exposure, pNoEvent_k.cumprod) %>% spread(key = Exposure, value = pNoEvent_k.cumprod) %>% rename(`max(k)` = k, pNoEvent_k.cumprod0 = `0`, pNoEvent_k.cumprod1 = `1`) %>% mutate(RiskDifference = pNoEvent_k.cumprod1-pNoEvent_k.cumprod0) %>% unlist #----

    out = c(RiskDifference.vec, exp(coef(data.resampled.PersonTime.glmOutcome_Exposure_k)))  # coef(fit): named vector

    out
}


#@ nIteration = 500 =====
library(boot)
data = analyticDF2797.ipw.PersonTime7 %>% select(Dk_plus1, Exposure, k, StabilizedWeight)
glm.formula = Dk_plus1 ~ Exposure * (k + I(k^2))
glm.weights = data$StabilizedWeight
nIteration = 500  # 4Mb for 10 iterations -> 400Mb for 1000 iterations?
set.seed(1)
t0 = Sys.time()
boot.output = boot(
    data = data
    , statistic = function.boot.statistic_RiskDifference, glm.formula = glm.formula,  glm.weights = glm.weights, coef.exp = T
    , R = nIteration
)
Sys.time() - t0  # 9 sec for 10 iterations -> 9000/60/60 sec = 2.5 hrs for 1000 iterations? 
warnings()
# There were 50 or more warnings (use warnings() to see the first 50)
# > Sys.time() - t0  # 9 sec for 10 iterations -> 9000/60/60 sec = 2.5 hrs for 1000 iterations? 
# Time difference of 5 mins
# > warnings()
# Warning messages:
# 1: In eval(family$initialize) : non-integer #successes in a binomial glm!



boot.output$t0
boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)
boot.output
boot.output %>% str #----
# > boot.output$t0
#              max(k) pNoEvent_k.cumprod0 pNoEvent_k.cumprod1      RiskDifference         (Intercept)            Exposure                   k              I(k^2)          Exposure:k     Exposure:I(k^2) 
#        40.000000000         0.573045080         0.696292010         0.123246930         0.009855443         0.332824553         0.895475841         1.004014857         1.038979833         0.999527466 
# > boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)
#              max(k) pNoEvent_k.cumprod0 pNoEvent_k.cumprod1      RiskDifference         (Intercept)            Exposure                   k              I(k^2)          Exposure:k     Exposure:I(k^2) 
#        40.000000000         0.576556930         0.685683786         0.109126856         0.009775713         0.356738876         0.895381173         1.004016970         1.042598056         0.999451570 
# > boot.output
# 
# ORDINARY NONPARAMETRIC BOOTSTRAP
# 
# 
# Call:
# boot(data = data, statistic = function.boot.statistic_RiskDifference, 
#     R = nIteration, glm.formula = glm.formula, glm.weights = glm.weights, 
#     coef.exp = T)
# 
# 
# Bootstrap Statistics :
#          original        bias     std. error
# t1*  40.000000000  0.000000e+00 0.0000000000
# t2*   0.573045080  3.511850e-03 0.0125637383
# t3*   0.696292010 -1.060822e-02 0.0240055076
# t4*   0.123246930 -1.412007e-02 0.0270655026
# t5*   0.009855443 -7.972915e-05 0.0007487581
# t6*   0.332824553  2.391432e-02 0.1027704698
# t7*   0.895475841 -9.466814e-05 0.0044124618
# t8*   1.004014857  2.112864e-06 0.0001328992
# t9*   1.038979833  3.618223e-03 0.0203703832
# t10*  0.999527466 -7.589608e-05 0.0003991006
# > boot.output %>% str #----
# List of 11
#  $ t0       : Named num [1:10] 40 0.57305 0.69629 0.12325 0.00986 ...
#   ..- attr(*, "names")= chr [1:10] "max(k)" "pNoEvent_k.cumprod0" "pNoEvent_k.cumprod1" "RiskDifference" ...
#  $ t        : num [1:1000, 1:10] 40 40 40 40 40 40 40 40 40 40 ...
#  $ R        : num 1000
#  $ data     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	95932 obs. of  4 variables:
#   ..$ Dk_plus1        : logi [1:95932] FALSE FALSE FALSE FALSE FALSE FALSE ...
#   ..$ Exposure        : num [1:95932] 0 0 0 0 0 0 0 0 0 0 ...
#   ..$ k               : num [1:95932] 0 1 2 3 4 5 6 7 8 9 ...
#   ..$ StabilizedWeight: num [1:95932] 0.95 0.95 0.95 0.95 0.95 ...
#  $ seed     : int [1:626] 403 624 -169270483 -442010614 -603558397 -222347416 1489374793 865871222 1734802815 98005428 ...
#  $ statistic:function (data, index, glm.formula, glm.weights = NULL, ...)  
#   ..- attr(*, "srcref")= 'srcref' int [1:8] 1 42 20 1 42 1 1 20
#   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000213b48278a0> 
#  $ sim      : chr "ordinary"
#  $ call     : language boot(data = data, statistic = function.boot.statistic_RiskDifference, R = nIteration, glm.formula = glm.formula, | __truncated__
#  $ stype    : chr "i"
#  $ strata   : num [1:95932] 1 1 1 1 1 1 1 1 1 1 ...
#  $ weights  : num [1:95932] 1.04e-05 1.04e-05 1.04e-05 1.04e-05 1.04e-05 ...
#  - attr(*, "class")= chr "boot"
#  - attr(*, "boot_type")= chr "boot"






#@ bootstrap confidence interval (manual) ----
boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} #----
boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% {.$`max(k)`} %>% as.factor %>% summary #-----
# > boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} #----
# # A tibble: 1,000 x 10
#    `max(k)` pNoEvent_k.cumprod0 pNoEvent_k.cumprod1 RiskDifference `(Intercept)` Exposure     k `I(k^2)` `Exposure:k` `Exposure:I(k^2)`
#       <dbl>               <dbl>               <dbl>          <dbl>         <dbl>    <dbl> <dbl>    <dbl>        <dbl>             <dbl>
#  1       40               0.603               0.687         0.0848       0.00980    0.322 0.893     1.00         1.04             1.000
#  2       40               0.593               0.632         0.0396       0.00833    0.368 0.899     1.00         1.07             0.999
#  3       40               0.590               0.680         0.0894       0.00996    0.340 0.897     1.00         1.03             1.000
#  4       40               0.562               0.680         0.118        0.00873    0.363 0.902     1.00         1.05             0.999
#  5       40               0.574               0.684         0.109        0.00927    0.451 0.892     1.00         1.02             1.000
#  6       40               0.552               0.696         0.144        0.0101     0.465 0.894     1.00         1.04             0.999
#  7       40               0.618               0.671         0.0529       0.00976    0.336 0.898     1.00         1.04             1.000
#  8       40               0.586               0.695         0.108        0.00850    0.430 0.900     1.00         1.04             0.999
#  9       40               0.556               0.689         0.133        0.0106     0.277 0.890     1.00         1.06             0.999
# 10       40               0.572               0.662         0.0895       0.00901    0.295 0.899     1.00         1.06             0.999
# # ... with 990 more rows
# > boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% {.$`max(k)`} %>% as.factor %>% summary #-----
#   40 
# 1000 

boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% quantile(probs = c(0.025, 0.975)) #----
boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% sort %>% {cbind(.[trunc(25/2) + 0:1], .[trunc(975/2) + 0:1])}
# > boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% quantile(probs = c(0.025, 0.975)) #----
#      2.5%     97.5% 
# 0.0554281 0.1617393 
# > boot.output %>% {set_names(as.tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% sort %>% {cbind(.[c(25, 26)], .[c(975, 976)])}
#            [,1]      [,2]
# [1,] 0.05538754 0.1617143
# [2,] 0.05542914 0.1627116





#@ analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci =====
analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci = 
    boot.output %>% {rbind( as.tibble(as.list(.$t0)), map_df( {set_names(as.tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% 
    mutate(`1-pNoEvent_k.cumprod0` = 1-pNoEvent_k.cumprod0[c(1,3,2)], `1-pNoEvent_k.cumprod1` = 1-pNoEvent_k.cumprod1[c(1,3,2)], `-RiskDifference` = -RiskDifference[c(1,3,2)]) %>% 
    t %>% as.data.frame %>% rownames_to_column %>% 
    transmute(
        rowname = rowname
        , `estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(V1,2)), " (", sprintf("%.2f",round(V2,2)), ", ", sprintf("%.2f",round(V3,2)), ")")
        , `estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(V1,3)), " (", sprintf("%.3f",round(V2,3)), ", ", sprintf("%.3f",round(V3,3)), ")")
        , `exp(coef(.))` = V1,  `2.5 %` = V2, `97.5 %` = V3
    ) %>% as.tibble #----
analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci
# > analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci
# # A tibble: 13 x 6
#    rowname               `estimate (95% CI) %.2f` `estimate (95% CI) %.3f` `exp(coef(.))`   `2.5 %` `97.5 %`
#    <chr>                 <chr>                    <chr>                             <dbl>     <dbl>    <dbl>
#  1 max(k)                40.00 (40.00, 40.00)     40.000 (40.000, 40.000)        40        40        40     
#  2 pNoEvent_k.cumprod0   0.57 (0.55, 0.60)        0.573 (0.551, 0.602)            0.573     0.551     0.602 
#  3 pNoEvent_k.cumprod1   0.70 (0.64, 0.73)        0.696 (0.640, 0.733)            0.696     0.640     0.733 
#  4 RiskDifference        0.12 (0.06, 0.16)        0.123 (0.055, 0.163)            0.123     0.0554    0.163 
#  5 (Intercept)           0.01 (0.01, 0.01)        0.010 (0.008, 0.011)            0.00986   0.00833   0.0113
#  6 Exposure              0.33 (0.18, 0.58)        0.333 (0.183, 0.577)            0.333     0.183     0.577 
#  7 k                     0.90 (0.89, 0.90)        0.895 (0.887, 0.904)            0.895     0.887     0.904 
#  8 I(k^2)                1.00 (1.00, 1.00)        1.004 (1.004, 1.004)            1.00      1.00      1.00  
#  9 Exposure:k            1.04 (1.00, 1.08)        1.039 (1.005, 1.084)            1.04      1.00      1.08  
# 10 Exposure:I(k^2)       1.00 (1.00, 1.00)        1.000 (0.999, 1.000)            1.000     0.999     1.00  
# 11 1-pNoEvent_k.cumprod0 0.43 (0.40, 0.45)        0.427 (0.398, 0.449)            0.427     0.398     0.449 
# 12 1-pNoEvent_k.cumprod1 0.30 (0.27, 0.36)        0.304 (0.267, 0.360)            0.304     0.267     0.360 
# 13 -RiskDifference       -0.12 (-0.16, -0.06)     -0.123 (-0.163, -0.055)        -0.123    -0.163    -0.0554

#@ boot.output %>% plot(index = which(names(.$t0) == "RiskDifference")) -----
boot.output %>% plot(index = which(names(.$t0) == "RiskDifference"))




#@ end -----
write_rds(boot.output, "analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.rds", "xz", compression = 9)
openxlsx::write.xlsx(
    analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci
    , "analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci.xlsx", asTable = T
)

