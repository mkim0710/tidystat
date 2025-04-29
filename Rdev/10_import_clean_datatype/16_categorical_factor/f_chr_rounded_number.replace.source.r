# Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.r  
# Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.Rmd  
# Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.source.r  
# # source("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.source.r")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.source.r")  
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_chr_rounded_number.replace.source.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
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
# env1$env.internal$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) dev -----  
## env0 = env1 ----
env0 = env1
## \% survival::lung |> 

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function -----  

## \$ convert_unicode_numbers =  ----
.tmp$objectname = "f_chr_rounded_number.replace"
.tmp$object = function(text) {
  # Define the mapping of Unicode characters to regular numbers
  unicode_to_number <- c(
    # Parenthesized Numbers
    "\u2460" = "1", "\u2461" = "2", "\u2462" = "3", "\u2463" = "4", "\u2464" = "5",
    "\u2465" = "6", "\u2466" = "7", "\u2467" = "8", "\u2468" = "9", "\u2469" = "10",
    "\u246A" = "11", "\u246B" = "12", "\u246C" = "13", "\u246D" = "14", "\u246E" = "15",
    "\u246F" = "16", "\u2470" = "17", "\u2471" = "18", "\u2472" = "19", "\u2473" = "20",
    
    # Circled Numbers
    "\u24EA" = "0", "\u2460" = "1", "\u2461" = "2", "\u2462" = "3", "\u2463" = "4",
    "\u2464" = "5", "\u2465" = "6", "\u2466" = "7", "\u2467" = "8", "\u2468" = "9",
    "\u2469" = "10", "\u246A" = "11", "\u246B" = "12", "\u246C" = "13", "\u246D" = "14",
    "\u246E" = "15", "\u246F" = "16", "\u2470" = "17", "\u2471" = "18", "\u2472" = "19",
    "\u2473" = "20",
    
    # Negative Circled Numbers
    "\u2776" = "1", "\u2777" = "2", "\u2778" = "3", "\u2779" = "4", "\u277A" = "5",
    "\u277B" = "6", "\u277C" = "7", "\u277D" = "8", "\u277E" = "9", "\u277F" = "10",
    
    # Double Circled Numbers
    "\u24F5" = "1", "\u24F6" = "2", "\u24F7" = "3", "\u24F8" = "4", "\u24F9" = "5",
    "\u24FA" = "6", "\u24FB" = "7", "\u24FC" = "8", "\u24FD" = "9", "\u24FE" = "10",
    
    # Dingbat Circled Numbers
    "\u2780" = "1", "\u2781" = "2", "\u2782" = "3", "\u2783" = "4", "\u2784" = "5",
    "\u2785" = "6", "\u2786" = "7", "\u2787" = "8", "\u2788" = "9", "\u2789" = "10",
    
    # Fullwidth Numbers
    "\uFF10" = "0", "\uFF11" = "1", "\uFF12" = "2", "\uFF13" = "3", "\uFF14" = "4",
    "\uFF15" = "5", "\uFF16" = "6", "\uFF17" = "7", "\uFF18" = "8", "\uFF19" = "9"
  )
  
  # Convert each character in the text to its corresponding number if it matches the mapping
  replaced_text <- sapply(strsplit(text, NULL)[[1]], function(char) {
    if (char %in% names(unicode_to_number)) {
      unicode_to_number[[char]]
    } else {
      char
    }
  })
  
  # Combine the replaced characters back into a single string
  return(paste(replaced_text, collapse = ""))
}

#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## § .RelativeSubPath, .FileName.source.r ======  
#### env1$path$.RelativeSubPath_FileName.source.r ----  
# .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .RelativeSubPath = env1$path$LastSourceEditorContext.path_FileNameExt |> dirname() |> env1$f$f_path.relative()  ;    ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO()    }
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "default.template" |> paste0(".source.r")
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .SourceName_root = env1$path$LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),"")  ;    ".SourceName_root" |> env1$f$f_ObjectName.get.dput.ECHO()    }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$env.internal$showCodeText2open.FileName.source.r(.RelativeSubPath, .FileName.source.r)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


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
env1$f$showCodeText2openSourceInGitHub()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


