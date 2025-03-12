# .objectname = "get_system_info"
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.RelativeSubPath = .RelativeSubPath
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
# env1$path$.SourceName_root = .SourceName_root  
# env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
# env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
# env1$path$.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}
# cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
#     "# ",env1$path$.RelativeSubPath_FileName.dev.r, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.source.r, "  \n",
#     '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#     sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
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
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .FileName.source.r = "function.detachAllPackages" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
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
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "get_system_info" |> paste0(".source.r")
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
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

# https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r



## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ====  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$info = list() ====  
.sublistname = "info"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
env1$info$DocumentTitle0 = "get_system_info()"
env1$info$DocumentTitle1 = paste0(env1$info$DocumentTitle0,"@", ifelse(grepl("MacBook-Pro", Sys.info()["nodename"]), "MBP", Sys.info()["nodename"]))
cat(env1$info$DocumentTitle1, "  \n", sep="")
cat(env1$info$DocumentTitle1, ".r", "  \n", sep="")
cat(env1$info$DocumentTitle1, ".Rmd", "  \n", sep="")


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
        else if (Sys.info()["sysname"] == "Windows") 
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
    else if (Sys.info()["sysname"] == "Windows") trimws(system("wmic cpu get name", intern=TRUE)[2]) else NA
}
get_cpu_model()
# [1] "Apple M1 Max"
# [1] "Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz"



#% get_cpu_model() switch() ====  
# ?.Platform
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
# ?.Platform
get_cpu_model <- function() {
    if (.Platform$OS.type == "unix") {
        if (Sys.info()["sysname"] == "Darwin") return(trimws(system("sysctl -n machdep.cpu.brand_string", intern=TRUE)))
        return(trimws(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE)))
    }
    if (Sys.info()["sysname"] == "Windows") return(trimws(system("wmic cpu get name", intern=TRUE)[2]))
    NA
}
get_cpu_model()
# [1] "Apple M1 Max"



(system("awk '/model name/' /proc/cpuinfo | uniq | awk -F': ' '{print $2}'", intern=TRUE))
(system("sysctl -n machdep.cpu.brand_string", intern=TRUE))
(system("wmic cpu get name", intern=TRUE))








# ?.Platform -----  
# ?.Platform
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
# ?Sys.info
dput(Sys.info())
## @ MPB
c(sysname = "Darwin", release = "22.6.0", version = "Darwin Kernel Version 22.6.0: Wed Jul  5 22:22:05 PDT 2023; root:xnu-8796.141.3~6/RELEASE_ARM64_T6000", 
nodename = "Min-Hyungs-MacBook-Pro.local", machine = "arm64", 
login = "root", user = "mkim0710", effective_user = "mkim0710"
)





# ?sessionInfo() -----  
# ?R.Version() -----  
# ?Sys.getlocale() -----  
# ?Sys.timezone() -----  
# ?osVersion -----  
# ?sessionInfo
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
# ?l10n_info
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





    
    
# @@ END-----  





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
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

get_cpu() |> str(max.level = 2, give.attr = TRUE)
get_ram() |> str(max.level = 2, give.attr = TRUE)
get_platform_info() |> str(max.level = 2, give.attr = TRUE)
get_r_version() |> str(max.level = 2, give.attr = TRUE)
Sys.info() |> as.list() |> str(max.level = 2, give.attr = TRUE)
# > get_cpu() |> str(max.level = 2, give.attr = TRUE)
# List of 3
# $ vendor_id  : chr "GenuineIntel"
# $ model_name : chr "Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz"
# $ no_of_cores: int 32
# > get_ram() |> str(max.level = 2, give.attr = TRUE)
# Class 'bytes'  Named num 3.38e+11
# ..- attr(*, "names")= chr "ram"
# > get_platform_info() |> str(max.level = 2, give.attr = TRUE)
# List of 8
# $ OS.type   : chr "unix"
# $ file.sep  : chr "/"
# $ dynlib.ext: chr ".so"
# $ GUI       : chr "RStudio"
# $ endian    : chr "little"
# $ pkgType   : chr "source"
# $ path.sep  : chr ":"
# $ r_arch    : chr ""
# > get_r_version() |> str(max.level = 2, give.attr = TRUE)
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

  
  
# __________|------  
# @@ END-----  


## @ source(file.path(.GlobalEnv$env1$source[[paste0("source.", .GlobalEnv$env1$source$tmp_objectname)]]$path, .GlobalEnv$env1$source[[paste0("source.", .GlobalEnv$env1$source$tmp_objectname)]]$FileName)) ----  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }  
### .GlobalEnv$env1$path = list() ====  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() } 
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "source_base_local"; .tmp$object = Filter(dir.exists, paste0(c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "~"), "/github_tidystat"))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!".path4read" %in% names(env1$path)) {.path4read = env1$path$path4read = env1$path$path1}  
if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$path4write = ifelse("LastSourceEditorContext.path" %in% names(env1$path), env1$path$LastSourceEditorContext.path, env1$path$path1)}  
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
### env1\$env.internal ====  
if(!"env.internal" %in% names(.GlobalEnv$env1)) {
    .FileName.source.r = "env1$env.internal" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r); if(!.FileName.source.r %in% names(.GlobalEnv$env1$source)) {  .GlobalEnv$env1$source[[.FileName.source.r]] = .source_base.RelativeSubPath_FileName.source.r = paste0(env1$path$source_base,ifelse(env1$path$source_base=="","","/"),.RelativeSubPath_FileName.source.r); message('> source("',.source_base.RelativeSubPath_FileName.source.r,'")'); source(.source_base.RelativeSubPath_FileName.source.r)  }
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  

if(!"get_system_info" %in% names(.GlobalEnv$env1$info)) {
    .FileName.source.r = "get_system_info" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
}


env1$info$info_system_info = env1$env.internal.attach$get_system_info()
# str(env1$info$info_system_info)
.CodeText = "env1$info$machine_nodename"; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
.CodeText = "env1$info$Sys.getlocale$LC_COLLATE"; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
# .CodeText = "env1$info$l10n_info$localization_UTF8"; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")


