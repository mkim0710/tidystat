# Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.r  
# Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.Rmd  
# Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r  
# # source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r")  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
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
# env1$f$showSymbolPaths()
# env1$f$showProjectPathFiles()
# env1$f$showProjectPathsRecursively()
# env1$f$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_vec_ValueOptions.factor =  ----  
# https://github.com/mkim0710/51_model_formula/blob/main/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r  
.tmp$objectname = "f_vec_ValueOptions.factor"
.tmp$object = function(vec, ValueOptions, sep4levels = ",\\s*", sep4name_value = "=", VERBOSE = isTRUE(getOption("verbose"))) {
  if (is.na(ValueOptions) || ValueOptions == "") {
    return(vec)
  }

  if (VERBOSE) {
    cat("Processing variable with ValueOptions:", ValueOptions, "\n")
  }
  
  options_split <- str_split(ValueOptions, sep4levels)[[1]]
  
  if (VERBOSE) {
    cat("Split ValueOptions:", paste(options_split, collapse = ", "), "\n")
  }
  
  levels <- map_dbl(options_split, ~ as.numeric(str_split(.x, sep4name_value)[[1]][1]))
  labels <- map_chr(options_split, ~ str_split(.x, sep4name_value)[[1]][2])
  
  if (VERBOSE) {
    cat("Levels:", paste(levels, collapse = ", "), "\n")
    cat("Labels:", paste(labels, collapse = ", "), "\n")
  }

  vec.factor <- factor(vec, levels = levels, labels = labels)

  return(vec.factor)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_DS_CodeBook.walk2factor =  ----  
# https://github.com/mkim0710/51_model_formula/blob/main/Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r  
.tmp$objectname = "f_DS_CodeBook.walk2factor"
.tmp$object = function(DS, df_VarName_ValueOptions, sep4levels = ",\\s*", sep4name_value = "=", VERBOSE = isTRUE(getOption("verbose"))) {
  # Use walk2 to iterate over VarName.suffix and ValueOptions in parallel and update DS in place
  walk2(df_VarName_ValueOptions$VarName.suffix, df_VarName_ValueOptions$ValueOptions, 
    function(var_name, value_options) {
      if (var_name %in% colnames(DS)) {
        DS[[var_name]] <<- f_vec_ValueOptions.factor(DS[[var_name]], 
                                                          value_options, 
                                                          sep4levels, 
                                                          sep4name_value, 
                                                          VERBOSE)
      }
    })
  
  # Return the updated DS as a data frame
  return(DS)
}

#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
#### Rdev/60_communicate_report_export/f_DS_CodeBook.walk2factor.source.r  ----  
.RelativeSubPath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_DS_CodeBook.walk2factor.source.r"
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) ) ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})




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
# ⸿ END -----  

