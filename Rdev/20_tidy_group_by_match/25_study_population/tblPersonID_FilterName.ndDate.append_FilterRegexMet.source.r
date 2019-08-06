
i = 3

CriteriaID.i = Criteria.tbl[i,]$CriteriaID 
CodeType.i = Criteria.tbl[i,]$CodeType 

t_begin.int.i = Criteria.tbl[i,]$t_begin.int
t_end.int.i = Criteria.tbl[i,]$t_end.int
if (is.na(t_end.int.i)) t_end.int.i = Inf

FilterName.i = Criteria.tbl[i,]$FilterName
FilterRegex.i = Criteria.tbl[i,]$FilterRegex
Code_vec.list.i = Criteria.tbl[i,]$Code_vec.list
    

CriteriaID.i
CodeType.i
t_begin.int.i
t_end.int.i
FilterName.i
FilterRegex.i
Code_vec.list.i
# >     CriteriaID.i
# [1] "Exc3"
# >     CodeType.i
# [1] "ICD9"
# >     t_begin.int.i
# [1] -Inf
# >     t_end.int.i
# [1] 154
# >     FilterName.i
# [1] "t_NInf_154.ICD250x1_250x3"
# >     FilterRegex.i
# [1] "^250[0-9][13]$"
# >     Code_vec.list.i
# [1] "250x1, 250x3"


#@ tblPersonID_FilterName.ndDate.append_FilterRegexMet <- function( ----
tblPersonID_FilterName.ndDate.append_FilterRegexMet <- function(
    tblPersonID_FilterName.ndDate
    , tblClaim_Date_Code
    , varname4PersonID = "ENROLID"
    , varname4t = "SVCDATE"
    , varname4t0 = "lmp"
    , t_begin.int.i = t_begin.int.i
    , t_end.int.i = t_end.int.i
    , varname4Code = "value"
    , FilterName.i = FilterName.i
    , FilterRegex.i = FilterRegex.i
) {
    out = tblPersonID_FilterName.ndDate %>% 
        left_join(
            tblClaim_Date_Code %>% 
                filter( eval(parse(text=varname4t)) >= eval(parse(text=varname4t0)) + eval(parse(text=t_begin.int.i)) ) %>% 
                filter( eval(parse(text=varname4t)) <= eval(parse(text=varname4t0)) + eval(parse(text=t_end.int.i)) ) %>% 
                mutate(
                    FilterRegexMet = grepl( FilterRegex.i, eval(parse(text=varname4Code)) )
                ) %>% filter(FilterRegexMet) %>% 
                group_by(ENROLID) %>% summarise(
                    !!rlang::sym( paste0(FilterName.i, ".ndDate") ) := n_distinct(as.numeric( eval(parse(text=varname4t)) ), na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".minDate") ) := min( eval(parse(text=varname4t)) , na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".maxDate") ) := max( eval(parse(text=varname4t)) , na.rm = T)
                ) %>%
                as.tibble
            , by = varname4PersonID
        )
    out
}


tblPersonID_FilterName.ndDate %>% select(ENROLID) %>% 
    tblPersonID_FilterName.ndDate.append_FilterRegexMet(
        tblClaim_Date_Code = os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014[1:10^6, ]
        # , CriteriaID.i = CriteriaID.i
        # , CodeType.i = CodeType.i
        , t_begin.int.i = t_begin.int.i
        , t_end.int.i = t_end.int.i
        , FilterName.i = FilterName.i
        , FilterRegex.i = FilterRegex.i
        # , Code_vec.list.i = Code_vec.list.i
    ) %>% na.omit
# > tblPersonID_FilterName.ndDate %>% select(ENROLID) %>% 
# +     tblPersonID_FilterName.ndDate.append_FilterRegexMet(
# +         tblClaim_Date_Code = os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014[1:10^6, ]
# +         # , CriteriaID.i = CriteriaID.i
# +         # , CodeType.i = CodeType.i
# +         , t_begin.int.i = t_begin.int.i
# +         , t_end.int.i = t_end.int.i
# +         , FilterName.i = FilterName.i
# +         , FilterRegex.i = FilterRegex.i
# +         # , Code_vec.list.i = Code_vec.list.i
# +     ) %>% na.omit
# # A tibble: 116 x 2
#       ENROLID t_NInf_154.ICD250x1_250x3.ndDate
#         <dbl>                            <int>
#  1  127761702                                3
#  2  171946801                                2
#  3  276053803                                3
#  4  597783303                                2
#  5  604110204                                6
#  6  632026801                                2
#  7  690489905                                5
#  8  904430303                                3
#  9  910508303                                3
# 10 1043253402                                1
# # ... with 106 more rows









i = 4

CriteriaID.i = Criteria.tbl[i,]$CriteriaID 
CodeType.i = Criteria.tbl[i,]$CodeType 

t_begin.int.i = Criteria.tbl[i,]$t_begin.int
t_end.int.i = Criteria.tbl[i,]$t_end.int
if (is.na(t_end.int.i)) t_end.int.i = Inf

FilterName.i = Criteria.tbl[i,]$FilterName
FilterRegex.i = Criteria.tbl[i,]$FilterRegex
Code_vec.list.i = Criteria.tbl[i,]$Code_vec.list
    
        
CriteriaID.i
CodeType.i
t_begin.int.i
t_end.int.i
FilterName.i
FilterRegex.i
Code_vec.list.i
# > CriteriaID.i
# [1] "Exc4"
# > CodeType.i
# [1] "Rx"
# > t_begin.int.i
# [1] -Inf
# > t_end.int.i
# [1] 0
# > FilterName.i
# [1] "t_NInf_0.RxCONCEPT_NDC_metformin"
# > FilterRegex.i
# [1] "^(CONCEPT_NDC_metformin)"
# > Code_vec.list.i
# [1] "CONCEPT_NDC_metformin"



#@ tblPersonID_FilterName.ndDate.append_FilterMet <- function( ----
tblPersonID_FilterName.ndDate.append_FilterMet <- function(
    tblPersonID_FilterName.ndDate
    , tblClaim_Date_Code
    , varname4PersonID = "ENROLID"
    , varname4t = "SVCDATE"
    , varname4t0 = "lmp"
    , t_begin.int.i = t_begin.int.i
    , t_end.int.i = t_end.int.i
    , varname4Code = "value"
    , FilterName.i = FilterName.i
    , varname4FilterMet.i = Code_vec.list.i
) {
    out = tblPersonID_FilterName.ndDate %>% 
        left_join(
            tblClaim_Date_Code %>% 
                filter( eval(parse(text=varname4t)) >= eval(parse(text=varname4t0)) + eval(parse(text=t_begin.int.i)) ) %>% 
                filter( eval(parse(text=varname4t)) <= eval(parse(text=varname4t0)) + eval(parse(text=t_end.int.i)) ) %>% 
                filter( eval(parse(text=varname4FilterMet.i)) ) %>% 
                group_by(ENROLID) %>% summarise(
                    !!rlang::sym( paste0(FilterName.i, ".ndDate") ) := n_distinct(as.numeric( eval(parse(text=varname4t)) ), na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".minDate") ) := min( eval(parse(text=varname4t)) , na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".maxDate") ) := max( eval(parse(text=varname4t)) , na.rm = T)
                ) %>%
                as.tibble
            , by = varname4PersonID
        )
    out
}


tblPersonID_FilterName.ndDate %>% select(ENROLID) %>% 
    tblPersonID_FilterName.ndDate.append_FilterMet(
        tblClaim_Date_Code = d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm[1:10^6, ]
        , varname4PersonID = "ENROLID"
        , varname4t = "SVCDATE"
        , varname4t0 = "lmp"
        , t_begin.int.i = t_begin.int.i
        , t_end.int.i = t_end.int.i
        , varname4Code = "value"
        , FilterName.i = FilterName.i
        , varname4FilterMet.i = Code_vec.list.i
    ) %>% na.omit
# > tblPersonID_FilterName.ndDate %>% select(ENROLID) %>% 
# +     tblPersonID_FilterName.ndDate.append_FilterMet(
# +         tblClaim_Date_Code = d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm[1:10^6, ]
# +         , varname4PersonID = "ENROLID"
# +         , varname4t = "SVCDATE"
# +         , varname4t0 = "lmp"
# +         , t_begin.int.i = t_begin.int.i
# +         , t_end.int.i = t_end.int.i
# +         , varname4Code = "value"
# +         , FilterName.i = FilterName.i
# +         , varname4FilterMet.i = Code_vec.list.i
# +     ) %>% na.omit
# # A tibble: 27,421 x 2
#      ENROLID t_NInf_0.RxCONCEPT_NDC_metformin.ndDate
#        <dbl>                                   <int>
#  1  14519101                                       2
#  2  32230709                                       1
#  3 102652303                                       3
#  4 131792704                                       1
#  5 136649401                                       2
#  6 139720104                                       2
#  7 171946801                                       1
#  8 172341702                                       2
#  9 189216201                                       5
# 10 218320801                                       1
# # ... with 27,411 more rows















# tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation = bind_rows(Criteria.tbl.list$ExclusionCriteria.tbl, Criteria.tbl.list$InclusionCriteria.tbl)
Criteria.tbl.list$ExclusionCriteria.tbl[3:4, ] %>% select(-note) %>% dput #----
# > Criteria.tbl.list$ExclusionCriteria.tbl[3:4, ] %>% select(-note) %>% dput #----
tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation = 
    structure(list(CriteriaID = c("Exc3", "Exc4"), CriteriaShortName = c("ICD9_DMt1",
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

tblClaim_Date_Code4ICD = os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014[1:10^6, ]
tblClaim_Date_Code4Rx = d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm[1:10^6, ]

#@@@ tblPersonID_FilterName.ndDate -----
t0 = Sys.time()
tblPersonID_FilterName.ndDate =
    ENROLID2797_Age1845_Inc2.ia_Exc12356abcd.t_42_154.exposure.enrolid_inf %>% select(ENROLID) %>% mutate(ENROLID = ENROLID %>% as.numeric)
for (i in 1:nrow(tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation)) {
    for ( v in 1:length(tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[i,]) ) {
        assign(paste0(names(tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[i,])[v], ".i")
               , tblCriteriaID_FilterName_FilterRegex_varname4FilterMet_Evaluation[i,][[v]] )
    }
    print(paste0("FilterName.i = ", FilterName.i))
    if (is.na(t_end.int.i)) t_end.int.i = Inf
    if (!exists("Mom_or_Baby.i")) Mom_or_Baby.i = "Mom"

    if (is.na(Code_vec.list.i)) {
        msg = paste0( 'is.na(Code_vec.list.i) for FilterName.i: ', FilterName.i )
        print(msg); warning(msg)
    } else if (paste0(FilterName.i, ".ndDate") %in% names(tblPersonID_FilterName.ndDate)) {
        msg = paste0( paste0(FilterName.i, ".ndDate"), ' %in% names(tblPersonID_FilterName.ndDate)', '-> skipping for CriteriaID.i: ', CriteriaID.i )
        print(msg); warning(msg)
    } else {
        print(paste0( 'Appending: ', paste0(FilterName.i, ".ndDate") ))
        varname4PersonID.i = "ENROLID"
        varname4t.i = "SVCDATE"
        varname4t0.i = "lmp"
        if (CodeType.i %in% c("ICD9", "ICD10")) {
            varname4Code.i = "value"
            # if(Mom_or_Baby.i %in% "Mom") {
                tblClaim_Date_Code.i = tblClaim_Date_Code4ICD
            # } else 
                if (Mom_or_Baby.i %in% "Infant") {
                tblClaim_Date_Code.i = tblClaim_Date_Code4ICD.infant
            }
            tblPersonID_FilterName.ndDate =
                tblPersonID_FilterName.ndDate %>%
                tblPersonID_FilterName.ndDate.append_FilterRegexMet(tblClaim_Date_Code = tblClaim_Date_Code.i, varname4PersonID = varname4PersonID.i, varname4t = varname4t.i, varname4t0 = varname4t0.i, t_begin.int.i = t_begin.int.i, t_end.int.i = t_end.int.i, FilterName.i = FilterName.i, FilterRegex.i = FilterRegex.i, varname4Code = varname4Code.i)
        }

        if (CodeType.i %in% c("CPT")) {
            varname4Code.i = "PROC1"
            # if(Mom_or_Baby.i %in% "Mom") {
                tblClaim_Date_Code.i = tblClaim_Date_Code4CPT
            # } else 
                if (Mom_or_Baby.i %in% "Infant") {
                tblClaim_Date_Code.i = tblClaim_Date_Code4CPT.infant
            }
            tblPersonID_FilterName.ndDate =
                tblPersonID_FilterName.ndDate %>%
                tblPersonID_FilterName.ndDate.append_FilterRegexMet(tblClaim_Date_Code = tblClaim_Date_Code.i, varname4PersonID = varname4PersonID.i, varname4t = varname4t.i, varname4t0 = varname4t0.i, t_begin.int.i = t_begin.int.i, t_end.int.i = t_end.int.i, FilterName.i = FilterName.i, FilterRegex.i = FilterRegex.i, varname4Code = varname4Code.i)
        }
        
        # if (CodeType.i == "Rx") { # missing value where TRUE/FALSE needed
        if (CodeType.i %in% c("Rx")) {
            # if(Mom_or_Baby.i %in% "Mom") {
                tblClaim_Date_Code.i = tblClaim_Date_Code4Rx
                varname4FilterMet.i = Code_vec.list.i
                
                tblPersonID_FilterName.ndDate =
                    tblPersonID_FilterName.ndDate %>%
                    tblPersonID_FilterName.ndDate.append_FilterMet(tblClaim_Date_Code = tblClaim_Date_Code.i, varname4PersonID = varname4PersonID.i, varname4t = varname4t.i, varname4t0 = varname4t0.i, t_begin.int.i = t_begin.int.i, t_end.int.i = t_end.int.i, FilterName.i = FilterName.i, varname4FilterMet.i = varname4FilterMet.i)
            # }
        }
        
    }
}
Sys.time() - t0
# [1] "Appending: t_NInf_154.ICD250x1_250x3.ndDate"
# [1] "Appending: t_NInf_0.RxCONCEPT_NDC_metformin.ndDate"
# > Sys.time() - t0
# Time difference of 16.99357 secs
tblPersonID_FilterName.ndDate %>% na.omit
# > tblPersonID_FilterName.ndDate %>% na.omit
# # A tibble: 7 x 3
#       ENROLID t_NInf_154.ICD250x1_250x3.ndDate t_NInf_0.RxCONCEPT_NDC_metformin.ndDate
#         <dbl>                            <int>                                   <int>
# 1   171946801                                2                                       1
# 2  1210879901                                5                                       1
# 3  1282775301                                1                                       7
# 4  2068053701                                3                                       2
# 5 27240989002                                1                                       1
# 6 27945818803                                2                                       1
# 7 28503004201                                1                                       2


tblPersonID_FilterName.ndDate %>% na.omit %>% {attr(., "na.action") = NULL; .} %>% dput #----
# > tblPersonID_FilterName.ndDate %>% na.omit %>% {attr(., "na.action") = NULL; .} %>% dput #----
structure(list(ENROLID = c(171946801, 1210879901, 1282775301,
2068053701, 27240989002, 27945818803, 28503004201), t_NInf_154.ICD250x1_250x3.ndDate = c(2L,
5L, 1L, 3L, 1L, 2L, 1L), t_NInf_0.RxCONCEPT_NDC_metformin.ndDate = c(1L,
1L, 7L, 2L, 1L, 1L, 2L)), row.names = c(NA, -7L), class = c("tbl_df",
"tbl", "data.frame"))

#@ end -----



