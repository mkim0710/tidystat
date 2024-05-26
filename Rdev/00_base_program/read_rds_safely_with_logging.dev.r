# sourcename = "read_rds_safely_with_logging"
# read_rds_safely_with_logging.dev.r
# read_rds_safely_with_logging.source.r
# utils::browseURL("/Rdev/00_base_program/read_rds_safely_with_logging.dev.r")
# source(paste0(env.custom$path$source_base,"/","Rdev/00_base_program/read_rds_safely_with_logging.source.r"))
# # source("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
# # source("https://github.com/mkim0710/tidystat/raw/master/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.dev.r")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.dev.Rmd")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
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
if(!"path" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env.custom$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
file.edit("[Working Files List].r"); file.edit(env.custom$path$CurrentSource.path.filename.ext)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### $ subpath, sourcename ======
subpath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "read_rds_safely_with_logging"
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

library(tidyverse)

# Function to log file availability
log_file_availability <- function(path) {
  if (file.exists(path)) {
    cat(format.POSIXct(Sys.time(), usetz = TRUE), " - File exists\n")
  } else {
    cat(format.POSIXct(Sys.time(), usetz = TRUE), " - File does not exist\n")
  }
}

path4read = "data"
objectname = "fhs.index100"
paste0(path4read,"/",objectname,".rds")
log_file_availability(paste0(path4read,"/",objectname,".rds"))
try(assign( "DataSet", read_rds(paste0(path4read,"/",objectname,".rds")) ))
# error?
path.filename.ext = paste0(path4read,"/",objectname,".rds")
path.filename.ext
log_file_availability(path.filename.ext)
try(assign( "DataSet", read_rds(path.filename.ext) ))



library(tidyverse)
path4read = "data"
objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(path4read,"/",objectname,".rds")
log_file_availability(paste0(path4read,"/",objectname,".rds"))
try(assign( "DataSet", read_rds(paste0(path4read,"/",objectname,".rds")) ))
# error?
path.filename.ext = paste0(path4read,"/",objectname,".rds")
path.filename.ext
log_file_availability(path.filename.ext)
try(assign( "DataSet", read_rds(path.filename.ext) ))



library(tidyverse)
path4read = "data"
objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(path4read,"/",objectname,".rds")
log_file_availability(paste0(path4read,"/",objectname,".rds"))
try(assign( objectname, read_rds(paste0(path4read,"/",objectname,".rds")) ))
# error?
path.filename.ext = paste0(path4read,"/",objectname,".rds")
path.filename.ext
log_file_availability(path.filename.ext)
try(assign( objectname, read_rds(path.filename.ext) ))



# # path4read = file.path(env.custom$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # objectname = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# rm("path4read")
# rm("objectname")
# library(tidyverse)
# path4read = "./data"
# objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# paste0(path4read,"/",objectname,".rds")
# file.exists(paste0(path4read,"/",objectname,".rds"))
# assign( objectname, read_rds(normalizePath(paste0(path4read,"/",objectname,".rds"))) )
# # > paste0(path4read,"/",objectname,".rds")
# # [1] "./data/CohortGJ0910.BaselineJKGJ2085NoHx...01.rds"
# # > file.exists(paste0(path4read,"/",objectname,".rds"))
# # [1] FALSE
# # > assign( objectname, read_rds(normalizePath(paste0(path4read,"/",objectname,".rds"))) )
# # Warning: path[1]="./data/CohortGJ0910.BaselineJKGJ2085NoHx...01.rds": No such file or directoryWarning: cannot open file './data/CohortGJ0910.BaselineJKGJ2085NoHx...01.rds': No such file or directoryError in readRDS(con, refhook = refhook) : cannot open the connection
# 


# Function to safely read an RDS file with logging
read_rds_safely_with_logging <- function(path, max_attempts = 9) {
  attempt <- 1
  while (!file.exists(path) && attempt <= max_attempts) {
    log_file_availability(path)  # Log file existence
    Sys.sleep(1)  # Wait for 1 second before retrying
    attempt <- attempt + 1
  }
  if (file.exists(path)) {
    log_file_availability(path)  # Final log if file exists
    read_rds(path)
  } else {
    stop("File not available after ", max_attempts, " attempts.")
  }
}

path4read = "data"
objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(path4read,"/",objectname,".rds")
file.exists(paste0(path4read,"/",objectname,".rds"))
assign( objectname, read_rds_safely_with_logging(paste0(path4read,"/",objectname,".rds")) )



