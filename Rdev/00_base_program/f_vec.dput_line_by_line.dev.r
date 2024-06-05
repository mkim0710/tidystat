# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
# https://chatgpt.com/c/8f4ff95d-9466-453e-8f07-5bba159d0c86
# https://github.com/MilesMcBain/datapasta/blob/master/R/vector_paste.R
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote() |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote() |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if(!exists("env1", envir=.GlobalEnv)) assign("env1", new.env(), envir=.GlobalEnv)
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
### env1\$env.internal ====
sourcename = "env1$env.internal"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### env1\$f_df.t.tribble_construct() ====
sourcename = "f_df.t.tribble_construct"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|# 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#$ vec ====
vec = c("C059", "D050000L", "NimbusMonoPS", "NimbusRoman", "NimbusSans", "NimbusSansNarrow", "P052", "Roboto", "RobotoCondensed")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
}
NULL |> f_vec.paste_collapse()
vec |> f_vec.paste_collapse()
vec |> f_vec.paste_collapse() |> cat("\n")
# > NULL |> f_vec.paste_collapse()
# [1] "\"\""
# > vec |> f_vec.paste_collapse()
# [1] "\"C059\",\n\"D050000L\",\n\"NimbusMonoPS\",\n\"NimbusRoman\",\n\"NimbusSans\",\n\"NimbusSansNarrow\",\n\"P052\",\n\"Roboto\",\n\"RobotoCondensed\""
# > vec |> f_vec.paste_collapse() |> cat("\n")
# "C059",
# "D050000L",
# "NimbusMonoPS",
# "NimbusRoman",
# "NimbusSans",
# "NimbusSansNarrow",
# "P052",
# "Roboto",
# "RobotoCondensed"
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') %>% paste0('c("',.,'")\n') |> cat("\n")
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("\n")
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% f_vec.dput_line_by_line <- function(vec, indent_spaces=2L) { -----
# f_vec.dput_line_by_line <- function(vec, indent_spaces=2L) {
#     # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("\n")
#     vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse=paste0('",\n',strrep(" ",indent_spaces),'"')),'")\n')} |> cat("\n")
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ") { -----
f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("\n")
    if (is.null(vec)) {
        return("NULL")
    } else {
        vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c(',ifelse(sep_parentheses,space_between_vec_elements,""),'"',paste0(., collapse=paste0('",',space_between_vec_elements,'"')),'"',ifelse(sep_parentheses,str_extract(space_between_vec_elements,"\n"),""),')',end_of_text)}
    }
}
f_vec.dput_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    f_vec.format_line_by_line(vec, space_between_vec_elements, sep_parentheses, end_of_text) |> cat("\n")
}

vec |> f_vec.dput_line_by_line("") 
vec |> f_vec.format_line_by_line("") 
vec |> f_vec.format_line_by_line("") |> cat("\n")
vec |> f_vec.format_line_by_line() 
vec |> f_vec.format_line_by_line() |> cat("\n")
vec |> f_vec.format_line_by_line("\n\t")
vec |> f_vec.format_line_by_line("\n\t") |> cat("\n")
vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE)
vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE) |> cat("\n")
# > vec |> f_vec.dput_line_by_line("") 
# c("C059","D050000L","NimbusMonoPS","NimbusRoman","NimbusSans","NimbusSansNarrow","P052","Roboto","RobotoCondensed")
# > vec |> f_vec.format_line_by_line("") 
# [1] "c(\"C059\",\"D050000L\",\"NimbusMonoPS\",\"NimbusRoman\",\"NimbusSans\",\"NimbusSansNarrow\",\"P052\",\"Roboto\",\"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line("") |> cat("\n")
# c("C059","D050000L","NimbusMonoPS","NimbusRoman","NimbusSans","NimbusSansNarrow","P052","Roboto","RobotoCondensed")
# > vec |> f_vec.format_line_by_line() 
# [1] "c(\"C059\",\n  \"D050000L\",\n  \"NimbusMonoPS\",\n  \"NimbusRoman\",\n  \"NimbusSans\",\n  \"NimbusSansNarrow\",\n  \"P052\",\n  \"Roboto\",\n  \"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line() |> cat("\n")
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
# > vec |> f_vec.format_line_by_line("\n\t") |> cat("\n")
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
# > vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE) |> cat("\n")
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

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

