# default.R
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$CurrentSource.path.filename.ext), output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }

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
cat("> .tmp |> str(max.level = 1, give.attr = FALSE)", "  \n", sep="") 
.tmp |> str(max.level = 1, give.attr = FALSE)
cat("> env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)", "  \n", sep="") 
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
## env0 = env1 ----
env0 = env1
## \% survival::lung |> 

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_formula.lhs_rhs_vars =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/f_formula.lhs_rhs_vars.dev.Rmd
.tmp$objectname = "f_formula.lhs_rhs_vars"
.tmp$object = function(formula, include_input_in_output = TRUE) {
    return.list = list()
    if(include_input_in_output) return.list$formula = formula
    return.list$terms = formula |> terms()
    return.list$all.vars = formula |> all.vars()
    return.list$lhs = formula[[2]]
    return.list$lhs.vars = formula[[2]] |> all.vars()
    return.list$rhs = formula[[3]]
    return.list$rhs.vars = formula[[3]] |> all.vars()
    return(return.list)

    # ## \% \%>\% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # .subsublistname = "time2event"; .sublistname = "ModelList"; .parentname = "MetaData"; if(!.subsublistname %in% names(.GlobalEnv[[.parentname]][[.sublistname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
    #
    # library(survival)
    # MetaData$ModelList$time2event = NULL
    # MetaData$ModelList$time2event$formula = Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    #
    # MetaData$ModelList$time2event = MetaData$ModelList$time2event %>% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # MetaData$ModelList$time2event %>% str(max.level = 1, give.attr = F)
    # # List of 7
    # #  $ formula :Class 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ terms   :Classes 'terms', 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ all.vars: chr [1:6] "time2event" "event" "Group" "StudyPopulation" ...
    # #  $ lhs     : language Surv(time = time2event, event = event)
    # #  $ lhs.vars: chr [1:2] "time2event" "event"
    # #  $ rhs     : language Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ rhs.vars: chr [1:4] "Group" "StudyPopulation" "A00_SEX" "A01_AGE"
}
### @ f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ----
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
#### env1$path$.subpath.filename.source.r ----  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.subpath = env1$path$CurrentSource.path.filename.ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.sourcename_root = env1$path$CurrentSource.path.filename.ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename_root" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.subpath = .subpath
if(!exists(".sourcename_root") && exists(".sourcename")) .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
.sourcename = .sourcename_root |> paste0(".source.r")
env1$path$.sourcename_root = .sourcename_root
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".source.r")
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# env1 = env0
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ MetaData ----  
# .GlobalEnv$MetaData = list() ====  
if(!exists("MetaData", envir=.GlobalEnv)) { assign("MetaData", list(), envir=.GlobalEnv) }  
.parentname = "MetaData"
for (.sublistname in c("tblVarName", "DataSetNames", "VarNames", "VarNames.select", "VarNames.filter", "VarNames.recode", "ModelList")) {
    if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
}
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# #@@ START) data -----
# ## \$ DataSetName |> paste0(".rds") %>% paste0(.path4read.subpath,ifelse(.path4read.subpath=="","","/"),.) |> read_rds() %>% assign(DataSetName, value = ., envir = .GlobalEnv) ====
# .path4read.subpath = r"(data)"|>str_replace_all("\\\\","/")
# DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # # .path4read.subpath.filename.ext = DataSetName |> paste0(".rds") %>% paste0(.path4read.subpath,ifelse(.path4read.subpath=="","","/"),.)
# # # .path.filename.ext = ifelse( file.exists(.path4read.subpath.filename.ext), .path4read.subpath.filename.ext, paste0(env1$path$source_base_github,"/data/",DataSetName,".rds") )
# # # cat(".path.filename.ext = ", .path.filename.ext, "  \n", sep = "")
# # DataSetName |> paste0(".rds") %>% paste0(.path4read.subpath,ifelse(.path4read.subpath=="","","/"),.) |> read_rds() %>% assign(DataSetName, value = ., envir = .GlobalEnv)
# if(!exists("DataSetName0")) {DataSetName0 = DataSetName; cat('  Setting DataSetName0 = "',DataSetName0,'"  \n', sep="")} DataSetName0 = DataSetName; cat('  Setting DataSetName0 = "',DataSetName0,'"  \n', sep="")
# MetaData$DataSetNames[[DataSetName]] = env1$f$f_DataSetName.Search.read.checkEntity(DataSetName=DataSetName,ext="rds", .path4read=.path4read|>paste0(ifelse(.path4read.subpath=="","","/"),.path4read.subpath), return.output = TRUE)



###### \% |> () ----  



###### \% |> () ----  



###### \% |> () ----  








#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds"))) ----  
.path4write = env1$path$.path4write
# MetaData$DataSetNames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
for (.objectname in names(MetaData$DataSetNames)) {
    assign(.objectname, structure(get(.objectname), MetaData = MetaData))
    .path.file = paste0(.path4write,"/",.objectname,".rds")
    cat(.objectname, ' |> write_rds("',.path.file,'", compress = "xz", compression = 9) |> system.time()', "  \n", sep="")
    paste0( "git lfs track ",shQuote(.path.file) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep=""); paste0( "git add -f ",shQuote(.path.file) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
}
# system.time(write_rds( get(.objectname), paste0(.objectname,".rds") ))
# system.time(write_rds( get(paste0(.objectname,".NA",".rmAllNA",".fct")), paste0(.objectname,".NA",".rmAllNA",".fct",".rds") ))
# # system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds"))))
# # # system.time(saveRDS( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress = "gzip" ))
# # system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress = "gz", compression = 9 ))
# # system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname, ".rds", ".xz")), compress = "xz", compression = 9 ))
# # system.time(openxlsx2::write_xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), as_table=TRUE))
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(.objectname, ".xlsx"))
# env1$f$f_path.size_files(.path4read = .path4write, regex4filename  = .objectname)  
# paste0( "git lfs track ",shQuote(paste0(.path4write,"/",.objectname,".rds", ".xz")) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")  
# # paste0( "git add -f ",shQuote(paste0(.path4write,"/",.objectname,".rds", ".xz")) ) |> system(intern=TRUE)  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

