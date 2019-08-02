
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
                filter( eval(parse(text = varname4t)) >= eval(parse(text = varname4t0)) + t_begin.int.i) %>% 
                filter( eval(parse(text = varname4t)) <= eval(parse(text = varname4t0)) + t_end.int.i) %>% 
                mutate(
                    FilterRegexMet = grepl( FilterRegex.i, eval(parse(text = varname4Code)) )
                ) %>% filter(FilterRegexMet) %>% 
                group_by(ENROLID) %>% summarise(
                    !!rlang::sym( paste0(FilterName.i, ".ndDate") ) := n_distinct(as.numeric( eval(parse(text = varname4t)) ), na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".minDate") ) := min(SVCDATE, na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".maxDate") ) := max(SVCDATE, na.rm = T)
                ) %>%
                as.tibble
            , by = "ENROLID"
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
                filter( eval(parse(text=varname4t)) >= eval(parse(text=varname4t0)) + t_begin.int.i) %>% 
                filter( eval(parse(text=varname4t)) <= eval(parse(text=varname4t0)) + t_end.int.i) %>% 
                filter( eval(parse(text=varname4FilterMet.i)) ) %>% 
                group_by(ENROLID) %>% summarise(
                    !!rlang::sym( paste0(FilterName.i, ".ndDate") ) := n_distinct(as.numeric( eval(parse(text=varname4t)) ), na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".minDate") ) := min(SVCDATE, na.rm = T)
                    # , !!rlang::sym( paste0(FilterName.i, ".maxDate") ) := max(SVCDATE, na.rm = T)
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











#@@@ tblPersonID_FilterName.ndDate -----
t0 = Sys.time()
tblPersonID_FilterName.ndDate =
    os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014 %>%
    select(ENROLID) %>% distinct
for (i in 1:nrow(Criteria.tbl.bind_rows)) {
    CriteriaID.i = Criteria.tbl.bind_rows[i,]$CriteriaID
    CodeType.i = Criteria.tbl.bind_rows[i,]$CodeType

    t_begin.int.i = Criteria.tbl.bind_rows[i,]$t_begin.int
    t_end.int.i = Criteria.tbl.bind_rows[i,]$t_end.int
    if (is.na(t_end.int.i)) t_end.int.i = Inf

    FilterName.i = Criteria.tbl.bind_rows[i,]$FilterName
    FilterRegex.i = Criteria.tbl.bind_rows[i,]$FilterRegex
    Code_vec.list.i = Criteria.tbl.bind_rows[i,]$Code_vec.list

    if (is.na(Code_vec.list.i)) {
        msg = paste0( 'is.na(Code_vec.list.i) for FilterName.i: ', FilterName.i )
        print(msg); warning(msg)
    } else if (paste0(FilterName.i, ".ndDate") %in% names(tblPersonID_FilterName.ndDate)) {
        msg = paste0( paste0(FilterName.i, ".ndDate"), ' %in% names(tblPersonID_FilterName.ndDate)', '-> skipping for CriteriaID.i: ', CriteriaID.i )
        print(msg); warning(msg)
    } else {
        print(paste0( 'Appending: ', paste0(FilterName.i, ".ndDate") ))
        if (CodeType.i %in% c("ICD9", "ICD10")) {
            tblPersonID_FilterName.ndDate =
                tblPersonID_FilterName.ndDate %>%
                    tblPersonID_FilterName.ndDate.append_FilterRegexMet(
                        tblClaim_Date_Code = tblClaim_Date_Code4ICD
                        # , CriteriaID.i = CriteriaID.i
                        # , CodeType.i = CodeType.i
                        , t_begin.int.i = t_begin.int.i
                        , t_end.int.i = t_end.int.i
                        , FilterName.i = FilterName.i
                        , FilterRegex.i = FilterRegex.i
                        # , Code_vec.list.i = Code_vec.list.i
                    )
        }

        # if (CodeType.i == "Rx") { # missing value where TRUE/FALSE needed
        if (CodeType.i %in% c("Rx")) {
            tblPersonID_FilterName.ndDate = 
                tblPersonID_FilterName.ndDate %>% 
                tblPersonID_FilterName.ndDate.append_FilterMet(
                    tblClaim_Date_Code = tblClaim_Date_Code4Rx
                    , varname4PersonID = "ENROLID"
                    , varname4t = "SVCDATE"
                    , varname4t0 = "lmp"
                    , t_begin.int.i = t_begin.int.i
                    , t_end.int.i = t_end.int.i
                    , varname4Code = "value"
                    , FilterName.i = FilterName.i
                    , varname4FilterMet.i = Code_vec.list.i
                )

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



