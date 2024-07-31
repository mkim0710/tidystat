
#@@@@ data_numeric.byExposure.mean_sd ======







#@@@@ data_logical.byExposure.sum_mean ======



#@ analyticDF.TargetTrial2v38.2.113vs200.nOutcome_byExposure =====
analyticDF.TargetTrial2v38.2.113vs200.nOutcome_byExposure = 
    analyticDF.TargetTrial2v38.2.113vs200 |> rename(Exposure = Intervention) %>% 
    {
        f1 = function(df) df %>% group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~sum(.==1, na.rm=T)) ) %>% 
            mutate(Exposure = case_when(Exposure==0 ~ "nDisease1_Exposed0", Exposure==1 ~ "nDisease1_Exposed1")) %>%
            gather(key, value, -Exposure) %>% spread(Exposure, value) 
        out = f1(.)
        
        out$nExposed0 = sum(.$Exposure==0, na.rm = T)
        out$nExposed1 = sum(.$Exposure==1, na.rm = T)
        
        out = out %>% mutate(
            nDisease0_Exposed0 = nExposed0 - nDisease1_Exposed0
            , nDisease0_Exposed1 = nExposed1 - nDisease1_Exposed1
        )
        out = out %>% select(key, nExposed0, nExposed1, everything())
        
        f2 = function(df) df %>% group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~mean(.==1, na.rm=T)) ) %>% 
            mutate(Exposure = case_when(Exposure==0 ~ "pDisease_Exposed0", Exposure==1 ~ "pDisease_Exposed1")) %>%
            gather(key, value, -Exposure) %>% spread(Exposure, value) 
        out = full_join(out, f2(.), by = "key")

        out = out %>% mutate(
            `nDisease|Exposed0 (%) %.2f` = paste0(nDisease1_Exposed0, " (", sprintf("%.2f",round(pDisease_Exposed0*100,2)), "%)"),
            `nDisease|Exposed1 (%) %.2f` = paste0(nDisease1_Exposed1, " (", sprintf("%.2f",round(pDisease_Exposed1*100,2)), "%)"),
            `nDisease|Exposed0 (%) %.3f` = paste0(nDisease1_Exposed0, " (", sprintf("%.3f",round(pDisease_Exposed0*100,3)), "%)"),
            `nDisease|Exposed1 (%) %.3f` = paste0(nDisease1_Exposed1, " (", sprintf("%.3f",round(pDisease_Exposed1*100,3)), "%)")
        ) %>% select(`nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, `nDisease|Exposed0 (%) %.3f`, `nDisease|Exposed1 (%) %.3f`, everything())
        
        out
    }
analyticDF.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% select(key, `nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, nExposed0, nExposed1, nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1) #-----
# > analyticDF.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% select(key, `nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, nExposed0, nExposed1, nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1) #-----
# # A tibble: 20 x 9
#    key                       `nDisease|Exposed0 (%) %.2f` `nDisease|Exposed1 (%) %.2f` nExposed0 nExposed1 nDisease0_Exposed0 nDisease0_Exposed1 nDisease1_Exposed0 nDisease1_Exposed1
#    <chr>                     <chr>                        <chr>                            <int>     <int>              <int>              <int>              <int>              <int>
#  1 PrimaryOutcome1           5 (2.50%)                    4 (3.54%)                          200       113                195                109                  5                  4
#  2 PrimaryOutcome123456      60 (30.00%)                  34 (30.09%)                        200       113                140                 79                 60                 34
#  3 PrimaryOutcome2           52 (26.00%)                  30 (26.55%)                        200       113                148                 83                 52                 30
#  4 PrimaryOutcome3           5 (2.50%)                    0 (0.00%)                          200       113                195                113                  5                  0
#  5 PrimaryOutcome4           0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
#  6 PrimaryOutcome5           0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
#  7 PrimaryOutcome6           0 (0.00%)                    3 (2.65%)                          200       113                200                110                  0                  3
#  8 SecondaryOutcome1         41 (20.50%)                  13 (11.50%)                        200       113                159                100                 41                 13
#  9 SecondaryOutcome10        6 (3.00%)                    3 (2.65%)                          200       113                194                110                  6                  3
# 10 SecondaryOutcome13        96 (48.00%)                  63 (55.75%)                        200       113                104                 50                 96                 63
# 11 SecondaryOutcome14        0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 12 SecondaryOutcome15        0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 13 SecondaryOutcome17        71 (35.50%)                  38 (33.63%)                        200       113                129                 75                 71                 38
# 14 SecondaryOutcome20        5 (2.50%)                    0 (0.00%)                          200       113                195                113                  5                  0
# 15 SecondaryOutcome21        5 (2.50%)                    0 (0.00%)                          200       113                195                113                  5                  0
# 16 SecondaryOutcome4         0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 17 SecondaryOutcome5         0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 18 SecondaryOutcome6         0 (0.00%)                    3 (2.65%)                          200       113                200                110                  0                  3
# 19 SecondaryOutcome7         0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 20 SecondaryOutcomeP1456fhkl 128 (64.00%)                 65 (57.52%)                        200       113                 72                 48                128                 65



#@ -----
analyticDF.TargetTrial2v38.2.113vs200 |> rename(Exposure = Intervention) %>% 
    group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~sum(.==1, na.rm=T)) ) %>% 
    mutate(Exposure = paste0("Exposure", Exposure)) %>% column_to_rownames("Exposure") %>% t %>% addmargins #----
analyticDF.TargetTrial2v38.2.113vs200 |> rename(Exposure = Intervention) %>% 
    group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~mean(.==1, na.rm=T)) ) %>% 
    mutate(Exposure = paste0("Exposure", Exposure)) %>% column_to_rownames("Exposure") %>% t %>% addmargins #----
# > analyticDF.TargetTrial2v38.2.113vs200 |> rename(Exposure = Intervention) %>% 
# +     group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~sum(.==1, na.rm=T)) ) %>% 
# +     mutate(Exposure = paste0("Exposure", Exposure)) %>% column_to_rownames("Exposure") %>% t %>% addmargins #----
#                           Exposure0 Exposure1 Sum
# PrimaryOutcome123456             60        34  94
# SecondaryOutcomeP1456fhkl       128        65 193
# PrimaryOutcome1                   5         4   9
# PrimaryOutcome2                  52        30  82
# PrimaryOutcome3                   5         0   5
# PrimaryOutcome4                   0         0   0
# PrimaryOutcome5                   0         0   0
# PrimaryOutcome6                   0         3   3
# SecondaryOutcome1                41        13  54
# SecondaryOutcome4                 0         0   0
# SecondaryOutcome5                 0         0   0
# SecondaryOutcome6                 0         3   3
# SecondaryOutcome7                 0         0   0
# SecondaryOutcome10                6         3   9
# SecondaryOutcome13               96        63 159
# SecondaryOutcome14                0         0   0
# SecondaryOutcome15                0         0   0
# SecondaryOutcome17               71        38 109
# SecondaryOutcome20                5         0   5
# SecondaryOutcome21                5         0   5
# Sum                             474       256 730
# > analyticDF.TargetTrial2v38.2.113vs200 |> rename(Exposure = Intervention) %>% 
# +     group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~mean(.==1, na.rm=T)) ) %>% 
# +     mutate(Exposure = paste0("Exposure", Exposure)) %>% column_to_rownames("Exposure") %>% t %>% addmargins #----
#                           Exposure0  Exposure1        Sum
# PrimaryOutcome123456          0.300 0.30088496 0.60088496
# SecondaryOutcomeP1456fhkl     0.640 0.57522124 1.21522124
# PrimaryOutcome1               0.025 0.03539823 0.06039823
# PrimaryOutcome2               0.260 0.26548673 0.52548673
# PrimaryOutcome3               0.025 0.00000000 0.02500000
# PrimaryOutcome4               0.000 0.00000000 0.00000000
# PrimaryOutcome5               0.000 0.00000000 0.00000000
# PrimaryOutcome6               0.000 0.02654867 0.02654867
# SecondaryOutcome1             0.205 0.11504425 0.32004425
# SecondaryOutcome4             0.000 0.00000000 0.00000000
# SecondaryOutcome5             0.000 0.00000000 0.00000000
# SecondaryOutcome6             0.000 0.02654867 0.02654867
# SecondaryOutcome7             0.000 0.00000000 0.00000000
# SecondaryOutcome10            0.030 0.02654867 0.05654867
# SecondaryOutcome13            0.480 0.55752212 1.03752212
# SecondaryOutcome14            0.000 0.00000000 0.00000000
# SecondaryOutcome15            0.000 0.00000000 0.00000000
# SecondaryOutcome17            0.355 0.33628319 0.69128319
# SecondaryOutcome20            0.025 0.00000000 0.02500000
# SecondaryOutcome21            0.025 0.00000000 0.02500000
# Sum                           2.370 2.26548673 4.63548673
























#@ analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI =====
analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI = list()
analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI$list_PrimaryOutcomes.ORCI = 
    analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes %>% 
    map(function(glmObject) {
        out = glmObject %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) |> as.data.frame() %>% rownames_to_column |> as_tibble()
        out = out %>% mutate(
            rowname = rowname
            , `estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(`exp(coef(.))`,2)), " (", sprintf("%.2f",round(`2.5 %`,2)), ", ", sprintf("%.2f",round(`97.5 %`,2)), ")")
            , `estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(`exp(coef(.))`,3)), " (", sprintf("%.3f",round(`2.5 %`,3)), ", ", sprintf("%.3f",round(`97.5 %`,3)), ")")
            , `exp(coef(.))` = `exp(coef(.))`,  `2.5 %` = `2.5 %`, `97.5 %` = `97.5 %`, `Pr(>|z|)`
        ) %>% select(rowname, `estimate (95% CI) %.2f`, `estimate (95% CI) %.3f`, everything())
        out %>% dplyr::filter(rowname %in% c("Exposuremetformin_after_insulin"))
    }) %>% bind_rows(.id = ".id")

analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI$nOutcome_byExposure =
    analyticDF2797 %>% 
    group_by(Exposure) %>% 
    {left_join(summarize(., n()), summarise_if(., is.logical, funs(sum, mean)))} %>% 
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





#@  -----
data = ID_Eligible_Exposure.TargetTrial2v2.159vs266.Outcome.Covariates %>% 
    select(Intervention, Control, Nothing, matches("^PrimaryOutcome[0-9]+"), matches("^SecondaryOutcome[0-9]+"), SecondaryOutcomeP1456fhkl)
# data %>% mutate(Exposure = Intervention) %>% 
#     group_by(Exposure) %>% 
#     {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time"), -matches("date")), funs(sum, mean)))} %>% 
#     {bind_cols(
#         transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
#         ,
#         map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
#             paste0(x, " (", round(y*100,2), "%)")
#         }) 
#     )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value) %>% 
#     print(n=99)
# # > data %>% mutate(Exposure = Intervention) %>% 
# # +     group_by(Exposure) %>% 
# # +     {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time"), -matches("date")), funs(sum, mean)))} %>% 
# # +     {bind_cols(
# # +         transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
# # +         ,
# # +         map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
# # +             paste0(x, " (", round(y*100,2), "%)")
# # +         }) 
# # +     )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value)
# # Joining, by = "Exposure"
# # # A tibble: 28 x 3
# #    key                      `FALSE`     `TRUE`     
# #    <chr>                    <chr>       <chr>      
# #  1 n()                      266 (100%)  159 (100%) 
# #  2 PrimaryOutcome1.i.1_sum  9 (3.38%)   2 (1.26%)  
# #  3 PrimaryOutcome1.i.2_sum  7 (2.63%)   1 (0.63%)  
# #  4 PrimaryOutcome1.ii.1_sum 2 (0.75%)   4 (2.52%)  
# #  5 PrimaryOutcome1.ii.2_sum 0 (0%)      0 (0%)     
# #  6 PrimaryOutcome1.iii_sum  0 (0%)      0 (0%)     
# #  7 PrimaryOutcome1_sum      8 (3.01%)   5 (3.14%)  
# #  8 PrimaryOutcome123456_sum 74 (27.82%) 44 (27.67%)
# #  9 PrimaryOutcome2_sum      66 (24.81%) 39 (24.53%)
# # 10 PrimaryOutcome3_sum      1 (0.38%)   0 (0%)     
# # # ... with 18 more rows

data %>% mutate(Exposure = Intervention) %>% 
    group_by(Exposure) %>% 
    {left_join(summarize(., n()), summarise_if(., is.logical, funs(sum, mean)))} %>% 
    {bind_cols(
        transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
        ,
        map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
            paste0(x, " (", round(y*100,2), "%)")
        }) 
    )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value) %>% 
    print(n=99)
# > data %>% mutate(Exposure = Intervention) %>% 
# +     group_by(Exposure) %>% 
# +     {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time"), -matches("date")), funs(sum, mean)))} %>% 
# +     {bind_cols(
# +         transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
# +         ,
# +         map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
# +             paste0(x, " (", round(y*100,2), "%)")
# +         }) 
# +     )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value)
# Joining, by = "Exposure"
# # A tibble: 28 x 3
#    key                      `FALSE`     `TRUE`     
#    <chr>                    <chr>       <chr>      
#  1 n()                      266 (100%)  159 (100%) 
#  2 PrimaryOutcome1.i.1_sum  9 (3.38%)   2 (1.26%)  
#  3 PrimaryOutcome1.i.2_sum  7 (2.63%)   1 (0.63%)  
#  4 PrimaryOutcome1.ii.1_sum 2 (0.75%)   4 (2.52%)  
#  5 PrimaryOutcome1.ii.2_sum 0 (0%)      0 (0%)     
#  6 PrimaryOutcome1.iii_sum  0 (0%)      0 (0%)     
#  7 PrimaryOutcome1_sum      8 (3.01%)   5 (3.14%)  
#  8 PrimaryOutcome123456_sum 74 (27.82%) 44 (27.67%)
#  9 PrimaryOutcome2_sum      66 (24.81%) 39 (24.53%)
# 10 PrimaryOutcome3_sum      1 (0.38%)   0 (0%)     
# # ... with 18 more rows



#@@@@ data_factor.byExposure.table_proptable ======

# (pending)

