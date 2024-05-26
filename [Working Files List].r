#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# "[Working Files List].r" |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote() |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env.custom.minimum.Rmd" |> shQuote() |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllcommaPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env.custom\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); env.custom$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env.custom$path[[objectname]] = object;
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### env.custom\$env.internal ====
sourcename = "env.custom$env.internal"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env.custom\$info\$get_system_info() ====
# sourcename = "get_system_info"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
# env.custom$info$info_system_info = env.custom$info$get_system_info()
# env.custom$info$info_system_info |> str()
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env.custom\$f_df.t.tribble_construct() ====
# sourcename = "f_df.t.tribble_construct"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# #### env.custom\$env.internal\$f_path.df_dirs_recursive.df_files() ----
# sourcename = "f_path.df_dirs_recursive.df_files"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
# env.custom$path$df_dirs_recursive.df_files = env.custom$env.internal$f_path.df_dirs_recursive.df_files(input_path=env.custom$path$path1, print.message=FALSE)
# env.custom$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat()
# env.custom$path$df_dirs_recursive.df_files |> filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat()
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
env.custom$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
file.edit("[Working Files List].r"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ RStudio Setup -----
file.edit(".gitignore"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
### \% file.edit(file.path(path4APPDATA_RStudio, filename)) ----
if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = "~/.config/rstudio"}
#### $ rstudio-prefs.json ----
file.edit(file.path(path4APPDATA_RStudio, "rstudio-prefs.json")); file.edit(env.custom$path$CurrentSource.path.filename.ext)

#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ RStudio Server Setup.r -----
file.edit("RStudio Server Setup.r"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
### id_rsa, id_ed25519 -----
file2edit = "~/.ssh/id_rsa.pub"; if(file.exists(file2edit)) {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
file2edit = "~/.ssh/id_rsa"; if(file.exists(file2edit)) {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
file2edit = "~/.ssh/id_ed25519.pub"; if(file.exists(file2edit)) {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
file2edit = "~/.ssh/id_ed25519"; if(file.exists(file2edit)) {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
###@ Rocker set up.r -----
file.edit("-private/docker run -d -p --restart=always --name -e -v -private.sh"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
file.edit("Rocker set up.r"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
# file.edit("Rocker set up -private.r"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ git -----
subpath="git"; filename = "ssh-add@Rocker.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
subpath="git"; filename = "git config --global core.autocrlf input.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)c
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### \% .gitignore -----
file.edit(".gitignore"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
overwrite_from_path.filename.ext = paste0(overwrite_from_path, "/.gitignore")
if (getwd() |> normalizePath(winslash="/") == overwrite_from_path) {
    for (destination_path in c(
        env.custom$path$path0
        , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/")
        , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/")
        , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/")
        , "../Rproject_MH"
        , "../Rproject_Rmd"
        , "../Rproject_KoGES_AA10030"
    )) {
        destination_path.filename.ext = paste0(destination_path,"/.gitignore") ; 
        env.custom$env.internal$f_path_path.backup.overwrite(overwrite_from_path.filename.ext=overwrite_from_path.filename.ext, destination_path.filename.ext=destination_path.filename.ext, backup_to_path = dirname(destination_path.filename.ext), timeFormat = "%y%m%d")
    }
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
subpath="git"; filename = "git automatic commit.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
subpath="git"; filename = "git stash.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
subpath="git"; filename = "git merge confilcts.r"; subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
subpath="git"; filename = "f_git.03_final.pull_rebase_push" |> paste0(c(".source.r",".dev.r")); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ Default Templates -----
### \% sourceTemplate.path.filename.ext -----
# env.custom$path$sourceTemplate.path.filename.ext = paste0(env.custom$path$source_base,"/","rstudio-prefs/templates/default.R"); env.custom$path$sourceTemplate.path.filename.ext |> source(local=FALSE, echo=TRUE, print.eval=TRUE, spaced=FALSE, verbose=FALSE, max.deparse.length=150, width.cutoff=500L, chdir=TRUE, prompt.echo="> ", continue.echo="+ ", skip.echo=Inf)
# # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(env.custom$path$sourceTemplate.path.filename.ext)) )}
# if (.Platform$OS.type == "windows") {path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/"); shell( paste0('cmd /c ""',path4editor, '" "',env.custom$path$sourceTemplate.path.filename.ext, '""')  )}
#### \% default.R -----
# file2edit = paste0(env.custom$path$source_base,"/","rstudio-prefs/templates/default.R"); if (.Platform$OS.type == "windows") {shell.exec(shQuote(file2edit))} else {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
file2edit = paste0(env.custom$path$source_base,"/","rstudio-prefs/templates/default.R"); if (.Platform$OS.type == "windows") {shell.exec(shQuote(file2edit))} else {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
#### \% templates-00env.custom.minimum.Rmd -----
# file2edit = paste0(env.custom$path$source_base,"/","rstudio-prefs/templates/templates-00env.custom.minimum.Rmd"); if (.Platform$OS.type == "windows") {shell.exec(shQuote(file2edit))} else {file.edit(file2edit); file.edit(env.custom$path$CurrentSource.path.filename.ext)}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ env.custom$env.internal -----
filename = "env.custom$env.internal" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# filename = "function.detachAllPackages" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
filename = "function.detachAllPackages.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
filename = "Encoding.txt"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
filename = "options.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
filename = "function.update.Rprofile.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
filename = "function.Sys.setenv.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
filename = "f_clipboard_path_BackSlash.to_URL.dev.r"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \% f_path -----
#### \% internal.f_path0.list_path_hierarchy -----
filename = "internal.f_path0.list_path_hierarchy" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#### \% f_path.list_subpath -----
filename = "f_path.list_subpath" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#### \% f_path.df_dirs_recursive.df_files -----
filename = "f_path.df_dirs_recursive.df_files" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \% f_file -----
#### \% f_filename.ext.find_subpath -----
filename = "f_filename.ext.find_subpath" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#### \% f_path.size_files -----
filename = "f_path.size_files" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \% f_df -----
#### \% f_df.t.tribble_construct -----
filename = "f_df.t.tribble_construct" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#### \% f_objectname.read.checkEntity -----
filename = "f_objectname.read.checkEntity" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ subpath = r"(Rdev/10_import_clean_datatype/13_missing_value)" |> str_replace_all("\\\\","/") -----
### \% data.NotNA_p_df -----
subpath = r"(Rdev/60_communicate_report_export)"; filename = "data.NotNA_p_df" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/") -----
### \% data.CreateTableOne -----
subpath = r"(Rdev/60_communicate_report_export)"; filename = "data.CreateTableOne" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(env.custom$path$source_base,subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  











#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ basename(getwd()) ----
# filename = paste0("00env.custom","-", basename(getwd()),".Rmd"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
# filename = paste0("01df_dirs_recursive.df_files","-", basename(getwd()),".Rmd"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
# filename = paste0("10CodeBook","-", basename(getwd()),".Rmd"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename); file.edit( file.path(subpath.filename.r) ); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
