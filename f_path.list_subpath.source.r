# # objectname = "f_path.list_subpath"
# # f_path.list_subpath.dev.r
# # f_path.list_subpath.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_path.list_subpath.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/f_path.list_subpath.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,subpath.filename.source.r) )
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_path.list_subpath" |> paste0(".source.r")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$subpath = subpath
# sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$sourcename_root = sourcename_root  
# env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
# env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
# env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
# }
# #|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


library(tidyverse)

if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
# env1 = as.environment(env1)
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()

if(!"path" %in% names(env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
    env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)  
} 
# #@ for (env1.dependancy in c("")) { -----
# for (env1.dependancy in c("f_df.tribble_construct")) {
#     if(!env1.dependancy %in% names(env1)) {
#         if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
#         objectname = env1.dependancy
#         source(file.path(env1$path$source_base,"",paste0(objectname,".source.r")))
#     }
# }



#@ objectname = "f_path.list_subpath.DepthFirstSearch_recursive" =========
objectname = "f_path.list_subpath.DepthFirstSearch_recursive"
object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, print.intermediate = FALSE, .initial_max_depth = NA) {
    # Initialize .initial_max_depth with max_depth on the first call
    if (is.na(.initial_max_depth)) {
        .initial_max_depth <- max_depth
    }
    
    if (!file.exists(input_path) || !file.info(input_path)$isdir) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    
    list_subpath <- list()
    
    if (max_depth == 0) {
        if (include_input_path) {
            list_subpath <- c(list_subpath, input_path)
        }
        return(unlist(list_subpath, use.names = FALSE))
    }
    
    vec_files_subpath.excl_origin <- list.files(input_path, full.names = TRUE)
    for (i_files_subpath in vec_files_subpath.excl_origin) {
        if (file.info(i_files_subpath)$isdir) {
            subvec_files_subpath.excl_origin <- env1$f_path.list_subpath.DepthFirstSearch_recursive(i_files_subpath, max_depth - 1, FALSE, print.intermediate, .initial_max_depth = .initial_max_depth)
            
            if (print.intermediate && length(subvec_files_subpath.excl_origin) > 0) {
                cat("Subdirectories of ", i_files_subpath, ": ", length(subvec_files_subpath.excl_origin), "\n")
            }
            
            list_subpath <- c(list_subpath, i_files_subpath, subvec_files_subpath.excl_origin)
        }
    }
    
    if (include_input_path) {
        list_subpath <- c(input_path, list_subpath)
    }
    
    vec_subpath <- unlist(list_subpath, use.names = FALSE)
    
    # Print the structure of the final list of subpaths if at the top level
    if (print.intermediate && max_depth == .initial_max_depth) {
        cat("Structure of the final list of subpaths at the top level:\n")
        str(vec_subpath)
    }
    
    return(vec_subpath)
}
if(!objectname %in% names(env1)) {
    packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
    env1[[objectname]] = object
    # cat("> env1$",objectname,"()\n",sep=""); get(objectname, envir=env1)() # Run the loaded function by default
}





#@ objectname = "f_path.list_subpath.BreathFirstSearch" =========
objectname = "f_path.list_subpath.BreathFirstSearch"
object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, print.intermediate = FALSE) {
    if (!file.exists(input_path) || !file.info(input_path)$isdir) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    
    # Initialize the queue with the input_path at depth 0
    list_list_path_depth <- list(list(path = input_path, depth = 0))
    list_subpath <- list()
    
    # Process the queue
    while (length(list_list_path_depth) > 0) {
        # Dequeue the first element
        list_path_depth.current <- list_list_path_depth[[1]]
        list_list_path_depth <- list_list_path_depth[-1]  # Remove the first element
        
        if (print.intermediate) {
            cat("Processing: ", list_path_depth.current$path, " at depth ", list_path_depth.current$depth, "\n")
            cat("Queue length: ", length(list_list_path_depth), "\n")
        }
        
        # Add the current path to list_subpath if it's within the max_depth
        if (list_path_depth.current$depth <= max_depth) {
            if (list_path_depth.current$depth >= 0 || include_input_path) {
                list_subpath <- c(list_subpath, list(list_path_depth.current$path))
            }
            
            # List subdirectories and enqueue them with incremented depth
            vec_files_subpath <- list.files(list_path_depth.current$path, full.names = TRUE)
            for (i_files_subpath in vec_files_subpath) {
                if (file.info(i_files_subpath)$isdir) {
                    # Enqueue subdirectories with incremented depth
                    list_list_path_depth <- c(list_list_path_depth, list(list(path = i_files_subpath, depth = list_path_depth.current$depth + 1)))
                }
            }
        }
    }

    # Optionally remove the input_path from the result
    if (!include_input_path) {
        list_subpath <- list_subpath[-1]
    }
    
    # Flatten the list_subpath to make it a character vector
    vec_subpath <- unlist(list_subpath, use.names = FALSE)
    
    # Print the final vector of subpaths if requested
    if (print.intermediate) {
        cat("Structure of the final list of subpaths:\n")
        print(str(vec_subpath))
    }
        
    return(vec_subpath)
}
if(!objectname %in% names(env1)) {
    packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
    env1[[objectname]] = object
    # cat("> env1$",objectname,"()\n",sep=""); get(objectname, envir=env1)() # Run the loaded function by default
}




#@ objectname = "f_path.list_subpath" =========
objectname = "f_path.list_subpath"
object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, print.intermediate = FALSE, BreadthFirstSearch = FALSE) {
    if (BreadthFirstSearch) {
        env1$f_path.list_subpath.BreathFirstSearch(input_path, max_depth, include_input_path, print.intermediate)
    } else {
        env1$f_path.list_subpath.DepthFirstSearch_recursive(input_path, max_depth, include_input_path, print.intermediate)
    }
}
if(!objectname %in% names(env1)) {
    packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
    env1[[objectname]] = object
    # cat("> env1$",objectname,"()\n",sep=""); get(objectname, envir=env1)() # Run the loaded function by default
}





#@ end -----

# > f_path.list_subpath(print.intermediate = T) |> str()
# Subdirectories of  ./data :  1 
# Subdirectories of  ./other :  8 
# Subdirectories of  ./Rdev/00_protocol :  4 
# Subdirectories of  ./Rdev/10_import_clean_datatype :  15 
# Subdirectories of  ./Rdev/20_tidy_group_by_match :  3 
# Subdirectories of  ./Rdev/40_visualize_explore_bivariate_stratified :  4 
# Subdirectories of  ./Rdev/50_model_formula_evaluation :  7 
# Subdirectories of  ./Rdev :  42 
# Structure of the final list of subpaths at the top level:
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./data/ATC_RxNorm_NDC" "./examples" "./other" "./other/Bash" "./other/Batch" "./other/C" "./other/Excel" "./other/ODBC" ...
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./data/ATC_RxNorm_NDC" "./examples" "./other" "./other/Bash" "./other/Batch" "./other/C" "./other/Excel" "./other/ODBC" ...
# > f_path.list_subpath(print.intermediate = T, BreadthFirstSearch = T) |> str()
# Processing:  .  at depth  0 
# Queue length:  0 
# Processing:  ./-info  at depth  1 
# Queue length:  9 
# Processing:  ./-tmp  at depth  1 
# Queue length:  8 
# Processing:  ./data  at depth  1 
# Queue length:  7 
# Processing:  ./examples  at depth  1 
# Queue length:  7 
# Processing:  ./other  at depth  1 
# Queue length:  6 
# Processing:  ./Rdev  at depth  1 
# Queue length:  13 
# Processing:  ./Rmd  at depth  1 
# Queue length:  21 
# Processing:  ./Rplot  at depth  1 
# Queue length:  20 
# Processing:  ./tests  at depth  1 
# Queue length:  19 
# Processing:  ./vignettes  at depth  1 
# Queue length:  18 
# Processing:  ./data/ATC_RxNorm_NDC  at depth  2 
# Queue length:  17 
# Processing:  ./other/Bash  at depth  2 
# Queue length:  16 
# Processing:  ./other/Batch  at depth  2 
# Queue length:  15 
# Processing:  ./other/C  at depth  2 
# Queue length:  14 
# Processing:  ./other/Excel  at depth  2 
# Queue length:  13 
# Processing:  ./other/ODBC  at depth  2 
# Queue length:  12 
# Processing:  ./other/SAS  at depth  2 
# Queue length:  11 
# Processing:  ./other/Stata  at depth  2 
# Queue length:  10 
# Processing:  ./other/VBA  at depth  2 
# Queue length:  9 
# Processing:  ./Rdev/-dev  at depth  2 
# Queue length:  8 
# Processing:  ./Rdev/00_base_program  at depth  2 
# Queue length:  7 
# Processing:  ./Rdev/00_protocol  at depth  2 
# Queue length:  6 
# Processing:  ./Rdev/10_import_clean_datatype  at depth  2 
# Queue length:  9 
# Processing:  ./Rdev/20_tidy_group_by_match  at depth  2 
# Queue length:  23 
# Processing:  ./Rdev/30_transform_scale_categorical  at depth  2 
# Queue length:  25 
# Processing:  ./Rdev/40_visualize_explore_bivariate_stratified  at depth  2 
# Queue length:  24 
# Processing:  ./Rdev/50_model_formula_evaluation  at depth  2 
# Queue length:  27 
# Processing:  ./Rdev/60_communicate_report_export  at depth  2 
# Queue length:  33 
# Processing:  ./Rdev/00_protocol/01_sample_size  at depth  3 
# Queue length:  32 
# Processing:  ./Rdev/00_protocol/05_count_eligible  at depth  3 
# Queue length:  31 
# Processing:  ./Rdev/00_protocol/06_count_exposure  at depth  3 
# Queue length:  30 
# Processing:  ./Rdev/00_protocol/07_count_outcome  at depth  3 
# Queue length:  29 
# Processing:  ./Rdev/10_import_clean_datatype/11_metadata  at depth  3 
# Queue length:  28 
# Processing:  ./Rdev/10_import_clean_datatype/12_import_files  at depth  3 
# Queue length:  27 
# Processing:  ./Rdev/10_import_clean_datatype/12_import_sqlite  at depth  3 
# Queue length:  26 
# Processing:  ./Rdev/10_import_clean_datatype/12_import_vocabulary  at depth  3 
# Queue length:  25 
# Processing:  ./Rdev/10_import_clean_datatype/13_duplicated  at depth  3 
# Queue length:  24 
# Processing:  ./Rdev/10_import_clean_datatype/13_missing_value  at depth  3 
# Queue length:  23 
# Processing:  ./Rdev/10_import_clean_datatype/13_split_fold  at depth  3 
# Queue length:  22 
# Processing:  ./Rdev/10_import_clean_datatype/15_cleaning_text  at depth  3 
# Queue length:  21 
# Processing:  ./Rdev/10_import_clean_datatype/15_cleaning_time  at depth  3 
# Queue length:  20 
# Processing:  ./Rdev/10_import_clean_datatype/16_categorical_factor  at depth  3 
# Queue length:  19 
# Processing:  ./Rdev/10_import_clean_datatype/17_categorical_indicators  at depth  3 
# Queue length:  18 
# Processing:  ./Rdev/10_import_clean_datatype/18_dichotomous_logical  at depth  3 
# Queue length:  17 
# Processing:  ./Rdev/10_import_clean_datatype/19_datetime  at depth  3 
# Queue length:  16 
# Processing:  ./Rdev/10_import_clean_datatype/19_numeric_integer  at depth  3 
# Queue length:  15 
# Processing:  ./Rdev/10_import_clean_datatype/array_list  at depth  3 
# Queue length:  14 
# Processing:  ./Rdev/20_tidy_group_by_match/23_group_by_PersonID  at depth  3 
# Queue length:  13 
# Processing:  ./Rdev/20_tidy_group_by_match/25_study_population  at depth  3 
# Queue length:  12 
# Processing:  ./Rdev/20_tidy_group_by_match/27_match  at depth  3 
# Queue length:  11 
# Processing:  ./Rdev/40_visualize_explore_bivariate_stratified/43_network  at depth  3 
# Queue length:  10 
# Processing:  ./Rdev/40_visualize_explore_bivariate_stratified/44_map  at depth  3 
# Queue length:  9 
# Processing:  ./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures  at depth  3 
# Queue length:  8 
# Processing:  ./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified  at depth  3 
# Queue length:  7 
# Processing:  ./Rdev/50_model_formula_evaluation/51_model_formula  at depth  3 
# Queue length:  6 
# Processing:  ./Rdev/50_model_formula_evaluation/53_model_selection  at depth  3 
# Queue length:  5 
# Processing:  ./Rdev/50_model_formula_evaluation/55_model_weighted  at depth  3 
# Queue length:  4 
# Processing:  ./Rdev/50_model_formula_evaluation/56_model_bootstrap  at depth  3 
# Queue length:  3 
# Processing:  ./Rdev/50_model_formula_evaluation/57_model_time2event  at depth  3 
# Queue length:  2 
# Processing:  ./Rdev/50_model_formula_evaluation/57_model_trajectory  at depth  3 
# Queue length:  1 
# Processing:  ./Rdev/50_model_formula_evaluation/59_model_evaluation  at depth  3 
# Queue length:  0 
# Structure of the final list of subpaths:
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./examples" "./other" "./Rdev" "./Rmd" "./Rplot" "./tests" "./vignettes" "./data/ATC_RxNorm_NDC" "./other/Bash" ...
# NULL
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./examples" "./other" "./Rdev" "./Rmd" "./Rplot" "./tests" "./vignettes" "./data/ATC_RxNorm_NDC" "./other/Bash" ...
# > f_path.list_subpath(getwd()) |> str()
#  chr [1:62] "D:/OneDrive/[][Rproject]/github_tidystat" "D:/OneDrive/[][Rproject]/github_tidystat/-info" "D:/OneDrive/[][Rproject]/github_tidystat/-tmp" ...



