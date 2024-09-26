# function.Code_vec.list.dot_x.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.Code_vec.list.dot_x.dev.r

filename = "criteria.tbl - manual add 190901 Treatment Arm 191226 DDD 201005 preeclampsia.xlsx"
# ?openxlsx::getSheetNames
openxlsx::getSheetNames(filename) |> dput()
# > openxlsx::getSheetNames(filename) |> dput()
c("Table 1. Baseline", "ManuscriptTable. Codes", "CovariateDefinition191128", 
"OutcomeDefinition201005", "OutcomeDefinition191126void", "ExposureDDD_139", 
"ExposureDDD_Monthly (2)", "ExposureDDD_Monthly", "ExposureDDD", 
"ExposureArms", "ExposureDefinition", "Exposure-void", "ExclusionCriteria", 
"InclusionCriteria-void191008", "InclusionCriteria191008")




# @ list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation =====  
list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation = list()

filename = "criteria.tbl - manual add 190901 Treatment Arm 191226 DDD 201005 preeclampsia.xlsx"
for (
    i in c("CovariateDefinition191128", "OutcomeDefinition201005", "ExposureDDD", "ExposureArms", "ExposureDefinition", "ExclusionCriteria", "InclusionCriteria191008")
) {
    list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[[i]] =
        openxlsx::read.xlsx(filename, sheet = i) %>%
        mutate_at(
            vars(matches("Evaluation"), matches("FilterName"))
            , .funs = function(vec) {vec %>% gsub("&amp;", "&", ., fixed = T) %>% gsub("&gt;", ">", ., fixed = T) %>% gsub("&lt;", "<", ., fixed = T)}
        ) %>%
        as_tibble
}


for (
    i in c("CovariateDefinition191128", "OutcomeDefinition201005", "ExposureDDD", "ExposureArms", "ExposureDefinition", "ExclusionCriteria", "InclusionCriteria191008")
) {
    list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[[i]]$nID.nDate_ge1 = NULL
    list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[[i]]$nID.nDate_ge2 = NULL
    list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[[i]]$nID.nDate_ge3 = NULL
}


list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation |> str() #----
# > list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation |> str() #----  
# List of 7
#  $ CovariateDefinition191128: tibble [53 x 12] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID       : chr [1:53] "t_N180_42.ICD9_CKD_exceptARF" "t_N180_42.ICD9_HTN.Superset" "t_N180_42.ICD9_HTN.Subset" "t_N180_42.ICD9_HTN_pregestational.Subset" ...
#   ..$ CriteriaID.old   : chr [1:53] "Covariate1" "Covariate2" "Covariate2.i" "Covariate2.ii" ...
#   ..$ CriteriaShortName: chr [1:53] "ICD9_CKD_exceptARF" "ICD9_HTN.Superset" "ICD9_HTN.Subset" "ICD9_HTN_pregestational.Subset" ...
#   ..$ t_begin.int      : chr [1:53] "-180" "-180" "-180" "-180" ...
#   ..$ t_end.int        : num [1:53] 42 42 42 42 42 42 42 42 42 42 ...
#   ..$ CodeType         : chr [1:53] "ICD9" NA "ICD9" "ICD9" ...
#   ..$ Code_vec         : chr [1:53] NA NA NA NA ...
#   ..$ Code_vec.list    : chr [1:53] "581, 582, 583, 585, 587, 588" "Boolean_1st_level" "401, 402, 403, 404, 405" "6420, 6421, 6422, 6427" ...
#   ..$ FilterName       : chr [1:53] "t_N180_42.ICD581_582_583_585_587_588" "t_N180_42.Boolean_1st_level" "t_N180_42.ICD401_402_403_404_405" "t_N180_42.ICD6420_6421_6422_6427" ...
#   ..$ FilterRegex      : chr [1:53] "^(581|582|583|585|587|588)" "^(Boolean_1st_level)" "^(401|402|403|404|405)" "^(6420|6421|6422|6427)" ...
#   ..$ Evaluation       : chr [1:53] "t_N180_42.ICD581_582_583_585_587_588 > 0" "((t_N180_42.ICD401_402_403_404_405 > 0)) | ((t_N180_42.ICD6420_6421_6422_6427 > 0))" "t_N180_42.ICD401_402_403_404_405 > 0" "t_N180_42.ICD6420_6421_6422_6427 > 0" ...
#   ..$ note             : num [1:53] NA NA NA NA NA NA NA NA NA NA ...
#  $ OutcomeDefinition201005  : tibble [55 x 12] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID        : chr [1:55] "PrimaryOutcome" "PrimaryOutcome1" "PrimaryOutcome1.i" "PrimaryOutcome1.i.1" ...
#   ..$ CriteriaShortName : chr [1:55] "void(need 1 & 2)" "PregnancyLoss" NA "ICD9_Spontaneous_abortion" ...
#   ..$ t_begin.int       : num [1:55] NA 42 42 42 42 42 42 42 42 42 ...
#   ..$ t_end.int         : num [1:55] NA 280 280 280 280 280 280 280 308 280 ...
#   ..$ CodeType          : chr [1:55] NA "ICD9&CPT" NA "ICD9" ...
#   ..$ Mom_or_Baby       : chr [1:55] NA NA NA "Mom" ...
#   ..$ Code_vec.list     : chr [1:55] NA "final_type in the MSCAN_PREGCOHORT_R4 file" NA "632, 634" ...
#   ..$ FilterName        : chr [1:55] NA "void" "Boolean_2nd_level" "t_42_280.ICD632_634" ...
#   ..$ FilterRegex       : chr [1:55] NA "^(final_type in the MSCAN_PREGCOHORT_R4 file)" "^()" "^(632|634)" ...
#   ..$ Evaluation.ndDate : chr [1:55] NA "void.ndDate > 0" "((t_42_280.ICD632_634.ndDate > 0)) | ((t_42_280.CPT01965_59812_59820_59821_59830.ndDate > 0))" "t_42_280.ICD632_634.ndDate > 0" ...
#   ..$ Evaluation.minDate: chr [1:55] NA "void.minDate" "min(t_42_280.ICD632_634.minDate, t_42_280.CPT01965_59812_59820_59821_59830.minDate)" "t_42_280.ICD632_634.minDate" ...
#   ..$ note              : chr [1:55] NA NA NA "exact time?" ...
#  $ ExposureDDD              : tibble [12 x 10] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID       : chr [1:12] "Insulin_N180_N91" "Insulin_N90_N1" "Insulin_0_90" "Insulin_91_180" ...
#   ..$ CriteriaShortName: num [1:12] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ t_begin.int      : num [1:12] -180 -90 0 91 181 -180 -90 0 91 181 ...
#   ..$ t_end.int        : num [1:12] -91 -1 90 180 270 -91 -1 90 180 270 ...
#   ..$ CodeType         : chr [1:12] "Rx" "Rx" "Rx" "Rx" ...
#   ..$ Code_vec         : num [1:12] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ Code_vec.list    : chr [1:12] "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" ...
#   ..$ FilterName       : chr [1:12] "t_N180_N91.RxCONCEPT_NDC_insulin.DDD" "t_N90_N1.RxCONCEPT_NDC_insulin.DDD" "t_0_90.RxCONCEPT_NDC_insulin.DDD" "t_91_180.RxCONCEPT_NDC_insulin.DDD" ...
#   ..$ FilterRegex      : num [1:12] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ Evaluation       : chr [1:12] NA NA NA NA ...
#  $ ExposureArms             : tibble [21 x 10] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID       : chr [1:21] "Insulin_before_N180" "Insulin_N180_N1" "Insulin_wk0_5" "Insulin_wk6_22" ...
#   ..$ CriteriaShortName: num [1:21] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ t_begin.int      : chr [1:21] "-Inf" "-180" "0" "42" ...
#   ..$ t_end.int        : chr [1:21] "-181" "-1" "41" "160" ...
#   ..$ CodeType         : chr [1:21] "Rx" "Rx" "Rx" "Rx" ...
#   ..$ Code_vec         : num [1:21] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ Code_vec.list    : chr [1:21] "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" ...
#   ..$ FilterName       : chr [1:21] "t_NInf_N181.RxCONCEPT_NDC_insulin.ndDate" "t_N180_N1.RxCONCEPT_NDC_insulin.ndDate" "t_0_41.RxCONCEPT_NDC_insulin.ndDate" "t_42_160.RxCONCEPT_NDC_insulin.ndDate" ...
#   ..$ FilterRegex      : num [1:21] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ Evaluation       : chr [1:21] "t_NInf_N181.RxCONCEPT_NDC_insulin.ndDate > 0" "t_N180_N1.RxCONCEPT_NDC_insulin.ndDate > 0" "t_0_41.RxCONCEPT_NDC_insulin.ndDate > 0" "t_42_160.RxCONCEPT_NDC_insulin.ndDate > 0" ...
#  $ ExposureDefinition       : tibble [78 x 11] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID       : chr [1:78] "Insulin_before_LMP" "Insulin_wk0" "Insulin_wk1" "Insulin_wk2" ...
#   ..$ CriteriaShortName: chr [1:78] "Rx_Insulin" "Rx_Insulin" "Rx_Insulin" "Rx_Insulin" ...
#   ..$ t_begin.int      : chr [1:78] "-Inf" "0" "7" "14" ...
#   ..$ t_end.int        : chr [1:78] "-1" "6" "13" "20" ...
#   ..$ CodeType         : chr [1:78] "Rx" "Rx" "Rx" "Rx" ...
#   ..$ Code_vec         : num [1:78] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ Code_vec.list    : chr [1:78] "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" "CONCEPT_NDC_insulin" ...
#   ..$ FilterName       : chr [1:78] "t_NInf_N1.RxCONCEPT_NDC_insulin" "t_0_6.RxCONCEPT_NDC_insulin" "t_7_13.RxCONCEPT_NDC_insulin" "t_14_20.RxCONCEPT_NDC_insulin" ...
#   ..$ FilterRegex      : chr [1:78] "^(CONCEPT_NDC_insulin)" "^(CONCEPT_NDC_insulin)" "^(CONCEPT_NDC_insulin)" "^(CONCEPT_NDC_insulin)" ...
#   ..$ Evaluation       : chr [1:78] "t_NInf_N1.RxCONCEPT_NDC_insulin > 0" "t_0_6.RxCONCEPT_NDC_insulin > 0" "t_7_13.RxCONCEPT_NDC_insulin > 0" "t_14_20.RxCONCEPT_NDC_insulin > 0" ...
#   ..$ note             : num [1:78] NA NA NA NA NA NA NA NA NA NA ...
#  $ ExclusionCriteria        : tibble [13 x 11] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID       : chr [1:13] "Exc1" "Exc2" "Exc3" "Exc4" ...
#   ..$ CriteriaShortName: chr [1:13] "Rx_Insulin.is0" "ICD9_DMby20wk.is0" "ICD9_DMt1" "Rx_Metformin.lt2" ...
#   ..$ t_begin.int      : chr [1:13] "-Inf" "-Inf" "-Inf" "-Inf" ...
#   ..$ t_end.int        : chr [1:13] "154" "140" "154" "0" ...
#   ..$ CodeType         : chr [1:13] "Rx" "ICD9" "ICD9" "Rx" ...
#   ..$ Code_vec         : chr [1:13] NA NA NA NA ...
#   ..$ Code_vec.list    : chr [1:13] "CONCEPT_NDC_insulin" "250, 6488, 6480" "250x1, 250x3" "CONCEPT_NDC_metformin" ...
#   ..$ FilterName       : chr [1:13] "t_NInf_154.RxCONCEPT_NDC_insulin" "t_NInf_140.ICD250_6488_6480" "t_NInf_154.ICD250x1_250x3" "t_NInf_0.RxCONCEPT_NDC_metformin" ...
#   ..$ FilterRegex      : chr [1:13] "^(CONCEPT_NDC_insulin)" "^(250|6488|6480)" "^250[0-9][13]$" "^(CONCEPT_NDC_metformin)" ...
#   ..$ Evaluation       : chr [1:13] "t_NInf_154.RxCONCEPT_NDC_insulin ==  0" "t_NInf_140.ICD250_6488_6480 ==  0" "t_NInf_154.ICD250x1_250x3 > 0" "t_NInf_0.RxCONCEPT_NDC_metformin < 2" ...
#   ..$ note             : chr [1:13] NA "Caution) This is essentially coded as an inclusion criteria~!! (At least one code by 20 wk)" "Caution) On Dr. Hernandez-Diaz's algorithm, DMt1 also need insulin, but no non-metformin type2 antidiabetics, p"| __truncated__ NA ...
#  $ InclusionCriteria191008  : tibble [46 x 11] (S3: tbl_df/tbl/data.frame)
#   ..$ CriteriaID       : chr [1:46] "Inc0" "Inc1" "Inc2" "Inc2.ia" ...
#   ..$ CriteriaShortName: chr [1:46] "LMP.le2014" "Age_at_LMP.ge18le45" "t2DM (i | ii)" "Pregestational t2DM (1&2&3&4)" ...
#   ..$ t_begin.int      : chr [1:46] NA NA "-180" "-180" ...
#   ..$ t_end.int        : chr [1:46] "2014-12-31" NA NA NA ...
#   ..$ CodeType         : chr [1:46] NA NA NA NA ...
#   ..$ Code_vec         : num [1:46] NA NA NA NA NA NA NA NA NA NA ...
#   ..$ Code_vec.list    : chr [1:46] NA NA NA NA ...
#   ..$ FilterName       : chr [1:46] "t0.le2014" NA "Boolean_1st_level" "Boolean_2nd_level" ...
#   ..$ FilterRegex      : chr [1:46] NA NA NA NA ...
#   ..$ Evaluation       : chr [1:46] NA NA "(((((t_N180_EndDate.ICD250_6488_6480 >= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) & (t_N180_EndDate.RxCONC"| __truncated__ "(((t_N180_EndDate.ICD250_6488_6480 >= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) & (t_N180_EndDate.RxCONCEP"| __truncated__ ...
#   ..$ note             : num [1:46] NA NA NA NA NA NA NA NA NA NA ...









CovariateDefinition191128 = list.tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation$CovariateDefinition191128
CovariateDefinition191128 %>% tribble_paste()
CovariateDefinition191128 = tibble::tribble(
                                                ~CriteriaID,   ~CriteriaID.old,                ~CriteriaShortName, ~t_begin.int, ~t_end.int, ~CodeType,                      ~Code_vec,                                                                               ~Code_vec.list,                                                                                ~FilterName,                                                                     ~FilterRegex,                                                                                                                                          ~Evaluation, ~note,
                             "t_N180_42.ICD9_CKD_exceptARF",      "Covariate1",              "ICD9_CKD_exceptARF",       "-180",         42,    "ICD9",                             NA,                                                               "581, 582, 583, 585, 587, 588",                                                     "t_N180_42.ICD581_582_583_585_587_588",                                                     "^(581|582|583|585|587|588)",                                                                                                           "t_N180_42.ICD581_582_583_585_587_588 > 0",    NA,
                              "t_N180_42.ICD9_HTN.Superset",      "Covariate2",               "ICD9_HTN.Superset",       "-180",         42,        NA,                             NA,                                                                          "Boolean_1st_level",                                                              "t_N180_42.Boolean_1st_level",                                                           "^(Boolean_1st_level)",                                                                "((t_N180_42.ICD401_402_403_404_405 > 0)) | ((t_N180_42.ICD6420_6421_6422_6427 > 0))",    NA,
                                "t_N180_42.ICD9_HTN.Subset",    "Covariate2.i",                 "ICD9_HTN.Subset",       "-180",         42,    "ICD9",                             NA,                                                                    "401, 402, 403, 404, 405",                                                         "t_N180_42.ICD401_402_403_404_405",                                                         "^(401|402|403|404|405)",                                                                                                               "t_N180_42.ICD401_402_403_404_405 > 0",    NA,
                 "t_N180_42.ICD9_HTN_pregestational.Subset",   "Covariate2.ii",  "ICD9_HTN_pregestational.Subset",       "-180",         42,    "ICD9",                             NA,                                                                     "6420, 6421, 6422, 6427",                                                         "t_N180_42.ICD6420_6421_6422_6427",                                                         "^(6420|6421|6422|6427)",                                                                                                               "t_N180_42.ICD6420_6421_6422_6427 > 0",    NA,
                                    "t_N180_42.ICD9_Asthma",      "Covariate3",                     "ICD9_Asthma",       "-180",         42,    "ICD9",                             NA,                                                                                        "493",                                                                         "t_N180_42.ICD493",                                                                         "^(493)",                                                                                                                               "t_N180_42.ICD493 > 0",    NA,
                          "t_N180_42.ICD9_Thyroid.Superset",      "Covariate4",           "ICD9_Thyroid.Superset",       "-180",         42,        NA,                             NA,                                                                          "Boolean_1st_level",                                                              "t_N180_42.Boolean_1st_level",                                                           "^(Boolean_1st_level)",                                                                       "((t_N180_42.ICD240_241_242_243_244_245_246 > 0)) | ((t_N180_42.ICD6481 > 0))",    NA,
                        "t_N180_42.ICD9_Thyroid_any.Subset",    "Covariate4.i",         "ICD9_Thyroid_any.Subset",       "-180",         42,    "ICD9",                             NA,                                                          "240, 241, 242, 243, 244, 245, 246",                                                 "t_N180_42.ICD240_241_242_243_244_245_246",                                                 "^(240|241|242|243|244|245|246)",                                                                                                       "t_N180_42.ICD240_241_242_243_244_245_246 > 0",    NA,
                "t_N180_42.ICD9_Thyroid_gestational.Subset",   "Covariate4.ii", "ICD9_Thyroid_gestational.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                       "6481",                                                                        "t_N180_42.ICD6481",                                                                        "^(6481)",                                                                                                                              "t_N180_42.ICD6481 > 0",    NA,
                     "t_N180_42.ICD9_Hypothyroidism.Subset", "Covariate4.ii.1",      "ICD9_Hypothyroidism.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                        "244",                                                                         "t_N180_42.ICD244",                                                                         "^(244)",                                                                                                                               "t_N180_42.ICD244 > 0",    NA,
                       "t_N180_42.ICD9_Depression.Superset",      "Covariate5",        "ICD9_Depression.Superset",       "-180",         42,        NA,                             NA,                                                                          "Boolean_1st_level",                                                              "t_N180_42.Boolean_1st_level",                                                           "^(Boolean_1st_level)", "((t_N180_42.ICD2962_2963 > 0)) | ((t_N180_42.ICD3004 > 0)) | ((t_N180_42.ICD311 > 0)) | ((t_N180_42.ICD3090_3091 > 0)) | ((t_N180_42.ICD2980 > 0))",    NA,
                                "t_N180_42.ICD9_MDD.Subset",    "Covariate5.i",                 "ICD9_MDD.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                 "2962, 2963",                                                                   "t_N180_42.ICD2962_2963",                                                                   "^(2962|2963)",                                                                                                                         "t_N180_42.ICD2962_2963 > 0",    NA,
                          "t_N180_42.ICD9_Dysthymia.Subset",   "Covariate5.ii",           "ICD9_Dysthymia.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                       "3004",                                                                        "t_N180_42.ICD3004",                                                                        "^(3004)",                                                                                                                              "t_N180_42.ICD3004 > 0",    NA,
                      "t_N180_42.ICD9_DepressiveNEC.Subset",  "Covariate5.iii",       "ICD9_DepressiveNEC.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                        "311",                                                                         "t_N180_42.ICD311",                                                                         "^(311)",                                                                                                                               "t_N180_42.ICD311 > 0",    NA,
                         "t_N180_42.ICD9_Adjustment.Subset",   "Covariate5.iv",          "ICD9_Adjustment.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                 "3090, 3091",                                                                   "t_N180_42.ICD3090_3091",                                                                   "^(3090|3091)",                                                                                                                         "t_N180_42.ICD3090_3091 > 0",    NA,
                "t_N180_42.ICD9_DepressivePsychosis.Subset",    "Covariate5.v", "ICD9_DepressivePsychosis.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                       "2980",                                                                        "t_N180_42.ICD2980",                                                                        "^(2980)",                                                                                                                              "t_N180_42.ICD2980 > 0",    NA,
                            "t_N180_42.ICD9_SubstanceAbuse",      "Covariate6",             "ICD9_SubstanceAbuse",       "-180",         42,    "ICD9",                             NA, "291, 292, 303, 304, 305, 3575, 4255, 5710, 5711, 5712, 5713, 6483, 6555, 9650, E8600, V113", "t_N180_42.ICD291_292_303_304_305_3575_4255_5710_5711_5712_5713_6483_6555_9650_E8600_V113", "^(291|292|303|304|305|3575|4255|5710|5711|5712|5713|6483|6555|9650|E8600|V113)",                                                       "t_N180_42.ICD291_292_303_304_305_3575_4255_5710_5711_5712_5713_6483_6555_9650_E8600_V113 > 0",    NA,
                                   "t_N180_42.ICD9_Bipolar",      "Covariate7",                    "ICD9_Bipolar",       "-180",         42,    "ICD9",                             NA,                                                                                        "296",                                                                         "t_N180_42.ICD296",                                                                         "^(296)",                                                                                                                               "t_N180_42.ICD296 > 0",    NA,
                                   "t_N180_42.ICD9_Anxiety",      "Covariate8",                    "ICD9_Anxiety",       "-180",         42,    "ICD9",                             NA,                                          "29384, 3000, 3002, 3003, 30924, 3080, 30981, 3130",                                  "t_N180_42.ICD29384_3000_3002_3003_30924_3080_30981_3130",                                  "^(29384|3000|3002|3003|30924|3080|30981|3130)",                                                                                        "t_N180_42.ICD29384_3000_3002_3003_30924_3080_30981_3130 > 0",    NA,
                                      "t_N180_42.ICD9_Acne",      "Covariate9",                       "ICD9_Acne",       "-180",         42,    "ICD9",                             NA,                                                                                       "7061",                                                                        "t_N180_42.ICD7061",                                                                        "^(7061)",                                                                                                                              "t_N180_42.ICD7061 > 0",    NA,
                "t_N180_42.ICD9_CPT_PregnancyTest.Superset",     "Covariate10", "ICD9_CPT_PregnancyTest.Superset",       "-180",         42,        NA,                             NA,                                                                          "Boolean_1st_level",                                                              "t_N180_42.Boolean_1st_level",                                                           "^(Boolean_1st_level)",                                                                                             "((t_N180_42.ICDV724 > 0)) | ((t_N180_42.CPT81025 > 0))",    NA,
                      "t_N180_42.ICD9_PregnancyTest.Subset",   "Covariate10.i",       "ICD9_PregnancyTest.Subset",       "-180",         42,    "ICD9",                             NA,                                                                                       "V724",                                                                        "t_N180_42.ICDV724",                                                                        "^(V724)",                                                                                                                              "t_N180_42.ICDV724 > 0",    NA,
                       "t_N180_42.CPT_PregnancyTest.Subset",  "Covariate10.ii",        "CPT_PregnancyTest.Subset",       "-180",         42,     "CPT",                             NA,                                                                                      "81025",                                                                       "t_N180_42.CPT81025",                                                                       "^(81025)",                                                                                                                             "t_N180_42.CPT81025 > 0",    NA,
                         "t_N180_42.ICD9_PolycysticOvaries",     "Covariate11",          "ICD9_PolycysticOvaries",       "-180",         42,    "ICD9",                             NA,                                                                                       "2564",                                                                        "t_N180_42.ICD2564",                                                                        "^(2564)",                                                                                                                              "t_N180_42.ICD2564 > 0",    NA,
                                    "t_N180_42.ICD9_DMnoCx",     "Covariate20",                     "ICD9_DMnoCx",       "-180",         42,    "ICD9",                             NA,                                                                                       "2500",                                                                        "t_N180_42.ICD2500",                                                                        "^(2500)",                                                                                                                              "t_N180_42.ICD2500 > 0",    NA,
                                       "t_N180_42.ICD9_DKA",     "Covariate21",                        "ICD9_DKA",       "-180",         42,    "ICD9",                             NA,                                                                                       "2501",                                                                        "t_N180_42.ICD2501",                                                                        "^(2501)",                                                                                                                              "t_N180_42.ICD2501 > 0",    NA,
                        "t_N180_42.ICD9_DMhypoerosmolarity",     "Covariate22",         "ICD9_DMhypoerosmolarity",       "-180",         42,    "ICD9",                             NA,                                                                                       "2502",                                                                        "t_N180_42.ICD2502",                                                                        "^(2502)",                                                                                                                              "t_N180_42.ICD2502 > 0",    NA,
                                    "t_N180_42.ICD9_DMcoma",     "Covariate23",                     "ICD9_DMcoma",       "-180",         42,    "ICD9",                             NA,                                                                                       "2503",                                                                        "t_N180_42.ICD2503",                                                                        "^(2503)",                                                                                                                              "t_N180_42.ICD2503 > 0",    NA,
                                   "t_N180_42.ICD9_DMrenal",     "Covariate24",                    "ICD9_DMrenal",       "-180",         42,    "ICD9",                             NA,                                                                                       "2504",                                                                        "t_N180_42.ICD2504",                                                                        "^(2504)",                                                                                                                              "t_N180_42.ICD2504 > 0",    NA,
                              "t_N180_42.ICD9_DMophthalmic",     "Covariate25",               "ICD9_DMophthalmic",       "-180",         42,    "ICD9",                             NA,                                                                                       "2505",                                                                        "t_N180_42.ICD2505",                                                                        "^(2505)",                                                                                                                              "t_N180_42.ICD2505 > 0",    NA,
                            "t_N180_42.ICD9_DMneurological",     "Covariate26",             "ICD9_DMneurological",       "-180",         42,    "ICD9",                             NA,                                                                                       "2506",                                                                        "t_N180_42.ICD2506",                                                                        "^(2506)",                                                                                                                              "t_N180_42.ICD2506 > 0",    NA,
                              "t_N180_42.ICD9_DMperipheral",     "Covariate27",               "ICD9_DMperipheral",       "-180",         42,    "ICD9",                             NA,                                                                                       "2507",                                                                        "t_N180_42.ICD2507",                                                                        "^(2507)",                                                                                                                              "t_N180_42.ICD2507 > 0",    NA,
                                   "t_N180_42.ICD9_DMother",     "Covariate28",                    "ICD9_DMother",       "-180",         42,    "ICD9",                             NA,                                                                                       "2508",                                                                        "t_N180_42.ICD2508",                                                                        "^(2508)",                                                                                                                              "t_N180_42.ICD2508 > 0",    NA,
                           "t_N180_42.ICD9_DMunspecifiedCx",     "Covariate29",            "ICD9_DMunspecifiedCx",       "-180",         42,    "ICD9",                             NA,                                                                                       "2509",                                                                        "t_N180_42.ICD2509",                                                                        "^(2509)",                                                                                                                              "t_N180_42.ICD2509 > 0",    NA,
                          "t_N180_42.ICD9_DMuncontrolledT2",     "Covariate30",           "ICD9_DMuncontrolledT2",       "-180",         42,    "ICD9",                             NA,                       "25002, 25012, 25022, 25032, 25042, 25052, 25062, 25072, 25082, 25092",                 "t_N180_42.ICD25002_25012_25022_25032_25042_25052_25062_25072_25082_25092",                 "^(25002|25012|25022|25032|25042|25052|25062|25072|25082|25092)",                                                                       "t_N180_42.ICD25002_25012_25022_25032_25042_25052_25062_25072_25082_25092 > 0",    NA,
                              "t_N180_42.ICD9_HeartFailure",     "Covariate51",               "ICD9_HeartFailure",       "-180",         42,    "ICD9",                             NA,                  "428, 40201, 40211, 40291, 40401, 40403, 40411, 40413, 40491, 40493, 39891",             "t_N180_42.ICD428_40201_40211_40291_40401_40403_40411_40413_40491_40493_39891",             "^(428|40201|40211|40291|40401|40403|40411|40413|40491|40493|39891)",                                                                   "t_N180_42.ICD428_40201_40211_40291_40401_40403_40411_40413_40491_40493_39891 > 0",    NA,
                            "t_N180_42.ICD9_Hyperlipidemia",     "Covariate52",             "ICD9_Hyperlipidemia",       "-180",         42,    "ICD9",                             NA,                                                               "2720, 2721, 2722, 2723, 2724",                                                    "t_N180_42.ICD2720_2721_2722_2723_2724",                                                    "^(2720|2721|2722|2723|2724)",                                                                                                          "t_N180_42.ICD2720_2721_2722_2723_2724 > 0",    NA,
                             "t_N180_42.ICD9_IschemicHeart",     "Covariate53",              "ICD9_IschemicHeart",       "-180",         42,    "ICD9",                             NA,                                                                    "410, 411, 412, 413, 414",                                                         "t_N180_42.ICD410_411_412_413_414",                                                         "^(410|411|412|413|414)",                                                                                                               "t_N180_42.ICD410_411_412_413_414 > 0",    NA,
                       "t_N180_42.ICD9_MyocardialInfaction",   "Covariate53.i",        "ICD9_MyocardialInfaction",       "-180",         42,    "ICD9",                             NA,                       "41001, 41011, 41021, 41031, 41041, 41051, 41061, 41071, 41081, 41091",                 "t_N180_42.ICD41001_41011_41021_41031_41041_41051_41061_41071_41081_41091",                 "^(41001|41011|41021|41031|41041|41051|41061|41071|41081|41091)",                                                                       "t_N180_42.ICD41001_41011_41021_41031_41041_41051_41061_41071_41081_41091 > 0",    NA,
                           "t_N180_42.ICD9_Cerebrovascular",     "Covariate54",            "ICD9_Cerebrovascular",       "-180",         42,    "ICD9",                             NA,                                         "430, 431, 432, 433, 434, 435, 436, 437, 438, 99702",                                   "t_N180_42.ICD430_431_432_433_434_435_436_437_438_99702",                                   "^(430|431|432|433|434|435|436|437|438|99702)",                                                                                         "t_N180_42.ICD430_431_432_433_434_435_436_437_438_99702 > 0",    NA,
                        "t_N180_42.ICD9_PeripheralVascular",     "Covariate55",         "ICD9_PeripheralVascular",       "-180",         42,    "ICD9",                             NA,                                                                            "440, 4438, 4439",                                                               "t_N180_42.ICD440_4438_4439",                                                               "^(440|4438|4439)",                                                                                                                     "t_N180_42.ICD440_4438_4439 > 0",    NA,
                         "t_N180_42.ICD9_OverweightObesity",     "Covariate56",          "ICD9_OverweightObesity",       "-180",         42,    "ICD9",                             NA,                                                                     "2780, V852, V853, V854",                                                         "t_N180_42.ICD2780_V852_V853_V854",                                                         "^(2780|V852|V853|V854)",                                                                                                               "t_N180_42.ICD2780_V852_V853_V854 > 0",    NA,
                                  "t_N180_42.ICD9_BMI_lt19",   "Covariate56.i",                   "ICD9_BMI_lt19",       "-180",         42,    "ICD9",                             NA,                                                                                       "V850",                                                                        "t_N180_42.ICDV850",                                                                        "^(V850)",                                                                                                                              "t_N180_42.ICDV850 > 0",    NA,
                                   "t_N180_42.ICD9_BMI1924",  "Covariate56.ii",                    "ICD9_BMI1924",       "-180",         42,    "ICD9",                             NA,                                                                                       "V851",                                                                        "t_N180_42.ICDV851",                                                                        "^(V851)",                                                                                                                              "t_N180_42.ICDV851 > 0",    NA,
                                   "t_N180_42.ICD9_BMI2529", "Covariate56.iii",                    "ICD9_BMI2529",       "-180",         42,    "ICD9",                             NA,                                                                                       "V852",                                                                        "t_N180_42.ICDV852",                                                                        "^(V852)",                                                                                                                              "t_N180_42.ICDV852 > 0",    NA,
                                   "t_N180_42.ICD9_BMI3039",  "Covariate56.iV",                    "ICD9_BMI3039",       "-180",         42,    "ICD9",                             NA,                                                                                       "V853",                                                                        "t_N180_42.ICDV853",                                                                        "^(V853)",                                                                                                                              "t_N180_42.ICDV853 > 0",    NA,
                                  "t_N180_42.ICD9_BMI_ge40",   "Covariate56.V",                   "ICD9_BMI_ge40",       "-180",         42,    "ICD9",                             NA,                                                                                       "V854",                                                                        "t_N180_42.ICDV854",                                                                        "^(V854)",                                                                                                                              "t_N180_42.ICDV854 > 0",    NA,
                                   "t_N180_42.ICD9_Obesity",     "Covariate57",                    "ICD9_Obesity",       "-180",         42,    "ICD9",                             NA,                                                            "27800, 27801, 27803, V853, V854",                                                 "t_N180_42.ICD27800_27801_27803_V853_V854",                                                 "^(27800|27801|27803|V853|V854)",                                                                                                       "t_N180_42.ICD27800_27801_27803_V853_V854 > 0",    NA,
                                         "t_N180_0.Nvisits",     "Covariate91",                         "Nvisits",       "-180",          0,    "ICD9",                            ".",                                                                                           NA,                                                                             "t_N180_0.ICD",                                                                            "^()",                                                                                                                                       "t_N180_0.ICD",    NA,
                                          "t_N90_0.Nvisits",   "Covariate91.i",                         "Nvisits",        "-90",          0,    "ICD9",                            ".",                                                                                           NA,                                                                              "t_N90_0.ICD",                                                                            "^()",                                                                                                                                        "t_N90_0.ICD",    NA,
                                     "t_N180_0.Nprocedures",     "Covariate92",                     "Nprocedures",       "-180",          0,     "CPT", "0, 1, 2, 3, 4, 5, 6, 7, 8, 9",                                                                                           NA,                                                                             "t_N180_0.CPT",                                                                            "^()",                                                                                                                                       "t_N180_0.CPT",    NA,
                                      "t_N90_0.Nprocedures",   "Covariate92.i",                     "Nprocedures",        "-90",          0,     "CPT", "0, 1, 2, 3, 4, 5, 6, 7, 8, 9",                                                                                           NA,                                                                              "t_N90_0.CPT",                                                                            "^()",                                                                                                                                        "t_N90_0.CPT",    NA,
                               "t_N180_0.Nhospitalizations",     "Covariate93",               "Nhospitalizations",       "-180",          0,   "sICD9",                            ".",                                                                                           NA,                                                                            "t_N180_0.sICD",                                                                            "^()",                                                                                                                                      "t_N180_0.sICD",    NA,
                                "t_N90_0.Nhospitalizations",   "Covariate93.i",               "Nhospitalizations",        "-90",          0,   "sICD9",                            ".",                                                                                           NA,                                                                             "t_N90_0.sICD",                                                                            "^()",                                                                                                                                       "t_N90_0.sICD",    NA
                )

CovariateDefinition191128 |> str() #----
# > CovariateDefinition191128 |> str() #----  
# tibble [53 x 12] (S3: tbl_df/tbl/data.frame)
#  $ CriteriaID       : chr [1:53] "t_N180_42.ICD9_CKD_exceptARF" "t_N180_42.ICD9_HTN.Superset" "t_N180_42.ICD9_HTN.Subset" "t_N180_42.ICD9_HTN_pregestational.Subset" ...
#  $ CriteriaID.old   : chr [1:53] "Covariate1" "Covariate2" "Covariate2.i" "Covariate2.ii" ...
#  $ CriteriaShortName: chr [1:53] "ICD9_CKD_exceptARF" "ICD9_HTN.Superset" "ICD9_HTN.Subset" "ICD9_HTN_pregestational.Subset" ...
#  $ t_begin.int      : chr [1:53] "-180" "-180" "-180" "-180" ...
#  $ t_end.int        : num [1:53] 42 42 42 42 42 42 42 42 42 42 ...
#  $ CodeType         : chr [1:53] "ICD9" NA "ICD9" "ICD9" ...
#  $ Code_vec         : chr [1:53] NA NA NA NA ...
#  $ Code_vec.list    : chr [1:53] "581, 582, 583, 585, 587, 588" "Boolean_1st_level" "401, 402, 403, 404, 405" "6420, 6421, 6422, 6427" ...
#  $ FilterName       : chr [1:53] "t_N180_42.ICD581_582_583_585_587_588" "t_N180_42.Boolean_1st_level" "t_N180_42.ICD401_402_403_404_405" "t_N180_42.ICD6420_6421_6422_6427" ...
#  $ FilterRegex      : chr [1:53] "^(581|582|583|585|587|588)" "^(Boolean_1st_level)" "^(401|402|403|404|405)" "^(6420|6421|6422|6427)" ...
#  $ Evaluation       : chr [1:53] "t_N180_42.ICD581_582_583_585_587_588 > 0" "((t_N180_42.ICD401_402_403_404_405 > 0)) | ((t_N180_42.ICD6420_6421_6422_6427 > 0))" "t_N180_42.ICD401_402_403_404_405 > 0" "t_N180_42.ICD6420_6421_6422_6427 > 0" ...
#  $ note             : num [1:53] NA NA NA NA NA NA NA NA NA NA ...


CovariateDefinition191128$Code_vec.list |> str() #----
# > CovariateDefinition191128$Code_vec.list |> str() #----  
#  chr [1:53] "581, 582, 583, 585, 587, 588" "Boolean_1st_level" "401, 402, 403, 404, 405" "6420, 6421, 6422, 6427" "493" "Boolean_1st_level" ...


# ?strsplit
x <- c(as = "asfef", qu = "qwerty", "yuiop[", "b", "stuff.blah.yech")
# split x on the letter e
strsplit(x, "e") |> str() #----
# > strsplit(x, "e") |> str() #----  
# List of 5
#  $ as: chr [1:2] "asf" "f"
#  $ qu: chr [1:2] "qw" "rty"
#  $   : chr "yuiop["
#  $   : chr "b"
#  $   : chr [1:2] "stuff.blah.y" "ch"


# ?str_split
fruits <- c(
  "apples and oranges and pears and bananas",
  "pineapples and mangos and guavas"
)

str_split(fruits, " and ")
str_split(fruits, " and ", simplify = TRUE)
# > str_split(fruits, " and ")
# [[1]]
# [1] "apples"  "oranges" "pears"   "bananas"
# 
# [[2]]
# [1] "pineapples" "mangos"     "guavas"    
# 
# > str_split(fruits, " and ", simplify = TRUE)
#      [,1]         [,2]      [,3]     [,4]     
# [1,] "apples"     "oranges" "pears"  "bananas"
# [2,] "pineapples" "mangos"  "guavas" ""   



# Specify n to restrict the number of possible matches
str_split(fruits, " and ", n = 3)
str_split(fruits, " and ", n = 2)
# > str_split(fruits, " and ", n = 3)
# [[1]]
# [1] "apples"            "oranges"           "pears and bananas"
# 
# [[2]]
# [1] "pineapples" "mangos"     "guavas"    
# 
# > str_split(fruits, " and ", n = 2)
# [[1]]
# [1] "apples"                        "oranges and pears and bananas"
# 
# [[2]]
# [1] "pineapples"        "mangos and guavas"


# If n greater than number of pieces, no padding occurs
str_split(fruits, " and ", n = 5)
# > str_split(fruits, " and ", n = 5)
# [[1]]
# [1] "apples"  "oranges" "pears"   "bananas"
# 
# [[2]]
# [1] "pineapples" "mangos"     "guavas"   



# Use fixed to return a character matrix
str_split_fixed(fruits, " and ", 3)
str_split_fixed(fruits, " and ", 4)
# > str_split_fixed(fruits, " and ", 3)
#      [,1]         [,2]      [,3]               
# [1,] "apples"     "oranges" "pears and bananas"
# [2,] "pineapples" "mangos"  "guavas"           
# > str_split_fixed(fruits, " and ", 4)
#      [,1]         [,2]      [,3]     [,4]     
# [1,] "apples"     "oranges" "pears"  "bananas"
# [2,] "pineapples" "mangos"  "guavas" ""       





CovariateDefinition191128$Code_vec.list |> str() #----
# > CovariateDefinition191128$Code_vec.list |> str() #----  
#  chr [1:53] "581, 582, 583, 585, 587, 588" "Boolean_1st_level" "401, 402, 403, 404, 405" "6420, 6421, 6422, 6427" "493" "Boolean_1st_level" ...


CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") |> str() #----
# > CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") |> str() #----  
# List of 53
#  $ : chr [1:6] "581" "582" "583" "585" ...
#  $ : chr "Boolean_1st_level"
#  $ : chr [1:5] "401" "402" "403" "404" ...
#  $ : chr [1:4] "6420" "6421" "6422" "6427"
#  $ : chr "493"
#  $ : chr "Boolean_1st_level"
#  $ : chr [1:7] "240" "241" "242" "243" ...
#  $ : chr "6481"
#  $ : chr "244"
#  $ : chr "Boolean_1st_level"
#  $ : chr [1:2] "2962" "2963"
#  $ : chr "3004"
#  $ : chr "311"
#  $ : chr [1:2] "3090" "3091"
#  $ : chr "2980"
#  $ : chr [1:16] "291" "292" "303" "304" ...
#  $ : chr "296"
#  $ : chr [1:8] "29384" "3000" "3002" "3003" ...
#  $ : chr "7061"
#  $ : chr "Boolean_1st_level"
#  $ : chr "V724"
#  $ : chr "81025"
#  $ : chr "2564"
#  $ : chr "2500"
#  $ : chr "2501"
#  $ : chr "2502"
#  $ : chr "2503"
#  $ : chr "2504"
#  $ : chr "2505"
#  $ : chr "2506"
#  $ : chr "2507"
#  $ : chr "2508"
#  $ : chr "2509"
#  $ : chr [1:10] "25002" "25012" "25022" "25032" ...
#  $ : chr [1:11] "428" "40201" "40211" "40291" ...
#  $ : chr [1:5] "2720" "2721" "2722" "2723" ...
#  $ : chr [1:5] "410" "411" "412" "413" ...
#  $ : chr [1:10] "41001" "41011" "41021" "41031" ...
#  $ : chr [1:10] "430" "431" "432" "433" ...
#  $ : chr [1:3] "440" "4438" "4439"
#  $ : chr [1:4] "2780" "V852" "V853" "V854"
#  $ : chr "V850"
#  $ : chr "V851"
#  $ : chr "V852"
#  $ : chr "V853"
#  $ : chr "V854"
#  $ : chr [1:5] "27800" "27801" "27803" "V853" ...
#  $ : chr NA
#  $ : chr NA
#  $ : chr NA
#  $ : chr NA
#  $ : chr NA
#  $ : chr NA



CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
    map(function(vec) paste0(vec, "x")) %>% 
    str #----
# > CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
# +     map(function(vec) paste0(vec, "x")) %>% 
# +     str #----  
# List of 53
#  $ : chr [1:6] "581x" "582x" "583x" "585x" ...
#  $ : chr "Boolean_1st_levelx"
#  $ : chr [1:5] "401x" "402x" "403x" "404x" ...
#  $ : chr [1:4] "6420x" "6421x" "6422x" "6427x"
#  $ : chr "493x"
#  $ : chr "Boolean_1st_levelx"
#  $ : chr [1:7] "240x" "241x" "242x" "243x" ...
#  $ : chr "6481x"
#  $ : chr "244x"
#  $ : chr "Boolean_1st_levelx"
#  $ : chr [1:2] "2962x" "2963x"
#  $ : chr "3004x"
#  $ : chr "311x"
#  $ : chr [1:2] "3090x" "3091x"
#  $ : chr "2980x"
#  $ : chr [1:16] "291x" "292x" "303x" "304x" ...
#  $ : chr "296x"
#  $ : chr [1:8] "29384x" "3000x" "3002x" "3003x" ...
#  $ : chr "7061x"
#  $ : chr "Boolean_1st_levelx"
#  $ : chr "V724x"
#  $ : chr "81025x"
#  $ : chr "2564x"
#  $ : chr "2500x"
#  $ : chr "2501x"
#  $ : chr "2502x"
#  $ : chr "2503x"
#  $ : chr "2504x"
#  $ : chr "2505x"
#  $ : chr "2506x"
#  $ : chr "2507x"
#  $ : chr "2508x"
#  $ : chr "2509x"
#  $ : chr [1:10] "25002x" "25012x" "25022x" "25032x" ...
#  $ : chr [1:11] "428x" "40201x" "40211x" "40291x" ...
#  $ : chr [1:5] "2720x" "2721x" "2722x" "2723x" ...
#  $ : chr [1:5] "410x" "411x" "412x" "413x" ...
#  $ : chr [1:10] "41001x" "41011x" "41021x" "41031x" ...
#  $ : chr [1:10] "430x" "431x" "432x" "433x" ...
#  $ : chr [1:3] "440x" "4438x" "4439x"
#  $ : chr [1:4] "2780x" "V852x" "V853x" "V854x"
#  $ : chr "V850x"
#  $ : chr "V851x"
#  $ : chr "V852x"
#  $ : chr "V853x"
#  $ : chr "V854x"
#  $ : chr [1:5] "27800x" "27801x" "27803x" "V853x" ...
#  $ : chr "NAx"
#  $ : chr "NAx"
#  $ : chr "NAx"
#  $ : chr "NAx"
#  $ : chr "NAx"
#  $ : chr "NAx"





CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
    map(function(vec) paste0(vec, "x")) %>% 
    map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
    str #----
# > CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
# +     map(function(vec) paste0(vec, "x")) %>% 
# +     map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
# +     str #----  
# List of 53
#  $ : chr [1:6] "581.x" "582.x" "583.x" "585.x" ...
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr [1:5] "401.x" "402.x" "403.x" "404.x" ...
#  $ : chr [1:4] "642.0x" "642.1x" "642.2x" "642.7x"
#  $ : chr "493.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr [1:7] "240.x" "241.x" "242.x" "243.x" ...
#  $ : chr "648.1x"
#  $ : chr "244.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr [1:2] "296.2x" "296.3x"
#  $ : chr "300.4x"
#  $ : chr "311.x"
#  $ : chr [1:2] "309.0x" "309.1x"
#  $ : chr "298.0x"
#  $ : chr [1:16] "291.x" "292.x" "303.x" "304.x" ...
#  $ : chr "296.x"
#  $ : chr [1:8] "293.84x" "300.0x" "300.2x" "300.3x" ...
#  $ : chr "706.1x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "V72.4x"
#  $ : chr "810.25x"
#  $ : chr "256.4x"
#  $ : chr "250.0x"
#  $ : chr "250.1x"
#  $ : chr "250.2x"
#  $ : chr "250.3x"
#  $ : chr "250.4x"
#  $ : chr "250.5x"
#  $ : chr "250.6x"
#  $ : chr "250.7x"
#  $ : chr "250.8x"
#  $ : chr "250.9x"
#  $ : chr [1:10] "250.02x" "250.12x" "250.22x" "250.32x" ...
#  $ : chr [1:11] "428.x" "402.01x" "402.11x" "402.91x" ...
#  $ : chr [1:5] "272.0x" "272.1x" "272.2x" "272.3x" ...
#  $ : chr [1:5] "410.x" "411.x" "412.x" "413.x" ...
#  $ : chr [1:10] "410.01x" "410.11x" "410.21x" "410.31x" ...
#  $ : chr [1:10] "430.x" "431.x" "432.x" "433.x" ...
#  $ : chr [1:3] "440.x" "443.8x" "443.9x"
#  $ : chr [1:4] "278.0x" "V85.2x" "V85.3x" "V85.4x"
#  $ : chr "V85.0x"
#  $ : chr "V85.1x"
#  $ : chr "V85.2x"
#  $ : chr "V85.3x"
#  $ : chr "V85.4x"
#  $ : chr [1:5] "278.00x" "278.01x" "278.03x" "V85.3x" ...
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."





CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
    map(function(vec) paste0(vec, "x")) %>% 
    map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
    map(str_c, collapse = ", ") %>% 
    str #----
# > CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
# +     map(function(vec) paste0(vec, "x")) %>% 
# +     map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
# +     map(str_c, collapse = ", ") %>% 
# +     str #----  
# List of 53
#  $ : chr "581.x, 582.x, 583.x, 585.x, 587.x, 588.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "401.x, 402.x, 403.x, 404.x, 405.x"
#  $ : chr "642.0x, 642.1x, 642.2x, 642.7x"
#  $ : chr "493.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "240.x, 241.x, 242.x, 243.x, 244.x, 245.x, 246.x"
#  $ : chr "648.1x"
#  $ : chr "244.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "296.2x, 296.3x"
#  $ : chr "300.4x"
#  $ : chr "311.x"
#  $ : chr "309.0x, 309.1x"
#  $ : chr "298.0x"
#  $ : chr "291.x, 292.x, 303.x, 304.x, 305.x, 357.5x, 425.5x, 571.0x, 571.1x, 571.2x, 571.3x, 648.3x, 655.5x, 965.0x, E86.00x, V11.3x"
#  $ : chr "296.x"
#  $ : chr "293.84x, 300.0x, 300.2x, 300.3x, 309.24x, 308.0x, 309.81x, 313.0x"
#  $ : chr "706.1x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "V72.4x"
#  $ : chr "810.25x"
#  $ : chr "256.4x"
#  $ : chr "250.0x"
#  $ : chr "250.1x"
#  $ : chr "250.2x"
#  $ : chr "250.3x"
#  $ : chr "250.4x"
#  $ : chr "250.5x"
#  $ : chr "250.6x"
#  $ : chr "250.7x"
#  $ : chr "250.8x"
#  $ : chr "250.9x"
#  $ : chr "250.02x, 250.12x, 250.22x, 250.32x, 250.42x, 250.52x, 250.62x, 250.72x, 250.82x, 250.92x"
#  $ : chr "428.x, 402.01x, 402.11x, 402.91x, 404.01x, 404.03x, 404.11x, 404.13x, 404.91x, 404.93x, 398.91x"
#  $ : chr "272.0x, 272.1x, 272.2x, 272.3x, 272.4x"
#  $ : chr "410.x, 411.x, 412.x, 413.x, 414.x"
#  $ : chr "410.01x, 410.11x, 410.21x, 410.31x, 410.41x, 410.51x, 410.61x, 410.71x, 410.81x, 410.91x"
#  $ : chr "430.x, 431.x, 432.x, 433.x, 434.x, 435.x, 436.x, 437.x, 438.x, 997.02x"
#  $ : chr "440.x, 443.8x, 443.9x"
#  $ : chr "278.0x, V85.2x, V85.3x, V85.4x"
#  $ : chr "V85.0x"
#  $ : chr "V85.1x"
#  $ : chr "V85.2x"
#  $ : chr "V85.3x"
#  $ : chr "V85.4x"
#  $ : chr "278.00x, 278.01x, 278.03x, V85.3x, V85.4x"
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."




CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
    map(function(vec) paste0(vec, "x")) %>% 
    map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
    map(paste, collapse = ", ") %>% 
    str #----
# > CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
# +     map(function(vec) paste0(vec, "x")) %>% 
# +     map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
# +     map(paste, collapse = ", ") %>% 
# +     str #----  
# List of 53
#  $ : chr "581.x, 582.x, 583.x, 585.x, 587.x, 588.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "401.x, 402.x, 403.x, 404.x, 405.x"
#  $ : chr "642.0x, 642.1x, 642.2x, 642.7x"
#  $ : chr "493.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "240.x, 241.x, 242.x, 243.x, 244.x, 245.x, 246.x"
#  $ : chr "648.1x"
#  $ : chr "244.x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "296.2x, 296.3x"
#  $ : chr "300.4x"
#  $ : chr "311.x"
#  $ : chr "309.0x, 309.1x"
#  $ : chr "298.0x"
#  $ : chr "291.x, 292.x, 303.x, 304.x, 305.x, 357.5x, 425.5x, 571.0x, 571.1x, 571.2x, 571.3x, 648.3x, 655.5x, 965.0x, E86.00x, V11.3x"
#  $ : chr "296.x"
#  $ : chr "293.84x, 300.0x, 300.2x, 300.3x, 309.24x, 308.0x, 309.81x, 313.0x"
#  $ : chr "706.1x"
#  $ : chr "Boo.lean_1st_levelx"
#  $ : chr "V72.4x"
#  $ : chr "810.25x"
#  $ : chr "256.4x"
#  $ : chr "250.0x"
#  $ : chr "250.1x"
#  $ : chr "250.2x"
#  $ : chr "250.3x"
#  $ : chr "250.4x"
#  $ : chr "250.5x"
#  $ : chr "250.6x"
#  $ : chr "250.7x"
#  $ : chr "250.8x"
#  $ : chr "250.9x"
#  $ : chr "250.02x, 250.12x, 250.22x, 250.32x, 250.42x, 250.52x, 250.62x, 250.72x, 250.82x, 250.92x"
#  $ : chr "428.x, 402.01x, 402.11x, 402.91x, 404.01x, 404.03x, 404.11x, 404.13x, 404.91x, 404.93x, 398.91x"
#  $ : chr "272.0x, 272.1x, 272.2x, 272.3x, 272.4x"
#  $ : chr "410.x, 411.x, 412.x, 413.x, 414.x"
#  $ : chr "410.01x, 410.11x, 410.21x, 410.31x, 410.41x, 410.51x, 410.61x, 410.71x, 410.81x, 410.91x"
#  $ : chr "430.x, 431.x, 432.x, 433.x, 434.x, 435.x, 436.x, 437.x, 438.x, 997.02x"
#  $ : chr "440.x, 443.8x, 443.9x"
#  $ : chr "278.0x, V85.2x, V85.3x, V85.4x"
#  $ : chr "V85.0x"
#  $ : chr "V85.1x"
#  $ : chr "V85.2x"
#  $ : chr "V85.3x"
#  $ : chr "V85.4x"
#  $ : chr "278.00x, 278.01x, 278.03x, V85.3x, V85.4x"
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."
#  $ : chr "NAx."





CovariateDefinition191128$Code_vec.list.dot_x = 
    CovariateDefinition191128$Code_vec.list |> str_replace_all(" ", "") |> str_split(",") %>% 
    map(function(vec) paste0(vec, "x")) %>% 
    map(function(vec) paste0( substr(vec, 1, 3), ".", substr(vec, 4, nchar(vec)) ) ) %>% 
    map(paste, collapse = ", ") |> unlist()


CovariateDefinition191128.dot_x = 
    CovariateDefinition191128
openxlsx2::write.xlsx(CovariateDefinition191128.dot_x, "CovariateDefinition191128.dot_x.xlsx")



# @ end -----  


