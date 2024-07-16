#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllcommaPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### env1\$env.internal ====
sourcename = "env1$env.internal" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env1\$info\$get_system_info() ====
# sourcename = "get_system_info" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# env1$info$info_system_info = env1$info$get_system_info()
# env1$info$info_system_info |> utils::str()
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env1\$f_df.t.tribble_construct() ====
# sourcename = "f_df.t.tribble_construct" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----
# sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("\n")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("\n")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/00_protocol/05_count_eligible
# # Rdev/00_protocol/06_count_exposure
# # Rdev/00_protocol/07_count_outcome
# # Rdev/10_import_clean_datatype
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
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
paste0("[Working Files List] ",basename(getwd()),".r") %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ RStudio Setup -----
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### \% file.edit(file.path(path4APPDATA_RStudio, filename)) ----
# if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = "~/.config/rstudio"}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### $ rstudio-prefs.json ----
# file.path(path4APPDATA_RStudio, "rstudio-prefs.json") %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
filename.ext = "rstudio-prefs.json"; if (.Platform$OS.type == "windows") { file.path(Sys.getenv("APPDATA"), "RStudio", filename.ext) |> env1$env.internal$f_file.edit_vscode() } else { paste0("~/.config/rstudio/",filename.ext) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext) }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### @ sumatraPDF settings ----
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### \% f_file_PDF.sumatra ====
# https://github.com/rstudio/rstudio/issues/14370
# https://stackoverflow.com/questions/77447391/how-to-set-sumatra-as-default-pdf-viewer-in-rstudio
# https://github.com/brry/berryFunctions/blob/master/R/sumatraInitialize.R
# https://github.com/brry/berryFunctions/blob/master/R/openPDF.R
# https://github.com/brry/berryFunctions/blob/master/R/pdfpng.R
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/sumatrapdfrestrict.ini
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/SumatraPDF-settings.txt
paste0(env1$path$source_base,"/","f_file_PDF.sumatra.dev.r") %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# paste0(env1$path$source_base,"/","f_file_PDF.sumatra.source.r") %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
"D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ RStudio Server Setup.r -----
"RStudio Server Setup.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
### id_rsa, id_ed25519 -----
"~/.ssh/id_rsa.pub" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
"~/.ssh/id_rsa" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
"~/.ssh/id_ed25519.pub" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
"~/.ssh/id_ed25519" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
###@ Rocker set up.r -----
"-private/docker run -d -p --restart=always --name -e -v -private.sh" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
"Rocker set up.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# "Rocker set up -private.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ git -----
subpath="git"; filename.r = "ssh-add@Rocker.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
subpath="git"; filename.r = "git config --global core.autocrlf input.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### $ .gitignore -----
# ".gitignore" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# ".gitignore" |> env1$env.internal$f_file.edit_vscode()
file2edit = ".gitignore" ; if (.Platform$OS.type == "windows") { file2edit |> env1$env.internal$f_file.edit_vscode() } else { if(file.exists(file2edit)) {file2edit %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)} }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#
#### \% f_path_path.backup.overwrite -----
overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
overwrite_from_path.filename.ext = paste0(overwrite_from_path, "/.gitignore")
if (getwd() |> normalizePath(winslash="/") == overwrite_from_path) {
    for (destination_path in unique(c(
        env1$path$path0
        , "~" |> normalizePath(winslash="/")
        , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/")
        , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/")
        , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/")
        , "../Rproject_MH"
        , "../Rproject_Rmd"
        , "../Rproject_KoGES_AA10030"
    ))) {
        destination_path.filename.ext = paste0(destination_path,"/.gitignore") ; 
        env1$env.internal$f_path_path.backup.overwrite(overwrite_from_path.filename.ext=overwrite_from_path.filename.ext, destination_path.filename.ext=destination_path.filename.ext, backup_to_path = paste0(env1$path$path0,"/-backup"), timeFormat = "%y%m%d")
    }
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### @ install-git-hooks.sh ----
# To ignore csv files > 10 MB
# "chmod +x git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
# "./git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
"cp git/hooks/pre-commit .git/hooks/pre-commit" |> system(intern = TRUE)
"chmod +x .git/hooks/pre-commit" |> system(intern = TRUE)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
subpath="git"; filename.r = "git automatic commit.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
subpath="git"; filename.r = "git stash.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
subpath="git"; filename.r = "git merge conflicts.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
subpath="git"; filename.r = "f_git.03_final.pull_rebase_push" |> paste0(c(".source.r",".dev.r")); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### @ git filter-repo --path-glob .pdf --invert-paths.sh ----
subpath="git"; filename.r = "git filter-repo --path-glob .pdf --invert-paths.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
subpath="git"; filename.r = "git filter-repo --path-glob .pdf --invert-paths.sh"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) Default Templates -----
### @ sourceTemplate.path.filename.ext -----
# env1$path$sourceTemplate.path.filename.ext = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); env1$path$sourceTemplate.path.filename.ext |> source(local=FALSE, echo=TRUE, print.eval=TRUE, spaced=FALSE, verbose=FALSE, max.deparse.length=150, width.cutoff=500L, chdir=TRUE, prompt.echo="> ", continue.echo="+ ", skip.echo=Inf)
# # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(env1$path$sourceTemplate.path.filename.ext)) )}
# if (.Platform$OS.type == "windows") {path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/"); shell( paste0('cmd /c ""',path4editor, '" "',env1$path$sourceTemplate.path.filename.ext, '""')  )}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### @ default.R -----
# file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); if (.Platform$OS.type == "windows") {file2edit |> shQuote(type="cmd") |> shell.exec()} else {file2edit %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)}
file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); if (.Platform$OS.type == "windows") {file2edit |> env1$env.internal$f_file.edit_vscode()} else {file2edit %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)}
subpath="rstudio-prefs/templates"; filename.r = "default.R"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### @ templates-00env1.minimum.Rmd -----
# file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/templates-00env1.minimum.Rmd"); if (.Platform$OS.type == "windows") {file2edit |> env1$env.internal$f_file.edit_vscode()} else {file2edit %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)}
# subpath="rstudio-prefs/templates"; filename.r = "templates-00env1.minimum.Rmd"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
file2edit = "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd"; if (.Platform$OS.type == "windows") {file2edit |> env1$env.internal$f_file.edit_vscode()} else {file2edit %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)}
"templates-00env1.minimum.Rmd" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ env1$env.internal -----
filename.r = "env1$env.internal" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# filename.r = "function.detachAllPackages" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
filename.r = "function.detachAllPackages.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
filename.r = "Encoding.txt"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
filename.r = "options.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
filename.r = "function.update.Rprofile.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
filename.r = "function.Sys.setenv.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
filename.r = "f_clipboard_path_BackSlash.to_URL.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \% f_path -----
#### \% internal.f_path0.list_path_hierarchy -----
filename.r = "internal.f_path0.list_path_hierarchy" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#### \% f_path.list_subpath -----
filename.r = "f_path.list_subpath" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#### \% f_path.df_dirs_recursive.df_files -----
filename.r = "f_path.df_dirs_recursive.df_files" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \% f_file -----
#### \% f_filename.ext.find_subpath -----
filename.r = "f_filename.ext.find_subpath" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#### \% f_path.size_files -----
filename.r = "f_path.size_files" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \% f_df -----
#### \% f_df.t.tribble_construct -----
filename.r = "f_df.t.tribble_construct" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#### \% f_objectname.read.checkEntity -----
filename.r = "f_objectname.read.checkEntity" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ subpath = r"(Rdev/10_import_clean_datatype/13_missing_value)" |> str_replace_all("\\\\","/") -----
#### \% data.NotNA_p_df -----
subpath = r"(Rdev/10_import_clean_datatype/13_missing_value)"; filename.r = "data.NotNA_p_df" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/") -----
#### \% data.CreateTableOne -----
subpath = r"(Rdev/60_communicate_report_export)"; filename.r = "data.CreateTableOne" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  











#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) basename(getwd()) ----
list.files(pattern = "Rmd$") |> shQuote(type="cmd") |> paste0(collapse=",\n  ") %>% {paste0("c(", ., ")")} |> cat("\n")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# filename.r = paste0("00env1","-", basename(getwd()),".Rmd"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); subpath.filename.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat(); subpath.filename.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# filename.r = paste0("01df_dirs_recursive.df_files","-", basename(getwd()),".Rmd"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); subpath.filename.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat(); subpath.filename.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# filename.r = paste0("10CodeBook","-", basename(getwd()),".Rmd"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); subpath.filename.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat(); subpath.filename.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
