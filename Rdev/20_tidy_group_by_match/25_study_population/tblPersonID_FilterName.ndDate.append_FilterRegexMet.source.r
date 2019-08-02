
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

