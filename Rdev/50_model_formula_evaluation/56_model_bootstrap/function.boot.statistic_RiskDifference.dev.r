

# analyticDF2797.PersonTime7.glmOutcome_Exposure_k_Covariates.boot.ci.list_PrimaryOutcomes from (don) -debug3.r
function.boot.statistic_RiskDifference = function(data, index, glm.formula = Dk_plus1 ~ Exposure * (k + I(k^2)) + ., glm.weights = NULL, Interval = 1, ...) {
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/56_model_bootstrap/function.boot.statistic_RiskDifference.dev.r

    # The boot() function calls the statistic function R times. (The first argument should be data & the second argument should be indices?)
    # A function that produces the k statistics to be bootstrapped (k=1 if bootstrapping a single statistic).
    # The function should include an indices parameter that the boot() function can use to select cases for each replication (see the examples in the text).
    # If there is a set of statistics (for example, a set of regression coefficients), the function should return a vector.
    
    assign("globalenv.counter", globalenv.counter + 1, envir = globalenv())
    cat(paste0(globalenv.counter, ".."))
    # warning(globalenv.counter)

    # data = data %>% mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric)  # this should be done prior to running boot()
    data.resampled = data[index, ]  # allows boot to select sample

    data.resampled.PersonTime =
        data.resampled %>%
        mutate(PeriodSeq = Time2Censor %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest %>%
        mutate(
            # Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") %>% as.factor
            # , time = PeriodSeq * Interval
            # , event = (PrimaryOutcome123456 == 1) & (PrimaryOutcome123456.time <= PeriodSeq * Interval)
            # ,
            k = PeriodSeq - 1  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
            , Dk_plus1 = (SpecificOutcome == 1) & (Time2SpecificOutcome <= PeriodSeq * Interval)  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
        ) %>% select(k, Dk_plus1, Exposure, everything(), -PeriodSeq, -Time2Censor, -Time2SpecificOutcome, -SpecificOutcome)

    data.resampled.PersonTime.glmOutcome_Exposure_k_Covariates = glm(formula = glm.formula, family = binomial, data = data.resampled.PersonTime, weights = glm.weights)
    
    RiskDifference.vec =
        expand.grid(k = 1:max(ceiling(data$Time2Censor/Interval)) - 1, Exposure = 0:1) %>%
        cbind(
            # data.resampled %>% # mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>%   # this should be done prior to running boot()
            data %>% # mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>%   # this should be done prior to running boot()
                select(-Time2Censor # , Censor
                       , -Time2SpecificOutcome, -SpecificOutcome
                       , -Exposure) %>%
                summarise_all(median)
        ) %>%
        mutate(pNoEvent_k = 1 - predict(data.resampled.PersonTime.glmOutcome_Exposure_k_Covariates, newdata = ., type = "response")) %>%
        group_by(Exposure) %>% mutate(pNoEvent_k.cumprod = pNoEvent_k %>% cumprod) %>%
        filter(k == max(k)) %>%
        # select(k, Exposure, pNoEvent_k.cumprod, everything(), -pNoEvent_k) %>% spread(key = Exposure, value = pNoEvent_k.cumprod) %>%
        select(k, Exposure, pNoEvent_k.cumprod) %>% spread(key = Exposure, value = pNoEvent_k.cumprod) %>%
        rename(`max(k)` = k, pNoEvent_k.cumprod0 = `0`, pNoEvent_k.cumprod1 = `1`) %>% mutate(RiskDifference = pNoEvent_k.cumprod1-pNoEvent_k.cumprod0) %>%
        unlist

    out = c(RiskDifference.vec, exp(coef(data.resampled.PersonTime.glmOutcome_Exposure_k_Covariates)))  # coef(fit): named vector
    # cat(paste0("#", length(out), "\n"))
    
    # if(!exists("globalenv.out.length", envir = globalenv())) {
    #     assign("globalenv.out.length", length(out), envir = globalenv())
    # } else if(globalenv.out.length != length(out)) browser()
    
    out
}



#@ nIteration = 20 =====
library(boot)
data = analyticDF2797 %>% mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>%
    mutate(
        Time2Censor = PrimaryOutcome123456.time
        # , Censor = PrimaryOutcome123456
        , Time2SpecificOutcome = PrimaryOutcome123456.time
        , SpecificOutcome = PrimaryOutcome123456
    ) %>%
    select(
        Time2Censor # , Censor
        , Time2SpecificOutcome, SpecificOutcome
        , Exposure
        , Age_at_lmp, `year(lmp)`
        , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset
    )
glm.formula = Dk_plus1 ~ Exposure * (k + I(k^2)) + .
# glm.weights = data$StabilizedWeight
glm.weights = NULL
# nIteration = 10  # 4Mb for 10 iterations -> 400Mb for 1000 iterations?
nIteration = 20  # 4Mb for 10 iterations -> 400Mb for 1000 iterations?
set.seed(1)
t0 = Sys.time()
globalenv.counter = -1
boot.output = boot(
    data = data, Interval = 7
    , statistic = function.boot.statistic_RiskDifference, glm.formula = glm.formula,  glm.weights = glm.weights, coef.exp = T
    , R = nIteration
    # , parallel = "multicore", ncpus = 4
)
Sys.time() - t0  # 9 sec for 10 iterations -> 9000/60/60 sec = 2.5 hrs for 1000 iterations?
warnings()
#@ bootstrap confidence interval (manual) ----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% quantile(probs = c(0.025, 0.975)) #----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% sort %>% {cbind(.[trunc(0.025*length(.)) + 1:2], .[trunc(0.975*length(.)) + 0:1])} #----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$`max(k)`} %>% as.factor %>% summary #-----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% str #----
bind_rows(boot.output$t0, boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)) %>% select(pNoEvent_k.cumprod0, pNoEvent_k.cumprod1, RiskDifference, Exposure, `Exposure:k`, `Exposure:I(k^2)`) #----
boot.output #----
boot.output %>% str(max.level = 1) #----
# 0..1..2..3..4..5..6..7..8..9..10..11..12..13..14..15..16..17..18..19..20..> Sys.time() - t0  # 9 sec for 10 iterations -> 9000/60/60 sec = 2.5 hrs for 1000 iterations?
# Time difference of 27.27654 secs
# > warnings()
# Warning messages:
# 1: In max(vapply(X = df_col, FUN = nchar_type, FUN.VALUE = numeric(1),  ... :
#   no non-missing arguments to max; returning -Inf
# 2: In max(vapply(X = df_col, FUN = nchar_type, FUN.VALUE = numeric(1),  ... :
#   no non-missing arguments to max; returning -Inf
# 3: In max(vapply(X = df_col, FUN = nchar_type, FUN.VALUE = numeric(1),  ... :
#   no non-missing arguments to max; returning -Inf
# 4: In max(vapply(X = df_col, FUN = nchar_type, FUN.VALUE = numeric(1),  ... :
#   no non-missing arguments to max; returning -Inf
# > 
# > #@ bootstrap confidence interval (manual) ----
# > boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% quantile(probs = c(0.025, 0.975)) #----
#       2.5%      97.5% 
# 0.06483304 0.12071529 
# > boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% sort %>% {cbind(.[trunc(0.025*length(.)) + 1:2], .[trunc(0.975*length(.)) + 0:1])} #----
#            [,1]      [,2]
# [1,] 0.05131718 0.1148298
# [2,] 0.07977163 0.1260402
# > boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$`max(k)`} %>% as.factor %>% summary #-----
# 40 
# 20 
# > boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  22 variables:
#  $ max(k)                                   : num  40 40 40 40 40 40 40 40 40 40 ...
#  $ pNoEvent_k.cumprod0                      : num  0.645 0.652 0.678 0.677 0.661 ...
#  $ pNoEvent_k.cumprod1                      : num  0.731 0.767 0.789 0.765 0.712 ...
#  $ RiskDifference                           : num  0.0857 0.1148 0.1108 0.0877 0.0513 ...
#  $ (Intercept)                              : num  1.98e-25 1.14e-19 7.71e-14 6.38e-29 1.42e-17 ...
#  $ Exposure                                 : num  0.343 0.144 0.318 0.319 0.38 ...
#  $ k                                        : num  0.888 0.892 0.895 0.897 0.892 ...
#  $ I(k^2)                                   : num  1 1 1 1 1 ...
#  $ Age_at_lmp                               : num  1.03 1.01 1.03 1.01 1.02 ...
#  $ `year(lmp)`                              : num  1.03 1.02 1.01 1.03 1.02 ...
#  $ t_N180_42.ICD9_CKD_exceptARF             : num  2.207 0.748 0.894 1.388 1.419 ...
#  $ t_N180_42.ICD9_HTN.Superset              : num  1.45 1.57 1.38 1.5 1.49 ...
#  $ t_N180_42.ICD9_Asthma                    : num  0.765 0.815 0.834 0.865 0.504 ...
#  $ t_N180_42.ICD9_Thyroid.Superset          : num  1.19 1.08 1.17 1.01 1.21 ...
#  $ t_N180_42.ICD9_Depression.Superset       : num  0.982 0.866 1.259 1.041 1.2 ...
#  $ t_N180_42.ICD9_SubstanceAbuse            : num  1.329 1.221 0.835 1.06 1.066 ...
#  $ t_N180_42.ICD9_Bipolar                   : num  0.886 1.124 0.697 0.963 0.771 ...
#  $ t_N180_42.ICD9_Anxiety                   : num  1.52 1.13 1.38 1.04 1.09 ...
#  $ t_N180_42.ICD9_Acne                      : num  0.209 0.651 0.45 0.662 0.383 ...
#  $ t_N180_42.ICD9_CPT_PregnancyTest.Superset: num  1.46 1.56 1.89 1.85 1.69 ...
#  $ Exposure:k                               : num  1.05 1.09 1.03 1.05 1.03 ...
#  $ Exposure:I(k^2)                          : num  0.999 0.999 1 0.999 1 ...
# > bind_rows(boot.output$t0, boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)) %>% select(pNoEvent_k.cumprod0, pNoEvent_k.cumprod1, RiskDifference, Exposure, `Exposure:k`, `Exposure:I(k^2)`) #----
# # A tibble: 2 x 6
#   pNoEvent_k.cumprod0 pNoEvent_k.cumprod1 RiskDifference Exposure `Exposure:k` `Exposure:I(k^2)`
#                 <dbl>               <dbl>          <dbl>    <dbl>        <dbl>             <dbl>
# 1               0.657               0.762         0.105     0.339         1.04             1.000
# 2               0.664               0.759         0.0951    0.347         1.04             1.000
# > boot.output #----
# 
# ORDINARY NONPARAMETRIC BOOTSTRAP
# 
# 
# Call:
# boot(data = data, statistic = function.boot.statistic_RiskDifference, 
#     R = nIteration, Interval = 7, glm.formula = glm.formula, 
#     glm.weights = glm.weights, coef.exp = T)
# 
# 
# Bootstrap Statistics :
#          original        bias     std. error
# t1*  4.000000e+01  0.000000e+00 0.000000e+00
# t2*  6.573246e-01  7.032197e-03 1.380559e-02
# t3*  7.622908e-01 -2.852054e-03 2.001808e-02
# t4*  1.049662e-01 -9.884251e-03 1.635798e-02
# t5*  2.419275e-39  5.292805e+06 2.367015e+07
# t6*  3.388790e-01  8.221787e-03 8.626298e-02
# t7*  8.946474e-01 -6.547984e-04 4.692863e-03
# t8*  1.004069e+00 -9.871162e-06 1.518756e-04
# t9*  1.018015e+00  9.031684e-04 6.973439e-03
# t10* 1.042311e+00 -3.974469e-03 2.461542e-02
# t11* 7.632357e-01  1.566441e-01 5.419520e-01
# t12* 1.458356e+00  4.705841e-02 8.814592e-02
# t13* 7.022655e-01  8.231101e-03 1.372621e-01
# t14* 1.053798e+00  5.248046e-02 9.392220e-02
# t15* 9.874735e-01  8.620280e-02 1.806211e-01
# t16* 1.143805e+00  2.618509e-02 2.294632e-01
# t17* 9.421607e-01 -5.627713e-02 2.062355e-01
# t18* 1.238583e+00 -2.095292e-02 2.377621e-01
# t19* 4.391956e-01  1.289861e-02 1.319285e-01
# t20* 1.697409e+00 -1.221973e-02 1.119179e-01
# t21* 1.038660e+00  4.218374e-04 2.008776e-02
# t22* 9.995132e-01  4.065091e-05 3.577571e-04
# > boot.output %>% str(max.level = 1) #----
# List of 11
#  $ t0       : Named num [1:22] 4.00e+01 6.57e-01 7.62e-01 1.05e-01 2.42e-39 ...
#   ..- attr(*, "names")= chr [1:22] "max(k)" "pNoEvent_k.cumprod0" "pNoEvent_k.cumprod1" "RiskDifference" ...
#  $ t        : num [1:20, 1:22] 40 40 40 40 40 40 40 40 40 40 ...
#  $ R        : num 20
#  $ data     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2797 obs. of  16 variables:
#  $ seed     : int [1:626] 403 624 -169270483 -442010614 -603558397 -222347416 1489374793 865871222 1734802815 98005428 ...
#  $ statistic:function (data, index, glm.formula = Dk_plus1 ~ Exposure * (k + I(k^2)) + ., glm.weights = NULL, Interval = 1, ...)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 42 56 1 42 1 1 56
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x15f8efd8> 
#  $ sim      : chr "ordinary"
#  $ call     : language boot(data = data, statistic = function.boot.statistic_RiskDifference, R = nIteration, Interval = 7, glm.formula =| __truncated__
#  $ stype    : chr "i"
#  $ strata   : num [1:2797] 1 1 1 1 1 1 1 1 1 1 ...
#  $ weights  : num [1:2797] 0.000358 0.000358 0.000358 0.000358 0.000358 ...
#  - attr(*, "class")= chr "boot"
#  - attr(*, "boot_type")= chr "boot"



#@ nIteration = 500 =====
library(boot)
data = analyticDF2797 %>% mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>%
    mutate(
        Time2Censor = PrimaryOutcome123456.time
        # , Censor = PrimaryOutcome123456
        , Time2SpecificOutcome = PrimaryOutcome123456.time
        , SpecificOutcome = PrimaryOutcome123456
    ) %>%
    select(
        Time2Censor # , Censor
        , Time2SpecificOutcome, SpecificOutcome
        , Exposure
        , Age_at_lmp, `year(lmp)`
        , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset
    )
glm.formula = Dk_plus1 ~ Exposure * (k + I(k^2)) + .
# glm.weights = data$StabilizedWeight
glm.weights = NULL
# nIteration = 10  # 4Mb for 10 iterations -> 400Mb for 1000 iterations?
nIteration = 500  # 4Mb for 10 iterations -> 400Mb for 1000 iterations?
set.seed(1)
t0 = Sys.time()
globalenv.counter = -1
boot.output = boot(
    data = data, Interval = 7
    , statistic = function.boot.statistic_RiskDifference, glm.formula = glm.formula,  glm.weights = glm.weights, coef.exp = T
    , R = nIteration
    , parallel = "multicore", ncpus = 4
)
Sys.time() - t0  # 9 sec for 10 iterations -> 9000/60/60 sec = 2.5 hrs for 1000 iterations?
warnings()
#@ bootstrap confidence interval (manual) ----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% quantile(probs = c(0.025, 0.975)) #----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$RiskDifference} %>% unlist %>% sort %>% {cbind(.[trunc(0.025*length(.)) + 1:2], .[trunc(0.975*length(.)) + 0:1])} #----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% {.$`max(k)`} %>% as.factor %>% summary #-----
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% str #----
bind_rows(boot.output$t0, boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)) %>% select(pNoEvent_k.cumprod0, pNoEvent_k.cumprod1, RiskDifference, Exposure, `Exposure:k`, `Exposure:I(k^2)`) #----
boot.output #----
boot.output %>% str(max.level = 1) #----




                                               
                                               
                                               
                                               
                                               
                                               
                                               
                                               
                                               
                                               
#@ ======
norm.inter <- function(t,alpha)
    # Interpolation on the normal quantile scale. 
    # For a non-integer order statistic this function interpolates between the surrounding order statistics using the normal quantile scale. 
    # See equation 5.8 of Davison and Hinkley (1997)
{
    t <- t[is.finite(t)]
    R <- length(t)
    rk <- (R+1)*alpha
    if (!all(rk>1 & rk<R))
        warning("extreme order statistics used as endpoints")
    k <- trunc(rk)
    inds <- seq_along(k)
    out <- inds
    kvs <- k[k>0 & k<R]
    tstar <- sort(t, partial = sort(union(c(1, R), c(kvs, kvs+1))))
    ints <- (k == rk)
    if (any(ints)) out[inds[ints]] <- tstar[k[inds[ints]]]
    out[k == 0] <- tstar[1L]
    out[k == R] <- tstar[R]
    not <- function(v) xor(rep(TRUE,length(v)),v)
    temp <- inds[not(ints) & k != 0 & k != R]
    temp1 <- qnorm(alpha[temp])
    temp2 <- qnorm(k[temp]/(R+1))
    temp3 <- qnorm((k[temp]+1)/(R+1))
    tk <- tstar[k[temp]]
    tk1 <- tstar[k[temp]+1L]
    out[temp] <- tk + (temp1-temp2)/(temp3-temp2)*(tk1 - tk)
    cbind(round(rk, 2), out)
}

#@ analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci =====
analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.RiskDifference.boot.ci = 
    boot.output %>% {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% 
    mutate(`1-pNoEvent_k.cumprod0` = 1-pNoEvent_k.cumprod0[c(1,3,2)], `1-pNoEvent_k.cumprod1` = 1-pNoEvent_k.cumprod1[c(1,3,2)], `-RiskDifference` = -RiskDifference[c(1,3,2)]) %>% 
    t %>% as.data.frame %>% rownames_to_column %>% 
    transmute(
        rowname = rowname
        , `estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(V1,2)), " (", sprintf("%.2f",round(V2,2)), ", ", sprintf("%.2f",round(V3,2)), ")")
        , `estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(V1,3)), " (", sprintf("%.3f",round(V2,3)), ", ", sprintf("%.3f",round(V3,3)), ")")
        , `exp(coef(.))` = V1,  `2.5 %` = V2, `97.5 %` = V3
    ) %>% as_tibble #----
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

