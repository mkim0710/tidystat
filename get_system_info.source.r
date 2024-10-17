.sourcename = "get_system_info" |> paste0(".source.r")  
if(Sys.getenv("VERBOSE")==TRUE) { print(paste0('Sourcing: "',.sourcename,'"')) }  
# # cat("# ", '.objectname = "', .objectname, '"', "\n",
# #     "# ", .objectname, ".dev.r", "\n",
# #     "# ", .objectname, ".source.r", "\n",
# #     "#         https://github.com/mkim0710/tidystat/blob/master/", .objectname, ".dev.r", "\n",
# #     '# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/', .objectname, '.source.r")', "\n",
# #     sep="")
# # file.edit(paste0(.objectname,".source.r"))
# # file.edit(paste0(.objectname,".dev.r"))
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "get_system_info" |> paste0(".source.r")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.subpath = .subpath
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$.sourcename_root = .sourcename_root  
# env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
# env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
# env1$path$.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
#     "# ",env1$path$.subpath.filename.dev.r, "  \n",
#     "# ",env1$path$.subpath.filename.dev.Rmd, "  \n",
#     "# ",env1$path$.subpath.filename.source.r, "  \n",
#     '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# env1 = env0
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(isTRUE(options()$function.reload) || !.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# # https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
## .GlobalEnv$.tmp = list() ====  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }

#% get_system_info() ====  
.tmp$objectname = "get_system_info"
.tmp$object = function() {
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
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, function.reload = options()$function.reload, runLoadedFunction = FALSE)



#% get_system_info() ====  
.tmp$objectname = "get_software_versions"
.tmp$object = function(library_names = c("tidyverse", "dplyr", "ggplot2", "purrr", "stringr")) {
  version_list <- list(OS.type = .Platform$OS.type, R.version = R.version$version.string)
  version_list$RStudio_version <- ifelse(!is.null(.Platform$GUI) && .Platform$GUI == "RStudio" && exists("RStudio.Version"), paste(unlist(RStudio.Version()$version), collapse = "."), NA)
  version_list$library_versions <- setNames(map(library_names, function(lib) {
    if (!requireNamespace(lib, quietly = TRUE)) return(paste(lib, "not installed"))
    paste(unlist(packageVersion(lib)), collapse = ".")
  }), library_names)
  return(version_list)
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
  
  
# __________|------  
# @@ END-----  
# ls.str(env1)
# # > ls.str(env1) #-----  
# # env.internal : <environment: 0x0000024c23596368> 
# # info : List of 1
# #  $ get_system_info:function ()  


# env1$info$info_system_info = env1$env.internal$get_system_info()
# # str(env1$info$info_system_info)
# .CodeText = "env1$info$machine_nodename"; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
# .CodeText = "env1$info$Sys.getlocale$LC_COLLATE"; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")
# # .CodeText = "env1$info$l10n_info$localization_UTF8"; cat(.CodeText, ' == "', eval(parse(text=.CodeText)), '"  \n', sep="")

