##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in env1$env.internal.source.r ----

#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
# if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) } 
### .GlobalEnv$env1$env.internal = new.env() ---  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ---  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$source = list() ---  
.sublistname = "source"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$info = list() ---  
.sublistname = "info"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$f = list() ---  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$path = list() ---  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "source_base_local"; .tmp$object = Filter(dir.exists, paste0(c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "~"), "/github_tidystat"))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  

if(!".path4read" %in% names(env1$path)) {.path4read = env1$path$.path4read = env1$path$path1}  
if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = ifelse("LastSourceEditorContext.path" %in% names(env1$path), env1$path$LastSourceEditorContext.path, env1$path$path1)}  
##________________________________________________________________________________  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$ env1\$env.internal\$f_file2.compare ====  
# Function to compare two source code files chunk-by-chunk using while loop with a chunk size of 64KB
#| moved f_file2.compare() to env1$env.internal.source.r


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ env1\$env.internal\$f_url_destfile.DownloadIfDifferent ====  
# Function to download a file only if the web file is different from the local file
#| moved f_url_destfile.DownloadIfDifferent() to env1$env.internal.source.r



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ env1\$f\$f.updateTemplates ====  
# https://github.com/mkim0710/f.updateTemplates.exe.r
#| moved f.updateTemplates() to env1$env.internal.source.r

env1$f$f.updateTemplates()


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Not yet included in env1$env.internal.source.r ----
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## |> rstudioapi::addTheme(apply=TRUE, force=TRUE) ====  
"https://raw.githubusercontent.com/mattia-liuzzo/RStudio-VScode-theme/main/rs-vscode.rstheme" %>% rstudioapi::addTheme(apply=TRUE, force=TRUE)

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## f.update_rstudio_prefs() ====  
env1$env.internal$f.update_rstudio_prefs = function(.file.copy.from = NULL, .file.copy.to = NULL) {
    .CodeText = '.Platform$OS.type'; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
    .CodeText = 'Sys.info()["sysname"]'; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
    
    if(.Platform$OS.type == "unix") {
        if(Sys.info()["sysname"] == "Linux") {
            if (is.null(.file.copy.from)) {
                if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
                    .file.copy.from = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40Rocker%40MAGB760M13700KF-240520.json"
                } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
                    .file.copy.from = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH241015copilot-false.json"
                }
            }
            if (is.null(.file.copy.to)) {
                .file.copy.to = "~/.config/rstudio/rstudio-prefs.json"
            }
            UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
        } else if(Sys.info()["sysname"] == "Darwin") {
            if (is.null(.file.copy.from)) {
                warning("f.update_rstudio_prefs() not available for macOS")
            }
        }
    } else if(Sys.info()["sysname"] == "Windows") {
        if (is.null(.file.copy.from)) {
            warning("f.update_rstudio_prefs() not available for windows")
        }
    }
}
env1$env.internal$f.update_rstudio_prefs()

