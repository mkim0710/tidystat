# .sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")
# internal.f_path0.list_path_hierarchy.dev.r
# internal.f_path0.list_path_hierarchy.source.r
#         https://github.com/mkim0710/tidystat/blob/master/internal.f_path0.list_path_hierarchy.dev.r
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/internal.f_path0.list_path_hierarchy.source.r")
# .sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# # .sourcename = "env1$env.internal" |> paste0(".source.r")
# # env1$env.internal.dev.r
# # env1$env.internal.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/env1$env.internal.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.dev.r")
# # "D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://chatgpt.com/c/02d7a443-e8fc-479e-9b69-e4d7d73a30ee
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.subpath = .subpath
.sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root  
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"', "  \n",
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# env1 = env0
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  




#% f_path0.list_path_hierarchy =======  
f_path0.list_path_hierarchy <- function(path0, path_last = getwd(), .max_hierarchy = 5, print.intermediate = FALSE) {
    # Initialize a list to hold the path hierarchy
    list_path = list()
    
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

list_paths <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, print.intermediate = print_intermediate)

# Print the final list of paths
print(list_paths)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


library(stringr)

f_path0.list_path_hierarchy.v2 <- function(path0, path_last = getwd(), .max_hierarchy = 5, print.intermediate = FALSE) {
  # Escape special characters in path0 for regex
  special_chars <- c("\\[", "\\]", "\\(", "\\)", "\\{", "\\}", "\\.", "\\+", "\\*", "\\?", "\\^", "\\$", "\\|")
  path0_escaped <- path0
  for (char in special_chars) {
    path0_escaped <- str_replace_all(path0_escaped, char, paste0("\\", char))
  }
  
  if (print.intermediate) {
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
    
    if (print.intermediate) {
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

list_paths <- f_path0.list_path_hierarchy.v2(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, print.intermediate = print_intermediate)

# Print the final list of paths
print(list_paths)





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

library(stringr)
library(purrr)

f_path0.list_path_hierarchy.v3 <- function(path0, path_last = getwd(), .max_hierarchy = 5, print.intermediate = FALSE) {
  # Escape special characters in path0 for regex
  special_chars <- c("\\[", "\\]", "\\(", "\\)", "\\{", "\\}", "\\.", "\\+", "\\*", "\\?", "\\^", "\\$", "\\|")
  path0_escaped <- path0
  for (char in special_chars) {
    path0_escaped <- str_replace_all(path0_escaped, char, paste0("\\", char))
  }
  
  if (print.intermediate) {
    cat("Original path0: ", path0, "\n")
    cat("Escaped path0: ", path0_escaped, "\n\n")
  }
  
  # Define a function to extract the paths based on the hierarchy level
  extract_path <- function(i) {
    pattern <- paste0("^", path0_escaped, strrep("/[^/]+", i))
    extracted_path <- str_extract(path_last, pattern)
    
    if (print.intermediate) {
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

list_paths <- f_path0.list_path_hierarchy.v3(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, print.intermediate = print_intermediate)

# Print the final list of paths
print(list_paths)



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Load necessary libraries
library(stringr)
library(purrr)

# Define the function
f_path0.list_path_hierarchy.v4 <- function(path0, path_last = getwd(), .max_hierarchy = 5, print.intermediate = FALSE) {
  # Escape special characters in path0 for regex
  path0_escaped <- gsub("([][{}()+*^$|])", "\\\\\\1", path0)
  
  if (print.intermediate) {
    cat("Original path0: ", path0, "\n")
    cat("Escaped path0: ", path0_escaped, "\n\n")
  }
  
  # Define a function to extract the paths based on the hierarchy level
  extract_path <- function(i) {
    pattern <- paste0("^", path0_escaped, strrep("/[^/]+", i))
    extracted_path <- str_extract(path_last, pattern)
    
    if (print.intermediate) {
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

# Execute the function with debugging prints
list_paths <- f_path0.list_path_hierarchy.v4(path0 = path0, path_last = path_last, .max_hierarchy = .max_hierarchy, print.intermediate = print_intermediate)

# Print the final result
print(list_paths)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## @ sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/internal.f_path0.list_path_hierarchy.source.r")
.sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### \$ list_path_hierarchy  =======  
.max_hierarchy = 5
env1$path$list_path_hierarchy = env1$env.internal$f_path0.list_path_hierarchy(path0 = env1$path$path0, path_last = getwd(), .max_hierarchy = .max_hierarchy, print.intermediate = FALSE)
for (i in 1:(.max_hierarchy)) {
    # if(!is.na(env1$path$list_path_hierarchy[[i+1]]))
    env1$path[[paste0("path", i)]] = env1$path$list_path_hierarchy[[i+1]]
}

# cat("> str(env1$path$list_path_hierarchy)\n"); str(env1$path$list_path_hierarchy)
# cat("> str(env1$path)\n"); str(env1$path)    

