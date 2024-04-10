# https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r


# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)

if(!exists("env.custom$info")) env.custom$info = list()

env.custom$DocumentTitle0 = "get_system_info()"
env.custom$DocumentTitle1 = paste0(env.custom$DocumentTitle0,"@", ifelse(grepl("MacBook-Pro", Sys.info()["nodename"]), "MBP", Sys.info()["nodename"]))
cat(env.custom$DocumentTitle1); cat("\r\n");
cat(env.custom$DocumentTitle1, ".R", sep = ""); cat("\r\n");
cat(env.custom$DocumentTitle1, ".RMD", sep = ""); cat("\r\n");


#% get_system_info() ====
get_system_info = function() {
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
env.custom$get_system_info = get_system_info()
str(get_system_info())
# ##@ MBP
# List of 9
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "unix"
#  $ os_sysname      : chr "Darwin"
#  $ os_version      : chr "Darwin Kernel Version 22.6.0: Wed Jul  5 22:22:05 PDT 2023; root:xnu-8796.141.3~6/RELEASE_ARM64_T6000"
#  $ machine_type    : chr "arm64"
#  $ machine_nodename: chr "Min-Hyungs-MacBook-Pro.local"
#  $ machine_cpu     : chr "Apple M1 Max"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "en_US.UTF-8"
#   ..$ LC_CTYPE         : chr "en_US.UTF-8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "en_US.UTF-8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : chr "UTF-8"
#   ..$ localization_codepage       : NULL
#   ..$ localization_system.codepage: NULL
#   
# ##@ LIVAi7
# List of 9
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "windows"
#  $ os_sysname      : chr "Windows"
#  $ os_version      : chr "build 19045"
#  $ machine_type    : chr "x86-64"
#  $ machine_nodename: chr "LIVAI7-8700"
#  $ machine_cpu     : chr "Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "Korean_Korea.utf8"
#   ..$ LC_CTYPE         : chr "Korean_Korea.utf8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "Korean_Korea.utf8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : NULL
#   ..$ localization_codepage       : int 65001
#   ..$ localization_system.codepage: int 65001








#% get_cpu_model() else if()  ====
get_cpu_model <- function() {
    if (.Platform$OS.type == "unix" & Sys.info()["sysname"] == "Darwin") (trimws(system("sysctl -n machdep.cpu.brand_string", intern=TRUE)))
    else if (.Platform$OS.type == "unix" & Sys.info()["sysname"] == "Linux") (trimws(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE)))
    else if (.Platform$OS.type == "windows") trimws(system("wmic cpu get name", intern=TRUE)[2]) else NA
}
get_cpu_model()
# [1] "Apple M1 Max"
# [1] "Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz"



#% get_cpu_model() switch() ====
?.Platform
get_cpu_model <- function() {
    os_type <- .Platform$OS.type
    sys_name <- Sys.info()["sysname"]
    switch(os_type,
           unix = {
               switch(as.character(sys_name),
                      Darwin = return(trimws(system("sysctl -n machdep.cpu.brand_string", intern=TRUE))),
                      Linux = return(trimws(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE)))
               )
           },
           windows = return(trimws(system("wmic cpu get name", intern=TRUE)[2])),
           NA
    )
}
get_cpu_model()
# [1] "Apple M1 Max"



#% get_cpu_model() concise ====
?.Platform
get_cpu_model <- function() {
    if (.Platform$OS.type == "unix") {
        if (Sys.info()["sysname"] == "Darwin") return(trimws(system("sysctl -n machdep.cpu.brand_string", intern=TRUE)))
        return(trimws(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE)))
    }
    if (.Platform$OS.type == "windows") return(trimws(system("wmic cpu get name", intern=TRUE)[2]))
    NA
}
get_cpu_model()
# [1] "Apple M1 Max"



(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE))
(system("sysctl -n machdep.cpu.brand_string", intern=TRUE))
(system("wmic cpu get name", intern=TRUE))








# ?.Platform ----- 
?.Platform
str(.Platform)
# ##@MBP
# List of 8
#  $ OS.type   : chr "unix"
#  $ file.sep  : chr "/"
#  $ dynlib.ext: chr ".so"
#  $ GUI       : chr "RStudio"
#  $ endian    : chr "little"
#  $ pkgType   : chr "mac.binary.big-sur-arm64"
#  $ path.sep  : chr ":"
#  $ r_arch    : chr ""







# ?Sys.info() ----- 
?Sys.info
dput(Sys.info())
##@ MPB
c(sysname = "Darwin", release = "22.6.0", version = "Darwin Kernel Version 22.6.0: Wed Jul  5 22:22:05 PDT 2023; root:xnu-8796.141.3~6/RELEASE_ARM64_T6000", 
nodename = "Min-Hyungs-MacBook-Pro.local", machine = "arm64", 
login = "root", user = "mkim0710", effective_user = "mkim0710"
)





# ?sessionInfo() ----- 
# ?R.Version() -----
# ?Sys.getlocale() -----
# ?Sys.timezone() -----
# ?osVersion -----
?sessionInfo
str(sessionInfo(), max.level = 1)
# dput(sessionInfo())
identical(R.Version(), sessionInfo()$R.version)
str(sessionInfo()$ R.version, max.level = 1)
identical(Sys.getlocale(), sessionInfo()$locale)
dput(Sys.getlocale())
identical(Sys.timezone(), sessionInfo()$tzone)
dput(Sys.timezone())
identical(osVersion, sessionInfo()$running)
dput(osVersion)
# str(sessionInfo()$ loadedOnly, max.level = 1, give.attr = F)


# ##@MBP
# [1] TRUE
# List of 14
#  $ platform      : chr "aarch64-apple-darwin20"
#  $ arch          : chr "aarch64"
#  $ os            : chr "darwin20"
#  $ system        : chr "aarch64, darwin20"
#  $ status        : chr ""
#  $ major         : chr "4"
#  $ minor         : chr "3.1"
#  $ year          : chr "2023"
#  $ month         : chr "06"
#  $ day           : chr "16"
#  $ svn rev       : chr "84548"
#  $ language      : chr "R"
#  $ version.string: chr "R version 4.3.1 (2023-06-16)"
#  $ nickname      : chr "Beagle Scouts"
# [1] TRUE
# "en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8"
# [1] TRUE
# "Asia/Seoul"
# [1] TRUE
# "macOS Ventura 13.5"







    
# #?l10n_info {base}
# ‘A Latin-1 locale’ includes supersets (for printable characters) such as Windows codepage 1252 but not Latin-9 (ISO 8859-15).
# On Windows (where the resulting list contains codepage and system.codepage components additionally), common codepages are 1252 (Western European), 1250 (Central European), 1251 (Cyrillic), 1253 (Greek), 1254 (Turkish), 1255 (Hebrew), 1256 (Arabic), 1257 (Baltic), 1258 (Vietnamese), 874 (Thai), 932 (Japanese), 936 (Simplified Chinese), 949 (Korean) and 950 (Traditional Chinese). Codepage 28605 is Latin-9 and 65001 is UTF-8 (where supported). R does not allow the C locale, and uses 1252 as the default codepage.
?l10n_info
str(list(
    localization_UTF8 = l10n_info()$`UTF-8`,
    localization_Latin1 = l10n_info()$`Latin-1`,  
    localization_codeset = l10n_info()$codeset,
    localization_codepage = l10n_info()$codepage,
    localization_system.codepage = l10n_info()$system.codepage
))

# ##@ MBP 
# List of 5
#  $ localization_UTF8           : logi TRUE
#  $ localization_Latin1         : logi FALSE
#  $ localization_codeset        : chr "UTF-8"
#  $ localization_codepage       : NULL
#  $ localization_system.codepage: NULL




                                       


#? getOption("repos") ------
getOption("repos")
# > getOption("repos")
#                        CRAN 
# "https://cran.rstudio.com/" 
# attr(,"RStudio")
# [1] TRUE





    
    
#@ end -----





# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
get_cpu_internal <- function() {
    os = tolower(R.version$os)
    vendor_id <- NA
    model_name <- NA
    no_of_cores <- NA
    os_type <- ifelse(grepl("^linux", os), "linux",
                 ifelse(grepl("^darwin", os), "darwin",
                 ifelse(grepl("^solaris", os), "solaris", "windows")))
    switch(os_type,
        linux = {
            vendor_id <- system("awk '/vendor_id/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE)
            model_name <- system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE)
            no_of_cores <- as.numeric(system("nproc", intern=TRUE))
        },
        darwin = {
            vendor_id <- "Apple"
            model_name <- system("sysctl -n machdep.cpu.brand_string", intern=TRUE)
            no_of_cores <- as.numeric(system("sysctl -n hw.logicalcpu", intern=TRUE))
        },
        solaris = {
            # vendor_id, model_name, and no_of_cores are already NA
        },
        windows = {
            model_name <- system("wmic cpu get name", intern=TRUE)[2]
            vendor_id <- system("wmic cpu get manufacturer", intern=TRUE)[2]
            no_of_cores <- as.numeric(system("wmic cpu get NumberOfLogicalProcessors", intern=TRUE)[2])
        }
    )
    list(
        vendor_id=trimws(vendor_id), 
        model_name = trimws(model_name), 
        no_of_cores = no_of_cores
    )
}
str(get_cpu_internal())
# List of 3
#  $ vendor_id  : chr "Apple"
#  $ model_name : chr "Apple M1 Max"
#  $ no_of_cores: num 10







library(parallel)
detectCores()
# > library(parallel)
# > detectCores()
# [1] 8

# https://github.com/cran/benchmarkme/blob/master/R/timing_mean.R
remove_white = function(x) gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)

# https://github.com/cran/benchmarkme/blob/master/R/get_cpu.R
function.get_cpu_internal = function() {
    os = R.version$os
    if(length(grep("^linux", os))) {
        cmd  = "awk '/vendor_id/' /proc/cpuinfo"
        vendor_id = gsub("vendor_id\t: ", "", unique(system(cmd, intern=TRUE)))
        cmd  = "awk '/model name/' /proc/cpuinfo"
        model_name = gsub("model name\t: ", "", unique(system(cmd, intern=TRUE)))
    } else if(length(grep("^darwin", os))) {
        vendor_id = system("sysctl -n machdep.cpu.vendor", intern=TRUE) # nocov
        model_name = system("sysctl -n machdep.cpu.brand_string", intern=TRUE) # nocov
    } else if(length(grep("^solaris", os))) {
        vendor_id = NA # nocov
        model_name = NA # nocov
    } else {
        ## CPU
        model_name = system("wmic cpu get name", intern=TRUE)[2] # nocov
        vendor_id = system("wmic cpu get manufacturer", intern=TRUE)[2] # nocov
    }
    list(vendor_id=remove_white(vendor_id), 
         model_name = remove_white(model_name), 
         no_of_cores = parallel::detectCores())
}
function.get_cpu_internal()
# > function.get_cpu_internal()
# $vendor_id
# [1] "GenuineIntel"
# 
# $model_name
# [1] "Intel(R) Core(TM) i7-6770HQ CPU @ 2.60GHz"
# 
# $no_of_cores
# [1] 8

# https://github.com/cran/benchmarkme/blob/master/R/get_ram.R
system_ram = function(os) {
    if(length(grep("^linux", os))) {
        cmd = "awk '/MemTotal/ {print $2}' /proc/meminfo"
        ram = system(cmd, intern=TRUE)
    } else if(length(grep("^darwin", os))) {
        ram = substring(system("sysctl hw.memsize", intern = TRUE), 13) #nocov
    } else if(length(grep("^solaris", os))) {
        cmd = "prtconf | grep Memory" # nocov
        ram = system(cmd, intern=TRUE) ## Memory size: XXX Megabytes # nocov
    } else {
        ram = system("wmic MemoryChip get Capacity", intern=TRUE)[-1] # nocov
    }
    ram
}
function.get_ram = function() {
    os = R.version$os
    ram = suppressWarnings(try(system_ram(os), silent = TRUE))
    if(class(ram) == "try-error" || length(ram) == 0) {
        message("\t Unable to detect your RAM. # nocov
            Please raise an issue at https://github.com/csgillespie/benchmarkme") # nocov
        ram = structure(NA, names="ram") # nocov
    } else {
        cleaned_ram = suppressWarnings(try(clean_ram(ram,os), silent=TRUE))
        if(class(cleaned_ram) == "try-error" || length(ram) == 0) {
            message("\t Unable to detect your RAM. # nocov 
            Please raise an issue at https://github.com/csgillespie/benchmarkme") # nocov
            ram = structure(NA, names="ram") #nocov
        } else {
            ram = structure(cleaned_ram, class = "bytes", names="ram")
        }
    }
    return(ram)
}
function.get_ram()







####
library(benchmarkme)
library(tidyverse)

get_cpu() %>% str
get_ram() %>% str
get_platform_info() %>% str
get_r_version() %>% str
Sys.info() %>% as.list %>% str
# > get_cpu() %>% str
# List of 3
# $ vendor_id  : chr "GenuineIntel"
# $ model_name : chr "Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz"
# $ no_of_cores: int 32
# > get_ram() %>% str
# Class 'bytes'  Named num 3.38e+11
# ..- attr(*, "names")= chr "ram"
# > get_platform_info() %>% str
# List of 8
# $ OS.type   : chr "unix"
# $ file.sep  : chr "/"
# $ dynlib.ext: chr ".so"
# $ GUI       : chr "RStudio"
# $ endian    : chr "little"
# $ pkgType   : chr "source"
# $ path.sep  : chr ":"
# $ r_arch    : chr ""
# > get_r_version() %>% str
# List of 14
# $ platform      : chr "x86_64-pc-linux-gnu"
# $ arch          : chr "x86_64"
# $ os            : chr "linux-gnu"
# $ system        : chr "x86_64, linux-gnu"
# $ status        : chr ""
# $ major         : chr "3"
# $ minor         : chr "4.3"
# $ year          : chr "2017"
# $ month         : chr "11"
# $ day           : chr "30"
# $ svn rev       : chr "73796"
# $ language      : chr "R"
# $ version.string: chr "R version 3.4.3 (2017-11-30)"
# $ nickname      : chr "Kite-Eating Tree"



#@ end -----


#@ source(file.path(env.custom$source[[paste0("source.", env.custom$source$tmp_objectname)]]$path, env.custom$source[[paste0("source.", env.custom$source$tmp_objectname)]]$filename)) ----
source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env.custom$env.internal.source.r"))
# source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env.custom$env.internal.source.r"))

objectname = "get_system_info"
source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))




