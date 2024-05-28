# # sourcename = "env.custom$env.internal"
# # env.custom$env.internal.dev.r
# # env.custom$env.internal.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/env.custom$env.internal.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/env.custom$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.dev.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote() |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env.custom.minimum.Rmd" |> shQuote() |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env.custom\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); env.custom$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env.custom$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# # @ subpath, sourcename ======
# subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
# sourcename = "env.custom$env.internal"
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$subpath = subpath
# env.custom$path$sourcename = sourcename
# env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
# env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
# env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# cat("# ",'sourcename = "',sourcename,'"', "\n",
#     "# ",sourcename,".dev.r", "\n",
#     "# ",sourcename,".source.r", "\n",
#     '# utils::browseURL("',env.custom$path$source_base_local,"/",env.custom$path$subpath,'")', "\n",
#     '# utils::browseURL("',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env.custom$path$source_base,"/","',env.custom$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$CurrentSource.path.filename.ext);
# }
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$env.internal <- new.env()
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \% f_file.edit ====
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### \% f_file.edit_windows ====
env.custom$env.internal$ f_file.edit_windows <- function(file2edit) {
  shell.exec(shQuote(file2edit))
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### \% f_file.edit_notepad ====
env.custom$env.internal$ f_file.edit_notepad <- function(file2edit) {
  if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(file2edit)) )} else {warning("This function is only available in Windows.")}
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### \% f_file.edit_vscode ====
env.custom$env.internal$ f_file.edit_vscode <- function(file2edit) {
  if (.Platform$OS.type == "windows") {path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/"); shell( paste0('cmd /c ""',path4editor, '" "',file2edit, '""')  )}
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### \% f_file.systemStart ====
# Function to open files with the system's default application (fallback)
env.custom$env.internal$f_file.systemStart <- function(file) {
    system(paste("start", shQuote(file)), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### \% f_file_PDF.sumatra ====
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.dev.r")
# Function to open PDF with Sumatra PDF
env.custom$env.internal$f_file_PDF.sumatra <- function(
        file,
        path.SumatraPDF.exe = NULL,
        ...
) {
    potentialPaths <- c(
        file.path(Sys.getenv("LOCALAPPDATA"), "SumatraPDF", "SumatraPDF.exe"),
        file.path(Sys.getenv("APPDATA"), "SumatraPDF", "SumatraPDF.exe"),
        file.path(sub("rstudio.exe$", "", Sys.getenv("RSTUDIO_DESKTOP_EXE")), "resources/app/bin/sumatra/SumatraPDF.exe")
    )
    # If path.SumatraPDF.exe is not provided, find the first existing path from the list
    if (is.null(path.SumatraPDF.exe)) { path.SumatraPDF.exe <- potentialPaths[which(file.exists(potentialPaths))[1]] }
    # If no valid Sumatra executable found, use the system default application
    if (is.null(path.SumatraPDF.exe) || !file.exists(path.SumatraPDF.exe)) {
        warning("SumatraPDF.exe not found. Opening file with the system default viewer instead.", call. = FALSE)
        return(invisible(env.custom$env.internal$f_file.systemStart(file)))
    }
    file <- normalizePath(file, winslash = "/", mustWork = FALSE)
    path.SumatraPDF.exe <- normalizePath(path.SumatraPDF.exe, winslash = "/", mustWork = FALSE)
    if (!file.exists(file)) {
        stop(paste("The following file doesn't exist:", file))
    }
    # Ignore non-PDF files
    pdf <- grepl(".pdf$", file)
    if (any(!pdf)) {
        warning("Ignoring non-PDF file", paste(file[!pdf], collapse = ", "))
        file <- file[pdf]
    }
    if (length(file) < 1) return("No files were left to open with SumatraPDF.exe")
    # Construct the command to open SumatraPDF
    sumafile <- paste(shQuote(c(path.SumatraPDF.exe, file)), collapse = " ")
    out <- try(system(sumafile, wait = FALSE, ...), silent = TRUE)
    return(invisible(out))
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \% f_filename.ext.createBackup ====
env.custom$env.internal$ f_filename.ext.createBackup = function(backup_from_path.filename.ext, backup_from_ext = NA, backup_to_path = file.path(env.custom$path$path0, "-backup"), timeFormat = "%y%m%d_%H%M", overwrite=TRUE) {
    if(is.na(backup_from_ext)) {
        backup_from_path.filename = basename(backup_from_path.filename.ext) |> str_remove("\\.([[:alnum:]]+)$")
        backup_from_ext = basename(backup_from_path.filename.ext) |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    } else {
        backup_from_path.filename = basename(backup_from_path.filename.ext) |> str_remove(paste0("\\.",backup_from_ext|>str_replace_all("\\.","\\\\."),"$"))
    }
    
    backup_to_path.filename.ext = file.path( backup_to_path, paste0(backup_from_path.filename,"-",format(Sys.time(),timeFormat),".",backup_from_ext) )
    if(!dir.exists(backup_to_path)) dir.create(backup_to_path, recursive = TRUE)
    file.copy(from=backup_from_path.filename.ext, to=backup_to_path.filename.ext, overwrite=overwrite); message(paste0("Backup file created: ",backup_to_path.filename.ext))
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \% f_path_path.backup.overwrite ====
env.custom$env.internal$ f_path_path.backup.overwrite <- function(overwrite_from_path.filename.ext, destination_path.filename.ext, backup_to_path = dirname(destination_path.filename.ext), timeFormat = "%y%m%d") {
    if(file.exists(destination_path.filename.ext)) {
        env.custom$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = destination_path.filename.ext, backup_to_path=backup_to_path, timeFormat=timeFormat) ; 
        cat('browseURL("',backup_to_path,'")',"\n", sep="") ; 
        if(file.copy(from=overwrite_from_path.filename.ext, to=destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", destination_path.filename.ext)) else warning(paste0("Update failed: ", destination_path.filename.ext));
    } else {warning(paste0("File does not exist: ", destination_path.filename.ext))}
}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
if(!"info" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$info <- list()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# if(!"source" %in% names(env.custom)) env.custom$source = list()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
if(!"path" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
objectname = "source_base_github_blob"; object = "https://github.com/mkim0710/tidystat/blob/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
# objectname = "path4read"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
# objectname = "path4write"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; at("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
# objectname = "path0"; object = file.path("D:", "OneDrive", "[][Rproject]"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
objectname = "getwd"; object = getwd(); env.custom$path[[objectname]] = object;
objectname = "path4read"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path4write"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
library(tidyverse)
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env.custom$path[[objectname]] = object;
# object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# if (.Platform$OS.type == "windows") {object = file.path("D:", "OneDrive", "[][Rproject]")} else if (dir.exists("/home/rstudio")) {object = "/home/rstudio"} else {object = dirname(getwd())};
# object = ifelse(dir.exists(file.path("D:","OneDrive","[][Rproject]")), file.path("D:","OneDrive","[][Rproject]"), ifelse(dir.exists("/home/rstudio"), "/home/rstudio", ifelse(dir.exists("/cloud"), "/cloud", dirname(getwd()))))

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \% f_path.is_git_tracked  =======
# Function to check if the current project or any of its parent directories are tracked by Git
env.custom$env.internal$ f_path.is_git_tracked <- function(path = getwd(), check_parents = TRUE) {
    # Normalize the path
    path <- normalizePath(path, winslash = "/", mustWork = TRUE)
    
    # Traverse up the directory tree if check_parents is TRUE
    while (TRUE) {
        # Check if the .git directory exists in the current path
        git_dir <- file.path(path, ".git")
        if (dir.exists(git_dir)) {
            return(git_dir)
        }
        
        # If not checking parent directories, return NA
        if (!check_parents) {
            return(NA)
        }
        
        # Move to the parent directory
        parent_path <- dirname(path)
        
        # If the parent directory is the same as the current directory, we've reached the root
        if (parent_path == path) {
            return(NA)
        }
        
        # Update the current path to the parent path
        path <- parent_path
    }
}

# # Usage example: Check if the current working directory or its parent directories are tracked by Git
# git_path <- is_git_tracked(check_parents = TRUE)
# if (!is.na(git_path)) {
#   message("The current project is tracked by Git at: ", git_path)
# } else {
#   message("The current project is not tracked by Git.")
# }

#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### $ git_path  =======
env.custom$path$git_path = env.custom$env.internal$f_path.is_git_tracked()
# env.custom$path$no_git = is.na(env.custom$path$git_path)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ sourcename = "internal.f_path0.list_path_hierarchy" =======
# source("https://github.com/mkim0710/tidystat/raw/master/internal.f_path0.list_path_hierarchy.source.r")
sourcename = "internal.f_path0.list_path_hierarchy"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### $ list_path_hierarchy  =======
max_hierarchy = 3
env.custom$path$list_path_hierarchy = env.custom$path$f_path0.list_path_hierarchy(path0 = env.custom$path$path0, path_last = getwd(), max_hierarchy = max_hierarchy, print.intermediate = FALSE)
for (i in 1:(max_hierarchy)) {
    env.custom$path[[paste0("path", i)]] = env.custom$path$list_path_hierarchy[[i+1]]
}

# cat("> str(env.custom$path$list_path_hierarchy)\n"); str(env.custom$path$list_path_hierarchy)
# cat("> str(env.custom$path)\n"); str(env.custom$path)    


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env.custom$env.internal.source.r"))
# # source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env.custom$env.internal.source.r"))

# #@ source(file.path(env.custom$path$source_base,"",paste0(sourcename,".source.r"))); ----

# objectname = "get_system_info";

# #  source(file.path(env.custom$path$source_base,"",paste0(objectname,".source.r"))); 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

