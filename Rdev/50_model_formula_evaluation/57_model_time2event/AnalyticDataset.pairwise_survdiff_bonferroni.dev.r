# AnalyticDataset.pairwise_survdiff_bonferonni (200401) from plot_surv200401 .r


library(tidyverse)

library(readxl)
plot_surv200401 <- read_excel("plot_surv200401.xlsx") %>% mutate(
    stage = stage %>% as.factor
    , stage2 = stage2 %>% as.factor
    # , SURV = SURV %>% as.factor
    , age_70 = age_70 %>% as.factor
    , opnum2 = opnum2 %>% as.factor
    , id = id %>% as.factor
)

plot_surv200401$stage %>% table #----
plot_surv200401$stage2 %>% table #----
# > plot_surv200401$stage %>% table #----
# .
#     1     4     5     6     7    10    12 
# 17543  6633  1021   999   448 21378 23571 
# > plot_surv200401$stage2 %>% table #----
# .
#     1     2     3     4 
# 17543  6633  2468 44949 


library(survival)
library(survminer)

?survival::Surv
?survival::survfit
AnalyticDataset = plot_surv200401 %>% mutate(
    time = FU
    , event = SURV
    , Group = stage %>% recode(
               `1` = "1 STx"
               , `4` = "2 STx CTx"
               , `5` = "3 STx CTx RTx"
               , `6` = "4 STx RTx CTx"
               , `7` = "5 CTx STx"
               , `10` = "6 CCRT"
               , `12` = "7 CTx"
           )
    , PredictedStage = stage %>% recode(
        `1` = "I"
        , `4` = "II"
        , `5` = "III"
        , `6` = "III"
        , `7` = "III"
        , `10` = "III"
        , `12` = "IV"
    )
)
AnalyticDataset.survfit <- survfit(Surv(time = time, event = event) ~ Group, data = AnalyticDataset)

AnalyticDataset.survfit_byPredictedStage <- survfit(Surv(time = time, event = event) ~ PredictedStage, data = AnalyticDataset)


?survminer::ggsurvplot  # "event" plots cumulative events (f(y) = 1-y), "cumhaz" plots the cumulative hazard function (f(y) = -log(y)), and "pct" for survival probability in percentage.

# AnalyticDataset.survfit %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.survfit %>% ggsurvplot(fun = "event")
# AnalyticDataset.survfit %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.survfit %>% ggsurvplot  # default fun = "pct"?
AnalyticDataset.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)


AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot  # default fun = "pct"?
AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)



AnalyticDataset.coxph <- coxph(Surv(time = time, event = event) ~ Group, data = AnalyticDataset)
AnalyticDataset.coxph |> summary() #----
AnalyticDataset.coxph %>% cox.zph  # * Caution) significant = bad news, large p = good news~! Having very small p values indicates that there are time dependent coefficients which you need to take care of ----
AnalyticDataset.coxph %>% cox.zph %>% ggcoxzph
# > AnalyticDataset.coxph |> summary() #----
# Call:
# coxph(formula = Surv(time = time, event = event) ~ Group, data = AnalyticDataset)
# 
#   n= 71593, number of events= 45001 
# 
#                        coef exp(coef) se(coef)      z Pr(>|z|)    
# Group2 STx CTx      0.71925   2.05289  0.02722  26.42   <2e-16 ***
# Group3 STx CTx RTx  1.17814   3.24833  0.04568  25.79   <2e-16 ***
# Group4 STx RTx CTx  1.29696   3.65815  0.04524  28.67   <2e-16 ***
# Group5 CTx STx      0.90484   2.47155  0.07216  12.54   <2e-16 ***
# Group6 CCRT         2.18906   8.92679  0.01990 110.02   <2e-16 ***
# Group7 CTx          2.58460  13.25795  0.01991 129.80   <2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
#                    exp(coef) exp(-coef) lower .95 upper .95
# Group2 STx CTx         2.053    0.48712     1.946     2.165
# Group3 STx CTx RTx     3.248    0.30785     2.970     3.553
# Group4 STx RTx CTx     3.658    0.27336     3.348     3.997
# Group5 CTx STx         2.472    0.40460     2.146     2.847
# Group6 CCRT            8.927    0.11202     8.585     9.282
# Group7 CTx            13.258    0.07543    12.751    13.786
# 
# Concordance= 0.714  (se = 0.001 )
# Rsquare= 0.367   (max possible= 1 )
# Likelihood ratio test= 32706  on 6 df,   p=<2e-16
# Wald test            = 22402  on 6 df,   p=<2e-16
# Score (logrank) test = 30157  on 6 df,   p=<2e-16
# 
# > AnalyticDataset.coxph %>% cox.zph # * Caution) significant = bad news ~!!! -----
#                       rho  chisq         p
# Group2 STx CTx     0.1353  824.7 2.29e-181
# Group3 STx CTx RTx 0.1062  509.5 8.30e-113
# Group4 STx RTx CTx 0.0902  367.0  8.50e-82
# Group5 CTx STx     0.0342   52.6  4.11e-13
# Group6 CCRT        0.1401  897.1 4.26e-197
# Group7 CTx         0.0777  275.3  7.88e-62
# GLOBAL                 NA 1841.7  0.00e+00


AnalyticDataset.coxph_byPredictedStage <- coxph(Surv(time = time, event = event) ~ PredictedStage, data = AnalyticDataset)
AnalyticDataset.coxph_byPredictedStage |> summary() #----
AnalyticDataset.coxph_byPredictedStage %>% cox.zph # * Caution) significant = bad news, large p = good news~! Having very small p values indicates that there are time dependent coefficients which you need to take care of ----
AnalyticDataset.coxph_byPredictedStage %>% cox.zph %>% ggcoxzph
# > AnalyticDataset.coxph_byPredictedStage |> summary() #----
# Call:
# coxph(formula = Surv(time = time, event = event) ~ PredictedStage, 
#     data = AnalyticDataset)
# 
#   n= 71593, number of events= 45001 
# 
#                       coef exp(coef) se(coef)      z Pr(>|z|)    
# PredictedStageII   0.71708   2.04844  0.02722  26.34   <2e-16 ***
# PredictedStageIII  2.06106   7.85426  0.01972 104.51   <2e-16 ***
# PredictedStageIV   2.56581  13.01113  0.01989 129.03   <2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
#                   exp(coef) exp(-coef) lower .95 upper .95
# PredictedStageII      2.048    0.48818     1.942     2.161
# PredictedStageIII     7.854    0.12732     7.556     8.164
# PredictedStageIV     13.011    0.07686    12.514    13.528
# 
# Concordance= 0.707  (se = 0.001 )
# Rsquare= 0.351   (max possible= 1 )
# Likelihood ratio test= 30970  on 3 df,   p=<2e-16
# Wald test            = 21063  on 3 df,   p=<2e-16
# Score (logrank) test = 28354  on 3 df,   p=<2e-16
# 
# > AnalyticDataset.coxph_byPredictedStage %>% cox.zph # * Caution) significant = bad news ~!!! -----
#                      rho chisq         p
# PredictedStageII  0.1349   820 2.82e-180
# PredictedStageIII 0.1341   817 8.84e-180
# PredictedStageIV  0.0751   257  8.82e-58
# GLOBAL                NA  1451 2.53e-314





# http://www.sthda.com/english/wiki/survminer-0-3-0

?pairwise_survdiff
AnalyticDataset.pairwise_survdiff <- pairwise_survdiff(Surv(time = time, event = event) ~ Group, data = AnalyticDataset)
AnalyticDataset.pairwise_survdiff
AnalyticDataset.pairwise_survdiff %>% {symnum(.$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1), symbols = c("****", "***", "**", "*", "+", " "), abbr.colnames = FALSE, na = "")} # Symbolic number coding ----
# > AnalyticDataset.pairwise_survdiff
# 
# 	Pairwise comparisons using Log-Rank test 
# 
# data:  AnalyticDataset and Group 
# 
#               1 STx   2 STx CTx 3 STx CTx RTx 4 STx RTx CTx 5 CTx STx 6 CCRT 
# 2 STx CTx     < 2e-16 -         -             -             -         -      
# 3 STx CTx RTx < 2e-16 < 2e-16   -             -             -         -      
# 4 STx RTx CTx < 2e-16 < 2e-16   0.041         -             -         -      
# 5 CTx STx     < 2e-16 0.031     8.6e-05       4.5e-08       -         -      
# 6 CCRT        < 2e-16 < 2e-16   < 2e-16       < 2e-16       < 2e-16   -      
# 7 CTx         < 2e-16 < 2e-16   < 2e-16       < 2e-16       < 2e-16   < 2e-16
# 
# P value adjustment method: BH 
# > AnalyticDataset.pairwise_survdiff %>% {symnum(.$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1), symbols = c("****", "***", "**", "*", "+", " "), abbr.colnames = FALSE, na = "")} # Symbolic number coding ----
#               1 STx 2 STx CTx 3 STx CTx RTx 4 STx RTx CTx 5 CTx STx 6 CCRT
# 2 STx CTx     ****                                                        
# 3 STx CTx RTx ****  ****                                                  
# 4 STx RTx CTx ****  ****      *                                           
# 5 CTx STx     ****  *         ****          ****                          
# 6 CCRT        ****  ****      ****          ****          ****            
# 7 CTx         ****  ****      ****          ****          ****      ****  
# attr(,"legend")
# [1] 0 ‘****’ 1e-04 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘+’ 0.1 ‘ ’ 1 \t    ## NA: ‘’


AnalyticDataset.pairwise_survdiff_unadjusted <- pairwise_survdiff(Surv(time = time, event = event) ~ Group, data = AnalyticDataset, p.adjust.method = "none")
AnalyticDataset.pairwise_survdiff_unadjusted
AnalyticDataset.pairwise_survdiff_unadjusted %>% {symnum(.$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1), symbols = c("****", "***", "**", "*", "+", " "), abbr.colnames = FALSE, na = "")} # Symbolic number coding ----
# > AnalyticDataset.pairwise_survdiff_unadjusted
# 
# 	Pairwise comparisons using Log-Rank test 
# 
# data:  AnalyticDataset and Group 
# 
#               1 STx   2 STx CTx 3 STx CTx RTx 4 STx RTx CTx 5 CTx STx 6 CCRT 
# 2 STx CTx     < 2e-16 -         -             -             -         -      
# 3 STx CTx RTx < 2e-16 < 2e-16   -             -             -         -      
# 4 STx RTx CTx < 2e-16 < 2e-16   0.041         -             -         -      
# 5 CTx STx     < 2e-16 0.030     7.7e-05       3.8e-08       -         -      
# 6 CCRT        < 2e-16 < 2e-16   < 2e-16       < 2e-16       < 2e-16   -      
# 7 CTx         < 2e-16 < 2e-16   < 2e-16       < 2e-16       < 2e-16   < 2e-16
# 
# P value adjustment method: none 
# > AnalyticDataset.pairwise_survdiff_unadjusted %>% {symnum(.$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1), symbols = c("****", "***", "**", "*", "+", " "), abbr.colnames = FALSE, na = "")} # Symbolic number coding ----
#               1 STx 2 STx CTx 3 STx CTx RTx 4 STx RTx CTx 5 CTx STx 6 CCRT
# 2 STx CTx     ****                                                        
# 3 STx CTx RTx ****  ****                                                  
# 4 STx RTx CTx ****  ****      *                                           
# 5 CTx STx     ****  *         ****          ****                          
# 6 CCRT        ****  ****      ****          ****          ****            
# 7 CTx         ****  ****      ****          ****          ****      ****  
# attr(,"legend")
# [1] 0 ‘****’ 1e-04 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘+’ 0.1 ‘ ’ 1 \t    ## NA: ‘’




?pairwise_survdiff
AnalyticDataset.pairwise_survdiff_bonferroni <- pairwise_survdiff(Surv(time = time, event = event) ~ Group, data = AnalyticDataset, p.adjust.method = "bonferroni")
AnalyticDataset.pairwise_survdiff_bonferroni
AnalyticDataset.pairwise_survdiff_bonferroni %>% {symnum(.$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1), symbols = c("****", "***", "**", "*", "+", " "), abbr.colnames = FALSE, na = "")} # Symbolic number coding ----
# > AnalyticDataset.pairwise_survdiff_bonferroni
# 
# 	Pairwise comparisons using Log-Rank test 
# 
# data:  AnalyticDataset and Group 
# 
#               1 STx   2 STx CTx 3 STx CTx RTx 4 STx RTx CTx 5 CTx STx 6 CCRT 
# 2 STx CTx     < 2e-16 -         -             -             -         -      
# 3 STx CTx RTx < 2e-16 < 2e-16   -             -             -         -      
# 4 STx RTx CTx < 2e-16 < 2e-16   0.8569        -             -         -      
# 5 CTx STx     < 2e-16 0.6200    0.0016        8.1e-07       -         -      
# 6 CCRT        < 2e-16 < 2e-16   < 2e-16       < 2e-16       < 2e-16   -      
# 7 CTx         < 2e-16 < 2e-16   < 2e-16       < 2e-16       < 2e-16   < 2e-16
# 
# P value adjustment method: bonferroni 
# > AnalyticDataset.pairwise_survdiff_bonferroni %>% {symnum(.$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1), symbols = c("****", "***", "**", "*", "+", " "), abbr.colnames = FALSE, na = "")} # Symbolic number coding ----
#               1 STx 2 STx CTx 3 STx CTx RTx 4 STx RTx CTx 5 CTx STx 6 CCRT
# 2 STx CTx     ****                                                        
# 3 STx CTx RTx ****  ****                                                  
# 4 STx RTx CTx ****  ****                                                  
# 5 CTx STx     ****            **            ****                          
# 6 CCRT        ****  ****      ****          ****          ****            
# 7 CTx         ****  ****      ****          ****          ****      ****  
# attr(,"legend")
# [1] 0 ‘****’ 1e-04 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘+’ 0.1 ‘ ’ 1 \t    ## NA: ‘’







#@ end -----
# AnalyticDataset.pairwise_survdiff_unadjusted$p.value %>% as.data.frame %>% rownames_to_column %>% 
#     {openxlsx::write.xlsx(., "AnalyticDataset.pairwise_survdiff_unadjusted (200401).xlsx")}
# AnalyticDataset.pairwise_survdiff_bonferroni$p.value %>% as.data.frame %>% rownames_to_column %>% 
#     {openxlsx::write.xlsx(., "AnalyticDataset.pairwise_survdiff_bonferroni (200401).xlsx")}


out = list()
out$unadjusted = AnalyticDataset.pairwise_survdiff_unadjusted$p.value %>% as.data.frame %>% rownames_to_column
out$bonferroni = AnalyticDataset.pairwise_survdiff_bonferroni$p.value %>% as.data.frame %>% rownames_to_column
out %>% {openxlsx::write.xlsx(., "AnalyticDataset.pairwise_survdiff_bonferroni (200401).xlsx")}

