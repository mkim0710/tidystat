.sourcename = "env1$env.internal" |> paste0(".source.r")  
if(Sys.getenv("VERBOSE")==TRUE) { print(paste0('Sourcing: "',.sourcename,'"')) }  
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
        warning("Error in .Rprofile: ", e$message)
    })
}  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## .GlobalEnv$.tmp = list() ====  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) } 
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$source = list() ====  
.sublistname = "source"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$info = list() ====  
.sublistname = "info"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
### .GlobalEnv$env1$path = list() ====  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "source_base_local"; .tmp$object = ifelse(Sys.info()["sysname"] == "Windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
.tmp$objectname = "source_base_github"; .tmp$object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.tmp$objectname = "getwd"; .tmp$object = getwd(); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd()))
# c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())) %>% {.[dir.exists(.)][1]}
# Filter(dir.exists, c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())))[1]
.tmp$objectname = "path0"; .tmp$object = Filter(dir.exists, c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud", dirname(getwd())))[1]; if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  
# env1$path$getwd |> str_replace((env1$path$path0 |> str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") |> str_extract("[^/]+")    # str_replace_all("([\\[\\](){}+*^$|?\\\\])", "\\\\\\1")), "") - escaped regex for special characters
# sub("/.*", "", sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd))    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
# unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]    # gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0) - escaped regex for special characters
.tmp$objectname = "path1"; .tmp$object = paste0(env1$path$path0,"/",unlist(strsplit(sub(paste0("^",gsub("([][(){}+*^$|?\\])", "\\\\\\1", env1$path$path0),"/?"), "", env1$path$getwd), "/"))[1]); if(!.tmp$objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[.tmp$objectname]] = .tmp$object}  

if(!".path4read" %in% names(env1$path)) {.path4read = env1$path$.path4read = env1$path$path1}  
if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = ifelse("CurrentSource.path" %in% names(env1$path), env1$path$CurrentSource.path, env1$path$path1)}  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_CodeText, f_function ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_CodeText.echo ====
# Rdev/00_base_program/f_CodeText.echo.dev.r
env1$f$f_CodeText.echo = function(
        .CodeText,
        Execute = FALSE,
        deparse_cat = TRUE,
        LinePrefix4CodeText = "\t",
        LinePrefix4Output = "\t## ",
        substitute_ObjectNames = TRUE,
        ObjectNames4substitute = NULL,
        CodeEqualsOutput = TRUE,
        VERBOSE = getOption("verbose")) {
    if(is.null(VERBOSE)) VERBOSE = FALSE
    
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
        'Execute not fully implemented for line feed (\\n) or semicolon (;)' |> warning(call. = FALSE)
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
                    eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> deparse() %>% cat(sep="")
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


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_TerminalFromRCodeText.echo ====  
# Rdev/00_base_program/f_TerminalFromRCodeText.echo.dev.r
env1$f$f_TerminalFromRCodeText.echo = function(.TerminalCodeText, Execute = FALSE) {
    .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    if(Execute) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
    )
}

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_function.load2env.internal ====  
env1$env.internal$f_function.load2env.internal = function(function_object, function_name, env1_subenv_name = "env.internal", show_packageStartupMessage = TRUE, runLoadedFunction = FALSE) {
    if(is.null(env1_subenv_name)) {
        if(!function_name %in% names(.GlobalEnv$env1)) {
            .GlobalEnv$env1[[function_name]] = function_object
            if(runLoadedFunction) {
                cat("> .GlobalEnv$env1$",function_name,"()\n",sep=""); get(.GlobalEnv$env1[[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
            }
            if(show_packageStartupMessage) packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",function_name))
        }
    } else {
        if(!function_name %in% names(.GlobalEnv$env1[[env1_subenv_name]])) {
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



#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_file, f_URL, f_path ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.relative ====  
env1$f$f_path.relative = function(path, basepath = env1$path$path1) {
    path |> normalizePath(winslash="/") |> str_replace(fixed(basepath|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.CurrentSource.path.filename.ext =  ----  
.tmp$objectname = "f_path.CurrentSource.path.filename.ext"
.tmp$object = function(check_rstudioapi = TRUE, overwrite = FALSE) {
    if(overwrite || is.null(env1$path$CurrentSource.path.filename.ext) || env1$path$CurrentSource.path.filename.ext == "") {
        if (check_rstudioapi) {
            if (requireNamespace("rstudioapi")) {
                if(Sys.getenv("VERBOSE")==TRUE) {.CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
                if (rstudioapi::isAvailable()) {
                    env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
                    env1$path$CurrentSource.path = env1$path$CurrentSource.path.filename.ext |> dirname()
                    if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = env1$path$CurrentSource.path}  
                } else { if(Sys.getenv("VERBOSE")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
                if(Sys.getenv("VERBOSE")==TRUE) {.CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
            } else { if(Sys.getenv("VERBOSE")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
        } else {
            # env1$path$CurrentSource.path.filename.ext = getwd() |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
            env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
            env1$path$CurrentSource.path = env1$path$CurrentSource.path.filename.ext |> dirname()
            if(!".path4write" %in% names(env1$path)) {.path4write = env1$path$.path4write = env1$path$CurrentSource.path}  
        }
    }
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "env.internal", show_packageStartupMessage = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path


#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.edit, f_file.open ====  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### :: f_file.edit_windows ====  
env1$env.internal$f_file.edit_windows <- function(.file2edit) {
    shell.exec(shQuote(.file2edit))
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### :: f_file.edit_notepad ====  
env1$env.internal$f_file.edit_notepad <- function(.file2edit) {
    if (Sys.info()["sysname"] == "Windows") {shell( paste0("notepad.exe"," ",shQuote(.file2edit)) )} else {warning("This function is only available in Windows.")}
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### :: f_file.edit_vscode ====  
env1$env.internal$f_file.edit_vscode <- function(.file2edit) {
    if (Sys.info()["sysname"] == "Windows") {.path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/"); shell( paste0('cmd /c ""',.path4editor, '" "',.file2edit, '""')  )}
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
env1$env.internal$f_URL.open_in_edge_app <- function(URL) {
    if (Sys.info()["sysname"] == "Windows") {system(paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',URL,'"'), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)} else {utils::browseURL(URL); env1$env.internal$f_URL.open_in_edge_app.printPowerShellCode(URL)}
}
#### :: f_URL.open_in_edge_app =  ----  
.tmp$objectname = "f_URL.open_in_edge_app"
.tmp$object = env1$env.internal[[.tmp$objectname]]
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% cat('if (Sys.info()["sysname"] == "Windows") { \'"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',., '"\' |> system(intern=TRUE) } else { utils::browseURL("',.,'") }', sep="")
env1$env.internal$f_URL.open_in_edge_app.printRCode <- function(URL) {
    # URL %>% cat("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }", sep="")
    URL %>% cat('if (Sys.info()["sysname"] == "Windows") { \'"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"\' |> system(intern=TRUE) } else { utils::browseURL("',.,'") }  \n', sep="")
}
# env1$env.internal$f_URL.open_in_edge_app.printRCode <- function(URL) {
#     URL %>% cat('env1$env.internal$f_URL.open_in_edge_app("',.,'")  \n', sep="")
# }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
env1$env.internal$f_URL.open_in_edge_app.printPowerShellCode <- function(URL) {
    URL %>% cat('cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="',.,'"  \n', sep="")
}
#### :: f_URL.open_in_edge_app.printPowerShellCode =  ----  
.tmp$objectname = "f_URL.open_in_edge_app.printPowerShellCode"
.tmp$object = env1$env.internal[[.tmp$objectname]]
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### :: f_file.systemStart ====  
# Function to open files with the system's default application (fallback)
env1$env.internal$f_file.systemStart <- function(file) {
    system(paste("start", shQuote(file)), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)
    # file |> shQuote() %>% paste0("start ",.) |> system(wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### :: f_file_PDF.sumatra ====  
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.dev.r")
# Function to open PDF with Sumatra PDF
env1$env.internal$f_file_PDF.sumatra <- function(
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
        return(invisible(env1$env.internal$f_file.systemStart(file)))
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.switch_open ====  
env1$f$f_file.switch_open <- function(file) {
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


#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.backup, f_path.backup ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_filename.ext.createBackup ====  
env1$env.internal$f_filename.ext.createBackup = function(backup_from_path.filename.ext, backup_from_ext = NA, .backup_to_path = file.path(env1$path$path0, "-backup"), timeFormat = "%y%m%d_%H%M", overwrite=TRUE) {
    # Wrap the main backup logic in a tryCatch for error handling
    tryCatch({
        # Determine the filename and extension if not provided
        if(is.na(backup_from_ext)) {
            backup_from_path.filename = basename(backup_from_path.filename.ext) |> str_remove("\\.([[:alnum:]]+)$")
            backup_from_ext = basename(backup_from_path.filename.ext) |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
        } else {
            backup_from_path.filename = basename(backup_from_path.filename.ext) |> str_remove(paste0("\\.",backup_from_ext|>str_replace_all("\\.","\\\\."),"$"))
        }
        
        # Construct the destination backup path with timestamp
        .backup_to_path.filename.ext = file.path( .backup_to_path, paste0(backup_from_path.filename,"-",format(Sys.time(),timeFormat),".",backup_from_ext) )
        
        # Create the backup directory if it doesn't exist
        if(!dir.exists(.backup_to_path)) dir.create(.backup_to_path, recursive = TRUE)
        

        if(!file.exists(backup_from_path.filename.ext)) stop(paste0("File to backup does not exist: ", backup_from_path.filename.ext))
        if(file.exists(.backup_to_path.filename.ext) && !overwrite) stop(paste0("Backup file already exists: ", .backup_to_path.filename.ext))
        
        # Copy the file to the backup location; if successful, print a message. Otherwise, stop with an error. 
        if (file.copy(from=backup_from_path.filename.ext, to=.backup_to_path.filename.ext, overwrite=overwrite)) {message(paste0("- Backup file created: ", .backup_to_path.filename.ext))} else {stop("File copy failed for unknown reasons.")}
    }, error = function(e) {
        # Error handling block to catch any issues during the backup process
        message(paste("Failed to create backup for:", backup_from_path.filename.ext))
        message("Error:", e$message)
    })
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_path_path.backup.overwrite ====  
env1$env.internal$f_path_path.backup.overwrite <- function(.overwrite_from_path.filename.ext, .destination_path.filename.ext, .backup_to_path = dirname(.destination_path.filename.ext), timeFormat = "%y%m%d", createFile = FALSE) {
    if(createFile || file.exists(.destination_path.filename.ext)) {
        if(!is.null(.backup_to_path)) {
            env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = .destination_path.filename.ext, .backup_to_path=.backup_to_path, timeFormat=timeFormat)
        }
        if(file.copy(from=.overwrite_from_path.filename.ext, to=.destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path.filename.ext)) else warning(paste0("Update failed: ", .destination_path.filename.ext))
    } else {warning(paste0("File does not exist: ", .destination_path.filename.ext))}
}


#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_git ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.is_git_tracked  =======  
# Function to check if the current project or any of its parent directories are tracked by Git
env1$env.internal$f_path.is_git_tracked <- function(path = getwd(), check_parents = TRUE) {
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
env1$path$git_path = env1$env.internal$f_path.is_git_tracked()
# env1$path$no_git = is.na(env1$path$git_path)



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.git_lfs_track_add_f ====  
# Rdev/00_base_program/f_file.git_lfs_track_add_f.dev.r
env1$f$f_file.git_lfs_track_add_f = function(.path.file, Execute = FALSE) {
    git_lfs_available = try(system2("git", args = "lfs version", stdout = TRUE, stderr = TRUE) == 0, silent = TRUE)    # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a  # https://gemini.google.com/app/6d9de55c5c7085c6
    
    # if(git_lfs_available) {
    #     invisible(
    #         list(
    #             paste0( "git lfs track ",shQuote(.path.file) )
    #             , paste0( "git add -f ",shQuote(.path.file) )
    #         ) |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
    #     )
    # } else {
    #     warning("git lfs is not available  \n")
    #     invisible(
    #         paste0( "git add -f ",shQuote(.path.file) ) |> env1$f$f_TerminalFromRCodeText.echo(Execute = Execute)
    #     )
    # }
    
    if(!git_lfs_available) warning("git lfs is not available  \n")
    
    invisible(
        list(
            paste0( "git lfs track ",shQuote(.path.file) )
            , paste0( "git add -f ",shQuote(.path.file) )
        ) |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
    )
}

#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.save ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_program/f_objectname.size.write_rds.git_lfs_track_add_f
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f = function(.object = NULL, .objectname = NULL, .path.file = NULL, .path4write = env1$path$.path4write, .filename.ext4write = NULL, createBackup = FALSE, .backup_to_path="-backup", Execute = FALSE, path.size_files = TRUE, git_lfs_track = "determine based on object size", git_add_f = TRUE, CompressionMethod = NULL) {
    
    if(!is.null(.object)) {
        if(is.character(.object) && length(.object) == 1) {
            # .objectname <- .object
            # .object <- get(.object)
            "is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?" |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
        } 
    }
    
    # # If the object name is provided but not the object itself, retrieve the object
    # if (!is.null(.objectname) && is.null(.object)) {.object <- get(.objectname)}
    
    # If the object is provided but not the object name, create an object name
    if (!is.null(.object) && is.null(.objectname)) {.objectname <- deparse(substitute(.object))}
    
    if(exists("MetaData")) {
        if("DataSetNames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DataSetNames)) {
                assign(.objectname, structure(get(.objectname), MetaData = MetaData))
            }
        } 
    }
    if(is.null(CompressionMethod))      CompressionMethod = ifelse(object.size(.objectname) > 1e6, "xz", "gz")
    if(is.null(.filename.ext4write))    .filename.ext4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz" && object.size(.objectname) > 1e6, ".xz", ""))
    if(is.null(.path4write))            .path4write = env1$path$.path4write
    if(is.null(.path.file))             .path.file = paste0(.path4write,"/",.filename.ext4write)

    if(createBackup) cat('env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = ',deparse(.path.file),', .backup_to_path=',deparse(.backup_to_path),', timeFormat="%y%m%d_%H", overwrite=TRUE)', "  \n", sep="")
    cat(.objectname, ' |> write_rds(',shQuote(.path.file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time()', "  \n", sep="")
    if(path.size_files) cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    
    if(Execute) {
        if(createBackup) env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = .path.file, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE) 
        system.time(write_rds( get(.objectname), .path.file, compress = CompressionMethod, compression = 9L ))
        if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
    }
    
    if(git_add_f) {
        if (git_lfs_track == "determine based on object size") {
            if(object.size(get(.objectname)) > 1e7) {
                env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, Execute = Execute) 
            } else {
                env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path.file) ), Execute = Execute)
            }
        } else if (git_lfs_track == TRUE) {
                env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, Execute = Execute) 
        } else {
            env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path.file) ), Execute = Execute)
        }
    }
    
    invisible()
}


#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.update ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: env.internal\$f_file2.compare ====  
# Function to compare two source code files chunk-by-chunk using while loop with a chunk size of 64KB
.tmp$objectname = "f_file2.compare"
.tmp$object <- function(file1, file2, chunk_size = 65536) {
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
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "env.internal", show_packageStartupMessage = FALSE)


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: env.internal\$f_url_destfile.DownloadIfDifferent ====  
# Function to download a file only if the web file is different from the local file
.tmp$objectname = "f_url_destfile.DownloadIfDifferent"
.tmp$object <- function(url, destfile, chunk_size = 65536) {  # Default 64KB chunk size
    tryCatch({
        # Temporary file to download the remote file for comparison
        temp_file <- tempfile()
        download.file(url, temp_file, quiet = TRUE)
        
        # Compare the local file and the remote file (if local file exists)
        if (file.exists(destfile)) {
            files_are_identical <- env1$env.internal$f_file2.compare(destfile, temp_file, chunk_size)
            
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
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "env.internal", show_packageStartupMessage = FALSE)


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
    # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    
    # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~
    for (.filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
        if (.filename.ext == "templates-00env1.minimum.Rmd") {
            .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd")
        } else {
            .file.copy.to = file.path(.path4APPDATA_RStudio, "templates", .filename.ext)
        }
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/","rstudio-prefs/templates/",.filename.ext)
        env1$env.internal$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
        
        if (Sys.info()["sysname"] == "Windows") {
            # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
            # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$CurrentSource.path.filename.ext), output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
            
            .file.copy.to = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",.filename.ext)
            .backup_to_path = "D:/OneDrive/[][Rproject]/-backup"
            env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = .file.copy.to, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE)
            env1$env.internal$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
        }
    }
    if (Sys.info()["sysname"] == "Windows")  browseURL("D:/OneDrive/[][Rproject]/-backup")
    
    # \% Update the .Rprofile  @ Project Directory & User Folder ~~~~~~~~~~~~
    for (.filename.ext in c(".Rprofile")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.filename.ext)
        for (.file.copy.to in c(file.path(env1$path$path1,.filename.ext), file.path("~",.filename.ext), paste0(Sys.getenv("USERPROFILE"),"/Documents/",.filename.ext))) {
            if(file.exists(.file.copy.to) || .file.copy.to == file.path(env1$path$path1,.filename.ext)) {
                env1$env.internal$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
            }
        }
    }
    
    # \% Update the f.updateTemplates.exe.r, RStudioServer-setup.r  @ Project Directory ~~~~~~~~~~~~
    for (.filename.ext in c("f.updateTemplates.exe.r", "RStudioServer-setup.r")) {
        .file.copy.from = paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/",.filename.ext)
        .file.copy.to = file.path(env1$path$path1,.filename.ext)
        env1$env.internal$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
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
    #             env1$env.internal$f_url_destfile.DownloadIfDifferent(url = .file.copy.from, destfile = .file.copy.to)
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
## @ .sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/internal.f_path0.list_path_hierarchy.source.r")
.sourcename = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \$ list_path_hierarchy  =======  
.max_hierarchy = 5
env1$path$list_path_hierarchy = env1$env.internal$f_path0.list_path_hierarchy(path0 = env1$path$path0, path_last = getwd(), .max_hierarchy = .max_hierarchy, VERBOSE = FALSE)
# for (i in 1:(.max_hierarchy)) {
#     # if(!is.na(env1$path$list_path_hierarchy[[i+1]]))
#     env1$path[[paste0("path", i)]] = env1$path$list_path_hierarchy[[i+1]]
# }

# cat("> str(env1$path$list_path_hierarchy)\n"); str(env1$path$list_path_hierarchy)
# cat("> str(env1$path)\n"); str(env1$path)    


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ .sourcename = "f_expression.substitute_echo_and_dput" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/00_base_program/f_expression.substitute_echo_and_dput")
.sourcename = "f_expression.substitute_echo_and_dput" |> paste0(".source.r"); .subpath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ .sourcename = "f_expression.substitute_echo_and_dput" |> paste0(".source.r") =======  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/00_base_program/f_expression.substitute_echo_and_dput")
.sourcename = "f_expression.substitute_echo_and_dput" |> paste0(".source.r"); .subpath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}

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
# \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----  

# .tmp$objectname = "get_system_info"
# #  source(file.path(env1$path$source_base,"",paste0(.tmp$objectname,".source.r")))
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

