# # .objectname = "f_path.list_subpath"
# # f_path.list_subpath.dev.r
# # f_path.list_subpath.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_path.list_subpath.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_path.list_subpath.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_path.list_subpath" |> paste0(".source.r")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.RelativeSubPath = .RelativeSubPath
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
# env1$path$.SourceName_root = .SourceName_root  
# env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
# env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
# env1$path$.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}
# cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
#     "# ",env1$path$.RelativeSubPath_FileName.dev.r, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.source.r, "  \n",
#     '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#     sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
# env1 = as.environment(env1)
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ====  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }

if(!"path" %in% names(.GlobalEnv$env1)) {
    env1$path = list()
    .objectname = "source_base_local"; .object = Filter(dir.exists, paste0(c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "~"), "/github_tidystat"))[1]; .GlobalEnv$env1$path[[.objectname]] = .object
    .objectname = "source_base_github"; .object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; .GlobalEnv$env1$path[[.objectname]] = .object
    if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
} 
# #@ for (.dependancy in c("")) { -----  
# for (.dependancy in c("f_df.t.tribble_construct")) {
#     if(!.dependancy %in% names(.GlobalEnv$env1)) {
#         if(Sys.getenv("VERBOSE")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
#         .objectname = .dependancy
#         source(file.path(env1$path$source_base,"",paste0(.objectname,".source.r")))
#     }
# }



## @ .objectname = "f_path.list_subpath.DepthFirstSearch_recursive" =========  
.tmp$objectname = "f_path.list_subpath.DepthFirstSearch_recursive"
.tmp$object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, VERBOSE = FALSE, .initial_max_depth = NA) {
    # Initialize .initial_max_depth with max_depth on the first call
    if (is.na(.initial_max_depth)) {
        .initial_max_depth <- max_depth
    }
    
    if (!file.exists(input_path) || !file.info(input_path)$isdir) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    
    list_subpath = list()
    
    if (max_depth == 0) {
        if (include_input_path) {
            list_subpath <- c(list_subpath, input_path)
        }
        return(unlist(list_subpath, use.names = FALSE))
    }
    
    vec_files_subpath.excl_origin <- list.files(input_path, full.names = TRUE)
    for (i_files_subpath in vec_files_subpath.excl_origin) {
        if (file.info(i_files_subpath)$isdir) {
            subvec_files_subpath.excl_origin <- env1$f$f_path.list_subpath.DepthFirstSearch_recursive(i_files_subpath, max_depth - 1, FALSE, VERBOSE, .initial_max_depth = .initial_max_depth)
            
            if (VERBOSE && length(subvec_files_subpath.excl_origin) > 0) {
                cat("Subdirectories of ", i_files_subpath, ": ", length(subvec_files_subpath.excl_origin), "\n")
            }
            
            list_subpath <- c(list_subpath, i_files_subpath, subvec_files_subpath.excl_origin)
        }
    }
    
    if (include_input_path) {
        list_subpath <- c(input_path, list_subpath)
    }
    
    vec_subpath <- unlist(list_subpath, use.names = FALSE)
    
    # Print the structure of the final list of .RelativeSubPaths if at the top level
    if (VERBOSE && max_depth == .initial_max_depth) {
        cat("Structure of the final list of .RelativeSubPaths at the top level:\n")
        str(vec_subpath)
    }
    
    return(vec_subpath)
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)





## @ .objectname = "f_path.list_subpath.BreathFirstSearch" =========  
.tmp$objectname = "f_path.list_subpath.BreathFirstSearch"
.tmp$object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, VERBOSE = isTRUE(getOption("verbose"))) {
    if (!file.exists(input_path) || !file.info(input_path)$isdir) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    
    # Initialize the queue with the input_path at depth 0
    list_list_path_depth <- list(list(path = input_path, depth = 0))
    list_subpath = list()
    
    # Process the queue
    while (length(list_list_path_depth) > 0) {
        # Dequeue the first element
        list_path_depth.current <- list_list_path_depth[[1]]
        list_list_path_depth <- list_list_path_depth[-1]  # Remove the first element
        
        if (VERBOSE) {
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
                if (VERBOSE) cat(' >  i_files_subpath == ',deparse(i_files_subpath), "  \n", sep = "")
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
    
    # Print the final vector of .RelativeSubPaths if requested
    if (VERBOSE) {
        cat("Structure of the final list of .RelativeSubPaths:\n")
        print(str(vec_subpath))
    }
        
    return(vec_subpath)
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)




## @ .objectname = "f_path.list_subpath" =========  
.tmp$objectname = "f_path.list_subpath"
.tmp$object = function(input_path = ".", max_depth = 3, include_input_path = TRUE, VERBOSE = FALSE, BreadthFirstSearch = FALSE) {
    if (BreadthFirstSearch) {
        env1$f$f_path.list_subpath.BreathFirstSearch(input_path, max_depth, include_input_path, VERBOSE)
    } else {
        env1$f$f_path.list_subpath.DepthFirstSearch_recursive(input_path, max_depth, include_input_path, VERBOSE)
    }
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)



  
  
# __________|------  
# @@ END-----  

# > f_path.list_subpath(VERBOSE = T) |> str(max.level = 2, give.attr = TRUE)
# Subdirectories of  ./data :  1 
# Subdirectories of  ./other :  8 
# Subdirectories of  ./Rdev/00_protocol :  4 
# Subdirectories of  ./Rdev/10_import_clean_datatype :  15 
# Subdirectories of  ./Rdev/20_tidy_group_by_match :  3 
# Subdirectories of  ./Rdev/40_visualize_explore_bivariate_stratified :  4 
# Subdirectories of  ./Rdev/50_model_formula_evaluation :  7 
# Subdirectories of  ./Rdev :  42 
# Structure of the final list of .RelativeSubPaths at the top level:
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./data/ATC_RxNorm_NDC" "./examples" "./other" "./other/Bash" "./other/Batch" "./other/C" "./other/Excel" "./other/ODBC" ...
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./data/ATC_RxNorm_NDC" "./examples" "./other" "./other/Bash" "./other/Batch" "./other/C" "./other/Excel" "./other/ODBC" ...
# > f_path.list_subpath(VERBOSE = T, BreadthFirstSearch = T) |> str(max.level = 2, give.attr = TRUE)
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
# Structure of the final list of .RelativeSubPaths:
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./examples" "./other" "./Rdev" "./Rmd" "./Rplot" "./tests" "./vignettes" "./data/ATC_RxNorm_NDC" "./other/Bash" ...
# NULL
#  chr [1:62] "." "./-info" "./-tmp" "./data" "./examples" "./other" "./Rdev" "./Rmd" "./Rplot" "./tests" "./vignettes" "./data/ATC_RxNorm_NDC" "./other/Bash" ...
# > f_path.list_subpath(getwd()) |> str(max.level = 2, give.attr = TRUE)
#  chr [1:62] "D:/OneDrive/[][Rproject]/github_tidystat" "D:/OneDrive/[][Rproject]/github_tidystat/-info" "D:/OneDrive/[][Rproject]/github_tidystat/-tmp" ...



