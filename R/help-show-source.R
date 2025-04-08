
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
## :: MH_shortcuts =  ----  
.tmp$objectname = "MH_shortcuts"
.tmp$object = function(show_hotkeys = TRUE, show_cmd_code = TRUE) {
    if(show_hotkeys) {
      cat("## Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
## Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
## Ctrl+Alt+Shift+Left/Right: First/Last tab
## Ctrl+Alt+D: Show diff between current and last commit
## Ctrl+Alt+M: Commit changes to Git
## Ctrl+Shift+O: Show/Hide Document Outline
## Alt+Shift+Drag: Multiline Cursor
## Ctrl+Shift+F10: Restart R Session 
## Ctrl+Alt+B: Run from start to current line 
## Shift+F9: Toggle Breakpoint "); cat("\n")
    }
    if(show_cmd_code) {
      "cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" |> cat("\n")
      "cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd " |> cat("\n")
      "cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile " |> cat("\n")
    }
    invisible()
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) show_shortcuts  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "show_shortcuts")


