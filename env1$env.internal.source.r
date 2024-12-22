##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#| ------------------------- < To be covered at .Rprofile >                 ...128
#| ------------------------- < If .Rprofile not available >                 ...131
# @@ system, environment                                                    ...189
# @@ f_function, f_expression, f_CodeText                                   ...345
# @@ f_file, f_URL, f_path                                                  ...792
# @@ source()                                                               ...2329
# \% source( file.path(env1$path$source_base,subpath_filename.source.r) )       ...2452
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#| ------------------------- < To be covered at .Rprofile >           ...130
#| ------------------------- < If .Rprofile not available >           ...133
## .GlobalEnv$.tmp = list()                                           ...150
## .GlobalEnv$env1 = new.env()                                        ...152
# @@ system, environment                                              ...191
## :: get_system_info                                                 ...194
## :: get_software_versions                                           ...227
## :: warnings.summary                                                ...238
## :: warnings.last                                                   ...239
## :: warnings.last10                                                 ...240
## :: message_if_VERBOSE                                              ...245
## :: cat_if_VERBOSE                                                  ...250
## :: f_env1_subenv_objectname.set_ALIAS                              ...255
## :: f_environment.list_objectnames.map_get.str                      ...266
## ::OPTION:: f_environment.list_objectnames_incl_hidden.map_get.str        ...289
## :: f_environment.detach_and_reattach                               ...299
## :: reattach.env1_f_env.internal.attach                             ...313
## :: f_environment.attached_search_path.dput                         ...321
## :: Sys.time.set_t0                                                 ...332
## :: Sys.time.set_t1                                                 ...337
# @@ f_function, f_expression, f_CodeText                             ...347
## :: f_function.load2env.internal                                    ...349
## :: f_text_function_arguments.identity_mapping                      ...375
## :: f_condition1.if_null_condition2                                 ...403
## :: f_expression.eval.withCallingHandlers.attr_warnings.summary     ...415
## :: f_expression.system.time.round.dput                             ...475
## :: f_object.get_objectname -PENDING                                ...503
## :: f_ObjectName.dput.ECHO                                          ...537
## :: f_ObjectName.get.dput.ECHO                                      ...562
## :: f_CodeText.ECHO                                                 ...598
## ::OPTION:: f_CodeText.parse.eval.dput.ECHO                         ...719
## :: f_CodeTexts.parse.eval.identical                                ...735
## :: f_TerminalFromRCodeText.ECHO                                    ...763
## :: f_object.substitute.deparse2objectname                          ...784
# @@ f_file, f_URL, f_path                                            ...794
## :: getSourceEditorContext.path_filename_ext                        ...797
## :: f_path_file.paste0_collapse_if_not_empty                        ...814
## :: f_path.relative                                                 ...834
## :: getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext =        ...848
## :: f_path.file.info                                                ...911
## :: f_list_df.write_xlsx_table                                      ...960
## :: f_path.file.info.xlsx                                           ...1010
## ::OPTION:: f_path.documents.file.info.xlsx                         ...1068
## :: f_path.DOCs_Rcode.file.info.xlsx                                ...1081
## :: f_path.size_files =                                             ...1145
## :: f_path0.list_path_hierarchy =                                   ...1197
## :: f_vec_path.vec_filename_sans_ext_extended =                     ...1236
## :: f_vec_path.vec_ext_extended =                                   ...1259
## :: f_path.df_filename_ext_extended =                               ...1278
## :: f_path_fileRegEX.rename =                                       ...1317
## :: f_path.list.files_orphan_nb_html.remove                         ...1388
## :: f_filename_ext.append_suffix =                                  ...1450
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers =                               ...1484
## ::OPTION:: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.merge_with_input_vec_chr.except_TOC        ...1540
## :: f_file.str_replace_all.old.ObjectName =                         ...1551
## ::OPTION:: f_CurrentSourceEditorContext.str_replace_all.old.ObjectName        ...1595
## @ f_file.edit, f_file.open, f_URL.open                             ...1617
## :: f_file.system_switch_open                                       ...1756
## @ f_file.BACKUP, f_path.BACKUP                                     ...1787
## :: f_filename_ext.createBACKUP                                     ...1789
## :: f_path_path.BACKUP.overwrite                                    ...1828
## @ f_git                                                            ...1843
## :: f_path.is_git_tracked                                           ...1846
## :: f_file.git_lfs_track_add_f                                      ...1897
## :: function_name = f_gitattributes.split()                         ...1939
## @ f_file.save                                                      ...1976
## :: f_objectname.size.write_rds.git_lfs_track_add_f                 ...1979
## :: f_object.get_objectname.size.write_rds.git_lfs_track_add_f  - PENDING       ...2114
## @ f_file.update                                                    ...2138
## :: env.internal\$f_file2.compare                                   ...2141
## :: env.internal\$f_url_destfile.DownloadIfDifferent                ...2178
# @@ source()                                                         ...2299
## :: f_sourcePath.execute_if_not_sourced =                           ...2302
## ::OPTION:: f_sourcePath.execute.force_reload                       ...2361
# ## @ .filename.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")       ...2385
## @ .filename.source.r = "f_expression.substitute_ECHO_and_dput" |> paste0(".source.r")       ...2403
# \% source( file.path(env1$path$source_base,subpath_filename.source.r) )       ...2422
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   
.filename.source.r = "env1$env.internal" |> paste0(".source.r")  
if(Sys.getenv("VERBOSE")==TRUE) { print(paste0('Sourcing: "',.filename.source.r,'"')) }  
# # env1$env.internal.dev.r
# # env1$env.internal.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/env1$env.internal.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.dev.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/env1%24env.internal.source.r"  
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
#| ------------------------- < If .Rprofile not available > --------------------- |#  
# for(.packagename in c("tidyverse")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
# remove.packages(c("tidyverse", "dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr"))
# for(.packagename in c("tidyverse")) {
# for(.packagename in c("dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr")) {
for(.packagename in c("dplyr", "purrr", "stringr")) {
    tryCatch({
        if(!require(.packagename, character.only=TRUE)) {
            stop(paste("Package", .packagename, "is not installed. Please install it before running this script.  \n install.packages(",deparse(.packagename),")"))
        }
    }, error = function(e) {
        # Additional code to handle the error or provide fallback options
        # Print a warning message but allow R to continue
        warning("Error in .Rprofile: ", e$message, "\n", call. = FALSE, immediate. = TRUE)
    })
}  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## .GlobalEnv$.tmp = list() ====  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) } 
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ====  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$source = list() ====  
.sublistname = "source"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$info = list() ====  
.sublistname = "info"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$path = list() ====  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "source_base_local"; .tmp$object = Filter(dir.exists, paste0(c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "~"), "/github_tidystat"))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  

if(!".path4read" %in% names(env1$path)) {.path4read = env1$path$.path4read = env1$path$path1}  
if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = ifelse("LastSourceEditorContext.path" %in% names(env1$path), env1$path$LastSourceEditorContext.path, env1$path$path1)}  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ system, environment ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: get_system_info ====  
# Rdev/00_base_program/get_system_info.source.r
env1$env.internal.attach$get_system_info = function() {
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
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: get_software_versions ====  
env1$env.internal.attach$get_software_versions = function(library_names = c("tidyverse", "dplyr", "ggplot2", "purrr", "stringr")) {
  version_list <- list(OS.type = .Platform$OS.type, R.version = R.version$version.string)
  version_list$RStudio_version <- ifelse(!is.null(.Platform$GUI) && .Platform$GUI == "RStudio" && exists("RStudio.Version"), paste(unlist(RStudio.Version()$version), collapse = "."), NA)
  version_list$library_versions <- setNames(map(library_names, function(lib) {
    if (!requireNamespace(lib, quietly = TRUE)) return(paste(lib, "not installed"))
    paste(unlist(packageVersion(lib)), collapse = ".")
  }), library_names)
  return(version_list)
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: warnings.summary ====  
## :: warnings.last ====  
## :: warnings.last10 ====  
env1$env.internal.attach$warnings.summary = function() {summary(warnings())}
env1$env.internal.attach$warnings.last = function() {last.warning}
env1$env.internal.attach$warnings.last10 = function() {tail(warnings(), 10)}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: message_if_VERBOSE ====  
env1$env.internal.attach$message_if_VERBOSE = 
    env1$env.internal.attach$VERBOSE_message =
    function(..., VERBOSE = isTRUE(getOption("verbose"))) { if(VERBOSE) message(...) }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat_if_VERBOSE ====  
env1$env.internal.attach$cat0_if_VERBOSE = 
    env1$env.internal.attach$VERBOSE_cat0 =
    function(..., VERBOSE = isTRUE(getOption("verbose"))) { if(VERBOSE) cat(..., "  \n", sep = "") }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_env1_subenv_objectname.set_ALIAS ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_env1_subenv_objectname.set_ALIAS"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(subenv_name4object, objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname) {
  attributes(.GlobalEnv$env1[[subenv_name4object]][[objectname]])$ALIAS = 
      attributes(.GlobalEnv$env1[[subenv_name4object]][[objectname]])$ALIAS |>
      c(  paste0("env1$", subenv_name4ALIAS,"$",ALIASname," = env1$",subenv_name4object,"$",objectname)  )
  .GlobalEnv$env1[[subenv_name4ALIAS]][[ALIASname]] = .GlobalEnv$env1[[subenv_name4object]][[objectname]]
  invisible()
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_environment.list_objectnames.map_get.str ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.list_objectnames.map_get.str"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(environment = parent.frame(), all.names = FALSE, pattern, sorted = TRUE, run_dput = FALSE, run_str = TRUE, max.level = 2, give.attr = FALSE, return_map_get = FALSE) {
    # environment.list = environment |> as.list(all.names = all.names, sorted = sorted)
    list_objectnames <- ls(envir = environment, all.names = all.names, pattern = pattern, sorted = sorted)   # Get object names, including hidden ones if all.names = TRUE
    # browser()
    
    if (run_dput)  list_objectnames |> deparse(width.cutoff = 500L) |> cat("  \n", sep="")
    
    list_objectnames.map_get = list_objectnames |> set_names() |> map(get)
    if (run_str)   list_objectnames.map_get |> str(max.level = max.level, give.attr = give.attr)
    
    if (return_map_get) {
        invisible(list_objectnames.map_get)
    } else {
        invisible(list_objectnames)
    }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ls.map_get.str  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ls.map_get.str")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_environment.list_objectnames_incl_hidden.map_get.str  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.list_objectnames_incl_hidden.map_get.str"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(environment = parent.frame(), ...) {
    env1$f$f_environment.list_objectnames.map_get.str(environment = environment, all.names = TRUE, ...)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ls.all.names.map_get.str  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ls.all.names.map_get.str")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_environment.detach_and_reattach ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.detach_and_reattach"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(what, ...) {  detach(what, ...); attach(what, ...); search() |> deparse(width.cutoff = 500L) |> cat("  \n", sep="")  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) detach_and_reattach  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "detach_and_reattach")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) reattach  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "reattach")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) attach_again_after_detach  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "attach_again_after_detach")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: reattach.env1_f_env.internal.attach ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "reattach.env1_f_env.internal.attach"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function() {  detach(env1$env.internal.attach); detach(env1$f); attach(env1$f); attach(env1$env.internal.attach); search() |> deparse(width.cutoff = 500L) |> cat("  \n", sep="")  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) detach_and_reattach.env1_f_env.internal.attach  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "detach_and_reattach.env1_f_env.internal.attach")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_environment.attached_search_path.dput ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.attached_search_path.dput"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(what, ...) {  search() |> deparse(width.cutoff = 500L) |> cat("  \n", sep="")  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) attached_search_path.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "attached_search_path.dput")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) search_path.attached_environments.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "search_path.attached_environments.dput")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: Sys.time.set_t0 ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "Sys.time.set_t0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function() {  .GlobalEnv$.tmp$t0 = Sys.time(); cat(".tmp$t0 == ", deparse(.tmp$t0), "  \n", sep="")  }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: Sys.time.set_t1 ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "Sys.time.set_t1"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function() {  .GlobalEnv$.tmp$t1 = Sys.time(); .GlobalEnv$.tmp$t1_from_t0 = .GlobalEnv$.tmp$t1 - .GlobalEnv$.tmp$t0; cat(".GlobalEnv$.tmp$t1 - .GlobalEnv$.tmp$t0 == ", deparse(.GlobalEnv$.tmp$t1_from_t0), "  \n", sep="")  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) Sys.time.from_t0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "Sys.time.from_t0")

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_function, f_expression, f_CodeText ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_function.load2env.internal ====  
env1$env.internal$f_function.load2env.internal = function(function_object, function_name, env1_subenv_name = "env.internal", show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE) {
        
    if(is.null(env1_subenv_name)) {
        if(RELOAD_FUNCTION || !function_name %in% names(.GlobalEnv$env1)) {
            .GlobalEnv$env1[[function_name]] = function_object
            if(runLoadedFunction) {
                cat("> .GlobalEnv$env1$",function_name,"()\n",sep=""); get(.GlobalEnv$env1[[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
            }
            if(show_packageStartupMessage) packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",function_name))
        }
    } else {
        if(RELOAD_FUNCTION || !function_name %in% names(.GlobalEnv$env1[[env1_subenv_name]])) {
            .GlobalEnv$env1[[env1_subenv_name]][[function_name]] = function_object
            if(runLoadedFunction) {
                if(is.environment(.GlobalEnv$env1[[env1_subenv_name]])) {
                    cat("> .GlobalEnv$env1$",env1_subenv_name,"$",function_name,"()\n",sep=""); get(function_name, envir=.GlobalEnv$env1[[env1_subenv_name]])() # Run the loaded function by default
                } else {
                    cat("> .GlobalEnv$env1$",env1_subenv_name,"$",function_name,"()\n",sep=""); get(env1_subenv_name[[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
                }
            }
            if(show_packageStartupMessage) packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",env1_subenv_name,"$", function_name))
        }
    }
}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_text_function_arguments.identity_mapping ====
## Rdev/00_base_program/007_base_expression/f_text_function_arguments.identity_mapping.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_text_function_arguments.identity_mapping"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_text) {
    # Split the input text by commas to extract each argument
    arguments <- strsplit(input_text, ",\\s*") |> unlist()
    
    # Extract the variable names by splitting on "=" and trimming whitespace
    variable_names <- gsub("\\s*=.*", "", arguments)
    variable_names <- trimws(variable_names)
    
    # Generate the new text by concatenating "name = name"
    result <- paste0(variable_names, " = ", variable_names, collapse = ", ")
    
    cat(result); cat("\n")
    invisible(result)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) "f_function_arguments.identity_mapping"  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_function_arguments.identity_mapping")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) "f_arguments.identity_mapping"  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_arguments.identity_mapping")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) "arguments.identity_mapping"  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "arguments.identity_mapping")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_condition1.if_null_condition2 ====
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_condition1.if_null_condition2"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(condition1, condition2) {
    # if (!is.null(condition1)) condition1 else condition2
    rlang::`%||%`(condition1, condition2)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) "%||%"  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "%||%")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_expression.eval.withCallingHandlers.attr_warnings.summary ====
# Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.attr_warnings.summary.dev.Rmd
.tmp$objectname = "f_expression.eval.withCallingHandlers.attr_warnings.summary"
.tmp$object = function(expression.eval, warnings.summary_only = TRUE, warnings.summary.print = TRUE) {
    options_warn_original <- getOption("warn")  # Save the current 'warn' option
    options(warn = 0)  # Set 'warn' to 0 to collect warnings
    list_warning <- list()  # Initialize an empty list to store warnings
    
    # EXECUTE the expression.eval and capture warnings
    expression.eval.output <- withCallingHandlers(
        expr = expression.eval,
        warning = function(w) {
            # Capture the call that generated the warning
            warning.conditionCall <- conditionCall(w)
            if (is.null(warning.conditionCall)) {
                warning.conditionCall <- "NULL"
            }
            
            # Capture the warning message
            warning.conditionMessage <- conditionMessage(w)
            
            # Append the call to the list, with the message as the name
            list_warning[[length(list_warning) + 1]] <<- warning.conditionCall
            names(list_warning)[length(list_warning)] <<- warning.conditionMessage
            
            invokeRestart("muffleWarning")
        }
    )
    
    options(warn = options_warn_original)  # Restore the original 'warn' option
    class(list_warning) <- "warnings"  # Assign the 'warnings' class to the list_warning
    # list_warnings.summary <- summary(list_warning)  # Use the 'summary' function to summarize warnings
    # list(expression.eval.output = expression.eval.output, warnings = list_warning, summary = list_warnings.summary)  # Return the expression.eval.output and captured warnings
    
    attributes(expression.eval.output)$expression <- substitute(expression.eval)
    attributes(expression.eval.output)$expression.eval.deparse <- deparse(expression.eval)
    if(!warnings.summary_only) attributes(expression.eval.output)$warnings <- list_warning
    attributes(expression.eval.output)$warnings.summary <- list_warning %>% summary
    
    # if(warnings.summary.print) list_warning %>% summary %>% print
    if(warnings.summary.print) list_warning %>% summary %>% capture.output() %>% paste0(collapse = "\n") %>% warning(call. = TRUE, immediate. = TRUE); cat("\n")
    
    invisible(expression.eval.output)
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) eval.attr_warnings.summary  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "eval.attr_warnings.summary")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) attr_warnings.summary  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "attr_warnings.summary")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) warnings.summary.expression_attr  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "warnings.summary.expression_attr")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) suppressWarnings.summary.as_attributes  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "suppressWarnings.summary.as_attributes")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_expression.system.time.round.dput ====
# https://chatgpt.com/c/673f2c22-d85c-800e-a877-e296fa53f7cc
.tmp$objectname = "f_expression.system.time.withCallingHandlers.round.dput"
.tmp$object = function(expression) {
    # out = expression |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
    t0 <- proc.time()
    out <- withCallingHandlers(
        {
            output <- capture.output(eval(expression, envir = parent.frame()))
            if (length(output) > 0) {
                cat(output, sep = "\n")
            }
        },
        warning = function(w) {
            message("Warning: ", conditionMessage(w))
            invokeRestart("muffleWarning")
        }
    )
    (proc.time() - t0) |> round(3) |> unclass() |> deparse() |> cat("\n")  
    invisible(out)
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) system.time.round.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "system.time.round.dput")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_object.get_objectname -PENDING ====  
# Rdev/00_base_program/007_base_expression/f_object.get_objectname.dev.Rmd
# .tmp$env1_subenv_name = "env.internal.attach"
# .tmp$objectname = "f_object.get_objectname"
# env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_object) {
#     
#     browser()
#     # Capture the expression passed to the function
#     obj_expr <- substitute(input_object)
#     obj_name <- deparse(obj_expr)
#     
#     # Check if the function was called using a pipe
#     if (identical(obj_expr, quote(.))) {
#         # Retrieve the parent call (the call to the pipe)
#         parent_call <- sys.call(-1)
#         if (!is.null(parent_call)) {
#             obj_name <- deparse(parent_call[[2]])  # Left-hand side of the pipe
#         }
#     } else {
#         # Check if we're inside another function
#         parent_call <- sys.call(-1)
#         if (!is.null(parent_call)) {
#             # Retrieve the parent frame
#             parent_frame <- parent.frame()
#             if (exists(as.character(obj_expr), envir = parent_frame)) {
#                 obj_name <- as.character(obj_expr)
#             }
#         }
#     }
#     
#     return(obj_name)
# }

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_ObjectName.dput.ECHO ====
# Rdev/00_base_program/007_base_expression/f_ObjectName.get.dput.ECHO.dev.r
.tmp$objectname = "f_ObjectName.dput.ECHO"
.tmp$object = function(ObjectName, envir = parent.frame(), LinePrefix4CodeText = "\t") {
    # *** 1-liner ***
    # cat("ObjectName == ", deparse(ObjectName), "  \n", sep = "")
    # Caution) not to be confused with: 
    # cat(ObjectName, " == ", deparse(get(ObjectName)), "  \n", sep = "")
    if (!exists(ObjectName, envir)) stop(paste("Object", ObjectName, "does not exist in the calling environment"))
    cat(LinePrefix4CodeText); cat("ObjectName == ", deparse(ObjectName), "  \n", sep = "")
    invisible()
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ObjectName.dput.ECHO  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ObjectName.dput.ECHO")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) dput_ObjectName.ECHO  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dput_ObjectName.ECHO")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ECHO.ObjectName.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ECHO.ObjectName.dput")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_ObjectName.get.dput.ECHO ====
# Rdev/00_base_program/007_base_expression/f_ObjectName.get.dput.ECHO.dev.r
.tmp$objectname = "f_ObjectName.get.dput.ECHO"
.tmp$object = function(ObjectName, envir = parent.frame(), ObjectName.parse.eval = FALSE, LinePrefix4CodeText = "\t") {
    # *** 1-liner ***
    # cat(ObjectName, " == ", deparse(get(ObjectName)), "  \n", sep = "")
    # Caution) not to be confused with: 
    # cat("ObjectName == ", deparse(ObjectName), "  \n", sep = "")
    if (!exists(ObjectName, envir)) stop(paste("Object", ObjectName, "does not exist in the calling environment"))
    if(ObjectName.parse.eval) {
        ObjectName.get = parse(text = ObjectName) |> eval(envir = envir)
    } else {
        ObjectName.get = ObjectName |> get(envir = envir)
    }
    if(is.null(ObjectName.get)) {
        # cat("NULL  \n")  # Actually, should be paste0("is.null(",.CodeText2Print,") == TRUE")
        cat(LinePrefix4CodeText); cat("is.null(",ObjectName,") == TRUE", "  \n", sep = "")
    } else {
        cat(LinePrefix4CodeText); cat(ObjectName); cat(" == "); 
        ObjectName.get |> deparse() |> cat(); cat("  \n")
    }
    invisible()
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) get_ObjectName.dput.ECHO  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "get_ObjectName.dput.ECHO")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) dput_get_ObjectName.ECHO  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dput_get_ObjectName.ECHO")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ECHO.ObjectName.get.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ECHO.ObjectName.get.dput")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_CodeText.ECHO ====
# Rdev/00_base_program/007_base_expression/f_CodeText.parse.eval.dput.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.ECHO.dev.r
.tmp$objectname = "f_CodeText.ECHO"
.tmp$object = function(
        .CodeText,
        EXECUTE = FALSE,
        deparse_cat = TRUE,
        LinePrefix4CodeText = "\t",
        LinePrefix4Output = "\t## ",
        substitute_ObjectNames = TRUE,
        ObjectNames4substitute = NULL,
        CodeEqualsOutput = TRUE,
        VERBOSE = isTRUE(getOption("verbose")),
        ...) {
    if(is.null(VERBOSE)) VERBOSE = FALSE
    
    if(is.null(.CodeText)) { stop("is.null(.CodeText)") }
    if(is.na(.CodeText)) { stop("is.na(.CodeText)") }
    
    if(substitute_ObjectNames) {
        # Get all objects defined in the parent frame
        parent_env <- parent.frame()
        if(is.null(ObjectNames4substitute)) {
            ObjectNames4substitute <- ls(all.names = TRUE, envir = .GlobalEnv) %>% 
                set_names() %>% map(get) %>% 
                keep(is.character) %>% 
                keep(function(vec) {length(vec) == 1}) %>% 
                names()
        }
        
        # Sort .object names by length in descending order
        ObjectNames4substitute <- ObjectNames4substitute[order(-nchar(ObjectNames4substitute))]
        if(VERBOSE) cat("<VERBOSE> ObjectNames4substitute == ", deparse(ObjectNames4substitute), "  \n", sep="") 
        
        # Substitute each .object name
        for (ObjectName in ObjectNames4substitute) {
            # escaped_ObjectName <- gsub("([.|()\\^{}+$*?]|\\[|\\])", "\\\\\\1", ObjectName)
            .CodeText <- gsub(paste0("get(", ObjectName, ")"), get(ObjectName), .CodeText, fixed = TRUE)
            .CodeText <- gsub(ObjectName, paste0("\"", get(ObjectName), "\""), .CodeText, fixed = TRUE)
        }
        if(VERBOSE) cat("<VERBOSE> .CodeText == ", deparse(.CodeText), "  \n", sep="") 
    }
    
    if(.CodeText |> str_detect("[\n;]") && EXECUTE) {
        # warning('The newline character(s) will be substituted by "; "')
        # .CodeText = .CodeText |> str_replace_all('\n', "; ")
        # 'The newline character(s) is not allowed' |> stop(call. = FALSE) |> tryCatch(error = function(e) {message("stop: ", e); return(invisible())})
        'EXECUTE not fully implemented for line feed (\\n) or semicolon (;)' |> warning("  \n", call. = FALSE, immediate. = TRUE)
        # return(invisible())
    }

    # Split .CodeText by newline character, considering semicolons within curly brackets
    # .CodeText.split_LF = .CodeText |> strsplit("\n") |> unlist() |> trimws()
    .CodeText.split_LF <- .CodeText |> strsplit("\n(?=[^{}]*(?:{|$))", perl = TRUE) |> unlist() |> trimws()
    if(VERBOSE) cat("<VERBOSE> .CodeText.split_LF == ", deparse(.CodeText.split_LF), "  \n", sep="") 
    # PatternToMatch(?=PositiveLookahead)
    # \n(?=[^{}]*(?:{|$)) 
    # - \n: splits the code by newline characters (\n) 
    # - (?=PositiveLookahead): only if they are followed by a sequence of characters that
    # - [^{}]*: does not contain any curly braces ([^{}]*) 
    # - (?:{|$): and then either an opening curly brace ({) or the end of the string ($). 
    # This ensures that newline characters within curly braces are ignored.
    
    # Split .CodeText by semicolon outside of curly brackets
    # .CodeText.split_LF.split_semicolon = .CodeText.split_LF |> strsplit(";") |> unlist() |> trimws()
    .CodeText.split_LF.split_semicolon <- .CodeText.split_LF |> strsplit(";(?![^{]*})", perl = TRUE) |> unlist() |> trimws()
    if(VERBOSE) cat("<VERBOSE> .CodeText.split_LF.split_semicolon == ", deparse(.CodeText.split_LF.split_semicolon), "  \n", sep="") 
    # PatternToMatch(?!NegativeLookahead)
    # ;(?![^{}]*}) 
    # ;: splits the code by semicolons (;) 
    # (?!NegativeLookahead): only if they are not followed by 
    # }: a closing curly brace (}) 
    # [^{]*: that is preceded by a sequence of characters without any opening curly braces ([^{]*). This ensures that semicolons within curly braces are ignored.

    # .CodeText.split_LF.addPrefix = paste0(LinePrefix4CodeText, .CodeText.split_LF)
    .CodeText.split_LF.addPrefix = .CodeText.split_LF %>% str_replace_all("^", LinePrefix4CodeText)
    if(VERBOSE) cat("<VERBOSE> .CodeText.split_LF.addPrefix == ", deparse(.CodeText.split_LF.addPrefix), "  \n", sep="") 

    for (i in 1:length(.CodeText.split_LF.split_semicolon)) {
        if(VERBOSE) cat("<VERBOSE> i == ", deparse(i), "  \n", sep="") 
        # cat(.CodeText.split_LF.addPrefix[i], "  \n", sep="")
        # if (i <= length(.CodeText.split_LF.addPrefix)) cat(.CodeText.split_LF.addPrefix[i], "  \n", sep="")
        if (i <= length(.CodeText.split_LF.addPrefix)) cat(.CodeText.split_LF.addPrefix[i], sep="")
        
        if(EXECUTE) {
            if(deparse_cat) {
                # .CodeText.split_LF.split_semicolon.i.parse.eval.deparse = eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> deparse()
                # if(CodeEqualsOutput && .CodeText.split_LF.split_semicolon.i.parse.eval.deparse != "NULL") {
                if(CodeEqualsOutput && identical(.CodeText.split_LF, .CodeText.split_LF.split_semicolon) && ! .CodeText.split_LF.split_semicolon[i] |> str_detect(r"((^|[^\w_.])str($|[^\w_.]))")) {
                    cat(" == ")
                    .CodeText.split_LF.split_semicolon.i.parse.eval = eval(parse(text = .CodeText.split_LF.split_semicolon[i])) 
                    if(is.null(.CodeText.split_LF.split_semicolon.i.parse.eval)) {
                        cat("NULL  \n")  # Actually, should be paste0("is.null(",.CodeText2Print,") == TRUE")
                    } else {
                        .CodeText.split_LF.split_semicolon.i.parse.eval |> deparse() |> cat(); cat("  \n")
                    }
                    
                    # .CodeText.split_LF.split_semicolon.i.parse.eval.deparse %>% cat(., "  \n", sep="")
                } else {
                    cat("  \n")
                    # eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> deparse() %>% cat(LinePrefix4Output, ., "  \n", sep="")
                    # .CodeText.split_LF.split_semicolon.i.parse.eval.deparse %>% cat(LinePrefix4Output, ., "  \n", sep="")
                    eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> deparse() %>% cat(LinePrefix4Output, ., sep="")
                }
            } else {
                # eval(parse(text = .CodeText.split_LF[i]))
                cat("  \n")
                eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> capture.output() %>% paste0(LinePrefix4Output, .) |> cat(sep="\n") 
            }
        } 
        # cat("  \n")
        if(deparse_cat) cat("  \n")
    }
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ECHO.CodeText  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ECHO.CodeText")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_CodeText.parse.eval.dput.ECHO  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_CodeText.parse.eval.dput.ECHO"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {
    env1$f$f_CodeText.ECHO(EXECUTE = TRUE, ...)
}

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) eval_parse_CodeText.dput.ECHO  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "eval_parse_CodeText.dput.ECHO")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ECHO.CodeText.parse.eval.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ECHO.CodeText.parse.eval.dput")


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_CodeTexts.parse.eval.identical ====  
# Rdev/00_base_program/007_base_expression/f_CodeTexts.parse.eval.identical.dev.r
.tmp$objectname = "f_CodeTexts.parse.eval.identical"
.tmp$object = function(CodeText1, CodeText2, show_CodeTexts.parse.eval = TRUE, show_in_one_line = FALSE, LinePrefix4CodeText = "\t") {
    CodeText1.parse.eval = eval(parse(text = CodeText1))
    CodeText2.parse.eval = eval(parse(text = CodeText2))
    CodeTexts.parse.eval.identical = identical(CodeText1.parse.eval, CodeText2.parse.eval) 

    if(show_CodeTexts.parse.eval) {
        if (show_in_one_line) {
            cat(LinePrefix4CodeText, CodeText1, ifelse(CodeTexts.parse.eval.identical, " == ", " != "), CodeText2, " == ", deparse(CodeText2.parse.eval), "  \n", sep = "")
        } else {
            cat(LinePrefix4CodeText);   cat(CodeText1, "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(LinePrefix4CodeText);   cat(" == ", deparse(CodeText1.parse.eval), "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(LinePrefix4CodeText);   cat(ifelse(CodeTexts.parse.eval.identical, " == ", " != "), "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(CodeText2, "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(LinePrefix4CodeText);   cat(" == ", deparse(CodeText2.parse.eval), "  \n", sep = "")
        }
    }
    invisible(CodeTexts.parse.eval.identical)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) ECHO.CodeText.parse.eval.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_CodeText2.is_equal")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_TerminalFromRCodeText.ECHO ====  
# Rdev/00_base_program/f_TerminalFromRCodeText.ECHO.dev.r
# env1$f$f_TerminalFromRCodeText.ECHO
.tmp$objectname = "f_TerminalFromRCodeText.ECHO"
.tmp$object = function(.TerminalCodeText, EXECUTE = FALSE, LinePrefix4CodeText = "\t") {
    .TerminalCodeText |> deparse() %>% {cat(LinePrefix4CodeText, ., " |> system(intern=TRUE)  \n", sep="")}
    if(EXECUTE) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() %>% {paste(LinePrefix4CodeText, ., " |> system(intern=TRUE)  \n", sep="")}
    )
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) system.TerminalFromRCodeText.ECHO  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "system.TerminalFromRCodeText.ECHO")


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_object.substitute.deparse2objectname ====  
# Rdev/00_base_program/f_TerminalFromRCodeText.ECHO.dev.r
# https://chatgpt.com/c/67414018-5af8-800e-8f52-d7ab9467d69d
.tmp$objectname = "f_object.substitute.deparse2objectname"
.tmp$object = function(object) {  deparse(substitute(object))  }
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_file, f_URL, f_path ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: getSourceEditorContext.path_filename_ext ====  
.tmp$objectname = "getSourceEditorContext.path_filename_ext"
.tmp$object = function(relative_path = TRUE) {
    SourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)
    if(relative_path) {
        SourceEditorContext.path_filename_ext = SourceEditorContext.path_filename_ext |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
    }
    return(SourceEditorContext.path_filename_ext)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) CurrentSourceEditorContext.path_filename_ext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "CurrentSourceEditorContext.path_filename_ext")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path_file.paste0_collapse_if_not_empty ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path_file.paste0_collapse_if_not_empty"
# env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path, filename_ext) {  paste0(path,ifelse(path=="","","/"),filename_ext)  }
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(..., collapse = "/") {  
    # paste0(path,ifelse(path=="","","/"),filename_ext)
    c(...)[c(...) != ""] |> paste0(collapse = collapse)  
}
## *** Example Usage:  
# f_path_file.paste0_collapse_if_not_empty("a", "b", "", "d")  # "a/b/d"
# f_path_file.paste0_collapse_if_not_empty("", "b/c")  # "b/c"
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) paste0_collapse.path_file.if_not_empty  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "paste0_collapse.path_file.if_not_empty")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.path.paste0_collapse_if_not_empty  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.path.paste0_collapse_if_not_empty")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.relative ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.relative"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path, basepath = env1$path$path1) {
    path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(basepath|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) path.relative  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "path.relative")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) relative_path  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "relative_path")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        check_rstudioapi = TRUE, 
        overwrite = FALSE, 
        LinePrefix4CodeText = "\t",
        VERBOSE = ifelse(!is.null(Sys.getenv("VERBOSE")), ifelse(Sys.getenv("VERBOSE")!="", Sys.getenv("VERBOSE"), isTRUE(getOption("verbose"))), isTRUE(getOption("verbose")))
) {
    if(is.null(env1$path$LastSourceEditorContext.path_filename_ext) || is.na(env1$path$LastSourceEditorContext.path_filename_ext) || env1$path$LastSourceEditorContext.path_filename_ext == "") overwrite = TRUE
    
    if (check_rstudioapi) {
        if (requireNamespace("rstudioapi")) {
            if(VERBOSE) {  .CodeText2Print = 'requireNamespace("rstudioapi")'; (ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",deparse(eval(parse(text=.CodeText2Print)))))) %>% {cat(LinePrefix4CodeText, ., "  \n", sep = "")}  }
            
            if (rstudioapi::isAvailable()) {
                # GO TO: if(overwrite)
            } else { 
                if(VERBOSE) {
                    print('!rstudioapi::isAvailable()');
                } else if (!is.null(attributes(.GlobalEnv$env1$source$.Rprofile)$complete)) {
                    if(attributes(.GlobalEnv$env1$source$.Rprofile)$complete) print('!rstudioapi::isAvailable()');
                }
                env1$path$LastSourceEditorContext.path_filename_ext = NA
                return(invisible())
            }
            
        } else { 
            if(!VERBOSE) if (!is.null(attributes(.GlobalEnv$env1$source$.Rprofile)$complete)) if(attributes(.GlobalEnv$env1$source$.Rprofile)$complete) print('!requireNamespace("rstudioapi")');
            return(invisible()) 
        }
    } 
    
    if(overwrite) {
        # env1$path$LastSourceEditorContext.path_filename_ext = getwd() |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
        env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
        env1$path$LastSourceEditorContext.path = env1$path$LastSourceEditorContext.path_filename_ext |> dirname()
        
        # cat(LinePrefix4CodeText, "env1$path$LastSourceEditorContext.path_filename_ext == ", deparse(env1$path$LastSourceEditorContext.path_filename_ext), "  \n", sep="")
        .CodeText2Print = 'env1$path$LastSourceEditorContext.path_filename_ext'; (ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",deparse(eval(parse(text=.CodeText2Print)))))) %>% {cat(LinePrefix4CodeText, ., "  \n", sep = "")}
        
        if(!".path4write" %in% names(env1$path)) {
            .path4write = env1$path$.path4write = env1$path$LastSourceEditorContext.path
            cat(LinePrefix4CodeText, ".path4write = env1$path$.path4write = env1$path$LastSourceEditorContext.path", "  \n", sep="")
        }  
    } else {
        env1$f$f_CodeTexts.parse.eval.identical("env1$path$LastSourceEditorContext.path_filename_ext", 'rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")')
    }
    return(invisible())
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) update_LastSourceEditorContext.path_filename_ext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "update_LastSourceEditorContext.path_filename_ext")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) setLastSourceEditorContext.path_filename_ext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "setLastSourceEditorContext.path_filename_ext")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.file.info ====
## Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.file.info"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path = ".", pattern = NULL, 
        all.files = FALSE, full.names = TRUE, recursive = ifelse(is.null(pattern), FALSE, TRUE),
        ignore.case = TRUE, include.dirs = TRUE, no.. = TRUE, 
        arrange_by = c("mtime")) {
    library(openxlsx2)
    
    # Check if input_path exists
    if (!dir.exists(input_path)) {
        stop("The specified input_path does not exist.")
    }
    input_path = input_path |> normalizePath(winslash = "/")
    
    # List files in the input_path
    input_path.list.files <- list.files(input_path, pattern = pattern, all.files = all.files, full.names = full.names, recursive = recursive, ignore.case = ignore.case, include.dirs = include.dirs, no.. = no..) 
    
    input_path.list.files.file.info = 
        input_path.list.files |> 
        file.info() |> 
        rownames_to_column("path_file") %>% 
        # select(path_file, size, isdir, mode, mtime, ctime, atime, exe) %>% 
        transmute(
            path_file = path_file
            , path = dirname(path_file) |> as.factor()
            , path.relative = env1$f$f_path.relative(as.character(path)) |> as.factor()
            , filename_ext = basename(path_file)
            , filename = env1$env.internal$f_vec_path.vec_filename_sans_ext_extended(filename_ext)
            , ext = env1$env.internal$f_vec_path.vec_ext_extended(filename_ext) |> as.factor()
            , size = size
            , size_KiB = round(size / 2^10, 2)
            , size_MiB = round(size / 2^20, 2)
            , size_GiB = round(size / 2^30, 2)
            , isdir = isdir
            , mtime = mtime
            , ModifiedDate = as.Date(mtime)
        ) |> arrange(desc(!!sym(arrange_by)))
    input_path.list.files.file.info
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) list.file.info  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "list.file.info")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) dir.file.info  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dir.file.info")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_list_df.write_xlsx_table ====
## Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
## Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_list_df.write_xlsx_table" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(list_df, output_filename.xlsx, vec_colnames_to_show = NULL, first_active_row = 2, first_active_col = 2, overwrite = FALSE, xls.open_or_browseURL = TRUE) {
    library(openxlsx2)
    
    output_filename.xlsx = output_filename.xlsx |> normalizePath(winslash = "/", mustWork = FALSE)
    if (Sys.info()["sysname"] == "Windows") {  output_filename.xlsx = output_filename.xlsx |> str_replace("D:/D_Repositories", paste0(Sys.getenv("OneDriveConsumer"),"/[][Rproject]")|>str_replace_all("\\\\","/"))  }
    if(!dir.exists(dirname(output_filename.xlsx))) {dir.create(dirname(output_filename.xlsx), recursive = TRUE)}
    
    if(!overwrite && file.exists(output_filename.xlsx)) {
        paste0("file.exists(",deparse(output_filename.xlsx), ") -> Consider: overwrite = TRUE  \n") |> warning(immediate. = TRUE)
        if(xls.open_or_browseURL) env1$f$f_file_xls.open_or_browseURL(output_filename.xlsx) else paste0("env1$f$f_file_xls.open_or_browseURL(",deparse(output_filename.xlsx),")  \n") |> message(appendLF = FALSE)
        return(invisible())
    }
    
    wb <- wb_workbook()
    
    # Add each data.frame to a new worksheet
    for (DataSetName in names(list_df)) {
        DataSet <- list_df[[DataSetName]]
        
        # Add worksheet and data table
        wb$add_worksheet(DataSetName)
        wb$add_data_table(sheet = DataSetName, x = DataSet, table_name = DataSetName)
        
        # Auto-adjust column widths
        wb$set_col_widths(sheet = DataSetName, cols = 1:ncol(DataSet), widths = "auto")
        
        # Freeze panes (optional configuration)
        wb$freeze_pane(sheet = DataSetName, first_active_row = first_active_row, first_active_col = first_active_col)
        
        # Hide unwanted columns, if specified
        if (!is.null(vec_colnames_to_show)) {
            vec_col_index_to_hide <- which(!colnames(DataSet) %in% vec_colnames_to_show)
            wb$set_col_widths(sheet = DataSetName, cols = vec_col_index_to_hide, hidden = TRUE)
        }
    }
    
    wb |> wb_save(output_filename.xlsx)
    
    if(xls.open_or_browseURL) env1$f$f_file_xls.open_or_browseURL(output_filename.xlsx) else paste0("env1$f$f_file_xls.open_or_browseURL(",deparse(output_filename.xlsx),")  \n") |> message(appendLF = FALSE) 
    
    invisible(output_filename.xlsx)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) write_xlsx_table  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "write_xlsx_table")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.file.info.xlsx ====
## Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
## Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.file.info.xlsx" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path = ".", pattern = NULL, 
        all.files = FALSE, full.names = TRUE, recursive = ifelse(is.null(pattern), FALSE, TRUE),
        ignore.case = TRUE, include.dirs = TRUE, no.. = TRUE,
        arrange_by = c("mtime"), 
        output_filename.xlsx = "FolderName-dir.file.info-YYMMDD.xlsx", overwrite = FALSE, xls.open_or_browseURL = TRUE, orphan_nb_html.remove = TRUE) {
    
    input_path = input_path |> normalizePath(winslash = "/")
    
    output_filename.xlsx = output_filename.xlsx |> normalizePath(winslash = "/", mustWork = FALSE)
    if (Sys.info()["sysname"] == "Windows") {  output_filename.xlsx = output_filename.xlsx |> str_replace("D:/D_Repositories", paste0(Sys.getenv("OneDriveConsumer"),"/[][Rproject]")|>str_replace_all("\\\\","/"))  }
    if(!dir.exists(dirname(output_filename.xlsx))) {dir.create(dirname(output_filename.xlsx), recursive = TRUE)}

    if(output_filename.xlsx %>% str_detect("FolderName")) {
        FolderName = input_path |> basename()
        output_filename.xlsx = output_filename.xlsx %>% str_replace_all(fixed("FolderName"), FolderName)
    }
    Sys.Date.YYMMDD = format(Sys.Date(), "%y%m%d")
    if(output_filename.xlsx %>% str_detect("YYMMDD")) {
        output_filename.xlsx = output_filename.xlsx %>% str_replace_all(fixed("YYMMDD"), Sys.Date.YYMMDD)
    }
    
    if(!overwrite && file.exists(output_filename.xlsx)) {
        paste0("file.exists(",deparse(output_filename.xlsx), ") -> Consider: overwrite = TRUE  \n") |> warning(immediate. = TRUE)
        if(xls.open_or_browseURL) env1$f$f_file_xls.open_or_browseURL(output_filename.xlsx) else paste0("env1$f$f_file_xls.open_or_browseURL(",deparse(output_filename.xlsx),")  \n") |> message(appendLF = FALSE)
        return(invisible())
    }
    if(orphan_nb_html.remove) env1$f$f_path.list.files_orphan_nb_html.remove(execute = FALSE)
    
    input_path.file.info = input_path |> env1$f$f_path.file.info(pattern = pattern, all.files = all.files, full.names = full.names, recursive = recursive, ignore.case = ignore.case, include.dirs = include.dirs, no.. = no.., arrange_by = arrange_by)
    
    # openxlsx2::write_xlsx(input_path.file.info, file = output_filename.xlsx, as_table = TRUE, col_widths = "auto", first_active_row = 2, first_active_col = 4)
    DataSet = input_path.file.info
    library(openxlsx2)
    wb = openxlsx2::write_xlsx(setNames(list(DataSet), "file.info"), as_table = TRUE, col_widths = "auto", first_active_row = 2, first_active_col = 5)
    # vec_col_index_to_hide = colnames(DataSet) %>% str_which(paste0(vec_colnames_to_hide, collapse = "|"))
    # vec_colnames_to_hide <- c("path_file", "path", "filename")
    # vec_col_index_to_hide = which(colnames(DataSet) %in% vec_colnames_to_hide)
    vec_colnames_to_show = c("path.relative", "filename_ext", "ext", "size_MiB", "isdir", "ModifiedDate")
    vec_col_index_to_hide = which(!colnames(DataSet) %in% vec_colnames_to_show)
    wb$set_col_widths(sheet = 1, cols = vec_col_index_to_hide, hidden = TRUE)
    wb |> wb_save(output_filename.xlsx)

    if(xls.open_or_browseURL) env1$f$f_file_xls.open_or_browseURL(output_filename.xlsx) else paste0("env1$f$f_file_xls.open_or_browseURL(",deparse(output_filename.xlsx),")  \n") |> message(appendLF = FALSE)
    invisible(input_path.file.info)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) list.file.info.xlsx  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "list.file.info")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) dir.file.info.xlsx  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dir.file.info")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_path.documents.file.info.xlsx  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.documents.file.info.xlsx"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path = env1$path$path1, 
        pattern = "\\.(txt|csv|doc[mx]?|xls[mx]?|ppt[mx]?|pdf|html)$", 
        all.files = FALSE, full.names = TRUE, recursive = ifelse(is.null(pattern), FALSE, TRUE),
        ignore.case = TRUE, include.dirs = TRUE, no.. = TRUE,
        arrange_by = c("mtime"), 
        output_filename.xlsx = file.path.paste0_collapse_if_not_empty(env1$path$path1, "FolderName-documents.file.info-YYMMDD.xlsx"), overwrite = FALSE, xls.open_or_browseURL = TRUE, orphan_nb_html.remove = TRUE) {
    env1$f$f_path.file.info.xlsx(input_path = input_path, pattern = pattern, all.files = all.files, full.names = full.names, recursive = recursive, ignore.case = ignore.case, include.dirs = include.dirs, no.. = no.., arrange_by = arrange_by, output_filename.xlsx = output_filename.xlsx, overwrite = overwrite, xls.open_or_browseURL = xls.open_or_browseURL, orphan_nb_html.remove = orphan_nb_html.remove)
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_path.DOCs_Rcode.file.info.xlsx ====
## Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
## Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.DOCs_Rcode.file.info.xlsx"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path = env1$path$path1, 
        list_DataSetName_pattern = list(DOCs = "\\.(txt|csv|doc[mx]?|xls[mx]?|ppt[mx]?|pdf|html)$", Rcode = "\\.(r|rmd)$"), 
        all.files = FALSE, full.names = TRUE, recursive = TRUE,
        ignore.case = TRUE, include.dirs = TRUE, no.. = TRUE,
        arrange_by = c("mtime"), 
        output_filename.xlsx = paste0(env1$path$path1, "/ProjectDocuments/", "FolderName-DOCs_Rcode.file.info-YYMMDD.xlsx"), overwrite = FALSE, xls.open_or_browseURL = TRUE, orphan_nb_html.remove = TRUE) { 

    library(openxlsx2)
    input_path = input_path |> normalizePath(winslash = "/")
    
    output_filename.xlsx = output_filename.xlsx |> normalizePath(winslash = "/", mustWork = FALSE)
    if (Sys.info()["sysname"] == "Windows") {  output_filename.xlsx = output_filename.xlsx |> str_replace("D:/D_Repositories", paste0(Sys.getenv("OneDriveConsumer"),"/[][Rproject]")|>str_replace_all("\\\\","/"))  }
    if(!dir.exists(dirname(output_filename.xlsx))) {dir.create(dirname(output_filename.xlsx), recursive = TRUE)}
    
    if(output_filename.xlsx %>% str_detect("FolderName")) {
        FolderName = input_path |> basename()
        output_filename.xlsx = output_filename.xlsx %>% str_replace_all(fixed("FolderName"), FolderName)
    }
    Sys.Date.YYMMDD = format(Sys.Date(), "%y%m%d")
    if(output_filename.xlsx %>% str_detect("YYMMDD")) {
        output_filename.xlsx = output_filename.xlsx %>% str_replace_all(fixed("YYMMDD"), Sys.Date.YYMMDD)
    }
    
    if(!overwrite && file.exists(output_filename.xlsx)) {
        paste0("file.exists(",deparse(output_filename.xlsx), ") -> Consider: overwrite = TRUE  \n") |> warning(immediate. = TRUE)
        if(xls.open_or_browseURL) env1$f$f_file_xls.open_or_browseURL(output_filename.xlsx) else paste0("env1$f$f_file_xls.open_or_browseURL(",deparse(output_filename.xlsx),")  \n") |> message(appendLF = FALSE)
        return(invisible())
    }
    if(orphan_nb_html.remove) env1$f$f_path.list.files_orphan_nb_html.remove(execute = FALSE)
    
    list_df = list_DataSetName_pattern %>% map(function(pattern) {
        input_path |> env1$f$f_path.file.info(pattern = pattern, all.files = all.files, full.names = full.names, recursive = recursive, ignore.case = ignore.case, include.dirs = include.dirs, no.. = no.., arrange_by = arrange_by)
    }) %>% set_names(paste0(names(list_DataSetName_pattern),Sys.Date.YYMMDD,"subdirs"))
    
    list_df_path1 = list_DataSetName_pattern %>% map(function(pattern) {
        input_path |> env1$f$f_path.file.info(pattern = pattern, all.files = all.files, full.names = full.names, recursive = FALSE, ignore.case = ignore.case, include.dirs = include.dirs, no.. = no.., arrange_by = arrange_by)
    }) %>% set_names(paste0(names(list_DataSetName_pattern),Sys.Date.YYMMDD,"path1"))

    list_df_ProjectDocuments = map2(list_df, list_df_path1, function(df, df_path1) {
        bind_rows(df_path1, df %>% filter(path %>% str_detect("ProjectDocuments"))) |> arrange(desc(!!sym(arrange_by)))
    # }) %>% set_names(paste0(names(list_DataSetName_pattern),Sys.Date.YYMMDD,"PrjDoc"))
    }) %>% set_names(paste0(names(list_DataSetName_pattern),Sys.Date.YYMMDD))
    
    env1$f$f_list_df.write_xlsx_table(list_df = c(list_df_ProjectDocuments, list_df), output_filename.xlsx = output_filename.xlsx, vec_colnames_to_show = c("path.relative", "filename_ext", "ext", "size_MiB", "isdir", "ModifiedDate"), first_active_row = 2, first_active_col = 5, overwrite = overwrite, xls.open_or_browseURL = xls.open_or_browseURL)
    
    invisible()
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) DOCs_Rcode.file.info.xlsx  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "DOCs_Rcode.file.info.xlsx")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) Rcode_DOCs.file.info.xlsx  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "Rcode_DOCs.file.info.xlsx")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.info.DOCs_Rcode.xlsx  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.info.DOCs_Rcode.xlsx")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.size_files =  ----  
# Rdev/00_base_program/f_path.size_files.source.r
.tmp$objectname = "f_path.size_files"
.tmp$object = function(.path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$", print2console = TRUE, VERBOSE = isTRUE(getOption("verbose"))) {
    
    for (.dependancy in c("f_df.t.tribble_construct")) {
        if(!.dependancy %in% names(.GlobalEnv$env1)) {
            if(Sys.getenv("VERBOSE")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
            .filename.source.r = .dependancy |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
        }
    }
    
    if (is.na(literal_filename)) {
        # filenames = list.files(path = .path4read) %>% {grep(regex4filename, .,  ignore.case = TRUE, value = TRUE)}
        filenames = list.files(path = .path4read, pattern = regex4filename, ignore.case = TRUE)
        if (length(filenames) == 0) {
            cat("No files found matching the regex4filename: ", regex4filename, "\n")
            return()
        }
    } else {
        # # filenames = list.files(path = .path4read) %>% {grep(literal_filename, .,  ignore.case = TRUE, value = TRUE, fixed = TRUE)}
        # filenames = list.files(path = .path4read) %>% {grep(literal_filename, ., value = TRUE, fixed = TRUE)}
        filenames = list.files(path = .path4read) |> str_subset(fixed(literal_filename))
        if (length(filenames) == 0) {
            cat("No files found matching the literal_filename: ", literal_filename, "\n")
            return()
        }
    }
    if(VERBOSE) filenames |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # dput(); |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # width.cutoff=500 is the max ---  
    if(print2console) cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); #----
    out = filenames %>% {file.info(file.path(.path4read,.))} %>%
        rownames_to_column("filename") %>% select(filename, size) %>%
        mutate(bytes = format(size, digits = 3, big.mark=","), 
               KB = format(size/2^10, digits = 3, big.mark=","), 
               MB = format(size/2^20, digits = 3, big.mark=","), 
               GB = format(size/2^30, digits = 3, big.mark=","))
    # out = out %>% mutate(filename = sub(.path4read, "", filename, fixed = TRUE) %>% {sub("^/", "", .)})
    out = out %>% mutate(filename = filename |> env1$f$f_path.relative()) 
    if(print2console) env1$f$f_df.tribble_construct(out)
    if(print2console) cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); #----
    return(out %>% select(filename, size))
} 
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) list.files.size  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "list.files.size")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) dir.size  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dir.size")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path0.list_path_hierarchy =  ----  
# Rdev/00_base_program/internal.f_path0.list_path_hierarchy.source.r
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path0.list_path_hierarchy"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path0, path_last = getwd(), .max_hierarchy = 5, VERBOSE = isTRUE(getOption("verbose"))) {
    # Initialize a list to hold the path hierarchy
    list_path = list()
    
    # Initialize a variable to keep track of the previous directory
    prev_dir <- ""
    
    # Loop to dynamically check the relationship between path_last and path0
    while (TRUE) {
        list_path <- c(list(path_last), list_path)  # Prepend the current path to the hierarchy
        if (VERBOSE) {
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_path.vec_filename_sans_ext_extended =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_filename_ext_extended.dev.Rmd
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_path.vec_filename_sans_ext_extended"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_path, vec_RegEx4ext_extended = c("\\.[^.]*\\.[gx]z$", "\\.nb\\.html$")) {
    
    input_filename_ext = basename(input_path)
    input_ext = 
        map2_chr(
            input_filename_ext %>% str_extract(vec_RegEx4ext_extended %>% paste0(collapse = "|")) %>% str_remove("^\\."), 
            input_filename_ext %>% tools::file_ext(), 
            function(x, y) ifelse(is.na(x), y, x)
        )
    input_filename = str_remove(input_filename_ext, paste0("\\.", input_ext, "$"))
    input_filename
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) filename_sans_ext_extended.vec  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "filename_sans_ext_extended.vec")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file_path_sans_ext_extended.vec  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file_path_sans_ext_extended.vec")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_path.vec_ext_extended =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_filename_ext_extended.dev.Rmd
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_path.vec_ext_extended"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_path, vec_RegEx4ext_extended = c("\\.[^.]*\\.[gx]z$", "\\.nb\\.html$")) {
    
    input_filename_ext = basename(input_path)
    input_ext = 
        map2_chr(
            input_filename_ext %>% str_extract(vec_RegEx4ext_extended %>% paste0(collapse = "|")) %>% str_remove("^\\."), 
            input_filename_ext %>% tools::file_ext(), 
            function(x, y) ifelse(is.na(x), y, x)
        )
    input_ext
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file_ext_extended.vec  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file_ext_extended.vec")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.df_filename_ext_extended =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_filename_ext_extended.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.df_filename_ext_extended"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_path, vec_RegEx4ext_extended = c("\\.[^.]*\\.[gx]z$", "\\.nb\\.html$")) {
    
    input_filename_ext = basename(input_path)
    input_ext = 
        map2_chr(
            input_filename_ext %>% str_extract(vec_RegEx4ext_extended %>% paste0(collapse = "|")) %>% str_remove("^\\."), 
            input_filename_ext %>% tools::file_ext(), 
            function(x, y) ifelse(is.na(x), y, x)
        )
    input_filename = str_remove(input_filename_ext, paste0("\\.", input_ext, "$"))
    
    # Return a data frame for easy further manipulation
    data.frame(
        dirname = dirname(input_path),
        filename = input_filename,
        ext = input_ext
    )
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) extract_filename_ext_extended.df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "extract_filename_ext_extended.df")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file_path_sans_ext.ext_extended.df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file_path_sans_ext.ext_extended.df")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) path_filename_ext_extended.df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "path_filename_ext_extended.df")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) filename_ext_extended.df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "filename_ext_extended.df")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file_ext_extended.df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file_ext_extended.df")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path_fileRegEX.rename =  ----  
# Rdev/00_base_program/001_base_file/f_path_fileRegEX.rename.dev.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path_fileRegEX.rename"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path = ".", gsub.pattern_from, gsub.replacement_to, full.names = TRUE, recursive = FALSE, move_to_renamed_path = FALSE, execute = FALSE) {

    if(move_to_renamed_path) stop("move_to_renamed_path not yet implemented.")

    cat("path == ", deparse(path), "\n", sep="")
    cat("path |> normalizePath() == ", deparse(path |> normalizePath()), "\n", sep="")

    # path.normalizePath = path |> normalizePath()

    # Get a list of files that match the old pattern, recursively if specified
    old_path_files <- list.files(path, pattern = gsub.pattern_from, full.names = full.names, recursive = recursive)

    # Check if there are any files to rename
    if (length(old_path_files) == 0) {
        message("No files found to rename.")
        return(NULL)
    }

    # Generate the new filenames by replacing the pattern in the old filenames
    old_filename_ext = basename(old_path_files)
    old_path = ifelse(old_path_files == basename(old_path_files), "", dirname(old_path_files))
    new_filename_ext = gsub(gsub.pattern_from, gsub.replacement_to, old_filename_ext)
    new_path_files <- ifelse(old_path == "", "", paste0(old_path, "/")) |> paste0(new_filename_ext)

    # Check if any directories are involved, warn user if necessary
    old_dirs <- old_path_files[file.info(old_path_files)$isdir]
    if (length(old_dirs) > 0) {
        warning("The following directories are being renamed. Be cautious, especially if they are not empty:  \n", deparse(old_dirs), "\n")
    }


    # Normalize paths only if full.names is TRUE
    if (full.names) {
        old_path_files <- old_path_files |> normalizePath(mustWork = TRUE)
        new_path_files <- new_path_files |> normalizePath(mustWork = FALSE)
    }

    # Check if the old files exist before renaming
    files_exist <- file.exists(old_path_files)
    if (!all(files_exist)) {
        warning("Some files do not exist or cannot be accessed:  \n", deparse(old_path_files[!files_exist]),  "\n")
        # return(NULL)
    }

    # If preview is requested, just return the proposed changes without executing
    if (!execute) {
        message("\n  *** Preview mode: No paths or files have been renamed. ***  ")
        # return(data.frame(old_path_files, new_path_files))
        # return(set_names(old_path_files, new_path_files))
        return(data.frame(old_path_files, new_path_files) |> t())
    } else {
        # If execute is TRUE, perform the renaming (after normalizing paths)
        renamed <- file.rename(from = old_path_files, to = new_path_files)

        # Check the result and provide feedback
        if (all(renamed)) {
            message("All paths and files renamed successfully.")
        } else {
            # Handle renaming errors (due to file system issues, permissions, etc.)
            warning("Some files could not be renamed, likely due to file system limitations or permissions:  \n", deparse(old_path_files[!renamed]), "\n")
        }
        return(data.frame(old_path_files, new_path_files, renamed) |> t())

    }

}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.list.files_orphan_nb_html.remove ====
## Rdev/00_base_program/001_base_file/f_path.list.files_orphan_nb_html.remove.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.list.files_orphan_nb_html.remove" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(project_path = env1$path$path1, execute = FALSE) {
    library(stringr)

    # Ensure the directory exists
    if (!dir.exists(project_path)) {
        stop("The specified directory does not exist.")
    }

    # List all .Rmd and .nb.html files in the project directory
    vec_path_file.rmd <- list.files(project_path, pattern = "(?i)\\.Rmd$", recursive = TRUE, full.names = TRUE) |> str_subset("[/\\\\]-BACKUP[/\\\\]", negate = TRUE)
    vec_path_file.nb.html <- list.files(project_path, pattern = "(?i)\\.nb\\.html$", recursive = TRUE, full.names = TRUE) |> str_subset("[/\\\\]-BACKUP[/\\\\]", negate = TRUE)

    # Extract base names without extensions
    vec_filename_sans_ext_extended.rmd <- str_remove(basename(vec_path_file.rmd), "(?i)\\.Rmd$")
    vec_filename_sans_ext_extended.nb.html <- str_remove(basename(vec_path_file.nb.html), "(?i)\\.nb\\.html$")

    # Find orphan .nb.html files
    vec_path_file.nb.html.orphan <- vec_path_file.nb.html[!vec_filename_sans_ext_extended.nb.html %in% vec_filename_sans_ext_extended.rmd]

    if (length(vec_path_file.nb.html.orphan) > 0) {
        message("The following orphan .nb.html files were found:")
        print(vec_path_file.nb.html.orphan)

        if (execute) {
            message("Moving orphan files to '-BACKUP' folder...")

            # Create BACKUP directories and move files
            for (i.file in vec_path_file.nb.html.orphan) {
                BACKUP_dir <- file.path(dirname(i.file), "-BACKUP")

                if (!dir.exists(BACKUP_dir)) {
                    dir.create(BACKUP_dir)
                }

                file.rename(i.file, file.path(BACKUP_dir, basename(i.file)))
            }
        } else {
            message("Set execute = TRUE to move the orphan files to a '-BACKUP' folder.")
        }
    } else {
        message("No orphan .nb.html files found.")
    }

    invisible(vec_path_file.nb.html.orphan)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) orphan_nb_html.remove  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "orphan_nb_html.remove")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) remove_orphan_nb_html  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "remove_orphan_nb_html")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) nb.html.orphan.remove  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "nb.html.orphan.remove")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) clean_orphan_nb_html  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "clean_orphan_nb_html")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_filename_ext.append_suffix =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_filename_ext.append_suffix.dev.r
.tmp$objectname = "f_filename_ext.append_suffix"
.tmp$object <- function(path_filename_ext, append_suffix, compression = TRUE, VERBOSE = getOption("verbose")) {
    # Extract the path, filename, and extension
    if(VERBOSE) "path_filename_ext" %>% ECHO.dput_get_ObjectName()
    
    path = path_filename_ext |> dirname()
    if(VERBOSE) "path" %>% ECHO.dput_get_ObjectName()
    filename_ext = path_filename_ext |> basename()
    if(VERBOSE) "filename_ext" %>% ECHO.dput_get_ObjectName()
    if(compression) {
        filename = filename_ext |> str_remove("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$")
        ext = filename_ext |> str_extract("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$") |> str_remove("^\\.")
    } else {
        filename = filename_ext |> str_remove("\\.([[:alnum:]]+)$")
        ext = filename_ext |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    }
    if(VERBOSE) "filename" %>% ECHO.dput_get_ObjectName()
    if(VERBOSE) "ext" %>% ECHO.dput_get_ObjectName()
    
    # Construct the new filename with appended text
    filename_ext2 = paste0(filename, append_suffix, ".", ext)
    if(VERBOSE) "filename_ext2" %>% ECHO.dput_get_ObjectName()
    
    # Construct the new path with the updated filename
    path_filename_ext2 = file.path(path, filename_ext2)
    
    return(path_filename_ext2)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.edit_windows_notepad.or_browseURL =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old2.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_chr_RegEx4heading.dev-PENDING.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old3-PENDING.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part2-PENDING.r
.tmp$objectname = "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.edit_windows_notepad.or_browseURL"
.tmp$object = function(
        input_path_file = rstudioapi::getSourceEditorContext()$path, 
        level4TOC = 2, RegEx4heading = paste0("^#{1,",level4TOC,"}[^#].*(-{4}|={4}) *$"), 
        remove_lines_with_no_alphabet = TRUE, cat2console = (level4TOC == 1), 
        add_line_numbers = TRUE, merge_with_input_vec_chr.except_TOC = FALSE, 
        output_path_file = NULL, replace_input_path_file = FALSE, edit_windows_notepad.or_browseURL = !cat2console) {
    
    library(stringr)

    ## :: input_vec_chr ====
    input_vec_chr <- readLines(input_path_file, warn = FALSE)
    
    ## :: input_vec_chr.except_TOC ====
    input_vec_chr.except_TOC <- input_vec_chr  # input_vec_chr.except_TOC is actually implemented in "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r". Here, just changing the variable name to input_vec_chr.except_TOC so that the code can be interchangeable with "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r".
    
    # input_vec_chr.except_TOC.na_if_NotMatching.trim <- str_replace_all(
    #     string = input_vec_chr,
    #     pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")},
    #     replacement = "\\1"
    # )
    
    ### |> env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) ----
    input_vec_chr.except_TOC.na_if_NotMatching = input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading)
    
    ### |> str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trail spaces ----
    input_vec_chr.except_TOC.na_if_NotMatching.trim = input_vec_chr.except_TOC.na_if_NotMatching %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trailing spaces. (Caution) This step should be done before applying env1$env.internal$f_vec_chr.add_line_numbers(). 

    ### |> env1$env.internal$f_vec_chr.add_line_numbers()    # trim before add_line_number~!! ----
    if(add_line_numbers) {
        input_vec_chr.except_TOC.na_if_NotMatching.trim.add_line_numbers = input_vec_chr.except_TOC.na_if_NotMatching.trim |> env1$env.internal$f_vec_chr.add_line_numbers()    # trim before add_line_number~!!
    } else {
        input_vec_chr.except_TOC.na_if_NotMatching.trim.add_line_numbers = input_vec_chr.except_TOC.na_if_NotMatching.trim    # if not add_line_numbers, just assign to new variable to make the same code work~!! 
    }
    
    ## :: vec_TABLE_OF_CONTENTS.trim.add_line_numbers ====
    vec_TABLE_OF_CONTENTS.trim.add_line_numbers = input_vec_chr.except_TOC.na_if_NotMatching.trim.add_line_numbers %>% na.omit()
    
    ### |> str_subset("[a-zA-Z]")    # remove_lines_with_no_alphabet ----  
    if (remove_lines_with_no_alphabet) vec_TABLE_OF_CONTENTS.trim.add_line_numbers = vec_TABLE_OF_CONTENTS.trim.add_line_numbers |> str_subset("[a-zA-Z]")    # remove_lines_with_no_alphabet  

    ### vec_TABLE_OF_CONTENTS.trim.add_line_numbers |> format_BEGINNING_END ====  
    vec_TABLE_OF_CONTENTS.trim.add_line_numbers = vec_TABLE_OF_CONTENTS.trim.add_line_numbers %>% 
        str_subset("# TABLE OF CONTENTS", negate = TRUE)
    vec_TABLE_OF_CONTENTS.trim.add_line_numbers = vec_TABLE_OF_CONTENTS.trim.add_line_numbers %>% 
        str_subset("@@ END", negate = TRUE)
    vec_TABLE_OF_CONTENTS.trim.add_line_numbers = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_TABLE_OF_CONTENTS.trim.add_line_numbers,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        message(paste0("Adding TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saving to : \n", deparse(output_path_file), "\n"))
    } else {
        output_path_file = tempfile(paste0(basename(input_path_file),"-TableOfContents-"), fileext = ".txt")
    }
    if(merge_with_input_vec_chr.except_TOC) output_vec_chr = c(vec_TABLE_OF_CONTENTS.trim.add_line_numbers, input_vec_chr.except_TOC) else output_vec_chr = vec_TABLE_OF_CONTENTS.trim.add_line_numbers
    writeLines(output_vec_chr, con = output_path_file)
    if(edit_windows_notepad.or_browseURL) env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file) else paste0("env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(", deparse(output_path_file), ")  \n") |> message(appendLF = FALSE)
    
    if(cat2console) vec_TABLE_OF_CONTENTS.trim.add_line_numbers %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(vec_TABLE_OF_CONTENTS.trim.add_line_numbers)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## :: f_file.vec_TABLE_OF_CONTENTS.NESTED =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old2.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_chr_RegEx4heading.dev-PENDING.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old3-PENDING.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part2-PENDING.r
.tmp$objectname = "f_file.vec_TABLE_OF_CONTENTS.NESTED"
.tmp$object = function(
        input_path_file = rstudioapi::getSourceEditorContext()$path, 
        max.level4TOC = 2, 
        remove_lines_with_no_alphabet = TRUE, cat2console = FALSE, 
        add_line_numbers = TRUE, merge_with_input_vec_chr.except_TOC = FALSE, 
        output_path_file = NULL, replace_input_path_file = FALSE, edit_windows_notepad.or_browseURL = !cat2console) {
    
    
    library(stringr)

    ## :: input_vec_chr ====
    input_vec_chr <- readLines(input_path_file, warn = FALSE)
    
    ## :: input_vec_chr.except_TOC ====
    input_vec_chr.except_TOC <- input_vec_chr  # input_vec_chr.except_TOC is actually implemented in "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r". Here, just changing the variable name to input_vec_chr.except_TOC so that the code can be interchangeable with "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r".
    
    vec_TABLE_OF_CONTENTS.list = list()
    for (i in 1:max.level4TOC) {
        vec_TABLE_OF_CONTENTS.list[[i]] = 
            env1$f$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.edit_windows_notepad.or_browseURL(
                input_path_file = input_path_file, 
                level4TOC = i, RegEx4heading = paste0("^#{1,",i,"}[^#].*(-{4}|={4}) *$"), 
                remove_lines_with_no_alphabet = TRUE, cat2console = FALSE, 
                add_line_numbers = TRUE, merge_with_input_vec_chr.except_TOC = FALSE, 
                output_path_file = NULL, replace_input_path_file = FALSE, edit_windows_notepad.or_browseURL = FALSE
            )
    }
    
    ## \% unlist(vec_TABLE_OF_CONTENTS.list) --> name `vec_TABLE_OF_CONTENTS.trim.add_line_numbers` so that the same code can be reused ====
    vec_TABLE_OF_CONTENTS.trim.add_line_numbers = unlist(vec_TABLE_OF_CONTENTS.list)
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        message(paste0("Adding TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saving to : \n", deparse(output_path_file), "\n"))
    } else {
        output_path_file = tempfile(paste0(basename(input_path_file),"-TableOfContents-"), fileext = ".txt")
    }
    if(merge_with_input_vec_chr.except_TOC) output_vec_chr = c(vec_TABLE_OF_CONTENTS.trim.add_line_numbers, input_vec_chr.except_TOC) else output_vec_chr = vec_TABLE_OF_CONTENTS.trim.add_line_numbers
    writeLines(output_vec_chr, con = output_path_file)
    if(edit_windows_notepad.or_browseURL) env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file) else paste0("env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(", deparse(output_path_file), ")  \n") |> message(appendLF = FALSE)
    
    if(cat2console) vec_TABLE_OF_CONTENTS.trim.add_line_numbers %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(vec_TABLE_OF_CONTENTS.trim.add_line_numbers)
    
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### (ALIAS) f_file.TableOfContentsNESTED.edit_windows_notepad.or_browseURL  ----
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_file.TableOfContentsNESTED.edit_windows_notepad.or_browseURL")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### (ALIAS) CurrentSourceEditorContext.TableOfContentsNESTED.edit_windows_notepad.or_browseURL  ----
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "CurrentSourceEditorContext.TableOfContentsNESTED.edit_windows_notepad.or_browseURL")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### (ALIAS) TableOfContentsNESTED_CurrentSourceEditorContext.edit_windows_notepad.or_browseURL  ----
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "TableOfContentsNESTED_CurrentSourceEditorContext.edit_windows_notepad.or_browseURL")

# ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ## ::OPTION:: f_file.vec_TABLE_OF_CONTENTS.NESTED.merge_with_input_vec_chr.except_TOC  ----
# .tmp$env1_subenv_name = "f"
# .tmp$objectname = "f_file.vec_TABLE_OF_CONTENTS.NESTED.merge_with_input_vec_chr.except_TOC"
# env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {
#     env1$f$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.edit_windows_notepad.or_browseURL(replace_input_path_file = TRUE, ...)
# }
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ### (ALIAS) CurrentSourceEditorContext.TableOfContentsNESTED.merge_with_input_vec_chr.except_TOC  ----
# env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "CurrentSourceEditorContext.TableOfContentsNESTED.merge_with_input_vec_chr.except_TOC")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.str_replace_all.old.ObjectName =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
.tmp$objectname = "f_file.str_replace_all.old.ObjectName"
.tmp$object <- function(input_path_file, old.ObjectName, new.ObjectName, output_path_file = NULL, replace_input_path_file = FALSE, edit_windows_notepad.or_browseURL = !cat2console) {
    # Construct the regex pattern for word boundary including dot and underscore
    regex_pattern <- sprintf("(?<![\\w_.])%s(?![\\w_.])", gsub("\\.", "\\\\.", old.ObjectName)) # Escape the dot in old.ObjectName
    
    # Read the file content
    input_vec_chr <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of old.ObjectName with new.ObjectName using the regex pattern
    input_vec_chr.except_TOC.na_if_NotMatching.trim <- str_replace_all(
        string = input_vec_chr,
        pattern = regex_pattern,
        replacement = new.ObjectName
    )
    
    # Determine the output path (overwrite or save to new file)
    if (is.null(output_path_file)) {
        if(replace_input_path_file) {
            output_path_file <- input_path_file # Overwrite the original file
        } else {
            output_path_file = input_path_file %>% f_filename_ext.append_suffix(paste0(".", new.ObjectName))
        }
    }
    
    # Write the updated content back to the file
    writeLines(input_vec_chr.except_TOC.na_if_NotMatching.trim, con = output_path_file)
    
    message(sprintf("Replaced '%s' with '%s' in %s.", old.ObjectName, new.ObjectName, output_path_file))
    return(output_path_file)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) f_ObjectName.f_file.str_replace_all  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_ObjectName.f_file.str_replace_all")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) find_and_replace_ObjectName  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "find_and_replace_ObjectName")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) replace_ObjectName  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "replace_ObjectName")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_CurrentSourceEditorContext.str_replace_all.old.ObjectName  ----  
.tmp$objectname = "f_CurrentSourceEditorContext.str_replace_all.old.ObjectName"
.tmp$object = function(old.ObjectName, new.ObjectName) {
    env1$f$f_file.str_replace_all.old.ObjectName(input_path_file = rstudioapi::getSourceEditorContext()$path, old.ObjectName = old.ObjectName, new.ObjectName = new.ObjectName, replace_input_path_file = TRUE, output_path_file = NULL)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) CurrentSourceEditorContext.str_replace_all.old.ObjectName  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "CurrentSourceEditorContext.str_replace_all.ObjectName")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) f_ObjectName.str_replace_all.CurrentSourceEditorContext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_ObjectName.str_replace_all.CurrentSourceEditorContext")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) find_and_replace_ObjectName.CurrentSourceEditorContext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "find_and_replace_ObjectName.CurrentSourceEditorContext")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) replace_ObjectName.CurrentSourceEditorContext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "replace_ObjectName.CurrentSourceEditorContext")

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.edit, f_file.open, f_URL.open ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### :: f_file.edit_if_exists ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_if_exists"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path_file) {
    if(file.exists(path_file)) file.edit(path_file) else warning(paste0("The file does not exist: ", path_file))
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.edit_if_exists  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.edit_if_exists")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.open_if_exists  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.open_if_exists")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) open_if_exists  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "open_if_exists")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### :: f_file.edit_windows.or_browseURL ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_windows.or_browseURL"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.file2edit) {  
    if (Sys.info()["sysname"] == "Windows") {  shell.exec(shQuote(.file2edit))  } else {warning('Sys.info()["sysname"] != "Windows"'); browseURL(.file2edit)}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.edit_windows.or_browseURL  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.edit_windows.or_browseURL")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_file.edit_windows_notepad.or_browseURL ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_windows_notepad.or_browseURL"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.file2edit) {
    if (Sys.info()["sysname"] == "Windows") {  paste0("notepad.exe"," ",shQuote(.file2edit)) |> shell(wait=FALSE)  }  else {warning('Sys.info()["sysname"] != "Windows"'); browseURL(.file2edit)}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.edit_windows_notepad.or_browseURL  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.edit_windows_notepad.or_browseURL")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_file.edit_windows_vscode.or_browseURL ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_windows_vscode.or_browseURL"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.file2edit) {
    if (Sys.info()["sysname"] == "Windows") {
        .path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/",mustWork=NA); paste0('cmd /c ""',.path4editor, '" "',.file2edit, '""') |> shell(wait=FALSE)
    } else {warning('Sys.info()["sysname"] != "Windows"'); browseURL(.file2edit)}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.edit_windows_vscode.or_browseURL  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.edit_windows_vscode.or_browseURL")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### :: f_URL.open_in_edge_app =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_URL.open_in_edge_app"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(URL) {
    if (Sys.info()["sysname"] == "Windows") {system(paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',URL,'"'), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)} else {utils::browseURL(URL); env1$env.internal.attach$f_URL.open_in_edge_app.printPowerShellCode(URL)}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) browseURL_in_edge_app  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "browseURL_in_edge_app")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### ::: f_URL.open_in_edge_app.printRCode =  ----  
# # "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% cat('if (Sys.info()["sysname"] == "Windows") { \'"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',., '"\' |> system(intern=TRUE) } else { utils::browseURL("',.,'") }', sep="")
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_URL.open_in_edge_app.printRCode"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(URL) {
    # URL %>% cat('env1$env.internal.attach$f_URL.open_in_edge_app("',.,'")  \n', sep="")
    # URL %>% cat("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }", sep="")
    URL %>% cat('if (Sys.info()["sysname"] == "Windows") { \'"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"\' |> system(intern=TRUE) } else { utils::browseURL("',.,'") }  \n', sep="")
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) browseURL_in_edge_app.printRCode  ----
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "browseURL_in_edge_app.printRCode")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### ::: f_URL.open_in_edge_app.printPowerShellCode =  ----  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_URL.open_in_edge_app.printPowerShellCode"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(URL) {
    URL %>% cat('cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="',.,'"  \n', sep="")
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) browseURL_in_edge_app.printPowerShellCode  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "browseURL_in_edge_app.printPowerShellCode")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### :: f_file.systemStart ====  
# Function to open files with the system's default application (fallback)
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.systemStart"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(file) {
    system(paste("start", shQuote(file)), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)
    # file |> shQuote() %>% paste0("start ",.) |> system(wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.open.systemStart  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.open.systemStart")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### :: f_file_PDF.sumatra ====  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.dev.r")
# Function to open PDF with Sumatra PDF
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file_PDF.sumatra"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        file,
        path.SumatraPDF.exe = NULL,
        ...
) {
    potentialPaths <- c(
        file.path(Sys.getenv("LOCALAPPDATA"), "SumatraPDF", "SumatraPDF.exe"),
        file.path(Sys.getenv("APPDATA"), "SumatraPDF", "SumatraPDF.exe"),
        file.path(sub("rstudio.exe$", "", Sys.getenv("RSTUDIO_DESKTOP_EXE")), "resources/app/bin/sumatra/SumatraPDF.exe")
    )
    # If path.SumatraPDF.exe is not provided, find the first existing path from the list
    if (is.null(path.SumatraPDF.exe)) { path.SumatraPDF.exe <- potentialPaths[which(file.exists(potentialPaths))[1]] }
    # If no valid Sumatra executable found, use the system default application
    if (is.null(path.SumatraPDF.exe) || !file.exists(path.SumatraPDF.exe)) {
        warning("SumatraPDF.exe not found. Opening file with the system default viewer instead.", call. = FALSE)
        return(invisible(env1$env.internal.attach$f_file.systemStart(file)))
    }
    file <- normalizePath(file, winslash = "/")
    path.SumatraPDF.exe <- normalizePath(path.SumatraPDF.exe, winslash = "/")
    if (!file.exists(file)) {
        stop(paste("The following file doesn't exist:", file))
    }
    # Ignore non-PDF files
    pdf <- grepl(".pdf$", file)
    if (any(!pdf)) {
        warning("Ignoring non-PDF file", paste(file[!pdf], collapse = ", "))
        file <- file[pdf]
    }
    if (length(file) < 1) return("No files were left to open with SumatraPDF.exe")
    # Construct the command to open SumatraPDF
    sumafile <- paste(shQuote(c(path.SumatraPDF.exe, file)), collapse = " ")
    out <- try(system(sumafile, wait = FALSE, ...), silent = TRUE)
    return(invisible(out))
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.open.PDF.sumatra  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.open.PDF.sumatra")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.system_switch_open ====  
.tmp$objectname = "f_file.system_switch_open"
.tmp$object = function(file) {
    stopifnot(file.exists(file))
    
    file <- normalizePath(file, mustWork = TRUE)
    
    switch(Sys.info()["sysname"], 
        Linux = {
            app <- Sys.getenv("BROWSER", "xdg-open")
            system2(app, file)
        }, 
        Windows = {
            shell.exec(shQuote(file))
        }, 
        Darwin = {
            system2("open", shQuote(file))
        }, 
        stop("Operating system not handled: ", toString(userSystem))
    )
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.open.system_switch  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.open.system_switch")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) system_switch.file.open  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "system_switch.file.open")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file_xls.open_or_browseURL ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_file_xls.open_or_browseURL"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path_file, EXECUTE = TRUE) {
    if (Sys.info()["sysname"] == "Linux") browseURL(path_file) else openxlsx2::xl_open(path_file)
    # if (Sys.info()["sysname"] == "Linux") {
    #     browseURL(path_file) 
    # } else {
    #     .packagename = "openxlsx2"; if(!require(.packagename, character.only=TRUE)) warning(paste("Package", .packagename, "is not installed. Please install it before running this script.  \n install.packages(",deparse(.packagename),")"))
    #     openxlsx2::xl_open(path_file)
    # }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) xls.open_or_browseURL  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "xls.open_or_browseURL")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) open_xls.or.browseURL_xlsx  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "open_xls.or.browseURL_xlsx")

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.BACKUP, f_path.BACKUP ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_filename_ext.createBACKUP ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_filename_ext.createBACKUP"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(BACKUP_from_path_filename_ext, BACKUP_from_ext = NA, .BACKUP_to_path = file.path(env1$path$path0, "-BACKUP"), timeFormat = "%y%m%d_%H%M", overwrite=TRUE) {
    # Wrap the main BACKUP logic in a tryCatch for error handling
    tryCatch({
        # Determine the filename and extension if not provided
        if(is.na(BACKUP_from_ext)) {
            BACKUP_from_path_filename = basename(BACKUP_from_path_filename_ext) |> str_remove("\\.([[:alnum:]]+)$")
            BACKUP_from_ext = basename(BACKUP_from_path_filename_ext) |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
        } else {
            BACKUP_from_path_filename = basename(BACKUP_from_path_filename_ext) |> str_remove(paste0("\\.",BACKUP_from_ext|>str_replace_all("\\.","\\\\."),"$"))
        }
        
        # Construct the destination BACKUP path with timestamp
        .BACKUP_to_path_filename_ext = file.path( .BACKUP_to_path, paste0(BACKUP_from_path_filename,"-",format(Sys.time(),timeFormat),".",BACKUP_from_ext) )
        
        # Create the BACKUP directory if it doesn't exist
        if(!dir.exists(.BACKUP_to_path)) dir.create(.BACKUP_to_path, recursive = TRUE)
        

        if(!file.exists(BACKUP_from_path_filename_ext)) stop(paste0("File to BACKUP does not exist: ", BACKUP_from_path_filename_ext))
        if(file.exists(.BACKUP_to_path_filename_ext) && !overwrite) stop(paste0("BACKUP file already exists: ", .BACKUP_to_path_filename_ext))
        
        # Copy the file to the BACKUP location; if successful, print a message. Otherwise, stop with an error. 
        if (file.copy(from=BACKUP_from_path_filename_ext, to=.BACKUP_to_path_filename_ext, overwrite=overwrite)) {message(paste0("- BACKUP file created: ", .BACKUP_to_path_filename_ext))} else {stop("File copy failed for unknown reasons.")}
    }, error = function(e) {
        # Error handling block to catch any issues during the BACKUP process
        message(paste("Failed to create BACKUP for:", BACKUP_from_path_filename_ext))
        message("Error:", e$message)
    })
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.BACKUP  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.BACKUP")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) file.copy_createBACKUP  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.copy_createBACKUP")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_path_path.BACKUP.overwrite ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path_path.BACKUP.overwrite"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.overwrite_from_path_filename_ext, .destination_path_filename_ext, .BACKUP_to_path = dirname(.destination_path_filename_ext), timeFormat = "%y%m%d", createFile = FALSE) {
    if(createFile || file.exists(.destination_path_filename_ext)) {
        if(!is.null(.BACKUP_to_path)) {
            env1$env.internal.attach$f_filename_ext.createBACKUP(BACKUP_from_path_filename_ext = .destination_path_filename_ext, .BACKUP_to_path=.BACKUP_to_path, timeFormat=timeFormat)
        }
        if(file.copy(from=.overwrite_from_path_filename_ext, to=.destination_path_filename_ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_filename_ext)) else warning(paste0("Update failed: ", .destination_path_filename_ext))
    } else {warning(paste0("File does not exist: ", .destination_path_filename_ext))}
}


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_git ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.is_git_tracked  =======  
# Function to check if the current project or any of its parent directories are tracked by Git
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path.is_git_tracked"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path = getwd(), check_parents = TRUE) {
    # Normalize the path
    path <- normalizePath(path, winslash = "/", mustWork = TRUE)
    
    # Traverse up the directory tree if check_parents is TRUE
    while (TRUE) {
        # Check if the .git directory exists in the current path
        git_dir <- file.path(path, ".git")
        if (dir.exists(git_dir)) {
            return(git_dir)
        }
        
        # If not checking parent directories, return NA
        if (!check_parents) {
            return(NA)
        }
        
        # Move to the parent directory
        parent_path <- dirname(path)
        
        # If the parent directory is the same as the current directory, we've reached the root
        if (parent_path == path) {
            return(NA)
        }
        
        # Update the current path to the parent path
        path <- parent_path
    }
}

# # Usage example: Check if the current working directory or its parent directories are tracked by Git
# git_path <- is_git_tracked(check_parents = TRUE)
# if (!is.na(git_path)) {
#   message("The current project is tracked by Git at: ", git_path)
# } else {
#   message("The current project is not tracked by Git.")
# }

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### :: env1\$path\$git_path =  =======  
env1$path$git_path = env1$env.internal.attach$f_path.is_git_tracked()
# env1$path$no_git = is.na(env1$path$git_path)



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.git_lfs_track_add_f ====  

# Rdev/00_base_terminal/f_file.git_lfs_track_add_f.dev.r
# https://chatgpt.com/c/6719a3d0-9a2c-800e-8651-2ae6901ae573
# https://gemini.google.com/app/c1606939ea272140
env1$f$f_file.git_lfs_track_add_f = function(.path_file, EXECUTE = FALSE, SkipIfAlreadyAdded = TRUE) {
    git_lfs_available = try(system2("git", args = "lfs version", stdout = FALSE, stderr = FALSE) == 0, silent = TRUE)    # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a  # https://gemini.google.com/app/6d9de55c5c7085c6
    
    # if(git_lfs_available) {
    #     invisible(
    #         list(
    #             paste0( "git lfs track ",shQuote(.path_file) )
    #             , paste0( "git add -f ",shQuote(.path_file) )
    #         ) |> map(env1$f$f_TerminalFromRCodeText.ECHO, EXECUTE)
    #     )
    # } else {
    #     warning("git lfs is not available  \n")
    #     invisible(
    #         paste0( "git add -f ",shQuote(.path_file) ) |> env1$f$f_TerminalFromRCodeText.ECHO(EXECUTE = EXECUTE)
    #     )
    # }
    
    if(!git_lfs_available) warning("git lfs is not available  \n")
    
    # Check if the file is already tracked by git without lfs
    git_ls_files_output = system2("git", args = c("ls-files", shQuote(.path_file)), stdout = TRUE, stderr = TRUE)

    is.AlreadyAdded = length(git_ls_files_output) > 0

    if (SkipIfAlreadyAdded && is.AlreadyAdded) {
        message(paste(.path_file, "is already added to git. Skipping git lfs track."))
        return(invisible())
    } else {
        return(invisible(
            list(
                paste0( "git lfs track ",shQuote(.path_file) )
                , paste0( "git add -f ",shQuote(.path_file) )
            ) |> map(env1$f$f_TerminalFromRCodeText.ECHO, EXECUTE)
        ))
    }
}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: function_name = f_gitattributes.split() ====
## git/f_gitattributes.split_lfs.dev.Rmd
## git/f_gitattributes.update_non_lfs.dev.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_gitattributes.split" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path = paste0(env1$path$path1,"/.gitattributes"), 
        output_path.lfs = paste0(env1$path$path1,"/.lfs.gitattributes"), 
        split_non_lfs = TRUE,
        output_path.non_lfs = paste0(env1$path$path1,"/.non_lfs.gitattributes"), 
        OPEN_OUTPUT = FALSE) {
    # Read the .gitattributes file
    input_path.lines <- readLines(input_path)

    # Separate input_path.lines into LFS and non-LFS groups
    
    if(TRUE) {
        input_path.lines.lfs <- input_path.lines %>% str_subset("\\blfs\\b")
        # Write LFS input_path.lines to a new file
        writeLines(input_path.lines.lfs, output_path.lfs)
        cat("LFS lines extracted to \t:", deparse(output_path.lfs), "  \n", sep="")
        if(OPEN_OUTPUT) env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path.lfs)
    }

    if(split_non_lfs) {
        input_path.lines.non_lfs <- input_path.lines %>% str_subset("\\blfs\\b", negate = TRUE)
        # Write non-LFS input_path.lines to another new file
        writeLines(input_path.lines.non_lfs, output_path.non_lfs)
        cat("Non-LFS lines extracted to \t:", deparse(output_path.non_lfs), "  \n", sep="")
        if(OPEN_OUTPUT) env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path.non_lfs)
    }
    
    invisible()
}

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.save ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f = function(
        .objectname, 
        CompressionMethod = case_when(object.size(get(.objectname)) >= 1e8 ~ "none", object.size(get(.objectname)) >= 1e6 ~ "xz", TRUE ~ "gz"), 
        .filename_ext4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz", ".xz", "")), 
        .path4write = env1$path$.path4write,
        .path_file = if(is.null(.path4write) || is.null(.filename_ext4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.filename_ext4write)  }, 
        createBACKUP = FALSE, 
        .BACKUP_to_path="-BACKUP", 
        EXECUTE = FALSE, 
        path.size_files = TRUE, 
        git_lfs_track = "determine based on object size", 
        git_add_f = TRUE, 
        SkipIfAlreadyAdded = TRUE, 
        LinePrefix4CodeText = "\t", 
        VERBOSE = isTRUE(getOption("verbose")),
        DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    
    # options(DEBUGMODE = TRUE)
    # options(DEBUGMODE = FALSE)
    if(DEBUGMODE) browser()
    # Browse[1]> environment() %>% as.list(all.names = TRUE) %>% str()
    # List of 15
    #  $ .objectname        : chr "df_NewDMv3.CensorEND.n8845.select971"
    #  $ .filename_ext4write: chr "df_NewDMv3.CensorEND.n8845.select971.rds.xz"
    #  $ .path4write        : chr "."
    #  $ .path_file         : NULL
    #  $ createBACKUP       : logi FALSE
    #  $ .BACKUP_to_path    : chr "-BACKUP"
    #  $ EXECUTE            : logi FALSE
    #  $ path.size_files    : logi TRUE
    #  $ git_lfs_track      : logi TRUE
    #  $ git_add_f          : logi TRUE
    #  $ SkipIfAlreadyAdded : logi TRUE
    #  $ CompressionMethod  : chr "xz"
    #  $ LinePrefix4CodeText: chr "\t"
    #  $ VERBOSE            : logi FALSE
    
    
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    ##@ If only .objectname is provided, get .object from get(.objectname)
    .object <- get(.objectname)

    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ -> By here, both .object and .objectname are available.
    .object.size <- object.size(.object)
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if(exists("MetaData")) {
        if("DataSetNames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DataSetNames)) {
                # assign(.objectname, structure(get(.objectname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                assign(.objectname, structure(get(.objectname), MetaData = as.environment(MetaData)))
                assign(".object", structure(.object, MetaData = as.environment(MetaData)))
            }
        } 
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if (.object.size >= 1e8) {
        paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.") |> warning(call. = FALSE, immediate. = TRUE)
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ If .path_file is provided, it determines the .filename_ext4write (& CompressionMethod). 
    ## Caution) when .objectname is provided, .filename_ext4write & .path_file could have been auto-generated. 
    
    if(!is.null(.path_file)) {
        .filename_ext4write = basename(.path_file)
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ If .filename_ext4write is provided, it may determine the CompressionMethod. 
    ## Caution) When .filename_ext4write & .path4write is provided, .path_file can be auto-generated, so .path_file may not be NULL. 
    if(!is.null(.filename_ext4write)) {
        if(grepl("\\.xz$", .filename_ext4write)) {
            CompressionMethod = "xz"
        } else if(grepl("\\.gz$", .filename_ext4write)) {
            CompressionMethod = "gz"
        # } else {
        #     CompressionMethod = "none" | "gz"  # gz compression may be done without ".gz" extension. 
        }
    }

    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ .path4write may still be NULL if env1$path$.path4write was NULL.
    # if(is.null(.path4write))            .path4write = env1$path$.path4write
    if(is.null(.path4write))            .path4write = ""
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    ##@ .path_file may still be NULL if either .path4write or .filename_ext4write was NULL.
    if(is.null(.path_file))             .path_file = if(is.null(.path4write) || is.null(.filename_ext4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.filename_ext4write)  }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if(createBACKUP) cat(LinePrefix4CodeText, 'env1$env.internal.attach$f_filename_ext.createBACKUP(BACKUP_from_path_filename_ext = ',deparse(.path_file),', .BACKUP_to_path=',deparse(.BACKUP_to_path),', timeFormat="%y%m%d_%H", overwrite=TRUE)', "  \n", sep="")
    cat("\t", .objectname, ' |> write_rds(',shQuote(.path_file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\\n")', "  \n", sep="")
    if(path.size_files) cat(LinePrefix4CodeText, 'env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    
    if(EXECUTE) {
        if(createBACKUP) env1$env.internal.attach$f_filename_ext.createBACKUP(BACKUP_from_path_filename_ext = .path_file, .BACKUP_to_path=.BACKUP_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE) 
        if (.object.size >= 1e8) {
            paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> No Auto-execution.") |> warning(call. = FALSE, immediate. = TRUE)
        } else { 
            .object |> write_rds( .path_file, compress = CompressionMethod, compression = 9L ) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
            if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
        }
    }
    
    if(git_add_f) {
        if (git_lfs_track == "determine based on object size") {
            if(.object.size > 1e7) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, EXECUTE = FALSE); if(EXECUTE) warning("Caution: halting auto-execution of glt lfs track.  \n") 
            } else {
                env1$f$f_TerminalFromRCodeText.ECHO(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), EXECUTE = EXECUTE)
            }
        } else if (git_lfs_track == TRUE) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, EXECUTE = FALSE); if(EXECUTE) warning("Caution: halting auto-execution of glt lfs track.  \n") 
        } else {
            env1$f$f_TerminalFromRCodeText.ECHO(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), EXECUTE = EXECUTE)
        }
    }
    
    invisible()
}
## *** Example Usage:  
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10)
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "fhs.index100le10")
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10, .path_file = "./data/fhs.index100le10.rds.xz")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_object.get_objectname.size.write_rds.git_lfs_track_add_f  - PENDING ====  
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 

# env1$f$f_object.get_objectname.size.write_rds.git_lfs_track_add_f = function(.object, ...) {
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     ##@ Check if the .object and .objectname are confused.
#     if (!is.null(.object)) {
#         if(is.character(.object) && length(.object) == 1) {
#             # .objectname <- .object
#             # .object <- get(.object)
#             "is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?" |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
#         } 
#     }
#     
#     env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = env1$env.internal.attach$f_object.get_objectname(.object), ...)
# }


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.update ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: env.internal\$f_file2.compare ====  
# Function to compare two source code files chunk-by-chunk using while loop with a chunk size of 64KB
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file2.compare"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(file1, file2, chunk_size = 65536) {
    # Open both files in binary mode
    con1 <- file(file1, "rb")
    con2 <- file(file2, "rb")
    
    # Ensure files are closed after comparison
    on.exit({
        close(con1)
        close(con2)
    })
    
    # Initialize the first chunks
    chunk1 <- readBin(con1, what = "raw", n = chunk_size)
    chunk2 <- readBin(con2, what = "raw", n = chunk_size)
    
    # While at least one of the chunks has content, continue comparing
    while(length(chunk1) > 0 || length(chunk2) > 0) {
        # If the chunks differ, return FALSE
        if (!identical(chunk1, chunk2)) {
            return(FALSE)
        }
        
        # Read the next chunk for both files
        # The file pointer moves automatically as you read, so each call to readBin() continues where the last one left off.
        chunk1 <- readBin(con1, what = "raw", n = chunk_size)
        chunk2 <- readBin(con2, what = "raw", n = chunk_size)
    }
    
    # If all chunks are identical and EOF is reached for both files, return TRUE
    return(TRUE)
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: env.internal\$f_url_destfile.DownloadIfDifferent ====  
# Function to download a file only if the web file is different from the local file
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_url_destfile.DownloadIfDifferent"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(url, destfile, chunk_size = 65536, VERBOSE = getOption("verbose"), EXECUTE = FALSE) {  # Default 64KB chunk size
    tryCatch({
        # Temporary file to download the remote file for comparison
        temp_file <- tempfile()
        download.file(url, temp_file, quiet = TRUE)
        
        # Compare the local file and the remote file (if local file exists)
        if (file.exists(destfile)) {
            files_are_identical <- env1$env.internal.attach$f_file2.compare(destfile, temp_file, chunk_size)
            
            if (files_are_identical) {
                message(paste0("No update needed for: ", destfile))
                return(FALSE)
            }
        }
        
        # If files are different or local file doesn't exist, proceed with the download
        if(VERBOSE||!EXECUTE) message(paste0("* Update needed for: ", destfile))
        if(VERBOSE||!EXECUTE) cat("> file.copy(from = ", deparse(temp_file), ", to = ", deparse(destfile), ", overwrite = TRUE)", "  \n", sep="") 
        if(EXECUTE) {file.copy(from = temp_file, to = destfile, overwrite = TRUE); message(paste0("Downloaded & updated: ", destfile))}
        return(EXECUTE)
        
    }, error = function(e) {
        message(paste0("Failed to download or update: ", url))
        message("Error:", e$message)
        return(FALSE)
    })
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### \$f\$f.updateTemplates ====  
# https://github.com/mkim0710/f.updateTemplates.exe.r
env1$f$f.updateTemplates = function(.path4APPDATA_RStudio = NULL, TestMode = TRUE, VERBOSE = getOption("verbose"), EXECUTE = TRUE) {
    #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++
    # Assign .path4APPDATA_RStudio based on the platform if it's NULL
    if (is.null(.path4APPDATA_RStudio)) {
        if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
    }
    
    # Create the templates directory if it doesn't exist
    if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
    
    # # \% Edit the templates of RStudio (default.R, notebook.Rmd) ~~~~~~~~~~~~
    # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
    # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
    
    # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~
    for (.filename_ext in c("default.R", "templates-00env1.minimum.Rmd")) {
        if (.filename_ext == "templates-00env1.minimum.Rmd") {
            .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd")
        } else {
            .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", .filename_ext)
        }
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/","rstudio-prefs/templates/",.filename_ext)
        UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
        
        if (Sys.info()["sysname"] == "Windows") {
            # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
            # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_filename_ext), output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
            
            .file.copy.to = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",.filename_ext)
            .BACKUP_to_path = "D:/OneDrive/[][Rproject]/-BACKUP"
            UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
            if(UPDATED) env1$env.internal.attach$f_filename_ext.createBACKUP(BACKUP_from_path_filename_ext = .file.copy.to, .BACKUP_to_path=.BACKUP_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE)
        }
    }
    if (Sys.info()["sysname"] == "Windows" && UPDATED)  cat('browseURL("D:/OneDrive/[][Rproject]/-BACKUP")', "\n")
    
    # \% Update the .Rprofile  @ Project Directory (& User Folder? may cause an error) ~~~~~~~~~~~~
    for (.filename_ext in c(".gitignore", ".Rprofile")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.filename_ext)
        # for (.file.copy.to in file.path(env1$path$path1,.filename_ext)) {
        for (.file.copy.to in c(file.path(env1$path$path1,.filename_ext), file.path("~",.filename_ext)|>normalizePath(winslash="/",mustWork=FALSE), paste0(Sys.getenv("USERPROFILE"),"/",.filename_ext), paste0(Sys.getenv("USERPROFILE"),"/Documents/",.filename_ext))) {
            if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.filename_ext)) {
                UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
            }
        }
    }
    
    # \% Update the f.updateTemplates.exe.r, RStudioServer-setup.r  @ Project Directory ~~~~~~~~~~~~
    for (.filename_ext in c("f.updateTemplates.exe.r", "RStudioServer-setup.r")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.filename_ext)
        .file.copy.to = file.path(env1$path$path1,.filename_ext)
        UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
    }
    
    # # remove old files
    # for (.file.old in c("updateTemplates.R", "f.updateTemplates.source.r")) {
    #     if (file.exists(.file.old) && file.exists("f.updateTemplates.exe.r")) {
    #         file.remove(.file.old)
    #         warning(paste0("Removed old file: ", .file.old))
    #     }
    # }
    
    # *** be careful not to overwite .gitattributes~! git LFS may become regular file~!
    
    # if(.Platform$OS.type == "unix") {
    #     if(Sys.info()["sysname"] == "Linux") {
    #         if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
    #             
    #         } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
    #             .file.copy.from = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH240515%20copilot.json"
    #             .file.copy.to = "~/.config/rstudio/rstudio-prefs.json"
    #             UPDATED = env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to, VERBOSE = VERBOSE, EXECUTE = EXECUTE)
    #         } else if(Sys.info()["sysname"] == "Darwin") {
    #             
    #         }
    #     } else if(Sys.info()["sysname"] == "Windows") {
    #         
    #     }
    # }
}


##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ source() ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_sourcePath.execute_if_not_sourced =  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_sourcePath.execute_if_not_sourced"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.subpath_filename.source.r = if(!is.null(.subpath) && !is.null(.filename.source.r)) paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r) else NULL, .subpath = NULL, .filename.source.r = NULL, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    # options(DEVMODE = TRUE)
    # options(DEVMODE = FALSE)
    # options(DEBUGMODE = TRUE)
    # options(DEBUGMODE = FALSE)
    if(DEBUGMODE) browser()
    # Browse[1]> environment() %>% as.list(all.names = TRUE) %>% str
    # List of 4
    #  $ .subpath_filename.source.r: chr "Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r"
    #  $ .subpath                  : NULL
    #  $ .filename.source.r        : NULL
    #  $ RELOAD_FUNCTION    : logi TRUE
    # if(is.null(.subpath_filename.source.r) && !is.null(.subpath) && !is.null(.filename.source.r)) .subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r)
    if(is.null(.filename.source.r)) .filename.source.r = basename(.subpath_filename.source.r)
    if(RELOAD_FUNCTION || !.filename.source.r %in% names(.GlobalEnv$env1$source)) {  
        RELOAD_FUNCTION0 = getOption("RELOAD_FUNCTION"); options(RELOAD_FUNCTION = TRUE)  # Temporarily set options(RELOAD_FUNCTION = TRUE). -> Caution: Even if getOption("RELOAD_FUNCTION") was NULL or FALSE, options(RELOAD_FUNCTION = TRUE) should be passed to the functions inside source(). 
        
        #@ DEBUG) .subpath_filename.source.r is given as the full path or URL
        # > .subpath_filename.source.r = "https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r"
        # > .subpath_filename.source.r %>% relative_path()
        # [1] "https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r"
        # Warning message:
        # In normalizePath(path, winslash = "/") :
        #   path[1]="https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r": No such file or directory
        # > file.exists("https://raw.githubusercontent.com/mkim0710/tidystat/master/env1$env.internal.source.r")
        # [1] FALSE
        
        .source_base.subpath_filename.source.r = 
            if (file.exists(.subpath_filename.source.r)) {
                .subpath_filename.source.r
            } else if (file.exists(paste0(env1$path$source_base_local, "/", .subpath_filename.source.r))) {
                paste0(env1$path$source_base_local, "/", .subpath_filename.source.r)
            } else if (  grepl("^http", .subpath_filename.source.r, ignore.case = TRUE) || 
                         grepl("githubusercontent\\.com", .subpath_filename.source.r, ignore.case = TRUE) ||
                         grepl("github\\.com", .subpath_filename.source.r, ignore.case = TRUE)  ) {
                .subpath_filename.source.r
            } else {
                paste0(env1$path$source_base_github, "/", .subpath_filename.source.r)
            }
        .GlobalEnv$env1$source[[.filename.source.r]] = .source_base.subpath_filename.source.r
        message('> source("',.source_base.subpath_filename.source.r,'")');
        source(.source_base.subpath_filename.source.r)
        
        options(RELOAD_FUNCTION = RELOAD_FUNCTION0)  # Restore previous options value for getOption("RELOAD_FUNCTION").
    }
}
## *** Example Usage:  
# env1$source$f_CodeBook_DataSet.lbl.source.r = NULL
# .filename.source.r = "f_CodeBook_DataSet.lbl" |> paste0(".source.r"); .subpath = r"(Rdev/10_import_clean_datatype/16_categorical_labelled)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# .filename.source.r = NULL; env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# env1$source$f_CodeBook_DataSet.lbl.source.r
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) source_if_not_sourced  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "source_if_not_sourced")

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_sourcePath.execute.force_reload  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_sourcePath.execute.force_reload"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {
    # browser()
    # Browse[1]> ls(all.names = TRUE)
    # [1] "..."
    # Browse[1]> list(...)
    # $.subpath_filename.source.r
    # [1] "Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r"
    env1$f$f_sourcePath.execute_if_not_sourced(..., RELOAD_FUNCTION = TRUE)
}
## *** Example Usage:  
# env1$source$f_CodeBook_DataSet.lbl.source.r = ""
# .filename.source.r = "f_CodeBook_DataSet.lbl" |> paste0(".source.r"); .subpath = r"(Rdev/10_import_clean_datatype/16_categorical_labelled)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute.force_reload(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# env1$source$f_CodeBook_DataSet.lbl.source.r
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) source.force_reload  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "source.force_reload")
## Example Usage: 
# options(DEVMODE = TRUE)
# if(isTRUE(getOption("DEVMODE"))) source.force_reload(file.path.paste0_collapse_if_not_empty(env1$path$source_base, "Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r"))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## @ .filename.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r") =======  
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/internal.f_path0.list_path_hierarchy.source.r")
# .filename.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \$ list_path_hierarchy  =======  
.max_hierarchy = 5
env1$path$list_path_hierarchy = env1$env.internal.attach$f_path0.list_path_hierarchy(path0 = env1$path$path0, path_last = getwd(), .max_hierarchy = .max_hierarchy, VERBOSE = FALSE)
# for (i in 1:(.max_hierarchy)) {
#     # if(!is.na(env1$path$list_path_hierarchy[[i+1]]))
#     env1$path[[paste0("path", i)]] = env1$path$list_path_hierarchy[[i+1]]
# }

# cat("> str(env1$path$list_path_hierarchy)\n"); str(env1$path$list_path_hierarchy)
# cat("> str(env1$path)\n"); str(env1$path)    


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ .filename.source.r = "f_expression.substitute_ECHO_and_dput" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/00_base_program/007_base_expression/f_expression.substitute_ECHO_and_dput")
.filename.source.r = "f_expression.substitute_ECHO_and_dput" |> paste0(".source.r"); .subpath=r"(Rdev/00_base_program/007_base_expression)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))

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
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env1$env.internal.source.r"))
# # source(file.path("https://raw.githubusercontent.com/mkim0710/tidystat/master", "env1$env.internal.source.r"))

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \% source( file.path(env1$path$source_base,subpath_filename.source.r) ) ----  

# .tmp$objectname = "get_system_info"
# #  source(file.path(env1$path$source_base,"",paste0(.tmp$objectname,".source.r")))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

