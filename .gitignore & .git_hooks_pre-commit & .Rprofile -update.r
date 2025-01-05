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
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r))
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
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .subpath, .filename.source.r ======  



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \$ .gitignore -----  
# # ".gitignore" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# # ".gitignore" |> env1$env.internal.attach$f_file.edit_vscode()
# .file2edit = ".gitignore" ; if (Sys.info()["sysname"] == "Windows") { .file2edit |> env1$env.internal.attach$f_file.edit_vscode() } else { if(file.exists(.file2edit)) {.file2edit %>% { .[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))} }
# .file2edit = ".git/hooks/pre-commit" ; if (Sys.info()["sysname"] == "Windows") { .file2edit |> env1$env.internal.attach$f_file.edit_vscode() } else { if(file.exists(.file2edit)) {.file2edit %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))} }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \% f_path_file.BACKUP_copy_overwrite -----  
f_path_file.BACKUP_copy_overwrite = function(.overwrite_from_path, .overwrite_from_filename_ext, .vec_destination_paths, VERBOSE = FALSE, restrict_execution_path = "D:/OneDrive/[][Rproject]/github_tidystat", createFile = FALSE) {
    .vec_destination_paths = .vec_destination_paths |> unique()
    .overwrite_from_path_filename_ext = paste0(.overwrite_from_path, "/", .overwrite_from_filename_ext)
    # if (basename(getwd()) == "github_tidystat") {
    if (getwd() |> normalizePath(winslash="/",mustWork=NA) %in% restrict_execution_path) {
        env1$env.internal.attach$f_filename_ext.createBACKUP(BACKUP_from_path_filename_ext = paste0(.vec_destination_paths, "/", .overwrite_from_filename_ext) |> keep(file.exists) |> first(default = ""), .BACKUP_to_path = paste0(env1$path$path0,"/-BACKUP"), timeFormat = "%y%m%d") 
        for (.destination_path in unique(.vec_destination_paths)) {
            if(VERBOSE) cat(".destination_path: ", .destination_path, "\n", sep="")
            .destination_path_filename_ext = paste0(.destination_path, "/", .overwrite_from_filename_ext) 
            env1$env.internal.attach$f_path_path.BACKUP.overwrite(.overwrite_from_path_filename_ext=.overwrite_from_path_filename_ext, .destination_path_filename_ext=.destination_path_filename_ext, .BACKUP_to_path=NULL, timeFormat = "%y%m%d", createFile = createFile)
        }
    } else {
        stop("The run from github_tidystat as the working directory")
    }
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \$ vec_Rproject_names.gitignore_update -----  
vec_Rproject_names.gitignore_update = c("Rproject_MH", "Rproject_Rmd", "Rproject_KoGES_AA10030")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_filename_ext = ".gitignore" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_filename_ext = ".gitignore"
.vec_destination_paths = c(
    env1$path$path0
    , "~" 
    , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , "D:/OneDrive/MHShell"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_filename_ext, .vec_destination_paths, VERBOSE = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_filename_ext = ".gitattributes" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_filename_ext = ".gitattributes"
.vec_destination_paths = c(
    env1$path$path0
    , "~" 
    , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , "D:/OneDrive/MHShell"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_filename_ext, .vec_destination_paths, VERBOSE = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_filename_ext = ".Rprofile" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_filename_ext = ".Rprofile"
.vec_destination_paths = c(
    env1$path$path0
    , "~" |> normalizePath(winslash="/",mustWork=NA)
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_filename_ext, .vec_destination_paths, VERBOSE = TRUE, createFile = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_filename_ext = "git/hooks/pre-commit" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat/git/hooks"
.overwrite_from_filename_ext = "pre-commit"
.vec_destination_paths = c(
    "D:/OneDrive/[][Rproject]/github_tidystat/.git/hooks"
    , "D:/OneDrive/MHShell/.git/hooks"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update,"/git/hooks")
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update,"/.git/hooks")
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_filename_ext, .vec_destination_paths, VERBOSE = TRUE)
if(.Platform$OS.type == "unix") {
    for (.destination_path in paste0("../",vec_Rproject_names.gitignore_update,"/.git/hooks")) {
        .destination_path_filename_ext = paste0(.destination_path, "/", .overwrite_from_filename_ext) 
        if (file.exists(.destination_path_filename_ext)) { paste0("chmode +x ",.destination_path_filename_ext) |> system(intern=TRUE) |> try() }
    }
}
# In Windows, you don't need to explicitly set executable permissions on the hook script because Git for Windows will execute the script as long as it has the correct shebang (#!/bin/sh) and is located in the correct directory (.git/hooks).
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.BACKUP_to_path = paste0(env1$path$path0,"/-BACKUP")
cat('%windir%\\explorer.exe "',.BACKUP_to_path|>normalizePath(winslash="\\"),'"',"  \n", sep="")
if(Sys.info()["sysname"] == "Windows") {browseURL(.BACKUP_to_path)}
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
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

