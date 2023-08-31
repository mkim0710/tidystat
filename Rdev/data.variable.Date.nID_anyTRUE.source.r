
# data.variable.Date.nID_anyTRUE.source.r

library(dplyr)



#$ sample_data =====
# Create a sample dataset
set.seed(123)
sample_data <- tibble(
    PERSON_ID = sample(1:1000, 5000, replace = TRUE),
    RECU_FR_Date.F0003.G30 = sample(c(as.Date('2023-08-30'), NA), 5000, replace = TRUE)
)


#@ Using group_by() method ----
##%% data.variable.Date.nID_anyTRUE.v3() =====
data.variable.Date.nID_anyTRUE.v3 <- function(dataset, varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(PERSON_ID),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    # Summary table for nTRUE grouped by PERSON_ID
    summary_table.nTRUE_byID <- dataset %>%
        group_by(PERSON_ID) %>% 
        summarise(
            nTRUE_byID = sum(!is.na(!!sym(varname.Date))),
            nNA_byID = sum(is.na(!!sym(varname.Date)))
        ) 
    
    summary_table.nID_anyTRUE = summary_table.nTRUE_byID %>% ungroup() %>% 
        summarise(
            nID_anyTRUE = sum(nTRUE_byID >= 1),
            nID_anyNA = sum(nNA_byID >= 1)
        )
    
    result <- bind_cols(summary_table.nTRUE, summary_table.nID_anyTRUE)
    return(result)
}
data.variable.Date.nID_anyTRUE.v3(sample_data)
# > data.variable.Date.nID_anyTRUE.v3(sample_data)
# # A tibble: 1 × 6
#    nrow nd_ID nTRUE   nNA nID_anyTRUE nID_anyNA
#   <int> <int> <int> <int>       <int>     <int>
# 1  5000   988  2515  2485         921       924




#@ Using group_by() method ----
##%% data.variable.Date.nID_anyTRUE.v2() =====
data.variable.Date.nID_anyTRUE.v2 <- function(dataset, varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(PERSON_ID),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    summary_table.nID_anyTRUE = dataset %>%
        group_by(PERSON_ID) %>% 
        summarise(
            nTRUE_byID = sum(!is.na(!!sym(varname.Date))),
            nNA_byID = sum(is.na(!!sym(varname.Date)))
        ) %>% 
        ungroup() %>% 
        summarise(
            nID_anyTRUE = sum(nTRUE_byID >= 1),
            nID_anyNA = sum(nNA_byID >= 1)
        )
    
    result <- bind_cols(summary_table.nTRUE, summary_table.nID_anyTRUE)
    return(result)
}
data.variable.Date.nID_anyTRUE.v2(sample_data)
# > data.variable.Date.nID_anyTRUE.v2(sample_data)
# # A tibble: 1 × 6
#    nrow nd_ID nTRUE   nNA nID_anyTRUE nID_anyNA
#   <int> <int> <int> <int>       <int>     <int>
# 1  5000   988  2515  2485         921       924



#@ Direct Filter Method using filter() & n_distinct -----
##%% data.variable.Date.nID_anyTRUE.v1() =====
data.variable.Date.nID_anyTRUE.v1 <- function(dataset, varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(PERSON_ID),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    nID_anyTRUE <- dataset %>% 
        filter(!is.na(!!sym(varname.Date))) %>% 
        select(PERSON_ID) %>% n_distinct()
    
    nID_anyNA <-  dataset %>% 
        filter(is.na(!!sym(varname.Date))) %>% 
        select(PERSON_ID) %>% n_distinct()
    
    result <- summary_table.nTRUE %>%
        mutate(
            nID_anyTRUE = nID_anyTRUE,
            nID_anyNA = nID_anyNA
        )
    
    return(result)
}
data.variable.Date.nID_anyTRUE.v1(sample_data)
# > data.variable.Date.nID_anyTRUE.v1(sample_data)
# # A tibble: 1 × 6
#    nrow nd_ID nTRUE   nNA nID_anyTRUE nID_anyNA
#   <int> <int> <int> <int>       <int>     <int>
# 1  5000   988  2515  2485         921       924


#% microbenchmark() -----
mbm <- microbenchmark(
    v3.group_by_method = data.variable.Date.nID_anyTRUE.v3(sample_data),
    v2.group_by_method = data.variable.Date.nID_anyTRUE.v2(sample_data),
    v1.direct_filter_method = data.variable.Date.nID_anyTRUE.v1(sample_data),
    times = 100
)

print(mbm)


