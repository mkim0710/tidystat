data.variable.Date.nID_TRUE_NA <- function(dataset, ...){
  library(dplyr)
  
  # Get the variable names as characters
  varnames <- rlang::ensyms(...)
  
  single_var_summary <- function(varname, dataset) {
    varname_char <- as.character(rlang::as_label(varname))
    
    if (!varname_char %in% names(dataset)) {
      stop(paste0("Variable ", varname_char, " not found in the dataset."))
    }
    
    summary_table <- dataset %>%
      summarise(
        nrow = n(),
        nd_ID = n_distinct(RN_INDI),
        nTRUE = sum(!is.na({{ varname }})),
        nNA = sum(is.na({{ varname }}))
      )
    
    summary_table_byID <- dataset %>%
      group_by(RN_INDI) %>%
      summarise(
        nTRUE_byID = sum(!is.na({{ varname }})),
        nNA_byID = sum(is.na({{ varname }}))
      ) %>%
      ungroup()
    
    summary_table_nID <- summary_table_byID %>%
      ungroup() %>%
      summarise(
        nID_TRUE = sum(nTRUE_byID >= 1),
        nID_NA = sum(nNA_byID >= 1)
      )
    
    out <- bind_cols(summary_table, summary_table_nID) %>%
      select(nrow, nTRUE, nNA, everything()) %>%
      add_column(varname = varname_char, .before = 1)
    
    return(out)
  }
  
  results <- lapply(varnames, single_var_summary, dataset = dataset)
  do.call(rbind, results)
}


nsc2_m20.Date.C0097.D0009.D3233.D3748 %>% 
    data.variable.Date.nID_TRUE_NA(
        MDCARE_STRT_Date.C0097.D0009.D3233.D3748,
        MDCARE_STRT_Date.C0097,
        MDCARE_STRT_Date.D0009,
        MDCARE_STRT_Date.D3233,
        MDCARE_STRT_Date.D3748
    )
# # A tibble: 5 × 7
#   varname                                   nrow nTRUE   nNA nd_ID nID_TRUE nID_NA
#   <chr>                                    <int> <int> <int> <int>    <int>  <int>
# 1 MDCARE_STRT_Date.C0097.D0009.D3233.D3748 30120 13852 16268  3445      685   3140
# 2 MDCARE_STRT_Date.C0097                   30120 12500 17620  3445      540   3232
# 3 MDCARE_STRT_Date.D0009                   30120   101 30019  3445       24   3438
# 4 MDCARE_STRT_Date.D3233                   30120   535 29585  3445       34   3432
# 5 MDCARE_STRT_Date.D3748                   30120   716 29404  3445      158   3401
