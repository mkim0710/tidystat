# # objectname = "f_filename.ext.find_subpath"
# # f_filename.ext.find_subpath.dev.r
# # f_filename.ext.find_subpath.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_filename.ext.find_subpath.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/f_filename.ext.find_subpath.source.r")
# ####################################################################################################
# objectname = "f_filename.ext.find_subpath"
# cat("# ", 'objectname = "', objectname, '"', "\n",
#     "# ", objectname, ".dev.r", "\n",
#     "# ", objectname, ".source.r", "\n",
#     "#         https://github.com/mkim0710/tidystat/blob/master/", objectname, ".dev.r", "\n",
#     '# source("https://github.com/mkim0710/tidystat/raw/master/', objectname, '.source.r")', "\n",
#     sep="")
# rstudioapi::navigateToFile(paste0(objectname, ".source.r"))
# rstudioapi::navigateToFile(paste0(objectname, ".dev.r"))

library(tidyverse)

# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
}
# #@ for (env.custom.dependancy in c("")) { -----
# for (env.custom.dependancy in c("f_df.tribble_construct")) {
#     if(!env.custom.dependancy %in% names(env.custom)) {
#         if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
#         objectname = env.custom.dependancy
#         source(file.path(file.path(env.custom$path$source_base_local,""), paste0(objectname, ".source.r")))
#     }
# }




#@ objectname = "f_filename.ext.find_subpath" =========
objectname = "f_filename.ext.find_subpath"
object = function(filename.ext, input_path = ".", max_depth = 3, print.intermediate = FALSE, BreathFirstSearch = TRUE, findMultiple = FALSE) {
    # # tools::file_ext(path.basename)
    # # # > tools::file_ext
    # # # function (x) 
    # # # {
    # # #     pos <- regexpr("\\.([[:alnum:]]+)$", x)
    # # #     ifelse(pos > -1L, substring(x, pos + 1L), "")
    # # # }
    # # # <bytecode: 0x0000020ed66821a0>
    # # # <environment: namespace:tools>
    ext = filename.ext %>% str_extract("\\.([[:alnum:]]+)$") %>% str_replace("^\\.", "")
    if (is.na(ext)) {stop("Error: filename.ext must have an extension.")}
    
    if (print.intermediate) {
        cat("Searching: ", input_path, strrep(" ", max(50-nchar(input_path),0)), "\t at depth ", 0, "\n", sep="")
    }
    
    if (file.exists(file.path(input_path, filename.ext))) {
        return(file.path(input_path, filename.ext))
    } else if (BreathFirstSearch) {
        return(env.custom$f_filename.ext.find_subpath.BreathFirstSearch(filename.ext=filename.ext, input_path=input_path, max_depth=max_depth, print.intermediate=print.intermediate, findMultiple=findMultiple))
    } else {
        return(NULL)
    }
}
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$", objectname, "()\n", sep=""); get(objectname, envir = env.custom)() # Run the loaded function by default
}



#@ objectname = "f_filename.ext.find_subpath.BreathFirstSearch" =========
objectname = "f_filename.ext.find_subpath.BreathFirstSearch"
object = function(filename.ext, input_path = ".", max_depth = 3, print.intermediate = FALSE, findMultiple = FALSE) {
    # Breath-first search for the filename.ext in the subdirectories of the input_path
    # Initialize the queue with the input_path at depth 0
    list_list_path_depth <- list(list(path = input_path, depth = 0))
    list_subpath <- list()
    list_out = list()
    
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
                        cat("Searching: ", i_files_subpath, strrep(" ", max(50-nchar(i_files_subpath),0)), "\t at depth ", list_path_depth.current$depth+1, "; ", sep="")
                        cat("Queue length: ", length(list_list_path_depth)+1, "\n", sep="")
                    }
                    if (file.exists(file.path(i_files_subpath, filename.ext))) {
                        if (findMultiple == FALSE) return(file.path(i_files_subpath, filename.ext))
                        list_out <- c(list_out, list(file.path(i_files_subpath, filename.ext)))
                    }
                    # Enqueue subdirectories with incremented depth
                    list_list_path_depth <- c(list_list_path_depth, list(list(path = i_files_subpath, depth = list_path_depth.current$depth + 1)))
                }
            }
        }
    }

    if (length(list_out) == 0) {
        cat("----------- File not found while searching following subpaths:\n")
        vec_subpath <- unlist(list_subpath, use.names = FALSE)
        vec_subpath %>% {cat(deparse(., width.cutoff=500), '\n', sep='')} # dput() cat(deparse(., width.cutoff=120)), width.cutoff=500 is the max ----
        return(NULL)
    }
        
    # # Flatten the list to make it a character vector
    vec_out <- unlist(list_out, use.names = FALSE)
    return(vec_out)
}


if(!objectname %in% names(env.custom)) {
    # packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$", objectname, "()\n", sep=""); get(objectname, envir = env.custom)() # Run the loaded function by default
}



# filename.ext = "fhs.index100le10.rds"
# env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # [1] "./data/fhs.index100le10.rds"
# 
# filename.ext = "help.array.r"
# env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # Searching: ./examples                                        	 at depth 1; Queue length: 5
# # Searching: ./other                                           	 at depth 1; Queue length: 6
# # Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# # Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# # Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# # Searching: ./tests                                           	 at depth 1; Queue length: 10
# # Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# # Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# # Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# # Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# # Searching: ./other/C                                         	 at depth 2; Queue length: 9
# # Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# # Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# # Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# # Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# # Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# # Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# # Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# # Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# # Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# # Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# # Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# # Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# # Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# # Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# # Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# # Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# # Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# # Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# # Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# # Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# # Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# # Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# # Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# # Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# # Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# # [1] "./Rdev/10_import_clean_datatype/array_list/help.array.r"
# 
# filename.ext = "does not exist.r"
# env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # Searching: ./examples                                        	 at depth 1; Queue length: 5
# # Searching: ./other                                           	 at depth 1; Queue length: 6
# # Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# # Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# # Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# # Searching: ./tests                                           	 at depth 1; Queue length: 10
# # Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# # Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# # Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# # Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# # Searching: ./other/C                                         	 at depth 2; Queue length: 9
# # Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# # Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# # Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# # Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# # Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# # Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# # Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# # Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# # Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# # Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# # Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# # Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# # Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# # Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# # Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# # Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# # Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# # Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# # Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# # Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# # Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# # Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# # Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# # Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# # Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# # Searching: ./Rdev/20_tidy_group_by_match/23_group_by_PersonID	 at depth 3; Queue length: 24
# # Searching: ./Rdev/20_tidy_group_by_match/25_study_population 	 at depth 3; Queue length: 25
# # Searching: ./Rdev/20_tidy_group_by_match/27_match            	 at depth 3; Queue length: 26
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/43_network	 at depth 3; Queue length: 25
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/44_map	 at depth 3; Queue length: 26
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures	 at depth 3; Queue length: 27
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified	 at depth 3; Queue length: 28
# # Searching: ./Rdev/50_model_formula_evaluation/51_model_formula	 at depth 3; Queue length: 28
# # Searching: ./Rdev/50_model_formula_evaluation/53_model_selection	 at depth 3; Queue length: 29
# # Searching: ./Rdev/50_model_formula_evaluation/55_model_weighted	 at depth 3; Queue length: 30
# # Searching: ./Rdev/50_model_formula_evaluation/56_model_bootstrap	 at depth 3; Queue length: 31
# # Searching: ./Rdev/50_model_formula_evaluation/57_model_time2event	 at depth 3; Queue length: 32
# # Searching: ./Rdev/50_model_formula_evaluation/57_model_trajectory	 at depth 3; Queue length: 33
# # Searching: ./Rdev/50_model_formula_evaluation/59_model_evaluation	 at depth 3; Queue length: 34
# # ----------- File not found while searching following subpaths:
# # c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# # NULL
