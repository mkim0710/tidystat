# Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.r  
# Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.Rmd  
# Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r  
# # source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r")  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.dev.Rmd"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/00_protocol/05_count_eligible
# # Rdev/00_protocol/06_count_exposure
# # Rdev/00_protocol/07_count_outcome
# # Rdev/10_import_clean_datatype
# # Rdev/10_import_clean_datatype/11_metadata
# # Rdev/10_import_clean_datatype/12_import_files
# # Rdev/10_import_clean_datatype/12_import_sqlite
# # Rdev/10_import_clean_datatype/12_import_vocabulary
# # Rdev/10_import_clean_datatype/13_duplicated
# # Rdev/10_import_clean_datatype/13_missing_value
# # Rdev/10_import_clean_datatype/13_split_fold
# # Rdev/10_import_clean_datatype/15_cleaning_text
# # Rdev/10_import_clean_datatype/15_cleaning_time
# # Rdev/10_import_clean_datatype/16_categorical_factor
# # Rdev/10_import_clean_datatype/17_categorical_indicators
# # Rdev/10_import_clean_datatype/18_dichotomous_logical
# # Rdev/10_import_clean_datatype/19_datetime
# # Rdev/10_import_clean_datatype/19_numeric_integer
# # Rdev/10_import_clean_datatype/array_list
# # Rdev/20_tidy_group_by_match
# # Rdev/20_tidy_group_by_match/23_group_by_PersonID
# # Rdev/20_tidy_group_by_match/25_study_population
# # Rdev/20_tidy_group_by_match/27_match
# # Rdev/30_transform_scale_categorical
# # Rdev/40_visualize_explore_bivariate_stratified
# # Rdev/40_visualize_explore_bivariate_stratified/43_network
# # Rdev/40_visualize_explore_bivariate_stratified/44_map
# # Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# # Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_vec_ValueOptions.factor =  ----  
# https://github.com/mkim0710/51_model_formula/blob/main/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r  
.tmp$objectname = "f_vec_ValueOptions.factor"
.tmp$object = function(vec, ValueOptions, sep4levels = ",\\s*", sep4name_value = "=", print.intermediate = FALSE) {
  if (is.na(ValueOptions) || ValueOptions == "") {
    return(vec)
  }

  if (print.intermediate) {
    cat("Processing variable with ValueOptions:", ValueOptions, "\n")
  }
  
  options_split <- str_split(ValueOptions, sep4levels)[[1]]
  
  if (print.intermediate) {
    cat("Split ValueOptions:", paste(options_split, collapse = ", "), "\n")
  }
  
  levels <- map_dbl(options_split, ~ as.numeric(str_split(.x, sep4name_value)[[1]][1]))
  labels <- map_chr(options_split, ~ str_split(.x, sep4name_value)[[1]][2])
  
  if (print.intermediate) {
    cat("Levels:", paste(levels, collapse = ", "), "\n")
    cat("Labels:", paste(labels, collapse = ", "), "\n")
  }

  vec.factor <- factor(vec, levels = levels, labels = labels)

  return(vec.factor)
}
### @ f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ----
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_DataSet_CodeBook.walk2factor =  ----  
# https://github.com/mkim0710/51_model_formula/blob/main/Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r  
.tmp$objectname = "f_DataSet_CodeBook.walk2factor"
.tmp$object = function(DataSet, df_VarName_ValueOptions, sep4levels = ",\\s*", sep4name_value = "=", print.intermediate = FALSE) {
  # Use walk2 to iterate over VarName.suffix and ValueOptions in parallel and update DataSet in place
  walk2(df_VarName_ValueOptions$VarName.suffix, df_VarName_ValueOptions$ValueOptions, 
    function(var_name, value_options) {
      if (var_name %in% colnames(DataSet)) {
        DataSet[[var_name]] <<- f_vec_ValueOptions.factor(DataSet[[var_name]], 
                                                          value_options, 
                                                          sep4levels, 
                                                          sep4name_value, 
                                                          print.intermediate)
      }
    })
  
  # Return the updated DataSet as a data frame
  return(DataSet)
}

### @ f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ----
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
#### Rdev/60_communicate_report_export/f_DataSet_CodeBook.walk2factor.source.r  ----  
.subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_DataSet_CodeBook.walk2factor.source.r"
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% .GlobalEnv$env1$source) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,.subpath.filename.source.r) ); .GlobalEnv$env1$source[[.sourcename]] = TRUE}




#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ END -----  

