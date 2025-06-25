##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://stackoverflow.com/questions/46819684/how-to-access-and-edit-rprofile  
# file.edit(file.path("~", ".Rprofile")) # edit .Rprofile in HOME  
# file.edit(".Rprofile") # edit project specific .Rprofile   
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ### \% search() @ default Rocker 4.3.3
# search() |> deparse() |> cat("  \n", sep="") 
# c(".GlobalEnv", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")
# 
# ### \% search() @ default Rocker 4.3.3 + library(tidyverse)
# .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# search() |> deparse() |> cat("  \n", sep="") 
# c(".GlobalEnv", "package:lubridate", "package:forcats", "package:stringr", "package:dplyr", "package:purrr", "package:readr", "package:tidyr", "package:tibble", "package:ggplot2", "package:tidyverse", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ?.First() ----  
# https://chatgpt.com/c/1ea6ef8b-322f-4c16-85e7-0b77c2b09a91
# https://chatgpt.com/c/66f11e32-c7e4-800e-98e7-fd11dd546c13
# https://chatgpt.com/c/66f10f41-74a8-800e-aa53-a5b4410ee12a

.t0 = Sys.time()
if(Sys.info()["sysname"] == "Windows") Sys.setlocale("LC_ALL", "en_US.UTF-8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en_US");  # Sys.getenv("LANGUAGE");    # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
# Sys.setenv(VERBOSE = FALSE);  # Sys.getenv("VERBOSE");  
# Sys.setenv(VERBOSE = TRUE);  # Sys.getenv("VERBOSE");  
# options(verbose = FALSE);  # getOption("verbose");  
# options(verbose = TRUE);  # getOption("verbose");  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.First <- function(){  if(interactive()) {
    library(base)
    library(methods)
    library(datasets)
    library(utils)
    library(grDevices)
    library(graphics)
    library(stats)
    .listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }  
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    # for(.packagename in c("tidyverse")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
    # remove.packages(c("tidyverse", "dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr"))
    # for(.packagename in c("tidyverse")) {
    # for(.packagename in c("dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr")) {
    for(.packagename in c("dplyr", "purrr", "stringr")) {
        tryCatch({
            if(!require(.packagename, character.only=TRUE)) stop(paste0("Package ", .packagename, " is not installed. Please install it before running this script.  \n install.packages(",deparse(.packagename),")"))    # install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)   # makes error on Posit.Cloud?
        }, error = function(e) {
            # Additional code to handle the error or provide fallback options
            # Print a warning message but allow R to continue
            warning("Error in .Rprofile: ", e$message, "\n", call. = FALSE, immediate. = TRUE)
        })
    }  
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
    # .tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
    .tmp$objectname = "path1"
    .tmp$object = {                                    # self-contained assignment
        base <- env1$path$path0          # path0 root
        wd   <- env1$path$getwd          # current working dir
        ## ── input validation ────────────────────────────────────────────────
        if (is.null(base) || is.null(wd) || anyNA(c(base, wd)) || !nzchar(base) || !nzchar(wd)) {
            NA_character_
        } else {
            base_real <- fs::path_real(base)   # canonical, absolute
            wd_real   <- fs::path_real(wd)
            ## ── branch 1: wd == path0 ─────────────────────────────────────────
            if (wd_real == base_real) {
                base_real
                ## ── branch 2: wd is inside path0 ─────────────────────────────────
            } else if (fs::path_has_parent(wd_real, base_real)) {
                first_level <- fs::path_split(
                    fs::path_rel(wd_real, start = base_real)
                )[[1]][1]
                fs::path_join(c(base_real, first_level))
                ## ── branch 3: wd outside path0  (fallback) ───────────────────────
            } else {
                # warning(sprintf("Working directory '%s' is not inside path0 '%s'; using fallback strategy.", wd, base), call. = FALSE)
                # fs::path_join(c(base_real, fs::path_file(wd_real)))  # path0/<wd folder>
                warning(sprintf("Working directory '%s' is not inside path0 '%s'.", wd, base), call. = FALSE)
                NA_character_
            }
        }
    }
    if (!.tmp$objectname %in% names(.GlobalEnv$env1$path)) .GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    .sublistname = "source"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

    # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.case_when.benchmark.r
    .GlobalEnv$env1$source$.Rprofile = if (file.exists(".Rprofile")) {
        normalizePath(".Rprofile", winslash = "/")
    } else if (file.exists(file.path("~", ".Rprofile"))) {
        normalizePath(file.path("~", ".Rprofile"), winslash = "/")
    } else {
        NA_character_
    }  
    attributes(.GlobalEnv$env1$source$.Rprofile)$complete = FALSE
	##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
	env1$f$tidystat.Rprofile = env1$env.internal.attach$.Rprofile.tidystat = function(execute.Rprofile = TRUE) {
		source("https://raw.githubusercontent.com/mkim0710/tidystat/refs/heads/master/.Rprofile")
		if(execute.Rprofile) .First()
	}
	##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
	env1$f$getSourceEditorContext.path_FileNameExt = function(relative_path = FALSE) {
        SourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)
        if(relative_path) {
            SourceEditorContext.path_FileNameExt = SourceEditorContext.path_FileNameExt |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
        }
        return(SourceEditorContext.path_FileNameExt)
    }
	##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    #### \$f\$f.updateTemplates ====  
    env1$f$f.updateTemplates = function(.path4APPDATA_RStudio = NULL, TestMode = TRUE, VERBOSE = getOption("verbose"), EXECUTE = TRUE) {
        # https://github.com/mkim0710/tidystat/blob/master/R/fChr-fFilePath.update-source.R
        # https://raw.githubusercontent.com/mkim0710/tidystat/master/R/fChr-fFilePath.update-source.R
        # https://github.com/mkim0710/f.updateTemplates.exe.r
        #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++
        # Assign .path4APPDATA_RStudio based on the platform if it's NULL
        if (is.null(.path4APPDATA_RStudio)) {
            if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
        }
        
        # Create the templates directory if it doesn't exist
        if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
        
        # # \% Edit the templates of RStudio (default.R, notebook.Rmd) ~~~~~~~~~~~~
        # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
        # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
        
        # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~
        for (.FileNameExt in c("default.R", "templates-00env1.minimum.Rmd")) {
            if (.FileNameExt == "templates-00env1.minimum.Rmd") {
                .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd")
            } else {
                .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", .FileNameExt)
            }
            .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/","rstudio-prefs/templates/",.FileNameExt)
            UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
            
            if (Sys.info()["sysname"] == "Windows") {
                # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
                # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_FileNameExt), output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
                
                .file.copy.to = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",.FileNameExt)
                .BACKUP_to_path = "D:/OneDrive/[][Rproject]/-BACKUP"
                UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
                if(UPDATED) env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = .file.copy.to, .BACKUP_to_path=.BACKUP_to_path, timeFormat="%y%m%dT%H", overwrite=TRUE)
            }
        }
        if (Sys.info()["sysname"] == "Windows" && UPDATED)  cat('browseURL("D:/OneDrive/[][Rproject]/-BACKUP")', "\n")
        
        # \% Update the .gitignore / .gitattributes  @ Project Directory (& User Folder? may cause an error) ~~~~~~~~~~~~
        for (.FileNameExt in c(".gitignore")) {
            .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.FileNameExt)
            # for (.file.copy.to in file.path(env1$path$path1,.FileNameExt)) {
            for (.file.copy.to in c(file.path(env1$path$path1,.FileNameExt), file.path("~",.FileNameExt)|>normalizePath(winslash="/",mustWork=FALSE), paste0(Sys.getenv("USERPROFILE"),"/",.FileNameExt), paste0(Sys.getenv("USERPROFILE"),"/Documents/",.FileNameExt))) {
                if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.FileNameExt)) {
                    UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
                }
            }
        }
    
        # \% Update the .Rprofile  @ Project Directory (& User Folder? may cause an error) ~~~~~~~~~~~~
        for (.FileNameExt in c(".Rprofile")) {
            .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.FileNameExt)
            # for (.file.copy.to in file.path(env1$path$path1,.FileNameExt)) {
            # for (.file.copy.to in c(file.path(env1$path$path1,.FileNameExt), file.path("~",.FileNameExt)|>normalizePath(winslash="/",mustWork=FALSE))) {
    
    		vec.file.copy.to = ifelse(Sys.info()["sysname"] == "Linux", c(file.path(env1$path$path1,.FileNameExt), file.path("~",.FileNameExt)|>normalizePath(winslash="/",mustWork=FALSE)), file.path(env1$path$path1,.FileNameExt))
    		 
            for (.file.copy.to in vec.file.copy.to) {
                if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.FileNameExt)) {
                    UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
                }
            }
        }
    
        # \% Update the .Rprofile  @ User Folder ~~~~~~~~~~~~
        for (.FileNameExt in c(".Rprofile-NoDependency.Rprofile")) {
            .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.FileNameExt)
    		.file.copy.to = file.path("~",".Rprofile")|>normalizePath(winslash="/",mustWork=FALSE)
    		if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.FileNameExt)) {
    			UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
    		}
        }
        
        # \% Update the f.updateTemplates.exe.r, f.update_rstudio_prefs-dev.r, RStudioServer-setup.r  @ Project Directory ~~~~~~~~~~~~
        for (.FileNameExt in c("f.updateTemplates.exe.r", "f.update_rstudio_prefs-dev.r", "RStudioServer-setup.r")) {
            .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.FileNameExt)
            .file.copy.to = file.path(env1$path$path1,.FileNameExt)
            UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
        }
        
        # # remove old files
        # for (.file.old in c("updateTemplates.R", "f.updateTemplates.source.r")) {
        #     if (file.exists(.file.old) && file.exists("f.updateTemplates.exe.r")) {
        #         file.remove(.file.old)
        #         warning(paste0("Removed old file: ", .file.old))
        #     }
        # }
        
        # *** be careful not to overwite .gitattributes~! git LFS may become regular file~!
        
        # if(.Platform$OS.type == "unix") {
        #     if(Sys.info()["sysname"] == "Linux") {
        #         if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
        #             
        #         } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
        #             .file.copy.from = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH240515%20copilot.json"
        #             .file.copy.to = "~/.config/rstudio/rstudio-prefs.json"
        #             UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
        #         } else if(Sys.info()["sysname"] == "Darwin") {
        #             
        #         }
        #     } else if(Sys.info()["sysname"] == "Windows") {
        #         
        #     }
        # }
    }
	##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    "ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" %>% {cat("r$> ", ., "\n", sep="")}
	ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)
    cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
    ".tmp |> str(max.level = 1, give.attr = FALSE)" %>% {cat("r$> ", ., "\n", sep="")}
	.tmp |> str(max.level = 1, give.attr = FALSE)
    cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
    # "env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" %>% {cat("r$> ", ., "\n", sep="")}
	# env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)
    "env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)" %>% {cat("r$> ", ., "\n", sep="")}
	env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)
	##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    cat("##________________________________________________________________________________", "  \n", sep="")
    cat("Loading time for .Rprofile: ", difftime(Sys.time(), .t0, units = "secs"), " secs \n", sep="")
    cat("Loaded without error: ", .GlobalEnv$env1$source$.Rprofile, "  \n",
        '    Sys.getlocale() == "', Sys.getlocale(), '"  \n',
        "    Timestamp: ", date(), "  \n", sep="")

    attach(env1$f)
    # attach(env1$env.internal)
    attach(env1$env.internal.attach)
	##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    attributes(.GlobalEnv$env1$source$.Rprofile)$complete = TRUE

}}


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.Last <- function(){
    cat("\nGoodbye at ", date(), "\n")
}  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
