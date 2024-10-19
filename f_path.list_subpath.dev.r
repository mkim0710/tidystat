# .objectname = "f_path.list_subpath"
# f_path.list_subpath.dev.r
# f_path.list_subpath.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_path.list_subpath.dev.r
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_path.list_subpath.source.r")
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
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(isTRUE(options()$function.reload) || !.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$CurrentSource.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path_filename.ext)) if(env1$path$CurrentSource.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path_filename.ext))
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_path.list_subpath" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.subpath = .subpath
.sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root  
env1$path$.subpath_filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath_filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath_filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath_filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath_filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath_filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path_filename.ext)) if(env1$path$CurrentSource.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path_filename.ext)) if(env1$path$CurrentSource.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path_filename.ext)) if(env1$path$CurrentSource.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path_filename.ext));', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath_filename.source.r) ) ----  
# env1 = env0
# .subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(isTRUE(options()$function.reload) || !.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# Function to recursively list all subpaths of a given directory with a maximum depth

f_path.list_subpath <- function(input_path = ".", max_depth = 3, include_input_path = TRUE, VERBOSE = FALSE, BreadthFirstSearch = FALSE) {
    if (BreadthFirstSearch) {
        f_path.list_subpath.BreathFirstSearch(input_path, max_depth, include_input_path, VERBOSE)
    } else {
        f_path.list_subpath.DepthFirstSearch_recursive(input_path, max_depth, include_input_path, VERBOSE)
    }
}


#% f_path.list_subpath.DepthFirstSearch_recursive =====  
f_path.list_subpath.DepthFirstSearch_recursive <- function(input_path = ".", max_depth = 3, include_input_path = TRUE, VERBOSE = FALSE, .initial_max_depth = NA) {
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
            subvec_files_subpath.excl_origin <- f_path.list_subpath.DepthFirstSearch_recursive(i_files_subpath, max_depth - 1, FALSE, VERBOSE, .initial_max_depth = .initial_max_depth)
            
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
    
    # Print the structure of the final list of subpaths if at the top level
    if (VERBOSE && max_depth == .initial_max_depth) {
        cat("Structure of the final list of subpaths at the top level:\n")
        str(vec_subpath)
    }
    
    return(vec_subpath)
}


f_path.list_subpath.DepthFirstSearch_recursive(VERBOSE = T) |> as.list() |> str() #----
f_path.list_subpath.DepthFirstSearch_recursive(getwd()) |> as.list() |> str() #----
# > f_path.list_subpath.DepthFirstSearch_recursive(VERBOSE = T) |> as.list() |> str() #----  
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
# List of 62
#  $ : chr "."
#  $ : chr "./-info"
#  $ : chr "./-tmp"
#  $ : chr "./data"
#  $ : chr "./data/ATC_RxNorm_NDC"
#  $ : chr "./examples"
#  $ : chr "./other"
#  $ : chr "./other/Bash"
#  $ : chr "./other/Batch"
#  $ : chr "./other/C"
#  $ : chr "./other/Excel"
#  $ : chr "./other/ODBC"
#  $ : chr "./other/SAS"
#  $ : chr "./other/Stata"
#  $ : chr "./other/VBA"
#  $ : chr "./Rdev"
#  $ : chr "./Rdev/-dev"
#  $ : chr "./Rdev/00_base_program"
#  $ : chr "./Rdev/00_protocol"
#  $ : chr "./Rdev/00_protocol/01_sample_size"
#  $ : chr "./Rdev/00_protocol/05_count_eligible"
#  $ : chr "./Rdev/00_protocol/06_count_exposure"
#  $ : chr "./Rdev/00_protocol/07_count_outcome"
#  $ : chr "./Rdev/10_import_clean_datatype"
#  $ : chr "./Rdev/10_import_clean_datatype/11_metadata"
#  $ : chr "./Rdev/10_import_clean_datatype/12_import_files"
#  $ : chr "./Rdev/10_import_clean_datatype/12_import_sqlite"
#  $ : chr "./Rdev/10_import_clean_datatype/12_import_vocabulary"
#  $ : chr "./Rdev/10_import_clean_datatype/13_duplicated"
#  $ : chr "./Rdev/10_import_clean_datatype/13_missing_value"
#  $ : chr "./Rdev/10_import_clean_datatype/13_split_fold"
#  $ : chr "./Rdev/10_import_clean_datatype/15_cleaning_text"
#  $ : chr "./Rdev/10_import_clean_datatype/15_cleaning_time"
#  $ : chr "./Rdev/10_import_clean_datatype/16_categorical_factor"
#  $ : chr "./Rdev/10_import_clean_datatype/17_categorical_indicators"
#  $ : chr "./Rdev/10_import_clean_datatype/18_dichotomous_logical"
#  $ : chr "./Rdev/10_import_clean_datatype/19_datetime"
#  $ : chr "./Rdev/10_import_clean_datatype/19_numeric_integer"
#  $ : chr "./Rdev/10_import_clean_datatype/array_list"
#  $ : chr "./Rdev/20_tidy_group_by_match"
#  $ : chr "./Rdev/20_tidy_group_by_match/23_group_by_PersonID"
#  $ : chr "./Rdev/20_tidy_group_by_match/25_study_population"
#  $ : chr "./Rdev/20_tidy_group_by_match/27_match"
#  $ : chr "./Rdev/30_transform_scale_categorical"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/43_network"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/44_map"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified"
#  $ : chr "./Rdev/50_model_formula_evaluation"
#  $ : chr "./Rdev/50_model_formula_evaluation/51_model_formula"
#  $ : chr "./Rdev/50_model_formula_evaluation/53_model_selection"
#  $ : chr "./Rdev/50_model_formula_evaluation/55_model_weighted"
#  $ : chr "./Rdev/50_model_formula_evaluation/56_model_bootstrap"
#  $ : chr "./Rdev/50_model_formula_evaluation/57_model_time2event"
#  $ : chr "./Rdev/50_model_formula_evaluation/57_model_trajectory"
#  $ : chr "./Rdev/50_model_formula_evaluation/59_model_evaluation"
#  $ : chr "./Rdev/60_communicate_report_export"
#  $ : chr "./Rmd"
#  $ : chr "./Rplot"
#  $ : chr "./tests"
#  $ : chr "./vignettes"
# > f_path.list_subpath.DepthFirstSearch_recursive(getwd()) |> as.list() |> str() #----  
# List of 62
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/-info"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/-tmp"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/data"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/data/ATC_RxNorm_NDC"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/examples"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Bash"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Batch"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/C"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Excel"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/ODBC"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/SAS"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Stata"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/VBA"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/-dev"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/01_sample_size"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/05_count_eligible"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/06_count_exposure"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/07_count_outcome"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/11_metadata"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/12_import_files"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/12_import_sqlite"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/12_import_vocabulary"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_duplicated"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_split_fold"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/15_cleaning_text"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/15_cleaning_time"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/17_categorical_indicators"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/18_dichotomous_logical"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/19_datetime"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/19_numeric_integer"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/array_list"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match/23_group_by_PersonID"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match/25_study_population"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match/27_match"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/30_transform_scale_categorical"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/43_network"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/44_map"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/51_model_formula"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/55_model_weighted"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/56_model_bootstrap"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/57_model_time2event"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/57_model_trajectory"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/59_model_evaluation"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rmd"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rplot"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/tests"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/vignettes"



#% f_path.list_subpath.BreathFirstSearch =====  
f_path.list_subpath.BreathFirstSearch <- function(input_path = ".", max_depth = 3, include_input_path = TRUE, VERBOSE = options()$verbose) {
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
    
    # Print the final vector of subpaths if requested
    if (VERBOSE) {
        cat("Structure of the final list of subpaths:\n")
        print(str(vec_subpath))
    }
        
    return(vec_subpath)
}




f_path.list_subpath.BreathFirstSearch(VERBOSE = T) |> as.list() |> str() #----
f_path.list_subpath.BreathFirstSearch(getwd()) |> as.list() |> str() #----
# > f_path.list_subpath.BreathFirstSearch(VERBOSE = T) |> as.list() |> str() #----  
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
# List of 62
#  $ : chr "."
#  $ : chr "./-info"
#  $ : chr "./-tmp"
#  $ : chr "./data"
#  $ : chr "./examples"
#  $ : chr "./other"
#  $ : chr "./Rdev"
#  $ : chr "./Rmd"
#  $ : chr "./Rplot"
#  $ : chr "./tests"
#  $ : chr "./vignettes"
#  $ : chr "./data/ATC_RxNorm_NDC"
#  $ : chr "./other/Bash"
#  $ : chr "./other/Batch"
#  $ : chr "./other/C"
#  $ : chr "./other/Excel"
#  $ : chr "./other/ODBC"
#  $ : chr "./other/SAS"
#  $ : chr "./other/Stata"
#  $ : chr "./other/VBA"
#  $ : chr "./Rdev/-dev"
#  $ : chr "./Rdev/00_base_program"
#  $ : chr "./Rdev/00_protocol"
#  $ : chr "./Rdev/10_import_clean_datatype"
#  $ : chr "./Rdev/20_tidy_group_by_match"
#  $ : chr "./Rdev/30_transform_scale_categorical"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified"
#  $ : chr "./Rdev/50_model_formula_evaluation"
#  $ : chr "./Rdev/60_communicate_report_export"
#  $ : chr "./Rdev/00_protocol/01_sample_size"
#  $ : chr "./Rdev/00_protocol/05_count_eligible"
#  $ : chr "./Rdev/00_protocol/06_count_exposure"
#  $ : chr "./Rdev/00_protocol/07_count_outcome"
#  $ : chr "./Rdev/10_import_clean_datatype/11_metadata"
#  $ : chr "./Rdev/10_import_clean_datatype/12_import_files"
#  $ : chr "./Rdev/10_import_clean_datatype/12_import_sqlite"
#  $ : chr "./Rdev/10_import_clean_datatype/12_import_vocabulary"
#  $ : chr "./Rdev/10_import_clean_datatype/13_duplicated"
#  $ : chr "./Rdev/10_import_clean_datatype/13_missing_value"
#  $ : chr "./Rdev/10_import_clean_datatype/13_split_fold"
#  $ : chr "./Rdev/10_import_clean_datatype/15_cleaning_text"
#  $ : chr "./Rdev/10_import_clean_datatype/15_cleaning_time"
#  $ : chr "./Rdev/10_import_clean_datatype/16_categorical_factor"
#  $ : chr "./Rdev/10_import_clean_datatype/17_categorical_indicators"
#  $ : chr "./Rdev/10_import_clean_datatype/18_dichotomous_logical"
#  $ : chr "./Rdev/10_import_clean_datatype/19_datetime"
#  $ : chr "./Rdev/10_import_clean_datatype/19_numeric_integer"
#  $ : chr "./Rdev/10_import_clean_datatype/array_list"
#  $ : chr "./Rdev/20_tidy_group_by_match/23_group_by_PersonID"
#  $ : chr "./Rdev/20_tidy_group_by_match/25_study_population"
#  $ : chr "./Rdev/20_tidy_group_by_match/27_match"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/43_network"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/44_map"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures"
#  $ : chr "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified"
#  $ : chr "./Rdev/50_model_formula_evaluation/51_model_formula"
#  $ : chr "./Rdev/50_model_formula_evaluation/53_model_selection"
#  $ : chr "./Rdev/50_model_formula_evaluation/55_model_weighted"
#  $ : chr "./Rdev/50_model_formula_evaluation/56_model_bootstrap"
#  $ : chr "./Rdev/50_model_formula_evaluation/57_model_time2event"
#  $ : chr "./Rdev/50_model_formula_evaluation/57_model_trajectory"
#  $ : chr "./Rdev/50_model_formula_evaluation/59_model_evaluation"
# > f_path.list_subpath.BreathFirstSearch(getwd()) |> as.list() |> str() #----  
# List of 62
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/-info"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/-tmp"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/data"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/examples"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rmd"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rplot"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/tests"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/vignettes"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/data/ATC_RxNorm_NDC"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Bash"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Batch"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/C"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Excel"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/ODBC"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/SAS"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/Stata"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/other/VBA"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/-dev"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/30_transform_scale_categorical"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/01_sample_size"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/05_count_eligible"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/06_count_exposure"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_protocol/07_count_outcome"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/11_metadata"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/12_import_files"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/12_import_sqlite"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/12_import_vocabulary"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_duplicated"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/13_split_fold"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/15_cleaning_text"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/15_cleaning_time"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/17_categorical_indicators"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/18_dichotomous_logical"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/19_datetime"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/19_numeric_integer"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/10_import_clean_datatype/array_list"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match/23_group_by_PersonID"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match/25_study_population"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/20_tidy_group_by_match/27_match"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/43_network"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/44_map"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/51_model_formula"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/55_model_weighted"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/56_model_bootstrap"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/57_model_time2event"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/57_model_trajectory"
#  $ : chr "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/50_model_formula_evaluation/59_model_evaluation"





  
  
# __________|------  
# @@ END-----  

f_path.list_subpath(VERBOSE = T) |> str()
f_path.list_subpath(VERBOSE = T, BreadthFirstSearch = T) |> str()
f_path.list_subpath(getwd()) |> str()
# > f_path.list_subpath(VERBOSE = T) |> str()
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
# > f_path.list_subpath(VERBOSE = T, BreadthFirstSearch = T) |> str()
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

