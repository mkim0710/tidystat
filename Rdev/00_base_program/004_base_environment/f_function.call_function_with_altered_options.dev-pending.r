
# https://chatgpt.com/c/6735a17b-a4e8-800e-aaf7-4aba219aec74
# https://chatgpt.com/c/67419094-1a50-800e-8987-f7baa6e81303

env1$env.internal.attach$f_function.call_function_with_altered_options = function(function_original, ...) {
    # args <- as.list(environment())  # Capture all arguments in the current environment
    list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    
    args$function_original = NULL  # Remove the target function from arguments
    do.call(function_original, args)   # Dynamically pass the args to another function
}













##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_sourcePath.execute_if_not_sourced =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_sourcePath.execute_if_not_sourced"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.subpath_filename.source.r = NULL, .subpath = NULL, .sourcename = NULL,  option.function.reload = isTRUE(options()$function.reload)) {
    if(is.null(.subpath_filename.source.r) && !is.null(.subpath) && !is.null(.sourcename)) .subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
    if(option.function.reload || !.sourcename %in% names(.GlobalEnv$env1$source)) {  message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])  }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = source_if_not_sourced  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "source_if_not_sourced")

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_sourcePath.execute.force_reload  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_sourcePath.execute.force_reload"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.subpath_filename.source.r = NULL, .subpath = NULL, .sourcename = NULL, option.function.reload = TRUE) {
    # args <- as.list(environment())  # Capture all arguments in the current environment
    list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    do.call(env1$f$f_env1_subenv_objectname.set_alias, args)   # Dynamically pass the args to another function
}


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: str_max_level2 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_max_level2"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., max.level = 2)  }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: str_give_attr_F =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_give_attr_F"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., give.attr = FALSE)  }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: paste_collapse0 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "paste_collapse0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {  
    paste0(..., collapse = "")
}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: paste_collapse0.print =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "paste_collapse0.print"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {  
    print(paste0(..., collapse = ""))
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### & alias = print.paste_collapse0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_alias(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4alias = "env.internal.attach", aliasname = "print.paste_collapse0")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: cat0 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "cat0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {  
    cat(..., "  \n", sep="")
}

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_environment.list_objectnames.map_get.str ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.list_objectnames.map_get.str"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(envir = parent.frame(), all.names = FALSE, pattern, sorted = TRUE, run_dput = FALSE, run_str = TRUE, max.level = 2, give.attr = FALSE, return_map_get = FALSE) {
    list_objectnames <- ls(envir = envir, all.names = all.names, pattern = pattern, sorted = sorted)   # Get object names, including hidden ones if all.names = TRUE
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
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(envir = parent.frame(), all.names = TRUE, pattern, sorted = TRUE, run_dput = FALSE, run_str = TRUE, max.level = 2, give.attr = FALSE, return_map_get = FALSE) {
    # args <- as.list(environment())  # Capture all arguments in the current environment
    list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    do.call(env1$f$f_environment.list_objectnames.map_get.str, args)   # Dynamically pass the args to another function
}





