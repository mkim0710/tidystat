# @@ Now included in env1$env.internal.source.r ----
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$CurrentSource.path.filename.ext), output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }

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
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
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
# .sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
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
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________  ----  
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
# ## @ write_rds( get(.objectname), paste0(.path4write,"/",.objectname,".rds",".xz"), compress = "xz", compression = 9L) ----  
# .path4write = env1$path$.path4write
# # MetaData$DataSetNames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
# cat("    ________________________________________________________________________    \n")
# for (.objectname in names(MetaData$DataSetNames)) {
#     assign(.objectname, structure(get(.objectname), MetaData = MetaData))
#     .path.file = paste0(.path4write,"/",.objectname,".rds",".xz")
#     cat(.objectname, ' |> write_rds(',shQuote(.path.file),', compress = "xz", compression = 9L) |> system.time()', "  \n", sep="")
#     # system.time(write_rds( get(.objectname), .path.file, compress = "xz", compression = 9L ))
#     cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
#     env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, Execute = FALSE)
#     cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
# }
# # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# # .path.filename.xlsx = paste0(.path4write,"/",.objectname,".xlsx")
# # system.time(openxlsx2::write_xlsx(get(.objectname), file=.path.filename.xlsx, as_table=TRUE))
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(.path.filename.xlsx)
# ```


#_________________________________________________________________________________  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 


MetaData <- readRDS("rstudio-prefs/templates/templates-00env1.minimum.MetaData.rds")
.objectname = "MetaData"
get(.objectname) %>% str(max.level = 2)
# > get(.objectname) %>% str(max.level = 2)
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
# Rdev/00_base_program/f_objectname.size.write_rds.git_lfs_track_add_f
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f = function(.object = NULL, .objectname = NULL, .path.file = NULL, .path4write = env1$path$.path4write, .filename.ext4write = NULL, createBackup = FALSE, .backup_to_path="-backup", Execute = FALSE, path.size_files = TRUE, git_lfs_track = "determine based on object size", git_add_f = TRUE, CompressionMethod = NULL) {
    
    if(!is.null(.object)) {
        if(is.character(.object) && length(.object) == 1) {
            # .objectname <- .object
            # .object <- get(.object)
            "is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?" |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
        } 
    }
    
    # # If the object name is provided but not the object itself, retrieve the object
    # if (!is.null(.objectname) && is.null(.object)) {.object <- get(.objectname)}
    
    # If the object is provided but not the object name, create an object name
    if (!is.null(.object) && is.null(.objectname)) {.objectname <- deparse(substitute(.object))}
    
    if(exists("MetaData")) {
        if("DataSetNames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DataSetNames)) {
                assign(.objectname, structure(get(.objectname), MetaData = MetaData))
            }
        } 
    }
    if(is.null(CompressionMethod))      CompressionMethod = ifelse(object.size(.objectname) > 1e6, "xz", "gz")
    if(is.null(.filename.ext4write))    .filename.ext4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz" && object.size(.objectname) > 1e6, ".xz", ""))
    if(is.null(.path4write))            .path4write = env1$path$.path4write
    if(is.null(.path.file))             .path.file = paste0(.path4write,"/",.filename.ext4write)

    if(createBackup) cat('env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = ',deparse(.path.file),', .backup_to_path=',deparse(.backup_to_path),', timeFormat="%y%m%d_%H", overwrite=TRUE)', "  \n", sep="")
    cat(.objectname, ' |> write_rds(',shQuote(.path.file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time()', "  \n", sep="")
    if(path.size_files) cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    
    if(Execute) {
        if(createBackup) env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = .path.file, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE) 
        system.time(write_rds( get(.objectname), .path.file, compress = CompressionMethod, compression = 9L ))
        if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
    }
    
    if(git_add_f) {
        if (git_lfs_track == "determine based on object size") {
            if(object.size(.objectname) > 1e7) {
                env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, Execute = Execute) 
            } else {
                env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path.file) ), Execute = Execute)
            }
        } else if (git_lfs_track == TRUE) {
                env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, Execute = Execute) 
        }
    }
    
    invisible()
}



MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(createBackup = TRUE)
MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# env1$f$f_path.size_files(.path4read = '/home/rstudio/github_tidystat', regex4filename = 'MetaData')  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(createBackup = TRUE)
# env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = "/home/rstudio/github_tidystat/MetaData.rds", .backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)  
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# env1$f$f_path.size_files(.path4read = '/home/rstudio/github_tidystat', regex4filename = 'MetaData')  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  

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

