# sourcename = "data.NotNA_p_df"
# data.NotNA_p_df.dev.r
# data.NotNA_p_df.source.r
#         https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/data.nproptable.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/data.summarize_all_sum_is.na.dev.r
# get(objectname) %>% summarise_all(function(x) sum(is.na(x)) ) %>% t # Caution) always check for missing values~!!! -----
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/data.variable.Date.nID_anyTRUE_allTRUE.dev.r
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)

env.custom$data.NotNA_p_df = function(data) {
    out = data %>% map_df(is.na) %>% colSums %>% as.data.frame %>% rownames_to_column %>% rename(varname = rowname) %>% rownames_to_column %>% rename(RowNum = rowname)
    colnames(out)[which(colnames(out) == ".")] = "IsNA"
    out = out %>% mutate(NotNA = nrow(data) - IsNA, NRow = nrow(data)) 
    out = out %>% add_column(IsNA_p_df = sprintf("%4.3f",out$IsNA/out$NRow), .after = "IsNA")
    out = out %>% add_column(NotNA_p_df = sprintf("%4.3f",out$NotNA/out$NRow), .after = "NotNA")
    out = out %>% arrange(IsNA)
    out
}

packageStartupMessage("Loading: env.custom$data.NotNA_p_df = function(data)")

# test) data.NotNA_p_df()) nhanes_mice -----
# library(mice)
# nhanes_mice = nhanes
# save(nhanes_mice, file = "data/library_mice_nhanes_mice.rda")

# library(tidyverse)
# load(url("https://github.com/mkim0710/tidystat/raw/master/data/library_mice_nhanes_mice.rda"))
# nhanes_mice %>% str #-----
# # > nhanes_mice %>% str #-----
# # 'data.frame':	25 obs. of  4 variables:
# #  $ age: num  1 2 1 3 1 3 1 1 2 2 ...
# #  $ bmi: num  NA 22.7 NA NA 20.4 NA 22.5 30.1 22 NA ...
# #  $ hyp: num  NA 1 1 NA 1 NA 1 1 1 NA ...
# #  $ chl: num  NA 187 187 NA 113 184 118 187 238 NA ...
# 
# nhanes_mice %>% {data.NotNA_p_df = function(data) {
#     out = data %>% map_df(is.na) %>% colSums %>% as.data.frame %>% rownames_to_column %>% rename(varname = rowname) %>% rownames_to_column %>% rename(RowNum = rowname)
#     colnames(out)[which(colnames(out) == ".")] = "IsNA"
#     out = out %>% mutate(NotNA = nrow(data) - IsNA, NRow = nrow(data)) 
#     out = out %>% add_column(IsNA_p_df = sprintf("%4.3f",out$IsNA/out$NRow), .after = "IsNA")
#     out = out %>% add_column(NotNA_p_df = sprintf("%4.3f",out$NotNA/out$NRow), .after = "NotNA")
#     out = out %>% arrange(IsNA)
#     out
# }; data.NotNA_p_df(.)}
# nhanes_mice %>% data.NotNA_p_df
# # > nhanes_mice %>% data.NotNA_p_df
# #   RowNum varname IsNA IsNA_p_df NotNA NotNA_p_df NRow
# # 1      1     age    0     0.000    25      1.000   25
# # 2      3     hyp    8     0.320    17      0.680   25
# # 3      2     bmi    9     0.360    16      0.640   25
# # 4      4     chl   10     0.400    15      0.600   25






# #@ ------
# mscan_pregcohort_r4.sas7bdat$enrolid_inf1 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# mscan_pregcohort_r4.sas7bdat$enrolid_inf2 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# mscan_pregcohort_r4.sas7bdat$enrolid_inf3 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# mscan_pregcohort_r4.sas7bdat$enrolid_inf4 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# # > mscan_pregcohort_r4.sas7bdat$enrolid_inf1 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# #           !is.na       is.na     Sum
# # n    1501597.000 1237190.000 2738787
# # prop       0.548       0.452       1
# # > mscan_pregcohort_r4.sas7bdat$enrolid_inf2 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# #         !is.na       is.na     Sum
# # n    15320.000 2723467.000 2738787
# # prop     0.006       0.994       1
# # > mscan_pregcohort_r4.sas7bdat$enrolid_inf3 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# #      !is.na   is.na     Sum
# # n         4 2738783 2738787
# # prop      0       1       1
# # > mscan_pregcohort_r4.sas7bdat$enrolid_inf4 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# #      !is.na   is.na     Sum
# # n         1 2738786 2738787
# # prop      0       1       1


#@ ------



#@ end -----