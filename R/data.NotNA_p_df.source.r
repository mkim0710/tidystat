# data.NotNA_p_df.source.r



data.NotNA_p_df = function(data) {
    out = data %>% map_df(is.na) %>% colSums %>% as.data.frame %>% rownames_to_column %>% rename(varname = rowname) %>% rownames_to_column
    colnames(out)[which(colnames(out) == ".")] = "IsNA"
    out = out %>% mutate(NotNA = nrow(data) - nrow(data), NRow = nrow(data)) 
    out = out %>% add_column(IsNA_p_df = sprintf("%4.3f",out$IsNA/out$NRow), .after = "IsNA")
    out = out %>% add_column(NotNA_p_df = sprintf("%4.3f",out$NotNA/out$NRow), .after = "NotNA")
    out = out %>% arrange(IsNA)
    out
}


# test) data.NotNA_p_df()) nhanes_mice -----
# library(mice)
# nhanes_mice = nhanes
# save(nhanes_mice, file = "data/library(mice) nhanes_mice.rda")
library(tidyverse)
load("data/library(mice) nhanes_mice.rda")
nhanes_mice %>% {data.NotNA_p_df = function(data) {
    out = data %>% map_df(is.na) %>% colSums %>% as.data.frame %>% rownames_to_column %>% rename(varname = rowname) %>% rownames_to_column
    colnames(out)[which(colnames(out) == ".")] = "IsNA"
    out = out %>% mutate(NotNA = nrow(data) - nrow(data), NRow = nrow(data)) 
    out = out %>% add_column(IsNA_p_df = sprintf("%4.3f",out$IsNA/out$NRow), .after = "IsNA")
    out = out %>% add_column(NotNA_p_df = sprintf("%4.3f",out$NotNA/out$NRow), .after = "NotNA")
    out = out %>% arrange(IsNA)
    out
}; data.NotNA_p_df(.)}
nhanes_mice %>% data.NotNA_p_df
# > nhanes_mice %>% data.NotNA_p_df
#   rowname varname IsNA IsNA_p_df NotNA NotNA_p_df NRow
# 1       1     age     0   0.000     25    1.000   25
# 2       3     hyp     8   0.320     17    0.680   25
# 3       2     bmi     9   0.360     16    0.640   25
# 4       4     chl    10   0.400     15    0.600   25


#@ end -----
