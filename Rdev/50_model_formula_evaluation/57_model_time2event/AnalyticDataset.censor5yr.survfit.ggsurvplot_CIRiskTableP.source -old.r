# plot_surv200401.censor5yr.survfit.ggsurvplot_CIRiskTableP from .r

# [Plot] Stratified Kaplan-Meier Survival Curve ---------
# ```{r, paged.print=FALSE, fig.width=8, fig.height=6}
library(tidyverse)
# library(survival)
# library(survminer)
# ?survival::lung 
AnalyticDataset = survival::lung %>% mutate(event = as.logical(status-1), Group = c("Male", "Female")[sex] %>% as.factor)
# AnalyticDataset %>% select(sex, Group) |> str()
# AnalyticDataset %>% select(sex, Group) %>% table
# # > AnalyticDataset %>% select(sex, Group) |> str()
# # 'data.frame':	228 obs. of  2 variables:
# #  $ sex  : num  1 1 1 1 1 1 2 2 1 1 ...
# #  $ Group: Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
# # > AnalyticDataset %>% select(sex, Group) %>% table
# #    Group
# # sex Female Male
# #   1      0  138
# #   2     90    0
AnalyticDataset %>% select(time, event, Group) |> summary()

# ?survminer::ggsurvplot  # "event" plots cumulative events (f(y) = 1-y), "cumhaz" plots the cumulative hazard function (f(y) = -log(y)), and "pct" for survival probability in percentage.
# AnalyticDataset.survfit %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.survfit %>% ggsurvplot(fun = "event")
# AnalyticDataset.survfit %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)
value_for_censor_at_1yr = 365 * 1
value_for_break.time.by = 30
time_scale = "days"
varname4Group = "Group"
AnalyticDataset.censor1yr = AnalyticDataset %>% mutate(
    # time.censor1yr = pmin(time, value_for_censor_at_1yr)
    # , event.censor1yr = ifelse(time < value_for_censor_at_1yr, event, 0)
    time = pmin(time, value_for_censor_at_1yr)
    , event = ifelse(time < value_for_censor_at_1yr, event, F)
)
survminer::ggsurvplot(survival::survfit(survival::Surv(time = time, event = event) ~ Group, data = AnalyticDataset.censor1yr), palette = c("#00AFBB", "#FC4E07")
           , break.time.by = value_for_break.time.by
           , conf.int = TRUE, risk.table = TRUE, pval = TRUE
           , title = paste0("Survival Curves Stratified by ", varname4Group)
           , xlab = paste0("Time in ", time_scale), ylab = "Survival Probability")

















#--------------
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


library(survival)
library(survminer)

# ?survival::Surv
# ?survival::survfit
# AnalyticDataset = plot_surv200401 %>% mutate(time = FU, event = SURV, Group = as.factor(stage))
AnalyticDataset = plot_surv200401 %>% mutate(
    time = FU / 365
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

# ?survminer::ggsurvplot  # "event" plots cumulative events (f(y) = 1-y), "cumhaz" plots the cumulative hazard function (f(y) = -log(y)), and "pct" for survival probability in percentage.

# AnalyticDataset.survfit %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.survfit %>% ggsurvplot(fun = "event")
# AnalyticDataset.survfit %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.survfit %>% ggsurvplot  # default fun = "pct"?
AnalyticDataset.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)


AnalyticDataset.coxph <- coxph(Surv(time = time, event = event) ~ Group, data = AnalyticDataset)
AnalyticDataset.coxph |> summary() #----
AnalyticDataset.coxph %>% cox.zph # * Caution) significant = bad news, large p = good news~! Having very small p values indicates that there are time dependent coefficients which you need to take care of ----
AnalyticDataset.coxph %>% cox.zph %>% ggcoxzph #----
# > AnalyticDataset.coxph |> summary() #----
# Call:
# coxph(formula = Surv(time = time, event = event) ~ Group, data = AnalyticDataset)
# 
#   n= 349, number of events= 76 
# 
#            coef exp(coef) se(coef)      z Pr(>|z|)    
# Group4  -0.4356    0.6469   1.0283 -0.424   0.6719    
# Group5   1.0270    2.7928   1.0300  0.997   0.3187    
# Group6   2.6009   13.4752   1.0408  2.499   0.0125 *  
# Group10  2.2069    9.0873   0.3294  6.699 2.10e-11 ***
# Group12  2.5052   12.2456   0.3168  7.908 2.61e-15 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
#         exp(coef) exp(-coef) lower .95 upper .95
# Group4     0.6469    1.54582   0.08621     4.854
# Group5     2.7928    0.35807   0.37096    21.026
# Group6    13.4752    0.07421   1.75216   103.633
# Group10    9.0873    0.11004   4.76450    17.332
# Group12   12.2456    0.08166   6.58165    22.784
# 
# Concordance= 0.754  (se = 0.028 )
# Rsquare= 0.222   (max possible= 0.903 )
# Likelihood ratio test= 87.62  on 5 df,   p=<2e-16
# Wald test            = 73.57  on 5 df,   p=2e-14
# Score (logrank) test = 109.2  on 5 df,   p=<2e-16
# 
# > AnalyticDataset.coxph %>% cox.zph #----
#           rho chisq       p
# Group4  0.184  2.61 0.10588
# Group5  0.188  2.67 0.10231
# Group6  0.176  2.48 0.11545
# Group10 0.300  7.76 0.00536
# Group12 0.228  4.52 0.03350
# GLOBAL     NA 11.42 0.04371




#@ AnalyticDataset.censor5yr ====

# value_for_censor_at_5yr = 365 * 5
value_for_censor_at_5yr = 5
value_for_break.time.by = 1
AnalyticDataset.censor5yr = AnalyticDataset %>% mutate(
    time.censor5yr = pmin(time, value_for_censor_at_5yr)
    , event.censor5yr = ifelse(time < value_for_censor_at_5yr, event, 0)
)
AnalyticDataset.censor5yr.survfit = survfit(Surv(time = time.censor5yr, event = event.censor5yr) ~ Group, data = AnalyticDataset.censor5yr)

# AnalyticDataset.censor5yr.survfit %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.censor5yr.survfit %>% ggsurvplot(fun = "event")
# AnalyticDataset.censor5yr.survfit %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.censor5yr.survfit %>% ggsurvplot  # default fun = "pct"?
ggsave("plot_surv200401.censor5yr.survfit.ggsurvplot.pdf", width=8, height = 6)
pdf("plot_surv200401.censor5yr.survfit.ggsurvplot_CIRiskTableP.pdf", width=16, height = 12)
# AnalyticDataset.censor5yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor5yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()
png("plot_surv200401.censor5yr.survfit.ggsurvplot_CIRiskTableP.png", width=1200, height = 600)
# AnalyticDataset.censor5yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor5yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()




#@ AnalyticDataset.censor10yr ====

# value_for_censor_at_10yr = 365 * 10
value_for_censor_at_10yr = 10
value_for_break.time.by = 1
AnalyticDataset.censor10yr = AnalyticDataset %>% mutate(
    time.censor10yr = pmin(time, value_for_censor_at_10yr)
    , event.censor10yr = ifelse(time < value_for_censor_at_10yr, event, 0)
)
AnalyticDataset.censor10yr.survfit = survfit(Surv(time = time.censor10yr, event = event.censor10yr) ~ Group, data = AnalyticDataset.censor10yr)

# AnalyticDataset.censor10yr.survfit %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.censor10yr.survfit %>% ggsurvplot(fun = "event")
# AnalyticDataset.censor10yr.survfit %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.censor10yr.survfit %>% ggsurvplot  # default fun = "pct"?
ggsave("plot_surv200401.censor10yr.survfit.ggsurvplot.pdf", width=8, height = 6)
pdf("plot_surv200401.censor10yr.survfit.ggsurvplot_CIRiskTableP.pdf", width=16, height = 12)
# AnalyticDataset.censor10yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor10yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()
png("plot_surv200401.censor10yr.survfit.ggsurvplot_CIRiskTableP.png", width=1200, height = 600)
# AnalyticDataset.censor10yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor10yr.survfit %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()


AnalyticDataset.censor10yr.coxph <- coxph(Surv(time = time, event = event) ~ Group, data = AnalyticDataset.censor10yr)
AnalyticDataset.censor10yr.coxph |> summary() #----
AnalyticDataset.censor10yr.coxph %>% cox.zph # * Caution) significant = bad news, large p = good news~! Having very small p values indicates that there are time dependent coefficients which you need to take care of ----
AnalyticDataset.censor10yr.coxph %>% cox.zph %>% ggcoxzph #----
# > AnalyticDataset.censor10yr.coxph |> summary() #----
# Call:
# coxph(formula = Surv(time = time, event = event) ~ Group, data = AnalyticDataset.censor10yr)
# 
#   n= 349, number of events= 76 
# 
#            coef exp(coef) se(coef)      z Pr(>|z|)    
# Group4  -0.4356    0.6469   1.0283 -0.424   0.6719    
# Group5   1.0270    2.7928   1.0300  0.997   0.3187    
# Group6   2.6009   13.4752   1.0408  2.499   0.0125 *  
# Group10  2.2069    9.0873   0.3294  6.699 2.10e-11 ***
# Group12  2.5052   12.2456   0.3168  7.908 2.61e-15 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
#         exp(coef) exp(-coef) lower .95 upper .95
# Group4     0.6469    1.54582   0.08621     4.854
# Group5     2.7928    0.35807   0.37096    21.026
# Group6    13.4752    0.07421   1.75216   103.633
# Group10    9.0873    0.11004   4.76450    17.332
# Group12   12.2456    0.08166   6.58165    22.784
# 
# Concordance= 0.754  (se = 0.028 )
# Rsquare= 0.222   (max possible= 0.903 )
# Likelihood ratio test= 87.62  on 5 df,   p=<2e-16
# Wald test            = 73.57  on 5 df,   p=2e-14
# Score (logrank) test = 109.2  on 5 df,   p=<2e-16
# 
# > AnalyticDataset.censor10yr.coxph %>% cox.zph #----
#           rho chisq       p
# Group4  0.184  2.61 0.10588
# Group5  0.188  2.67 0.10231
# Group6  0.176  2.48 0.11545
# Group10 0.300  7.76 0.00536
# Group12 0.228  4.52 0.03350
# GLOBAL     NA 11.42 0.04371









#@ AnalyticDataset.survfit_byPredictedStage ========
AnalyticDataset.survfit_byPredictedStage <- survfit(Surv(time = time, event = event) ~ PredictedStage, data = AnalyticDataset)

# ?survminer::ggsurvplot  # "event" plots cumulative events (f(y) = 1-y), "cumhaz" plots the cumulative hazard function (f(y) = -log(y)), and "pct" for survival probability in percentage.

# AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot(fun = "event")
# AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot  # default fun = "pct"?
AnalyticDataset.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)



AnalyticDataset.coxph_byPredictedStage <- coxph(Surv(time = time, event = event) ~ PredictedStage, data = AnalyticDataset)
AnalyticDataset.coxph_byPredictedStage |> summary() #----
AnalyticDataset.coxph_byPredictedStage %>% cox.zph # * Caution) significant = bad news, large p = good news~! Having very small p values indicates that there are time dependent coefficients which you need to take care of ----
AnalyticDataset.coxph_byPredictedStage %>% cox.zph %>% ggcoxzph #----
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
# > AnalyticDataset.coxph_byPredictedStage %>% cox.zph #----
#                      rho chisq         p
# PredictedStageII  0.1349   820 2.82e-180
# PredictedStageIII 0.1341   817 8.84e-180
# PredictedStageIV  0.0751   257  8.82e-58
# GLOBAL                NA  1451 2.53e-314

# Having very small p values indicates that there are time dependent coefficients which you need to take care of.


#@ AnalyticDataset.censor5yr ====

# value_for_censor_at_5yr = 365 * 5
value_for_censor_at_5yr = 5
AnalyticDataset.censor5yr = AnalyticDataset %>% mutate(
    time.censor5yr = pmin(time, value_for_censor_at_5yr)
    , event.censor5yr = ifelse(time < value_for_censor_at_5yr, event, 0)
)
AnalyticDataset.censor5yr.survfit_byPredictedStage = survfit(Surv(time = time.censor5yr, event = event.censor5yr) ~ PredictedStage, data = AnalyticDataset.censor5yr)

# AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(fun = "event")
# AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot  # default fun = "pct"?
ggsave("plot_surv200401.censor5yr.survfit_byPredictedStage.ggsurvplot.pdf", width=8, height = 6)
pdf("plot_surv200401.censor5yr.survfit_byPredictedStage.ggsurvplot_CIRiskTableP.pdf", width=16, height = 12)
# AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()
png("plot_surv200401.censor5yr.survfit_byPredictedStage.ggsurvplot_CIRiskTableP.png", width=1200, height = 600)
# AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor5yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()




#@ AnalyticDataset.censor10yr ====

# value_for_censor_at_10yr = 365 * 10
value_for_censor_at_10yr = 10
AnalyticDataset.censor10yr = AnalyticDataset %>% mutate(
    time.censor10yr = pmin(time, value_for_censor_at_10yr)
    , event.censor10yr = ifelse(time < value_for_censor_at_10yr, event, 0)
)
AnalyticDataset.censor10yr.survfit_byPredictedStage = survfit(Surv(time = time.censor10yr, event = event.censor10yr) ~ PredictedStage, data = AnalyticDataset.censor10yr)

# AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(fun = "pct")  # default fun = "pct"?
# AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(fun = "event")
# AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(fun = "cumhaz")  # Cumulative Hazard = -log S(t)

AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot  # default fun = "pct"?
ggsave("plot_surv200401.censor10yr.survfit_byPredictedStage.ggsurvplot.pdf", width=8, height = 6)
pdf("plot_surv200401.censor10yr.survfit_byPredictedStage.ggsurvplot_CIRiskTableP.pdf", width=16, height = 12)
# AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()
png("plot_surv200401.censor10yr.survfit_byPredictedStage.ggsurvplot_CIRiskTableP.png", width=1200, height = 600)
# AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T)
AnalyticDataset.censor10yr.survfit_byPredictedStage %>% ggsurvplot(conf.int = T, risk.table = T, pval = T, break.time.by = value_for_break.time.by)
dev.off()


AnalyticDataset.censor10yr.coxph_byPredictedStage <- coxph(Surv(time = time, event = event) ~ PredictedStage, data = AnalyticDataset.censor10yr)
AnalyticDataset.censor10yr.coxph_byPredictedStage |> summary() #----
AnalyticDataset.censor10yr.coxph_byPredictedStage %>% cox.zph # * Caution) significant = bad news, large p = good news~! Having very small p values indicates that there are time dependent coefficients which you need to take care of ----
AnalyticDataset.censor10yr.coxph_byPredictedStage %>% cox.zph %>% ggcoxzph #----
# > AnalyticDataset.censor10yr.coxph_byPredictedStage |> summary() #----
# Call:
# coxph(formula = Surv(time = time, event = event) ~ PredictedStage, 
#     data = AnalyticDataset.censor10yr)
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
# > AnalyticDataset.censor10yr.coxph_byPredictedStage %>% cox.zph #----
#                      rho chisq         p
# PredictedStageII  0.1349   820 2.82e-180
# PredictedStageIII 0.1341   817 8.84e-180
# PredictedStageIV  0.0751   257  8.82e-58
# GLOBAL                NA  1451 2.53e-314




#@ end -----


