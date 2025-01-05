# default.R
# "rstudio-prefs/templates/default.R" |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL()
# source(paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R")
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = file.path(.relative.subpath, .filename.source.r))
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .subpath, .filename.source.r ======  





##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
# https://chatgpt.com/c/9faf244b-181e-47ec-ae76-841d14f50e0f
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \% search()  -----  
search() |> deparse() |> cat("  \n", sep="")
# > search() |> deparse() |> cat("  \n", sep="")
# c(".GlobalEnv", "package:lubridate", "package:forcats", "package:stringr",  "package:dplyr", "package:purrr", "package:readr", "package:tidyr",  "package:tibble", "package:ggplot2", "package:tidyverse", "tools:rstudio",  "package:stats", "package:graphics", "package:grDevices", "package:utils",  "package:datasets", "package:methods", "Autoloads", "package:base" )

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    env_name <- environmentName(env)
    if (env_name == "") {
      env_name <- deparse(substitute(env))
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions
f_global <- function() {
  f_internal <- function() {
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  f_internal()
}

# Calling the global function
f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> Autoloads -> package:methods -> package:datasets -> package:utils -> package:grDevices -> package:graphics -> package:stats -> tools:rstudio -> package:tidyverse -> package:ggplot2 -> package:tibble -> package:tidyr -> package:readr -> package:purrr -> package:dplyr -> package:stringr -> package:forcats -> package:lubridate -> R_GlobalEnv -> <environment> -> environment() 

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else {
      env_name <- capture.output(env)
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}
# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> <environment: base> -> [1] "Autoloads" -> attr(,"name") -> <environment: 0x55e96efc8b58> -> [1] "/usr/local/lib/R/library/methods" -> attr(,"path") -> [1] "package:methods" -> attr(,"name") -> <environment: package:methods> -> [1] "/usr/local/lib/R/library/datasets" -> attr(,"path") -> [1] "package:datasets" -> attr(,"name") -> <environment: package:datasets> -> [1] "/usr/local/lib/R/library/utils" -> attr(,"path") -> [1] "package:utils" -> attr(,"name") -> <environment: package:utils> -> [1] "/usr/local/lib/R/library/grDevices" -> attr(,"path") -> [1] "package:grDevices" -> attr(,"name") -> <environment: package:grDevices> -> [1] "/usr/local/lib/R/library/graphics" -> attr(,"path") -> [1] "package:graphics" -> attr(,"name") -> <environment: package:graphics> -> [1] "/usr/local/lib/R/library/stats" -> attr(,"path") -> [1] "package:stats" -> attr(,"name") -> <environment: package:stats> -> [1] "tools:rstudio" -> attr(,"name") -> <environment: 0x55e970e13a70> -> [1] "/usr/local/lib/R/site-library/tidyverse" -> attr(,"path") -> [1] "package:tidyverse" -> attr(,"name") -> <environment: package:tidyverse> -> [1] "/usr/local/lib/R/site-library/ggplot2" -> attr(,"path") -> [1] "package:ggplot2" -> attr(,"name") -> <environment: package:ggplot2> -> [1] "/usr/local/lib/R/site-library/tibble" -> attr(,"path") -> [1] "package:tibble" -> attr(,"name") -> <environment: package:tibble> -> [1] "/usr/local/lib/R/site-library/tidyr" -> attr(,"path") -> [1] "package:tidyr" -> attr(,"name") -> <environment: package:tidyr> -> [1] "/usr/local/lib/R/site-library/readr" -> attr(,"path") -> [1] "package:readr" -> attr(,"name") -> <environment: package:readr> -> [1] "/usr/local/lib/R/site-library/purrr" -> attr(,"path") -> [1] "package:purrr" -> attr(,"name") -> <environment: package:purrr> -> [1] "/usr/local/lib/R/site-library/dplyr" -> attr(,"path") -> [1] "package:dplyr" -> attr(,"name") -> <environment: package:dplyr> -> [1] "/usr/local/lib/R/site-library/stringr" -> attr(,"path") -> [1] "package:stringr" -> attr(,"name") -> <environment: package:stringr> -> [1] "/usr/local/lib/R/site-library/forcats" -> attr(,"path") -> [1] "package:forcats" -> attr(,"name") -> <environment: package:forcats> -> [1] "/usr/local/lib/R/site-library/lubridate" -> attr(,"path") -> [1] "package:lubridate" -> attr(,"name") -> <environment: package:lubridate> -> <environment: R_GlobalEnv> -> f_global_env -> f_internal_env


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else {
      env_name <- paste0("<environment: ", capture.output(print(env)), ">")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> <environment: [1] "Autoloads"> -> <environment: attr(,"name")> -> <environment: <environment: 0x55e96efc8b58>> -> <environment: [1] "/usr/local/lib/R/library/methods"> -> <environment: attr(,"path")> -> <environment: [1] "package:methods"> -> <environment: attr(,"name")> -> <environment: <environment: package:methods>> -> <environment: [1] "/usr/local/lib/R/library/datasets"> -> <environment: attr(,"path")> -> <environment: [1] "package:datasets"> -> <environment: attr(,"name")> -> <environment: <environment: package:datasets>> -> <environment: [1] "/usr/local/lib/R/library/utils"> -> <environment: attr(,"path")> -> <environment: [1] "package:utils"> -> <environment: attr(,"name")> -> <environment: <environment: package:utils>> -> <environment: [1] "/usr/local/lib/R/library/grDevices"> -> <environment: attr(,"path")> -> <environment: [1] "package:grDevices"> -> <environment: attr(,"name")> -> <environment: <environment: package:grDevices>> -> <environment: [1] "/usr/local/lib/R/library/graphics"> -> <environment: attr(,"path")> -> <environment: [1] "package:graphics"> -> <environment: attr(,"name")> -> <environment: <environment: package:graphics>> -> <environment: [1] "/usr/local/lib/R/library/stats"> -> <environment: attr(,"path")> -> <environment: [1] "package:stats"> -> <environment: attr(,"name")> -> <environment: <environment: package:stats>> -> <environment: [1] "tools:rstudio"> -> <environment: attr(,"name")> -> <environment: <environment: 0x55e970e13a70>> -> <environment: [1] "/usr/local/lib/R/site-library/tidyverse"> -> <environment: attr(,"path")> -> <environment: [1] "package:tidyverse"> -> <environment: attr(,"name")> -> <environment: <environment: package:tidyverse>> -> <environment: [1] "/usr/local/lib/R/site-library/ggplot2"> -> <environment: attr(,"path")> -> <environment: [1] "package:ggplot2"> -> <environment: attr(,"name")> -> <environment: <environment: package:ggplot2>> -> <environment: [1] "/usr/local/lib/R/site-library/tibble"> -> <environment: attr(,"path")> -> <environment: [1] "package:tibble"> -> <environment: attr(,"name")> -> <environment: <environment: package:tibble>> -> <environment: [1] "/usr/local/lib/R/site-library/tidyr"> -> <environment: attr(,"path")> -> <environment: [1] "package:tidyr"> -> <environment: attr(,"name")> -> <environment: <environment: package:tidyr>> -> <environment: [1] "/usr/local/lib/R/site-library/readr"> -> <environment: attr(,"path")> -> <environment: [1] "package:readr"> -> <environment: attr(,"name")> -> <environment: <environment: package:readr>> -> <environment: [1] "/usr/local/lib/R/site-library/purrr"> -> <environment: attr(,"path")> -> <environment: [1] "package:purrr"> -> <environment: attr(,"name")> -> <environment: <environment: package:purrr>> -> <environment: [1] "/usr/local/lib/R/site-library/dplyr"> -> <environment: attr(,"path")> -> <environment: [1] "package:dplyr"> -> <environment: attr(,"name")> -> <environment: <environment: package:dplyr>> -> <environment: [1] "/usr/local/lib/R/site-library/stringr"> -> <environment: attr(,"path")> -> <environment: [1] "package:stringr"> -> <environment: attr(,"name")> -> <environment: <environment: package:stringr>> -> <environment: [1] "/usr/local/lib/R/site-library/forcats"> -> <environment: attr(,"path")> -> <environment: [1] "package:forcats"> -> <environment: attr(,"name")> -> <environment: <environment: package:forcats>> -> <environment: [1] "/usr/local/lib/R/site-library/lubridate"> -> <environment: attr(,"path")> -> <environment: [1] "package:lubridate"> -> <environment: attr(,"name")> -> <environment: <environment: package:lubridate>> -> R_GlobalEnv -> f_global_env -> f_internal_env 

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else if (identical(env, emptyenv())) {
      env_name <- "emptyenv()"
    } else {
      env_name <- "unknown"
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> unknown -> R_GlobalEnv -> f_global_env -> f_internal_env 

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- attr(env, "name")
    } else {
      env_name <- "unknown"
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> unknown -> package:methods -> package:datasets -> package:utils -> package:grDevices -> package:graphics -> package:stats -> unknown -> package:tidyverse -> package:ggplot2 -> package:tibble -> package:tidyr -> package:readr -> package:purrr -> package:dplyr -> package:stringr -> package:forcats -> package:lubridate -> R_GlobalEnv -> f_global_env -> f_internal_env 

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy with more details
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- get(".__name__", envir = env)
    } else if (identical(env, globalenv())) {
      env_name <- "R_GlobalEnv"
    } else if (identical(env, baseenv())) {
      env_name <- "base"
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- attr(env, "name")
    } else {
      env_name <- paste("unknown (", format(env), ")", sep = "")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# Current environment path:
#  emptyenv() -> base -> unknown (<environment: 0x55e96efc8b58>) -> package:methods -> package:datasets -> package:utils -> package:grDevices -> package:graphics -> package:stats -> unknown (<environment: 0x55e970e13a70>) -> package:tidyverse -> package:ggplot2 -> package:tibble -> package:tidyr -> package:readr -> package:purrr -> package:dplyr -> package:stringr -> package:forcats -> package:lubridate -> R_GlobalEnv -> f_global_env -> f_internal_env 


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy with memory addresses
print_environment_hierarchy <- function(env) {
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- paste(get(".__name__", envir = env), "(", format(env), ")", sep = "")
    } else if (identical(env, globalenv())) {
      env_name <- paste("R_GlobalEnv (", format(env), ")", sep = "")
    } else if (identical(env, baseenv())) {
      env_name <- paste("base (", format(env), ")", sep = "")
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- paste(attr(env, "name"), "(", format(env), ")", sep = "")
    } else {
      env_name <- paste("unknown (", format(env), ")", sep = "")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Function to print the environment hierarchy with memory addresses and specific checks for known environments
print_environment_hierarchy <- function(env) {
  # Print the memory address of R_GlobalEnv first
  cat("R_GlobalEnv address:", format(globalenv()), "\n")
  
  env_names <- c()
  while (!identical(env, emptyenv())) {
    if (exists(".__name__", envir = env, inherits = FALSE)) {
      env_name <- paste(get(".__name__", envir = env), "(", format(env), ")", sep = "")
    } else if (identical(env, globalenv())) {
      env_name <- paste("R_GlobalEnv", "(", format(env), ")", sep = "")
    } else if (identical(env, baseenv())) {
      env_name <- paste("base", "(", format(env), ")", sep = "")
    } else if (!is.null(attr(env, "name")) && grepl("^package:", attr(env, "name"))) {
      env_name <- paste(attr(env, "name"), "(", format(env), ")", sep = "")
    } else if (identical(env, as.environment("tools:rstudio"))) {
      env_name <- paste("tools:rstudio", "(", format(env), ")", sep = "")
    } else if (identical(env, as.environment("Autoloads"))) {
      env_name <- paste("Autoloads", "(", format(env), ")", sep = "")
    } else {
      env_name <- paste("unknown", "(", format(env), ")", sep = "")
    }
    env_names <- c(env_names, env_name)
    env <- parent.env(env)
  }
  env_names <- c(env_names, "emptyenv()")
  env_names <- rev(env_names)
  cat("Current environment path:\n", paste(env_names, collapse = " -> "), "\n")
}

# Example of nested functions with manually named environments
f_global <- function() {
  assign(".__name__", "f_global_env", envir = environment())
  
  f_internal <- function() {
    assign(".__name__", "f_internal_env", envir = environment())
    print("Debug: Current Environment Path")
    print_environment_hierarchy(environment())
  }
  
  f_internal()
}

# Calling the global function
f_global()
# > f_global()
# [1] "Debug: Current Environment Path"
# R_GlobalEnv address: <environment: R_GlobalEnv> 
# Current environment path:
#  emptyenv() -> base(<environment: base>) -> Autoloads(<environment: 0x55e96efc8b58>) -> package:methods(<environment: package:methods>) -> package:datasets(<environment: package:datasets>) -> package:utils(<environment: package:utils>) -> package:grDevices(<environment: package:grDevices>) -> package:graphics(<environment: package:graphics>) -> package:stats(<environment: package:stats>) -> tools:rstudio(<environment: 0x55e970e13a70>) -> package:tidyverse(<environment: package:tidyverse>) -> package:ggplot2(<environment: package:ggplot2>) -> package:tibble(<environment: package:tibble>) -> package:tidyr(<environment: package:tidyr>) -> package:readr(<environment: package:readr>) -> package:purrr(<environment: package:purrr>) -> package:dplyr(<environment: package:dplyr>) -> package:stringr(<environment: package:stringr>) -> package:forcats(<environment: package:forcats>) -> package:lubridate(<environment: package:lubridate>) -> R_GlobalEnv(<environment: R_GlobalEnv>) -> f_global_env(<environment: 0x55e9842b9da0>) -> f_internal_env(<environment: 0x55e9842b96a0>) 

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  





#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
# ### @ .subpath, .filename.source.r ======  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") {.subpath = env1$path$LastSourceEditorContext.path_filename_ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# if(.relative.subpath!="") .relative.subpath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .filename.source.r = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") {.sourcename_root = env1$path$LastSourceEditorContext.path_filename_ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename_root" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.relative.subpath = .relative.subpath
if(!exists(".sourcename_root") && exists(".filename.source.r")) .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
.filename.source.r = .sourcename_root |> paste0(".source.r")
env1$path$.sourcename_root = .sourcename_root
env1$path$.relative.subpath_filename.dev.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.relative.subpath_filename.dev.Rmd = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".source.r")
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.relative.subpath_filename.dev.r, "----  \n",
    "#### ",env1$path$.relative.subpath_filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.relative.subpath_filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.relative.subpath_filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.Rmd,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.source.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));', "  \n",
    sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.relative.subpath_filename.source.r) )  ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = file.path(.relative.subpath, .filename.source.r))
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# if(.filename.source.r |> str_detect("^default")) { packageStartupMessage('.filename.source.r |> str_detect("^default")') } else {
#     # # if(!file.exists(env1$path$subpath_filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_filename.dev.r); file.edit(env1$path$subpath_filename.dev.r); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     # if(!file.exists(env1$path$subpath_filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath_filename.dev.Rmd); file.edit(env1$path$subpath_filename.dev.Rmd); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     # if(!file.exists(env1$path$subpath_filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_filename.source.r); file.edit(env1$path$subpath_filename.source.r); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     file2open = env1$path$subpath_filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     file2open = env1$path$subpath_filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
# }


#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# #@@ START) data -----  
# # \$ assign( DSN, read_rds(paste0(.path4read,"/",DSN,".rds")) ) ====  
# # .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # DSN = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# .subpath = r"(data)"|>str_replace_all("\\\\","/")
# DSN = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # .subpath_filename_ext = DSN |> paste0(".rds") %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # .path_filename_ext = ifelse( file.exists(.subpath_filename_ext), .subpath_filename_ext, paste0(env1$path$source_base_github,"/data/",DSN,".rds") )
# # cat(".path_filename_ext = ", .path_filename_ext, "  \n", sep = "")
# # assign( DSN, read_rds(.path_filename_ext) )
# DSN |> paste0(".rds") %>% paste0(.subpath,ifelse(.subpath=="","","/"),.) |> read_rds() %>% assign(DSN, value = ., envir = .GlobalEnv)














##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

