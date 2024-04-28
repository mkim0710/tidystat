# # objectname = "get_system_info"
# # cat("# ", 'objectname = "', objectname, '"', "\n",
# #     "# ", objectname, ".dev.r", "\n",
# #     "# ", objectname, ".source.r", "\n",
# #     "#         https://github.com/mkim0710/tidystat/blob/master/", objectname, ".dev.r", "\n",
# #     '# source("https://github.com/mkim0710/tidystat/raw/master/', objectname, '.source.r")', "\n",
# #     sep="")
# # rstudioapi::navigateToFile(paste0(objectname,".source.r"))
# # rstudioapi::navigateToFile(paste0(objectname,".dev.r"))
# ####################################################################################################
# objectname = "get_system_info"
# cat("# ", 'objectname = "', objectname, '"', "\n",
#     "# ", objectname, ".dev.r", "\n",
#     "# ", objectname, ".source.r", "\n",
#     "#         https://github.com/mkim0710/tidystat/blob/master/", objectname, ".dev.r", "\n",
#     '# source("https://github.com/mkim0710/tidystat/raw/master/', objectname, '.source.r")', "\n",
#     sep="")
# rstudioapi::navigateToFile(paste0(objectname,".source.r"))
# rstudioapi::navigateToFile(paste0(objectname,".dev.r"))
# # https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r



# if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"info" %in% names(env.custom)) env.custom$info = list()

#% get_system_info() ====
packageStartupMessage(paste0("Loading: ", "env.custom$", "info$get_system_info")); 
env.custom$info$get_system_info = function() {
    summary_list = list(
        GUI = .Platform$GUI,
        os_type = .Platform$OS.type,
        os_sysname = as.character(Sys.info()["sysname"]),
        os_version = as.character(Sys.info()["version"]),
        machine_type = as.character(Sys.info()["machine"]),
        machine_nodename = as.character(Sys.info()["nodename"]),
        machine_cpu = if (.Platform$OS.type == "unix" & Sys.info()["sysname"] == "Darwin") 
            trimws(system("sysctl -n machdep.cpu.brand_string", intern=TRUE))
        else if (.Platform$OS.type == "unix" & Sys.info()["sysname"] == "Linux") 
            trimws(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE))
        else if (.Platform$OS.type == "windows") 
            trimws(system("wmic cpu get name", intern=TRUE)[2])
        else NA,
        Sys.getlocale = list(
            LC_COLLATE = Sys.getlocale(category = "LC_COLLATE"), 
            LC_CTYPE = Sys.getlocale(category = "LC_CTYPE"), 
            LC_locale_NUMERIC = Sys.getlocale(category = "LC_NUMERIC"), 
            LC_locale_TIME = Sys.getlocale(category = "LC_TIME")
        ), 
        l10n_info = list(
            localization_UTF8 = l10n_info()$`UTF-8`,
            localization_Latin1 = l10n_info()$`Latin-1`,  
            localization_codeset = l10n_info()$codeset,
            localization_codepage = l10n_info()$codepage,
            localization_system.codepage = l10n_info()$system.codepage
        )
    )
}

env.custom$info$get_software_versions <- function(library_names = c("tidyverse", "dplyr", "ggplot2", "purrr", "stringr")) {
  version_list <- list(OS.type = .Platform$OS.type, R.version = R.version$version.string)
  version_list$RStudio_version <- ifelse(!is.null(.Platform$GUI) && .Platform$GUI == "RStudio" && exists("RStudio.Version"), paste(unlist(RStudio.Version()$version), collapse = "."), NA)
  version_list$library_versions <- setNames(map(library_names, function(lib) {
    if (!requireNamespace(lib, quietly = TRUE)) return(paste(lib, "not installed"))
    paste(unlist(packageVersion(lib)), collapse = ".")
  }), library_names)
  return(version_list)
}

#@ end -----
# ls.str(env.custom)
# # > ls.str(env.custom) #-----
# # env.internal : <environment: 0x0000024c23596368> 
# # info : List of 1
# #  $ get_system_info:function ()  


# env.custom$info$info_system_info = env.custom$info$get_system_info()
# # str(env.custom$info$info_system_info)
# CodeText = "env.custom$info$info_system_info$machine_nodename"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
# CodeText = "env.custom$info$info_system_info$Sys.getlocale$LC_COLLATE"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
# # CodeText = "env.custom$info$info_system_info$l10n_info$localization_UTF8"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")

