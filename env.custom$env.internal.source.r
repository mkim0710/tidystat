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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")){if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env.custom\$path ====
# path2look = "/"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "~"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "."; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
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
# env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$current.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$current.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$current.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$current.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$current.path.filename.ext);
# }
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  



if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)


if(!"info" %in% names(env.custom)) env.custom$info = list()
# if(!"source" %in% names(env.custom)) env.custom$source = list()
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github_blob"; object = "https://github.com/mkim0710/tidystat/blob/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
# objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
# objectname = "path4read"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
# objectname = "path4write"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; at("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
# objectname = "path0"; object = file.path("D:", "OneDrive", "[][Rproject]"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path4read"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path4write"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
library(tidyverse)
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
# object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# if (.Platform$OS.type == "windows") {object = file.path("D:", "OneDrive", "[][Rproject]")} else if (dir.exists("/home/rstudio")) {object = "/home/rstudio"} else {object = dirname(getwd())}; 
# object = ifelse(dir.exists(file.path("D:","OneDrive","[][Rproject]")), file.path("D:","OneDrive","[][Rproject]"), ifelse(dir.exists("/home/rstudio"), "/home/rstudio", ifelse(dir.exists("/cloud"), "/cloud", dirname(getwd()))))


#% f_path0.list_path_hierarchy =======
# source("https://github.com/mkim0710/tidystat/raw/master/internal.f_path0.list_path_hierarchy.source.r")
sourcename = "internal.f_path0.list_path_hierarchy"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))


max_hierarchy = 3
env.custom$path$list_path_hierarchy = env.custom$path$f_path0.list_path_hierarchy(path0 = env.custom$path$path0, path_last = getwd(), max_hierarchy = max_hierarchy, print.intermediate = FALSE)
for (i in 1:(max_hierarchy)) {
    env.custom$path[[paste0("path", i)]] = env.custom$path$list_path_hierarchy[[i+1]]
}

if(!"tmp" %in% names(env.custom)) env.custom$tmp = list()

# cat("> str(env.custom$path$list_path_hierarchy)\n"); str(env.custom$path$list_path_hierarchy)
# cat("> str(env.custom$path)\n"); str(env.custom$path)    

#@ end -----
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env.custom$env.internal.source.r"))
# # source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env.custom$env.internal.source.r"))

# #@ source(file.path(env.custom$path$source_base,"",paste0(sourcename,".source.r"))); ----

# objectname = "get_system_info";

# #  source(file.path(env.custom$path$source_base,"",paste0(objectname,".source.r"))); 


