#@ calculation of Person-Time, which is sum(time2event), and make Table 2.  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.calculatePersonTime.dev.r
#@ Person-Time format of survival data.  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/57_model_time2event/data.PersonTime.dev.r



# data.PersonTime.dev.r
# MarketScan PREGCOHORT Step67 Regression SecondaryOutcomes 190818.pptm
# analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes from .r
# analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes from .r



set.seed(123)  # for reproducibility
# Generate sample data
tblID_Event_Time2Event <- tibble::tibble(
  PERSON_ID = 10^5 + 1:10,
  Female = sample(c(TRUE, FALSE), 10, replace = TRUE),  # Random event occurrence
  Time2Event = sample(240:275, 10),  # Random times between 240 and 275
  Event = sample(c(TRUE, FALSE), 10, replace = TRUE)  # Random event occurrence
)
print(tblID_Event_Time2Event)
# > print(tblID_Event_Time2Event)
# # A tibble: 10 × 4
#    PERSON_ID Female Time2Event Event
#        <dbl> <lgl>       <int> <lgl>
#  1    100001 FALSE         267 FALSE
#  2    100002 FALSE         248 TRUE 
#  3    100003 TRUE          268 TRUE 
#  4    100004 FALSE         247 TRUE 
#  5    100005 TRUE          265 TRUE 
#  6    100006 FALSE         246 FALSE
#  7    100007 TRUE          249 TRUE 
#  8    100008 TRUE          274 FALSE
#  9    100009 TRUE          258 FALSE
# 10    100010 TRUE          243 TRUE 


set.seed(123)  # for reproducibility
# Generate sample data
analyticDF2797 <- tibble::tibble(
  ENROLID = c(130298303, 357944602, 514563701, 585415901, 597484206),
  PrimaryOutcome123456.time = sample(240:275, 5),  # Random times between 240 and 275
  PrimaryOutcome123456 = sample(c(TRUE, FALSE), 5, replace = TRUE)  # Random event occurrence
)
print(analyticDF2797)
# Output:
# # A tibble: 5 x 3
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456
#       <dbl>                     <int> <lgl>               
# 1 130298303                       258 TRUE                
# 2 357944602                       268 TRUE                
# 3 514563701                       251 FALSE               
# 4 585415901                       271 TRUE                
# 5 597484206                       243 FALSE




#@ analyticDF2797.PersonTime7 ====  
library(dplyr)
library(purrr)
library(tidyr)

convert.tblID_Event_Time2Event.tblPersonTime_Event_Time2Event <- function(tblID_Event_Time2Event, 
                                                                          varname4ID, 
                                                                          varname4Event, 
                                                                          varname4Time2Event, 
                                                                          Interval) {
  tblID_Event_Time2Event %>%
    select(!!sym(varname4ID), !!sym(varname4Event), !!sym(varname4Time2Event)) %>%
    mutate(PeriodSeq = map(!!sym(varname4Time2Event), ~1L:ceiling(.x/Interval))) %>%
    unnest(PeriodSeq) %>%
    mutate(
      Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") %>% as.factor,
      time = PeriodSeq * Interval,
      event = (!!sym(varname4Event) == 1) & (!!sym(varname4Time2Event) <= PeriodSeq * Interval),
      timesq = time*time,
      k = PeriodSeq - 1,
      Dk_plus1 = event
    )
}

# Example Usage:
# convert.tblID_Event_Time2Event.tblPersonTime_Event_Time2Event(analyticDF2797, "ENROLID", "PrimaryOutcome123456", "PrimaryOutcome123456.time", 84)
# # A tibble: 18 × 10
#      ENROLID PrimaryOutcome123456 PrimaryOutcome123456.time PeriodSeq Period     time event timesq     k Dk_plus1
#        <dbl> <lgl>                                    <int>     <int> <fct>     <dbl> <lgl>  <dbl> <dbl> <lgl>   
#  1 130298303 FALSE                                      270         1 (0,84]       84 FALSE   7056     0 FALSE   
#  2 130298303 FALSE                                      270         2 (84,168]    168 FALSE  28224     1 FALSE   
#  3 130298303 FALSE                                      270         3 (168,252]   252 FALSE  63504     2 FALSE   
#  4 130298303 FALSE                                      270         4 (252,336]   336 FALSE 112896     3 FALSE   
#  5 357944602 FALSE                                      254         1 (0,84]       84 FALSE   7056     0 FALSE   
#  6 357944602 FALSE                                      254         2 (84,168]    168 FALSE  28224     1 FALSE   
#  7 357944602 FALSE                                      254         3 (168,252]   252 FALSE  63504     2 FALSE   
#  8 357944602 FALSE                                      254         4 (252,336]   336 FALSE 112896     3 FALSE   
#  9 514563701 TRUE                                       253         1 (0,84]       84 FALSE   7056     0 FALSE   
# 10 514563701 TRUE                                       253         2 (84,168]    168 FALSE  28224     1 FALSE   
# 11 514563701 TRUE                                       253         3 (168,252]   252 FALSE  63504     2 FALSE   
# 12 514563701 TRUE                                       253         4 (252,336]   336 TRUE  112896     3 TRUE    
# 13 585415901 TRUE                                       242         1 (0,84]       84 FALSE   7056     0 FALSE   
# 14 585415901 TRUE                                       242         2 (84,168]    168 FALSE  28224     1 FALSE   
# 15 585415901 TRUE                                       242         3 (168,252]   252 TRUE   63504     2 TRUE    
# 16 597484206 FALSE                                      249         1 (0,84]       84 FALSE   7056     0 FALSE   
# 17 597484206 FALSE                                      249         2 (84,168]    168 FALSE  28224     1 FALSE   
# 18 597484206 FALSE                                      249         3 (168,252]   252 FALSE  63504     2 FALSE   







#@ analyticDF2797.PersonTime7 ====  
Interval = 7 * 12

analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
    mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval)))
analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
    mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest
analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
    mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest %>%  
    mutate(
        Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") |> as.factor()
        , time = PeriodSeq * Interval
        , event = (PrimaryOutcome123456 == 1) & (PrimaryOutcome123456.time <= PeriodSeq * Interval)
        , timesq = time*time
        , k = PeriodSeq - 1  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
        , Dk_plus1 = event  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks 
    ) 
# > analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
# +     mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval)))
# # A tibble: 2,797 x 4
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456 PeriodSeq
#        <dbl>                     <int> <lgl>                <list>   
#  1 130298303                       273 FALSE                <int [4]>
#  2 357944602                       252 TRUE                 <int [3]>
#  3 514563701                       273 FALSE                <int [4]>
#  4 585415901                       273 FALSE                <int [4]>
#  5 597484206                       273 FALSE                <int [4]>
#  6 654552101                       245 TRUE                 <int [3]>
#  7 665579604                       273 FALSE                <int [4]>
#  8 666119601                       273 FALSE                <int [4]>
#  9 673451601                       273 FALSE                <int [4]>
# 10 685036801                       273 FALSE                <int [4]>
# # ... with 2,787 more rows
# > analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
# +     mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest
# # A tibble: 9,561 x 4
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456 PeriodSeq
#        <dbl>                     <int> <lgl>                    <int>
#  1 130298303                       273 FALSE                        1
#  2 130298303                       273 FALSE                        2
#  3 130298303                       273 FALSE                        3
#  4 130298303                       273 FALSE                        4
#  5 357944602                       252 TRUE                         1
#  6 357944602                       252 TRUE                         2
#  7 357944602                       252 TRUE                         3
#  8 514563701                       273 FALSE                        1
#  9 514563701                       273 FALSE                        2
# 10 514563701                       273 FALSE                        3
# # ... with 9,551 more rows
# > analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
# +     mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest %>%  
# +     mutate(
# +         Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") |> as.factor()
# +         , time = PeriodSeq * Interval
# +         , event = (PrimaryOutcome123456 == 1) & (PrimaryOutcome123456.time <= PeriodSeq * Interval)
# +         , timesq = time*time
# +         , k = PeriodSeq - 1  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
# +         , Dk_plus1 = event  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks 
# +     ) 
# # A tibble: 9,561 x 10
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456 PeriodSeq Period     time event timesq     k Dk_plus1
#        <dbl>                     <int> <lgl>                    <int> <fct>     <dbl> <lgl>  <dbl> <dbl> <lgl>   
#  1 130298303                       273 FALSE                        1 (0,84]       84 FALSE   7056     0 FALSE   
#  2 130298303                       273 FALSE                        2 (84,168]    168 FALSE  28224     1 FALSE   
#  3 130298303                       273 FALSE                        3 (168,252]   252 FALSE  63504     2 FALSE   
#  4 130298303                       273 FALSE                        4 (252,336]   336 FALSE 112896     3 FALSE   
#  5 357944602                       252 TRUE                         1 (0,84]       84 FALSE   7056     0 FALSE   
#  6 357944602                       252 TRUE                         2 (84,168]    168 FALSE  28224     1 FALSE   
#  7 357944602                       252 TRUE                         3 (168,252]   252 TRUE   63504     2 TRUE    
#  8 514563701                       273 FALSE                        1 (0,84]       84 FALSE   7056     0 FALSE   
#  9 514563701                       273 FALSE                        2 (84,168]    168 FALSE  28224     1 FALSE   
# 10 514563701                       273 FALSE                        3 (168,252]   252 FALSE  63504     2 FALSE   
# # ... with 9,551 more rows















#@@ analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes ====  
.t0 = Sys.time()
analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes =
    c("PrimaryOutcome123456", "PrimaryOutcome1", "PrimaryOutcome2", "PrimaryOutcome3", "PrimaryOutcome4", "PrimaryOutcome5", "PrimaryOutcome6") %>% set_names(.) %>% 
    map(function(i) {
        warning(i)
        data = analyticDF2797.PersonTime7 %>% 
            mutate( Dk_plus1 = eval(parse(text = paste0("(", i, " == 1) & (", i, ".time <= PeriodSeq * Interval)") )) ) %>% 
            mutate(ksq = k*k) %>% select(
                Dk_plus1, Exposure, k, ksq
                , Age_at_lmp, `year(lmp)`
                , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset 
            )
        analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates = glm(formula = Dk_plus1 ~ . , data = data, family = binomial)
        analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates
    })
Sys.time() - .t0
warnings()
# There were 13 warnings (use warnings() to see them)
# > Sys.time() - .t0
# Time difference of 13.99857 secs
# > warnings()
# Warning messages:
# 1: In .f(.x[[i]], ...) : PrimaryOutcome123456
# 2: In .f(.x[[i]], ...) : PrimaryOutcome1
# 3: In .f(.x[[i]], ...) : PrimaryOutcome2
# 4: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 5: In .f(.x[[i]], ...) : PrimaryOutcome3
# 6: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 7: In .f(.x[[i]], ...) : PrimaryOutcome4
# 8: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 9: In .f(.x[[i]], ...) : PrimaryOutcome5
# 10: glm.fit: algorithm did not converge
# 11: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 12: In .f(.x[[i]], ...) : PrimaryOutcome6
# 13: glm.fit: fitted probabilities numerically 0 or 1 occurred














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
    analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
    {bind_cols(
        transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
        ,
        map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
            paste0(x, " (", round(y*100,2), "%)")
        }) 
    )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value)







#@ end -----  
openxlsx::write.xlsx(analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI
                     , "analyticDF2797.PersonTime7.glmOutcome_Exposure_Covariates.list_PrimaryOutcomes.ORCI.xlsx", asTable=TRUE)








                                                         
                                                         
                                                         

#@ analyticDF2797.Outcome2PersonTime7 ====  
Interval = 7
analyticDF2797.Outcome2PersonTime7 =
    analyticDF2797 %>% 
    mutate(PeriodSeq = SecondaryOutcomeP1456fhkl.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest %>%  
    mutate(
        Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") |> as.factor()
        , time = PeriodSeq * Interval
        , event = (SecondaryOutcomeP1456fhkl == 1) & (SecondaryOutcomeP1456fhkl.time <= PeriodSeq * Interval)
        , timesq = time*time
        , k = PeriodSeq - 1  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
        , Dk_plus1 = event  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks 
    ) 
analyticDF2797.Outcome2PersonTime7 %>% select(ENROLID, SecondaryOutcomeP1456fhkl.time, SecondaryOutcomeP1456fhkl, PeriodSeq, Period, time, timesq, event, k, Dk_plus1) #----
# > analyticDF2797.Outcome2PersonTime7 %>% select(ENROLID, SecondaryOutcomeP1456fhkl.time, SecondaryOutcomeP1456fhkl, PeriodSeq, Period, time, timesq, event, k, Dk_plus1) #----  
# # A tibble: 93,336 x 10
#      ENROLID SecondaryOutcomeP1456fhkl.time SecondaryOutcomeP1456fhkl PeriodSeq Period   time timesq event     k Dk_plus1
#        <dbl>                          <int> <lgl>                         <int> <fct>   <dbl>  <dbl> <lgl> <dbl> <lgl>   
#  1 130298303                            273 FALSE                             1 (0,7]       7     49 FALSE     0 FALSE   
#  2 130298303                            273 FALSE                             2 (7,14]     14    196 FALSE     1 FALSE   
#  3 130298303                            273 FALSE                             3 (14,21]    21    441 FALSE     2 FALSE   
#  4 130298303                            273 FALSE                             4 (21,28]    28    784 FALSE     3 FALSE   
#  5 130298303                            273 FALSE                             5 (28,35]    35   1225 FALSE     4 FALSE   
#  6 130298303                            273 FALSE                             6 (35,42]    42   1764 FALSE     5 FALSE   
#  7 130298303                            273 FALSE                             7 (42,49]    49   2401 FALSE     6 FALSE   
#  8 130298303                            273 FALSE                             8 (49,56]    56   3136 FALSE     7 FALSE   
#  9 130298303                            273 FALSE                             9 (56,63]    63   3969 FALSE     8 FALSE   
# 10 130298303                            273 FALSE                            10 (63,70]    70   4900 FALSE     9 FALSE   
# # ... with 93,326 more rows


#@ Check the counts/proportions of each outcome by exposure -----  
analyticDF2797 %>% select(Exposure, matches("Outcome"), -matches("time")) |> summary() #----
analyticDF2797 %>% group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), funs(sum)) %>% column_to_rownames("Exposure") %>% t |> addmargins() #----
analyticDF2797 %>% group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), funs(mean)) %>% column_to_rownames("Exposure") %>% t |> addmargins() %>% round(2) #----



#@@ analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates ====  
data = analyticDF2797.Outcome2PersonTime7 %>% mutate(ksq = k*k) %>% select(
    Dk_plus1, Exposure, k, ksq
    , Age_at_lmp, `year(lmp)`
    , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset
)
analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates = glm(formula = Dk_plus1 ~ . , data = data, family = binomial)
analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) |> as.data.frame() %>% rownames_to_column |> as_tibble() #----




#@@ analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes ====  
.t0 = Sys.time()
analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes =
    c("PrimaryOutcome123456", "SecondaryOutcomeP1456fhkl", "PrimaryOutcome1", 
      "PrimaryOutcome2", "PrimaryOutcome3", "PrimaryOutcome4", "PrimaryOutcome5", 
      "PrimaryOutcome6", "SecondaryOutcome1", "SecondaryOutcome4", 
      "SecondaryOutcome5", "SecondaryOutcome6", "SecondaryOutcome7", 
      "SecondaryOutcome10", "SecondaryOutcome13", "SecondaryOutcome14", 
      "SecondaryOutcome15", "SecondaryOutcome17", "SecondaryOutcome20", 
      "SecondaryOutcome21") %>% set_names(.) %>% 
    map(function(i) {
        warning(i)
        data = analyticDF2797.Outcome2PersonTime7 %>% 
            mutate( Dk_plus1 = eval(parse(text = paste0("(", i, " == 1) & (", i, ".time <= PeriodSeq * Interval)") )) ) %>% 
            mutate(ksq = k*k) %>% select(
                Dk_plus1, Exposure, k, ksq
                , Age_at_lmp, `year(lmp)`
                , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset 
            )
        analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates = glm(formula = Dk_plus1 ~ . , data = data, family = binomial)
        analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates
    })
Sys.time() - .t0
warnings()
# There were 37 warnings (use warnings() to see them)
# > Sys.time() - .t0
# Time difference of 38.23375 secs
# > warnings()
# Warning messages:
# 1: In .f(.x[[i]], ...) : PrimaryOutcome123456
# 2: In .f(.x[[i]], ...) : SecondaryOutcomeP1456fhkl
# 3: In .f(.x[[i]], ...) : PrimaryOutcome1
# 4: In .f(.x[[i]], ...) : PrimaryOutcome2
# 5: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 6: In .f(.x[[i]], ...) : PrimaryOutcome3
# 7: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 8: In .f(.x[[i]], ...) : PrimaryOutcome4
# 9: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 10: In .f(.x[[i]], ...) : PrimaryOutcome5
# 11: glm.fit: algorithm did not converge
# 12: glm.fit: fitted probabilities numerically 0 or 1 occurred
# 13: In .f(.x[[i]], ...) : PrimaryOutcome6
# 14: glm.fit: fitted probabilities numerically 0 or 1 occurred


analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes %>% 
    map(function(glmObject) {
        out = glmObject %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) |> as.data.frame() %>% rownames_to_column |> as_tibble()
        out = out %>% mutate(
            rowname = rowname
            , `estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(`exp(coef(.))`,2)), " (", sprintf("%.2f",round(`2.5 %`,2)), ", ", sprintf("%.2f",round(`97.5 %`,2)), ")")
            , `estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(`exp(coef(.))`,3)), " (", sprintf("%.3f",round(`2.5 %`,3)), ", ", sprintf("%.3f",round(`97.5 %`,3)), ")")
            , `exp(coef(.))` = `exp(coef(.))`,  `2.5 %` = `2.5 %`, `97.5 %` = `97.5 %`, `Pr(>|z|)`
        ) %>% select(rowname, `estimate (95% CI) %.2f`, `estimate (95% CI) %.3f`, everything())
        out %>% dplyr::filter(rowname %in% c("Exposuremetformin_after_insulin"))
    }) %>% bind_rows(.id = ".id") #----










#@ analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes.ORCI =====  
analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes.ORCI = list()
analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes.ORCI$list_SecondaryOutcomes.ORCI = 
    analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes %>% 
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

analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes.ORCI$nOutcome_byExposure =
    analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
    {bind_cols(
        transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
        ,
        map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
            paste0(x, " (", round(y*100,2), "%)")
        }) 
    )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value)


#@ end -----  
openxlsx::write.xlsx(analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes.ORCI
                     , "analyticDF2797.Outcome2PersonTime7.glmOutcome2_Exposure_Covariates.list_SecondaryOutcomes.ORCI.xlsx", asTable=TRUE)























