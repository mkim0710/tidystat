# data.summarize_all_sum_is.na.source.r



#@ analyticDF.TargetTrial2v40.2.206vs373.coxphTimeOutcome_Exposure_Covariates ====
library(survival)
# data = analyticDF.TargetTrial2v40.2.206vs373 %>% mutate(Exposure = ifelse(Intervention, "1 InsulinMetformin", "0 InsulinOnly") %>% as.factor) %>% mutate_if(is.logical, as.numeric) %>% 
data = analyticDF.TargetTrial2v40.2.206vs373 %>% mutate(Metformin = Intervention) %>% mutate_if(is.logical, as.numeric) %>% 
    mutate(Time2Event = PrimaryOutcome123456.time, Event = PrimaryOutcome123456
           # , Time2Censor = PrimaryOutcome123456.time #, Censor = PrimaryOutcome123456
    ) %>% 
    select(Time2Event, Event
           , Metformin
           , lmp.year  # Year at LMP
           , Age_at_lmp  # Age at LMP
           , t_N180_42.ICD9_CKD_exceptARF  # Chronic Kidney Disease
           , t_N180_42.ICD9_HTN.Superset  # Hypertension
           , t_N180_42.ICD9_Asthma  # Asthma
           , t_N180_42.ICD9_Thyroid.Superset  # Thyroid Disease
           , t_N180_42.ICD9_Depression.Superset  #
           , t_N180_42.ICD9_SubstanceAbuse  # SubstancDepressione Abusive Disorder
           , t_N180_42.ICD9_Bipolar  # Bipolar Disorder
           , t_N180_42.ICD9_Anxiety  # Anxiety Disorder
           , t_N180_42.ICD9_Hyperlipidemia  # Hyperlipidemia
           , t_N180_42.ICD9_Cerebrovascular  # Cerebrovascular disease
           , t_N180_42.ICD9_Obesity  # Obesity
           , t_N180_42.ICD9_PolycysticOvaries  # Polycystic Ovaries
           , t_N180_42.ICD9_Acne  # Acne
           , t_N180_42.ICD9_CPT_PregnancyTest.Superset  # Pregnancy Test
           , t_N180_42.ICD9_DMrenal  # Diabetes with renal manifestations
           , t_N180_42.ICD9_DMophthalmic  # Diabetes with ophthalmic manifestations
           , t_N180_42.ICD9_DMneurological  # Diabetes with neurological manifestations
           , t_N180_42.ICD9_DMperipheral  # Diabetes with peripheral circulatory disorders
           , t_N180_42.ICD9_DMother  # Diabetes with other specified manifestations
           , t_N180_42.ICD9_DMunspecifiedCx  # Diabetes with unspecified complication
           , t_N180_42.ICD9_DMuncontrolledT2  # Diabetes uncontrolled
           , t_N180_N91.RxCONCEPT_NDC_insulin.DDD.meanSTRNGTHpD  # Mean dose of insulin (U) per day from 24 to 12 weeks prior to LMP
           , t_N180_N91.RxCONCEPT_NDC_metformin.DDD.meanSTRNGTHpD  # Mean dose of metformin (MG) per day from 24 to 12 weeks prior to LMP
           , t_N90_60.RxCONCEPT_NDC_insulin.DDD.meanSTRNGTHpD  # Mean dose of insulin (U) per day from 12 weeks prior to LMP to GA 8 weeks
           , t_N90_60.RxCONCEPT_NDC_metformin.DDD.meanSTRNGTHpD  # Mean dose of metformin (MG) per day from 12 weeks prior to LMP to GA 8 weeks
           , Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.any  # added 200425
    )
# data %>% summarise_all(list(~sum(is.na(.)))) %>% t # Caution) always check for missing values~!!! -----
data %>% summarise_all(function(x) sum(is.na(x)) ) %>% t # Caution) always check for missing values~!!! -----
data %>% names %>% deparse %>% cat; cat("\n") #----
data %>% names %>% paste(collapse = ", ") #----
analyticDF.TargetTrial2v40.2.206vs373.coxphTimeOutcome_Exposure_Covariates = 
    coxph(formula = Surv(time=Time2Event,event=Event) ~ . , data = data, method = "breslow")
analyticDF.TargetTrial2v40.2.206vs373.coxphTimeOutcome_Exposure_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) %>% as.data.frame %>% rownames_to_column %>% as.tibble %>% print(n=99) #----
analyticDF.TargetTrial2v40.2.206vs373.coxphTimeOutcome_Exposure_Covariates %>% cox.zph #----
analyticDF.TargetTrial2v40.2.206vs373.coxphTimeOutcome_Exposure_Covariates %>% cox.zph %>% plot(var = c("Metformin"))
analyticDF.TargetTrial2v40.2.206vs373.coxphTimeOutcome_Exposure_Covariates %>% cox.zph %>% {survminer::ggcoxzph(., var = c("Metformin"), font.main = 12, caption = "")}



#@ end -----
