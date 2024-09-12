# f_vec_labelled_sex.as_character.dev.r
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# #@ The templates at source_base_local (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# # \% Edit the templates at source_base_local (default.R, templates-00env1.minimum.Rmd) ~~~~~~~~~~~~  
# "default.R" %>% paste0(env1$path$source_base_local,"/rstudio-prefs/templates/",.) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
# "templates-00env1.minimum.Rmd" %>% paste0(env1$path$source_base_local,"/rstudio-prefs/templates/",.) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))     
# # \% Update the templates of the current working directory (if exists)  ~~~~~~~~~~~~  
# if(file.exists("default.R")) download.file("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "default.R")
# # if(file.exists("templates-00env1.minimum.Rmd")) download.file("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "templates-00env1.minimum.Rmd")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++   
# if (.Platform$OS.type == "windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
# if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
# # # \% Edit the templates of RStudio (default.R, notebook.Rmd) ~~~~~~~~~~~~   
# # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
# # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
# # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~  
# download.file("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = file.path(.path4APPDATA_RStudio, "templates", "default.R"))
# download.file("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd"))
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) dev -----  

## \% survival::lung |> 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) function -----  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
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
    # .subsublistname = "time2event"; .sublistname = "ModelList"; .parentname = "CODEBOOK"; if(!.subsublistname %in% names(.GlobalEnv[[.parentname]][[.sublistname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
    #
    # library(survival)
    # CODEBOOK$ModelList$time2event = NULL
    # CODEBOOK$ModelList$time2event$formula = Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    #
    # CODEBOOK$ModelList$time2event = CODEBOOK$ModelList$time2event %>% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # CODEBOOK$ModelList$time2event %>% str(max.level = 1, give.attr = F)
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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
cat("# ",'.sourcename_root = "',.sourcename_root,'"', "  \n",
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source("',env1$path$source_base,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://haven.tidyverse.org/reference/labelled.html
# https://chatgpt.com/c/349f6c28-2835-445f-aeb2-bc291bfadc41
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% library(haven) ----
## \% haven::labelled() ----
s1 <- haven::labelled(c("M", "M", "F"), c(Male = "M", Female = "F"))
s1 %>% str
s1 %>% dput
#' > s1 %>% str
#'  chr+lbl [1:3] M, M, F
#'  @ labels: Named chr [1:2] "M" "F"
#'   ..- attr(*, "names")= chr [1:2] "Male" "Female"
#' > s1 %>% dput
#' structure(c("M", "M", "F"), labels = c(Male = "M", Female = "F"), class = c("haven_labelled", "vctrs_vctr", "character"))

s2 <- haven::labelled(c(1, 1, 2), c(Male = 1, Female = 2))
s2 %>% str
s2 %>% dput
#' > s2 %>% str
#'  dbl+lbl [1:3] 1, 1, 2
#'  @ labels: Named num [1:2] 1 2
#'   ..- attr(*, "names")= chr [1:2] "Male" "Female"
#' > s2 %>% dput
#' structure(c(1, 1, 2), labels = c(Male = 1, Female = 2), class = c("haven_labelled", "vctrs_vctr", "double"))


s3 <- haven::labelled(
  c(1, 1, 2),
  c(Male = 1, Female = 2),
  label = "Assigned sex at birth"
)
s3 %>% str
s3 %>% dput
#' > s3 %>% str
#'  chr+lbl [1:5] M  , M  , F  , X  , N/A
#'  @ labels: Named chr [1:4] "M" "F" "X" "N/A"
#'   ..- attr(*, "names")= chr [1:4] "Male" "Female" "Refused" "Not applicable"
#' > s3 %>% dput
#' structure(c("M", "M", "F", "X", "N/A"), labels = c(Male = "M", Female = "F", Refused = "X", `Not applicable` = "N/A"), class = c("haven_labelled", "vctrs_vctr", "character"))


### \% haven::labelled() |> as_factor() ----
# Unfortunately it's not possible to make as.factor work for labelled objects
# so instead use as_factor. This works for all types of labelled vectors.
as_factor(s1)
#> [1] Male   Male   Female
#> Levels: Female Male
as_factor(s1, levels = "values")
#> [1] M M F
#> Levels: M F
as_factor(s2)
#> [1] Male   Male   Female
#> Levels: Male Female


### \% multiple types of missing values ??? ----
# Other statistical software supports multiple types of missing values
s3 <- haven::labelled(
  c("M", "M", "F", "X", "N/A"),
  c(Male = "M", Female = "F", Refused = "X", "Not applicable" = "N/A")
)
s3
#> <labelled<character>[5]>
#> [1] M   M   F   X   N/A
#> 
#> Labels:
#>  value          label
#>      M           Male
#>      F         Female
#>      X        Refused
#>    N/A Not applicable
as_factor(s3)
#> [1] Male           Male           Female         Refused       
#> [5] Not applicable
#> Levels: Female Male Not applicable Refused


## \% haven::zap_labels() ----
# Often when you have a partially labelled numeric vector, labelled values
# are special types of missing. Use zap_labels to replace labels with missing
# values
x <- haven::labelled(c(1, 2, 1, 2, 10, 9), c(Unknown = 9, Refused = 10))
haven::zap_labels(x)
#> [1]  1  2  1  2 10  9



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://cran.r-project.org/web/packages/labelled/vignettes/intro_labelled.html
# https://larmarange.github.io/labelled/reference/recode.haven_labelled.html
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

# \% library(labelled) ----
# library(labelled)

## \% labelled::var_label() ----
labelled::var_label(iris$Sepal.Length) <- "Length of sepal"

labelled::var_label(iris) <- list(
  Petal.Length = "Length of petal",
  Petal.Width = "Width of Petal"
)
labelled::var_label(iris$Petal.Width)
## [1] "Width of Petal"
labelled::var_label(iris)
## $Sepal.Length
## [1] "Length of sepal"
## 
## $Sepal.Width
## NULL
## 
## $Petal.Length
## [1] "Length of petal"
## 
## $Petal.Width
## [1] "Width of Petal"
## 
## $Species
## NULL
labelled::var_label(iris$Sepal.Length) <- NULL

## \% labelled::look_for() ----
labelled::look_for(iris)
##  pos variable     label           col_type missing values    
##  1   Sepal.Length —               dbl      0                 
##  2   Sepal.Width  —               dbl      0                 
##  3   Petal.Length Length of petal dbl      0                 
##  4   Petal.Width  Width of Petal  dbl      0                 
##  5   Species      —               fct      0       setosa    
##                                                    versicolor
##                                                    virginica
labelled::look_for(iris, "pet")
##  pos variable     label           col_type missing values
##  3   Petal.Length Length of petal dbl      0             
##  4   Petal.Width  Width of Petal  dbl      0
labelled::look_for(iris, details = FALSE)
##  pos variable     label          
##  1   Sepal.Length —              
##  2   Sepal.Width  —              
##  3   Petal.Length Length of petal
##  4   Petal.Width  Width of Petal 
##  5   Species      —



v <- labelled::labelled(
  c(1, 2, 2, 2, 3, 9, 1, 3, 2, NA),
  c(yes = 1, no = 3, "don't know" = 8, refused = 9)
)
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value      label
##      1        yes
##      3         no
##      8 don't know
##      9    refused
labelled::val_labels(v)
##        yes         no don't know    refused 
##          1          3          8          9
labelled::val_label(v, 8)
## [1] "don't know"
labelled::val_labels(v) <- c(yes = 1, nno = 3, bug = 5)
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes
##      3   nno
##      5   bug
labelled::val_label(v, 3) <- "no"
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes
##      3    no
##      5   bug


## \% labelled::val_label() ----
#@ With val_label(), you can also add or remove specific value labels.
labelled::val_label(v, 2) <- "maybe"
labelled::val_label(v, 5) <- NULL
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes
##      3    no
##      2 maybe

#@ To remove all value labels, use val_labels() and NULL. The haven_labelled class will also be removed.

labelled::val_labels(v) <- NULL
v
##  [1]  1  2  2  2  3  9  1  3  2 NA

#@ Adding a value label to a non labelled vector will apply haven_labelled class to it.
labelled::val_label(v, 1) <- "yes"
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes

#@ Note that applying val_labels() to a factor will generate an error!
f <- factor(1:3)
f
## [1] 1 2 3
## Levels: 1 2 3
# labelled::val_labels(f) <- c(yes = 1, no = 3)
# ## Error in `val_labels<-.factor`(`*tmp*`, value = c(yes = 1, no = 3)): Value labels cannot be applied to factors.


#@ You could also apply val_labels() to several columns of a data frame.
df <- data.frame(v1 = 1:3, v2 = c(2, 3, 1), v3 = 3:1)

labelled::val_label(df, 1) <- "yes"
labelled::val_label(df[, c("v1", "v3")], 2) <- "maybe"
labelled::val_label(df[, c("v2", "v3")], 3) <- "no"
labelled::val_labels(df)
## $v1
##   yes maybe 
##     1     2 
## 
## $v2
## yes  no 
##   1   3 
## 
## $v3
##   yes maybe    no 
##     1     2     3
labelled::val_labels(df[, c("v1", "v3")]) <- c(YES = 1, MAYBE = 2, NO = 3)
labelled::val_labels(df)
## $v1
##   YES MAYBE    NO 
##     1     2     3 
## 
## $v2
## yes  no 
##   1   3 
## 
## $v3
##   YES MAYBE    NO 
##     1     2     3
labelled::val_labels(df) <- NULL
labelled::val_labels(df)
## $v1
## NULL
## 
## $v2
## NULL
## 
## $v3
## NULL
labelled::val_labels(df) <- list(v1 = c(yes = 1, no = 3), v2 = c(a = 1, b = 2, c = 3))
labelled::val_labels(df)
## $v1
## yes  no 
##   1   3 
## 
## $v2
## a b c 
## 1 2 3 
## 
## $v3
## NULL




## \% labelled:::recode.haven_labelled() ----
# combine value labels
x <- haven::labelled(
  1:4,
  c(
    "strongly agree" = 1,
    "agree" = 2,
    "disagree" = 3,
    "strongly disagree" = 4
  )
)
# library(labelled)
# dplyr::recode(
#   x,
#   `1` = 1L,
#   `2` = 1L,
#   `3` = 2L,
#   `4` = 2L,
#   .combine_value_labels = TRUE
# )
labelled:::recode.haven_labelled(
  x,
  `1` = 1L,
  `2` = 1L,
  `3` = 2L,
  `4` = 2L,
  .combine_value_labels = TRUE
)
# > dplyr::recode(
# +   x,
# +   `1` = 1L,
# +   `2` = 1L,
# +   `3` = 2L,
# +   `4` = 2L,
# +   .combine_value_labels = TRUE
# + )
# Error in UseMethod("recode") : 
#   no applicable method for 'recode' applied to an object of class "c('haven_labelled', 'vctrs_vctr', 'integer')"
#> <labelled<integer>[4]>
#> [1] 1 1 2 2
#> 
#> Labels:
#>  value                        label
#>      1       strongly agree / agree
#>      2 disagree / strongly disagree
labelled:::recode.haven_labelled(
  x,
  `2` = 1L,
  `4` = 3L,
  .combine_value_labels = TRUE
)
#> <labelled<integer>[4]>
#> [1] 1 1 3 3
#> 
#> Labels:
#>  value                        label
#>      1       strongly agree / agree
#>      3 disagree / strongly disagree
labelled:::recode.haven_labelled(
  x,
  `2` = 1L,
  `4` = 3L,
  .combine_value_labels = TRUE,
  .sep = " or "
)
#> <labelled<integer>[4]>
#> [1] 1 1 3 3
#> 
#> Labels:
#>  value                         label
#>      1       strongly agree or agree
#>      3 disagree or strongly disagree
labelled:::recode.haven_labelled(
  x,
  `2` = 1L,
  .default = 2L,
  .combine_value_labels = TRUE
)
#> <labelled<integer>[4]>
#> [1] 2 1 2 2
#> 
#> Labels:
#>  value                                         label
#>      1                                         agree
#>      2 strongly agree / disagree / strongly disagree

# example when combining some values without a label
y <- haven::labelled(1:4, c("strongly agree" = 1))
labelled:::recode.haven_labelled(y, `2` = 1L, `4` = 3L, .combine_value_labels = TRUE)
#> <labelled<integer>[4]>
#> [1] 1 1 3 3
#> 
#> Labels:
#>  value          label
#>      1 strongly agree

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) data -----

## \$ fruit ====
# > fruit %>% str
#  chr [1:80] "apple" "apricot" "avocado" "banana" "bell pepper" "bilberry" "blackberry" "blackcurrant" "blood orange" "blueberry" ...
# > fruit %>% as.factor %>% str
#  Factor w/ 80 levels "apple","apricot",..: 1 2 3 4 5 6 7 8 9 10 ...
# > fruit %>% as.factor %>% is.factor
# [1] TRUE
# > fruit %>% as.factor %>% is.numeric
# [1] FALSE


## \$ vec_labelled_sex ====
vec_labelled_sex = structure(c(1, 2, 2, 1, 2), label = "성별", labels = c(남자 = 1, 여자 = 2), class = c("haven_labelled", "vctrs_vctr", "double"))

vec_labelled_sex %>% str
#' > vec_labelled_sex %>% str
#'  dbl+lbl [1:5] 1, 2, 2, 1, 2
#'  @ label : chr "성별"
#'  @ labels: Named num [1:2] 1 2
#'   ..- attr(*, "names")= chr [1:2] "남자" "여자"

vec_labelled_sex %>% is.numeric
vec_labelled_sex %>% is.factor
# > vec_labelled_sex %>% is.numeric
# [1] TRUE
# > vec_labelled_sex %>% is.factor
# [1] FALSE



### \% haven::labelled() |> as.factor() ----
# vec_labelled_sex %>% as.numeric
# vec_labelled_sex %>% as.character
# vec_labelled_sex %>% as.factor
# # > vec_labelled_sex %>% as.numeric
# # Error in `as.numeric()`:
# # ! Can't convert `x` <haven_labelled> to <double>.
# # Run `rlang::last_trace()` to see where the error occurred.
# # > vec_labelled_sex %>% as.character
# # Error in `as.character()`:
# # ! Can't convert `x` <haven_labelled> to <character>.
# # Run `rlang::last_trace()` to see where the error occurred.
# # > vec_labelled_sex %>% as.factor
# # Error in `as.character()`:
# # ! Can't convert `x` <haven_labelled> to <character>.
# # Run `rlang::last_trace()` to see where the error occurred.


### \% haven::labelled() |> as_factor() ----
# vec_labelled_sex %>% as_numeric
# vec_labelled_sex %>% as_character
vec_labelled_sex %>% as_factor
# > vec_labelled_sex %>% as_numeric
# Error in as_numeric(.) : could not find function "as_numeric"
# > vec_labelled_sex %>% as_character
# Error in as_character(.) : could not find function "as_character"
# > vec_labelled_sex %>% as_factor
# [1] 남자 여자 여자 남자 여자
# attr(,"label")
# [1] 성별
# Levels: 남자 여자


vec_labelled_sex %>% haven::zap_label() %>% str
vec_labelled_sex %>% haven::zap_labels() %>% str
#' > vec_labelled_sex %>% haven::zap_label() %>% str
#'  dbl+lbl [1:5] 1, 2, 2, 1, 2
#'  @ labels: Named num [1:2] 1 2
#'   ..- attr(*, "names")= chr [1:2] "남자" "여자"
#' > vec_labelled_sex %>% haven::zap_labels() %>% str
#'  num [1:5] 1 2 2 1 2
#'  - attr(*, "label")= chr "성별"



## \$ vec_labelled_age ====
vec_labelled_age = structure(c(22, 43, 42, 41, 41), label = "나이")

vec_labelled_age %>% str
# > vec_labelled_age %>% str
#  num [1:5] 22 43 42 41 41
#  - attr(*, "label")= chr "나이"


### \% haven::labelled() |> as.factor() ----
vec_labelled_age %>% as.numeric
vec_labelled_age %>% as.character
vec_labelled_age %>% as.factor
# > vec_labelled_age %>% as.numeric
# [1] 22 43 42 41 41
# > vec_labelled_age %>% as.character
# [1] "22" "43" "42" "41" "41"
# > vec_labelled_age %>% as.factor
# [1] 22 43 42 41 41
# Levels: 22 41 42 43


### \% haven::labelled() |> as_factor() ----
# vec_labelled_age %>% as_numeric
# vec_labelled_age %>% as_character
vec_labelled_age %>% as_factor
# > vec_labelled_age %>% as_numeric
# Error in as_numeric(.) : could not find function "as_numeric"
# > vec_labelled_age %>% as_character
# Error in as_character(.) : could not find function "as_character"
# > vec_labelled_age %>% as_factor
# [1] 22 43 42 41 41
# Levels: 22 41 42 43






#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## @ write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds"))) ----  
CODEBOOK$DataSetNames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
.objectname = CODEBOOK$DataSetNames %>% {names(.)[length(.)]}; .objectname %>% cat(deparse(substitute(.)), ' == "',.,'"  \n', sep="")
cat(.objectname, ' |> write_rds("',paste0(.path4write,"/",.objectname,".rds"),'", compress = "none") |> system.time()', "  \n", sep="")
# system.time(write_rds( get(.objectname), paste0(.objectname,".rds") ))
# system.time(write_rds( get(paste0(.objectname,".NA",".rmAllNA",".fct")), paste0(.objectname,".NA",".rmAllNA",".fct",".rds") ))
# # system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds"))))
# # # system.time(saveRDS( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress = "gzip" ))
# # system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress = "gz", compression = 9 ))
# # system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname, ".rds", ".xz")), compress = "xz", compression = 9 ))
# # system.time(openxlsx::write.xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
# # if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(.objectname, ".xlsx"))
# env1$f$f_path.size_files(.path4read = .path4write, regex4filename  = .objectname)  
# paste0( "git add -f ",shQuote(paste0(.path4write,"/",.objectname,".rds", ".xz")) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")  
# # paste0( "git add -f ",shQuote(paste0(.path4write,"/",.objectname,".rds", ".xz")) ) |> system(intern=TRUE)  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \%\% update template (default.R) -----  
env1$path$RTemplate.filename.ext = "default.R"
env1$path$MyTemplate.filename.ext = "default.R"
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
if (.Platform$OS.type == "windows") {
    if(env1$path$MyTemplate.filename.ext == basename(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})) {
        if (.Platform$OS.type == "windows") {.path4APPDATA_RStudio = normalizePath(file.path(Sys.getenv("APPDATA"), "RStudio"),winslash="/") |> str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = normalizePath("~/.config/rstudio")} 
        .destination_path = file.path(.path4APPDATA_RStudio, "templates"); if(!dir.exists(.destination_path)) dir.create(.destination_path, recursive=TRUE) ; cat('browseURL("',.destination_path,'")',"  \n", sep="") 
        .destination_path.filename.ext = file.path(.destination_path, env1$path$RTemplate.filename.ext)
        .backup_to_path = file.path(env1$path$path0, "-backup") ; env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = .destination_path.filename.ext, .backup_to_path=.backup_to_path) 
        if(.Platform$OS.type == "windows") {browseURL(.backup_to_path)}
        
        if(file.copy(from=env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}, to=.destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path.filename.ext)) else warning(paste0("Update failed: ", .destination_path.filename.ext))
        # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(.destination_path.filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path.filename.ext),wait=FALSE)}  
        
        for ( .destination_path.filename.ext in c(
            file.path(env1$path$source_base_local, "rstudio-prefs", "templates", env1$path$MyTemplate.filename.ext)
            , file.path(env1$path$path0, "Rproject_Rmd", env1$path$MyTemplate.filename.ext)
        )) {if(dir.exists(dirname(.destination_path.filename.ext)) && env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}|>normalizePath(winslash="/") != .destination_path.filename.ext) {
            if(file.copy(from=env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}, to=.destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path.filename.ext)) else warning(paste0("Update failed: ", .destination_path.filename.ext))
            # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(.destination_path.filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path.filename.ext),wait=FALSE)}  
        }}
        if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    }
}

