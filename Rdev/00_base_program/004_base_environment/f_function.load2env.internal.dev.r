# default.R
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_FileNameExt), output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# env1$f$MH_shortcuts()
# env1$f$openWorkingFilesList()
# env1$f$showCodeText2restartSession.pending()
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# env1$f$showPathSymbols()
# env1$f$showProjectPathFiles()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .FileName.source.r = "f_path.df_dirs_recursive.df_files" |> paste0("-source.R"); .RelativeSubPath=r"(R)"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
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
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
#### env1$path$.RelativeSubPath_FileName.source.r ----  
# .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .RelativeSubPath = env1$path$LastSourceEditorContext.path_FileNameExt |> dirname() |> env1$f$f_path.relative()  ;    ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO()    }
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "default.template" |> paste0(".source.r")
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .SourceName_root = env1$path$LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),"")  ;    ".SourceName_root" |> env1$f$f_ObjectName.get.dput.ECHO()    }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.RelativeSubPath = .RelativeSubPath
if(!exists(".SourceName_root") && exists(".FileName.source.r")) .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
.FileName.source.r = .SourceName_root |> paste0(".source.r")
env1$path$.SourceName_root = .SourceName_root
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".source.r")
cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
    "#### ",env1$path$.RelativeSubPath_FileName.dev.r, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    sep="")
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
# #@@ START) dev -----  

env1$env.internal$f_function.load2env.internal = function(function_object, function_name, env1_subenv_name = "env.internal", show_packageStartupMessage = TRUE, runLoadedFunction = FALSE) {
    if(is.null(env1_subenv_name)) {
        if(!function_name %in% names(.GlobalEnv$env1)) {
            .GlobalEnv$env1[[function_name]] = function_object
            if(runLoadedFunction) {
                cat("> .GlobalEnv$env1$",function_name,"()\n",sep=""); get(.GlobalEnv$env1[[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
            }
            if(show_packageStartupMessage) packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",function_name))
        }
    } else {
        if(!function_name %in% names(.GlobalEnv$env1[[env1_subenv_name]])) {
            .GlobalEnv$env1[[env1_subenv_name]][[function_name]] = function_object
            if(runLoadedFunction) {
                if(is.environment(.GlobalEnv$env1[[env1_subenv_name]])) {
                    cat("> .GlobalEnv$env1$",env1_subenv_name,"$",function_name,"()\n",sep=""); get(function_name, envir=.GlobalEnv$env1[[env1_subenv_name]])() # Run the loaded function by default
                } else {
                    cat("> .GlobalEnv$env1$",env1_subenv_name,"$",function_name,"()\n",sep=""); get(env1_subenv_name[[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
                }
            }
            if(show_packageStartupMessage) packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",env1_subenv_name,"$", function_name))
        }
    }
}


rm(test, envir = env1$env.internal)
env1$env.internal$f_function.load2env.internal(LETTERS, "test")
.GlobalEnv$env1$env.internal$test


.tmp$objectname = "test"
.tmp$object = function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}

rm(test, envir = env1$env.internal)
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
env1$env.internal$test
.GlobalEnv$env1$env.internal$test

rm(test, envir = env1$env.internal)
.GlobalEnv$env1$env.internal$test
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = FALSE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
.GlobalEnv$env1$env.internal$test



rm(test, envir = env1$env.internal)
(function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}) |> env1$env.internal$f_function.load2env.internal("test")
.GlobalEnv$env1$env.internal$test




.GlobalEnv$env1$f$test = NULL
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
.GlobalEnv$env1$f$test

.GlobalEnv$env1$f$test = NULL
(function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}) |> env1$env.internal$f_function.load2env.internal("test", env1_subenv_name = "f")
.GlobalEnv$env1$f$test




rm(test, envir = env1)
(function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}) |> env1$env.internal$f_function.load2env.internal("test", env1_subenv_name = NULL)
.GlobalEnv$env1$test











# __________|------  
## @ write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") ----
if (Sys.getenv("PARENT_RENDERING") != "YES") {    
    .path4write = .path4write %>% str_replace(fixed(env1$path$path1), "") %>% str_replace("^/", "")  # [][Rproject] makes an error in git bash
    if(exists("MetaData") && !is.null(unlist(MetaData))) {
        # MetaData$DSNs |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
        cat("    ________________________________________________________________________    \n")
        for (DSN in names(MetaData$DSNs)) {    
            if(exists(DSN)) {
                assign(DSN, structure(get(DSN, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                if(is.null(attributes(.GlobalEnv[[DSN]])$DSN)) attributes(.GlobalEnv[[DSN]])$DSN = DSN
                if(attributes(.GlobalEnv[[DSN]])$DSN != DSN) attributes(.GlobalEnv[[DSN]])$DSN = DSN
                if (!is.null(attributes(attributes(.GlobalEnv[[DSN]])$DSN)$.path_file)) {
                    message( "attributes(attributes(",DSN,")$DSN)$.path_file == ",deparse(attributes(attributes(get(DSN))$DSN)$.path_file) )
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSN, .path_file = attributes(attributes(.GlobalEnv[[DSN]])$DSN)$.path_file, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                } else {
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSN, .path4write = .path4write, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                }
            } else {  message("!exists(",deparse(DSN),")")  }
            cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
        }
    }
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.UTF8BOM.csv = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8BOM.csv")
    # if (Sys.info()["sysname"] == "Windows") {
    #     readr::write_excel_csv(get(.objectname), file = .path_FileName.UTF8BOM.csv) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    #     openxlsx2::xl_open(.path_FileName.xlsx)
    # } else {
    #     readr::write_excel_csv(get(.objectname), file = .path_FileName.UTF8BOM.csv|>paste0(".xz")) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    # }
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.UTF8.csv.xz = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8.csv.xz")
    # readr::write_csv(get(.objectname), file = .path_FileName.UTF8.csv.xz) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
}
if (Sys.getenv("PARENT_RENDERING") != "YES") {
    
}
##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


