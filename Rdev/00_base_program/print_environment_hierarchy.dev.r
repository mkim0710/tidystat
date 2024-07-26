# default.R
# utils::browseURL("/rstudio-prefs/templates/default.R")
# source(paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R")
# # source("https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/templates/default.R")
# file.edit(paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"))
# file.edit(paste0(env1$path$source_base,"/","rstudio-prefs/templates/templates-00env1.minimum.Rmd"))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote() |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote() |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!exists("env1", envir=.GlobalEnv)) assign("env1", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
if(!"source_base" %in% names(env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "path1"; object = env1$path$path0 |> paste0("/") |> paste0(env1$path$getwd |> str_replace(fixed(env1$path$path0), "") |> str_extract("[^/]+")); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### env1\$env.internal ====
if(!"env.internal" %in% names(env1)) {
    sourcename = "env1$env.internal" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### env1\$f_df.t.tribble_construct() ====
if(!"f_df.t.tribble_construct" %in% names(env1)) {
    sourcename = "f_df.t.tribble_construct" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env1\$info\$get_system_info() ====
# if(!"get_system_info" %in% names(env1$info)) {
#     sourcename = "get_system_info" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
# }
# env1$info$info_system_info = env1$info$get_system_info()
# env1$info$info_system_info |> utils::str()
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----
# sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
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
#@@ START) dev -----
# https://chatgpt.com/c/9faf244b-181e-47ec-ae76-841d14f50e0f
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## % search()  -----
search() |> deparse() |> cat("  \n", sep="")
# > search() |> deparse() |> cat("  \n", sep="")
# c(".GlobalEnv", "package:lubridate", "package:forcats", "package:stringr",  "package:dplyr", "package:purrr", "package:readr", "package:tidyr",  "package:tibble", "package:ggplot2", "package:tidyverse", "tools:rstudio",  "package:stats", "package:graphics", "package:grDevices", "package:utils",  "package:datasets", "package:methods", "Autoloads", "package:base" )

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    env_name <- environmentName(env)
    if (env_name == "") {
      env_name <- deparse(substitute(env))
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions
f_global <- function() {
  f_internal <- function() {
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  f_internal()
}

# Calling the global function
f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> Autoloads -> package:methods -> package:datasets -> package:utils -> package:grDevices -> package:graphics -> package:stats -> tools:rstudio -> package:tidyverse -> package:ggplot2 -> package:tibble -> package:tidyr -> package:readr -> package:purrr -> package:dplyr -> package:stringr -> package:forcats -> package:lubridate -> R_GlobalEnv -> <environment> -> environment() 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else {
      env_name <- capture.output(env)
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}
# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> <environment: base> -> [1] "Autoloads" -> attr(,"name") -> <environment: 0x55e96efc8b58> -> [1] "/usr/local/lib/R/library/methods" -> attr(,"path") -> [1] "package:methods" -> attr(,"name") -> <environment: package:methods> -> [1] "/usr/local/lib/R/library/datasets" -> attr(,"path") -> [1] "package:datasets" -> attr(,"name") -> <environment: package:datasets> -> [1] "/usr/local/lib/R/library/utils" -> attr(,"path") -> [1] "package:utils" -> attr(,"name") -> <environment: package:utils> -> [1] "/usr/local/lib/R/library/grDevices" -> attr(,"path") -> [1] "package:grDevices" -> attr(,"name") -> <environment: package:grDevices> -> [1] "/usr/local/lib/R/library/graphics" -> attr(,"path") -> [1] "package:graphics" -> attr(,"name") -> <environment: package:graphics> -> [1] "/usr/local/lib/R/library/stats" -> attr(,"path") -> [1] "package:stats" -> attr(,"name") -> <environment: package:stats> -> [1] "tools:rstudio" -> attr(,"name") -> <environment: 0x55e970e13a70> -> [1] "/usr/local/lib/R/site-library/tidyverse" -> attr(,"path") -> [1] "package:tidyverse" -> attr(,"name") -> <environment: package:tidyverse> -> [1] "/usr/local/lib/R/site-library/ggplot2" -> attr(,"path") -> [1] "package:ggplot2" -> attr(,"name") -> <environment: package:ggplot2> -> [1] "/usr/local/lib/R/site-library/tibble" -> attr(,"path") -> [1] "package:tibble" -> attr(,"name") -> <environment: package:tibble> -> [1] "/usr/local/lib/R/site-library/tidyr" -> attr(,"path") -> [1] "package:tidyr" -> attr(,"name") -> <environment: package:tidyr> -> [1] "/usr/local/lib/R/site-library/readr" -> attr(,"path") -> [1] "package:readr" -> attr(,"name") -> <environment: package:readr> -> [1] "/usr/local/lib/R/site-library/purrr" -> attr(,"path") -> [1] "package:purrr" -> attr(,"name") -> <environment: package:purrr> -> [1] "/usr/local/lib/R/site-library/dplyr" -> attr(,"path") -> [1] "package:dplyr" -> attr(,"name") -> <environment: package:dplyr> -> [1] "/usr/local/lib/R/site-library/stringr" -> attr(,"path") -> [1] "package:stringr" -> attr(,"name") -> <environment: package:stringr> -> [1] "/usr/local/lib/R/site-library/forcats" -> attr(,"path") -> [1] "package:forcats" -> attr(,"name") -> <environment: package:forcats> -> [1] "/usr/local/lib/R/site-library/lubridate" -> attr(,"path") -> [1] "package:lubridate" -> attr(,"name") -> <environment: package:lubridate> -> <environment: R_GlobalEnv> -> f_global_env -> f_internal_env


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else {
      env_name <- paste0("<environment: ", capture.output(print(env)), ">")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> <environment: [1] "Autoloads"> -> <environment: attr(,"name")> -> <environment: <environment: 0x55e96efc8b58>> -> <environment: [1] "/usr/local/lib/R/library/methods"> -> <environment: attr(,"path")> -> <environment: [1] "package:methods"> -> <environment: attr(,"name")> -> <environment: <environment: package:methods>> -> <environment: [1] "/usr/local/lib/R/library/datasets"> -> <environment: attr(,"path")> -> <environment: [1] "package:datasets"> -> <environment: attr(,"name")> -> <environment: <environment: package:datasets>> -> <environment: [1] "/usr/local/lib/R/library/utils"> -> <environment: attr(,"path")> -> <environment: [1] "package:utils"> -> <environment: attr(,"name")> -> <environment: <environment: package:utils>> -> <environment: [1] "/usr/local/lib/R/library/grDevices"> -> <environment: attr(,"path")> -> <environment: [1] "package:grDevices"> -> <environment: attr(,"name")> -> <environment: <environment: package:grDevices>> -> <environment: [1] "/usr/local/lib/R/library/graphics"> -> <environment: attr(,"path")> -> <environment: [1] "package:graphics"> -> <environment: attr(,"name")> -> <environment: <environment: package:graphics>> -> <environment: [1] "/usr/local/lib/R/library/stats"> -> <environment: attr(,"path")> -> <environment: [1] "package:stats"> -> <environment: attr(,"name")> -> <environment: <environment: package:stats>> -> <environment: [1] "tools:rstudio"> -> <environment: attr(,"name")> -> <environment: <environment: 0x55e970e13a70>> -> <environment: [1] "/usr/local/lib/R/site-library/tidyverse"> -> <environment: attr(,"path")> -> <environment: [1] "package:tidyverse"> -> <environment: attr(,"name")> -> <environment: <environment: package:tidyverse>> -> <environment: [1] "/usr/local/lib/R/site-library/ggplot2"> -> <environment: attr(,"path")> -> <environment: [1] "package:ggplot2"> -> <environment: attr(,"name")> -> <environment: <environment: package:ggplot2>> -> <environment: [1] "/usr/local/lib/R/site-library/tibble"> -> <environment: attr(,"path")> -> <environment: [1] "package:tibble"> -> <environment: attr(,"name")> -> <environment: <environment: package:tibble>> -> <environment: [1] "/usr/local/lib/R/site-library/tidyr"> -> <environment: attr(,"path")> -> <environment: [1] "package:tidyr"> -> <environment: attr(,"name")> -> <environment: <environment: package:tidyr>> -> <environment: [1] "/usr/local/lib/R/site-library/readr"> -> <environment: attr(,"path")> -> <environment: [1] "package:readr"> -> <environment: attr(,"name")> -> <environment: <environment: package:readr>> -> <environment: [1] "/usr/local/lib/R/site-library/purrr"> -> <environment: attr(,"path")> -> <environment: [1] "package:purrr"> -> <environment: attr(,"name")> -> <environment: <environment: package:purrr>> -> <environment: [1] "/usr/local/lib/R/site-library/dplyr"> -> <environment: attr(,"path")> -> <environment: [1] "package:dplyr"> -> <environment: attr(,"name")> -> <environment: <environment: package:dplyr>> -> <environment: [1] "/usr/local/lib/R/site-library/stringr"> -> <environment: attr(,"path")> -> <environment: [1] "package:stringr"> -> <environment: attr(,"name")> -> <environment: <environment: package:stringr>> -> <environment: [1] "/usr/local/lib/R/site-library/forcats"> -> <environment: attr(,"path")> -> <environment: [1] "package:forcats"> -> <environment: attr(,"name")> -> <environment: <environment: package:forcats>> -> <environment: [1] "/usr/local/lib/R/site-library/lubridate"> -> <environment: attr(,"path")> -> <environment: [1] "package:lubridate"> -> <environment: attr(,"name")> -> <environment: <environment: package:lubridate>> -> R_GlobalEnv -> f_global_env -> f_internal_env 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else if (identical(env, emptyenv())) {
      env_name <- "emptyenv()"
    } else {
      env_name <- "unknown"
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> R_GlobalEnv -> f_global_env -> f_internal_env 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- attr(env, "name")
    } else {
      env_name <- "unknown"
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> unknown -> package:methods -> package:datasets -> package:utils -> package:grDevices -> package:graphics -> package:stats -> unknown -> package:tidyverse -> package:ggplot2 -> package:tibble -> package:tidyr -> package:readr -> package:purrr -> package:dplyr -> package:stringr -> package:forcats -> package:lubridate -> R_GlobalEnv -> f_global_env -> f_internal_env 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy with more details
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- attr(env, "name")
    } else {
      env_name <- paste("unknown (", format(env), ")", sep = "")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> unknown (<environment: 0x55e96efc8b58>) -> package:methods -> package:datasets -> package:utils -> package:grDevices -> package:graphics -> package:stats -> unknown (<environment: 0x55e970e13a70>) -> package:tidyverse -> package:ggplot2 -> package:tibble -> package:tidyr -> package:readr -> package:purrr -> package:dplyr -> package:stringr -> package:forcats -> package:lubridate -> R_GlobalEnv -> f_global_env -> f_internal_env 


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy with memory addresses
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- paste(get(".__name__", envir = env), "(", format(env), ")", sep = "")
    } else if (identical(env, globalenv())) {
      env_name <- paste("R_GlobalEnv (", format(env), ")", sep = "")
    } else if (identical(env, baseenv())) {
      env_name <- paste("base (", format(env), ")", sep = "")
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- paste(attr(env, "name"), "(", format(env), ")", sep = "")
    } else {
      env_name <- paste("unknown (", format(env), ")", sep = "")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Function to print the environment hierarchy with memory addresses and specific checks for known environments
print_environment_hierarchy <- function(env) {
  # Print the memory address of R_GlobalEnv first
  cat("R_GlobalEnv address:", format(globalenv()), "\n")
  
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- paste(get(".__name__", envir = env), "(", format(env), ")", sep = "")
    } else if (identical(env, globalenv())) {
      env_name <- paste("R_GlobalEnv", "(", format(env), ")", sep = "")
    } else if (identical(env, baseenv())) {
      env_name <- paste("base", "(", format(env), ")", sep = "")
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- paste(attr(env, "name"), "(", format(env), ")", sep = "")
    } else if (identical(env, as.environment("tools:rstudio"))) {
      env_name <- paste("tools:rstudio", "(", format(env), ")", sep = "")
    } else if (identical(env, as.environment("Autoloads"))) {
      env_name <- paste("Autoloads", "(", format(env), ")", sep = "")
    } else {
      env_name <- paste("unknown", "(", format(env), ")", sep = "")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# R_GlobalEnv address: <environment: R_GlobalEnv> 
# Current environment path:
#  emptyenv() -> base(<environment: base>) -> Autoloads(<environment: 0x55e96efc8b58>) -> package:methods(<environment: package:methods>) -> package:datasets(<environment: package:datasets>) -> package:utils(<environment: package:utils>) -> package:grDevices(<environment: package:grDevices>) -> package:graphics(<environment: package:graphics>) -> package:stats(<environment: package:stats>) -> tools:rstudio(<environment: 0x55e970e13a70>) -> package:tidyverse(<environment: package:tidyverse>) -> package:ggplot2(<environment: package:ggplot2>) -> package:tibble(<environment: package:tibble>) -> package:tidyr(<environment: package:tidyr>) -> package:readr(<environment: package:readr>) -> package:purrr(<environment: package:purrr>) -> package:dplyr(<environment: package:dplyr>) -> package:stringr(<environment: package:stringr>) -> package:forcats(<environment: package:forcats>) -> package:lubridate(<environment: package:lubridate>) -> R_GlobalEnv(<environment: R_GlobalEnv>) -> f_global_env(<environment: 0x55e9842b9da0>) -> f_internal_env(<environment: 0x55e9842b96a0>) 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
# ### \$ subpath, sourcename ======
# subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(subpath!="") utils::browseURL(normalizePath(subpath))
# sourcename = "default.template" |> paste0(".source.r")
# subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# # \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
# # source( file.path(env1$path$source_base,subpath.filename.source.r) )
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$subpath = subpath
# sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$sourcename_root = sourcename_root  
# env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
# env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
# env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename |> str_detect("^default")) { packageStartupMessage('sourcename |> str_detect("^default")') } else {
#     # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); file.edit(env1$path$subpath.filename.dev.r); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); file.edit(env1$path$subpath.filename.dev.Rmd); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); file.edit(env1$path$subpath.filename.source.r); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     file2open = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     file2open = env1$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
# }


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# #@@ START) data -----
# #$ assign( DataSetName, read_rds(paste0(path4read,"/",DataSetName,".rds")) ) ====
# # path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# subpath = "data"
# DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# path.filename.ext = ifelse(
#     file.exists(paste0(subpath,"/",DataSetName,".rds"))
#     , paste0(subpath,"/",DataSetName,".rds")
#     , paste0(env1$path$source_base_github,"/",subpath,"/",DataSetName,".rds")
# )
# cat("path.filename.ext = ", path.filename.ext, "\n", sep = "")
# assign( DataSetName, read_rds(path.filename.ext) )














#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

