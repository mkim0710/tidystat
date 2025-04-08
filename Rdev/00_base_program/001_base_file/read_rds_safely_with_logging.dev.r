# .FileName.source.r = "read_rds_safely_with_logging" |> paste0(".source.r")
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# env1$f$MH_shortcuts()
# env1$f$openWorkingFilesList()
# env1$f$showCodeText2restartSession.pending()
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# env1$f$showPathSymbols()
# env1$f$showProjectPathFiles()
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





#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "read_rds_safely_with_logging" |> paste0(".source.r")
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
try(assign( "DS", read_rds(paste0(.path4read,"/",.objectname,".rds")) ))
# error?
path_FileNameExt = paste0(.path4read,"/",.objectname,".rds")
path_FileNameExt
log_file_availability(path_FileNameExt)
try(assign( "DS", read_rds(path_FileNameExt) ))



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
.path4read = paste0(env1$path$path1,"/data")
.objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(.path4read,"/",.objectname,".rds")
log_file_availability(paste0(.path4read,"/",.objectname,".rds"))
try(assign( "DS", read_rds(paste0(.path4read,"/",.objectname,".rds")) ))
# error?
path_FileNameExt = paste0(.path4read,"/",.objectname,".rds")
path_FileNameExt
log_file_availability(path_FileNameExt)
try(assign( "DS", read_rds(path_FileNameExt) ))



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
.path4read = paste0(env1$path$path1,"/data")
.objectname = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
paste0(.path4read,"/",.objectname,".rds")
log_file_availability(paste0(.path4read,"/",.objectname,".rds"))
try(assign( .objectname, read_rds(paste0(.path4read,"/",.objectname,".rds")) ))
# error?
path_FileNameExt = paste0(.path4read,"/",.objectname,".rds")
path_FileNameExt
log_file_availability(path_FileNameExt)
try(assign( .objectname, read_rds(path_FileNameExt) ))



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



