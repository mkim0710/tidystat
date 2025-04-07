# .SourceName_root = "f_DSname.Search.read.checkEntity"  
# ./f_DSname.Search.read.checkEntity.dev.r  
# ./f_DSname.Search.read.checkEntity.dev.Rmd  
# ./f_DSname.Search.read.checkEntity  
# # source("~/github_tidystat/./f_DSname.Search.read.checkEntity")  
# # if(!file.exists("~/github_tidystat/./f_DSname.Search.read.checkEntity.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/./f_DSname.Search.read.checkEntity.dev.r")  
# # if(!file.exists("~/github_tidystat/./f_DSname.Search.read.checkEntity.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/./f_DSname.Search.read.checkEntity.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/./f_DSname.Search.read.checkEntity")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/./f_DSname.Search.read.checkEntity")  
# file.edit("~/github_tidystat/./f_DSname.Search.read.checkEntity.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/./f_DSname.Search.read.checkEntity.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/./f_DSname.Search.read.checkEntity") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
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
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .FileName.source.r = "function.detachAllPackages" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
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
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"(R)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_DSname.Search.read.checkEntity" |> paste0("-source.R")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.RelativeSubPath = .RelativeSubPath
.SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
env1$path$.SourceName_root = .SourceName_root  
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r)
cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
    "#### ",env1$path$.RelativeSubPath_FileName.dev.r, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
env1$source$f_DSname.Search.read.checkEntity.source.r = NULL
env1$f$f_DSname.Search.read.checkEntity = NULL
env1$source$f_FileNameExt.find_subpath.source.r = NULL
env1$f$f_FileNameExt.find_subpath = NULL
env1$f$f_FileNameExt.find_subpath.BreathFirstSearch = NULL
source("f_DSname.Search.read.checkEntity.source.r")


# \$ DSN = "fhs.index100le10" =======  
DSN = "fhs.index100le10"

## \% f_DSname.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, print2console = FALSE, VERBOSE = TRUE)
# getwd() == .path4read[1] == "."  
# DSN = "fhs.index100le10"  
# i.path4read = "."  
# i.path4read = "data"  
# Found .path_FileNameExt == "data/fhs.index100le10.rds"  
# FileNameExt = "fhs.index100le10.rds"  
# Warning message:
# In env1$f$f_DSname.Search.read.checkEntity(DSN = DSN,  :
#   varname for ID not identified among: c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID")  


## \% f_DSname.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, .path4read = ".", print2console = FALSE, VERBOSE = TRUE)
# > out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, .path4read = ".", print2console = FALSE, VERBOSE = TRUE)
# getwd() == .path4read[1] == "."  
# DSN = "fhs.index100le10"  
# i.path4read = "."  
# !.tmp.file.found && BreathFirstSearch  
# > source("~/github_tidystat/f_FileNameExt.find_subpath.source.r")  
# Loading: .GlobalEnv$env1$f$f_FileNameExt.find_subpath
# Loading: .GlobalEnv$env1$f$f_FileNameExt.find_subpath.BreathFirstSearch
# Searching: .                                                 	 at depth 0  
# Searching: ./-BACKUP                                         	 at depth 1; Queue length: 1  
# Searching: ./data                                            	 at depth 1; Queue length: 2  
# Found .RelativeSubPath: .path4read = "./data"  
# FileNameExt = "fhs.index100le10.rds"  
# Warning message:
# In env1$f$f_DSname.Search.read.checkEntity(DSN = DSN,  :
#   varname for ID not identified among: c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID") 


## \% f_DSname.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, print2console = FALSE)
out |> str(max.level = 2, give.attr = TRUE)
# getwd() == .path4read[1] == "."  
# Found .path_FileNameExt == "data/fhs.index100le10.rds"  
# Warning message:
# In env1$f$f_DSname.Search.read.checkEntity(DSN = DSN,  :
#   varname for ID not identified among: c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID")  
# 
# > out |> str(max.level = 2, give.attr = TRUE)
# List of 6
#  $ DSN  : chr "fhs.index100le10"
#  $ df_size_files:'data.frame':	1 obs. of  2 variables:
#   ..$ FileName: chr "data/fhs.index100le10.rds"
#   ..$ size    : num 35747
#  $ dim          : int [1:2] 450 81
#  $ n_distinct   :List of 1
#   ..$ nrow: int 450
#  $ names        : chr [1:81] "randid" "death" "angina" "hospmi" ...
#  $ str          : chr [1:84] "tibble [450 × 81] (S3: tbl_df/tbl/data.frame)" " $ randid   : num [1:450] 24721 54224 83398 84815 95541 ..." " $ death    : num [1:450] 1 1 1 0 1 0 0 0 0 0 ..." " $ angina   : num [1:450] 0 0 0 0 0 0 0 0 0 1 ..." ...


## \% f_DSname.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, vec_candidate4ID = "randid", print2console = FALSE)
out |> str(max.level = 2, give.attr = TRUE)
# > out |> str(max.level = 2, give.attr = TRUE)
# List of 5
#  $ DSN  : chr "fhs.index100le10"
#  $ df_size_files:'data.frame':	1 obs. of  2 variables:
#   ..$ FileName: chr "data/fhs.index100le10.rds"
#   ..$ size    : num 35747
#  $ dim          : int [1:2] 450 81
#  $ n_distinct   :List of 2
#   ..$ nrow  : int 450
#   ..$ randid: int 450
#  $ names        : chr [1:81] "randid" "death" "angina" "hospmi" ...
#  - attr(*, "str")= chr [1:85] "tibble [450 × 81] (S3: tbl_df/tbl/data.frame)" " $ randid   : num [1:450] 24721 54224 83398 84815 95541 ..." " $ death    : num [1:450] 1 1 1 0 1 0 0 0 0 0 ..." " $ angina   : num [1:450] 0 0 0 0 0 0 0 0 0 1 ..." ..




## \% f_DSname.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, vec_candidate4ID = "randid", print2console = TRUE)
# > out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, vec_candidate4ID = "randid", print2console = TRUE) 
# getwd() == .path4read[1] == "."  
# Found .path_FileNameExt == "data/fhs.index100le10.rds"  
#     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
# tibble::tribble(
#                     ~FileName, ~size,   ~bytes,    ~KB,      ~MB,        ~GB,
#   "data/fhs.index100le10.rds", 35747, "35,747", "34.9", "0.0341", "3.33e-05"
#   )
#     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
#    user  system elapsed 
#   0.001   0.000   0.001 
#     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
# dim(fhs.index100le10) == c(450L, 81L)  
# nrow(fhs.index100le10) == n_distinct(fhs.index100le10$randid) == 450  
#     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
# > names(fhs.index100le10) |> deparse(width.cutoff=105) |> paste0(collapse="  \n") |> cat("  \n", sep="")  
# c("randid", "death", "angina", "hospmi", "mi_fchd", "anychd", "stroke", "cvd", "hyperten", "timeap", "timemi",   
# "timemifc", "timechd", "timestrk", "timecvd", "timedth", "timehyp", "sex1", "time1", "age1", "sysbp1", "diabp1",   
# "bpmeds1", "cursmoke1", "cigpday1", "educ1", "totchol1", "hdlc1", "ldlc1", "bmi1", "glucose1", "diabetes1",   
# "heartrte1", "prevap1", "prevchd1", "prevmi1", "prevstrk1", "prevhyp1", "sex2", "time2", "age2", "sysbp2",   
# "diabp2", "bpmeds2", "cursmoke2", "cigpday2", "educ2", "totchol2", "hdlc2", "ldlc2", "bmi2", "glucose2", "diabetes2",   
# "heartrte2", "prevap2", "prevchd2", "prevmi2", "prevstrk2", "prevhyp2", "sex3", "time3", "age3", "sysbp3",   
# "diabp3", "bpmeds3", "cursmoke3", "cigpday3", "educ3", "totchol3", "hdlc3", "ldlc3", "bmi3", "glucose3", "diabetes3",   
# "heartrte3", "prevap3", "prevchd3", "prevmi3", "prevstrk3", "prevhyp3", "index100")  
#     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
# > names(fhs.index100le10) |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",105,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") |> cat("  \n", sep="")  
# !print.names.tidyeval  
#     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
# > fhs.index100le10 |> str(max.level=2, give.attr=FALSE)  
# tibble [450 × 81] (S3: tbl_df/tbl/data.frame)
#  $ randid   : num [1:450] 24721 54224 83398 84815 95541 ...
#  $ death    : num [1:450] 1 1 1 0 1 0 0 0 0 0 ...
#  $ angina   : num [1:450] 0 0 0 0 0 0 0 0 0 1 ...
#  $ hospmi   : num [1:450] 0 1 0 0 0 0 0 0 0 0 ...
#  $ mi_fchd  : num [1:450] 0 1 0 0 0 0 0 0 0 0 ...
#  $ anychd   : num [1:450] 0 1 0 0 0 0 0 0 0 1 ...
#  $ stroke   : num [1:450] 0 0 1 1 0 0 0 0 0 0 ...
#  $ cvd      : num [1:450] 0 1 1 1 0 0 0 0 0 0 ...
#  $ hyperten : num [1:450] 1 0 1 1 1 1 1 1 1 0 ...
#  $ timeap   : num [1:450] 17.55 1.18 17.16 24 7.38 ...
#  $ timemi   : num [1:450] 17.55 1.18 17.16 24 7.38 ...
#  $ timemifc : num [1:450] 17.55 1.18 17.16 24 7.38 ...
#  $ timechd  : num [1:450] 17.55 1.18 17.16 24 7.38 ...
#  $ timestrk : num [1:450] 17.55 1.18 15.03 23.82 7.38 ...
#  $ timecvd  : num [1:450] 17.55 1.18 15.03 23.82 7.38 ...
#  $ timedth  : num [1:450] 17.55 1.18 17.16 24 7.38 ...
#  $ timehyp  : num [1:450] 12.07 1.18 0 0 0 ...
#  $ sex1     : num [1:450] 2 1 1 2 2 2 1 1 1 2 ...
#  $ time1    : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
#  $ age1     : num [1:450] 39 47 52 42 53 47 56 41 53 46 ...
#  $ sysbp1   : num [1:450] 114 102 160 153 206 130 121 152 138 112 ...
#  $ diabp1   : num [1:450] 64 68 98 101 92 78 79 90 89 70 ...
#  $ bpmeds1  : num [1:450] 0 0 0 0 1 0 0 0 0 0 ...
#  $ cursmoke1: num [1:450] 1 1 0 1 0 1 1 1 1 1 ...
#  $ cigpday1 : num [1:450] 9 20 0 1 0 20 20 43 20 3 ...
#  $ educ1    : num [1:450] 2 4 1 1 3 2 4 2 1 1 ...
#  $ totchol1 : num [1:450] 226 294 178 233 311 237 270 274 188 237 ...
#  $ hdlc1    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
#  $ ldlc1    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi1     : num [1:450] 22.4 24.2 40.1 28.9 21.5 ...
#  $ glucose1 : num [1:450] NA 66 225 90 215 75 93 65 75 62 ...
#  $ diabetes1: num [1:450] 0 0 1 0 1 0 0 0 0 0 ...
#  $ heartrte1: num [1:450] 85 62 75 60 76 80 95 85 60 75 ...
#  $ prevap1  : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
#  $ prevchd1 : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
#  $ prevmi1  : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
#  $ prevstrk1: num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
#  $ prevhyp1 : num [1:450] 0 0 1 1 1 0 0 1 0 0 ...
#  $ sex2     : num [1:450] 2 NA 1 2 2 2 1 1 1 2 ...
#  $ time2    : num [1:450] 2268 NA 2205 2240 2081 ...
#  $ age2     : num [1:450] 46 NA 58 48 59 53 62 47 60 52 ...
#  $ sysbp2   : num [1:450] 136 NA 173 155 160 139 120 136 160 110 ...
#  $ diabp2   : num [1:450] 89 NA 90 106 80 88.5 74 80 85.5 70 ...
#  $ bpmeds2  : num [1:450] 0 NA 0 0 1 0 0 0 0 0 ...
#  $ cursmoke2: num [1:450] 1 NA 0 1 0 1 1 1 0 1 ...
#  $ cigpday2 : num [1:450] 50 NA 0 4 0 30 30 40 0 10 ...
#  $ educ2    : num [1:450] 2 NA 1 1 3 2 4 2 1 1 ...
#  $ totchol2 : num [1:450] 196 NA 155 242 281 324 303 229 232 201 ...
#  $ hdlc2    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
#  $ ldlc2    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi2     : num [1:450] 21.2 NA 36.9 29.3 22.5 ...
#  $ glucose2 : num [1:450] 76 NA 200 NA 269 61 70 93 NA 75 ...
#  $ diabetes2: num [1:450] 0 NA 1 0 1 0 0 0 0 0 ...
#  $ heartrte2: num [1:450] 110 NA 72 60 80 80 80 75 70 90 ...
#  $ prevap2  : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
#  $ prevchd2 : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
#  $ prevmi2  : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
#  $ prevstrk2: num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
#  $ prevhyp2 : num [1:450] 0 NA 1 1 1 0 0 1 0 0 ...
#  $ sex3     : num [1:450] 2 NA 1 2 NA 2 1 1 1 2 ...
#  $ time3    : num [1:450] 4408 NA 4291 4429 NA ...
#  $ age3     : num [1:450] 51 NA 64 54 NA 59 68 53 66 59 ...
#  $ sysbp3   : num [1:450] 141 NA 205 202 NA 132 145 128 144 106 ...
#  $ diabp3   : num [1:450] 81 NA 90 111 NA 77 77 78 81 63.5 ...
#  $ bpmeds3  : num [1:450] 0 NA 1 0 NA 0 0 0 0 0 ...
#  $ cursmoke3: num [1:450] 1 NA 0 1 NA 1 1 1 1 1 ...
#  $ cigpday3 : num [1:450] 15 NA 0 3 NA 20 20 30 10 10 ...
#  $ educ3    : num [1:450] 2 NA 1 1 NA 2 4 2 1 1 ...
#  $ totchol3 : num [1:450] 264 NA NA 246 NA 251 229 204 196 NA ...
#  $ hdlc3    : num [1:450] 58 NA NA 41 NA 53 39 15 35 NA ...
#  $ ldlc3    : num [1:450] 206 NA NA 205 NA 197 170 189 161 NA ...
#  $ bmi3     : num [1:450] 24.8 NA 36.5 26.6 NA ...
#  $ glucose3 : num [1:450] 97 NA NA 80 NA 76 83 94 108 NA ...
#  $ diabetes3: num [1:450] 0 NA 1 0 NA 0 0 0 0 0 ...
#  $ heartrte3: num [1:450] 85 NA 77 63 NA 82 72 65 72 104 ...
#  $ prevap3  : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
#  $ prevchd3 : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
#  $ prevmi3  : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
#  $ prevstrk3: num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
#  $ prevhyp3 : num [1:450] 1 NA 1 1 NA 0 0 1 1 0 ...
#  $ index100 : int [1:450] 3 3 8 8 3 10 8 2 4 3 ...
#     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
# > fhs.index100le10 |> rownames_to_column('#') |> head(n=10) |> as_tibble()  
# # A tibble: 10 × 82
#    `#`   randid death angina hospmi mi_fchd anychd stroke   cvd hyperten timeap timemi timemifc timechd timestrk timecvd timedth timehyp  sex1
#    <chr>  <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl>    <dbl>  <dbl>  <dbl>    <dbl>   <dbl>    <dbl>   <dbl>   <dbl>   <dbl> <dbl>
#  1 1      24721     1      0      0       0      0      0     0        1  17.6   17.6     17.6    17.6     17.6    17.6    17.6    12.1      2
#  2 2      54224     1      0      1       1      1      0     1        0   1.18   1.18     1.18    1.18     1.18    1.18    1.18    1.18     1
#  3 3      83398     1      0      0       0      0      1     1        1  17.2   17.2     17.2    17.2     15.0    15.0    17.2     0        1
#  4 4      84815     0      0      0       0      0      1     1        1  24     24       24      24       23.8    23.8    24       0        2
#  5 5      95541     1      0      0       0      0      0     0        1   7.38   7.38     7.38    7.38     7.38    7.38    7.38    0        2
#  6 6     112297     0      0      0       0      0      0     0        1  24     24       24      24       24      24      24      16.4      2
#  7 7     147250     0      0      0       0      0      0     0        1  24     24       24      24       24      24      24      14.9      1
#  8 8     184857     0      0      0       0      0      0     0        1  24     24       24      24       24      24      24       0        1
#  9 9     207401     0      0      0       0      0      0     0        1  15.0   15.0     15.0    15.0     15.0    15.0    24       8.34     1
# 10 10    290692     0      1      0       0      1      0     0        0  16.3   24       24      16.3     24      24      24      24        2
# # ℹ 63 more variables: time1 <dbl>, age1 <dbl>, sysbp1 <dbl>, diabp1 <dbl>, bpmeds1 <dbl>, cursmoke1 <dbl>, cigpday1 <dbl>, educ1 <dbl>,
# #   totchol1 <dbl>, hdlc1 <dbl>, ldlc1 <dbl>, bmi1 <dbl>, glucose1 <dbl>, diabetes1 <dbl>, heartrte1 <dbl>, prevap1 <dbl>, prevchd1 <dbl>,
# #   prevmi1 <dbl>, prevstrk1 <dbl>, prevhyp1 <dbl>, sex2 <dbl>, time2 <dbl>, age2 <dbl>, sysbp2 <dbl>, diabp2 <dbl>, bpmeds2 <dbl>,
# #   cursmoke2 <dbl>, cigpday2 <dbl>, educ2 <dbl>, totchol2 <dbl>, hdlc2 <dbl>, ldlc2 <dbl>, bmi2 <dbl>, glucose2 <dbl>, diabetes2 <dbl>,
# #   heartrte2 <dbl>, prevap2 <dbl>, prevchd2 <dbl>, prevmi2 <dbl>, prevstrk2 <dbl>, prevhyp2 <dbl>, sex3 <dbl>, time3 <dbl>, age3 <dbl>,
# #   sysbp3 <dbl>, diabp3 <dbl>, bpmeds3 <dbl>, cursmoke3 <dbl>, cigpday3 <dbl>, educ3 <dbl>, totchol3 <dbl>, hdlc3 <dbl>, ldlc3 <dbl>,
# #   bmi3 <dbl>, glucose3 <dbl>, diabetes3 <dbl>, heartrte3 <dbl>, prevap3 <dbl>, prevchd3 <dbl>, prevmi3 <dbl>, prevstrk3 <dbl>, …
#     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
# > fhs.index100le10 |> rownames_to_column('#') |> tail(n=10) |> as_tibble()  
# # A tibble: 10 × 82
#    `#`    randid death angina hospmi mi_fchd anychd stroke   cvd hyperten timeap timemi timemifc timechd timestrk timecvd timedth timehyp  sex1
#    <chr>   <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl>    <dbl>  <dbl>  <dbl>    <dbl>   <dbl>    <dbl>   <dbl>   <dbl>   <dbl> <dbl>
#  1 441   9777436     0      0      0       0      0      0     0        0 24      24       24      24       24      24      24      24        1
#  2 442   9800192     0      0      0       0      0      0     0        0 24      24       24      24       24      24      24      24        2
#  3 443   9802787     1      1      1       1      1      0     1        1  0.627  20.1     20.1     0       20.2     0      20.2     0        1
#  4 444   9816850     0      0      0       0      0      0     0        0 24      24       24      24       24      24      24      24        2
#  5 445   9842231     0      0      0       0      0      0     0        0 24      24       24      24       24      24      24      24        1
#  6 446   9869235     0      0      1       1      1      0     1        1 24      16.1     16.1    16.1     24      16.1    24       3.99     1
#  7 447   9873741     0      0      0       0      0      0     0        0 24      24       24      24       24      24      24      24        1
#  8 448   9901842     1      0      0       1      1      0     1        1 20.2    20.2     13.6    13.6     20.2    13.6    20.2     0        2
#  9 449   9957743     1      0      0       0      0      0     0        1  5.23    5.23     5.23    5.23     5.23    5.23    5.23    0        1
# 10 450   9968499     1      0      0       0      0      0     0        0 11.4    11.4     11.4    11.4     11.4    11.4    11.4    11.4      1
# # ℹ 63 more variables: time1 <dbl>, age1 <dbl>, sysbp1 <dbl>, diabp1 <dbl>, bpmeds1 <dbl>, cursmoke1 <dbl>, cigpday1 <dbl>, educ1 <dbl>,
# #   totchol1 <dbl>, hdlc1 <dbl>, ldlc1 <dbl>, bmi1 <dbl>, glucose1 <dbl>, diabetes1 <dbl>, heartrte1 <dbl>, prevap1 <dbl>, prevchd1 <dbl>,
# #   prevmi1 <dbl>, prevstrk1 <dbl>, prevhyp1 <dbl>, sex2 <dbl>, time2 <dbl>, age2 <dbl>, sysbp2 <dbl>, diabp2 <dbl>, bpmeds2 <dbl>,
# #   cursmoke2 <dbl>, cigpday2 <dbl>, educ2 <dbl>, totchol2 <dbl>, hdlc2 <dbl>, ldlc2 <dbl>, bmi2 <dbl>, glucose2 <dbl>, diabetes2 <dbl>,
# #   heartrte2 <dbl>, prevap2 <dbl>, prevchd2 <dbl>, prevmi2 <dbl>, prevstrk2 <dbl>, prevhyp2 <dbl>, sex3 <dbl>, time3 <dbl>, age3 <dbl>,
# #   sysbp3 <dbl>, diabp3 <dbl>, bpmeds3 <dbl>, cursmoke3 <dbl>, cigpday3 <dbl>, educ3 <dbl>, totchol3 <dbl>, hdlc3 <dbl>, ldlc3 <dbl>,
# #   bmi3 <dbl>, glucose3 <dbl>, diabetes3 <dbl>, heartrte3 <dbl>, prevap3 <dbl>, prevchd3 <dbl>, prevmi3 <dbl>, prevstrk3 <dbl>, …
  
  
# __________|------  
# @@ END-----  
