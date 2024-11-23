
env1$env.internal.attach$f_function.call_function_with_altered_options = function(function_original, ...) {
    # args <- as.list(environment())  # Capture all arguments in the current environment
    list_objectnames <- ls(envir = environment(), all.names = TRUE)  # Use ls(all.names = TRUE) to list all objects, including hidden ones
    args <- mget(list_objectnames, envir = environment())    # Use mget() to get all these objects as a list
    do.call(function_original, args)   # Dynamically pass the args to another function
}

