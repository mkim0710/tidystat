
tblPersonID_FilterName.ndDate %>% na.omit %>% {attr(., "na.action") = NULL; .} |> dput() #----
# > tblPersonID_FilterName.ndDate %>% na.omit %>% {attr(., "na.action") = NULL; .} |> dput() #----  
tblPersonID_FilterName.ndDate = structure(list(ENROLID = c(171946801, 1210879901, 1282775301,
2068053701, 27240989002, 27945818803, 28503004201), t_NInf_154.ICD250x1_250x3.ndDate = c(2L,
5L, 1L, 3L, 1L, 2L, 1L), t_NInf_0.RxCONCEPT_NDC_metformin.ndDate = c(1L,
1L, 7L, 2L, 1L, 1L, 2L)), row.names = c(NA, -7L), class = c("tbl_df",
"tbl", "data.frame"))



# tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation = bind_rows(Criteria.tbl.list$ExclusionCriteria.tbl, Criteria.tbl.list$InclusionCriteria.tbl)
Criteria.tbl.list$ExclusionCriteria.tbl[3:4, ] %>% select(-note) |> dput() #----
# > Criteria.tbl.list$ExclusionCriteria.tbl[3:4, ] %>% select(-note) |> dput() #----  
tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation = structure(list(CriteriaID = c("Exc3", "Exc4"), CriteriaShortName = c("ICD9_DMt1",
"Rx_Metformin.lt2"), t_begin.int = c(-Inf, -Inf), t_end.int = c(154,
0), CodeType = c("ICD9", "Rx"), Code_vec = c(NA_character_, NA_character_
), Code_vec.list = c("250x1, 250x3", "CONCEPT_NDC_metformin"),
    FilterName = c("t_NInf_154.ICD250x1_250x3", "t_NInf_0.RxCONCEPT_NDC_metformin"
    ), FilterRegex = c("^250[0-9][13]$", "^(CONCEPT_NDC_metformin)"
    ), Evaluation = c("t_NInf_154.ICD250x1_250x3 > 0", "t_NInf_0.RxCONCEPT_NDC_metformin < 2"
    ), nID.nDate_ge1 = c(NA_real_, NA_real_), nID.nDate_ge2 = c(NA_real_,
    NA_real_), nID.nDate_ge3 = c(NA_real_, NA_real_)), row.names = 3:4, class = "data.frame")
tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation
# > tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation
#   CriteriaID CriteriaShortName t_begin.int t_end.int CodeType Code_vec         Code_vec.list                       FilterName
# 3       Exc3         ICD9_DMt1        -Inf       154     ICD9     <NA>          250x1, 250x3        t_NInf_154.ICD250x1_250x3
# 4       Exc4  Rx_Metformin.lt2        -Inf         0       Rx     <NA> CONCEPT_NDC_metformin t_NInf_0.RxCONCEPT_NDC_metformin
#                FilterRegex                           Evaluation nID.nDate_ge1 nID.nDate_ge2 nID.nDate_ge3
# 3           ^250[0-9][13]$        t_NInf_154.ICD250x1_250x3 > 0            NA            NA            NA
# 4 ^(CONCEPT_NDC_metformin) t_NInf_0.RxCONCEPT_NDC_metformin < 2            NA            NA            NA







## @ Regular Expression -----  
Evaluation.i = "((t_42_280.CPT88016 > 0)) | ((t_42_308.ICD774 > 0)) & ((t_42_308.CPT36450_36455_36456_82785_82784_82787 >= 0)) * 0 + 3/1 - 2 == 1"
Evaluation.i %>% gsub(" |\\(|\\)", "", .) |> str()split(c(">=", "<=")) |> unlist() |> str()split(c(">", "<", "==", "+", "-", "*", "/", "&", "|"), fixed = T) |> unlist()
Evaluation.i %>% gsub(" |\\(|\\)", "", .) |> str()split(c(">=", "<=")) |> unlist() |> str()split("==|>|<|&|-|/|\\+|\\*|\\|") |> unlist()
# > #@ Regular Expression -----  
# > Evaluation.i = "((t_42_280.CPT88016 > 0)) | ((t_42_308.ICD774 > 0)) & ((t_42_308.CPT36450_36455_36456_82785_82784_82787 >= 0)) * 0 + 3/1 - 2 == 1"
# > Evaluation.i %>% gsub(" |\\(|\\)", "", .) |> str()split(c(">=", "<=")) |> unlist() |> str()split(c(">", "<", "==", "+", "-", "*", "/", "&", "|"), fixed = T) |> unlist()
# [1] "t_42_280.CPT88016"                                 "0|t_42_308.ICD774"                                
# [3] "0&t_42_308.CPT36450_36455_36456_82785_82784_82787" "0*0+3/1-2==1"                                     
# > Evaluation.i %>% gsub(" |\\(|\\)", "", .) |> str()split(c(">=", "<=")) |> unlist() |> str()split("==|>|<|&|-|/|\\+|\\*|\\|") |> unlist()
#  [1] "t_42_280.CPT88016"                               "0"                                              
#  [3] "t_42_308.ICD774"                                 "0"                                              
#  [5] "t_42_308.CPT36450_36455_36456_82785_82784_82787" "0"                                              
#  [7] "0"                                               "3"                                              
#  [9] "1"                                               "2"                                              
# [11] "1" 


# @@@ tblPersonID_CriteriaID.lgl from tblPersonID_FilterName.ndDate #-----  
.t0 = Sys.time()
# tblPersonID_CriteriaID.lgl =
#     os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014 %>%
#     select(ENROLID) %>% distinct
tblPersonID_CriteriaID.lgl = tblPersonID_FilterName.ndDate %>% select(ENROLID)
# data4evaluation = tblPersonID_FilterName.ndDate %>% 
#     mutate_at(vars(matches("\\.ndDate$")), .funs = list(~replace_na(., 0L) )) %>%   # debug190726) NA causes error when using logical operators (e.g., ==)  # somehow map_df(replace_na, 0) is very slow?
#     select_at(vars(matches("\\.ndDate$")), .funs = list(~gsub("\\.ndDate$", "", .) )) %>%    # select_at() for rename
#     bind_cols(tblPersonID_FilterName.ndDate %>% select(matches("Date$")))
data4evaluation = tblPersonID_FilterName.ndDate %>% 
    mutate_at(vars(matches("\\.ndDate$")), .funs = replace_na, 0L) %>%   # debug190726) NA causes error when using logical operators (e.g., ==)  # somehow map_df(replace_na, 0) is very slow?
    select_at(vars(matches("\\.ndDate$")), .funs = function(vec) gsub("\\.ndDate$", "", vec) ) %>%    # select_at() for rename
    bind_cols(tblPersonID_FilterName.ndDate %>% select(matches("Date$")))
for (i in 1:nrow(tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation)) {
    CriteriaID.i = tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[i,]$CriteriaID
    
    Evaluation.i = tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[i,]$Evaluation
    Evaluation.i.ElementVector = Evaluation.i %>% gsub(" |\\(|\\)", "", .) |> str()split(c(">=", "<=")) |> unlist() |> str()split("==|>|<|&|-|/|\\+|\\*") |> unlist()
    Evaluation.minDate.i = tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[i,]$Evaluation.minDate
        
    if ( !all(Evaluation.i.ElementVector %>% {.[is.na(as.numeric(.))] %in% names(data4evaluation)}) ) {   
        msg = paste0( '!all(Evaluation.i.ElementVector %>% {.[is.na(as.numeric(.))] %in% names(data4evaluation)}) -> skipping for CriteriaID.i: ', CriteriaID.i )
        print(msg); warning(msg)
    } else {
        # print(Evaluation.i)
        if ( is.na(Evaluation.i) ) {
            msg = paste0( 'is.na(Evaluation.i) -> skipping for CriteriaID.i: ', CriteriaID.i )
            print(msg); warning(msg)
        } else {
            print(paste0( 'Appending: ', CriteriaID.i ))
            tblPersonID_CriteriaID.lgl =
                tblPersonID_CriteriaID.lgl %>%
                bind_cols(
                    data4evaluation %>%
                        transmute(
                            !!rlang::sym(CriteriaID.i) := eval(parse(text=Evaluation.i))
                            , !!rlang::sym(paste0(CriteriaID.i, ".minDate")) := eval(parse(text=Evaluation.minDate.i))
                        )
                )
        }
    }
}
Sys.time() - .t0
# > Sys.time() - .t0
# Time difference of 1.000324 secs




tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation
tblPersonID_CriteriaID.lgl
# > tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation
#   CriteriaID CriteriaShortName t_begin.int t_end.int CodeType Code_vec         Code_vec.list                       FilterName
# 3       Exc3         ICD9_DMt1        -Inf       154     ICD9     <NA>          250x1, 250x3        t_NInf_154.ICD250x1_250x3
# 4       Exc4  Rx_Metformin.lt2        -Inf         0       Rx     <NA> CONCEPT_NDC_metformin t_NInf_0.RxCONCEPT_NDC_metformin
#                FilterRegex                           Evaluation nID.nDate_ge1 nID.nDate_ge2 nID.nDate_ge3
# 3           ^250[0-9][13]$        t_NInf_154.ICD250x1_250x3 > 0            NA            NA            NA
# 4 ^(CONCEPT_NDC_metformin) t_NInf_0.RxCONCEPT_NDC_metformin < 2            NA            NA            NA
# > tblPersonID_CriteriaID.lgl
# # A tibble: 7 x 5
#       ENROLID t_NInf_154.ICD250x1_250x3.ndDate t_NInf_0.RxCONCEPT_NDC_metformin.ndDate Exc3  Exc4 
#         <dbl>                            <int>                                   <int> <lgl> <lgl>
# 1   171946801                                2                                       1 TRUE  TRUE 
# 2  1210879901                                5                                       1 TRUE  TRUE 
# 3  1282775301                                1                                       7 TRUE  FALSE
# 4  2068053701                                3                                       2 TRUE  FALSE
# 5 27240989002                                1                                       1 TRUE  TRUE 
# 6 27945818803                                2                                       1 TRUE  TRUE 
# 7 28503004201                                1                                       2 TRUE  FALSE

  
  
# __________|------  
# 〚〛 END-----  
