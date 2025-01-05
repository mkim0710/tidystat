##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# # https://mran.microsoft.com/faq#change-repos
# options(repos = c(CRAN = "https://mran.revolutionanalytics.com/snapshot/2021-03-31"))
# # https://cran.r-project.org/bin/windows/base/old/
# # R version 4.0.5 (Shake and Throw) was released on 2021-03-31.  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://stackoverflow.com/questions/46819684/how-to-access-and-edit-rprofile  
# file.edit(file.path("~", ".Rprofile")) # edit .Rprofile in HOME  
# file.edit(".Rprofile") # edit project specific .Rprofile   
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://support.posit.co/hc/en-us/articles/360047157094-Managing-R-with-Rprofile-Renviron-Rprofile-site-Renviron-site-rsession-conf-and-repos-conf
# https://csgillespie.github.io/efficientR/set-up.html
# https://www.statmethods.net/interface/customizing.html
# At startup, R will source the Rprofile.site file. It will then look for a . Rprofile file to source in the current working directory. If it doesn't find it, it will look for one in the user's home directory. 
# There are two special functions you can place in these files. .First( ) will be run at the start of the R session and .Last( ) will be run at the end of the session.

# Sample Rprofile.site file

# Things you might want to change
# options(papersize="a4")
# options(editor="notepad")
# options(pager="internal")

# R interactive prompt
# options(prompt="> ")
# options(continue="+ ")

# to prefer Compiled HTML help 
# options(chmhelp=TRUE)
# to prefer HTML help
# options(htmlhelp=TRUE)

# General options
# options(tab.width = 4)
# options(width = 130)
# options(graphics.record=TRUE)
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ### \% search() @ default Rocker 4.3.3
# search() |> deparse() |> cat("  \n", sep="") 
# c(".GlobalEnv", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")
# 
# ### \% search() @ default Rocker 4.3.3 + library(tidyverse)
# .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# search() |> deparse() |> cat("  \n", sep="") 
# c(".GlobalEnv", "package:lubridate", "package:forcats", "package:stringr", "package:dplyr", "package:purrr", "package:readr", "package:tidyr", "package:tibble", "package:ggplot2", "package:tidyverse", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ?.First() ----  
# https://chatgpt.com/c/1ea6ef8b-322f-4c16-85e7-0b77c2b09a91

.t0 = Sys.time()
if(Sys.info()["sysname"] == "Windows") Sys.setlocale("LC_ALL", "en_US.UTF-8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en_US");  # Sys.getenv("LANGUAGE");    # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
# Sys.setenv(VERBOSE = FALSE);  # Sys.getenv("VERBOSE");  
# Sys.setenv(VERBOSE = TRUE);  # Sys.getenv("VERBOSE");  
# options(verbose = FALSE);  # getOption("verbose");  
# options(verbose = TRUE);  # getOption("verbose");  


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/c/66f10f41-74a8-800e-aa53-a5b4410ee12a

# Get current R version and determine user library path dynamically
r_version <- paste0(R.version$major, ".", R.version$minor)
user_lib <- switch(.Platform$OS.type,
                   "windows" = file.path(Sys.getenv("USERPROFILE"), "Documents", "R", "win-library", r_version),
                   file.path(Sys.getenv("HOME"), "R", paste0(ifelse(.Platform$OS.type == "unix", Sys.info()["machine"], "x86_64-pc-linux-gnu"), "-library"), r_version))

# Set library path if system library is not writable
if (!file.access(.libPaths()[1], 2) == 0) {
  dir.create(user_lib, recursive = TRUE, showWarnings = FALSE)
  .libPaths(c(user_lib, .libPaths()))
}

# Function to ensure a package is installed and loaded
ensure_package <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg, repos = "https://cloud.r-project.org")
  library(pkg, character.only = TRUE)
}

# Ensure tidyverse is installed and loaded
ensure_package("tidyverse")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.First <- function(){
    library(base)
    library(methods)
    library(datasets)
    library(utils)
    library(grDevices)
    library(graphics)
    library(stats)
    .listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }  
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# for(.packagename in c("tidyverse")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
# remove.packages(c("tidyverse", "dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr"))
# for(.packagename in c("tidyverse")) {
# for(.packagename in c("dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr")) {
for(.packagename in c("dplyr", "purrr", "stringr")) {
    tryCatch({
        if(!require(.packagename, character.only=TRUE)) {
            stop(paste0("Package ", .packagename, " is not installed. Please install it before running this script.  \n install.packages(",deparse(.packagename),")"))
        }
    }, error = function(e) {
        # Additional code to handle the error or provide fallback options
        # Print a warning message but allow R to continue
        warning("Error in .Rprofile: ", e$message, "\n", call. = FALSE, immediate. = TRUE)
    })
}  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    .envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }  
    .sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() } 
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    .tmp$objectname = "source_base_local"; .tmp$object = Filter(dir.exists, paste0(c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "~"), "/github_tidystat"))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
    .tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
    if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    .tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
    # c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
    # env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    .sublistname = "source"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.case_when.benchmark.r
    .GlobalEnv$env1$source$.Rprofile = if (file.exists(".Rprofile")) {
        normalizePath(".Rprofile", winslash = "/")
    } else if (file.exists(file.path("~", ".Rprofile"))) {
        normalizePath(file.path("~", ".Rprofile"), winslash = "/")
    } else {
        NA_character_
    }  
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    ### env1\$env.internal ----  
    # cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/env1%24env.internal.source.r"  
    if(!"env.internal" %in% names(.GlobalEnv$env1)) {
        .filename.source.r = "env1$env.internal" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r); if(!.filename.source.r %in% names(.GlobalEnv$env1$source)) {  .GlobalEnv$env1$source[[.filename.source.r]] = .source_base.subpath_filename.source.r = paste0(env1$path$source_base,ifelse(env1$path$source_base=="","","/"),.subpath_filename.source.r); message('> source("',.source_base.subpath_filename.source.r,'")'); source(.source_base.subpath_filename.source.r)  }  
    }  
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    # ###### \% env1\$env.internal\$f_path0.list_path_hierarchy() ----  
    # # cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/internal.f_path0.list_path_hierarchy.source.r"  
    # .filename.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r))
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    #### env1\$f_df.t.tribble_construct() ----  
    # cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.source.r"  
    if(!"f_df.t.tribble_construct" %in% names(.GlobalEnv$env1)) {
        .filename.source.r = "f_df.t.tribble_construct" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r))  
    }  
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    # ###### \% env1\$f_path.size_files() ----  
    # # cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/f_path.size_files.source.r"  
    # .filename.source.r = "f_path.size_files" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r))  
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    ##### env1\$info\$get_system_info() ----  
    # cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/get_system_info.source.r"  
    if(!"get_system_info" %in% names(.GlobalEnv$env1$info)) {
        .filename.source.r = "get_system_info" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r))
    }  
    .GlobalEnv$env1$info = env1$env.internal.attach$get_system_info()
    cat("> .tmp |> str(max.level = 1, give.attr = TRUE)", "  \n", sep="") 
    .tmp |> str(max.level = 1, give.attr = TRUE)
    cat("> env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)", "  \n", sep="") 
    env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    cat("##________________________________________________________________________________", "  \n", sep="")
    cat("Loading time for .Rprofile: ", difftime(Sys.time(), .t0, units = "secs"), " secs \n", sep="")
    cat("Loaded without error: ", .GlobalEnv$env1$info$.Rprofile, "  \n",
        '    Sys.getlocale() == "', Sys.getlocale(), '"  \n',
        "    Today is: ", date(), "  \n", sep="")
}  

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.Last <- function(){
  cat("\nGoodbye at ", date(), "\n")
}  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


