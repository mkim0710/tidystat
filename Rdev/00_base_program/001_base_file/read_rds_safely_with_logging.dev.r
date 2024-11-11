# .sourcename = "read_rds_safely_with_logging" |> paste0(".source.r")
# read_rds_safely_with_logging.dev.r
# read_rds_safely_with_logging.source.r
# utils::browseURL("/Rdev/00_base_program/read_rds_safely_with_logging.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/00_base_program/read_rds_safely_with_logging.source.r"))
# # source("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.dev.r")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.dev.Rmd")
# file.edit("~/github_tidystat/Rdev/00_base_program/read_rds_safely_with_logging.source.r")
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
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(isTRUE(options()$function.reload) || !.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$lastSourceEditorContext.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$lastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.set_lastSourceEditorContext.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$lastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$lastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext))
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  





#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  
.subpath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "read_rds_safely_with_logging" |> paste0(".source.r")
### \% source( file.path(env1$path$source_base,.subpath_filename.source.r) ) ----  
.subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
if(isTRUE(options()$function.reload) || !.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.subpath = .subpath
.sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root  
env1$path$.subpath_filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath_filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath_filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath_filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath_filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath_filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'"); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'"); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'"); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext));', "  \n",
    sep="")
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

# Function to log file availability
log_file_availability <- function(path) {
  if (file.exists(path)) {
    cat(format.POSIXct(Sys.time(), usetz = TRUE), " - File exists\n")
  } else {
    cat(format.POSIXct(Sys.time(), usetz = TRUE), " - File does not exist\n")
  }
}

.path4read = paste0(env1$path$path1,"/data")
.objectname = "fhs.index100"
paste0(.path4read,"/",.objectname,".rds")
log_file_availability(paste0(.path4read,"/",.objectname,".rds"))
try(assign( "DataSet", read_rds(paste0(.path4read,"/",.objectname,".rds")) ))
# error?
path_filename.ext = paste0(.path4read,"/",.objectname,".rds")
path_filename.ext
log_file_availability(path_filename.ext)
try(assign( "DataSet", read_rds(path_filename.ext) ))



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
.path4read = paste0(env1$path$path1,"/data")
.objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(.path4read,"/",.objectname,".rds")
log_file_availability(paste0(.path4read,"/",.objectname,".rds"))
try(assign( "DataSet", read_rds(paste0(.path4read,"/",.objectname,".rds")) ))
# error?
path_filename.ext = paste0(.path4read,"/",.objectname,".rds")
path_filename.ext
log_file_availability(path_filename.ext)
try(assign( "DataSet", read_rds(path_filename.ext) ))



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
.path4read = paste0(env1$path$path1,"/data")
.objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(.path4read,"/",.objectname,".rds")
log_file_availability(paste0(.path4read,"/",.objectname,".rds"))
try(assign( .objectname, read_rds(paste0(.path4read,"/",.objectname,".rds")) ))
# error?
path_filename.ext = paste0(.path4read,"/",.objectname,".rds")
path_filename.ext
log_file_availability(path_filename.ext)
try(assign( .objectname, read_rds(path_filename.ext) ))



# # .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # .objectname = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# rm(".path4read")
# rm(".objectname")
# .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# .path4read = "./data"
# .objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# paste0(.path4read,"/",.objectname,".rds")
# file.exists(paste0(.path4read,"/",.objectname,".rds"))
# assign( .objectname, read_rds(normalizePath(paste0(.path4read,"/",.objectname,".rds"))) )
# # > paste0(.path4read,"/",.objectname,".rds")
# # [1] "./data/CohortGJ0910.BaselineJKGJ2085NoHx...01.rds"
# # > file.exists(paste0(.path4read,"/",.objectname,".rds"))
# # [1] FALSE
# # > assign( .objectname, read_rds(normalizePath(paste0(.path4read,"/",.objectname,".rds"))) )
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

.path4read = paste0(env1$path$path1,"/data")
.objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(.path4read,"/",.objectname,".rds")
file.exists(paste0(.path4read,"/",.objectname,".rds"))
assign( .objectname, read_rds_safely_with_logging(paste0(.path4read,"/",.objectname,".rds")) )



