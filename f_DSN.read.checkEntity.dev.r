# .SourceName_root = "f_DSN.Search.read.checkEntity"  
# ./f_DSN.Search.read.checkEntity.dev.r  
# ./f_DSN.Search.read.checkEntity.dev.Rmd  
# ./f_DSN.Search.read.checkEntity  
# # source("~/github_tidystat/./f_DSN.Search.read.checkEntity")  
# # if(!file.exists("~/github_tidystat/./f_DSN.Search.read.checkEntity.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/./f_DSN.Search.read.checkEntity.dev.r")  
# # if(!file.exists("~/github_tidystat/./f_DSN.Search.read.checkEntity.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/./f_DSN.Search.read.checkEntity.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/./f_DSN.Search.read.checkEntity")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/./f_DSN.Search.read.checkEntity")  
# file.edit("~/github_tidystat/./f_DSN.Search.read.checkEntity.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/./f_DSN.Search.read.checkEntity.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/./f_DSN.Search.read.checkEntity") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
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
.RelativeSubPath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_DSN.Search.read.checkEntity" |> paste0(".source.r")
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
env1$source$f_DSN.Search.read.checkEntity.source.r = NULL
env1$f$f_DSN.Search.read.checkEntity = NULL
env1$source$f_FileNameExt.find_subpath.source.r = NULL
env1$f$f_FileNameExt.find_subpath = NULL
env1$f$f_FileNameExt.find_subpath.BreathFirstSearch = NULL
source("f_DSN.Search.read.checkEntity.source.r")


# \$ DSN = "fhs.index100le10" =======  
DSN = "fhs.index100le10"

## \% f_DSN.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSN.Search.read.checkEntity(DSN = DSN, print2console = FALSE, VERBOSE = TRUE)
# getwd() == .path4read[1] == "."  
# DSN = "fhs.index100le10"  
# i.path4read = "."  
# i.path4read = "data"  
# Found .path_FileNameExt == "data/fhs.index100le10.rds"  
# FileNameExt = "fhs.index100le10.rds"  
# Warning message:
# In env1$f$f_DSN.Search.read.checkEntity(DSN = DSN,  :
#   varname for ID not identified among: c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID")  


## \% f_DSN.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSN.Search.read.checkEntity(DSN = DSN, .path4read = ".", print2console = FALSE, VERBOSE = TRUE)
# > out = env1$f$f_DSN.Search.read.checkEntity(DSN = DSN, .path4read = ".", print2console = FALSE, VERBOSE = TRUE)
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
# In env1$f$f_DSN.Search.read.checkEntity(DSN = DSN,  :
#   varname for ID not identified among: c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID") 


## \% f_DSN.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSN.Search.read.checkEntity(DSN = DSN, print2console = FALSE)
out |> str(max.level = 2, give.attr = TRUE)
# getwd() == .path4read[1] == "."  
# Found .path_FileNameExt == "data/fhs.index100le10.rds"  
# Warning message:
# In env1$f$f_DSN.Search.read.checkEntity(DSN = DSN,  :
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


## \% f_DSN.Search.read.checkEntity(DSN = DSN) =====
out = env1$f$f_DSN.Search.read.checkEntity(DSN = DSN, vec_candidate4ID = "randid", print2console = FALSE)
out |> str(max.level = 2, give.attr = TRUE)
# > out |> str(max.level = 2, give.attr = TRUE)
# List of 7
#  $ DSN   : chr "fhs.index100le10"
#  $ df_size_files :'data.frame':	1 obs. of  2 variables:
#   ..$ FileName: chr "data/fhs.index100le10.rds"
#   ..$ size    : num 35747
#  $ read.proc_time: 'proc_time' Named num [1:5] 0.001 0 0.001 0 0
#   ..- attr(*, "names")= chr [1:5] "user.self" "sys.self" "elapsed" "user.child" ...
#  $ dim           : int [1:2] 450 81
#  $ n_distinct    :List of 2
#   ..$ nrow  : int 450
#   ..$ randid: int 450
#  $ names         : chr [1:81] "randid" "death" "angina" "hospmi" ...
#  $ str           : chr [1:85] "tibble [450 × 81] (S3: tbl_df/tbl/data.frame)" " $ randid   : num [1:450] 24721 54224 83398 84815 95541 ..." " $ death    : num [1:450] 1 1 1 0 1 0 0 0 0 0 ..." " $ angina   : num [1:450] 0 0 0 0 0 0 0 0 0 1 ..." ...




  
  
# __________|------  
# @@ END-----  
