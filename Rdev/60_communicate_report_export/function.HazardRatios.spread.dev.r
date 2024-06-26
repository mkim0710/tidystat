# MarketScan PREGCOHORT Step62 Regression CompositeOutcome time interaction coxph 190720.pptm
# analyticDF2797.coxphTimeOutcome_Exposure_tt from analyticDF2797.r
# analyticDF2797.coxphTimeOutcome_Exposure from analyticDF2797.r
# OneDrive - Harvard University\[Note]\[[Stat]] CRAN R\[[[Data Analysis]]] Statistics\[[survival]] library(survival)\CRAN) timedep - tt().pdf








#@@@@ For a function, see the link below~!!!! ................................................................................
# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.tbl_varname_level_HRCI.dev.r








#@@@@ A quick & dirty way below~!!! ................................................................................
#@ analyticDF2797.coxphTimeOutcome_Exposure_tt ====
library(survival)
data = analyticDF2797 %>% mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>% 
    mutate(Time2Event = PrimaryOutcome123456.time, Event = PrimaryOutcome123456
           # , Time2Censor = PrimaryOutcome123456.time #, Censor = PrimaryOutcome123456
    ) %>% 
    select(Time2Event, Event
           , Exposure
           # , Age_at_lmp, `year(lmp)`
           # , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset 
    )
analyticDF2797.coxphTimeOutcome_Exposure_tt = 
    coxph(formula = Surv(time=Time2Event,event=Event) ~ . + tt(Exposure), data = data, method = "breslow"
          , tt = function(x, t, ...) {x * log(t+1)})
analyticDF2797.coxphTimeOutcome_Exposure_tt %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) %>% as.data.frame %>% rownames_to_column |> as_tibble() #----
analyticDF2797.coxphTimeOutcome_Exposure_tt %>% cox.zph #----
analyticDF2797.coxphTimeOutcome_Exposure_tt %>% cox.zph %>% plot(var = c("Exposure"))
analyticDF2797.coxphTimeOutcome_Exposure_tt %>% cox.zph %>% {survminer::ggcoxzph(., var = c("Exposure"), font.main = 12, caption = "")}
# > analyticDF2797.coxphTimeOutcome_Exposure_tt %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) %>% as.data.frame %>% rownames_to_column |> as_tibble() #----
# # A tibble: 2 x 5
#   rowname      `exp(coef(.))` `2.5 %` `97.5 %` `Pr(>|z|)`
#   <chr>                 <dbl>   <dbl>    <dbl>      <dbl>
# 1 Exposure               0.1     0.02     0.53       0.01
# 2 tt(Exposure)           1.45    1.05     1.99       0.02
# > analyticDF2797.coxphTimeOutcome_Exposure_tt %>% cox.zph #----
#                 rho chisq        p
# Exposure     -0.119  12.8 0.000339
# tt(Exposure)  0.118  12.6 0.000376
# GLOBAL           NA  12.8 0.001625



#@ analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates ====
library(survival)
data = analyticDF2797 %>% mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>% 
    mutate(Time2Event = PrimaryOutcome123456.time, Event = PrimaryOutcome123456
           # , Time2Censor = PrimaryOutcome123456.time #, Censor = PrimaryOutcome123456
    ) %>% 
    select(Time2Event, Event
           , Exposure
           , Age_at_lmp, `year(lmp)`
           , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset
    )
analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates = 
    coxph(formula = Surv(time=Time2Event,event=Event) ~ . + tt(Exposure), data = data, method = "breslow"
          , tt = function(x, t, ...) {x * log(t+1)})
analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) %>% as.data.frame %>% rownames_to_column |> as_tibble() #----
analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% cox.zph #----
analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% cox.zph %>% plot(var = c("Exposure"))
analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% cox.zph %>% {survminer::ggcoxzph(., var = c("Exposure"), font.main = 12, caption = "")}
# > analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) %>% as.data.frame %>% rownames_to_column |> as_tibble() #----
# # A tibble: 14 x 5
#    rowname                                   `exp(coef(.))` `2.5 %` `97.5 %` `Pr(>|z|)`
#    <chr>                                              <dbl>   <dbl>    <dbl>      <dbl>
#  1 Exposure                                            0.1     0.02     0.51       0.01
#  2 Age_at_lmp                                          1.02    1        1.03       0.02
#  3 `year(lmp)`                                         1.04    0.98     1.1        0.17
#  4 t_N180_42.ICD9_CKD_exceptARF                        0.79    0.25     2.49       0.69
#  5 t_N180_42.ICD9_HTN.Superset                         1.43    1.24     1.66       0   
#  6 t_N180_42.ICD9_Asthma                               0.71    0.48     1.05       0.09
#  7 t_N180_42.ICD9_Thyroid.Superset                     1.06    0.86     1.29       0.6 
#  8 t_N180_42.ICD9_Depression.Superset                  0.97    0.69     1.36       0.86
#  9 t_N180_42.ICD9_SubstanceAbuse                       1.14    0.76     1.72       0.53
# 10 t_N180_42.ICD9_Bipolar                              0.96    0.6      1.51       0.85
# 11 t_N180_42.ICD9_Anxiety                              1.24    0.91     1.68       0.18
# 12 t_N180_42.ICD9_Acne                                 0.45    0.19     1.08       0.07
# 13 t_N180_42.ICD9_CPT_PregnancyTest.Superset           1.63    1.43     1.86       0   
# 14 tt(Exposure)                                        1.44    1.05     1.98       0.03
# > analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% cox.zph #----
#                                                rho   chisq        p
# Exposure                                  -0.11820 12.7201 0.000362
# Age_at_lmp                                -0.07712  5.9328 0.014862
# `year(lmp)`                                0.03773  1.3183 0.250890
# t_N180_42.ICD9_CKD_exceptARF               0.02088  0.3835 0.535730
# t_N180_42.ICD9_HTN.Superset                0.02402  0.5367 0.463813
# t_N180_42.ICD9_Asthma                     -0.01562  0.2194 0.639513
# t_N180_42.ICD9_Thyroid.Superset           -0.01806  0.2934 0.588038
# t_N180_42.ICD9_Depression.Superset         0.03436  1.2669 0.260356
# t_N180_42.ICD9_SubstanceAbuse              0.00457  0.0191 0.890209
# t_N180_42.ICD9_Bipolar                    -0.04121  1.7978 0.179975
# t_N180_42.ICD9_Anxiety                    -0.01703  0.2664 0.605790
# t_N180_42.ICD9_Acne                        0.02477  0.5548 0.456350
# t_N180_42.ICD9_CPT_PregnancyTest.Superset  0.01002  0.0926 0.760889
# tt(Exposure)                               0.11692 12.4980 0.000407
# GLOBAL                                          NA 23.6813 0.050047




#@ HazardRatios.list_df =====
HazardRatios.list_df = list(
    coxphTimeOutcome_Exposure_tt = analyticDF2797.coxphTimeOutcome_Exposure_tt %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% as.data.frame %>% rownames_to_column |> as_tibble() #----
    , coxphTimeOutcome_Exposure_tt_Covariates = analyticDF2797.coxphTimeOutcome_Exposure_tt_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% as.data.frame %>% rownames_to_column |> as_tibble() #----
) %>% map(function(df) {
    df %>% transmute(
        rowname = rowname
        , `estimate (95% CI) %.2f` = paste0(sprintf("%3.2f",round(`exp(coef(.))`,2)), " (", sprintf("%3.2f",round(`2.5 %`,2)), ", ", sprintf("%3.2f",round(`97.5 %`,2)), ")")
        , `estimate (95% CI) %.3f` = paste0(sprintf("%3.3f",round(`exp(coef(.))`,3)), " (", sprintf("%3.3f",round(`2.5 %`,3)), ", ", sprintf("%3.3f",round(`97.5 %`,3)), ")")
        , `percent (95% CI)` = paste0(sprintf("%2.1f",round(`exp(coef(.))`*100,1)), "% (", sprintf("%2.1f",round(`2.5 %`*100,1)), "%, ", sprintf("%2.1f",round(`97.5 %`*100,1)), "%)")
        , `exp(coef(.))` = `exp(coef(.))`,  `2.5 %` = `2.5 %`, `97.5 %` = `97.5 %`, `Pr(>|z|)` = `Pr(>|z|)`
    ) |> as_tibble() #----
})

HazardRatios.list_df |> str() #----
# > HazardRatios.list_df |> str() #----
# List of 2
#  $ coxphTimeOutcome_Exposure_tt           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  8 variables:
#   ..$ rowname               : chr [1:2] "Exposure" "tt(Exposure)"
#   ..$ estimate (95% CI) %.2f: chr [1:2] "0.10 (0.02, 0.53)" "1.45 (1.05, 1.99)"
#   ..$ estimate (95% CI) %.3f: chr [1:2] "0.102 (0.019, 0.533)" "1.446 (1.050, 1.990)"
#   ..$ percent (95% CI)      : chr [1:2] "10.2% (1.9%, 53.3%)" "144.6% (105.0%, 199.0%)"
#   ..$ exp(coef(.))          : num [1:2] 0.102 1.446
#   ..$ 2.5 %                 : num [1:2] 0.0194 1.0501
#   ..$ 97.5 %                : num [1:2] 0.533 1.99
#   ..$ Pr(>|z|)              : num [1:2] 0.00688 0.02383
#  $ coxphTimeOutcome_Exposure_tt_Covariates:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	14 obs. of  8 variables:
#   ..$ rowname               : chr [1:14] "Exposure" "Age_at_lmp" "`year(lmp)`" "t_N180_42.ICD9_CKD_exceptARF" ...
#   ..$ estimate (95% CI) %.2f: chr [1:14] "0.10 (0.02, 0.51)" "1.02 (1.00, 1.03)" "1.04 (0.98, 1.10)" "0.79 (0.25, 2.49)" ...
#   ..$ estimate (95% CI) %.3f: chr [1:14] "0.098 (0.019, 0.513)" "1.017 (1.003, 1.031)" "1.040 (0.984, 1.099)" "0.793 (0.253, 2.490)" ...
#   ..$ percent (95% CI)      : chr [1:14] "9.8% (1.9%, 51.3%)" "101.7% (100.3%, 103.1%)" "104.0% (98.4%, 109.9%)" "79.3% (25.3%, 249.0%)" ...
#   ..$ exp(coef(.))          : num [1:14] 0.0978 1.0172 1.0399 0.7934 1.4333 ...
#   ..$ 2.5 %                 : num [1:14] 0.0186 1.0031 0.9837 0.2528 1.2356 ...
#   ..$ 97.5 %                : num [1:14] 0.513 1.031 1.099 2.49 1.663 ...
#   ..$ Pr(>|z|)              : num [1:14] 5.99e-03 1.63e-02 1.67e-01 6.92e-01 1.99e-06 ...


#@ HazardRatios.bind_rows =====
HazardRatios.bind_rows = HazardRatios.list_df %>% map(function(df) {df %>% dplyr::filter(grepl("Exposure", rowname))}) %>% bind_rows(.id = "Model")
HazardRatios.bind_rows #----
# > HazardRatios.bind_rows #----
# # A tibble: 4 x 9
#   Model                                   rowname      `estimate (95% CI) %.2f` `estimate (95% CI) %.3f` `percent (95% CI)`      `exp(coef(.))` `2.5 %` `97.5 %` `Pr(>|z|)`
#   <chr>                                   <chr>        <chr>                    <chr>                    <chr>                            <dbl>   <dbl>    <dbl>      <dbl>
# 1 coxphTimeOutcome_Exposure_tt            Exposure     0.10 (0.02, 0.53)        0.102 (0.019, 0.533)     10.2% (1.9%, 53.3%)             0.102   0.0194    0.533    0.00688
# 2 coxphTimeOutcome_Exposure_tt            tt(Exposure) 1.45 (1.05, 1.99)        1.446 (1.050, 1.990)     144.6% (105.0%, 199.0%)         1.45    1.05      1.99     0.0238 
# 3 coxphTimeOutcome_Exposure_tt_Covariates Exposure     0.10 (0.02, 0.51)        0.098 (0.019, 0.513)     9.8% (1.9%, 51.3%)              0.0978  0.0186    0.513    0.00599
# 4 coxphTimeOutcome_Exposure_tt_Covariates tt(Exposure) 1.44 (1.05, 1.98)        1.440 (1.046, 1.983)     144.0% (104.6%, 198.3%)         1.44    1.05      1.98     0.0253 


#@ HazardRatios.spread ====
HazardRatios.spread = HazardRatios.bind_rows |> rename(`estimate (95% CI)` = `estimate (95% CI) %.2f`) %>% 
    select(Model, rowname, `estimate (95% CI)`) %>% 
    spread(key = Model, value = `estimate (95% CI)`)
HazardRatios.spread |> print(n=99) #----
# > HazardRatios.spread |> print(n=99) #----
# # A tibble: 2 x 3
#   rowname      coxphTimeOutcome_Exposure_tt coxphTimeOutcome_Exposure_tt_Covariates
#   <chr>        <chr>                        <chr>                                  
# 1 Exposure     0.10 (0.02, 0.53)            0.10 (0.02, 0.51)                      
# 2 tt(Exposure) 1.45 (1.05, 1.99)            1.44 (1.05, 1.98)                      



# #@ spread.join ====
# HazardRatios.spread = bind_rows.HazardRatios |> rename(`estimate (95% CI)` = `estimate (95% CI) %.2f`) %>% 
#     select(Table, .id, rowname, `estimate (95% CI)`) %>% 
#     spread(key = rowname, value = `estimate (95% CI)`)
# # RiskDifference.spread = bind_rows.RiskDifference |> rename(`estimate (95% CI)` = `estimate (95% CI) %.3f`) %>% 
# RiskDifference.spread = bind_rows.RiskDifference |> rename(`estimate (95% CI)` = `percent (95% CI)`) %>% 
#     select(Table, .id, rowname, `estimate (95% CI)`) %>% 
#     spread(key = rowname, value = `estimate (95% CI)`)
# spread.join = RiskDifference.spread %>% mutate(Table = Table |> str_extract("^[A-z]+")) %>% 
#     full_join(  HazardRatios.spread %>% mutate(Table = Table |> str_extract("^[A-z]+"))  )
# HazardRatios.spread |> print(n=99) #----
# RiskDifference.spread |> print(n=99) #----
# spread.join |> print(n=99,width=999) #----


#@ end ----
