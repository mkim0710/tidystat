# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
# https://chatgpt.com/c/8f4ff95d-9466-453e-8f07-5bba159d0c86
# https://github.com/MilesMcBain/datapasta/blob/master/R/vector_paste.R
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
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = file.path(.relative.subpath, .filename.source.r))
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
# .tmp$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .subpath, .filename.source.r ======  




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \$ vec ====  
vec = c("C059", "D050000L", "NimbusMonoPS", "NimbusRoman", "NimbusSans", "NimbusSansNarrow", "P052", "Roboto", "RobotoCondensed")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
}
NULL |> f_vec.paste_collapse()
vec |> f_vec.paste_collapse()
vec |> f_vec.paste_collapse() |> cat("  \n", sep="")
# > NULL |> f_vec.paste_collapse()
# [1] "\"\""
# > vec |> f_vec.paste_collapse()
# [1] "\"C059\",\n\"D050000L\",\n\"NimbusMonoPS\",\n\"NimbusRoman\",\n\"NimbusSans\",\n\"NimbusSansNarrow\",\n\"P052\",\n\"Roboto\",\n\"RobotoCondensed\""
# > vec |> f_vec.paste_collapse() |> cat("  \n", sep="")
# "C059",
# "D050000L",
# "NimbusMonoPS",
# "NimbusRoman",
# "NimbusSans",
# "NimbusSansNarrow",
# "P052",
# "Roboto",
# "RobotoCondensed"
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') |> paste0('c("',.,'")\n') |> cat("  \n", sep="")
}
NULL |> f_vec.dput_line_by_line()
vec |> f_vec.dput_line_by_line()
# > NULL |> f_vec.dput_line_by_line()
# c("")
# > vec |> f_vec.dput_line_by_line()
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("  \n", sep="")
}
NULL |> f_vec.dput_line_by_line()
vec |> f_vec.dput_line_by_line()
# > NULL |> f_vec.dput_line_by_line()
# c("")
# > vec |> f_vec.dput_line_by_line()
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \% f_vec.dput_line_by_line <- function(vec, indent_spaces=2L) { -----  
# f_vec.dput_line_by_line <- function(vec, indent_spaces=2L) {
#     # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("  \n", sep="")
#     vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse=paste0('",\n',strrep(" ",indent_spaces),'"')),'")\n')} |> cat("  \n", sep="")
# }#
# vec |> f_vec.dput_line_by_line()
# vec |> f_vec.dput_line_by_line(indent_spaces=4)
# # > vec |> f_vec.dput_line_by_line()
# # c("C059",
# #   "D050000L",
# #   "NimbusMonoPS",
# #   "NimbusRoman",
# #   "NimbusSans",
# #   "NimbusSansNarrow",
# #   "P052",
# #   "Roboto",
# #   "RobotoCondensed")
# # > vec |> f_vec.dput_line_by_line(indent_spaces=4)
# # c("C059",
# #     "D050000L",
# #     "NimbusMonoPS",
# #     "NimbusRoman",
# #     "NimbusSans",
# #     "NimbusSansNarrow",
# #     "P052",
# #     "Roboto",
# #     "RobotoCondensed")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \% f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ") { -----  
f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("  \n", sep="")
    if (is.null(vec)) {
        return("NULL")
    } else {
        vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c(',ifelse(sep_parentheses,space_between_vec_elements,""),'"',paste0(., collapse=paste0('",',space_between_vec_elements,'"')),'"',ifelse(sep_parentheses,str_extract(space_between_vec_elements,"\n"),""),')',end_of_text)}
    }
}
f_vec.dput_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    f_vec.format_line_by_line(vec, space_between_vec_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
}

vec |> f_vec.dput_line_by_line("") 
vec |> f_vec.format_line_by_line("") 
vec |> f_vec.format_line_by_line("") |> cat("  \n", sep="")
vec |> f_vec.format_line_by_line() 
vec |> f_vec.format_line_by_line() |> cat("  \n", sep="")
vec |> f_vec.format_line_by_line("\n\t")
vec |> f_vec.format_line_by_line("\n\t") |> cat("  \n", sep="")
vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE)
vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE) |> cat("  \n", sep="")
# > vec |> f_vec.dput_line_by_line("") 
# c("C059","D050000L","NimbusMonoPS","NimbusRoman","NimbusSans","NimbusSansNarrow","P052","Roboto","RobotoCondensed")
# > vec |> f_vec.format_line_by_line("") 
# [1] "c(\"C059\",\"D050000L\",\"NimbusMonoPS\",\"NimbusRoman\",\"NimbusSans\",\"NimbusSansNarrow\",\"P052\",\"Roboto\",\"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line("") |> cat("  \n", sep="")
# c("C059","D050000L","NimbusMonoPS","NimbusRoman","NimbusSans","NimbusSansNarrow","P052","Roboto","RobotoCondensed")
# > vec |> f_vec.format_line_by_line() 
# [1] "c(\"C059\",\n  \"D050000L\",\n  \"NimbusMonoPS\",\n  \"NimbusRoman\",\n  \"NimbusSans\",\n  \"NimbusSansNarrow\",\n  \"P052\",\n  \"Roboto\",\n  \"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line() |> cat("  \n", sep="")
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed")
# > vec |> f_vec.format_line_by_line("\n\t")
# [1] "c(\"C059\",\n\t\"D050000L\",\n\t\"NimbusMonoPS\",\n\t\"NimbusRoman\",\n\t\"NimbusSans\",\n\t\"NimbusSansNarrow\",\n\t\"P052\",\n\t\"Roboto\",\n\t\"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line("\n\t") |> cat("  \n", sep="")
# c("C059",
# 	"D050000L",
# 	"NimbusMonoPS",
# 	"NimbusRoman",
# 	"NimbusSans",
# 	"NimbusSansNarrow",
# 	"P052",
# 	"Roboto",
# 	"RobotoCondensed")
# > vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE)
# [1] "c(\n\t\"C059\",\n\t\"D050000L\",\n\t\"NimbusMonoPS\",\n\t\"NimbusRoman\",\n\t\"NimbusSans\",\n\t\"NimbusSansNarrow\",\n\t\"P052\",\n\t\"Roboto\",\n\t\"RobotoCondensed\"\n)\n"
# > vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE) |> cat("  \n", sep="")
# c(
# 	"C059",
# 	"D050000L",
# 	"NimbusMonoPS",
# 	"NimbusRoman",
# 	"NimbusSans",
# 	"NimbusSansNarrow",
# 	"P052",
# 	"Roboto",
# 	"RobotoCondensed"
# )

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
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

