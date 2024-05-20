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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env.custom\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); env.custom$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env.custom$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_path.list_subpath"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$subpath = subpath
# env.custom$path$sourcename = sourcename
# env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
# env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
# env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# cat("# ",'sourcename = "',sourcename,'"', "\n",
#     "# ",sourcename,".dev.r", "\n",
#     "# ",sourcename,".source.r", "\n",
#     '# utils::browseURL("',env.custom$path$source_base_local,"/",env.custom$path$subpath,'")', "\n",
#     '# utils::browseURL("',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env.custom$path$source_base,"/","',env.custom$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$current.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$current.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$current.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$current.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$current.path.filename.ext);
# }
# #|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


library(tidyverse)

if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
    env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
} 
# #@ for (env.custom.dependancy in c("")) { -----
# for (env.custom.dependancy in c("f_df.tribble_construct")) {
#     if(!env.custom.dependancy %in% names(env.custom)) {
#         if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
#         objectname = env.custom.dependancy
#         source(file.path(env.custom$path$source_base,"",paste0(objectname,".source.r")))
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
            subvec_files_subpath.excl_origin <- env.custom$f_path.list_subpath.DepthFirstSearch_recursive(i_files_subpath, max_depth - 1, FALSE, print.intermediate, .initial_max_depth = .initial_max_depth)
            
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
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$",objectname,"()\n",sep=""); get(objectname, envir=env.custom)() # Run the loaded function by default
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
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$",objectname,"()\n",sep=""); get(objectname, envir=env.custom)() # Run the loaded function by default
}




#@ objectname = "f_path.list_subpath" =========
objectname = "f_path.list_subpath"
object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, print.intermediate = FALSE, BreadthFirstSearch = FALSE) {
    if (BreadthFirstSearch) {
        env.custom$f_path.list_subpath.BreathFirstSearch(input_path, max_depth, include_input_path, print.intermediate)
    } else {
        env.custom$f_path.list_subpath.DepthFirstSearch_recursive(input_path, max_depth, include_input_path, print.intermediate)
    }
}
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$",objectname,"()\n",sep=""); get(objectname, envir=env.custom)() # Run the loaded function by default
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



