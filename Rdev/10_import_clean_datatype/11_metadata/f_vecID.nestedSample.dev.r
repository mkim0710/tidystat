# .sourcename = "f_vecID.nestedSample" |> paste0(".source.r")
# f_vecID.nestedSample.dev.r
# f_vecID.nestedSample.source.r
# utils::browseURL("/Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.source.r")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/11_metadata/f_vecID.nestedSample.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
if(Sys.info()["sysname"] == "Windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en");  # Sys.getenv("LANGUAGE");    # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# for(.packagename in c("tidyverse")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
# remove.packages(c("tidyverse", "dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr"))
# for(.packagename in c("tidyverse")) {
# for(.packagename in c("dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr")) {
for(.packagename in c("dplyr", "purrr", "stringr")) {
    tryCatch({
        if(!require(.packagename, character.only=TRUE)) {
            stop(paste("Package", .packagename, "is not installed. Please install it before running this script.  \n install.packages(",deparse(.packagename),")"))
        }
    }, error = function(e) {
        # Additional code to handle the error or provide fallback options
        # Print a warning message but allow R to continue
        warning("Error in .Rprofile: ", e$message)
    })
}  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## .GlobalEnv$.tmp = list() ====  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### .GlobalEnv$env1$path = list() ====  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() } 
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "source_base_local"; .tmp$object = ifelse(Sys.info()["sysname"] == "Windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!".path4read" %in% names(env1$path)) {.path4read = env1$path$.path4read = env1$path$path1}  
if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = ifelse("CurrentSource.path" %in% names(env1$path), env1$path$CurrentSource.path, env1$path$path1)}  
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
paste0("[Working Files List] ",basename(getwd()),".r") %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  
.subpath=r"(Rdev/10_import_clean_datatype/11_metadata)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_vecID.nestedSample" |> paste0(".source.r")
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.subpath = .subpath
.sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root  
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_vecID.nestedSample -----  
#|  f_vecID.nestedSample |#
# Function to create nested samples
f_vecID.nestedSample <- function(vecID, seed=123) {
    # Set seed for reproducibility
    set.seed(seed)
    # Shuffle the vecID
    vecID.shuffle <- sample(vecID)
    
    # Calculate sample sizes
    n_total <- length(vecID.shuffle)
    n_10_percent <- floor(n_total * 0.10)
    # n_5_percent <- floor(n_total * 0.05)
    n_1_percent <- floor(n_total * 0.01)
    
    # Create nested samples
    out = list()
    out$vecID.10sample <- vecID.shuffle[1:n_10_percent]
    # out$vecID.05sample <- vecID.shuffle[1:n_5_percent]
    out$vecID.01sample<- vecID.shuffle[1:n_1_percent]
    out
}
PERSON_ID <- 1:283798 
PERSON_ID %>% f_vecID.nestedSample() %>% str()
# > PERSON_ID %>% f_vecID.nestedSample() %>% str()
# List of 3
#  $ vecID.10sample: int [1:28379] 188942 134058 124022 160997 226318 124507 193627 45404 65161 59134 ...
#  $ vecID.05sample: int [1:14189] 188942 134058 124022 160997 226318 124507 193627 45404 65161 59134 ...
#  $ vecID.01sample: int [1:2837] 188942 134058 124022 160997 226318 124507 193627 45404 65161 59134 ...




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) data -----  
# \$ assign( .objectname, read_rds(paste0(.path4read,"/",.objectname,".rds")) ) ====  
.path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
.objectname = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
if(file.exists(paste0(.path4read,"/",.objectname,".rds"))) assign( .objectname, read_rds(paste0(.path4read,"/",.objectname,".rds")) )

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% str()
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% str()
# tibble [283,798 × 104] (S3: tbl_df/tbl/data.frame)
#  $ PERSON_ID                    : chr [1:283798] "10003179" "10007522" "10016502" "10025016" ...
#  $ EnrollYear                   : Factor w/ 2 levels "2009","2010": 1 1 1 1 1 1 1 1 1 1 ...
#  $ SEX                          : Factor w/ 2 levels "Male","Female": 2 1 1 2 2 2 1 1 1 2 ...
#  $ AGE_GROUP                    : Factor w/ 19 levels "0","1","2","3",..: 12 10 7 19 18 15 11 18 16 10 ...
#  $ DTH_YM                       : Date[1:283798], format: NA NA NA NA ...
#  $ DTH_CODE1                    : Factor w/ 495 levels "A00-A09","A15-A19",..: NA NA NA NA NA NA NA NA NA NA ...
#  $ DTH_CODE2                    : Factor w/ 31 levels "V01-V09","V10-V19",..: NA NA NA NA NA NA NA NA NA NA ...
#  $ SIDO                         : Factor w/ 17 levels "11","26","27",..: 15 9 9 9 9 9 1 9 1 2 ...
#  $ SGG                          : Factor w/ 264 levels "11110","11140",..: 221 102 110 88 108 109 19 96 24 34 ...
#  $ IPSN_TYPE_CD                 : Factor w/ 6 levels "1","2","5","6",..: 4 3 3 4 4 4 3 4 3 4 ...
#  $ CTRB_PT_TYPE_CD              : Factor w/ 11 levels "0","1","2","3",..: 8 4 9 7 9 11 9 11 3 7 ...
#  $ DFAB_GRD_CD                  : Factor w/ 3 levels "0","1","2": 1 1 1 1 1 1 1 1 1 1 ...
#  $ DFAB_PTN_CD                  : Factor w/ 9 levels "0","1","2","3",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ DFAB_REG_YM                  : Date[1:283798], format: NA NA NA NA ...
#  $ YKIHO_GUBUN_CD               : Factor w/ 19 levels "10","20","28",..: 1 1 1 7 2 1 1 6 10 5 ...
#  $ HEIGHT                       : num [1:283798] 147 170 184 142 151 155 164 161 167 157 ...
#  $ WEIGHT                       : num [1:283798] 54 77 99 38 49 55 56 57 76 46 ...
#  $ BP_HIGH                      : num [1:283798] 150 134 125 141 140 119 128 130 122 102 ...
#  $ BP_LWST                      : num [1:283798] 80 89 78 78 60 70 81 88 66 66 ...
#  $ BLDS                         : num [1:283798] 163 88 95 77 76 110 100 155 77 92 ...
#  $ TOT_CHOLE                    : num [1:283798] 225 172 210 159 184 209 214 205 151 221 ...
#  $ HMG                          : num [1:283798] 12.1 16.3 15.2 13 11.5 ...
#  $ OLIG_PROTE_CD                : Factor w/ 6 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ SGOT_AST                     : num [1:283798] 93 25 28 22 25 24 25 28 21 23 ...
#  $ SGPT_ALT                     : num [1:283798] 129 26 33 20 14 6 17 25 22 18 ...
#  $ GAMMA_GTP                    : num [1:283798] 75 37 40 29 11 13 18 27 29 12 ...
#  $ FMLY_HPRTS_PATIEN_YN         : Factor w/ 2 levels "0","1": 2 1 1 NA 1 1 NA 1 1 1 ...
#  $ FMLY_APOP_PATIEN_YN          : Factor w/ 2 levels "0","1": 1 1 1 NA 1 1 NA 1 2 1 ...
#  $ FMLY_HDISE_PATIEN_YN         : Factor w/ 2 levels "0","1": 1 1 1 NA 1 1 NA 1 1 1 ...
#  $ FMLY_DIABML_PATIEN_YN        : Factor w/ 2 levels "0","1": 2 1 1 NA 1 1 NA 1 1 1 ...
#  $ FMLY_CANCER_PATIEN_YN        : Factor w/ 2 levels "0","1": 1 1 1 NA 2 2 NA 1 1 1 ...
#  $ SMK_STAT_TYPE_RSPS_CD        : Factor w/ 3 levels "1","2","3": 1 3 2 1 1 1 2 1 2 1 ...
#  $ DRNK_HABIT_RSPS_CD           : Factor w/ 8 levels "1","2","3","4",..: 1 3 3 1 1 1 3 2 2 1 ...
#  $ TM1_DRKQTY_RSPS_CD           : Factor w/ 60 levels "0","1","10","11",..: NA 24 3 NA NA NA 39 NA 24 1 ...
#  $ WAIST                        : num [1:283798] 80 84 88 73 81 78 77 82 93 61 ...
#  $ TRIGLYCERIDE                 : num [1:283798] 138 48 148 57 58 161 95 63 106 63 ...
#  $ HDL_CHOLE                    : num [1:283798] 50 54 43 39 58 62 47 70 64 55 ...
#  $ LDL_CHOLE                    : num [1:283798] 147 108 137 108 114 114 148 122 65 153 ...
#  $ CREATININE                   : num [1:283798] 0.6 1.1 1 0.7 1 ...
#  $ HCHK_APOP_PMH_YN             : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
#  $ HCHK_HDISE_PMH_YN            : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
#  $ HCHK_HPRTS_PMH_YN            : Factor w/ 2 levels "0","1": 2 1 1 2 2 1 1 2 1 1 ...
#  $ HCHK_DIABML_PMH_YN           : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 2 1 1 ...
#  $ HCHK_HPLPDM_PMH_YN           : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
#  $ HCHK_ETCDSE_PMH_YN           : Factor w/ 2 levels "0","1": 1 1 1 2 1 1 1 1 1 1 ...
#  $ PAST_SMK_TERM_RSPS_CD        : Factor w/ 70 levels "0","1","10","11",..: NA NA 3 NA NA NA 8 NA 3 NA ...
#  $ PAST_DSQTY_RSPS_CD           : Factor w/ 56 levels "0","1","10","100",..: NA NA 3 NA NA NA 9 NA 3 NA ...
#  $ CUR_SMK_TERM_RSPS_CD         : Factor w/ 76 levels "0","1","10","11",..: NA 14 NA NA NA NA NA NA NA NA ...
#  $ CUR_DSQTY_RSPS_CD            : Factor w/ 60 levels "0","1","10","100",..: NA 15 NA NA NA NA NA NA NA NA ...
#  $ MOV20_WEK_FREQ_ID            : Factor w/ 8 levels "1","2","3","4",..: 1 1 2 1 1 4 1 1 1 3 ...
#  $ MOV30_WEK_FREQ_ID            : Factor w/ 8 levels "1","2","3","4",..: 8 2 1 1 5 3 1 1 1 3 ...
#  $ WLK30_WEK_FREQ_ID            : Factor w/ 8 levels "1","2","3","4",..: 1 1 5 2 8 8 8 8 4 3 ...
#  $ HCHK_PHSS_PMH_YN             : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
#  $ n.ICD_E0814                  : int [1:283798] NA NA NA NA NA NA NA NA NA NA ...
#  $ minDate.ICD_E0814            : Date[1:283798], format: NA NA NA NA ...
#  $ maxDate.ICD_E0814            : Date[1:283798], format: NA NA NA NA ...
#  $ diffDate.ICD_E0814           : 'difftime' num [1:283798] NA NA NA NA ...
#   ..- attr(*, "units")= chr "days"
#  $ n.ICD_I1016                  : int [1:283798] 46 NA NA 63 68 NA NA 83 NA 6 ...
#  $ minDate.ICD_I1016            : Date[1:283798], format: "2004-02-03" NA NA "2007-01-26" ...
#  $ maxDate.ICD_I1016            : Date[1:283798], format: "2013-11-06" NA NA "2013-12-11" ...
#  $ diffDate.ICD_I1016           : 'difftime' num [1:283798] 3564 NA NA 2511 ...
#   ..- attr(*, "units")= chr "days"
#  $ n.ICD_I2025                  : int [1:283798] NA NA NA NA NA NA NA NA NA NA ...
#  $ minDate.ICD_I2025            : Date[1:283798], format: NA NA NA NA ...
#  $ maxDate.ICD_I2025            : Date[1:283798], format: NA NA NA NA ...
#  $ diffDate.ICD_I2025           : 'difftime' num [1:283798] NA NA NA NA ...
#   ..- attr(*, "units")= chr "days"
#  $ n.ICD_I3052                  : int [1:283798] NA NA NA NA NA NA NA NA NA NA ...
#  $ minDate.ICD_I3052            : Date[1:283798], format: NA NA NA NA ...
#  $ maxDate.ICD_I3052            : Date[1:283798], format: NA NA NA NA ...
#  $ diffDate.ICD_I3052           : 'difftime' num [1:283798] NA NA NA NA ...
#   ..- attr(*, "units")= chr "days"
#  $ n.ICD_I6069                  : int [1:283798] NA NA NA NA NA NA NA NA NA NA ...
#  $ minDate.ICD_I6069            : Date[1:283798], format: NA NA NA NA ...
#  $ maxDate.ICD_I6069            : Date[1:283798], format: NA NA NA NA ...
#  $ diffDate.ICD_I6069           : 'difftime' num [1:283798] NA NA NA NA ...
#   ..- attr(*, "units")= chr "days"
#  $ n.ICD_I7079                  : int [1:283798] NA NA NA 3 NA NA NA NA NA NA ...
#  $ minDate.ICD_I7079            : Date[1:283798], format: NA NA NA "2007-05-16" ...
#  $ maxDate.ICD_I7079            : Date[1:283798], format: NA NA NA "2007-09-27" ...
#  $ diffDate.ICD_I7079           : 'difftime' num [1:283798] NA NA NA 134 ...
#   ..- attr(*, "units")= chr "days"
#  $ Female                       : logi [1:283798] TRUE FALSE FALSE TRUE TRUE TRUE ...
#  $ BMI                          : num [1:283798] 25 26.6 29.2 18.8 21.5 ...
#  $ BMI_lt185                    : logi [1:283798] FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BMI_ge185lt230               : logi [1:283798] FALSE FALSE FALSE TRUE TRUE TRUE ...
#  $ BMI_ge230lt250               : logi [1:283798] TRUE FALSE FALSE FALSE FALSE FALSE ...
#  $ BMI_ge185lt250               : logi [1:283798] TRUE FALSE FALSE TRUE TRUE TRUE ...
#  $ BMI_ge250lt300               : logi [1:283798] FALSE TRUE TRUE FALSE FALSE FALSE ...
#  $ BMI_ge300                    : logi [1:283798] FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BMI_ge350                    : logi [1:283798] FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BMI_ge400                    : logi [1:283798] FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BMI.cut4                     : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 2 3 3 2 2 2 2 2 3 2 ...
#  $ FPG                          : num [1:283798] 163 88 95 77 76 110 100 155 77 92 ...
#  $ FPG_ge100                    : logi [1:283798] TRUE FALSE FALSE FALSE FALSE TRUE ...
#  $ FPG_ge126                    : logi [1:283798] TRUE FALSE FALSE FALSE FALSE FALSE ...
#  $ SBP                          : num [1:283798] 150 134 125 141 140 119 128 130 122 102 ...
#  $ DBP                          : num [1:283798] 80 89 78 78 60 70 81 88 66 66 ...
#  $ BP_ESCESH2018                : Factor w/ 6 levels "(1) Optimal BP",..: 4 3 2 4 4 1 2 3 2 1 ...
#  $ FPG_ge100lt126               : logi [1:283798] FALSE FALSE FALSE FALSE FALSE TRUE ...
#  $ TRIGLYCERIDE_ge150           : logi [1:283798] FALSE FALSE FALSE FALSE FALSE TRUE ...
#  $ HDL_CHOLE_lt4050             : logi [1:283798] FALSE FALSE FALSE TRUE FALSE FALSE ...
#  $ WAIST_ge9080                 : logi [1:283798] TRUE FALSE FALSE FALSE TRUE FALSE ...
#  $ WAIST_ge9085                 : logi [1:283798] FALSE FALSE FALSE FALSE FALSE FALSE ...
#   [list output truncated]
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


vecID.nestedSample = CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds$PERSON_ID %>% f_vecID.nestedSample() 
vecID.nestedSample %>% str()
# > vecID.nestedSample %>% str()
# List of 3
#  $ vecID.10sample: chr [1:28379] "25690129" "80103262" "76738028" "89527365" ...
#  $ vecID.05sample: chr [1:14189] "25690129" "80103262" "76738028" "89527365" ...
#  $ vecID.01sample: chr [1:2837] "25690129" "80103262" "76738028" "89527365" ...



CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01 =
    CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% 
    dplyr::filter(PERSON_ID %in% vecID.nestedSample$vecID.01sample)
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01.dropNAcols =
    CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01 %>% 
    select_if(function(vec) all(!is.na(vec)))


CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% dim
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01 %>% dim
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01.dropNAcols %>% dim
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% dim
# [1] 283798    104
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01 %>% dim
# [1] 2837  104
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01.dropNAcols %>% dim
# [1] 2837   59



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
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# write_rds(CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01.dropNAcols, "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.01.dropNAcols.rds")
