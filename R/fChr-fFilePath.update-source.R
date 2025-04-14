
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.update ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: env.internal\$f_file2.compare ====  
# Function to compare two source code files chunk-by-chunk using while loop with a chunk size of 64KB
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file2.compare"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(file1, file2, chunk_size = 65536) {
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
## :: env.internal\$f_url_destfile.DownloadIfDifferent ====  
# Function to download a file only if the web file is different from the local file
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_url_destfile.DownloadIfDifferent"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(url, destfile, chunk_size = 65536, VERBOSE = getOption("verbose"), EXECUTE = FALSE) {  # Default 64KB chunk size
    tryCatch({
        # Temporary file to download the remote file for comparison
        temp_file <- tempfile()
        download.file(url, temp_file, quiet = TRUE)
        
        # Compare the local file and the remote file (if local file exists)
        if (file.exists(destfile)) {
            files_are_identical <- env1$env.internal.attach$f_file2.compare(destfile, temp_file, chunk_size)
            
            if (files_are_identical) {
                message(paste0("No update needed for: ", destfile))
                return(FALSE)
            }
        }
        
        # If files are different or local file doesn't exist, proceed with the download
        if(VERBOSE||!EXECUTE) message(paste0("* Update needed for: ", destfile))
        if(VERBOSE||!EXECUTE) cat("> file.copy(from = ", deparse(temp_file), ", to = ", deparse(destfile), ", overwrite = TRUE)", "  \n", sep="") 
        if(EXECUTE) {file.copy(from = temp_file, to = destfile, overwrite = TRUE); message(paste0("Downloaded & updated: ", destfile))}
        return(EXECUTE)
        
    }, error = function(e) {
        message(paste0("Failed to download or update: ", url))
        message("Error:", e$message)
        return(FALSE)
    })
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \$f\$f.updateTemplates ====  
# https://github.com/mkim0710/f.updateTemplates.exe.r
env1$f$f.updateTemplates = function(.path4APPDATA_RStudio = NULL, TestMode = TRUE, VERBOSE = getOption("verbose"), EXECUTE = TRUE) {
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
    
    # \% Update the .Rprofile  @ Project Directory (& User Folder? may cause an error) ~~~~~~~~~~~~
    for (.FileNameExt in c(".gitignore", ".Rprofile")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.FileNameExt)
        # for (.file.copy.to in file.path(env1$path$path1,.FileNameExt)) {
        for (.file.copy.to in c(file.path(env1$path$path1,.FileNameExt), file.path("~",.FileNameExt)|>normalizePath(winslash="/",mustWork=FALSE), paste0(Sys.getenv("USERPROFILE"),"/",.FileNameExt), paste0(Sys.getenv("USERPROFILE"),"/Documents/",.FileNameExt))) {
            if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.FileNameExt)) {
                UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
            }
        }
    }
    
    # \% Update the f.updateTemplates.exe.r, RStudioServer-setup.r  @ Project Directory ~~~~~~~~~~~~
    for (.FileNameExt in c("f.updateTemplates.exe.r", "RStudioServer-setup.r")) {
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
    #             .file.copy.from = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH240515%20copilot.json"
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
