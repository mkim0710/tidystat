##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
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
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" %>% paste0("if (Sys.info()['sysname'] == 'Windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% paste0("if (Sys.info()['sysname'] == 'Windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
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
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .filename.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_base_program/001_base_file
# # Rdev/00_base_program/002_base_encoding_RegEx
# # Rdev/00_base_program/004_base_environment
# # Rdev/00_base_program/005_base_object
# # Rdev/00_base_program/007_base_expression
# # Rdev/00_base_program/009_base_computation
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/10_import_clean_datatype
# # Rdev/10_import_clean_datatype/11_literature
# # Rdev/10_import_clean_datatype/11_metadata
# # Rdev/10_import_clean_datatype/12_import_files
# # Rdev/10_import_clean_datatype/12_import_sqlite
# # Rdev/10_import_clean_datatype/12_import_vocabulary
# # Rdev/10_import_clean_datatype/13_duplicated
# # Rdev/10_import_clean_datatype/13_missing_value
# # Rdev/10_import_clean_datatype/13_split_fold
# # Rdev/10_import_clean_datatype/15_cleaning_text
# # Rdev/10_import_clean_datatype/15_cleaning_time
# # Rdev/10_import_clean_datatype/16_categorical_factor
# # Rdev/10_import_clean_datatype/16_categorical_labelled
# # Rdev/10_import_clean_datatype/17_categorical_indicators
# # Rdev/10_import_clean_datatype/18_dichotomous_logical
# # Rdev/10_import_clean_datatype/19_datetime
# # Rdev/10_import_clean_datatype/19_numeric_integer
# # Rdev/10_import_clean_datatype/array_list
# # Rdev/20_tidy_group_by_match
# # Rdev/20_tidy_group_by_match/23_group_by_PersonID
# # Rdev/20_tidy_group_by_match/25_study_population
# # Rdev/20_tidy_group_by_match/27_match
# # Rdev/30_transform_scale_categorical
# # Rdev/40_visualize_explore_bivariate_stratified
# # Rdev/40_visualize_explore_bivariate_stratified/43_network
# # Rdev/40_visualize_explore_bivariate_stratified/44_map
# # Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# # Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# # Rdev/40_visualize_explore_bivariate_stratified/49_time
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/52_model_estimation
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
# # Rdev/Rmd
# # Rdev/examples
# # Rdev/others
# # Rdev/others/Batch
# # Rdev/others/VBA
# # data
# # git
# # git/hooks
# # git/hooks/sample
# # rstudio-prefs
# # rstudio-prefs/Rocker
# # rstudio-prefs/VScode-R
# # rstudio-prefs/fonts
# # rstudio-prefs/templates
# # rstudio-prefs/themes
# # rstudio-prefs/themes/GitHub 
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
paste0("[Working Files List] ",basename(getwd()),".r") %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ RStudio Setup -----  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### \% file.edit(file.path(.path4APPDATA_RStudio, filename)) ----  
# if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### \$ rstudio-prefs.json ----  
# file.path(.path4APPDATA_RStudio, "rstudio-prefs.json") %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
filename_ext = "rstudio-prefs.json"; if (Sys.info()["sysname"] == "Windows") { file.path(Sys.getenv("APPDATA"), "RStudio", filename_ext) |> env1$env.internal.attach$f_file.edit_vscode() } else { paste0("~/.config/rstudio/",filename_ext) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext)) }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### @ sumatraPDF settings ----  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### \% f_file_PDF.sumatra ====  
# https://github.com/rstudio/rstudio/issues/14370
# https://stackoverflow.com/questions/77447391/how-to-set-sumatra-as-default-pdf-viewer-in-rstudio
# https://github.com/brry/berryFunctions/blob/master/R/sumatraInitialize.R
# https://github.com/brry/berryFunctions/blob/master/R/openPDF.R
# https://github.com/brry/berryFunctions/blob/master/R/pdfpng.R
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/sumatrapdfrestrict.ini
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/SumatraPDF-settings.txt
paste0(env1$path$source_base,"/","f_file_PDF.sumatra.dev.r") %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# paste0(env1$path$source_base,"/","f_file_PDF.sumatra.source.r") %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
"D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ RStudio Server Setup.r -----  
"RStudio Server Setup.r" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
### id_rsa, id_ed25519 -----  
"~/.ssh/id_rsa.pub" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
"~/.ssh/id_rsa" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
"~/.ssh/id_ed25519.pub" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
"~/.ssh/id_ed25519" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### @ Rocker set up.r -----  
"-private/docker run -d -p --restart=always --name -e -v -private.sh" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
"Rocker set up.r" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# "Rocker set up -private.r" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ git -----  
.subpath="git"; .filename.r = "ssh-add@Rocker.r"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.subpath="git"; .filename.r = "git config --global core.autocrlf input.r"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### \$ .gitignore -----  
# ".gitignore" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# ".gitignore" |> env1$env.internal.attach$f_file.edit_vscode()
.file2edit = ".gitignore" ; if (Sys.info()["sysname"] == "Windows") { .file2edit |> env1$env.internal.attach$f_file.edit_vscode() } else { if(file.exists(.file2edit)) {.file2edit %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))} }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#### \% f_path_path.BACKUP.overwrite -----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_path_filename_ext = paste0(.overwrite_from_path, "/.gitignore")
if (getwd() |> normalizePath(winslash="/",mustWork=NA) == .overwrite_from_path) {
    for (.destination_path in unique(c(
        env1$path$path0
        , "~" |> normalizePath(winslash="/",mustWork=NA)
        , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/",mustWork=NA)
        , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
        , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
        , "../Rproject_MH"
        , "../Rproject_Rmd"
        , "../Rproject_KoGES_AA10030"
    ))) {
        .destination_path_filename_ext = paste0(.destination_path,"/.gitignore") 
        env1$env.internal.attach$f_path_path.BACKUP.overwrite(.overwrite_from_path_filename_ext=.overwrite_from_path_filename_ext, .destination_path_filename_ext=.destination_path_filename_ext, .BACKUP_to_path = paste0(env1$path$path0,"/-BACKUP"), timeFormat = "%y%m%d")
    }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### @ install-git-hooks.sh ----  
# To ignore csv files > 10 MB
# "chmod +x git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
# "./git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
"cp git/hooks/pre-commit .git/hooks/pre-commit" |> system(intern = TRUE)
"chmod +x .git/hooks/pre-commit" |> system(intern = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.subpath="git"; .filename.r = "git automatic commit.r"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.subpath="git"; .filename.r = "git stash.r"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.subpath="git"; .filename.r = "git merge conflicts.r"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.subpath="git"; .filename.r = "f_git.03_final.pull_rebase_push" |> paste0(c(".source.r",".dev.r")); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### @ git filter-repo --path-glob .pdf --invert-paths.sh ----  
.subpath="git"; .filename.r = "git filter-repo --path-glob .pdf --invert-paths.r"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.subpath="git"; .filename.r = "git filter-repo --path-glob .pdf --invert-paths.sh"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  
# __________|------  
# @@ START) Default Templates -----  

### @ sourceTemplate.path_filename_ext -----  
# env1$path$sourceTemplate.path_filename_ext = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); env1$path$sourceTemplate.path_filename_ext |> source(local=FALSE, echo=TRUE, print.eval=TRUE, spaced=FALSE, verbose=FALSE, max.deparse.length=150, width.cutoff=500L, chdir=TRUE, prompt.echo="> ", continue.echo="+ ", skip.echo=Inf)
# # if (Sys.info()["sysname"] == "Windows") {paste0("notepad.exe"," ",shQuote(env1$path$sourceTemplate.path_filename_ext)) |> shell(wait=FALSE)}
# if (Sys.info()["sysname"] == "Windows") {.path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/",mustWork=NA); paste0('cmd /c ""',.path4editor, '" "',env1$path$sourceTemplate.path_filename_ext, '""') |> shell(wait=FALSE)}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

#### @ default.R -----  
# .file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); if (Sys.info()["sysname"] == "Windows") {.file2edit |> shQuote(type="cmd") |> shell.exec()} else {.file2edit %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))}
.file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); if (Sys.info()["sysname"] == "Windows") {.file2edit |> env1$env.internal.attach$f_file.edit_vscode()} else {.file2edit %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))}
.subpath="rstudio-prefs/templates"; .filename.r = "default.R"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

#### @ templates-00env1.minimum.Rmd -----  
# .file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/templates-00env1.minimum.Rmd"); if (Sys.info()["sysname"] == "Windows") {.file2edit |> env1$env.internal.attach$f_file.edit_vscode()} else {.file2edit %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))}
# .subpath="rstudio-prefs/templates"; .filename.r = "templates-00env1.minimum.Rmd"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.file2edit = "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd"; if (Sys.info()["sysname"] == "Windows") {.file2edit |> env1$env.internal.attach$f_file.edit_vscode()} else {.file2edit %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))}
# "templates-00env1.minimum.Rmd" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.subpath="rstudio-prefs/templates"; .filename.r = "templates-00env1.minimum.Rmd"; .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ env1$env.internal -----  
.filename.r = "env1$env.internal" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# .filename.r = "function.detachAllPackages" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.filename.r = "function.detachAllPackages.dev.r"; .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.filename.r = "Encoding.txt"; .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.filename.r = "options.r"; .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.filename.r = "function.update.Rprofile.dev.r"; .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
.filename.r = "function.Sys.setenv.dev.r"; .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.filename.r = "f_clipboard_path_BackSlash.to_URL.dev.r"; .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

### \% f_path -----  
#### \% internal.f_path0.list_path_hierarchy -----  
.filename.r = "internal.f_path0.list_path_hierarchy" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#### \% f_path.list_subpath -----  
.filename.r = "f_path.list_subpath" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#### \% f_path.df_dirs_recursive.df_files -----  
.filename.r = "f_path.df_dirs_recursive.df_files" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% f_file -----  
#### \% f_filename_ext.find_subpath -----  
.filename.r = "f_filename_ext.find_subpath" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#### \% f_path.size_files -----  
.filename.r = "f_path.size_files" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

### \% f_df -----  
#### \% f_df.t.tribble_construct -----  
.filename.r = "f_df.t.tribble_construct" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#### \% f_DataSetName.Search.read.checkEntity -----  
.filename.r = "f_DataSetName.Search.read.checkEntity" |> paste0(c(".source.r",".dev.r")); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ .subpath = r"(Rdev/00_base_program)" |> str_replace_all("\\\\","/") -----  
#### \% f_df.NotNA_p_df -----  
.subpath = r"(00_base_program)"; .filename.r = "f_df.NotNA_p_df" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ .subpath = r"(Rdev/10_import_clean_datatype/13_missing_value)" |> str_replace_all("\\\\","/") -----  
#### \% f_CodeText.ECHO -----  
.subpath = r"(Rdev/10_import_clean_datatype/13_missing_value)"; .filename.r = "f_CodeText.ECHO" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ .subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/") -----  
#### \% f_df.Table1byExposure.xlsx -----  
.subpath = r"(Rdev/60_communicate_report_export)"; .filename.r = "f_df.Table1byExposure.xlsx" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
"Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.Rmd" %>% file.edit
#### \% f_Table1_print_df.flextable  -----  
.subpath = r"(Rdev/60_communicate_report_export)"; .filename.r = "f_Table1_print_df.flextable" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
###### @ "" %>% {.[file.exists(.)]} |> file.edit()  #----  
"Rdev/10_import_clean_datatype/11_literature/f_query.entrez_search.summary.fetch.dev.r" |> file.edit()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
###### @ "" %>% {.[file.exists(.)]} |> file.edit()  #----  

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
###### @ "" %>% {.[file.exists(.)]} |> file.edit()  #----  











##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ 2024-12-19 -----
# ~/github_tidystat/Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_filename_ext_extended.dev.Rmd
# 
# ~/github_tidystat/Rdev/60_communicate_report_export/f_Table1_print_df.flextable.source.r
# ~/github_tidystat/Rdev/60_communicate_report_export/f_Table1_print_df.flextable.dev.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.r
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.Rmd
# 
# ~/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source-dev.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.glmnet.GT1.flextable.dev-GPT-pending.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.glmnet.GT1.flextable.dev-Gemini-pending.Rmd
# ~/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# ~/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/trainset.cv.glmnet_alphas_cox.dev.Rmd
# ~/github_tidystat/DataSet.Date.NA.rmAllNA.lbl.fct.select_.n_.recode.dev.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.GT1.flextable.dev.Rmd
# ~/github_tidystat/git/f_gitattributes.update_non_lfs.dev.Rmd
# 
# 
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.list.files_orphan_nb_html.remove.dev.Rmd
# 



# D:/D_Repositories/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/49_time/plotCumulativeVisitsOverTime.dev.Rmd
# D:/D_Repositories/github_tidystat/.gitignore & .git_hooks_pre-commit & .Rprofile -update.r
# D:/D_Repositories/github_tidystat/f_path.df_dirs_recursive.df_files.source.r
# D:/D_Repositories/github_tidystat/Rdev/10_import_clean_datatype/11_metadata/f_chrNameValuePairs2vector.dev.Rmd
# D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# D:/D_Repositories/github_tidystat/Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
# D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd
# D:/D_Repositories/github_tidystat/Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_filename_ext_extended.dev.Rmd


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ 2024-12-20 -----
# ~/github_tidystat/[Working Files List] github_tidystat.r
# ~/github_tidystat/[Pending Files List] github_tidystat.r
# ~/github_tidystat/.Rprofile
# ~/github_tidystat/env1$env.internal.source.r
# ~/github_tidystat/f_df.t.tribble_construct.source.r
# ~/github_tidystat/.gitattributes
# ~/github_tidystat/git/f_gitattributes.update_non_lfs.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ 2024-12-23 -----
# ~/github_tidystat/git/f_gitattributes.update_non_lfs.dev.Rmd
# ~/github_tidystat/.gitattributes
# ~/github_tidystat/.lfs.gitattributes
# ~/github_tidystat/.non_lfs.gitattributes
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/009_base_computation/f_vec_chr.add_line_numbers.dev.r



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) basename(getwd()) ----  
list.files(pattern = ".Rmd$") |> shQuote(type="cmd") |> paste0(collapse=",\n  ") %>% {cat("c(",.,")", "  \n", sep="")}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# .filename.r = paste0("00env1","-", basename(getwd()),".Rmd"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); subpath_filename.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat("  \n", sep=""); subpath_filename.r %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# .filename.r = paste0("01df_dirs_recursive.df_files","-", basename(getwd()),".Rmd"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); subpath_filename.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat("  \n", sep=""); subpath_filename.r %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# .filename.r = paste0("05CodeBook","-", basename(getwd()),".Rmd"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.r); subpath_filename.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat("  \n", sep=""); subpath_filename.r %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
