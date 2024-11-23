# .objectname = "f_filename.ext.find_subpath"
# f_filename.ext.find_subpath.dev.r
# f_filename.ext.find_subpath.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_filename.ext.find_subpath.dev.r
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_filename.ext.find_subpath.source.r")
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
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.source.r = .filename.source.r %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(isTRUE(options()$function.reload) || !.filename.source.r %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.filename.source.r]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.filename.source.r]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext))
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .filename.source.r ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.filename.source.r = "f_filename.ext.find_subpath" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.subpath = .subpath
.sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root  
env1$path$.subpath_filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath_filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath_filename.source.r = .filename.source.r %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath_filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath_filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath_filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath_filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath_filename.source.r) ) ----  
# env1 = env0
# .subpath_filename.source.r = .filename.source.r %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.filename.source.r]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.filename.source.r]])
# if(isTRUE(options()$function.reload) || !.filename.source.r %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.filename.source.r]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.filename.source.r]])}
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_filename.ext.find_subpath.source.r")
filename.ext = "fhs"
env1$f$f_filename.ext.find_subpath(filename.ext, VERBOSE = T)
# > env1$f$f_filename.ext.find_subpath(filename.ext, VERBOSE = T)
# Error in env1$f$f_filename.ext.find_subpath(filename.ext, VERBOSE = T) : 
#   Error: filename.ext must have an extension.


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_filename.ext.find_subpath.source.r")
filename.ext = "fhs.index100le10"
env1$f$f_filename.ext.find_subpath(filename.ext, VERBOSE = T)
# > env1$f$f_filename.ext.find_subpath(filename.ext, VERBOSE = T)
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



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
source("f_filename.ext.find_subpath.source.r")
.tmp = env1$f$f_DataSetName.Search.read.checkEntity(DataSetName=DataSetName,ext="rds", .path4read=.path4read, vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", "hpid", "pid", "hid"), return.output = TRUE, VERBOSE = TRUE)
# > MetaData$DataSetNames[[DataSetName]] = env1$f$f_DataSetName.Search.read.checkEntity(DataSetName=DataSetName,ext="rds", .path4read=.path4read, vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", "hpid", "pid", "hid"), return.output = TRUE, VERBOSE = TRUE)
# getwd() == .path4read[1] == "/home/rstudio/Rproject_Rmd"  
# DataSetName = "NationalFamilyAndFertiltySurvey2021_230314"  
# i.path4read = "/home/rstudio/Rproject_Rmd"  
# !.tmp.file.found && BreathFirstSearch  
# > source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_filename.ext.find_subpath.source.r")  
# Loading: .GlobalEnv$env1$f$f_filename.ext.find_subpath
# Loading: .GlobalEnv$env1$f$f_filename.ext.find_subpath.BreathFirstSearch
# Searching: /home/rstudio/Rproject_Rmd                        	 at depth 0  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/-backup"  
# Searching: /home/rstudio/Rproject_Rmd/-backup                	 at depth 1; Queue length: 1  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/[Working Files List] Rproject_Rmd.r"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/00env1-NationalFamilyAndFertiltySurvey2021_230314.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/00env1-NationalFamilyAndFertiltySurvey2021_230314.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/00env1-Rproject_Rmd.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/00env1-Rproject_Rmd.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/00env1-Rproject_Rmd.tex"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd.tex"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd@Rocker.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd@Rocker.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd@Rocker.pdf"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd@Rocker.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd@Rocker.tex"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/01df_dirs_recursive.df_files-Rproject_Rmd@Rocker(inconsolata).pdf"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/05CodeBook-Rproject_Rmd.aux"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/05CodeBook-Rproject_Rmd.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/05CodeBook-Rproject_Rmd.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/05CodeBook-Rproject_Rmd.tex"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/05CodeBook-Rproject_Rmd.toc"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/20.2..Exposure.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/20.4..Event.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/20.5..Time2Event.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/20DataSet.Date.NA.rmAllNA.fct.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/20DataSet.Date.NA.rmAllNA.fct.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/20DataSet.Date.NA.rmAllNA.fct.tex"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/21DataSet.Date.NA.rmAllNA.fct.Table1.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/21DataSet.Date.NA.rmAllNA.fct.Table1baseline.nb.html"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/21DataSet.Date.NA.rmAllNA.fct.Table1baseline.Rmd"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/21DataSet.Date.NA.rmAllNA.fct.Table1baseline.tex"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/data"  
# Searching: /home/rstudio/Rproject_Rmd/data                   	 at depth 1; Queue length: 2  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/Debug"  
# Searching: /home/rstudio/Rproject_Rmd/Debug                  	 at depth 1; Queue length: 3  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/default.R"  
#  >  i_files_subpath == "/home/rstudio/Rproject_Rmd/default.symlink.R"  
# Error in if (file.info(i_files_subpath)$isdir) { : 
#   missing value where TRUE/FALSE needed


file.info("/home/rstudio/Rproject_Rmd/default.symlink.R" )
# > file.info("/home/rstudio/Rproject_Rmd/default.symlink.R" )
#                                              size isdir mode mtime ctime atime uid gid uname grname
# /home/rstudio/Rproject_Rmd/default.symlink.R   NA    NA <NA>  <NA>  <NA>  <NA>  NA  NA  <NA>   <NA>


  
  
# __________|------  
# @@ END-----  
