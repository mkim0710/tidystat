# sourcename = "env.custom$env.internal"
# env.custom$env.internal.dev.r
# env.custom$env.internal.source.r
#         https://github.com/mkim0710/tidystat/blob/master/env.custom$env.internal.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/env.custom$env.internal.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
objectname = "env.custom$env.internal"
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
utils::browseURL(subpath)
sourcename = objectname
dev.subpath.filename.ext = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
cat("# ", 'sourcename = "', sourcename, '"', "\n",
    "# ", sourcename, ".dev.r", "\n",
    "# ", sourcename, ".source.r", "\n",
    '#         ', source_base_github_blob,"/",dev.subpath.filename.ext, "\n",
    '# source("', source_base_github,"/",subpath.filename.source.r,'")', "\n",
    '# file.edit("', source_base_local,"/",dev.subpath.filename.ext,'")', "\n",
    '# file.edit("', source_base_local,"/",subpath.filename.source.r,'")', "\n",
    sep="")
current.path.filename.ext=rstudioapi::getSourceEditorContext()$path
if(!file.exists(dev.subpath.filename.ext)) file.create(dev.subpath.filename.ext); file.edit(dev.subpath.filename.ext); file.edit(current.path.filename.ext);
if(!file.exists(subpath.filename.source.r)) file.create(subpath.filename.source.r); file.edit(subpath.filename.source.r); file.edit(current.path.filename.ext);


# if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"info" %in% names(env.custom)) env.custom$info = list()
# if(!"source" %in% names(env.custom)) env.custom$source = list()
if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
    env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
}  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
objectname = "path4read"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
objectname = "path4write"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
objectname = "path0"; object = file.path("D:", "OneDrive", "[][Rproject]"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};





# #@ attach(env.custom$path) --------
# attach(env.custom$path)
# if (dirname(getwd) == path0) {
#     path1 = getwd; path2 = NA; path3 = NA; 
# } else if (dirname(dirname(getwd)) == path0) {
#     path1 = dirname(getwd); path2 = getwd; path3 = NA; 
# } else if (dirname(dirname(dirname(getwd))) == path0) {
#     path1 = dirname(dirname(getwd)); path2 = dirname(getwd); path3 = getwd; 
# } else {
#     path1 = NA; path2 = NA; path3 = NA; 
# }
# # cat("path1: ", path1, "\n", "path2: ", path2, "\n", "path3: ", path3, "\n", sep="")
# # > cat("path1: ", path1, "\n", "path2: ", path2, "\n", "path3: ", path3, "\n", sep="")
# # path1: D:/OneDrive/[][Rproject]/github_tidystat
# # path2: D:/OneDrive/[][Rproject]/github_tidystat/Rdev
# # path3: NA
# 
# #@ detach(env.custom$path) --------
# detach(env.custom$path)
# 






#% f_path0.list_path_hierarchy =======
f_path0.list_path_hierarchy <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
    # Initialize a list to hold the path hierarchy
    list_path <- list()
    
    # Initialize a variable to keep track of the previous directory
    prev_dir <- ""
    
    # Loop to dynamically check the relationship between path_last and path0
    while (TRUE) {
        list_path <- c(list(path_last), list_path)  # Prepend the current path to the hierarchy
        if (print.intermediate) {
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
    
    # Ensure the list is of length max_hierarchy, filling excess with NA
    list_path_hierarchy <- list_path[1:min(max_hierarchy, length(list_path))]
    if (length(list_path_hierarchy) < max_hierarchy) {
        list_path_hierarchy <- c(list_path_hierarchy, rep(NA, max_hierarchy - length(list_path_hierarchy)))
    }
    
    return(list_path_hierarchy)
}


# Example usage
path_last <- "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
path0 <- "D:/OneDrive/[][Rproject]"
max_hierarchy <- 5
list_path_hierarchy <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = TRUE)
str(list_path_hierarchy)
# > list_path_hierarchy <- f_path0.list_path_hierarchy(path0 = path0, path_last = path_last, max_hierarchy = max_hierarchy, print.intermediate = TRUE)
# > # Current path:  D:/OneDrive/[][Rproject]/github_tidystat/Rdev 
# > str(list_path)
# List of 1
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
# > # Current path:  D:/OneDrive/[][Rproject]/github_tidystat 
# > str(list_path)
# List of 2
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
# > # Current path:  D:/OneDrive/[][Rproject] 
# > str(list_path)
# List of 3
#  $ : chr "D:/OneDrive/[][Rproject]"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
# > str(list_path_hierarchy)
# List of 5
#  $ : chr "D:/OneDrive/[][Rproject]"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
#  $ : logi NA
#  $ : logi NA






#@ end ----
str(env.custom$path)

#@ end -----
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env.custom$env.internal.source.r"))
# # source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env.custom$env.internal.source.r"))

# #@ source(file.path(env.custom$path$source_base,"",paste0(sourcename,".source.r")))----
# objectname = "get_system_info"
# source(file.path(env.custom$path$source_base,"",paste0(objectname,".source.r")))



