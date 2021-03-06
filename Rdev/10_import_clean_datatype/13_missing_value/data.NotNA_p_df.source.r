# data.NotNA_p_df.source.r


# load("data/library(mice) nhanes_mice.rda")
# load(url("https://github.com/mkim0710/tidystat/tree/master/data/library(mice) nhanes_mice.rda"))
# # > load(url("https://github.com/mkim0710/tidystat/tree/master/data/library(mice) nhanes_mice.rda"))
# # Error in load(url("https://github.com/mkim0710/tidystat/tree/master/data/library(mice) nhanes_mice.rda")) : 
# #   the input does not start with a magic number compatible with loading from a connection
load(url("https://github.com/mkim0710/tidystat/raw/master/data/library(mice) nhanes_mice.rda"))
nhanes_mice %>% str #-----
# > nhanes_mice %>% str #-----
# 'data.frame':	25 obs. of  4 variables:
#  $ age: num  1 2 1 3 1 3 1 1 2 2 ...
#  $ bmi: num  NA 22.7 NA NA 20.4 NA 22.5 30.1 22 NA ...
#  $ hyp: num  NA 1 1 NA 1 NA 1 1 1 NA ...
#  $ chl: num  NA 187 187 NA 113 184 118 187 238 NA ...



nhanes_mice %>% map_df(function(x) sum(is.na(x))) #----
nhanes_mice %>% map_df(.f = function(x) sum(is.na(x))) #----
nhanes_mice %>% map_df(.f = funs(sum(is.na(.)))) #----
# > nhanes_mice %>% map_df(function(x) sum(is.na(x))) #----
# # A tibble: 1 x 4
#     age   bmi   hyp   chl
#   <int> <int> <int> <int>
# 1     0     9     8    10
# > nhanes_mice %>% map_df(.f = function(x) sum(is.na(x))) #----
# # A tibble: 1 x 4
#     age   bmi   hyp   chl
#   <int> <int> <int> <int>
# 1     0     9     8    10
# > nhanes_mice %>% map_df(.f = funs(sum(is.na(.)))) #----
# Error: Can't convert a `fun_list` object to function
# Call `rlang::last_error()` to see a backtrace


nhanes_mice %>% summarise_all(function(x) sum(is.na(x))) #----
nhanes_mice %>% summarise_all(.funs = function(x) sum(is.na(x))) #----
nhanes_mice %>% summarise_all(funs(sum(is.na(.)))) #----
nhanes_mice %>% summarise_all(.funs = funs(sum(is.na(.)))) #----
nhanes_mice %>% summarise_all(sum(is.na(.))) #----
nhanes_mice %>% summarise_all(.funs = sum(is.na(.))) #----
# > nhanes_mice %>% summarise_all(function(x) sum(is.na(x))) #----
#   age bmi hyp chl
# 1   0   9   8  10
# > nhanes_mice %>% summarise_all(.funs = function(x) sum(is.na(x))) #----
#   age bmi hyp chl
# 1   0   9   8  10
# > nhanes_mice %>% summarise_all(funs(sum(is.na(.)))) #----
#   age bmi hyp chl
# 1   0   9   8  10
# > nhanes_mice %>% summarise_all(.funs = funs(sum(is.na(.)))) #----
#   age bmi hyp chl
# 1   0   9   8  10
# > nhanes_mice %>% summarise_all(sum(is.na(.))) #----
# Error: Can't create call to non-callable object
# Call `rlang::last_error()` to see a backtrace
# > nhanes_mice %>% summarise_all(.funs = sum(is.na(.))) #----
# Error: Can't create call to non-callable object
# Call `rlang::last_error()` to see a backtrace



nhanes_mice %>% {apply(., 2, function(x) sum(is.na(x)))} #----
# > nhanes_mice %>% {apply(., 2, function(x) sum(is.na(x)))} #----
# age bmi hyp chl 
#   0   9   8  10 






#@ ------

data.NotNA_p_df = function(data) {
    out = data %>% map_df(is.na) %>% colSums %>% as.data.frame %>% rownames_to_column %>% rename(varname = rowname) %>% rownames_to_column %>% rename(RowNum = rowname)
    colnames(out)[which(colnames(out) == ".")] = "IsNA"
    out = out %>% mutate(NotNA = nrow(data) - IsNA, NRow = nrow(data)) 
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
load(url("https://github.com/mkim0710/tidystat/raw/master/data/library(mice) nhanes_mice.rda"))
nhanes_mice %>% str #-----
# > nhanes_mice %>% str #-----
# 'data.frame':	25 obs. of  4 variables:
#  $ age: num  1 2 1 3 1 3 1 1 2 2 ...
#  $ bmi: num  NA 22.7 NA NA 20.4 NA 22.5 30.1 22 NA ...
#  $ hyp: num  NA 1 1 NA 1 NA 1 1 1 NA ...
#  $ chl: num  NA 187 187 NA 113 184 118 187 238 NA ...

nhanes_mice %>% {data.NotNA_p_df = function(data) {
    out = data %>% map_df(is.na) %>% colSums %>% as.data.frame %>% rownames_to_column %>% rename(varname = rowname) %>% rownames_to_column %>% rename(RowNum = rowname)
    colnames(out)[which(colnames(out) == ".")] = "IsNA"
    out = out %>% mutate(NotNA = nrow(data) - IsNA, NRow = nrow(data)) 
    out = out %>% add_column(IsNA_p_df = sprintf("%4.3f",out$IsNA/out$NRow), .after = "IsNA")
    out = out %>% add_column(NotNA_p_df = sprintf("%4.3f",out$NotNA/out$NRow), .after = "NotNA")
    out = out %>% arrange(IsNA)
    out
}; data.NotNA_p_df(.)}
nhanes_mice %>% data.NotNA_p_df
# > nhanes_mice %>% data.NotNA_p_df
#   RowNum varname IsNA IsNA_p_df NotNA NotNA_p_df NRow
# 1      1     age    0     0.000    25      1.000   25
# 2      3     hyp    8     0.320    17      0.680   25
# 3      2     bmi    9     0.360    16      0.640   25
# 4      4     chl   10     0.400    15      0.600   25










#@ ------
mscan_pregcohort_r4.sas7bdat$enrolid_inf1 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
mscan_pregcohort_r4.sas7bdat$enrolid_inf2 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
mscan_pregcohort_r4.sas7bdat$enrolid_inf3 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
mscan_pregcohort_r4.sas7bdat$enrolid_inf4 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf1 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#           !is.na       is.na     Sum
# n    1501597.000 1237190.000 2738787
# prop       0.548       0.452       1
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf2 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#         !is.na       is.na     Sum
# n    15320.000 2723467.000 2738787
# prop     0.006       0.994       1
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf3 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#      !is.na   is.na     Sum
# n         4 2738783 2738787
# prop      0       1       1
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf4 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#      !is.na   is.na     Sum
# n         1 2738786 2738787
# prop      0       1       1





#@ ------



#@ end -----
