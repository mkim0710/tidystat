#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllcommaPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,subpath.filename.source.r) )
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
if(!"source_base" %in% names(env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### env1\$env.internal ====
sourcename = "env1$env.internal" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,subpath.filename.source.r) )
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### $ .gitignore -----
# ".gitignore" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
# ".gitignore" |> env1$env.internal$f_file.edit_vscode()
file2edit = ".gitignore" ; if (.Platform$OS.type == "windows") { file2edit |> env1$env.internal$f_file.edit_vscode() } else { if(file.exists(file2edit)) {file2edit %>% { .[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})} }
file2edit = ".git/hooks/pre-commit" ; if (.Platform$OS.type == "windows") { file2edit |> env1$env.internal$f_file.edit_vscode() } else { if(file.exists(file2edit)) {file2edit %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})} }
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### \% f_path_file.backup_copy_overwrite -----
f_path_file.backup_copy_overwrite = function(overwrite_from_path, overwrite_from_filename.ext, vec_destination_paths, print.intermediate = FALSE, restrict_execution_path = "D:/OneDrive/[][Rproject]/github_tidystat", createFile = FALSE) {
    vec_destination_paths = vec_destination_paths |> unique()
    overwrite_from_path.filename.ext = paste0(overwrite_from_path, "/", overwrite_from_filename.ext)
    # if (basename(getwd()) == "github_tidystat") {
    if (getwd() |> normalizePath(winslash="/") %in% restrict_execution_path) {
        env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = paste0(vec_destination_paths, "/", overwrite_from_filename.ext) |> keep(file.exists) |> first(default = ""), backup_to_path = paste0(env1$path$path0,"/-backup"), timeFormat = "%y%m%d") 
        for (destination_path in unique(vec_destination_paths)) {
            if(print.intermediate) cat("destination_path: ", destination_path, "\n")
            destination_path.filename.ext = paste0(destination_path, "/", overwrite_from_filename.ext) ; 
            env1$env.internal$f_path_path.backup.overwrite(overwrite_from_path.filename.ext=overwrite_from_path.filename.ext, destination_path.filename.ext=destination_path.filename.ext, backup_to_path=NULL, timeFormat = "%y%m%d", createFile = createFile)
        }
    } else {
        stop("The run from github_tidystat as the working directory")
    }
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### $ vec_Rproject_names.gitignore_update -----
vec_Rproject_names.gitignore_update = c("Rproject_MH", "Rproject_Rmd", "Rproject_KoGES_AA10030")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##### overwrite_from_filename.ext = ".gitignore" ----
overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
overwrite_from_filename.ext = ".gitignore"
vec_destination_paths = c(
    env1$path$path0
    , "~" 
    , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/")
    , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/")
    , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/")
    , "D:/OneDrive/MHShell"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.backup_copy_overwrite(overwrite_from_path, overwrite_from_filename.ext, vec_destination_paths, print.intermediate = TRUE)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##### overwrite_from_filename.ext = ".gitattributes" ----
overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
overwrite_from_filename.ext = ".gitattributes"
vec_destination_paths = c(
    env1$path$path0
    , "~" 
    , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/")
    , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/")
    , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/")
    , "D:/OneDrive/MHShell"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.backup_copy_overwrite(overwrite_from_path, overwrite_from_filename.ext, vec_destination_paths, print.intermediate = TRUE)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##### overwrite_from_filename.ext = ".Rprofile" ----
overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
overwrite_from_filename.ext = ".Rprofile"
vec_destination_paths = c(
    env1$path$path0
    , "~" |> normalizePath(winslash="/")
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.backup_copy_overwrite(overwrite_from_path, overwrite_from_filename.ext, vec_destination_paths, print.intermediate = TRUE, createFile = TRUE)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##### overwrite_from_filename.ext = "git/hooks/pre-commit" ----
overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat/git/hooks"
overwrite_from_filename.ext = "pre-commit"
vec_destination_paths = c(
    "D:/OneDrive/[][Rproject]/github_tidystat/.git/hooks"
    , "D:/OneDrive/MHShell/.git/hooks"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update,"/git/hooks")
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update,"/.git/hooks")
)
f_path_file.backup_copy_overwrite(overwrite_from_path, overwrite_from_filename.ext, vec_destination_paths, print.intermediate = TRUE)
if(.Platform$OS.type == "unix") {
    for (destination_path in paste0("../",vec_Rproject_names.gitignore_update,"/.git/hooks")) {
        destination_path.filename.ext = paste0(destination_path, "/", overwrite_from_filename.ext) ; 
        if (file.exists(destination_path.filename.ext)) { paste0("chmode +x ",destination_path.filename.ext) |> system(intern=TRUE) |> try() }
    }
}
# In Windows, you don't need to explicitly set executable permissions on the hook script because Git for Windows will execute the script as long as it has the correct shebang (#!/bin/sh) and is located in the correct directory (.git/hooks).
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
backup_to_path = paste0(env1$path$path0,"/-backup")
cat('%windir%\\explorer.exe "',backup_to_path|>normalizePath(winslash="\\"),'"',"  \n", sep="")
if(.Platform$OS.type == "windows") {browseURL(backup_to_path)}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
