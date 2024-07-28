# sourcename = "read_rds_safely_with_logging" |> paste0(".source.r")
# read_rds_safely_with_logging.dev.r
# read_rds_safely_with_logging.source.r
# utils::browseURL("/Rdev/00_base_program/read_rds_safely_with_logging.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/00_base_program/read_rds_safely_with_logging.source.r"))
# # source("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
# # source("https://github.com/mkim0710/tidystat/raw/master/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.dev.r")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.dev.Rmd")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### \$ subpath, sourcename ======




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(.tmp$packagename in c("tidyverse")) {if(!require(.tmp$packagename,character.only=TRUE))install.packages(.tmp$packagename) else library(.tmp$packagename,character.only=TRUE)}
if(!exists(".tmp", envir=.GlobalEnv)) { assign(".tmp", list(), envir=.GlobalEnv) }  
if(!exists("env1", envir=.GlobalEnv)) { assign("env1", new.env(), envir=.GlobalEnv) }
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!"path" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$path <- list() }  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
.tmp$objectname = "source_base_local"; .tmp$object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://github.com/mkim0710/tidystat/raw/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "path0"; .tmp$object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "path1"; .tmp$object = env1$path$path0 |> paste0("/") |> paste0(env1$path$getwd |> str_replace(fixed(env1$path$path0), "") |> str_extract("[^/]+")); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
paste0("[Working Files List] ",basename(getwd()),".r") %>% {.[file.exists(.)]} |> file.edit(); file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### \$ subpath, sourcename ======
subpath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "read_rds_safely_with_logging" |> paste0(".source.r")
# \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$subpath = subpath
sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
env1$path$sourcename_root = sourcename_root  
env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
cat("# ",'sourcename_root = "',sourcename_root,'"', "  \n",
    "# ",sourcename_root,".dev.r", "  \n",
    "# ",sourcename_root,".dev.Rmd", "  \n",
    "# ",sourcename_root,".source.r", "  \n",
    '# # source("',env1$path$source_base,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'"); file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'"); file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'"); file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
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



# # path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
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



