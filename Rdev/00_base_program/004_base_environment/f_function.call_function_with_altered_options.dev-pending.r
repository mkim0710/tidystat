
# https://chatgpt.com/c/6735a17b-a4e8-800e-aaf7-4aba219aec74
# https://chatgpt.com/c/67419094-1a50-800e-8987-f7baa6e81303

LETTERS |> cat(); letters |> cat()
# A B C D E F G H I J K L M N O P Q R S T U V W X Y Za b c d e f g h i j k l m n o p q r s t u v w x y z

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(...) {  cat(..., "  \n", sep="")  }  # sep="" option is not modifiable
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")
# ABCDEFGHIJKLMNOPQRSTUVWXYZ  
# abcdefghijklmnopqrstuvwxyz  
# > LETTERS |> cat0(sep = "|")
# Error in cat(..., "  \n", sep = "") : 
#   formal argument "sep" matched by multiple actual arguments

# cat0 = function(..., "  \n", sep="") {  cat(...)  }
# # > cat0 = function(..., "  \n", sep="") {  cat(...)  }
# # Error: unexpected string constant in "cat0 = function(..., "  \n""


# cat0 = function(..., sep="") {  cat(..., "  \n")  }  # sep is ignored if not fed explicitly
# LETTERS |> cat0(); letters |> cat0()
# LETTERS |> cat0(sep = "|")
# # > LETTERS |> cat0(); letters |> cat0()
# # A B C D E F G H I J K L M N O P Q R S T U V W X Y Z   
# # a b c d e f g h i j k l m n o p q r s t u v w x y z   
# # > LETTERS |> cat0(sep = "|")
# # A B C D E F G H I J K L M N O P Q R S T U V W X Y Z  


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(..., sep = "") {  cat(..., "  \n", sep=sep)  }  # sep=sep is cumbersome
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")
# > LETTERS |> cat0(); letters |> cat0()
# ABCDEFGHIJKLMNOPQRSTUVWXYZ  
# abcdefghijklmnopqrstuvwxyz  
# > LETTERS |> cat0(sep = "|")
# A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|  


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(..., sep = "") {    # args$sep=sep is cumbersome
  args <- list(..., "  \n")  # "  \n" is put in a confusing location
  args$sep = sep
  do.call(cat, args)
}
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")
# > LETTERS |> cat0(); letters |> cat0()
# ABCDEFGHIJKLMNOPQRSTUVWXYZ
# abcdefghijklmnopqrstuvwxyz
# > LETTERS |> cat0(sep = "|")
# A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(..., function_original = cat, sep = "") {    
    args = environment() |> as.list(all.names = TRUE)  # Capture all arguments in the current environment
    args = args |> c(list(...))
    args$function_original = NULL  # Remove the target function from arguments
    do.call(function_original, args)   # Dynamically pass the args to another function
}
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(..., function_original = cat, sep = "") {    
    # browser()
    # Browse[1]> ls(envir = environment(), all.names = TRUE) %>% dput()
    # c("...", "function_original", "sep")
    # Browse[1]> ls.all.names.map_get.str()
    # Error in map(set_names(list_objectnames), get) : 
    #   ℹ In index: 1.
    # ℹ With name: ....
    # Caused by error in `.f()`:
    # ! argument "..." is missing, with no default
    # Browse[1]> str(...)
    #  chr [1:26] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
    
    
    # list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    # args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    
    args = environment() |> as.list(all.names = TRUE)  # Capture all arguments in the current environment
    # Browse[1]> args %>% str
    # List of 3
    #  $ ...              :length 1, mode "...": (*)
    #  $ function_original:function (..., file = "", sep = " ", fill = FALSE, labels = NULL, append = FALSE)  
    #  $ sep              : chr ""
    # Browse[1]> args$... %>% str
    # length 1, mode "...": (*)
    # Browse[1]> args$...
    # <...>
    # Browse[1]> args$... %>% dput()
    # Error in dput(.) : unimplemented type '...' in 'deparse2buff'
    # Browse[1]> list(args$...)
    # [[1]]
    # <...>
    if ("..." %in% names(args)) {
        args$... = NULL
        args = args |> c(list(...))
    }
    
    args$function_original = NULL  # Remove the target function from arguments
    do.call(function_original, args)   # Dynamically pass the args to another function
}
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")
# > LETTERS |> cat0(); letters |> cat0()
# ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
# > LETTERS |> cat0(sep = "|")
# A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(..., function_original = cat, sep = "") {    
    args = as.list(formals())
    browser()
# Browse[1]> args %>% str
# List of 3
#  $ ...              : symbol 
#  $ function_original: symbol cat
#  $ sep              : chr ""
    if ("..." %in% names(args)) {
        args$... = NULL
        args.additional = list(...)
        args = args.additional |> c(args[!names(args) %in% names(args.additional)])
    }
    
    args$function_original = NULL  # Remove the target function from arguments
    do.call(function_original, args)   # Dynamically pass the args to another function
}
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: cat0 = function ----
cat0 = function(..., function_original = cat, sep = "") {    
    args = environment() |> as.list(all.names = TRUE)  # Capture all arguments in the current environment
    if ("..." %in% names(args)) {
        args$... = NULL
        args.additional = list(...)
        args = args.additional |> c(args[!names(args) %in% names(args.additional)])
    }
    args$function_original = NULL  # Remove the target function from arguments
    do.call(function_original, args)   # Dynamically pass the args to another function
}
LETTERS |> cat0(); letters |> cat0()
LETTERS |> cat0(sep = "|")
# > LETTERS |> cat0(); letters |> cat0()
# ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
# > LETTERS |> cat0(sep = "|")
# A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
env1$env.internal.attach$f_function.call_function_with_altered_options = function(function_original, ...) {
    # # list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    # # args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    # args = as.list(formals())
    args = environment() |> as.list(all.names = TRUE)  # Capture all arguments in the current environment
    if ("..." %in% names(args)) {
        args$... = NULL
        args.additional = list(...)
        args = args.additional |> c(args[!names(args) %in% names(args.additional)])
    }
    
    args$function_original = NULL  # Remove the target function from arguments
    do.call(function_original, args)   # Dynamically pass the args to another function
}


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_sourcePath.execute_if_not_sourced =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_sourcePath.execute_if_not_sourced"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.subpath_filename.source.r = NULL, .subpath = NULL, .filename.source.r = NULL,  RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE"))) {
    if(is.null(.subpath_filename.source.r) && !is.null(.subpath) && !is.null(.filename.source.r)) .subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r)
    if(RELOAD_FUNCTION || !.filename.source.r %in% names(.GlobalEnv$env1$source)) {  message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.filename.source.r]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.filename.source.r]])  }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) source_if_not_sourced  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "source_if_not_sourced")

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_sourcePath.execute.force_reload  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_sourcePath.execute.force_reload"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.subpath_filename.source.r = NULL, .subpath = NULL, .filename.source.r = NULL, RELOAD_FUNCTION = TRUE) {
    # # list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    # # args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    # args = as.list(formals())
    args = environment() |> as.list(all.names = TRUE)  # Capture all arguments in the current environment
    if ("..." %in% names(args)) {
        args$... = NULL
        args.additional = list(...)
        args = args.additional |> c(args[!names(args) %in% names(args.additional)])
    }
    do.call(env1$f$f_env1_subenv_objectname.set_ALIAS, args)   # Dynamically pass the args to another function
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
## :: paste0_collapse0 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "paste0_collapse0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {  
    paste0(..., collapse = "")
}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: paste0_collapse0.print =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "paste0_collapse0.print"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {  
    print(paste0(..., collapse = ""))
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### (ALIAS) print.paste0_collapse0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "print.paste0_collapse0")
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
### (ALIAS) ls.map_get.str  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ls.map_get.str")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_environment.list_objectnames_incl_hidden.map_get.str  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_environment.list_objectnames_incl_hidden.map_get.str"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(envir = parent.frame(), all.names = TRUE, pattern, sorted = TRUE, run_dput = FALSE, run_str = TRUE, max.level = 2, give.attr = FALSE, return_map_get = FALSE) {
    # # list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    # # args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    # args = as.list(formals())
    args = environment() |> as.list(all.names = TRUE)  # Capture all arguments in the current environment
    if ("..." %in% names(args)) {
        args$... = NULL
        args.additional = list(...)
        args = args.additional |> c(args[!names(args) %in% names(args.additional)])
    }
    do.call(env1$f$f_environment.list_objectnames.map_get.str, args)   # Dynamically pass the args to another function
}





