# # sourcename = "env.custom$env.internal"
# # env.custom$env.internal.dev.r
# # env.custom$env.internal.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/env.custom$env.internal.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/env.custom$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.dev.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# #|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# objectname = "env.custom$env.internal"
# source_base_local = "D:/OneDrive/[][Rproject]/github_tidystat"
# source_base_github = "https://github.com/mkim0710/tidystat/raw/master"
# source_base_github_blob = "https://github.com/mkim0710/tidystat/blob/master"
# subpath = ""
# sourcename = objectname
# dev.subpath.filename.ext = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
# subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# cat("# ", 'sourcename = "', sourcename, '"', "\n",
#     "# ", sourcename, ".dev.r", "\n",
#     "# ", sourcename, ".source.r", "\n",
#     '#         ', source_base_github_blob,"/",dev.subpath.filename.ext, "\n",
#     '# source("', source_base_github,"/",subpath.filename.source.r,'")', "\n",
#     '# file.edit("', source_base_local,"/",dev.subpath.filename.ext,'")', "\n",
#     '# file.edit("', source_base_local,"/",subpath.filename.source.r,'")', "\n",
#     sep="")
# current.path.filename.ext=rstudioapi::getSourceEditorContext()$path
# if(!file.exists(dev.subpath.filename.ext)) file.create(dev.subpath.filename.ext); file.edit(dev.subpath.filename.ext); file.edit(current.path.filename.ext);
# if(!file.exists(subpath.filename.source.r)) file.create(subpath.filename.source.r); file.edit(subpath.filename.source.r); file.edit(current.path.filename.ext);


# if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)


if(!"info" %in% names(env.custom)) env.custom$info = list()
# if(!"source" %in% names(env.custom)) env.custom$source = list()
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
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
sourcename = "internal.f_path0.list_path_hierarchy"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))


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


