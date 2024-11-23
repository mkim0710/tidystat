# @@ Now included in env1$env.internal.source.r ----
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_filename.ext), output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
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
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
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
### env1\$path\$LastSourceEditorContext.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .filename.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.subpath_filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.filename.source.r))
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_base_program/001_base_file
# # Rdev/00_base_program/002_base_encoding_RegEx
# # Rdev/00_base_program/004_base_environment
# # Rdev/00_base_program/005_base_object
# # Rdev/00_base_program/007_base_expression
# # Rdev/00_base_program/009_base_computation
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/10_import_clean_datatype
# # Rdev/10_import_clean_datatype/11_literature
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
# # Rdev/10_import_clean_datatype/16_categorical_labelled
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
# # Rdev/40_visualize_explore_bivariate_stratified/49_time
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/52_model_estimation
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
# # Rdev/Rmd
# # Rdev/examples
# # Rdev/others
# # Rdev/others/Batch
# # Rdev/others/VBA
# # data
# # git
# # git/hooks
# # git/hooks/sample
# # rstudio-prefs
# # rstudio-prefs/Rocker
# # rstudio-prefs/VScode-R
# # rstudio-prefs/fonts
# # rstudio-prefs/templates
# # rstudio-prefs/themes
# # rstudio-prefs/themes/GitHub 
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  

# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a ----
# https://gemini.google.com/app/6d9de55c5c7085c6 ----

## env0 = env1 ----
env0 = env1

#@ ```{r writeRDS-EvalNoEchoNoMsgNoResults, eval=TRUE, echo=FALSE, warning=TRUE, message=NA, results="hide"} ----
# ```{r writeRDS-EvalNoEchoNoMsgNoResults, eval=TRUE, echo=FALSE, warning=TRUE, message=NA, results="hide"}
# ##________________________________________________________________________________  
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## @ write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
# .path4write = env1$path$.path4write
# # MetaData$DataSetNames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
# cat("    ________________________________________________________________________    \n")
# for (.objectname in names(MetaData$DataSetNames)) {
#     assign(.objectname, structure(get(.objectname), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
#     .path_file = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz")
#     cat(.objectname, ' |> write_rds(',shQuote(.path_file),', compress = "xz", compression = 9L) |> system.time()', "  \n", sep="")
#     # system.time(write_rds( get(.objectname), .path_file, compress = "xz", compression = 9L ))
#     cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
#     env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, Execute = FALSE)
#     cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
# }
# # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# # .path_filename.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")
# # openxlsx2::write_xlsx(get(.objectname), file = .path_filename.xlsx, as_table = TRUE) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") 
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(.path_filename.xlsx)
# ```


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 


MetaData <- readRDS("rstudio-prefs/templates/templates-00env1.minimum.MetaData.rds")
.objectname = "MetaData"
get(.objectname) |> str(max.level = 2, give.attr = TRUE)
# > get(.objectname) |> str(max.level = 2, give.attr = TRUE)
# List of 5
#  $ tblVarName     : list()
#  $ DataSetNames   :List of 2
#   ..$ analyticDF_time2event.NA        :List of 1
#   ..$ analyticDF_time2event.NA.rmAllNA:List of 1
#  $ VarNames       :List of 11
#   ..$ Event       :List of 4
#   ..$ Mediator    :List of 2
#   ..$ Exposure    :List of 4
#   ..$ PMHx        : list()
#   ..$ Tx          : list()
#   ..$ FHx         : list()
#   ..$ Exam        : list()
#   ..$ Social      :List of 6
#   ..$ Behavioral  : list()
#   ..$ Unclassified: list()
#   ..$ Calculated  : list()
#  $ VarNames.select: list()
#  $ ModelList      : list()



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_terminal/f_objectname.size.write_rds.git_lfs_track_add_f
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 


MetaData %>% env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# > MetaData %>% env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# Warning in env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.) :
#   .objectname == "."   #@ sys.nframe() == 2  
# 
# -> Trying: ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, .object)) %>% names
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'Rdev/10_import_clean_datatype/16_categorical_labelled', regex4filename = 'MetaData')  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  

MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(createBackup = TRUE)
MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'Rdev/10_import_clean_datatype/16_categorical_labelled', regex4filename = 'MetaData')  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(createBackup = TRUE)
# 	env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = "Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds", .backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)  
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'Rdev/10_import_clean_datatype/16_categorical_labelled', regex4filename = 'MetaData')  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  

.objectname |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# > .objectname |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# stop: Error: is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?
# 

env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = .objectname, path.size_files = FALSE)
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "MetaData", path.size_files = FALSE)
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = .objectname, path.size_files = FALSE)
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "MetaData", path.size_files = FALSE)
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  







##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ Rdev/00_base_program/f_objectsize_unit.create.dev.r ----
## f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2) ----
f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2) { 
    .object = numeric(objectsize_in_bytes/8) 
}
2^20
f_objectsize_in_bytes.create(2^20) |> object.size()
# > 2^20
# [1] 1048576
# > f_objectsize_in_bytes.create(2^20) |> object.size()
# 1048624 bytes


# f_objectsize_in_bytes.create(2^20) |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# # > f_objectsize_in_bytes.create(2^20) |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# # Error in get(.objectname) : 
# #   object 'f_objectsize_in_bytes.create(2^20)' not found
# # Called from: get(.objectname)



tmp.object = f_objectsize_in_bytes.create(2^19); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
tmp.object = f_objectsize_in_bytes.create(2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
tmp.object = f_objectsize_in_bytes.create(10 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
tmp.object = f_objectsize_in_bytes.create(100 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# > tmp.object = f_objectsize_in_bytes.create(2^19); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rds'" |> system(intern=TRUE)  
# > tmp.object = f_objectsize_in_bytes.create(2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rdsNA', compress = 'xz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rdsNA'" |> system(intern=TRUE)  
# > tmp.object = f_objectsize_in_bytes.create(10 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rdsNA', compress = 'xz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git lfs track '/home/rstudio/github_tidystat/tmp.object.rdsNA'" |> system(intern=TRUE)  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rdsNA'" |> system(intern=TRUE)  
# > tmp.object = f_objectsize_in_bytes.create(100 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# Warning: object.size(get(.objectname)) >= 1e8 --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rds', compress = '', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git lfs track '/home/rstudio/github_tidystat/tmp.object.rds'" |> system(intern=TRUE)  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rds'" |> system(intern=TRUE)  







