

#@ analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI =====
analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI = list()
analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI$list_PrimaryOutcomes.ORCI = 
    analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes %>% 
    map(function(glmObject) {
        out = glmObject %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) %>% as.data.frame %>% rownames_to_column %>% as.tibble
        out = out %>% mutate(
            rowname = rowname
            , `estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(`exp(coef(.))`,2)), " (", sprintf("%.2f",round(`2.5 %`,2)), ", ", sprintf("%.2f",round(`97.5 %`,2)), ")")
            , `estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(`exp(coef(.))`,3)), " (", sprintf("%.3f",round(`2.5 %`,3)), ", ", sprintf("%.3f",round(`97.5 %`,3)), ")")
            , `exp(coef(.))` = `exp(coef(.))`,  `2.5 %` = `2.5 %`, `97.5 %` = `97.5 %`, `Pr(>|z|)`
        ) %>% select(rowname, `estimate (95% CI) %.2f`, `estimate (95% CI) %.3f`, everything())
        out %>% filter(rowname %in% c("Exposuremetformin_after_insulin"))
    }) %>% bind_rows(.id = ".id")

analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI$nOutcome_byExposure =
    analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
    {bind_cols(
        transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
        ,
        map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
            paste0(x, " (", round(y*100,2), "%)")
        }) 
    )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value)

analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI #----
# > analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI #----
# $list_PrimaryOutcomes.ORCI
# # A tibble: 7 x 8
#   .id                  rowname                         `estimate (95% CI) %.2f` `estimate (95% CI) %.3f` `exp(coef(.))` `2.5 %` `97.5 %` `Pr(>|z|)`
#   <chr>                <chr>                           <chr>                          <chr>                                         <dbl>         <dbl>          <dbl>            <dbl>
# 1 PrimaryOutcome123456 Exposuremetformin_after_insulin 0.61 (0.51, 0.74)              0.610 (0.510, 0.740)                           0.61          0.51           0.74             0   
# 2 PrimaryOutcome1      Exposuremetformin_after_insulin 0.47 (0.33, 0.67)              0.470 (0.330, 0.670)                           0.47          0.33           0.67             0   
# 3 PrimaryOutcome2      Exposuremetformin_after_insulin 0.71 (0.56, 0.89)              0.710 (0.560, 0.890)                           0.71          0.56           0.89             0   
# 4 PrimaryOutcome3      Exposuremetformin_after_insulin 0.00 (0.00, Inf)               0.000 (0.000, Inf)                             0             0            Inf                0.99
# 5 PrimaryOutcome4      Exposuremetformin_after_insulin 2.05 (0.49, 8.64)              2.050 (0.490, 8.640)                           2.05          0.49           8.64             0.33
# 6 PrimaryOutcome5      Exposuremetformin_after_insulin 0.00 (0.00, Inf)               0.000 (0.000, Inf)                             0             0            Inf                0.99
# 7 PrimaryOutcome6      Exposuremetformin_after_insulin 1.48 (0.73, 3.00)              1.480 (0.730, 3.000)                           1.48          0.73           3                0.28
# 
# $nOutcome_byExposure
# # A tibble: 21 x 3
#    key                      insulin_only metformin_after_insulin
#    <chr>                    <chr>        <chr>                  
#  1 n()                      2278 (100%)  519 (100%)             
#  2 PrimaryOutcome1_sum      297 (13.04%) 35 (6.74%)             
#  3 PrimaryOutcome123456_sum 773 (33.93%) 126 (24.28%)           
#  4 PrimaryOutcome2_sum      460 (20.19%) 89 (17.15%)            
#  5 PrimaryOutcome3_sum      8 (0.35%)    0 (0%)                 
#  6 PrimaryOutcome4_sum      5 (0.22%)    3 (0.58%)              
#  7 PrimaryOutcome5_sum      4 (0.18%)    0 (0%)                 
#  8 PrimaryOutcome6_sum      27 (1.19%)   11 (2.12%)             
#  9 SecondaryOutcome1_sum    372 (16.33%) 89 (17.15%)            
# 10 SecondaryOutcome10_sum   36 (1.58%)   11 (2.12%)             
# # ... with 11 more rows

