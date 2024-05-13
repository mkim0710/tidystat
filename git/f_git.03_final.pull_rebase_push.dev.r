# sourcename = "f_git.03_final.pull_rebase_push"
# f_git.03_final.pull_rebase_push.dev.r
# f_git.03_final.pull_rebase_push.source.r
# utils::browseURL("/git/f_git.03_final.pull_rebase_push.dev.r")
# source(paste0(env.custom$path$source_base, "/", "git/f_git.03_final.pull_rebase_push.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.source.r")
# # source("https://github.com/mkim0710/tidystat/raw/master/git/f_git.03_final.pull_rebase_push.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")){if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
## env.custom\$path ====
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"(git)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_git.03_final.pull_rebase_push"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env.custom$path$subpath = subpath
env.custom$path$sourcename = sourcename
env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
cat("# ",'sourcename = "',sourcename,'"', "\n",
    "# ",sourcename,".dev.r", "\n",
    "# ",sourcename,".source.r", "\n",
    '# utils::browseURL("',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
    '# source(paste0(env.custom$path$source_base, "/", "',env.custom$path$subpath.filename.source.r,'"))', "\n",
    '# # source("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    '# # source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
    sep="")
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$current.path.filename.ext);
    # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$current.path.filename.ext);
    # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$current.path.filename.ext);
    file2create = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env.custom$path$current.path.filename.ext);
    file2create = env.custom$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env.custom$path$current.path.filename.ext);
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  