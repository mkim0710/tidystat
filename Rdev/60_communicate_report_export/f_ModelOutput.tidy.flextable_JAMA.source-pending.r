# .SourceName_root = "f_Table1.flextable"  
#### Rdev/60_communicate_report_export/f_Table1.flextable.dev.r----  
#### Rdev/60_communicate_report_export/f_Table1.flextable.dev.Rmd----  
#### Rdev/60_communicate_report_export/f_Table1.flextable.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_Table1.flextable.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.source.r")  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_Table1.flextable.source.r"); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt); 
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



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_ModelOutput.tidy.flextable_JAMA =  ----  
## -> included in "f_df.t.tribble_construct.source.r"? Not Yet
# https://chatgpt.com/c/66f444ad-c638-800e-a884-e76216e05329
# /github_tidystat/Rdev/60_communicate_report_export/f_Table1_print_df.flextable.source.r
.tmp$objectname = "f_ModelOutput.tidy.flextable_JAMA"
.tmp$object  <- function(DS, VarNames4Exposure = c("InterventionGroup"), Varnames_factor.exclude = NULL, addOverall = TRUE, includeNA = TRUE, print.Varnames_nonnormal = NULL, print.showAllLevels = TRUE) {
    
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  











##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ END ----  

