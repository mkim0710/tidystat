# sourcename = "default.template"
# default.template.dev.r
# default.template.source.r
#         https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.template.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/templates/default.template.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# source("function.detachAllPackages.source.r"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
## env.custom\$env.internal ====
sourcename = "env.custom$env.internal"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#### env.custom\$f_df.t.tribble_construct() ====
sourcename = "f_df.t.tribble_construct"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#### env.custom\$info\$get_system_info() ====
sourcename = "get_system_info"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
env.custom$info$info_system_info = env.custom$info$get_system_info()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### env.custom\$f_path.df_dirs_recursive.df_files() ----
sourcename = "f_path.df_dirs_recursive.df_files"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
env.custom$path$df_dirs_recursive.df_files = env.custom$f_path.df_dirs_recursive.df_files(input_path=env.custom$path$path1, print.message=FALSE)
env.custom$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat()
env.custom$path$df_dirs_recursive.df_files |> filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat()
# Rdev
# Rdev/-dev
# Rdev/00_base_program
# Rdev/00_protocol
# Rdev/00_protocol/01_sample_size
# Rdev/00_protocol/05_count_eligible
# Rdev/00_protocol/06_count_exposure
# Rdev/00_protocol/07_count_outcome
# Rdev/10_import_clean_datatype
# Rdev/10_import_clean_datatype/11_metadata
# Rdev/10_import_clean_datatype/12_import_files
# Rdev/10_import_clean_datatype/12_import_sqlite
# Rdev/10_import_clean_datatype/12_import_vocabulary
# Rdev/10_import_clean_datatype/13_duplicated
# Rdev/10_import_clean_datatype/13_missing_value
# Rdev/10_import_clean_datatype/13_split_fold
# Rdev/10_import_clean_datatype/15_cleaning_text
# Rdev/10_import_clean_datatype/15_cleaning_time
# Rdev/10_import_clean_datatype/16_categorical_factor
# Rdev/10_import_clean_datatype/17_categorical_indicators
# Rdev/10_import_clean_datatype/18_dichotomous_logical
# Rdev/10_import_clean_datatype/19_datetime
# Rdev/10_import_clean_datatype/19_numeric_integer
# Rdev/10_import_clean_datatype/array_list
# Rdev/20_tidy_group_by_match
# Rdev/20_tidy_group_by_match/23_group_by_PersonID
# Rdev/20_tidy_group_by_match/25_study_population
# Rdev/20_tidy_group_by_match/27_match
# Rdev/30_transform_scale_categorical
# Rdev/40_visualize_explore_bivariate_stratified
# Rdev/40_visualize_explore_bivariate_stratified/43_network
# Rdev/40_visualize_explore_bivariate_stratified/44_map
# Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# Rdev/50_model_formula_evaluation
# Rdev/50_model_formula_evaluation/51_model_formula
# Rdev/50_model_formula_evaluation/53_model_selection
# Rdev/50_model_formula_evaluation/55_model_weighted
# Rdev/50_model_formula_evaluation/56_model_bootstrap
# Rdev/50_model_formula_evaluation/57_model_time2event
# Rdev/50_model_formula_evaluation/57_model_trajectory
# Rdev/50_model_formula_evaluation/59_model_evaluation
# Rdev/60_communicate_report_export
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"(rstudio-prefs\templates)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# utils::browseURL(subpath)
sourcename = "default.template"
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
    '# source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    sep="")
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base, "rstudio-prefs", "templates", "default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$current.path.filename.ext);
    if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base, "rstudio-prefs", "templates", "templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$current.path.filename.ext);
    if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base, "rstudio-prefs", "templates", "default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$current.path.filename.ext);
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
















#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ update default.R -----
env.custom$path$default.filename.ext = "default.R"
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path; 

if(env.custom$path$default.filename.ext == basename(env.custom$path$current.path.filename.ext)) {
    if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio") |> str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = "~/.config/rstudio"} ;
    if(!dir.exists(file.path(path4APPDATA_RStudio, "templates"))) dir.create(file.path(path4APPDATA_RStudio, "templates")) ;
    
    destination.path.filename.ext = file.path(path4APPDATA_RStudio, "templates", "default.R"); 
    if(file.copy(from=env.custom$path$current.path.filename.ext, to=destination.path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", destination.path.filename.ext)) else warning(paste0("Update failed: ", destination.path.filename.ext)); 
    if (.Platform$OS.type == "windows") {shell(paste0("notepad.exe ",destination.path.filename.ext),wait=FALSE)} else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",destination.path.filename.ext),wait=FALSE)};
    for ( destination.path.filename.ext in c(
        file.path(env.custom$path$source_base_local, "rstudio-prefs", "templates", env.custom$path$default.filename.ext)
        , file.path(env.custom$path$path0, "Rproject_Rmd", env.custom$path$default.filename.ext)
    )) {if(env.custom$path$current.path.filename.ext != destination.path.filename.ext) {
        destination.filename = basename(destination.path.filename.ext) |> str_remove("\\.([[:alnum:]]+)$")
        destination.ext = basename(destination.path.filename.ext) |> str_extract("\\.([[:alnum:]]+)$")
        backup.path.filename = file.path(env.custom$path$path0, "Rproject_Rmd", "-backup", paste0(destination.filename,"-",format(Sys.time(),"%y%m%d_%H%M"),destination.ext))
        file.copy(from=destination.path.filename.ext, to=backup.path.filename, overwrite=TRUE); message(paste0("Backup file created: ",backup.path.filename))
        if(file.copy(from=env.custom$path$current.path.filename.ext, to=destination.path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", destination.path.filename.ext)) else warning(paste0("Update failed: ", destination.path.filename.ext));
        if (.Platform$OS.type == "windows") {shell(paste0("notepad.exe ",destination.path.filename.ext),wait=FALSE)} else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",destination.path.filename.ext),wait=FALSE)};
    }}
    file.edit(env.custom$path$current.path.filename.ext);
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  