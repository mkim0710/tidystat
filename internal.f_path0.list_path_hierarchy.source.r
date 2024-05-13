# # sourcename = "internal.f_path0.list_path_hierarchy"
# # internal.f_path0.list_path_hierarchy.dev.r
# # internal.f_path0.list_path_hierarchy.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/internal.f_path0.list_path_hierarchy.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/internal.f_path0.list_path_hierarchy.source.r")
# # sourcename = "internal.f_path0.list_path_hierarchy"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
# # # sourcename = "env.custom$env.internal"
# # # env.custom$env.internal.dev.r
# # # env.custom$env.internal.source.r
# # #         https://github.com/mkim0710/tidystat/blob/master/env.custom$env.internal.dev.r
# # # source("https://github.com/mkim0710/tidystat/raw/master/env.custom$env.internal.source.r")
# # # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.dev.r")
# # # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env.custom$env.internal.source.r")
# # #|________________________________________________________________________________|#
# # #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#
# objectname = "internal.f_path0.list_path_hierarchy"
# subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# utils::browseURL(subpath)
# sourcename = objectname
# dev.subpath.filename.ext = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
# subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# cat("# ", 'sourcename = "', sourcename, '"', "\n",
#     "# ", sourcename, ".dev.r", "\n",
#     "# ", sourcename, ".source.r", "\n",
#     '#         ', source_base_github_blob,"/",dev.subpath.filename.ext, "\n",
#     '# source("', source_base_github,"/",subpath.filename.source.r,'")', "\n",
#     '# file.edit("', source_base_local,"/",dev.subpath.filename.ext,'")', "\n",
#     '# file.edit("', source_base_local,"/",subpath.filename.source.r,'")', "\n",
#     sep="")
# current.path.filename.ext=rstudioapi::getSourceEditorContext()$path
# if(!file.exists(dev.subpath.filename.ext)) file.create(dev.subpath.filename.ext); file.edit(dev.subpath.filename.ext); file.edit(current.path.filename.ext);
# if(!file.exists(subpath.filename.source.r)) file.create(subpath.filename.source.r); file.edit(subpath.filename.source.r); file.edit(current.path.filename.ext);



if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"path" %in% names(env.custom)) env.custom$path = list()

#% f_path0.list_path_hierarchy =======
env.custom$path$f_path0.list_path_hierarchy <- function(path0, path_last = getwd(), max_hierarchy = 5, print.intermediate = FALSE) {
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
    list_path_hierarchy <- list_path[seq_len(min(max_hierarchy+1, length(list_path)))]
    if (length(list_path_hierarchy) < max_hierarchy+1) {
        list_path_hierarchy <- c(list_path_hierarchy, rep(NA, max_hierarchy+1 - length(list_path_hierarchy)))
    }
    
    return(list_path_hierarchy)
}


