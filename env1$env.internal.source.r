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
## :: f_env1_subenv_objectname.set_alias ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_env1_subenv_objectname.set_alias"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(subenv_name4object, objectname, subenv_name4alias = "env.internal.attach", aliasname) {
  attributes(.GlobalEnv$env1[[subenv_name4object]][[objectname]])$alias = 
      attributes(.GlobalEnv$env1[[subenv_name4object]][[objectname]])$alias |>
      c(  paste0("env1$", subenv_name4alias,"$",aliasname," = env1$",subenv_name4object,"$",objectname)  )
  .GlobalEnv$env1[[subenv_name4alias]][[aliasname]] = .GlobalEnv$env1[[subenv_name4object]][[objectname]]
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
### & alias = ls.map_get.str  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "ls.map_get.str")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_environment.list_objectnames_incl_hidden.map_get.str  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.list_objectnames_incl_hidden.map_get.str"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(environment = parent.frame(), ...) {
    env1$f$f_environment.list_objectnames.map_get.str(environment = environment, all.names = TRUE, ...)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = ls.all.names.map_get.str  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "ls.all.names.map_get.str")

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_function, f_expression, f_CodeText ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_function.load2env.internal ====  
env1$env.internal$f_function.load2env.internal = function(function_object, function_name, env1_subenv_name = "env.internal", show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE) {
    if(is.null(function.reload)) function.reload = FALSE 
        
    if(is.null(env1_subenv_name)) {
        if(function.reload || !function_name %in% names(.GlobalEnv$env1)) {
            .GlobalEnv$env1[[function_name]] = function_object
            if(runLoadedFunction) {
                cat("> .GlobalEnv$env1$",function_name,"()\n",sep=""); get(.GlobalEnv$env1[[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
            }
            if(show_packageStartupMessage) packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",function_name))
        }
    } else {
        if(function.reload || !function_name %in% names(.GlobalEnv$env1[[env1_subenv_name]])) {
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
## :: f_expression.eval.withCallingHandlers.attr_warnings.summary ====
# Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.attr_warnings.summary.dev.Rmd
.tmp$objectname = "f_expression.eval.withCallingHandlers.attr_warnings.summary"
.tmp$object = function(expression.eval, warnings.summary_only = TRUE, warnings.summary.print = TRUE) {
    options_warn_original <- getOption("warn")  # Save the current 'warn' option
    options(warn = 0)  # Set 'warn' to 0 to collect warnings
    list_warning <- list()  # Initialize an empty list to store warnings
    
    # Execute the expression.eval and capture warnings
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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = eval.attr_warnings.summary  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "eval.attr_warnings.summary")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = attr_warnings.summary  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "attr_warnings.summary")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = warnings.summary.expression_attr  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "warnings.summary.expression_attr")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = suppressWarnings.summary.as_attributes  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "suppressWarnings.summary.as_attributes")
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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = system.time.round.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "system.time.round.dput")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_ObjectName.get.dput.echo ====
# Rdev/00_base_program/007_base_expression/f_ObjectName.get.dput.echo.dev.r
.tmp$objectname = "f_ObjectName.get.dput.echo"
.tmp$object = function(ObjectName, envir = parent.frame(), ObjectName.parse.eval = FALSE, LinePrefix4CodeText = "\t") {
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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = get_ObjectName.dput.echo  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "get_ObjectName.dput.echo")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = dput_get_ObjectName.echo  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "dput_get_ObjectName.echo")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = echo.ObjectName.get.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "echo.ObjectName.get.dput")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_CodeText.echo ====
# Rdev/00_base_program/007_base_expression/f_CodeText.parse.eval.dput.echo.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.echo.dev.r
.tmp$objectname = "f_CodeText.echo"
.tmp$object = function(
        .CodeText,
        Execute = FALSE,
        deparse_cat = TRUE,
        LinePrefix4CodeText = "\t",
        LinePrefix4Output = "\t## ",
        substitute_ObjectNames = TRUE,
        ObjectNames4substitute = NULL,
        CodeEqualsOutput = TRUE,
        VERBOSE = options()$verbose,
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
    
    if(.CodeText |> str_detect("[\n;]") && Execute) {
        # warning('The newline character(s) will be substituted by "; "')
        # .CodeText = .CodeText |> str_replace_all('\n', "; ")
        # 'The newline character(s) is not allowed' |> stop(call. = FALSE) |> tryCatch(error = function(e) {message("stop: ", e); return(invisible())})
        'Execute not fully implemented for line feed (\\n) or semicolon (;)' |> warning("  \n", call. = FALSE, immediate. = TRUE)
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
        
        if(Execute) {
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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = echo.CodeText  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "echo.CodeText")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_CodeText.parse.eval.dput.echo  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_CodeText.parse.eval.dput.echo"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {
    env1$f$f_CodeText.echo(Execute = TRUE, ...)
}

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = eval_parse_CodeText.dput.echo  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "eval_parse_CodeText.dpu.echo")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = echo.CodeText.parse.eval.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "echo.CodeText.parse.eval.dput")


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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = echo.CodeText.parse.eval.dput  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "f_CodeText2.is_equal")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_TerminalFromRCodeText.echo ====  
# Rdev/00_base_program/f_TerminalFromRCodeText.echo.dev.r
# env1$f$f_TerminalFromRCodeText.echo
.tmp$objectname = "f_TerminalFromRCodeText.echo"
.tmp$object = function(.TerminalCodeText, Execute = FALSE, LinePrefix4CodeText = "\t") {
    .TerminalCodeText |> deparse() %>% {cat(LinePrefix4CodeText, ., " |> system(intern=TRUE)  \n", sep="")}
    if(Execute) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() %>% {paste(LinePrefix4CodeText, ., " |> system(intern=TRUE)  \n", sep="")}
    )
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = system.TerminalFromRCodeText.echo  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "system.TerminalFromRCodeText.echo")


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_object.substitute.deparse2objectname ====  
# Rdev/00_base_program/f_TerminalFromRCodeText.echo.dev.r
# https://chatgpt.com/c/67414018-5af8-800e-8f52-d7ab9467d69d
.tmp$objectname = "f_object.substitute.deparse2objectname"
.tmp$object = function(object) {  deparse(substitute(object))  }
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_file, f_URL, f_path ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: getSourceEditorContext.path_filename.ext ====  
.tmp$objectname = "getSourceEditorContext.path_filename.ext"
.tmp$object = function(relative_path = TRUE) {
    SourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/")
    if(relative_path) {
        SourceEditorContext.path_filename.ext = SourceEditorContext.path_filename.ext |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    }
    return(SourceEditorContext.path_filename.ext)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = CurrentSourceEditorContext.path_filename.ext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "CurrentSourceEditorContext.path_filename.ext")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path_file.paste0_if_not_empty ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path_file.paste0_if_not_empty"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path, filename.ext) {  paste0(path,ifelse(path=="","","/"),filename.ext)  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = paste0.path_file.if_not_empty  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "paste0.path_file.if_not_empty")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.path.paste0_if_not_empty  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.path.paste0_if_not_empty")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.relative ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_path.relative"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path, basepath = env1$path$path1) {
    path |> normalizePath(winslash="/") |> str_replace(fixed(basepath|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = path.relative  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "path.relative")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = relative_path  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "relative_path")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: getSourceEditorContext.update_LastSourceEditorContext.path_filename.ext =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "getSourceEditorContext.update_LastSourceEditorContext.path_filename.ext"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        check_rstudioapi = TRUE, 
        overwrite = FALSE, 
        LinePrefix4CodeText = "\t",
        VERBOSE = ifelse(!is.null(Sys.getenv("VERBOSE")), ifelse(Sys.getenv("VERBOSE")!="", Sys.getenv("VERBOSE"), options()$verbose), options()$verbose)
) {
    if(is.null(env1$path$LastSourceEditorContext.path_filename.ext) || is.na(env1$path$LastSourceEditorContext.path_filename.ext) || env1$path$LastSourceEditorContext.path_filename.ext == "") overwrite = TRUE
    
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
                env1$path$LastSourceEditorContext.path_filename.ext = NA
                return(invisible())
            }
            
        } else { 
            if(!VERBOSE) if (!is.null(attributes(.GlobalEnv$env1$source$.Rprofile)$complete)) if(attributes(.GlobalEnv$env1$source$.Rprofile)$complete) print('!requireNamespace("rstudioapi")');
            return(invisible()) 
        }
    } 
    
    if(overwrite) {
        # env1$path$LastSourceEditorContext.path_filename.ext = getwd() |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
        env1$path$LastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
        env1$path$LastSourceEditorContext.path = env1$path$LastSourceEditorContext.path_filename.ext |> dirname()
        
        # cat(LinePrefix4CodeText, "env1$path$LastSourceEditorContext.path_filename.ext == ", deparse(env1$path$LastSourceEditorContext.path_filename.ext), "  \n", sep="")
        .CodeText2Print = 'env1$path$LastSourceEditorContext.path_filename.ext'; (ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",deparse(eval(parse(text=.CodeText2Print)))))) %>% {cat(LinePrefix4CodeText, ., "  \n", sep = "")}
        
        if(!".path4write" %in% names(env1$path)) {
            .path4write = env1$path$.path4write = env1$path$LastSourceEditorContext.path
            cat(LinePrefix4CodeText, ".path4write = env1$path$.path4write = env1$path$LastSourceEditorContext.path", "  \n", sep="")
        }  
    } else {
        env1$f$f_CodeTexts.parse.eval.identical("env1$path$LastSourceEditorContext.path_filename.ext", 'rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")')
    }
    return(invisible())
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = update_LastSourceEditorContext.path_filename.ext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "update_LastSourceEditorContext.path_filename.ext")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = setLastSourceEditorContext.path_filename.ext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "setLastSourceEditorContext.path_filename.ext")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### env1\$path\$LastSourceEditorContext.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.size_files =  ----  
# Rdev/00_base_program/f_path.size_files.source.r
.tmp$objectname = "f_path.size_files"
.tmp$object = function(.path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$", print2console = TRUE, VERBOSE = options()$verbose) {
    
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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = list.files.size  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "list.files.size")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = dir.size  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "dir.size")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path0.list_path_hierarchy =  ----  
# Rdev/00_base_program/internal.f_path0.list_path_hierarchy.source.r
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path0.list_path_hierarchy"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path0, path_last = getwd(), .max_hierarchy = 5, VERBOSE = options()$verbose) {
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
    old_filename.ext = basename(old_path_files)
    old_path = ifelse(old_path_files == basename(old_path_files), "", dirname(old_path_files))
    new_filename.ext = gsub(gsub.pattern_from, gsub.replacement_to, old_filename.ext)
    new_path_files <- ifelse(old_path == "", "", paste0(old_path, "/")) |> paste0(new_filename.ext)

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
## :: f_filename.ext.append_suffix =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_filename.ext.append_suffix.dev.r
.tmp$objectname = "f_filename.ext.append_suffix"
.tmp$object <- function(path_filename.ext, append_suffix, compression = TRUE, VERBOSE = getOption("verbose")) {
    # Extract the path, filename, and extension
    if(VERBOSE) "path_filename.ext" %>% echo.dput_get_ObjectName()
    
    path = path_filename.ext |> dirname()
    if(VERBOSE) "path" %>% echo.dput_get_ObjectName()
    filename.ext = path_filename.ext |> basename()
    if(VERBOSE) "filename.ext" %>% echo.dput_get_ObjectName()
    if(compression) {
        filename = filename.ext |> str_remove("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$")
        ext = filename.ext |> str_extract("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$") |> str_remove("^\\.")
    } else {
        filename = filename.ext |> str_remove("\\.([[:alnum:]]+)$")
        ext = filename.ext |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    }
    if(VERBOSE) "filename" %>% echo.dput_get_ObjectName()
    if(VERBOSE) "ext" %>% echo.dput_get_ObjectName()
    
    # Construct the new filename with appended text
    filename.ext2 = paste0(filename, append_suffix, ".", ext)
    if(VERBOSE) "filename.ext2" %>% echo.dput_get_ObjectName()
    
    # Construct the new path with the updated filename
    path_filename.ext2 = file.path(path, filename.ext2)
    
    return(path_filename.ext2)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, function.reload = options()$function.reload, runLoadedFunction = FALSE)


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.str_replace_all.old.ObjectName =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
.tmp$objectname = "f_file.str_replace_all.old.ObjectName"
.tmp$object <- function(input_path_file, old.ObjectName, new.ObjectName, output_path_file = NULL, replace_input_path_file = FALSE) {
    # Construct the regex pattern for word boundary including dot and underscore
    regex_pattern <- sprintf("(?<![\\w_.])%s(?![\\w_.])", gsub("\\.", "\\\\.", old.ObjectName)) # Escape the dot in old.ObjectName
    
    # Read the file content
    file_content <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of old.ObjectName with new.ObjectName using the regex pattern
    updated_content <- str_replace_all(
        string = file_content,
        pattern = regex_pattern,
        replacement = new.ObjectName
    )
    
    # Determine the output path (overwrite or save to new file)
    if (is.null(output_path_file)) {
        if(replace_input_path_file) {
            output_path_file <- input_path_file # Overwrite the original file
        } else {
            output_path_file = input_path_file %>% f_filename.ext.append_suffix(paste0(".", new.ObjectName))
        }
    }
    
    # Write the updated content back to the file
    writeLines(updated_content, con = output_path_file)
    
    message(sprintf("Replaced '%s' with '%s' in %s.", old.ObjectName, new.ObjectName, output_path_file))
    return(output_path_file)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = f_ObjectName.f_file.str_replace_all  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "f_ObjectName.f_file.str_replace_all")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = find_and_replace_ObjectName  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "find_and_replace_ObjectName")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = replace_ObjectName  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "replace_ObjectName")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_CurrentSourceEditorContext.str_replace_all.old.ObjectName  ----  
.tmp$objectname = "f_CurrentSourceEditorContext.str_replace_all.old.ObjectName"
.tmp$object = function(old.ObjectName, new.ObjectName) {
    env1$f$f_file.str_replace_all.old.ObjectName(input_path_file = rstudioapi::getSourceEditorContext()$path, old.ObjectName = old.ObjectName, new.ObjectName = new.ObjectName, replace_input_path_file = TRUE, output_path_file = NULL)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = CurrentSourceEditorContext.str_replace_all.old.ObjectName  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "CurrentSourceEditorContext.str_replace_all.ObjectName")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = f_ObjectName.str_replace_all.CurrentSourceEditorContext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "f_ObjectName.str_replace_all.CurrentSourceEditorContext")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = find_and_replace_ObjectName.CurrentSourceEditorContext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "find_and_replace_ObjectName.CurrentSourceEditorContext")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = replace_ObjectName.CurrentSourceEditorContext  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "replace_ObjectName.CurrentSourceEditorContext")

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
### & alias = file.edit_if_exists  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.edit_if_exists")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.open_if_exists  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.open_if_exists")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = open_if_exists  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "open_if_exists")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### :: f_file.edit_windows ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_windows"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.file2edit) {  shell.exec(shQuote(.file2edit))  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.edit_windows  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.edit_windows")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_file.edit_notepad ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_notepad"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.file2edit) {
    if (Sys.info()["sysname"] == "Windows") {shell( paste0("notepad.exe"," ",shQuote(.file2edit)) )} else {warning("This function is only available in Windows.")}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.edit_notepad  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.edit_notepad")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_file.edit_vscode ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_file.edit_vscode"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.file2edit) {
    if (Sys.info()["sysname"] == "Windows") {.path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/"); shell( paste0('cmd /c ""',.path4editor, '" "',.file2edit, '""')  )}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.edit_vscode  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.edit_vscode")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### :: f_URL.open_in_edge_app =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_URL.open_in_edge_app"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(URL) {
    if (Sys.info()["sysname"] == "Windows") {system(paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',URL,'"'), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)} else {utils::browseURL(URL); env1$env.internal.attach$f_URL.open_in_edge_app.printPowerShellCode(URL)}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = browseURL_in_edge_app  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "browseURL_in_edge_app")
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
### & alias = browseURL_in_edge_app.printRCode  ----
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "browseURL_in_edge_app.printRCode")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### ::: f_URL.open_in_edge_app.printPowerShellCode =  ----  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_URL.open_in_edge_app.printPowerShellCode"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(URL) {
    URL %>% cat('cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="',.,'"  \n', sep="")
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = browseURL_in_edge_app.printPowerShellCode  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "browseURL_in_edge_app.printPowerShellCode")
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
### & alias = file.open.systemStart  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.open.systemStart")
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
### & alias = file.open.PDF.sumatra  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.open.PDF.sumatra")
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
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.open.system_switch  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.open.system_switch")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = system_switch.file.open  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "system_switch.file.open")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.backup, f_path.backup ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_filename.ext.createBackup ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_filename.ext.createBackup"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(backup_from_path_filename.ext, backup_from_ext = NA, .backup_to_path = file.path(env1$path$path0, "-backup"), timeFormat = "%y%m%d_%H%M", overwrite=TRUE) {
    # Wrap the main backup logic in a tryCatch for error handling
    tryCatch({
        # Determine the filename and extension if not provided
        if(is.na(backup_from_ext)) {
            backup_from_path_filename = basename(backup_from_path_filename.ext) |> str_remove("\\.([[:alnum:]]+)$")
            backup_from_ext = basename(backup_from_path_filename.ext) |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
        } else {
            backup_from_path_filename = basename(backup_from_path_filename.ext) |> str_remove(paste0("\\.",backup_from_ext|>str_replace_all("\\.","\\\\."),"$"))
        }
        
        # Construct the destination backup path with timestamp
        .backup_to_path_filename.ext = file.path( .backup_to_path, paste0(backup_from_path_filename,"-",format(Sys.time(),timeFormat),".",backup_from_ext) )
        
        # Create the backup directory if it doesn't exist
        if(!dir.exists(.backup_to_path)) dir.create(.backup_to_path, recursive = TRUE)
        

        if(!file.exists(backup_from_path_filename.ext)) stop(paste0("File to backup does not exist: ", backup_from_path_filename.ext))
        if(file.exists(.backup_to_path_filename.ext) && !overwrite) stop(paste0("Backup file already exists: ", .backup_to_path_filename.ext))
        
        # Copy the file to the backup location; if successful, print a message. Otherwise, stop with an error. 
        if (file.copy(from=backup_from_path_filename.ext, to=.backup_to_path_filename.ext, overwrite=overwrite)) {message(paste0("- Backup file created: ", .backup_to_path_filename.ext))} else {stop("File copy failed for unknown reasons.")}
    }, error = function(e) {
        # Error handling block to catch any issues during the backup process
        message(paste("Failed to create backup for:", backup_from_path_filename.ext))
        message("Error:", e$message)
    })
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.backup  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.backup")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = file.copy_createBackup  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "file.copy_createBackup")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_path_path.backup.overwrite ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path_path.backup.overwrite"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.overwrite_from_path_filename.ext, .destination_path_filename.ext, .backup_to_path = dirname(.destination_path_filename.ext), timeFormat = "%y%m%d", createFile = FALSE) {
    if(createFile || file.exists(.destination_path_filename.ext)) {
        if(!is.null(.backup_to_path)) {
            env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = .destination_path_filename.ext, .backup_to_path=.backup_to_path, timeFormat=timeFormat)
        }
        if(file.copy(from=.overwrite_from_path_filename.ext, to=.destination_path_filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_filename.ext)) else warning(paste0("Update failed: ", .destination_path_filename.ext))
    } else {warning(paste0("File does not exist: ", .destination_path_filename.ext))}
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
env1$f$f_file.git_lfs_track_add_f = function(.path_file, Execute = FALSE, SkipIfAlreadyAdded = TRUE) {
    git_lfs_available = try(system2("git", args = "lfs version", stdout = FALSE, stderr = FALSE) == 0, silent = TRUE)    # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a  # https://gemini.google.com/app/6d9de55c5c7085c6
    
    # if(git_lfs_available) {
    #     invisible(
    #         list(
    #             paste0( "git lfs track ",shQuote(.path_file) )
    #             , paste0( "git add -f ",shQuote(.path_file) )
    #         ) |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
    #     )
    # } else {
    #     warning("git lfs is not available  \n")
    #     invisible(
    #         paste0( "git add -f ",shQuote(.path_file) ) |> env1$f$f_TerminalFromRCodeText.echo(Execute = Execute)
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
            ) |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
        ))
    }
}

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.save ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_terminal/f_objectname.size.write_rds.git_lfs_track_add_f
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f = function(
        .object = NULL, .objectname = NULL, .path_file = NULL, 
        .path4write = env1$path$.path4write, 
        .filename.ext4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz" && object.size(get(.objectname)) > 1e6 && object.size(get(.objectname)) < 1e8, ".xz", "")), 
        createBackup = FALSE, 
        .backup_to_path="-backup", 
        Execute = FALSE, 
        path.size_files = TRUE, 
        git_lfs_track = "determine based on object size", 
        git_add_f = TRUE, 
        SkipIfAlreadyAdded = TRUE, 
        CompressionMethod = NULL, 
        LinePrefix4CodeText = "\t", 
        VERBOSE = options()$verbose) {
    
    if(!is.null(.object)) {
        if(is.character(.object) && length(.object) == 1) {
            # .objectname <- .object
            # .object <- get(.object)
            "is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?" |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
        } 
    }
    
    # # If the object name is provided but not the object itself, retrieve the object 
    # if (!is.null(.objectname) && is.null(.object)) {.object <- get(.objectname)}
    # --> Not necessary to duplicate the .object, because the .object can be retrieved by get(.objectname). 
    
    if (!is.null(.object)) {
        if (is.null(.objectname)) {  # If the object is provided but not the object name, create an object name
            .objectname <- deparse(substitute(.object))
            if (.objectname == ".") {
                warning('.objectname == ',deparse(.objectname),'   #@ sys.nframe() == ', sys.nframe(), "  \n", immediate. = TRUE)
                # if (VERBOSE) 1:sys.nframe() %>% set_names() %>% map(function(n) { deparse(substitute(.object, parent.frame(n = n)))}) |> str(max.level = 2, give.attr = TRUE)
                if (VERBOSE) 0:sys.nframe() %>% set_names() %>% map(function(n) { ls(envir = sys.frame(which = n)) }) %>% dput()
                # message('-> Trying: ','deparse(substitute(.object, parent.frame(n = 2)))')
                # .objectname <- deparse(substitute(.object, parent.frame(n = 2)))
                message('-> Trying: ','ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, .object)) %>% names')
                .objectname = ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, .object)) %>% names
                if (length(.objectname) > 1) {
                    warning('length(.objectname) > 1', "  \n", immediate. = TRUE)
                    .objectname %>% dput()
                    if (any(!.objectname %in% c(".", ".object"))) {
                        .objectname = .objectname[!.objectname %in% c(".", ".object")][1]
                    } else {
                        .objectname = .objectname[1]
                    }
                }
                if (.objectname %in% c(".", ".object")) {
                    warning('.objectname == ',deparse(.objectname),'   #@ sys.nframe() == ', sys.nframe())
                    "Try using `|>` instead of` `%>%`, or provide a valid object." |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
                }
            }
        } else {  # If both the object and object name are provided, assign the object to the object name to avoid the problematic cases when .object != get(.objectname.
            assign(.objectname, .object)
        }

    }
    
    if(exists("MetaData")) {
        if("DataSetNames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DataSetNames)) {
                assign(.objectname, structure(get(.objectname), MetaData = MetaData))
            }
        } 
    }
    if (object.size(get(.objectname)) >= 1e8) {
        paste0("object.size(get(.objectname)) == ",object.size(get(.objectname))|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.") |> warning(call. = FALSE, immediate. = TRUE)
    }
    if(is.null(.filename.ext4write))    .filename.ext4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz" && object.size(get(.objectname)) >= 1e6 && object.size(get(.objectname)) < 1e8, ".xz", ""))
    if(is.null(CompressionMethod))      CompressionMethod = case_when(.filename.ext4write == "xz" ~ "xz", 
                                                                      object.size(get(.objectname)) >= 1e8 ~ "",
                                                                      object.size(get(.objectname)) >= 1e6 ~ "xz",
                                                                      TRUE ~ "gz")  
    if(is.null(.path4write))            .path4write = env1$path$.path4write
    if(is.null(.path_file))             .path_file = paste0(.path4write,ifelse(.path4write=="","","/"),.filename.ext4write)

    if(createBackup) cat(LinePrefix4CodeText, 'env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = ',deparse(.path_file),', .backup_to_path=',deparse(.backup_to_path),', timeFormat="%y%m%d_%H", overwrite=TRUE)', "  \n", sep="")
    cat("\t", .objectname, ' |> write_rds(',shQuote(.path_file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\\n")', "  \n", sep="")
    if(path.size_files) cat(LinePrefix4CodeText, 'env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    
    if(Execute) {
        if(createBackup) env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = .path_file, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE) 
        if (object.size(get(.objectname)) >= 1e8) {
            paste0("object.size(get(.objectname)) == ",object.size(get(.objectname))|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> No Auto-execution.") |> warning(call. = FALSE, immediate. = TRUE)
        } else { 
            get(.objectname) |> write_rds( .path_file, compress = CompressionMethod, compression = 9L ) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
            if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
        }
    }
    
    if(git_add_f) {
        if (git_lfs_track == "determine based on object size") {
            if(object.size(get(.objectname)) > 1e7) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, Execute = FALSE); if(Execute) warning("Caution: halting auto-execution of glt lfs track.  \n") 
            } else {
                env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), Execute = Execute)
            }
        } else if (git_lfs_track == TRUE) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, Execute = FALSE); if(Execute) warning("Caution: halting auto-execution of glt lfs track.  \n") 
        } else {
            env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), Execute = Execute)
        }
    }
    
    invisible()
}


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
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(url, destfile, chunk_size = 65536) {  # Default 64KB chunk size
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
        file.copy(from = temp_file, to = destfile, overwrite = TRUE)
        message(paste0("Downloaded & updated: ", destfile))
        return(TRUE)
        
    }, error = function(e) {
        message(paste0("Failed to download or update: ", url))
        message("Error:", e$message)
        return(FALSE)
    })
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### \$f\$f.updateTemplates ====  
# https://github.com/mkim0710/f.updateTemplates.exe.r
env1$f$f.updateTemplates = function(.path4APPDATA_RStudio = NULL) {
    #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++
    # Assign .path4APPDATA_RStudio based on the platform if it's NULL
    if (is.null(.path4APPDATA_RStudio)) {
        if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
    }
    
    # Create the templates directory if it doesn't exist
    if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
    
    # # \% Edit the templates of RStudio (default.R, notebook.Rmd) ~~~~~~~~~~~~
    # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext))
    # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext))
    
    # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~
    for (.filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
        if (.filename.ext == "templates-00env1.minimum.Rmd") {
            .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd")
        } else {
            .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", .filename.ext)
        }
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/","rstudio-prefs/templates/",.filename.ext)
        env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
        
        if (Sys.info()["sysname"] == "Windows") {
            # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
            # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_filename.ext), output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
            
            .file.copy.to = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",.filename.ext)
            .backup_to_path = "D:/OneDrive/[][Rproject]/-backup"
            env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = .file.copy.to, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE)
            env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
        }
    }
    if (Sys.info()["sysname"] == "Windows")  browseURL("D:/OneDrive/[][Rproject]/-backup")
    
    # \% Update the .Rprofile  @ Project Directory (& User Folder? may cause an error) ~~~~~~~~~~~~
    for (.filename.ext in c(".Rprofile")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.filename.ext)
        # for (.file.copy.to in c(file.path(env1$path$path1,.filename.ext), file.path("~",.filename.ext), paste0(Sys.getenv("USERPROFILE"),"/Documents/",.filename.ext))) {
        for (.file.copy.to in file.path(env1$path$path1,.filename.ext)) {
            if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.filename.ext)) {
                env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
            }
        }
    }
    
    # \% Update the f.updateTemplates.exe.r, RStudioServer-setup.r  @ Project Directory ~~~~~~~~~~~~
    for (.filename.ext in c("f.updateTemplates.exe.r", "RStudioServer-setup.r")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.filename.ext)
        .file.copy.to = file.path(env1$path$path1,.filename.ext)
        env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
    }
    
    # remove old files
    for (.file.old in c("updateTemplates.R", "f.updateTemplates.source.r")) {
        if (file.exists(.file.old) && file.exists("f.updateTemplates.exe.r")) {
            file.remove(.file.old)
            warning(paste0("Removed old file: ", .file.old))
        }
    }
    
    # *** be careful not to overwite .gitattributes~! git LFS may become regular file~!
    
    # if(.Platform$OS.type == "unix") {
    #     if(Sys.info()["sysname"] == "Linux") {
    #         if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
    #             
    #         } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
    #             .file.copy.from = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH240515%20copilot.json"
    #             .file.copy.to = "~/.config/rstudio/rstudio-prefs.json"
    #             env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
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
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.subpath_filename.source.r = NULL, .subpath = NULL, .filename.source.r = NULL,  option.function.reload = isTRUE(options()$function.reload)) {
    # browser()
    # Browse[1]> environment() %>% as.list(all.names = TRUE) %>% str
    # List of 4
    #  $ .subpath_filename.source.r: chr "Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r"
    #  $ .subpath                  : NULL
    #  $ .filename.source.r        : NULL
    #  $ option.function.reload    : logi TRUE
    if(is.null(.subpath_filename.source.r) && !is.null(.subpath) && !is.null(.filename.source.r)) .subpath_filename.source.r = .filename.source.r %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
    if(is.null(.filename.source.r)) .filename.source.r = basename(.subpath_filename.source.r)
    if(option.function.reload || !.filename.source.r %in% names(.GlobalEnv$env1$source)) {  message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.filename.source.r]] = paste0(env1$path$source_base,ifelse(env1$path$source_base=="","","/"),.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.filename.source.r]])  }
}
## Example Usage: 
# env1$source$f_CodeBook_DataSet.lbl.source.r = NULL
# .filename.source.r = "f_CodeBook_DataSet.lbl" |> paste0(".source.r"); .subpath = r"(Rdev/10_import_clean_datatype/16_categorical_labelled)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# env1$source$f_CodeBook_DataSet.lbl.source.r
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = source_if_not_sourced  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "source_if_not_sourced")

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
    env1$f$f_sourcePath.execute_if_not_sourced(option.function.reload = TRUE, ...)
}
## Example Usage: 
# env1$source$f_CodeBook_DataSet.lbl.source.r = ""
# .filename.source.r = "f_CodeBook_DataSet.lbl" |> paste0(".source.r"); .subpath = r"(Rdev/10_import_clean_datatype/16_categorical_labelled)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute.force_reload(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# env1$source$f_CodeBook_DataSet.lbl.source.r
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = source.force_reload  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "source.force_reload")

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
## @ .filename.source.r = "f_expression.substitute_echo_and_dput" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/00_base_program/007_base_expression/f_expression.substitute_echo_and_dput")
.filename.source.r = "f_expression.substitute_echo_and_dput" |> paste0(".source.r"); .subpath=r"(Rdev/00_base_program/007_base_expression)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))

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

