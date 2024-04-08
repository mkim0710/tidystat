# https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r


# if(!exists("env.custom")) env.custom = new.env()
if(!exists("env.custom")) env.custom = list()
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) env.custom$env.internal = new.env()
if(!exists("env.custom$env.internal")) env.custom$env.internal = new.env()
if(!exists("env.custom$info")) env.custom$info = list()

#% get_system_info() ====
cat("Loading: ", "env.custom$info$get_system_info", "\n")
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



#@ end -----
# ls.str(env.custom)
# # > ls.str(env.custom) #-----
# # env.internal : <environment: 0x0000024c23596368> 
# # info : List of 1
# #  $ get_system_info:function ()  

