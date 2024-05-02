# sourcename = "data.NotNA_p_df"
# data.NotNA_p_df.dev.r
# data.NotNA_p_df.source.r
#         https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/data.NotNA_p_df.source.r")
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
for(packagename in c("tidyverse")){if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
sourcename = "env.custom$env.internal"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
sourcename = "f_df.t.tribble_construct"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
sourcename = "get_system_info"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
env.custom$info$info_system_info = env.custom$info$get_system_info()
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sourcename = "f_path.df_dirs_recursive.df_files"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
env.custom$path$df_dirs_recursive.df_files = env.custom$f_path.df_dirs_recursive.df_files(input_path=env.custom$path$path1, print.message=FALSE)
env.custom$path$df_dirs_recursive.df_files$path %>% unique %>% paste0(collapse = "\n") %>% cat
env.custom$path$df_dirs_recursive.df_files %>% filter(path.level <= 2) %>% dplyr::select(print_tree_path_files.codes) %>% unlist %>% paste(collapse="") %>% cat
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @ subpath, sourcename ======
subpath = r"(Rdev\10_import_clean_datatype\13_missing_value)" %>% str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
sourcename = "data.NotNA_p_df"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env.custom$path$subpath = subpath
env.custom$path$sourcename = sourcename
env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
cat("# ",'sourcename = "',sourcename,'"', "\n",
    "# ",sourcename,".dev.r", "\n",
    "# ",sourcename,".source.r", "\n",
    '#         ',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r, "\n",
    '# source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    sep="")
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
# if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base, "rstudio-prefs", "templates", "default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$current.path.filename.ext);
if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base, "rstudio-prefs", "templates", "templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$current.path.filename.ext);
if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base, "rstudio-prefs", "templates", "default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$current.path.filename.ext);
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


# load("data/library_mice_nhanes_mice.rda")
# load(url("https://github.com/mkim0710/tidystat/tree/master/data/library_mice_nhanes_mice.rda"))
# # > load(url("https://github.com/mkim0710/tidystat/tree/master/data/library_mice_nhanes_mice.rda"))
# # Error in load(url("https://github.com/mkim0710/tidystat/tree/master/data/library_mice_nhanes_mice.rda")) : 
# #   the input does not start with a magic number compatible with loading from a connection
load(url("https://github.com/mkim0710/tidystat/raw/master/data/library_mice_nhanes_mice.rda"))
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
# save(nhanes_mice, file = "data/library_mice_nhanes_mice.rda")

library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/data/library_mice_nhanes_mice.rda"))
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
