# objectname = "f_filename.ext.find_subpath"
# f_filename.ext.find_subpath.dev.r
# f_filename.ext.find_subpath.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_filename.ext.find_subpath.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/f_filename.ext.find_subpath.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")){if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
## env.custom\$path ====
# path2look = "/"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "~"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "."; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
utils::browseURL(subpath)
sourcename = "f_filename.ext.find_subpath"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env.custom$path$subpath = subpath
env.custom$path$sourcename = sourcename
env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
cat("# ",'sourcename = "',sourcename,'"', "\n",
    "# ",sourcename,".dev.r", "\n",
    "# ",sourcename,".source.r", "\n",
    '# utils::browseURL("',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
    '# source(paste0(env.custom$path$source_base,"/","',env.custom$path$subpath.filename.source.r,'"))', "\n",
    '# # source("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    '# # source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    sep="")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$current.path.filename.ext);
    # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$current.path.filename.ext);
    # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$current.path.filename.ext);
    file2open = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$current.path.filename.ext);
    file2open = env.custom$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$current.path.filename.ext);
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  



library(tidyverse)
source("f_filename.ext.find_subpath.source.r")
filename.ext = "fhs"
env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# Error in env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T) : 
#   Error: filename.ext must have an extension.


library(tidyverse)
source("f_filename.ext.find_subpath.source.r")
filename.ext = "fhs.index100le10"
env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# Searching: .                                                 	 at depth 0
# Searching: ./-info                                           	 at depth 1; Queue length: 1
# Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# Searching: ./data                                            	 at depth 1; Queue length: 4
# Searching: ./examples                                        	 at depth 1; Queue length: 5
# Searching: ./other                                           	 at depth 1; Queue length: 6
# Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# Searching: ./tests                                           	 at depth 1; Queue length: 10
# Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# Searching: ./other/C                                         	 at depth 2; Queue length: 9
# Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# Searching: ./Rdev/20_tidy_group_by_match/23_group_by_PersonID	 at depth 3; Queue length: 24
# Searching: ./Rdev/20_tidy_group_by_match/25_study_population 	 at depth 3; Queue length: 25
# Searching: ./Rdev/20_tidy_group_by_match/27_match            	 at depth 3; Queue length: 26
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/43_network	 at depth 3; Queue length: 25
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/44_map	 at depth 3; Queue length: 26
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures	 at depth 3; Queue length: 27
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified	 at depth 3; Queue length: 28
# Searching: ./Rdev/50_model_formula_evaluation/51_model_formula	 at depth 3; Queue length: 28
# Searching: ./Rdev/50_model_formula_evaluation/53_model_selection	 at depth 3; Queue length: 29
# Searching: ./Rdev/50_model_formula_evaluation/55_model_weighted	 at depth 3; Queue length: 30
# Searching: ./Rdev/50_model_formula_evaluation/56_model_bootstrap	 at depth 3; Queue length: 31
# Searching: ./Rdev/50_model_formula_evaluation/57_model_time2event	 at depth 3; Queue length: 32
# Searching: ./Rdev/50_model_formula_evaluation/57_model_trajectory	 at depth 3; Queue length: 33
# Searching: ./Rdev/50_model_formula_evaluation/59_model_evaluation	 at depth 3; Queue length: 34
# ----------- File not found while searching following subpaths:
# c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# NULL



library(tidyverse)
source("f_filename.ext.find_subpath.source.r")
filename.ext = "fhs.index100le10.rds"
env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# Searching: .                                                 	 at depth 0
# Searching: ./-info                                           	 at depth 1; Queue length: 1
# Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# Searching: ./data                                            	 at depth 1; Queue length: 4
# [1] "./data/fhs.index100le10.rds"

filename.ext = "help.array.r"
env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# Searching: .                                                 	 at depth 0
# Searching: ./-info                                           	 at depth 1; Queue length: 1
# Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# Searching: ./data                                            	 at depth 1; Queue length: 4
# Searching: ./examples                                        	 at depth 1; Queue length: 5
# Searching: ./other                                           	 at depth 1; Queue length: 6
# Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# Searching: ./tests                                           	 at depth 1; Queue length: 10
# Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# Searching: ./other/C                                         	 at depth 2; Queue length: 9
# Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# [1] "./Rdev/10_import_clean_datatype/array_list/help.array.r"




library(tidyverse)
source("f_filename.ext.find_subpath.source.r")
filename.ext = "does not exist.r"
env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# Searching: .                                                 	 at depth 0
# Searching: ./-info                                           	 at depth 1; Queue length: 1
# Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# Searching: ./data                                            	 at depth 1; Queue length: 4
# Searching: ./examples                                        	 at depth 1; Queue length: 5
# Searching: ./other                                           	 at depth 1; Queue length: 6
# Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# Searching: ./tests                                           	 at depth 1; Queue length: 10
# Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# Searching: ./other/C                                         	 at depth 2; Queue length: 9
# Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# Searching: ./Rdev/20_tidy_group_by_match/23_group_by_PersonID	 at depth 3; Queue length: 24
# Searching: ./Rdev/20_tidy_group_by_match/25_study_population 	 at depth 3; Queue length: 25
# Searching: ./Rdev/20_tidy_group_by_match/27_match            	 at depth 3; Queue length: 26
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/43_network	 at depth 3; Queue length: 25
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/44_map	 at depth 3; Queue length: 26
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures	 at depth 3; Queue length: 27
# Searching: ./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified	 at depth 3; Queue length: 28
# Searching: ./Rdev/50_model_formula_evaluation/51_model_formula	 at depth 3; Queue length: 28
# Searching: ./Rdev/50_model_formula_evaluation/53_model_selection	 at depth 3; Queue length: 29
# Searching: ./Rdev/50_model_formula_evaluation/55_model_weighted	 at depth 3; Queue length: 30
# Searching: ./Rdev/50_model_formula_evaluation/56_model_bootstrap	 at depth 3; Queue length: 31
# Searching: ./Rdev/50_model_formula_evaluation/57_model_time2event	 at depth 3; Queue length: 32
# Searching: ./Rdev/50_model_formula_evaluation/57_model_trajectory	 at depth 3; Queue length: 33
# Searching: ./Rdev/50_model_formula_evaluation/59_model_evaluation	 at depth 3; Queue length: 34
# ----------- File not found while searching following subpaths:
# c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# NULL



library(tidyverse)
source("f_filename.ext.find_subpath.source.r")
filename.ext = "tblID_gj3_jk.rds"
env.custom$f_filename.ext.find_subpath(filename.ext, input_path = dirname(env.custom$path$source_base), print.intermediate = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, input_path = dirname(env.custom$path$source_base), print.intermediate = T)
# Searching: D:/OneDrive/[][Rproject]                          	 at depth 0
# Searching: D:/OneDrive/[][Rproject]/github_tidystat          	 at depth 1; Queue length: 1
# Searching: D:/OneDrive/[][Rproject]/Microsoft R Open 4.0.2   	 at depth 1; Queue length: 2
# Searching: D:/OneDrive/[][Rproject]/r4ds-master              	 at depth 1; Queue length: 3
# Searching: D:/OneDrive/[][Rproject]/Rproject_EPI288          	 at depth 1; Queue length: 4
# Searching: D:/OneDrive/[][Rproject]/Rproject_EPI522          	 at depth 1; Queue length: 5
# Searching: D:/OneDrive/[][Rproject]/Rproject_EPI524          	 at depth 1; Queue length: 6
# Searching: D:/OneDrive/[][Rproject]/Rproject_HEALS -void     	 at depth 1; Queue length: 7
# Searching: D:/OneDrive/[][Rproject]/Rproject_HEALS0215       	 at depth 1; Queue length: 8
# Searching: D:/OneDrive/[][Rproject]/Rproject_HEALS0215_01    	 at depth 1; Queue length: 9
# [1] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_01/tblID_gj3_jk.rds"

filename.ext = "metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"
env.custom$f_filename.ext.find_subpath(filename.ext, input_path = dirname(env.custom$path$source_base), print.intermediate = F, findMultiple = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, input_path = dirname(env.custom$path$source_base), print.intermediate = F, findMultiple = T)
# [1] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"   
# [2] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_01/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"
# [3] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_10/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"
# [4] "D:/OneDrive/[][Rproject]/Rproject_NSC0219/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"     
# [5] "D:/OneDrive/[][Rproject]/Rproject_NSC0219_01/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"  

filename.ext = "tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"
env.custom$f_filename.ext.find_subpath(filename.ext, input_path = dirname(env.custom$path$source_base), print.intermediate = F, findMultiple = T)
# > env.custom$f_filename.ext.find_subpath(filename.ext, input_path = dirname(env.custom$path$source_base), print.intermediate = F, findMultiple = T)
# [1] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"   
# [2] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_01/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"
# [3] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_10/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"
# [4] "D:/OneDrive/[][Rproject]/Rproject_NSC0219/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"     
# [5] "D:/OneDrive/[][Rproject]/Rproject_NSC0219_01/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"





#@ end -----
