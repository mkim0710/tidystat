
# https://github.com/mkim0710/tidystat/edit/master/Rdev/data.variable.Date.nID_anyTRUE_allTRUE.source.r
# data.variable.Date.nID_anyTRUE_allTRUE.source.r


#@ CONCLUSION ----------
# data.variable.Date.nID_anyTRUE_allTRUE = data.variable.Date.nID_anyTRUE_allTRUE.v3
# data.variable.Date.nID_anyTRUE = data.variable.Date.nID_anyTRUE.v1


library(dplyr)



#$ sample_data =====
# Create a sample dataset
set.seed(123)
sample_data <- tibble(
    !!sym(varname.ID) = sample(1:1000, 5000, replace = TRUE),
    RECU_FR_Date.F0003.G30 = sample(c(as.Date('2023-08-30'), NA), 5000, replace = TRUE)
)


#@ Using group_by() method ----
##%% data.variable.Date.nID_anyTRUE.v3() =====
data.variable.Date.nID_anyTRUE.v3 <- function(dataset, varname.ID = "PERSON_ID", varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.ID %in% names(dataset)) stop(paste0("Variable ", varname.ID, " not found in the dataset."))
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(!!sym(varname.ID)),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    # Summary table for nTRUE grouped by !!sym(varname.ID)
    summary_table.nTRUE_byID <- dataset %>%
        group_by(!!sym(varname.ID)) %>% 
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
data.variable.Date.nID_anyTRUE.v2 <- function(dataset, varname.ID = "PERSON_ID", varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.ID %in% names(dataset)) stop(paste0("Variable ", varname.ID, " not found in the dataset."))
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(!!sym(varname.ID)),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    summary_table.nID_anyTRUE = dataset %>%
        group_by(!!sym(varname.ID)) %>% 
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
data.variable.Date.nID_anyTRUE.v1 <- function(dataset, varname.ID = "PERSON_ID", varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.ID %in% names(dataset)) stop(paste0("Variable ", varname.ID, " not found in the dataset."))
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(!!sym(varname.ID)),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    nID_anyTRUE <- dataset %>% 
        filter(!is.na(!!sym(varname.Date))) %>% 
        select(!!sym(varname.ID)) %>% n_distinct()
    
    nID_anyNA <-  dataset %>% 
        filter(is.na(!!sym(varname.Date))) %>% 
        select(!!sym(varname.ID)) %>% n_distinct()
    
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
    v3.group_by_method_stepwise = data.variable.Date.nID_anyTRUE.v3(sample_data),
    v2.group_by_method_combined  = data.variable.Date.nID_anyTRUE.v2(sample_data),
    v0.direct_filter_method = data.variable.Date.nID_anyTRUE.v1(sample_data),
    times = 100
)
plot(mbm)
microbenchmark:::autoplot.microbenchmark(mbm)
print(mbm)
# > print(mbm)
# Unit: milliseconds
#                         expr     min      lq      mean   median       uq     max neval
#  v3.group_by_method_stepwise 10.9006 11.3742 11.911608 11.60975 11.89690 18.2341   100
#  v2.group_by_method_combined 10.9815 11.3570 12.051454 11.61580 12.06405 17.6521   100
#      v1.direct_filter_method  5.6855  6.0449  6.553532  6.14270  6.53555 13.2964   100

# -> v1.direct_filter_method is twice faster ~!!!!






#@ Using group_by() method ----
##%% data.variable.Date.nID_anyTRUE_allTRUE.v3() =====
data.variable.Date.nID_anyTRUE_allTRUE.v3 <- function(dataset, varname.ID = "PERSON_ID", varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.ID %in% names(dataset)) stop(paste0("Variable ", varname.ID, " not found in the dataset."))
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(!!sym(varname.ID)),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    # Calculate values grouped by !!sym(varname.ID)
    summary_table.nTRUE_byID <- dataset %>%
        group_by(!!sym(varname.ID)) %>% 
        summarise(
            nTRUE_byID = sum(!is.na(!!sym(varname.Date))),
            nNA_byID = sum(is.na(!!sym(varname.Date))),
            n_byID = n()
        )
    
    # Determine counts based on summary_table.nTRUE_byID
    summary_table.nID_anyTRUE_allTRUE <- summary_table.nTRUE_byID %>%
        summarise(
            nID_anyTRUE = sum(nTRUE_byID >= 1),
            nID_anyNA = sum(nNA_byID >= 1),
            nID_allTRUE = sum(nTRUE_byID == n_byID),
            nID_allNA = sum(nNA_byID == n_byID)
        ) %>% ungroup()
    
    result <- bind_cols(summary_table.nTRUE, summary_table.nID_anyTRUE_allTRUE)
    return(result)
}

data.variable.Date.nID_anyTRUE_allTRUE.v3(sample_data)
# > data.variable.Date.nID_anyTRUE_allTRUE.v3(sample_data)
# # A tibble: 1 × 8
#    nrow nd_ID nTRUE   nNA nID_anyTRUE nID_anyNA nID_allTRUE nID_allNA
#   <int> <int> <int> <int>       <int>     <int>       <int>     <int>
# 1  5000   988  2515  2485         921       924          64        67





#@ Direct Filter Method using filter() & n_distinct -----
##%% data.variable.Date.nID_anyTRUE_allTRUE.v1() =====
data.variable.Date.nID_anyTRUE_allTRUE.v1 <- function(dataset, varname.ID = "PERSON_ID", varname.Date = "RECU_FR_Date.F0003.G30") {
    if (!varname.ID %in% names(dataset)) stop(paste0("Variable ", varname.ID, " not found in the dataset."))
    if (!varname.Date %in% names(dataset)) stop(paste0("Variable ", varname.Date, " not found in the dataset."))
    
    # Overall summary table for nTRUE
    summary_table.nTRUE <- dataset %>%
        summarise(
            nrow = n(),
            nd_ID = n_distinct(!!sym(varname.ID)),
            nTRUE = sum(!is.na(!!sym(varname.Date))),
            nNA = sum(is.na(!!sym(varname.Date)))
        )
    
    nID_anyTRUE <- dataset %>% 
        filter(!is.na(!!sym(varname.Date))) %>% 
        select(!!sym(varname.ID)) %>% n_distinct()
    
    nID_anyNA <-  dataset %>% 
        filter(is.na(!!sym(varname.Date))) %>% 
        select(!!sym(varname.ID)) %>% n_distinct()
    
    # Calculating nID_allTRUE
    # nID_allTRUE <- dataset %>%
    #     group_by(!!sym(varname.ID)) %>%
    #     filter(all(!is.na(!!sym(varname.Date)))) %>%
    #     n_distinct(!!sym(varname.ID))
    nID_allTRUE <- dataset %>%
        group_by(!!sym(varname.ID)) %>%
        summarise(allTRUE = all(!is.na(!!sym(varname.Date)))) %>%
        filter(allTRUE) %>%
        nrow()
    
    # Calculating nID_allNA
    # nID_allNA <- dataset %>%
    #     group_by(!!sym(varname.ID)) %>%
    #     filter(all(is.na(!!sym(varname.Date)))) %>%
    #     n_distinct(!!sym(varname.ID))
    nID_allNA <- dataset %>%
        group_by(!!sym(varname.ID)) %>%
        summarise(allNA = all(is.na(!!sym(varname.Date)))) %>%
        filter(allNA) %>%
        nrow()
    
    result <- summary_table.nTRUE %>%
        mutate(
            nID_anyTRUE = nID_anyTRUE,
            nID_anyNA = nID_anyNA,
            nID_allTRUE = nID_allTRUE,
            nID_allNA = nID_allNA
        )
    
    return(result)
}
data.variable.Date.nID_anyTRUE_allTRUE.v1(sample_data)
# > data.variable.Date.nID_anyTRUE_allTRUE.v1(sample_data)
# # A tibble: 1 × 8
#    nrow nd_ID nTRUE   nNA nID_anyTRUE nID_anyNA nID_allTRUE nID_allNA
#   <int> <int> <int> <int>       <int>     <int>       <int>     <int>
# 1  5000   988  2515  2485         921       924          64        67



#% microbenchmark() -----
mbm <- microbenchmark(
    data.variable.Date.nID_anyTRUE_allTRUE.v3 = data.variable.Date.nID_anyTRUE_allTRUE.v3(sample_data),
    data.variable.Date.nID_anyTRUE_allTRUE.v1 = data.variable.Date.nID_anyTRUE_allTRUE.v1(sample_data),
    times = 100
)
plot(mbm)
microbenchmark:::autoplot.microbenchmark(mbm)
print(mbm)
# > print(mbm)
# Unit: milliseconds
#                                       expr     min       lq     mean   median       uq     max neval
#  data.variable.Date.nID_anyTRUE_allTRUE.v3 15.9663 16.47005 17.08602 16.74795 17.22630 21.3079   100
#  data.variable.Date.nID_anyTRUE_allTRUE.v1 20.6117 21.21510 22.43173 21.49395 22.93555 28.3092   100


#**** data.variable.Date.nID_anyTRUE_allTRUE.v3 is faster for more calculations! 


#@ end ---------

