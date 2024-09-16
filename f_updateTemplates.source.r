##@ now included in env1$env.internal.source.r ----


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
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
                message(paste("No update needed for:", destfile))
                return(FALSE)
            }
        }
        
        # If files are different or local file doesn't exist, proceed with the download
        file.copy(from = temp_file, to = destfile, overwrite = TRUE)
        message(paste("Downloaded updated file:", destfile))
        return(TRUE)
        
    }, error = function(e) {
        message(paste("Failed to download or update:", url))
        message("Error:", e$message)
        return(FALSE)
    })
}


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \% env1$f$f_updateTemplates ====  
# https://github.com/mkim0710/f_updateTemplates.source.r
env1$f$f_updateTemplates = function(.path4APPDATA_RStudio = NULL) {
    #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++
    # Assign .path4APPDATA_RStudio based on the platform if it's NULL
    if (is.null(.path4APPDATA_RStudio)) {
        if (.Platform$OS.type == "windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
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
    
    if (.Platform$OS.type == "windows") {
        # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
        # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
        for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
            env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",filename.ext), .backup_to_path="D:/OneDrive/[][Rproject]/-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
        }
        browseURL("D:/OneDrive/[][Rproject]/-backup")

        for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
            env1$env.internal$f_url_destfile.DownloadIfDifferent(paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",filename.ext), destfile = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",filename.ext))
        }
    }

}

