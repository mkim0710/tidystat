# data.mutate_at.rename_at.source.r






ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
    select_at(vars(matches("\\.ndDate$"))) %>% summary #-----
ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>%
    mutate_at(vars(matches("\\.ndDate$")), replace_na, 0) %>%
    rename_at(vars(matches("\\.ndDate$")), list(~paste0(., ".replace_na"))) %>%
    select_at(vars(matches("\\.replace_na"))) %>% summary #-----
ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
    mutate_at(vars(matches("\\.ndDate$")), replace_na, 0) %>% 
    rename_at(vars(matches("\\.ndDate$")), function(vec) paste0(vec, ".replace_na")) %>% 
    select_at(vars(matches("\\.replace_na"))) %>% summary #-----
ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
    mutate_at(vars(matches("\\.ndDate$")), replace_na, 0) %>% 
    rename_at(vars(matches("\\.ndDate$")), paste0, ".replace_na") %>% 
    select_at(vars(matches("\\.replace_na"))) %>% summary #-----
ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
    mutate_at(vars(matches("\\.ndDate$")), funs(replace_na(., 0))) %>% 
    rename_at(vars(matches("\\.ndDate$")), funs(paste0(., ".replace_na"))) %>% 
    select_at(vars(matches("\\.replace_na"))) %>% summary #-----
# > ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
# +     select_at(vars(matches("\\.ndDate$"))) %>% summary #-----
#  Window4Eligible.RxCONCEPT_NDC_insulin.ndDate Window4Eligible.RxCONCEPT_NDC_metformin.ndDate Window4Eligible.RxCONCEPT_NDC_SU_TZD_etc.ndDate
#  Min.   : 1.000                               Min.   :1.000                                  Min.   :1.000                                  
#  1st Qu.: 1.000                               1st Qu.:1.000                                  1st Qu.:1.000                                  
#  Median : 2.000                               Median :2.000                                  Median :2.000                                  
#  Mean   : 2.339                               Mean   :2.591                                  Mean   :2.598                                  
#  3rd Qu.: 3.000                               3rd Qu.:4.000                                  3rd Qu.:4.000                                  
#  Max.   :13.000                               Max.   :9.000                                  Max.   :9.000                                  
#                                                                                              NA's   :313                                    
#  Window4Exposure.RxCONCEPT_NDC_insulin.ndDate Window4Exposure.RxCONCEPT_NDC_metformin.ndDate Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate
#  Min.   : 1.000                               Min.   : 1.000                                 Min.   :1.000                                  
#  1st Qu.: 2.000                               1st Qu.: 1.000                                 1st Qu.:1.000                                  
#  Median : 4.000                               Median : 2.000                                 Median :1.000                                  
#  Mean   : 4.143                               Mean   : 2.379                                 Mean   :1.816                                  
#  3rd Qu.: 6.000                               3rd Qu.: 4.000                                 3rd Qu.:2.000                                  
#  Max.   :16.000                               Max.   :12.000                                 Max.   :4.000                                  
#                                               NA's   :373                                    NA's   :541                                    
# > ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>%
# +     mutate_at(vars(matches("\\.ndDate$")), replace_na, 0) %>%
# +     rename_at(vars(matches("\\.ndDate$")), list(~paste0(., ".replace_na"))) %>%
# +     select_at(vars(matches("\\.replace_na"))) %>% summary #-----
#  Window4Eligible.RxCONCEPT_NDC_insulin.ndDate.replace_na Window4Eligible.RxCONCEPT_NDC_metformin.ndDate.replace_na Window4Eligible.RxCONCEPT_NDC_SU_TZD_etc.ndDate.replace_na
#  Min.   : 1.000                                          Min.   :1.000                                             Min.   :0.000                                             
#  1st Qu.: 1.000                                          1st Qu.:1.000                                             1st Qu.:0.000                                             
#  Median : 2.000                                          Median :2.000                                             Median :0.000                                             
#  Mean   : 2.339                                          Mean   :2.591                                             Mean   :1.193                                             
#  3rd Qu.: 3.000                                          3rd Qu.:4.000                                             3rd Qu.:2.000                                             
#  Max.   :13.000                                          Max.   :9.000                                             Max.   :9.000                                             
#  Window4Exposure.RxCONCEPT_NDC_insulin.ndDate.replace_na Window4Exposure.RxCONCEPT_NDC_metformin.ndDate.replace_na Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate.replace_na
#  Min.   : 1.000                                          Min.   : 0.0000                                           Min.   :0.0000                                            
#  1st Qu.: 2.000                                          1st Qu.: 0.0000                                           1st Qu.:0.0000                                            
#  Median : 4.000                                          Median : 0.0000                                           Median :0.0000                                            
#  Mean   : 4.143                                          Mean   : 0.8463                                           Mean   :0.1192                                            
#  3rd Qu.: 6.000                                          3rd Qu.: 1.0000                                           3rd Qu.:0.0000                                            
#  Max.   :16.000                                          Max.   :12.0000                                           Max.   :4.0000                                            
# > ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
# +     mutate_at(vars(matches("\\.ndDate$")), replace_na, 0) %>% 
# +     rename_at(vars(matches("\\.ndDate$")), function(vec) paste0(vec, ".replace_na")) %>% 
# +     select_at(vars(matches("\\.replace_na"))) %>% summary #-----
#  Window4Eligible.RxCONCEPT_NDC_insulin.ndDate.replace_na Window4Eligible.RxCONCEPT_NDC_metformin.ndDate.replace_na Window4Eligible.RxCONCEPT_NDC_SU_TZD_etc.ndDate.replace_na
#  Min.   : 1.000                                          Min.   :1.000                                             Min.   :0.000                                             
#  1st Qu.: 1.000                                          1st Qu.:1.000                                             1st Qu.:0.000                                             
#  Median : 2.000                                          Median :2.000                                             Median :0.000                                             
#  Mean   : 2.339                                          Mean   :2.591                                             Mean   :1.193                                             
#  3rd Qu.: 3.000                                          3rd Qu.:4.000                                             3rd Qu.:2.000                                             
#  Max.   :13.000                                          Max.   :9.000                                             Max.   :9.000                                             
#  Window4Exposure.RxCONCEPT_NDC_insulin.ndDate.replace_na Window4Exposure.RxCONCEPT_NDC_metformin.ndDate.replace_na Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate.replace_na
#  Min.   : 1.000                                          Min.   : 0.0000                                           Min.   :0.0000                                            
#  1st Qu.: 2.000                                          1st Qu.: 0.0000                                           1st Qu.:0.0000                                            
#  Median : 4.000                                          Median : 0.0000                                           Median :0.0000                                            
#  Mean   : 4.143                                          Mean   : 0.8463                                           Mean   :0.1192                                            
#  3rd Qu.: 6.000                                          3rd Qu.: 1.0000                                           3rd Qu.:0.0000                                            
#  Max.   :16.000                                          Max.   :12.0000                                           Max.   :4.0000                                            
# > ID_Eligible_Exposure.TargetTrial2v40.2.206vs373.Outcome.Covariates.DDD.A1c %>% 
# +     mutate_at(vars(matches("\\.ndDate$")), replace_na, 0) %>% 
# +     rename_at(vars(matches("\\.ndDate$")), paste0, ".replace_na") %>% 
# +     select_at(vars(matches("\\.replace_na"))) %>% summary #-----
#  Window4Eligible.RxCONCEPT_NDC_insulin.ndDate.replace_na Window4Eligible.RxCONCEPT_NDC_metformin.ndDate.replace_na Window4Eligible.RxCONCEPT_NDC_SU_TZD_etc.ndDate.replace_na
#  Min.   : 1.000                                          Min.   :1.000                                             Min.   :0.000                                             
#  1st Qu.: 1.000                                          1st Qu.:1.000                                             1st Qu.:0.000                                             
#  Median : 2.000                                          Median :2.000                                             Median :0.000                                             
#  Mean   : 2.339                                          Mean   :2.591                                             Mean   :1.193                                             
#  3rd Qu.: 3.000                                          3rd Qu.:4.000                                             3rd Qu.:2.000                                             
#  Max.   :13.000                                          Max.   :9.000                                             Max.   :9.000                                             
#  Window4Exposure.RxCONCEPT_NDC_insulin.ndDate.replace_na Window4Exposure.RxCONCEPT_NDC_metformin.ndDate.replace_na Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate.replace_na
#  Min.   : 1.000                                          Min.   : 0.0000                                           Min.   :0.0000                                            
#  1st Qu.: 2.000                                          1st Qu.: 0.0000                                           1st Qu.:0.0000                                            
#  Median : 4.000                                          Median : 0.0000                                           Median :0.0000                                            
#  Mean   : 4.143                                          Mean   : 0.8463                                           Mean   :0.1192                                            
#  3rd Qu.: 6.000                                          3rd Qu.: 1.0000                                           3rd Qu.:0.0000                                            
#  Max.   :16.000                                          Max.   :12.0000                                           Max.   :4.0000                                            




#@ end -----


