.filename.source.r = "templates-00env1.minimum-Chunks" |> paste0(".source.r")  
if(Sys.getenv("VERBOSE")==TRUE) { print(paste0('Sourcing: "',.filename.source.r,'"')) }  
# rstudio-prefs/templates/f_df.t.tribble_construct.dev.r  
# rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd  
# rstudio-prefs/templates/f_df.t.tribble_construct.source.r  
# # source("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r")  
# # if(!file.exists("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.r")  
# # if(!file.exists("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd")  
# # if(!file.exists("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r")  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.r"); if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext));  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.dev.Rmd"); if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext));  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/f_df.t.tribble_construct.source.r"); if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext));  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
## .GlobalEnv$.tmp = list() ====  
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
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .LastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
# ### @ .subpath, .filename.source.r ======  
# # .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") {.subpath = .LastSourceEditorContext.path_filename.ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# # if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# # .filename.source.r = "default.template" |> paste0(".source.r")
# if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") {.filename.source.r = .LastSourceEditorContext.path_filename.ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".filename.source.r" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# env1$path$.subpath = .subpath
# if(!exists(".sourcename_root") && exists(".filename.source.r")) .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
# if(exists(".sourcename_root") && !exists(".filename.source.r")) .filename.source.r = .sourcename_root |> paste0(".source.r")
# env1$path$.sourcename_root = .sourcename_root
# env1$path$.subpath_filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
# env1$path$.subpath_filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
# env1$path$.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".source.r")
# cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
#     "# ",env1$path$.subpath_filename.dev.r, "  \n",
#     "# ",env1$path$.subpath_filename.dev.Rmd, "  \n",
#     "# ",env1$path$.subpath_filename.source.r, "  \n",
#     '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath_filename.source.r,'"))', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'"); if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'"); if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'"); if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext));', "  \n",
#     sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # \% source( file.path(env1$path$source_base,.subpath_filename.source.r) ) ----
# .subpath_filename.source.r = .filename.source.r %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# if(isTRUE(options()$function.reload) || !.filename.source.r %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.filename.source.r]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.filename.source.r]])}
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ env1$env.internal functions ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$ RmdChunk.updateTemplateNotebook =  ----  
.tmp$objectname = "RmdChunk.updateTemplateNotebook"
.tmp$object = function(.LastSourceEditorContext.path_filename.ext = env1$path$LastSourceEditorContext.path_filename.ext) {
    # @@ update tempate (notebook.Rmd) ----  
    env1$path$RTemplate.filename.ext = "notebook.Rmd"  
    env1$path$MyTemplate.filename.ext = "templates-00env1.minimum.Rmd"  
    if (Sys.info()["sysname"] == "Windows") {
        if(basename(.LastSourceEditorContext.path_filename.ext %>% {paste0(env1$path$path1,"/",.)}) == env1$path$MyTemplate.filename.ext) {
            if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = normalizePath(file.path(Sys.getenv("APPDATA"), "RStudio"),winslash="/") |> str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = normalizePath("~/.config/rstudio")} 
            .destination_path = file.path(.path4APPDATA_RStudio, "templates"); if(!dir.exists(.destination_path)) dir.create(.destination_path, recursive=TRUE) ; cat('browseURL("',.destination_path,'")',"  \n", sep="") 
            .destination_path_filename.ext = file.path(.destination_path, env1$path$RTemplate.filename.ext)
            .backup_to_path = file.path(env1$path$path0, "-backup") ; env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = .destination_path_filename.ext, .backup_to_path=.backup_to_path) 
            if(Sys.info()["sysname"] == "Windows") {browseURL(.backup_to_path)}
            
            if(file.copy(from=.LastSourceEditorContext.path_filename.ext %>% {paste0(env1$path$path1,"/",.)}, to=.destination_path_filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_filename.ext)) else warning(paste0("Update failed: ", .destination_path_filename.ext))
            # if (Sys.info()["sysname"] == "Windows") {shell( paste0("notepad.exe"," ",shQuote(.destination_path_filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path_filename.ext),wait=FALSE)}  
            
            for ( .destination_path_filename.ext in c(
                file.path(env1$path$source_base_local, "rstudio-prefs", "templates", env1$path$MyTemplate.filename.ext)
                , file.path(env1$path$path0, "Rproject_Rmd", env1$path$MyTemplate.filename.ext)
            )) {if(dir.exists(dirname(.destination_path_filename.ext)) & .LastSourceEditorContext.path_filename.ext %>% {paste0(env1$path$path1,"/",.)}|>normalizePath(winslash="/") != .destination_path_filename.ext) {
                if(file.copy(from=.LastSourceEditorContext.path_filename.ext %>% {paste0(env1$path$path1,"/",.)}, to=.destination_path_filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_filename.ext)) else warning(paste0("Update failed: ", .destination_path_filename.ext))
                # if (Sys.info()["sysname"] == "Windows") {shell( paste0("notepad.exe"," ",shQuote(.destination_path_filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path_filename.ext),wait=FALSE)}  
            }}
            if(!is.null(.LastSourceEditorContext.path_filename.ext)) if(.LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",.LastSourceEditorContext.path_filename.ext))
        }
        # if(!file.exists(file.path(.path4APPDATA_RStudio, "templates", env1$path$RTemplate.filename.ext))) file.create(file.path(.path4APPDATA_RStudio, "templates", env1$path$MyTemplate.filename.ext)); file.edit(file.path(.path4APPDATA_RStudio, "templates", env1$path$RTemplate.filename.ext))
    } 
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
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
# @@ END -----  
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
