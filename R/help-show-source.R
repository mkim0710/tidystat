
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
## :: MH_shortcuts =  ----  
.tmp$objectname = "MH_shortcuts"
.tmp$object = function(show_hotkeys = TRUE, show_cmd_code = TRUE) {
    if(show_hotkeys) {
      cat("## Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
## Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
## Ctrl+Alt+Shift+Left/Right: First/Last tab
## Ctrl+Alt+D: Show diff between current and last commit
## Ctrl+Alt+M: Commit changes to Git
## Ctrl+Shift+O: Show/Hide Document Outline
## Alt+Shift+Drag: Multiline Cursor
## Ctrl+Shift+F10: Restart R Session 
## Ctrl+Alt+B: Run from start to current line 
## Shift+F9: Toggle Breakpoint "); cat("\n")
    }
    if(show_cmd_code) {
      "cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" |> cat("\n")
      "cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd " |> cat("\n")
      "cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile " |> cat("\n")
    }
    invisible()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) showShortcuts  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "showShortcuts")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: openWorkingFilesList =  ----  
.tmp$objectname = "openWorkingFilesList"
.tmp$object = function() {
    paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: showSymbolPaths =  ----  
.tmp$objectname = "showSymbolPaths"
.tmp$object = function() {
    tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n")
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) showPathSymbols  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "showPathSymbols")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: showProjectPathFiles =  ----  
.tmp$objectname = "showProjectPathFiles"
.tmp$object = function() {
    if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: showProjectPathsRecursively =  ----  
.tmp$objectname = "showProjectPathsRecursively"
.tmp$object = function(assign_to_env1_path = TRUE, printProjectPaths.relativePaths = FALSE, printProjectPaths.indented = TRUE) {
    .FileName.source.r = "f_path.df_dirs_recursive.df_files" |> paste0("-source.R"); .RelativeSubPath=r"(R)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})

    if(assign_to_env1_path)  env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)

    if(printProjectPaths.relativePaths)  env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")

    if(printProjectPaths.indented)  env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")

    invisible(env1$path$df_dirs_recursive.df_files)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: showProjectPathsAtTidyStat =  ----  
.tmp$objectname = "showProjectPathsAtTidyStat"
.tmp$object = function(assign_to_env1_path = TRUE, printProjectPaths.relativePaths = FALSE, printProjectPaths.indented = TRUE) {
    cat("-BACKUP
-info
-private-old
-private-old/-backup
-private-old/-backup/-backup
-void
ProjectDocuments
R
Rdev
Rdev/-BACKUP
Rdev/-dev
Rdev/00_base_program
Rdev/00_base_program/-void
Rdev/00_base_program/001_base_file
Rdev/00_base_program/001_base_file/-backup
Rdev/00_base_program/001_base_file/-backup/-backup
Rdev/00_base_program/002_base_encoding_RegEx
Rdev/00_base_program/002_base_encoding_RegEx/-BACKUP
Rdev/00_base_program/004_base_environment
Rdev/00_base_program/004_base_environment/-backup
Rdev/00_base_program/004_base_environment/-backup/-backup
Rdev/00_base_program/005_base_object
Rdev/00_base_program/007_base_expression
Rdev/00_base_program/009_base_computation
Rdev/00_protocol
Rdev/00_protocol/01_sample_size
Rdev/00_protocol/05_count_eligible
Rdev/00_protocol/06_count_exposure
Rdev/00_protocol/07_count_outcome
Rdev/10_import_clean_datatype
Rdev/10_import_clean_datatype/11_literature
Rdev/10_import_clean_datatype/11_metadata
Rdev/10_import_clean_datatype/12_import_files
Rdev/10_import_clean_datatype/12_import_sqlite
Rdev/10_import_clean_datatype/12_import_vocabulary
Rdev/10_import_clean_datatype/13_duplicated
Rdev/10_import_clean_datatype/13_missing_value
Rdev/10_import_clean_datatype/13_split_fold
Rdev/10_import_clean_datatype/15_cleaning_text
Rdev/10_import_clean_datatype/15_cleaning_time
Rdev/10_import_clean_datatype/16_categorical_factor
Rdev/10_import_clean_datatype/16_categorical_labelled
Rdev/10_import_clean_datatype/17_categorical_indicators
Rdev/10_import_clean_datatype/18_dichotomous_logical
Rdev/10_import_clean_datatype/19_datetime
Rdev/10_import_clean_datatype/19_numeric_integer
Rdev/10_import_clean_datatype/array_list
Rdev/20_tidy_group_by_match
Rdev/20_tidy_group_by_match/23_group_by_PersonID
Rdev/20_tidy_group_by_match/25_study_population
Rdev/20_tidy_group_by_match/27_match
Rdev/30_transform_scale_categorical
Rdev/40_visualize_explore_bivariate_stratified
Rdev/40_visualize_explore_bivariate_stratified/43_network
Rdev/40_visualize_explore_bivariate_stratified/44_map
Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
Rdev/40_visualize_explore_bivariate_stratified/49_time
Rdev/40_visualize_explore_bivariate_stratified/49_time/-backup
Rdev/40_visualize_explore_bivariate_stratified/49_time/-backup/-backup
Rdev/40_visualize_explore_bivariate_stratified/49_time/plotCumulativeVisitsOverTime.dev_files
Rdev/40_visualize_explore_bivariate_stratified/49_time/plotCumulativeVisitsOverTime.dev_files/figure-latex
Rdev/50_model_formula_evaluation
Rdev/50_model_formula_evaluation/51_model_formula
Rdev/50_model_formula_evaluation/52_model_estimation
Rdev/50_model_formula_evaluation/53_model_selection
Rdev/50_model_formula_evaluation/53_model_selection/-backup
Rdev/50_model_formula_evaluation/53_model_selection/-backup/-backup
Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev_files
Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev_files/figure-latex
Rdev/50_model_formula_evaluation/53_model_selection/glmnet_outputs
Rdev/50_model_formula_evaluation/55_model_weighted
Rdev/50_model_formula_evaluation/56_model_bootstrap
Rdev/50_model_formula_evaluation/57_model_time2event
Rdev/50_model_formula_evaluation/57_model_trajectory
Rdev/50_model_formula_evaluation/59_model_evaluation
Rdev/60_communicate_report_export
Rdev/60_communicate_report_export/-backup
Rdev/60_communicate_report_export/-backup/-backup
Rdev/Rmd
Rdev/examples
Rdev/others
Rdev/others/Bash
Rdev/others/Batch
Rdev/others/C
Rdev/others/Excel
Rdev/others/ODBC
Rdev/others/SAS
Rdev/others/Stata
Rdev/others/VBA
Rdev/tests
Rdev/vignettes
data
data/ATC_RxNorm_NDC
data/Rplot
git
git/hooks
git/hooks/sample
rstudio-prefs
rstudio-prefs/Rocker
rstudio-prefs/VScode-R
rstudio-prefs/fonts
rstudio-prefs/templates
rstudio-prefs/templates/-backup
rstudio-prefs/themes
rstudio-prefs/themes/Candidates
rstudio-prefs/themes/Candidates/Final
rstudio-prefs/themes/GitHub
rstudio-prefs/themes/RStudio Built-in"); cat("\n")

    invisible()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: showCodeText2open.FileName.source.r =  ----  
.tmp$objectname = "showCodeText2open.FileName.source.r"
.tmp$object = function(.RelativeSubPath = "", .FileName.source.r, .SourceName_root = NULL, assign_to_env1_path = TRUE) {
    if(!exists(".SourceName_root") && exists(".FileName.source.r")) .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
    .FileName.source.r = .SourceName_root |> paste0(".source.r")

    if(assign_to_env1_path) {
        env1$path$.RelativeSubPath = .RelativeSubPath
        env1$path$.SourceName_root = .SourceName_root
        env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
        env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
        env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".source.r")
    }
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
    invisible()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: showCodeText2openSourceInGitHub =  ----  
.tmp$objectname = "showCodeText2openSourceInGitHub"
.tmp$object = function() {
    # paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)

    paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")

    # paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
    
    paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")

    invisible()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: showCodeText2revert2LastCommit =  ----  
.tmp$objectname = "showCodeText2revert2LastCommit"
.tmp$object = function() {
    cat("* To revert to the last commited file, run the following terminal command:  \n")

    # paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    paste0( "git checkout -- ",shQuote(env1$path$LastSourceEditorContext.path_FileNameExt) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    if(tolower(tools::file_ext(env1$path$LastSourceEditorContext.path_FileNameExt)) == "rmd") {
        paste0( "git checkout -- ",shQuote(env1$path$LastSourceEditorContext.path_FileName.nb.html) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    }

    invisible()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: showCodeText2restartSession.pending =  ----  
.tmp$objectname = "showCodeText2restartSession.pending"
.tmp$object = function() {
    CodeText = '# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r'
    CodeText %>% cat("\n")
    invisible(CodeText)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  



