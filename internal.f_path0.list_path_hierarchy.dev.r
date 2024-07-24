# sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")
# internal.f_path0.list_path_hierarchy.dev.r
# internal.f_path0.list_path_hierarchy.source.r
#         https://github.com/mkim0710/tidystat/blob/master/internal.f_path0.list_path_hierarchy.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/internal.f_path0.list_path_hierarchy.source.r")
# sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% env1$source) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,subpath.filename.source.r) ); env1$source[[sourcename]] = TRUE}
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# # sourcename = "env1$env.internal" |> paste0(".source.r")
# # env1$env.internal.dev.r
# # env1$env.internal.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/env1$env.internal.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/env1$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.dev.r")
# # "D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://chatgpt.com/c/02d7a443-e8fc-479e-9b69-e4d7d73a30ee
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% env1$source) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,subpath.filename.source.r) ); env1$source[[sourcename]] = TRUE}
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
if(!"source_base" %in% names(env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$subpath = subpath
sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
env1$path$sourcename_root = sourcename_root  
env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
    "# ",sourcename_root,".dev.r", "\n",
    "# ",sourcename_root,".source.r", "\n",
    '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
    '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
    '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
    '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
    '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
    '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.dev.r,'"))', "\n",
    '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.dev.Rmd,'"))', "\n",
    '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
    sep="")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  





#% f_path0.list_path_hierarchy =======
f_path0.list_path_hierarchy <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
    # Initialize a list to hold the path hierarchy
    list_path <- list()
    
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
    
    # Ensure the list is of length max_hierarchy, filling excess with NA
    list_path_hierarchy <- list_path[seq_len(min(max_hierarchy+1, length(list_path)))]
    if (length(list_path_hierarchy) < max_hierarchy+1) {
        list_path_hierarchy <- c(list_path_hierarchy, rep(NA, max_hierarchy+1 - length(list_path_hierarchy)))
    }
    
    return(list_path_hierarchy)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
max_hierarchy <- 5
print_intermediate <- TRUE

list_paths <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = print_intermediate)

# Print the final list of paths
print(list_paths)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


library(stringr)

f_path0.list_path_hierarchy.v2 <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
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
  list_paths <- vector("list", max_hierarchy + 1)
  
  # The base path0 is the first path
  list_paths[[1]] <- path0
  
  # Use str_extract to build the hierarchy
  for (i in 1:max_hierarchy) {
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
max_hierarchy <- 5
print_intermediate <- TRUE

list_paths <- f_path0.list_path_hierarchy.v2(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = print_intermediate)

# Print the final list of paths
print(list_paths)





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

library(stringr)
library(purrr)

f_path0.list_path_hierarchy.v3 <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
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
  list_paths <- vector("list", max_hierarchy + 1)
  
  # The base path0 is the first path
  list_paths[[1]] <- path0
  
  # Use map to build the hierarchy
  list_paths[2:(max_hierarchy + 1)] <- map(1:max_hierarchy, extract_path)
  
  # Replace any NULL values with NA
  list_paths <- lapply(list_paths, function(x) if (is.null(x)) NA else x)
  
  return(list_paths)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
max_hierarchy <- 5
print_intermediate <- TRUE

list_paths <- f_path0.list_path_hierarchy.v3(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = print_intermediate)

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
f_path0.list_path_hierarchy.v4 <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
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
  list_paths <- vector("list", max_hierarchy + 1)
  
  # The base path0 is the first path
  list_paths[[1]] <- path0
  
  # Use map to build the hierarchy
  list_paths[2:(max_hierarchy + 1)] <- map(1:max_hierarchy, extract_path)
  
  # Replace any NULL values with NA
  list_paths <- lapply(list_paths, function(x) if (is.null(x)) NA else x)
  
  return(list_paths)
}

# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
max_hierarchy <- 5
print_intermediate <- TRUE

# Execute the function with debugging prints
list_paths <- f_path0.list_path_hierarchy.v4(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = print_intermediate)

# Print the final result
print(list_paths)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##@ sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r") =======
# source("https://github.com/mkim0710/tidystat/raw/master/internal.f_path0.list_path_hierarchy.source.r")
sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% env1$source) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,subpath.filename.source.r) ); env1$source[[sourcename]] = TRUE}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
### $ list_path_hierarchy  =======
max_hierarchy = 5
env1$path$list_path_hierarchy = env1$path$f_path0.list_path_hierarchy(path0 = env1$path$path0, path_last = getwd(), max_hierarchy = max_hierarchy, print.intermediate = FALSE)
for (i in 1:(max_hierarchy)) {
    # if(!is.na(env1$path$list_path_hierarchy[[i+1]]))
    env1$path[[paste0("path", i)]] = env1$path$list_path_hierarchy[[i+1]]
}

# cat("> str(env1$path$list_path_hierarchy)\n"); str(env1$path$list_path_hierarchy)
# cat("> str(env1$path)\n"); str(env1$path)    

