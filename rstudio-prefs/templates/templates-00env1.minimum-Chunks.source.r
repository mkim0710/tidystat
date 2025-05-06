.FileName.source.r = "templates-00env1.minimum-Chunks" |> paste0(".source.r")  
if(Sys.getenv("VERBOSE")==TRUE) { print(paste0('Sourcing: "',.FileName.source.r,'"')) }  
# rstudio-prefs/templates/f_df.t.tribble_construct.dev.r  
# rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd  
# rstudio-prefs/templates/f_df.t.tribble_construct.source.r  
# # source("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r")  
# # if(!file.exists("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.r")  
# # if(!file.exists("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd")  
# # if(!file.exists("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r")  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.r"); if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt));  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd"); if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt));  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r"); if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt));  
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
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ====  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# env1$f$showSymbolPaths()
# env1$f$showProjectPathFiles()
# env1$f$showProjectPathsRecursively()
# env1$env.internal$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 〚〛 SOURCE) -----  
# ### § .RelativeSubPath, .FileName.source.r ======  
# # .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") {.RelativeSubPath = .LastSourceEditorContext.path_FileNameExt |> dirname(); ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO() }
# # if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# # .FileName.source.r = "default.template" |> paste0(".source.r")
# if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") {.FileName.source.r = .LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".FileName.source.r" |> env1$f$f_ObjectName.get.dput.ECHO() }
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# env1$path$.RelativeSubPath = .RelativeSubPath
# if(!exists(".SourceName_root") && exists(".FileName.source.r")) .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
# if(exists(".SourceName_root") && !exists(".FileName.source.r")) .FileName.source.r = .SourceName_root |> paste0(".source.r")
# env1$path$.SourceName_root = .SourceName_root
# env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
# env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
# env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".source.r")
# cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
#     "# ",env1$path$.RelativeSubPath_FileName.dev.r, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.source.r, "  \n",
#     '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'"); if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'"); if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'"); if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt));', "  \n",
#     sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 〚〛 Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ env1$env.internal functions ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$ RmdChunk.updateTemplateNotebook =  ----  
.tmp$objectname = "RmdChunk.updateTemplateNotebook"
.tmp$object = function(.LastSourceEditorContext.path_FileNameExt = env1$path$LastSourceEditorContext.path_FileNameExt) {
    # ⸿ update tempate (notebook.Rmd) ----  
    env1$path$RTemplate.FileNameExt = "notebook.Rmd"  
    env1$path$MyTemplate.FileNameExt = "templates-00env1.minimum.Rmd"  
    if (Sys.info()["sysname"] == "Windows") {
        if(basename(.LastSourceEditorContext.path_FileNameExt) == env1$path$MyTemplate.FileNameExt) {
            if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = normalizePath(file.path(Sys.getenv("APPDATA"), "RStudio"),winslash="/") |> str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = normalizePath("~/.config/rstudio")} 
            .destination_path = file.path(.path4APPDATA_RStudio, "templates"); if(!dir.exists(.destination_path)) dir.create(.destination_path, recursive=TRUE) ; cat('browseURL("',.destination_path,'")',"  \n", sep="") 
            .destination_path_FileNameExt = file.path(.destination_path, env1$path$RTemplate.FileNameExt)
            .BACKUP_to_path = file.path(env1$path$path0, "-BACKUP") ; env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = .destination_path_FileNameExt, .BACKUP_to_path=.BACKUP_to_path) 
            if(Sys.info()["sysname"] == "Windows") {browseURL(.BACKUP_to_path)}
            
            if(file.copy(from=.LastSourceEditorContext.path_FileNameExt, to=.destination_path_FileNameExt, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_FileNameExt)) else warning(paste0("Update failed: ", .destination_path_FileNameExt))
            # if (Sys.info()["sysname"] == "Windows") {paste0("notepad.exe"," ",shQuote(.destination_path_FileNameExt)) |> shell(wait=FALSE)} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path_FileNameExt),wait=FALSE)}  
            
            for ( .destination_path_FileNameExt in c(
                file.path(env1$path$source_base_local, "rstudio-prefs", "templates", env1$path$MyTemplate.FileNameExt)
                , file.path(env1$path$path0, "Rproject_Rmd", env1$path$MyTemplate.FileNameExt)
            )) {if(dir.exists(dirname(.destination_path_FileNameExt)) & .LastSourceEditorContext.path_FileNameExt|>normalizePath(winslash="/",mustWork=NA) != .destination_path_FileNameExt) {
                if(file.copy(from=.LastSourceEditorContext.path_FileNameExt, to=.destination_path_FileNameExt, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_FileNameExt)) else warning(paste0("Update failed: ", .destination_path_FileNameExt))
                # if (Sys.info()["sysname"] == "Windows") {paste0("notepad.exe"," ",shQuote(.destination_path_FileNameExt)) |> shell(wait=FALSE)} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path_FileNameExt),wait=FALSE)}  
            }}
            if(!is.null(.LastSourceEditorContext.path_FileNameExt)) if(.LastSourceEditorContext.path_FileNameExt != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_FileNameExt))
        }
        # if(!file.exists(file.path(.path4APPDATA_RStudio, "templates", env1$path$RTemplate.FileNameExt))) file.create(file.path(.path4APPDATA_RStudio, "templates", env1$path$MyTemplate.FileNameExt)); file.edit(file.path(.path4APPDATA_RStudio, "templates", env1$path$RTemplate.FileNameExt))
    } 
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ env1$f functions ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  




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
# 〚〛 END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ls.str(env1) #-----  
# ls.str(env1$env.internal) #-----  
