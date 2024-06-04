# sourcename = "env1$env.internal"
# env1$env.internal.dev.r
# env1$env.internal.source.r
#         https://github.com/mkim0710/tidystat/blob/master/env1$env.internal.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/env1$env.internal.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.dev.r")
# "D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
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
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "env1$env.internal"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$subpath = subpath
env1$path$sourcename = sourcename
env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
cat("# ",'sourcename = "',sourcename,'"', "\n",
    "# ",sourcename,".dev.r", "\n",
    "# ",sourcename,".source.r", "\n",
    '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
    '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
    '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
    '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
    '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
    '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.dev.r,'"))', "\n",
    '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.dev.Rmd,'"))', "\n",
    '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
    sep="")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
    # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
    # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
    file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
    file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  




if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
# env1 = env1 %>% as.environment
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()
if(!"info" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$info <- list()
# if(!"source" %in% names(env1)) env1$source = list()
if(!"path" %in% names(env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
    env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)  
}  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "\n", sep="")};
objectname = "path4read"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "\n", sep="")};
objectname = "path4write"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "\n", sep="")};
objectname = "path0"; object = file.path("D:", "OneDrive", "[][Rproject]"); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "\n", sep="")};





# #@ attach(env1$path) --------
# attach(env1$path)
# if (dirname(getwd) == path0) {
#     path1 = getwd; path2 = NA; path3 = NA; 
# } else if (dirname(dirname(getwd)) == path0) {
#     path1 = dirname(getwd); path2 = getwd; path3 = NA; 
# } else if (dirname(dirname(dirname(getwd))) == path0) {
#     path1 = dirname(dirname(getwd)); path2 = dirname(getwd); path3 = getwd; 
# } else {
#     path1 = NA; path2 = NA; path3 = NA; 
# }
# # cat("path1: ", path1, "\n", "path2: ", path2, "\n", "path3: ", path3, "\n", sep="")
# # > cat("path1: ", path1, "\n", "path2: ", path2, "\n", "path3: ", path3, "\n", sep="")
# # path1: D:/OneDrive/[][Rproject]/github_tidystat
# # path2: D:/OneDrive/[][Rproject]/github_tidystat/Rdev
# # path3: NA
# 
# #@ detach(env1$path) --------
# detach(env1$path)
# 






#% f_path0.list_path_hierarchy =======
f_path0.list_path_hierarchy <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
    # Initialize a list to hold the path hierarchy
    list_path <- list()
    
    # Initialize a variable to keep track of the previous directory
    prev_dir <- ""
    
    # Loop to dynamically check the relationship between path_last and path0
    while (TRUE) {
        list_path <- c(list(path_last), list_path)  # Prepend the current path to the hierarchy
        if (print.intermediate) {
            cat("> # Current path: ", path_last, "\n")
            # cat("Current list_path: ", toString(list_path), "\n\n")
            cat("> str(list_path)\n"); str(list_path)
        }
        
        # Check if we have reached path0 or if path_last does not change (indicating the root directory)
        if (path_last == path0 || path_last == prev_dir) {
            break
        }

        # Update prev_dir to the current directory before changing path_last
        prev_dir <- path_last
        path_last <- dirname(path_last)  # Update path_last to its parent directory
    }
    
    # Ensure the list is of length max_hierarchy, filling excess with NA
    list_path_hierarchy <- list_path[1:min(max_hierarchy, length(list_path))]
    if (length(list_path_hierarchy) < max_hierarchy) {
        list_path_hierarchy <- c(list_path_hierarchy, rep(NA, max_hierarchy - length(list_path_hierarchy)))
    }
    
    return(list_path_hierarchy)
}


# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
max_hierarchy <- 5
list_path_hierarchy <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = TRUE)
str(list_path_hierarchy)
# > list_path_hierarchy <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = TRUE)
# > # Current path:  D:/OneDrive/[][Rproject]/github_tidystat/Rdev 
# > str(list_path)
# List of 1
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
# > # Current path:  D:/OneDrive/[][Rproject]/github_tidystat 
# > str(list_path)
# List of 2
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
# > # Current path:  D:/OneDrive/[][Rproject] 
# > str(list_path)
# List of 3
#  $ : chr "D:/OneDrive/[][Rproject]"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
# > str(list_path_hierarchy)
# List of 5
#  $ : chr "D:/OneDrive/[][Rproject]"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
#  $ : logi NA
#  $ : logi NA






#@ end ----
str(env1$path)

#@ end -----
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env1$env.internal.source.r"))
# # source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env1$env.internal.source.r"))

# #@ source(file.path(env1$path$source_base,"",paste0(sourcename,".source.r")))----
# objectname = "get_system_info"
# source(file.path(env1$path$source_base,"",paste0(objectname,".source.r")))


