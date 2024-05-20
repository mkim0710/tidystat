# RStudio Server Setup.r 
# RStudio.Cloud Setup.r 
# https://posit.cloud/spaces/100015/content/6373416  # Shared Workspace@MKim0710 - github_mkim0710_tidystat
# https://posit.cloud/spaces/404673/content/6373521  # Shared Workspace@v - PositCloud@v
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Rocker Setup.r
file.edit("-private/docker run -d -p --restart=always --name -e -v -private.sh")
# file.edit("Rocker set up.r")
# file.edit("Rocker set up -private.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#| To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v) |#
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
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env.custom\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!"path" %in% names(env.custom)) env.custom$path = list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
file.edit("[Working Files List].r"); file.edit(env.custom$path$current.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### env.custom\$env.internal ====
# sourcename = "env.custom$env.internal"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env.custom\$info\$get_system_info() ====
sourcename = "get_system_info"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
env.custom$info$info_system_info = env.custom$info$get_system_info()
env.custom$info$info_system_info |> str()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @MAGB760M13700KF |#
# > env.custom$info$info_system_info |> str()
# List of 9
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "windows"
#  $ os_sysname      : chr "Windows"
#  $ os_version      : chr "build 19045"
#  $ machine_type    : chr "x86-64"
#  $ machine_nodename: chr "MAGB760M13700KF"
#  $ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "en_US.utf8"
#   ..$ LC_CTYPE         : chr "en_US.utf8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "en_US.utf8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : NULL
#   ..$ localization_codepage       : int 65001
#   ..$ localization_system.codepage: int 65001
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @Mac |#
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @Posit.Cloud |#
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @Rocker |#
# List of 9
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "unix"
#  $ os_sysname      : chr "Linux"
#  $ os_version      : chr "#1 SMP Thu Jan 11 04:09:03 UTC 2024"
#  $ machine_type    : chr "x86_64"
#  $ machine_nodename: chr "059a785fbdc6"
#  $ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "en_US.utf8"
#   ..$ LC_CTYPE         : chr "en_US.utf8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "en_US.utf8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : chr "UTF-8"
#   ..$ localization_codepage       : NULL
#   ..$ localization_system.codepage: NULL
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env.custom\$f_df.t.tribble_construct() ====
sourcename = "f_df.t.tribble_construct"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##### env.custom\$f_path.df_dirs_recursive.df_files() ----
# sourcename = "f_path.df_dirs_recursive.df_files"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
# env.custom$path$df_dirs_recursive.df_files = env.custom$f_path.df_dirs_recursive.df_files(input_path=env.custom$path$path1, print.message=FALSE)
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
### $ subpath, sourcename ======
subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "default.template"
subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# % (source( file.path(env.custom$path$source_base,subpath.filename.source.r) )) ----
# (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) check -----
##@ "~" |> normalizePath(winslash="/") ====
tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @MAGB760M13700KF D:/OneDrive/Documents |#
#   symbol normalizePath                           
# 1 /      D:/                                     
# 2 ~      D:/OneDrive/Documents                   
# 3 .      D:/OneDrive/[][Rproject]/github_tidystat
# 4 ..     D:/OneDrive/[][Rproject]                
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @Mac /Users/mkim0710 |#
#   symbol normalizePath                                                                      
# 1 /      /                                                                                  
# 2 ~      /Users/mkim0710                                                                    
# 3 .      /Users/mkim0710/Library/CloudStorage/OneDrive-Personal/[][Rproject]/github_tidystat
# 4 ..     /Users/mkim0710/Library/CloudStorage/OneDrive-Personal/[][Rproject]                
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @Posit.Cloud |#
#   symbol normalizePath      
# 1 /      /                  
# 2 ~      /cloud/home/r149319
# 3 .      /cloud/project     
# 4 ..     /cloud             
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| @Rocker /home/rstudio |#
#   symbol normalizePath                
# 1 /      /                            
# 2 ~      /home/rstudio                
# 3 .      /home/rstudio/github_tidystat
# 4 ..     /home/rstudio                
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) rstudio-prefs -----
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ rstudio-prefs ----
#|  @ rstudio-prefs  

# file.edit(file.path(path4APPDATA_RStudio, filename))
if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = "~/.config/rstudio"}

file.edit(file.path(path4APPDATA_RStudio, "rstudio-prefs.json")); file.edit(env.custom$path$current.path.filename.ext)

# Global Options > General > Save workspace to .RData on exit: Never
# Global Options > Code > Insert spaces for tab: 4
# Global Options > Code > Auto-indent code after paste: uncheck
# Global Options > Code > Display > Show indent guides: check (Rainbow lines?)
# Global Options > Code > Display > Syntax: Highlight R function calls
# Global Options > Code > Display > Syntax: Use rainbow parentheses
# Global Options > Appearance > Editor theme: Ambiance -void
# Global Options > Appearance > Editor theme: Twilight (better for RMD, red for titles)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ templates ----
#|  @ templates  
# if(!dir.exists(file.path(path4APPDATA_RStudio, "templates"))) dir.create(file.path(path4APPDATA_RStudio, "templates"))
# filename.ext = "default.R"; if(!file.exists(file.path(path4APPDATA_RStudio, "templates", filename.ext))) file.create(file.path(path4APPDATA_RStudio, "templates", filename.ext)); file.edit(file.path(path4APPDATA_RStudio, "templates", filename.ext))
# filename.ext = "notebook.Rmd"; if(!file.exists(file.path(path4APPDATA_RStudio, "templates", filename.ext))) file.create(file.path(path4APPDATA_RStudio, "templates", filename.ext)); file.edit(file.path(path4APPDATA_RStudio, "templates", filename.ext))




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) copilot @ RStudio Server -----


###@ ROOT=TRUE ----
# https://stackoverflow.com/questions/64562427/how-to-add-rocker-verse-configuration-root-true-to-docker-compose-file

###@ PASSWORD= ----
# https://github.com/rocker-org/rocker-versioned2/issues/237
# https://github.com/rocker-org/rocker/issues/255
# https://github.com/rocker-org/rocker-versioned2/issues/294
# https://github.com/rocker-org/rocker-versioned2/pull/298

###@ copilot-enabled=1 ------
# https://github.com/rstudio/rstudio/issues/13612
# https://github.com/rstudio/rstudio/issues/13718
# https://chatgpt.com/c/4b8f922c-327a-4b0b-871e-18c07575a4d9

system("sudo R")
system("sudo chmod 666 /etc/rstudio/rsession.conf")
file_path <- "/etc/rstudio/rsession.conf"
lines <- readLines(file_path, warn = FALSE)
modified_lines <- lines[!grepl("^copilot-enabled=", lines)]
modified_lines = c(modified_lines, "copilot-enabled=1", "")
writeLines(modified_lines, file_path)
file.edit(file_path)
system("sudo chmod 644 /etc/rstudio/rsession.conf")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
quit()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#| Tools > Global Options > Copilot > login |#
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) git setup -----
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ .gitignore ----
#|  @ .gitignore  

# Caution) do not forget to add .gitignore to .gitignore
# file.edit("~/.gitignore"); file.edit(env.custom$path$current.path.filename.ext)
file.edit(".gitignore"); file.edit(env.custom$path$current.path.filename.ext)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ Git/SVN > SSH Key ----
#|  @ Git/SVN > SSH Key  
# https://github.com/maurolepore/cloudgithub
# Connecting rstudio.cloud and GitHub
# Tools > Global Options > Git/SVN > SSH key

# > "~" |> normalizePath(winslash="/")
# [1] "/home/rstudio"
path2look = "~/.ssh"; if(!dir.exists(path2look)) dir.create(path2look)
# file.edit("~/.ssh/id_rsa.pub"); file.edit(env.custom$path$current.path.filename.ext)
# file.edit("~/.ssh/id_rsa"); file.edit(env.custom$path$current.path.filename.ext)
file.edit("~/.ssh/id_ed25519.pub"); file.edit(env.custom$path$current.path.filename.ext)
file.edit("~/.ssh/id_ed25519"); file.edit(env.custom$path$current.path.filename.ext)

path.file = file.path(env.custom$path$path0,"-private",".ssh@Docker","id_ed25519.pub"); if(file.exists(path.file)) file.edit(path.file)
path.file = file.path(env.custom$path$path0,"-private",".ssh@Docker","id_ed25519"); if(file.exists(path.file)) file.edit(path.file)

system("git status")

# https://github.com/settings/keys
browseURL("https://github.com/settings/keys")
#' @Rocker@MAGB760M13700KF 240509
#' SHA256:PXJBET0lW71UCJsf7ai2UXdF9/i8vsTY3er+n+rIcx8
#' Added on May 10, 2024
base64_fingerprint = "~/.ssh/id_ed25519.pub" |> readLines() |> str_extract(" .*? ") |> str_replace_all(" ","") |>
    base64_decode() |> sha256() |> base64_encode()
base64_fingerprint |> str_length()
# 256 bits (32 bytes) = 64 (=256/4) hexadecimal characters = 42.67 (=256/6) ASCII characters in base64 
# Cf) 6 bits per character => 2^6 = 64 different ASCII character in base64 encoding
base64_fingerprint |> str_replace_all("=$", "")  # Remove padding from the end of the string, making 43 characters
base64_fingerprint |> str_replace_all("=$", "") |> str_replace_all("\\+", "-") |> str_replace_all("\\/", "_")  # Replace + with - and / with _ to make it URL safe


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ git config --global user.email "mkim0710@gmail.com" ----
### @ git config --global user.name "mhkim@rocker@MAGB760M13700KF" ----
#|  @ git config --global user.email "mkim0710@gmail.com"  
#|  @ git config --global user.name "mhkim@rocker@MAGB760M13700KF"  
# >>> /usr/bin/git commit -F /tmp/Rtmpw9zfpP/git-commit-message-8a2e196d1d.txt --amend
# *** Please tell me who you are.
# Run
#   git config --global user.email "you@example.com"
#   git config --global user.name "Your Name"
# to set your account's default identity.
# Omit --global to set the identity only in this repository.
# fatal: unable to auto-detect email address (got 'rstudio-user@application-3089508-deployment-7850965-gpdff.(none)')

# # If necessary configure git
# # To paste text in the terminal use Shift + Insert.
# # git config --global user.email "USEREMAIL@gmail.com"
# # git config --global user.name "USERNAME"
# system('git config --global user.email "mkim0710@gmail.com"')
# system('git config --global user.name "mkim0710@RStudio.Cloud"')

# system('git config --global user.email "mhkim710@gmail.com"')
# system('git config --global user.name "mhkim@rocker@MAGB760M13700KF"')




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ git remote set-url origin git@github.com:mkim0710/tidystat.git ----
#|  @ git remote set-url origin git@github.com:mkim0710/tidystat.git  
# https://happygitwithr.com/ssh-keys.html#ssh-keys
# How to see the remote URL(s) associated with the current repo in the shell:
# git remote -v
# 
# An SSH remote will look like this:
# git@github.com:USERNAME/REPOSITORY.git
# 
# whereas an HTTPS remote will look like this:
# https://github.com/USERNAME/REPOSITORY.git
# 
# https://docs.github.com/en/free-pro-team@latest/github/using-git/changing-a-remotes-url
# git remote -v
# # git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
# git config remote.origin.url git@github.com:USERNAME/REPOSITORY.git
# git remote -v

system("git remote -v")
# > system("git remote -v")
# origin	https://github.com/mkim0710/tidystat (fetch)
# origin	https://github.com/mkim0710/tidystat (push)

# system("git remote set-url origin git@github.com:mkim0710/REPOSITORY.git")
system("git config remote.origin.url git@github.com:mkim0710/tidystat.git")

system("git remote -v")
# > system("git remote -v")
# origin	git@github.com:mkim0710/tidystat.git (fetch)
# origin	git@github.com:mkim0710/tidystat.git (push)




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) Posit.Cloud -----
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ file upload ----
#|  @ file upload  
# https://community.rstudio.com/t/how-can-i-upload-csv-or-excel-files-existing-in-computer-to-rstudio-cloud/23621



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ Posit.Cloud: Resources> RAM 0.5, CPU 0.5, Background 1 hr -----
#|  @ Posit.Cloud: Resources> RAM 0.5, CPU 0.5, Background 1 hr |#
# https://support.posit.co/hc/en-us/articles/4422648539031-Compute-Hours-and-the-Background-Execution-Limit-in-Posit-Cloud#:~:text=Compute%20hours%20are%20calculated%20based,based%20on%20the%20current%20plan.
# Resources> RAM 0.5, CPU 0.5, Background 1 hr
# Cf) Cloud Free: 25 hrs/month
# Cf) Cloud Student ($5/month): 75 hrs/month




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) install.packages -----
# install.packages(packagename, type = "binary")  # If the installed R version is too old?
# install.packages(packagename, type = "source")  # If the installed R version is too new?
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### @ checkpoint ----
# # https://community.rstudio.com/t/using-library-checkpoint-in-rstudio-cloud/
# # https://packagemanager.rstudio.com/client/#/repos/2/overview
# # options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/302"))  # snapshot for 2020-07-16
# options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/__linux__/xenial/302"))  # snapshot for 2020-07-16, binary for Ubuntu 16.04 (Xenial)

#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# for(packagename in c("icd")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
# # https://packagemanager.rstudio.com/client/#/repos/1/packages/icd




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|
