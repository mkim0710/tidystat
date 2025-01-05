# .filename.source.r = "f_df.Table1byExposure.xlsx" |> paste0(".source.r")
# f_df.Table1byExposure.xlsx.dev.r
# f_df.Table1byExposure.xlsx.source.r
# utils::browseURL("/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r")
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  




#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .relative.subpath, .filename.source.r ======  
.relative.subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  
# if(.relative.subpath!="") .relative.subpath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.filename.source.r = "f_df.printVars_byMainOutcome" |> paste0(".source.r")
### \% source( file.path(env1$path$source_base,.relative.subpath_filename.source.r) ) ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

env1$f$f_df.printVars_byMainOutcome = function(DS, MainOutcome, VarName.selected) {
    DS %>% select(any_of(MainOutcome), any_of(VarName.selected)) %>% 
        mutate_if(haven::is.labelled, as_factor) |>
        # {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> 
        mutate_if(function(vec) {is.numeric(vec) && n_distinct(vec) <= 10}, as.factor) |>
        as.data.frame() %>%  
        tableone::CreateTableOne(vars = names(.)[names(.)!=MainOutcome], strata = MainOutcome, data = ., test = T, includeNA = T, addOverall = T)
}



#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) data -----  














  
  
# __________|------  
# @@ END -----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
