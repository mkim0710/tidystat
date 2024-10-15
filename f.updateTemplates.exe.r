##@ now included in env1$env.internal.source.r ----

#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
# if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# .GlobalEnv$.tmp = list() ====  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }  
# .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) } 
# .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
# .GlobalEnv$env1$source = list() ====  
.sublistname = "source"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
# .GlobalEnv$env1$info = list() ====  
.sublistname = "info"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
# .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
# .GlobalEnv$env1$path = list() ====  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "source_base_local"; .tmp$object = ifelse(Sys.info()["sysname"] == "Windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  

if(!".path4read" %in% names(env1$path)) {.path4read = env1$path$.path4read = env1$path$path1}  
if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = ifelse("CurrentSource.path" %in% names(env1$path), env1$path$CurrentSource.path, env1$path$path1)}  

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \% env1$env.internal$f_file2.compare ====  
# Function to compare two source code files chunk-by-chunk using while loop with a chunk size of 64KB
env1$env.internal$f_file2.compare <- function(file1, file2, chunk_size = 65536) {
    # Open both files in binary mode
    con1 <- file(file1, "rb")
    con2 <- file(file2, "rb")
    
    # Ensure files are closed after comparison
    on.exit({
        close(con1)
        close(con2)
    })
    
    # Initialize the first chunks
    chunk1 <- readBin(con1, what = "raw", n = chunk_size)
    chunk2 <- readBin(con2, what = "raw", n = chunk_size)
    
    # While at least one of the chunks has content, continue comparing
    while(length(chunk1) > 0 || length(chunk2) > 0) {
        # If the chunks differ, return FALSE
        if (!identical(chunk1, chunk2)) {
            return(FALSE)
        }
        
        # Read the next chunk for both files
        # The file pointer moves automatically as you read, so each call to readBin() continues where the last one left off.
        chunk1 <- readBin(con1, what = "raw", n = chunk_size)
        chunk2 <- readBin(con2, what = "raw", n = chunk_size)
    }
    
    # If all chunks are identical and EOF is reached for both files, return TRUE
    return(TRUE)
}


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \% env1$env.internal$f_url_destfile.DownloadIfDifferent ====  
# Function to download a file only if the web file is different from the local file
env1$env.internal$f_url_destfile.DownloadIfDifferent <- function(url, destfile, chunk_size = 65536) {  # Default 64KB chunk size
    tryCatch({
        # Temporary file to download the remote file for comparison
        temp_file <- tempfile()
        download.file(url, temp_file, quiet = TRUE)
        
        # Compare the local file and the remote file (if local file exists)
        if (file.exists(destfile)) {
            files_are_identical <- env1$env.internal$f_file2.compare(destfile, temp_file, chunk_size)
            
            if (files_are_identical) {
                message(paste0("No update needed for: ", destfile))
                return(FALSE)
            }
        }
        
        # If files are different or local file doesn't exist, proceed with the download
        file.copy(from = temp_file, to = destfile, overwrite = TRUE)
        message(paste0("Downloaded & updated: ", destfile))
        return(TRUE)
        
    }, error = function(e) {
        message(paste0("Failed to download or update: ", url))
        message("Error:", e$message)
        return(FALSE)
    })
}


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \% env1$f$f.updateTemplates ====  
# https://github.com/mkim0710/f.updateTemplates.exe.r
env1$f$f.updateTemplates = function(.path4APPDATA_RStudio = NULL) {
    #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++
    # Assign .path4APPDATA_RStudio based on the platform if it's NULL
    if (is.null(.path4APPDATA_RStudio)) {
        if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
    }
    
    # Create the templates directory if it doesn't exist
    if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
    
    # # \% Edit the templates of RStudio (default.R, notebook.Rmd) ~~~~~~~~~~~~
    # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    
    # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~
    env1$env.internal$f_url_destfile.DownloadIfDifferent("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = file.path(.path4APPDATA_RStudio, "templates", "default.R"))
    env1$env.internal$f_url_destfile.DownloadIfDifferent("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd"))
    # for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
    #     if (filename.ext %in% dir()) {
    #         env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = filename.ext, .backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
    #             download.file(paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",filename.ext), destfile = filename.ext)
    #     }
    # }
    
    # \% Update the .Rprofile, f.updateTemplates.exe.r, RStudioServer-setup.r  ~~~~~~~~~~~~
    for (.sourcename in c(".Rprofile", "f.updateTemplates.exe.r", "RStudioServer-setup.r"))
    env1$env.internal$f_url_destfile.DownloadIfDifferent(paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.sourcename), destfile = file.path(env1$path$path1,.sourcename))
    
    # remove old files
    if (file.exists("f.updateTemplates.source.r") && file.exists("f.updateTemplates.exe.r")) file.remove("f.updateTemplates.source.r")
    
    
    # *** be careful not to overwite .gitattributes~! git LFS may become regular file~!
    
    
    if (Sys.info()["sysname"] == "Windows") {
        # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
        # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$CurrentSource.path.filename.ext), output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
        for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
            env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",filename.ext), .backup_to_path="D:/OneDrive/[][Rproject]/-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
        }
        browseURL("D:/OneDrive/[][Rproject]/-backup")
        
        for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
            env1$env.internal$f_url_destfile.DownloadIfDifferent(paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",filename.ext), destfile = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",filename.ext))
        }
    }
    
}

env1$f$f.updateTemplates()



env1$env.internal$f.update_rstudio_prefs = function(.url = NULL, .destfile = NULL) {
    .CodeText = '.Platform$OS.type'; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
    .CodeText = 'Sys.info()["sysname"]'; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
    
    if(.Platform$OS.type == "unix") {
        if(Sys.info()["sysname"] == "Linux") {
            if (is.null(.url)) {
                if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
                    .url = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40Rocker%40MAGB760M13700KF-240520.json"
                } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
                    .url = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH240515%20copilot.json"
                }
            }
            if (is.null(.destfile)) {
                .destfile = "~/.config/rstudio/rstudio-prefs.json"
            }
            env1$env.internal$f_url_destfile.DownloadIfDifferent(url = .url, destfile = .destfile)
            
        } else if(Sys.info()["sysname"] == "Darwin") {
            if (is.null(.url)) {
                warning("f.update_rstudio_prefs() not available for macOS")
            }
        }
    } else if(Sys.info()["sysname"] == "Windows") {
        if (is.null(.url)) {
            warning("f.update_rstudio_prefs() not available for windows")
        }
    }
}
env1$env.internal$f.update_rstudio_prefs()

"https://raw.githubusercontent.com/mattia-liuzzo/RStudio-VScode-theme/main/rs-vscode.rstheme" %>% rstudioapi::addTheme(apply=TRUE, force=TRUE)
