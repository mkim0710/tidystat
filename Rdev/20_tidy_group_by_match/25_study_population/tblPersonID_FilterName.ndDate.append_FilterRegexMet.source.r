
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



