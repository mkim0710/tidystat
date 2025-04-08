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
# env1$f$showPathSymbols()
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
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  





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
# ### @ .RelativeSubPath, .FileName.source.r ======  
# .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .RelativeSubPath = env1$path$LastSourceEditorContext.path_FileNameExt |> dirname() |> env1$f$f_path.relative()  ;    ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO()    }
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "default.template" |> paste0(".source.r")
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .SourceName_root = env1$path$LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),"")  ;    ".SourceName_root" |> env1$f$f_ObjectName.get.dput.ECHO()    }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.RelativeSubPath = .RelativeSubPath
if(!exists(".SourceName_root") && exists(".FileName.source.r")) .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
.FileName.source.r = .SourceName_root |> paste0(".source.r")
env1$path$.SourceName_root = .SourceName_root
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".source.r")
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
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# if(.FileName.source.r |> str_detect("^default")) { packageStartupMessage('.FileName.source.r |> str_detect("^default")') } else {
#     # # if(!file.exists(env1$path$subpath_FileName.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_FileName.dev.r); file.edit(env1$path$subpath_FileName.dev.r); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     # if(!file.exists(env1$path$subpath_FileName.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath_FileName.dev.Rmd); file.edit(env1$path$subpath_FileName.dev.Rmd); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     # if(!file.exists(env1$path$subpath_FileName.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_FileName.source.r); file.edit(env1$path$subpath_FileName.source.r); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     file2open = env1$path$subpath_FileName.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     file2open = env1$path$subpath_FileName.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
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
# .RelativeSubPath = r"(data)"|>str_replace_all("\\\\","/")
# DSN = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # .RelativeSubPath_FileNameExt = DSN |> paste0(".rds") %>% paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.)
# # .path_FileNameExt = ifelse( file.exists(.RelativeSubPath_FileNameExt), .RelativeSubPath_FileNameExt, paste0(env1$path$source_base_github,"/data/",DSN,".rds") )
# # cat(".path_FileNameExt = ", .path_FileNameExt, "  \n", sep = "")
# # assign( DSN, read_rds(.path_FileNameExt) )
# DSN |> paste0(".rds") %>% paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.) |> read_rds() %>% assign(DSN, value = ., envir = .GlobalEnv)














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
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

