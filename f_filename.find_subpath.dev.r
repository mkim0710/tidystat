# f_filename.find_subpath.source.r
# f_filename.find_subpath.dev.r
#         https://github.com/mkim0710/tidystat/blob/master/f_filename.find_subpath.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/f_filename.find_subpath.source.r")

library(tidyverse)

# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    if(!"source_base_local" %in% names(env.custom$path)) {
        env.custom$path$source_base_local = "D:/OneDrive/[][Rproject]/github_tidystat"
        cat("env.custom$path$source_base_local: ", env.custom$path$source_base_local, "\n")
    }
    if(!"source_base_github" %in% names(env.custom$path)) {
        env.custom$path$source_base_github = "https://github.com/mkim0710/tidystat/raw/master"
        cat("env.custom$path$source_base_github: ", env.custom$path$source_base_github, "\n")
    }
}
# #@ for (env.custom.dependancy in c("")) { -----
# for (env.custom.dependancy in c("f_df.tribble_construct")) {
#     if(!env.custom.dependancy %in% names(env.custom)) {
#         cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))
#         objectname = env.custom.dependancy
#         source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))
#     }
# }







#@ objectname = "f_filename.find_subpath" =========
objectname = "f_filename.find_subpath"
f_filename.find_subpath = function(filename, input_path = ".", max_depth = 3, print.intermediate = FALSE, BreathFirstSearch = TRUE) {
    if (print.intermediate) {
        cat("Searching: ", input_path, " at depth ", 0, "\n")
    }
    
    if (file.exists(file.path(input_path, filename))) {
        return(file.path(input_path, filename))
    } else if (BreathFirstSearch) {
        return(f_filename.find_subpath.BreathFirstSearch(filename, input_path, max_depth, print.intermediate))
    } else {
        return(NULL)
    }
}



#@ objectname = "f_filename.find_subpath.BreathFirstSearch" =========
objectname = "f_filename.find_subpath.BreathFirstSearch"
f_filename.find_subpath.BreathFirstSearch = function(filename, input_path = ".", max_depth = 3, print.intermediate = FALSE) {
    # Breath-first search for the filename in the subdirectories of the input_path
    # Initialize the queue with the input_path at depth 0
    list_list_path_depth <- list(list(path = input_path, depth = 0))
    list_subpath <- list()
    
    # Process the queue
    while (length(list_list_path_depth) > 0) {
        # Dequeue the first element
        list_path_depth.current <- list_list_path_depth[[1]]
        list_list_path_depth <- list_list_path_depth[-1]  # Remove the first element
        
        # Add the current path to list_subpath if it's within the max_depth
        if (list_path_depth.current$depth <= max_depth) {
            list_subpath <- c(list_subpath, list(list_path_depth.current$path))
            
            # List subdirectories and enqueue them with incremented depth
            vec_files_subpath <- list.files(list_path_depth.current$path, full.names = TRUE)
            for (i_files_subpath in vec_files_subpath) {
                if (file.info(i_files_subpath)$isdir) {
                    if (print.intermediate) {
                        cat("Searching: ", i_files_subpath, " at depth ", list_path_depth.current$depth+1, "\n")
                        cat("Queue length: ", length(list_list_path_depth)+1, "\n")
                    }
                    if (file.exists(file.path(i_files_subpath, filename))) {
                        return(file.path(i_files_subpath, filename))
                    }
                    # Enqueue subdirectories with incremented depth
                    list_list_path_depth <- c(list_list_path_depth, list(list(path = i_files_subpath, depth = list_path_depth.current$depth + 1)))
                }
            }
        }
    }

    # Flatten the list_subpath to make it a character vector
    vec_subpath <- unlist(list_subpath, use.names = FALSE)
    
    # Print the final vector of subpaths if requested
    if (print.intermediate) {
        cat("File not found while searching following subpaths:\n")
        dput(vec_subpath)
    }
        
    return(vec_subpath)
}



filename = "fhs.index100le10.rds"
f_filename.find_subpath(filename, print.intermediate = T)
# > filename = "fhs.index100le10.rds"
# > f_filename.find_subpath(filename, print.intermediate = T)
# Searching:  .  at depth  0 
# Searching:  ./-info  at depth  1 
# Queue length:  1 
# Searching:  ./-tmp  at depth  1 
# Queue length:  2 
# Searching:  ./data  at depth  1 
# Queue length:  3 
# [1] "./data/fhs.index100le10.rds"

filename = "help.array.r"
f_filename.find_subpath(filename, print.intermediate = T)
# > filename = "help.array.r"
# > f_filename.find_subpath(filename, print.intermediate = T)
# Searching:  .  at depth  0 
# Searching:  ./-info  at depth  1 
# Queue length:  1 
# Searching:  ./-tmp  at depth  1 
# Queue length:  2 
# Searching:  ./data  at depth  1 
# Queue length:  3 
# Searching:  ./examples  at depth  1 
# Queue length:  4 
# Searching:  ./other  at depth  1 
# Queue length:  5 
# Searching:  ./Rdev  at depth  1 
# Queue length:  6 
# Searching:  ./Rmd  at depth  1 
# Queue length:  7 
# Searching:  ./Rplot  at depth  1 
# Queue length:  8 
# Searching:  ./tests  at depth  1 
# Queue length:  9 
# Searching:  ./vignettes  at depth  1 
# Queue length:  10 
# Searching:  ./data/ATC_RxNorm_NDC  at depth  2 
# Queue length:  8 
# Searching:  ./other/Bash  at depth  2 
# Queue length:  7 
# Searching:  ./other/Batch  at depth  2 
# Queue length:  8 
# Searching:  ./other/C  at depth  2 
# Queue length:  9 
# Searching:  ./other/Excel  at depth  2 
# Queue length:  10 
# Searching:  ./other/ODBC  at depth  2 
# Queue length:  11 
# Searching:  ./other/SAS  at depth  2 
# Queue length:  12 
# Searching:  ./other/Stata  at depth  2 
# Queue length:  13 
# Searching:  ./other/VBA  at depth  2 
# Queue length:  14 
# Searching:  ./Rdev/-dev  at depth  2 
# Queue length:  14 
# Searching:  ./Rdev/00_base_program  at depth  2 
# Queue length:  15 
# Searching:  ./Rdev/00_protocol  at depth  2 
# Queue length:  16 
# Searching:  ./Rdev/10_import_clean_datatype  at depth  2 
# Queue length:  17 
# Searching:  ./Rdev/20_tidy_group_by_match  at depth  2 
# Queue length:  18 
# Searching:  ./Rdev/30_transform_scale_categorical  at depth  2 
# Queue length:  19 
# Searching:  ./Rdev/40_visualize_explore_bivariate_stratified  at depth  2 
# Queue length:  20 
# Searching:  ./Rdev/50_model_formula_evaluation  at depth  2 
# Queue length:  21 
# Searching:  ./Rdev/60_communicate_report_export  at depth  2 
# Queue length:  22 
# Searching:  ./Rdev/00_protocol/01_sample_size  at depth  3 
# Queue length:  7 
# Searching:  ./Rdev/00_protocol/05_count_eligible  at depth  3 
# Queue length:  8 
# Searching:  ./Rdev/00_protocol/06_count_exposure  at depth  3 
# Queue length:  9 
# Searching:  ./Rdev/00_protocol/07_count_outcome  at depth  3 
# Queue length:  10 
# Searching:  ./Rdev/10_import_clean_datatype/11_metadata  at depth  3 
# Queue length:  10 
# Searching:  ./Rdev/10_import_clean_datatype/12_import_files  at depth  3 
# Queue length:  11 
# Searching:  ./Rdev/10_import_clean_datatype/12_import_sqlite  at depth  3 
# Queue length:  12 
# Searching:  ./Rdev/10_import_clean_datatype/12_import_vocabulary  at depth  3 
# Queue length:  13 
# Searching:  ./Rdev/10_import_clean_datatype/13_duplicated  at depth  3 
# Queue length:  14 
# Searching:  ./Rdev/10_import_clean_datatype/13_missing_value  at depth  3 
# Queue length:  15 
# Searching:  ./Rdev/10_import_clean_datatype/13_split_fold  at depth  3 
# Queue length:  16 
# Searching:  ./Rdev/10_import_clean_datatype/15_cleaning_text  at depth  3 
# Queue length:  17 
# Searching:  ./Rdev/10_import_clean_datatype/15_cleaning_time  at depth  3 
# Queue length:  18 
# Searching:  ./Rdev/10_import_clean_datatype/16_categorical_factor  at depth  3 
# Queue length:  19 
# Searching:  ./Rdev/10_import_clean_datatype/17_categorical_indicators  at depth  3 
# Queue length:  20 
# Searching:  ./Rdev/10_import_clean_datatype/18_dichotomous_logical  at depth  3 
# Queue length:  21 
# Searching:  ./Rdev/10_import_clean_datatype/19_datetime  at depth  3 
# Queue length:  22 
# Searching:  ./Rdev/10_import_clean_datatype/19_numeric_integer  at depth  3 
# Queue length:  23 
# Searching:  ./Rdev/10_import_clean_datatype/array_list  at depth  3 
# Queue length:  24 
# [1] "./Rdev/10_import_clean_datatype/array_list/help.array.r"




#@ end -----
