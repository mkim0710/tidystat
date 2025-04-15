# .FileName.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")
# internal.f_path0.list_path_hierarchy.dev.r
# internal.f_path0.list_path_hierarchy.source.r
#         https://github.com/mkim0710/tidystat/blob/master/internal.f_path0.list_path_hierarchy.dev.r
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/internal.f_path0.list_path_hierarchy.source.r")
# .FileName.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# # .FileName.source.r = "env1$env.internal" |> paste0(".source.r")
# # env1$env.internal.dev.r
# # env1$env.internal.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/env1$env.internal.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.dev.r")
# # "D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/c/02d7a443-e8fc-479e-9b69-e4d7d73a30ee
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# env1$f$MH_shortcuts()
# env1$f$openWorkingFilesList()
# env1$f$showCodeText2restartSession.pending()
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# env1$f$showSymbolPaths()
# env1$f$showProjectPathFiles()
# env1$f$showProjectPathsRecursively()
# env1$f$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## § .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"(R)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.RelativeSubPath = .RelativeSubPath
.SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
env1$path$.SourceName_root = .SourceName_root  
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r)
cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
    "#### ",env1$path$.RelativeSubPath_FileName.dev.r, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  




#% f_path0.list_path_hierarchy =======  
f_path0.list_path_hierarchy <- function(path0, path_last = getwd(), .max_hierarchy = 5, VERBOSE = isTRUE(getOption("verbose"))) {
    # Initialize a list to hold the path hierarchy
    list_path = list()
    
    # Initialize a variable to keep track of the previous directory
    prev_dir <- ""
    
    # Loop to dynamically check the relationship between path_last and path0
    while (TRUE) {
        list_path <- c(list(path_last), list_path)  # Prepend the current path to the hierarchy
        if (VERBOSE) {
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
    
    # Ensure the list is of length .max_hierarchy, filling excess with NA
    list_path_hierarchy <- list_path[seq_len(min(.max_hierarchy+1, length(list_path)))]
    if (length(list_path_hierarchy) < .max_hierarchy+1) {
        list_path_hierarchy <- c(list_path_hierarchy, rep(NA, .max_hierarchy+1 - length(list_path_hierarchy)))
    }
    
    return(list_path_hierarchy)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
.max_hierarchy <- 5
print_intermediate <- TRUE

list_paths <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, VERBOSE = print_intermediate)

# Print the final list of paths
print(list_paths)


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


library(stringr)

f_path0.list_path_hierarchy.v2 <- function(path0, path_last = getwd(), .max_hierarchy = 5, VERBOSE = isTRUE(getOption("verbose"))) {
  # Escape special characters in path0 for regex
  special_chars <- c("\\[", "\\]", "\\(", "\\)", "\\{", "\\}", "\\.", "\\+", "\\*", "\\?", "\\^", "\\$", "\\|")
  path0_escaped <- path0
  for (char in special_chars) {
    path0_escaped <- str_replace_all(path0_escaped, char, paste0("\\", char))
  }
  
  if (VERBOSE) {
    cat("Original path0: ", path0, "\n")
    cat("Escaped path0: ", path0_escaped, "\n\n")
  }
  
  # Initialize a list to store the paths
  list_paths <- vector("list", .max_hierarchy + 1)
  
  # The base path0 is the first path
  list_paths[[1]] <- path0
  
  # Use str_extract to build the hierarchy
  for (i in 1:.max_hierarchy) {
    pattern <- paste0("^", path0_escaped, strrep("/[^/]+", i))
    list_paths[[i+1]] <- str_extract(path_last, pattern)
    
    if (VERBOSE) {
      cat("Pattern: ", pattern, "\n")
      cat("Extracted path: ", list_paths[[i+1]], "\n\n")
    }
  }
  
  # Replace any NULL values with NA
  list_paths <- lapply(list_paths, function(x) if (is.null(x)) NA else x)
  
  return(list_paths)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
.max_hierarchy <- 5
print_intermediate <- TRUE

list_paths <- f_path0.list_path_hierarchy.v2(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, VERBOSE = print_intermediate)

# Print the final list of paths
print(list_paths)





##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

library(stringr)
library(purrr)

f_path0.list_path_hierarchy.v3 <- function(path0, path_last = getwd(), .max_hierarchy = 5, VERBOSE = isTRUE(getOption("verbose"))) {
  # Escape special characters in path0 for regex
  special_chars <- c("\\[", "\\]", "\\(", "\\)", "\\{", "\\}", "\\.", "\\+", "\\*", "\\?", "\\^", "\\$", "\\|")
  path0_escaped <- path0
  for (char in special_chars) {
    path0_escaped <- str_replace_all(path0_escaped, char, paste0("\\", char))
  }
  
  if (VERBOSE) {
    cat("Original path0: ", path0, "\n")
    cat("Escaped path0: ", path0_escaped, "\n\n")
  }
  
  # Define a function to extract the paths based on the hierarchy level
  extract_path <- function(i) {
    pattern <- paste0("^", path0_escaped, strrep("/[^/]+", i))
    extracted_path <- str_extract(path_last, pattern)
    
    if (VERBOSE) {
      cat("Pattern: ", pattern, "\n")
      cat("Extracted path: ", extracted_path, "\n\n")
    }
    
    return(extracted_path)
  }
  
  # Initialize a list to store the paths
  list_paths <- vector("list", .max_hierarchy + 1)
  
  # The base path0 is the first path
  list_paths[[1]] <- path0
  
  # Use map to build the hierarchy
  list_paths[2:(.max_hierarchy + 1)] <- map(1:.max_hierarchy, extract_path)
  
  # Replace any NULL values with NA
  list_paths <- lapply(list_paths, function(x) if (is.null(x)) NA else x)
  
  return(list_paths)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
.max_hierarchy <- 5
print_intermediate <- TRUE

list_paths <- f_path0.list_path_hierarchy.v3(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, VERBOSE = print_intermediate)

# Print the final list of paths
print(list_paths)



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
library(stringr)

# Example path
path0 <- "D:/OneDrive/[][Rproject]"

# Using str_replace_all for each special character
special_chars <- c("\\[", "\\]", "\\(", "\\)", "\\{", "\\}", "\\.", "\\+", "\\*", "\\?", "\\^", "\\$", "\\|")
path0_escaped_str_replace_all <- path0
for (char in special_chars) {
  path0_escaped_str_replace_all <- str_replace_all(path0_escaped_str_replace_all, char, paste0("\\", char))
}
cat("Escaped with str_replace_all:", path0_escaped_str_replace_all, "\n")

# Using gsub for all special characters at once
path0_escaped_gsub <- gsub("([][{}()+*^$|])", "\\\\\\1", path0)
cat("Escaped with gsub:", path0_escaped_gsub, "\n")



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Load necessary libraries
library(stringr)
library(purrr)

# Define the function
f_path0.list_path_hierarchy.v4 <- function(path0, path_last = getwd(), .max_hierarchy = 5, VERBOSE = isTRUE(getOption("verbose"))) {
  # Escape special characters in path0 for regex
  path0_escaped <- gsub("([][{}()+*^$|])", "\\\\\\1", path0)
  
  if (VERBOSE) {
    cat("Original path0: ", path0, "\n")
    cat("Escaped path0: ", path0_escaped, "\n\n")
  }
  
  # Define a function to extract the paths based on the hierarchy level
  extract_path <- function(i) {
    pattern <- paste0("^", path0_escaped, strrep("/[^/]+", i))
    extracted_path <- str_extract(path_last, pattern)
    
    if (VERBOSE) {
      cat("Pattern: ", pattern, "\n")
      cat("Extracted path: ", extracted_path, "\n\n")
    }
    
    return(extracted_path)
  }
  
  # Initialize a list to store the paths
  list_paths <- vector("list", .max_hierarchy + 1)
  
  # The base path0 is the first path
  list_paths[[1]] <- path0
  
  # Use map to build the hierarchy
  list_paths[2:(.max_hierarchy + 1)] <- map(1:.max_hierarchy, extract_path)
  
  # Replace any NULL values with NA
  list_paths <- lapply(list_paths, function(x) if (is.null(x)) NA else x)
  
  return(list_paths)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
.max_hierarchy <- 5
print_intermediate <- TRUE

# EXECUTE the function with debugging prints
list_paths <- f_path0.list_path_hierarchy.v4(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, VERBOSE = print_intermediate)

# Print the final result
print(list_paths)


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ .FileName.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/internal.f_path0.list_path_hierarchy.source.r")
.FileName.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#### \$ list_path_hierarchy  =======  
.max_hierarchy = 5
env1$path$list_path_hierarchy = env1$env.internal.attach$f_path0.list_path_hierarchy(path0 = env1$path$path0, path_last = getwd(), .max_hierarchy = .max_hierarchy, VERBOSE = FALSE)
for (i in 1:(.max_hierarchy)) {
    # if(!is.na(env1$path$list_path_hierarchy[[i+1]]))
    env1$path[[paste0("path", i)]] = env1$path$list_path_hierarchy[[i+1]]
}

# cat("> str(env1$path$list_path_hierarchy)\n"); str(env1$path$list_path_hierarchy)
# cat("> str(env1$path)\n"); str(env1$path)    

