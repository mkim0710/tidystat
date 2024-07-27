# sourcename = "env1$env.internal" |> paste0(".source.r")
# env1$env.internal.dev.r
# env1$env.internal.source.r
#         https://github.com/mkim0710/tidystat/blob/master/env1$env.internal.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/env1$env.internal.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.dev.r")
# "D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/internal.f_path0.list_path_hierarchy.dev.r")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/.Rprofile" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile"); .First()}
if(!".Rprofile" %in% names(env1$source)) {source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile"); .First()}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### \$ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "env1$env.internal" |> paste0(".source.r")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$subpath = subpath
sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
env1$path$sourcename_root = sourcename_root  
env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
cat("# ",'sourcename_root = "',sourcename_root,'"', "  \n",
    "# ",sourcename_root,".dev.r", "  \n",
    "# ",sourcename_root,".source.r", "  \n",
    '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "  \n",
    '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# # file.copy(from = "',file.path(env1$path$source_base_github,"rstudio-prefs","templates","default.R"), '",  \n# #           to = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# # file.copy(from = "',file.path(env1$path$source_base_github,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"), '",  \n# #           to = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
    '# # file.copy(from = "',file.path(env1$path$source_base_github,"rstudio-prefs","templates","default.R"), '",  \n# #           to = "',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    sep="")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
    # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
    file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  




if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
# env1 = env1 %>% as.environment
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()
if(!"info" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$info <- list()
# if(!"source" %in% names(env1)) env1$source = list()
if(!"path" %in% names(env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
    if(!"source_base" %in% names(env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}  
}  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "  \n", sep="")};
objectname = "path4read"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "  \n", sep="")};
objectname = "path4write"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "  \n", sep="")};
objectname = "path0"; object = file.path("D:", "OneDrive", "[][Rproject]"); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object; cat("env1$path$", objectname, ": ", env1$path[[objectname]], "  \n", sep="")};





# #@ attach(env1$path) --------
# attach(env1$path)
# if (dirname(getwd) == path0) {
#     path1 = getwd; path2 = NA; path3 = NA; 
# } else if (dirname(dirname(getwd)) == path0) {
#     path1 = dirname(getwd); path2 = getwd; path3 = NA; 
# } else if (dirname(dirname(dirname(getwd))) == path0) {
#     path1 = dirname(dirname(getwd)); path2 = dirname(getwd); path3 = getwd; 
# } else {
#     path1 = NA; path2 = NA; path3 = NA; 
# }
# # cat("path1: ", path1, "\n", "path2: ", path2, "\n", "path3: ", path3, "  \n", sep="")
# # > cat("path1: ", path1, "\n", "path2: ", path2, "\n", "path3: ", path3, "  \n", sep="")
# # path1: D:/OneDrive/[][Rproject]/github_tidystat
# # path2: D:/OneDrive/[][Rproject]/github_tidystat/Rdev
# # path3: NA
# 
# #@ detach(env1$path) --------
# detach(env1$path)
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
str(env1$path)

#@ end -----
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env1$env.internal.source.r"))
# # source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env1$env.internal.source.r"))

#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
# objectname = "get_system_info"
# source(file.path(env1$path$source_base,"",paste0(objectname,".source.r")))



