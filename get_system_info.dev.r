# objectname = "get_system_info"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$subpath = subpath
# sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$sourcename_root = sourcename_root  
# env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
# env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
# env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
#     file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
#     file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
# }
# #|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); source( file.path(env1$path$source_base,subpath.filename.source.r) )
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
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "get_system_info" |> paste0(".source.r")
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
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
    # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
    # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
    file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
    file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r



if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
# env1 = env1 %>% as.environment
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()
if(!"info" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$info <- list()
env1$info$DocumentTitle0 = "get_system_info()"
env1$info$DocumentTitle1 = paste0(env1$info$DocumentTitle0,"@", ifelse(grepl("MacBook-Pro", Sys.info()["nodename"]), "MBP", Sys.info()["nodename"]))
cat(env1$info$DocumentTitle1);cat("\n");
cat(env1$info$DocumentTitle1, ".r", sep="");cat("\n");
cat(env1$info$DocumentTitle1, ".Rmd", sep="");cat("\n");


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
env1$get_system_info = get_system_info()
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



#' @ASROCKX300RYZEN  
#' List of 9
#'  $ GUI             : chr "RStudio"  
#'  $ os_type         : chr "windows"  
#'  $ os_sysname      : chr "Windows"  
#'  $ os_version      : chr "build 22621"  
#'  $ machine_type    : chr "x86-64"  
#'  $ machine_nodename: chr "ASROCKX300RYZEN"  
#'  $ machine_cpu     : chr "AMD Ryzen 5 5600G with Radeon Graphics"  
#'  $ Sys.getlocale   :List of 4
#'   ..$ LC_COLLATE       : chr "Korean_Korea.utf8"
#'   ..$ LC_CTYPE         : chr "Korean_Korea.utf8"
#'   ..$ LC_locale_NUMERIC: chr "C"
#'   ..$ LC_locale_TIME   : chr "Korean_Korea.utf8"
#'  $ l10n_info       :List of 5
#'   ..$ localization_UTF8           : logi TRUE
#'   ..$ localization_Latin1         : logi FALSE
#'   ..$ localization_codeset        : NULL
#'   ..$ localization_codepage       : int 65001
#'   ..$ localization_system.codepage: int 65001
#'   
#'   
#' @LIVAI7-8700
#' List of 9
#'  $ GUI             : chr "RStudio"
#'  $ os_type         : chr "windows"
#'  $ os_sysname      : chr "Windows"
#'  $ os_version      : chr "build 19045"
#'  $ machine_type    : chr "x86-64"
#'  $ machine_nodename: chr "LIVAI7-8700"
#'  $ machine_cpu     : chr "Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz"
#'  $ Sys.getlocale   :List of 4
#'   ..$ LC_COLLATE       : chr "Korean_Korea.utf8"
#'   ..$ LC_CTYPE         : chr "Korean_Korea.utf8"
#'   ..$ LC_locale_NUMERIC: chr "C"
#'   ..$ LC_locale_TIME   : chr "Korean_Korea.utf8"
#'  $ l10n_info       :List of 5
#'   ..$ localization_UTF8           : logi TRUE
#'   ..$ localization_Latin1         : logi FALSE
#'   ..$ localization_codeset        : NULL
#'   ..$ localization_codepage       : int 65001
#'   ..$ localization_system.codepage: int 65001
#'   
#'   
#' @Posit Cloud
#' List of 9
#'  $ GUI             : chr "RStudio"
#'  $ os_type         : chr "unix"
#'  $ os_sysname      : chr "Linux"
#'  $ os_version      : chr "#96~18.04.1-Ubuntu SMP Mon Oct 17 02:57:48 UTC 2022"
#'  $ machine_type    : chr "x86_64"
#'  $ machine_nodename: chr "application-9677950-deployment-19172365-82455"
#'  $ machine_cpu     : chr "AMD EPYC 7R13 Processor"
#'  $ Sys.getlocale   :List of 4
#'   ..$ LC_COLLATE       : chr "C.UTF-8"
#'   ..$ LC_CTYPE         : chr "C.UTF-8"
#'   ..$ LC_locale_NUMERIC: chr "C"
#'   ..$ LC_locale_TIME   : chr "C.UTF-8"
#'  $ l10n_info       :List of 5
#'   ..$ localization_UTF8           : logi TRUE
#'   ..$ localization_Latin1         : logi FALSE
#'   ..$ localization_codeset        : chr "UTF-8"
#'   ..$ localization_codepage       : NULL
#'   ..$ localization_system.codepage: NULL




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

get_cpu() |> str()
get_ram() |> str()
get_platform_info() |> str()
get_r_version() |> str()
Sys.info() %>% as.list |> str()
# > get_cpu() |> str()
# List of 3
# $ vendor_id  : chr "GenuineIntel"
# $ model_name : chr "Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz"
# $ no_of_cores: int 32
# > get_ram() |> str()
# Class 'bytes'  Named num 3.38e+11
# ..- attr(*, "names")= chr "ram"
# > get_platform_info() |> str()
# List of 8
# $ OS.type   : chr "unix"
# $ file.sep  : chr "/"
# $ dynlib.ext: chr ".so"
# $ GUI       : chr "RStudio"
# $ endian    : chr "little"
# $ pkgType   : chr "source"
# $ path.sep  : chr ":"
# $ r_arch    : chr ""
# > get_r_version() |> str()
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


#@ source(file.path(env1$source[[paste0("source.", env1$source$tmp_objectname)]]$path, env1$source[[paste0("source.", env1$source$tmp_objectname)]]$filename)) ----
sourcename = "env1$env.internal" |> paste0(".source.r")
source_base_local = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat")
source(file.path(ifelse(dir.exists(source_base_local), source_base_local, "https://github.com/mkim0710/tidystat/raw/master"), paste0(sourcename,".source.r")))
# source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env1$env.internal.source.r"))

sourcename = "get_system_info" |> paste0(".source.r")
source(file.path(env1$path$source_base,"",paste0(sourcename,".source.r")))


env1$info$info_system_info = env1$info$get_system_info()
# str(env1$info$info_system_info)
CodeText = "env1$info$info_system_info$machine_nodename"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
CodeText = "env1$info$info_system_info$Sys.getlocale$LC_COLLATE"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
# CodeText = "env1$info$info_system_info$l10n_info$localization_UTF8"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")


