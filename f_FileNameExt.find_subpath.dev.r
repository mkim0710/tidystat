# .objectname = "f_FileNameExt.find_subpath"
# f_FileNameExt.find_subpath.dev.r
# f_FileNameExt.find_subpath.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_FileNameExt.find_subpath.dev.r
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_FileNameExt.find_subpath.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .FileName.source.r = "function.detachAllPackages" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_FileNameExt.find_subpath" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.RelativeSubPath = .RelativeSubPath
.SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
env1$path$.SourceName_root = .SourceName_root  
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r)
cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
    "#### ",env1$path$.RelativeSubPath_FileName.dev.r, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

env1$source$f_FileNameExt.find_subpath.source.r = NULL
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_FileNameExt.find_subpath.source.r")
FileNameExt = "fhs"
env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# Error in env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T) : 
#   Error: FileNameExt must have an extension.


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_FileNameExt.find_subpath.source.r")
FileNameExt = "fhs.index100le10"
env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
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
# ----------- File not found while searching following .RelativeSubPaths:
# c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# NULL



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_FileNameExt.find_subpath.source.r")
FileNameExt = "fhs.index100le10.rds"
env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# Searching: .                                                 	 at depth 0
# Searching: ./-info                                           	 at depth 1; Queue length: 1
# Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# Searching: ./data                                            	 at depth 1; Queue length: 4
# [1] "./data/fhs.index100le10.rds"

FileNameExt = "help.array.r"
env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
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




.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_FileNameExt.find_subpath.source.r")
FileNameExt = "does not exist.r"
env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
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
# ----------- File not found while searching following .RelativeSubPaths:
# c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# NULL



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_FileNameExt.find_subpath.source.r")
FileNameExt = "tblID_gj3_jk.rds"
env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = dirname(env1$path$source_base), VERBOSE = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = dirname(env1$path$source_base), VERBOSE = T)
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

FileNameExt = "metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"
env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = dirname(env1$path$source_base), VERBOSE = F, findMultiple = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = dirname(env1$path$source_base), VERBOSE = F, findMultiple = T)
# [1] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"   
# [2] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_01/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"
# [3] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_10/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"
# [4] "D:/OneDrive/[][Rproject]/Rproject_NSC0219/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"     
# [5] "D:/OneDrive/[][Rproject]/Rproject_NSC0219_01/metadata_id_age() flowchart_inclusion_exclusions_v3.4()@ASROCKX300RYZEN -dev.Rmd"  

FileNameExt = "tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"
env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = dirname(env1$path$source_base), VERBOSE = F, findMultiple = T)
# > env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = dirname(env1$path$source_base), VERBOSE = F, findMultiple = T)
# [1] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"   
# [2] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_01/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"
# [3] "D:/OneDrive/[][Rproject]/Rproject_HEALS0215_10/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"
# [4] "D:/OneDrive/[][Rproject]/Rproject_NSC0219/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"     
# [5] "D:/OneDrive/[][Rproject]/Rproject_NSC0219_01/tidy_metadata_id_age()@ASROCKX300RYZEN -dev.Rmd"



  
  
# __________|------  
# @@ END-----  
