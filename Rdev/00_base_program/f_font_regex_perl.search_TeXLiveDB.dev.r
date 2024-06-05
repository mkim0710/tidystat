# f_font_regex_perl.search_TeXLiveDB.dev.r
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# check fonts and install - tinytex@Rocker.r
# https://chatgpt.com/c/8d563256-b9b9-4685-b048-343944290455
# https://chatgpt.com/c/798e2ff5-96bf-481c-8d2d-77129a2812d7
# https://chatgpt.com/c/2926bf45-de5a-44e6-9a5c-3515412462ef
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
env1$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
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
library(tidyverse)
if (!requireNamespace("tinytex", quietly = TRUE)) {
  install.packages("tinytex")
}
library(tinytex)
# https://stackoverflow.com/questions/51468447/is-there-r-code-for-moving-the-focus-to-the-rstudio-console
# https://docs.posit.co/ide/server-pro/rstudio_ide_commands/rstudio_ide_commands.html
rstudioapi::executeCommand("activateConsole"); tinytex::install_tinytex(); rstudioapi::executeCommand("activateSource")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#% |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE) -----
"(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE)
"(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> dput()
"(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# > "(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE)
# tlmgr search --file '(?i)inconsolata.*regular'
# inconsolata:
# 	texmf-dist/fonts/opentype/public/inconsolata/Inconsolatazi4-Regular.otf
# 	texmf-dist/fonts/opentype/public/inconsolata/InconsolataN-Regular.otf
# 	texmf-dist/fonts/type1/public/inconsolata/InconsolataN-Regular.pfb
# > "(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> dput()
# tlmgr search --file '(?i)inconsolata.*regular'
# c("inconsolata:", "\ttexmf-dist/fonts/opentype/public/inconsolata/InconsolataN-Regular.otf", 
# "\ttexmf-dist/fonts/opentype/public/inconsolata/Inconsolatazi4-Regular.otf", 
# "\ttexmf-dist/fonts/type1/public/inconsolata/InconsolataN-Regular.pfb"
# )
# > "(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file '(?i)inconsolata.*regular'
# inconsolata:
# 	texmf-dist/fonts/type1/public/inconsolata/InconsolataN-Regular.pfb
# 	texmf-dist/fonts/opentype/public/inconsolata/Inconsolatazi4-Regular.otf
# 	texmf-dist/fonts/opentype/public/inconsolata/InconsolataN-Regular.otf

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) font_filename ====
### % f_font_filename.search_path_local ====
f_font_filename.search_path_local <- function(font_filename) {
    vec_path.file <- tinytex::tlmgr_search(what = font_filename, file = FALSE, all = TRUE, global = FALSE, stdout = TRUE)
    vec_path = vec_path.file %>% dirname() %>% unique() %>% sort()
    vec_path = vec_path[vec_path != "."]
    if (length(vec_path) > 0) {
        return(vec_path)
    } else {
        return(NULL)
    }
}
"noname" |> f_font_filename.search_path_local() |> env1$f_vec.dput_line_by_line()
"inconsolata" |> f_font_filename.search_path_local() |> env1$f_vec.dput_line_by_line()
# > "noname" |> f_font_filename.search_path_local() |> env1$f_vec.dput_line_by_line()
# tlmgr search --all 'noname'
# NULL
# > "inconsolata" |> f_font_filename.search_path_local() |> env1$f_vec.dput_line_by_line()
# tlmgr search --all 'inconsolata'
# c("	texmf-dist/fonts/enc/dvips/inconsolata",
#   "	texmf-dist/fonts/map/dvips/inconsolata",
#   "	texmf-dist/fonts/opentype/public/inconsolata",
#   "	texmf-dist/fonts/tfm/public/inconsolata",
#   "	texmf-dist/fonts/type1/public/inconsolata",
#   "	texmf-dist/tex/context/fonts/mkiv",
#   "	texmf-dist/tex/latex/inconsolata")


### % f_vec_font_filename.search_path_local ====
f_vec_font_filename.search_path_local <- function(vec_font_filename) {
    if(is.null(names(vec_font_filename))) vec_font_filename = vec_font_filename %>% set_names()
    names(vec_font_filename)[names(vec_font_filename)==""] = vec_font_filename[names(vec_font_filename)==""]
    for (font_name in names(vec_font_filename)) {
        vec_font_path <- f_font_filename.search_path_local(vec_font_filename[font_name])
        if (!is.null(vec_font_path)) {
            message(font_name, " is already installed at the following path(s):\n", paste(vec_font_path, collapse = "\n"))
        } else {
            message(font_name, " is not installed.")
        }
    }
}

c("noname", "inconsolata", "cascadia") |> f_vec_font_filename.search_path_local() 
# > c("noname", "inconsolata", "cascadia") |> f_vec_font_filename.search_path_local() 
# tlmgr search --all 'noname'
# noname is not installed.
# tlmgr search --all 'inconsolata'
# inconsolata is already installed at the following path(s):
# 	texmf-dist/fonts/enc/dvips/inconsolata
# 	texmf-dist/fonts/map/dvips/inconsolata
# 	texmf-dist/fonts/opentype/public/inconsolata
# 	texmf-dist/fonts/tfm/public/inconsolata
# 	texmf-dist/fonts/type1/public/inconsolata
# 	texmf-dist/tex/context/fonts/mkiv
# 	texmf-dist/tex/latex/inconsolata
# tlmgr search --all 'cascadia'
# cascadia is not installed.

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) font_regex_perl  ====
##$ vec_font_regex_perl =====
# c("Roboto Condensed", "Roboto Serif", "Cascadia Code Semibold", "NanumMyeongjo", "NanumGothic", "D2Coding")
vec_font_regex_perl = c("Roboto Condensed" = "(?i)roboto.*condensed",
  "Roboto Serif" = "(?i)roboto.*serif",
  "Cascadia Code Semibold" = "(?i)cascadia.*code.*semibold",
  "NanumMyeongjo" = "(?i)nanum.*myeongjo",
  "NanumGothic" = "(?i)nanum.*gothic",
  "D2Coding" = "(?i)d2coding")


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|# 
### % f_font_regex_perl.search_path_local ====
f_font_regex_perl.search_path_local <- function(font_regex_perl) {
    if(length(font_regex_perl) > 1) error("font_regex_perl must be a single string.")
    vec_path.file <- tinytex::tlmgr_search(what = font_regex_perl, file = FALSE, all = TRUE, global = FALSE, stdout = TRUE)
    vec_path = vec_path.file %>% dirname() %>% unique() %>% sort()
    vec_path = vec_path[vec_path != "."]
    if (length(vec_path) > 0) {
        return(vec_path)
    } else {
        return(NULL)
    }
}

"inconsolata" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"inconsolata" |> f_font_regex_perl.search_path_local() |> env1$f_vec.dput_line_by_line()
# > "inconsolata" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all 'inconsolata'
# 	texmf-dist/fonts/enc/dvips/inconsolata
# 	texmf-dist/fonts/map/dvips/inconsolata
# 	texmf-dist/fonts/opentype/public/inconsolata
# 	texmf-dist/fonts/tfm/public/inconsolata
# 	texmf-dist/fonts/type1/public/inconsolata
# 	texmf-dist/tex/context/fonts/mkiv
# 	texmf-dist/tex/latex/inconsolata> "inconsolata" |> f_font_regex_perl.search_path_local() |> env1$f_vec.dput_line_by_line()
# tlmgr search --all 'inconsolata'
# c("	texmf-dist/fonts/enc/dvips/inconsolata",
#   "	texmf-dist/fonts/map/dvips/inconsolata",
#   "	texmf-dist/fonts/opentype/public/inconsolata",
#   "	texmf-dist/fonts/tfm/public/inconsolata",
#   "	texmf-dist/fonts/type1/public/inconsolata",
#   "	texmf-dist/tex/context/fonts/mkiv",
#   "	texmf-dist/tex/latex/inconsolata")

"(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
"(?i)inconsolata.*regular" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# > "(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file '(?i)inconsolata.*regular'
# inconsolata:
# 	texmf-dist/fonts/type1/public/inconsolata/InconsolataN-Regular.pfb
# 	texmf-dist/fonts/opentype/public/inconsolata/Inconsolatazi4-Regular.otf
# 	texmf-dist/fonts/opentype/public/inconsolata/InconsolataN-Regular.otf
# > "(?i)inconsolata.*regular" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all '(?i)inconsolata.*regular'
# 	texmf-dist/fonts/opentype/public/inconsolata
# 	texmf-dist/fonts/type1/public/inconsolata


#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)robotocondensed.*bold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)robotocondensed.*bold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)robotocondensed.*bold" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# > "(?i)robotocondensed.*bold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all '(?i)robotocondensed.*bold'
# 	texmf-dist/fonts/opentype/google/roboto
# 	texmf-dist/fonts/tfm/google/roboto
# 	texmf-dist/fonts/type1/google/roboto
# 	texmf-dist/fonts/vf/google/roboto 
# > "(?i)robotocondensed.*bold" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file '(?i)robotocondensed.*bold'
# roboto:
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-ot1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-ly1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-ot1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-sc-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-ot1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-ot1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-ot1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-sc-ot1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-t1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-sc-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-sc-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-ot1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-t1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-t1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-sc-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-lgr--base.tfm
# 	texmf-dist/fonts/type1/google/roboto/RobotoCondensed-Bold.pfb
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-sc-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-ot1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-sc-ot1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-ts1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-ot1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-sc-ot1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-ot1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-ot1--base.tfm
# 	texmf-dist/fonts/type1/google/roboto/RobotoCondensed-BoldItalic.pfb
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-sc-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-t1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-sc-ot1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-ot1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-lf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-t1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-ly1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-ts1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-sc-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-ly1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-osf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-lgr.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-ot1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-ly1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-ts1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-sc-ot1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-ot1.tfm
# 	texmf-dist/fonts/opentype/google/roboto/RobotoCondensed-BoldItalic.otf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-sc-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-t1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-sc-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-sc-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-t1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-lgr.tfm
# 	texmf-dist/fonts/opentype/google/roboto/RobotoCondensed-Bold.otf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-sc-ot1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-sc-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-osf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-lf-sc-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-t1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-lf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-sc-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-ot1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tlf-sc-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-tosf-sc-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-osf-sc-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-lf-sc-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoCondensed-Bold-osf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-Bold-tosf-sc-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoCondensed-BoldItalic-tosf-sc-t1.tfm 


#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)roboto.*condensed.*semibold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)roboto.*condensed.*semibold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)roboto.*condensed.*semibold" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# > "(?i)roboto.*condensed.*semibold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all '(?i)roboto.*condensed.*semibold'
# 	texmf-dist/fonts/opentype/google/roboto
# 	texmf-dist/fonts/tfm/google/roboto
# 	texmf-dist/fonts/type1/google/roboto
# 	texmf-dist/fonts/vf/google/roboto 
# > "(?i)roboto.*condensed.*semibold" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file '(?i)roboto.*condensed.*semibold'
# roboto:
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-sup-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ts1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-ts1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-osf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-lf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tosf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ot1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ot1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-lf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-sup-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ts1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-osf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tlf-lgr.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ot1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ot1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-osf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-lgr--base.tfm
# 	texmf-dist/fonts/opentype/google/roboto/RobotoSerif_Condensed-SemiBoldItalic.otf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-ly1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-lgr.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ts1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tosf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ot1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-tlf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-t1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-ot1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ts1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-sup-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ot1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-osf-ts1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ly1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ot1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-ly1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-lf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-lgr--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-osf-t1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-ot1.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBold-lf-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tosf-lgr.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ot1.tfm
# 	texmf-dist/fonts/type1/google/roboto/RobotoSerifCondensed-SemiBold.pfb
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-ly1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-ot1.vf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-sup-lgr.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-ly1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-t1.tfm
# 	texmf-dist/fonts/type1/google/roboto/RobotoSerifCondensed-SemiBoldItalic.pfb
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ly1--base.tfm
# 	texmf-dist/fonts/opentype/google/roboto/RobotoSerif_Condensed-SemiBold.otf
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-t1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-t1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ot1--base.tfm
# 	texmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-SemiBoldItalic-lf-ts1.vf
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-osf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBoldItalic-tosf-ts1.tfm
# 	texmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-SemiBold-lf-ts1.tfm 


#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)cascadia.*code.*semibold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)cascadia.*code.*semibold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)cascadia.*code.*semibold" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# > "(?i)cascadia.*code.*semibold" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all '(?i)cascadia.*code.*semibold'
# 	texmf-dist/fonts/opentype/public/cascadia-code
# 	texmf-dist/fonts/tfm/public/cascadia-code
# 	texmf-dist/fonts/type1/public/cascadia-code
# 	texmf-dist/fonts/vf/public/cascadia-code 
# > "(?i)cascadia.*code.*semibold" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file '(?i)cascadia.*code.*semibold'
# cascadia-code:
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ts1--base.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-SemiBoldItalic.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ot1.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-SemiBold.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-ly1.vf
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-SemiBold.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-lgr.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-sup-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-lgr--base.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-SemiBoldItalic.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ly1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-lgr.vf 


#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)noto.*condensed" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)noto.*condensed" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)noto.*condensed" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")

#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)open.?sans.*condensed" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)open.?sans.*condensed" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)open.?sans.*condensed" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")


#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)fira.*code" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)fira.*code" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)fira.*code" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# "(?i)fira.*code" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# > "(?i)fira.*code" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all '(?i)fira.*code'
# 	texmf-dist/tex/context/fonts/mkiv 
# > "(?i)fira.*code" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file '(?i)fira.*code'
# context:
# 	texmf-dist/tex/context/fonts/mkiv/type-imp-firacode.mkiv 

#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)nanum" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)nanum" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)nanum" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# > "(?i)nanum" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all "(?i)nanum"
# 	texmf-dist/tex/latex/cjk-ko 
# > "(?i)nanum" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file "(?i)nanum"
# cjk-ko:
# 	texmf-dist/tex/latex/cjk-ko/cjkutf8-nanummjhanja.sty 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)d2c" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)d2c" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
"(?i)d2c" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# > "(?i)d2c" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --all "(?i)d2c"
# 	tlpkg/tlgs/lib 
# > "(?i)d2c" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file "(?i)d2c"
# tlgs.windows:
# 	tlpkg/tlgs/lib/cid2code.ps 

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|# 
### if(.Platform$OS.type == "windows") browseURL(paste0(Sys.getenv("APPDATA"),"/TinyTeX/texmf-dist/fonts")) -----
if(.Platform$OS.type == "windows") browseURL(paste0(Sys.getenv("APPDATA"),"/TinyTeX/texmf-dist/fonts"))
if(.Platform$OS.type == "windows") browseURL(paste0(Sys.getenv("APPDATA"),"/TinyTeX/texmf-dist/fonts/opentype"))  # .otf
if(.Platform$OS.type == "windows") browseURL(paste0(Sys.getenv("APPDATA"),"/TinyTeX/texmf-dist/fonts/truetype"))  # .ttf
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#
### if(.Platform$OS.type == "unix")  -----
'sudo find / -type d -name texmf-dist' |> system(intern = TRUE) 
dir("/usr/local/texlive/texmf-dist")
dir("/usr/local/texlive/texmf-dist/fonts")
'sudo find /usr/local/texlive/texmf-dist/fonts -type f -iname "*.otf"' |> system(intern = TRUE) 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|# 
vec_font_regex_perl = c("Roboto Condensed" = "(?i)roboto.*condensed",
  "Roboto Serif" = "(?i)roboto.*serif",
  "Cascadia Code Semibold" = "(?i)cascadia.*code.*semibold",
  "NanumMyeongjo" = "(?i)nanum.*myeongjo",
  "NanumGothic" = "(?i)nanum.*gothic",
  "D2Coding" = "(?i)d2coding")
vec_font_regex_perl |> map(f_font_regex_perl.search_path_local) |> env1$f_list.dput_line_by_line()
# list("Roboto Condensed" = c(
#          NULL),
#      "Roboto Serif" = c(
#          NULL),
#      "Cascadia Code Semibold" = c(
#          NULL),
#      "NanumMyeongjo" = c(
#          NULL),
#      "NanumGothic" = c(
#          NULL),
#      "D2Coding" = c(
#          NULL))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|# 
### % f_font_regex_perl.search_TeXLiveDB ====
f_font_regex_perl.search_TeXLiveDB <- function(font_regex_perl) {
    if(length(font_regex_perl) > 1) error("font_regex_perl must be a single string.")
    vec_path.file <- tinytex::tlmgr_search(what = font_regex_perl, file = TRUE, all = FALSE, global = TRUE, stdout = TRUE)
    if (length(vec_path.file) > 0) {
        return(vec_path.file)
    } else {
        return(NULL)
    }
}

vec_font_regex_perl.TexLiveDB_list = vec_font_regex_perl %>% map(f_font_regex_perl.search_TeXLiveDB)
vec_font_regex_perl.TexLiveDB_list %>% str
# > vec_font_regex_perl.TexLiveDB_list %>% str
# List of 6
#  $ Roboto Condensed      : chr [1:1845] "tlmgr: package repository https://mirror.navercorp.com/CTAN/systems/texlive/tlnet (not verified: gpg unavailable)" "roboto:" "\ttexmf-dist/fonts/tfm/google/roboto/RobotoSerifCondensed-BoldItalic-lf-ts1--base.tfm" "\ttexmf-dist/fonts/vf/google/roboto/RobotoSerifCondensed-Italic-tosf-lgr.vf" ...
#  $ Roboto Serif          : chr [1:2475] "tlmgr: package repository https://mirror.navercorp.com/CTAN/systems/texlive/tlnet (not verified: gpg unavailable)" "roboto:" "\ttexmf-dist/fonts/type1/google/roboto/RobotoSerif-ExtraBoldItalic.pfb" "\ttexmf-dist/fonts/vf/google/roboto/RobotoSerif-LightItalic-lf-ts1.vf" ...
#  $ Cascadia Code Semibold: chr [1:52] "tlmgr: package repository https://mirror.navercorp.com/CTAN/systems/texlive/tlnet (not verified: gpg unavailable)" "cascadia-code:" "\ttexmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ot1.tfm" "\ttexmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1.tfm" ...
#  $ NanumMyeongjo         : chr "tlmgr: package repository https://mirror.navercorp.com/CTAN/systems/texlive/tlnet (not verified: gpg unavailable)"
#  $ NanumGothic           : chr "tlmgr: package repository https://mirror.navercorp.com/CTAN/systems/texlive/tlnet (not verified: gpg unavailable)"
#  $ D2Coding              : chr "tlmgr: package repository https://mirror.navercorp.com/CTAN/systems/texlive/tlnet (not verified: gpg unavailable)"


#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#### > "(?i)fira.*code" |> f_font_regex_perl.search_TeXLiveDB() |> paste0(collapse="\n") |> cat("\n") -----
"(?i)fira.*code" |> f_font_regex_perl.search_TeXLiveDB() |> paste0(collapse="\n") |> cat("\n")
# tlmgr search --file --global '(?i)fira.*code'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# 00texlive.image:
# 	tlpkg/tlpsrc/lstfiracode.tlpsrc
# context:
# 	texmf-dist/tex/context/fonts/mkiv/type-imp-firacode.mkiv
# lstfiracode:
# 	texmf-dist/doc/latex/lstfiracode/README.md
# 	texmf-dist/tex/latex/lstfiracode/lstfiracode.sty
# 	texmf-dist/doc/latex/lstfiracode/lstfiracode.pdf
# 	texmf-dist/doc/latex/lstfiracode/lstfiracode.tex 

# https://www.ctan.org/tex-archive/fonts/fira
# "fira" |> tinytex::tlmgr_install()


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

# https://www.ctan.org/pkg/cascadia-code
# https://www.ctan.org/tex-archive/fonts/cascadia-code
# https://mirrors.ctan.org/fonts/cascadia-code.zip
# https://mirrors.ctan.org/fonts/cascadia-code/README
# \usepackage{cascadia-code}
# https://www.ctan.org/pkg/roboto
# https://www.ctan.org/tex-archive/fonts/roboto
# https://mirrors.ctan.org/fonts/roboto.zip
# https://mirrors.ctan.org/fonts/roboto/README
# \usepackage{roboto}
# \usepackage[sfdefault]{roboto}
# \usepackage[condensed]{roboto} ????
# \usepackage{roboto-mono}
# \usepackage{roboto-serif}
# https://www.ctan.org/pkg/fira
# https://www.ctan.org/tex-archive/fonts/fira
# https://mirrors.ctan.org/fonts/fira.zip
# https://mirrors.ctan.org/fonts/fira/README

# https://www.ctan.org/topic/korean
# https://www.ctan.org/pkg/kotex-plain
# https://www.ctan.org/pkg/kotex-utf
# https://www.ctan.org/pkg/kotex-utils
# https://www.ctan.org/pkg/xetexko
# https://www.ctan.org/pkg/luatexko
# https://www.ctan.org/pkg/cjk-ko
# https://www.ctan.org/pkg/nanumtype1
# https://www.ctan.org/pkg/baekmuk
# https://www.ctan.org/pkg/unfonts-core

# https://fonts.google.com/specimen/Roboto
# https://fonts.google.com/specimen/Roboto+Condensed
# https://fonts.google.com/specimen/Source+Serif+4
# https://fonts.google.com/specimen/Source+Sans+3
# https://fonts.google.com/specimen/Source+Code+Pro
# https://fonts.google.com/specimen/Open+Sans
# https://fonts.google.com/noto/specimen/Noto+Serif
# https://fonts.google.com/noto/specimen/Noto+Sans
# https://fonts.google.com/noto/specimen/Noto+Sans+KR
# https://fonts.google.com/specimen/Fira+Code
# https://fonts.google.com/specimen/Nanum+Myeongjo
# https://fonts.google.com/specimen/Nanum+Gothic
# https://fonts.google.com/specimen/Nanum+Gothic+Coding

# https://github.com/google/fonts
# You can download all Google Fonts in a simple ZIP snapshot (over 1GB) from https://github.com/google/fonts/archive/main.zip
# sudo wget https://github.com/google/fonts/archive/main.zip -O /usr/share/fonts/google-fonts.zip
# sudo unzip /usr/share/fonts/google-fonts.zip -d /usr/share/fonts/google-fonts
# sudo cp /usr/share/fonts/google-fonts/fonts-main/apache/robotocondensed/*.ttf /usr/share/fonts/
# sudo cp /usr/share/fonts/google-fonts/fonts-main/apache/roboto/*.ttf /usr/share/fonts/
# 
# sudo wget https://github.com/microsoft/cascadia-code/releases/download/v2108.26/CascadiaCode-2108.26.zip -O /usr/share/fonts/cascadia-code.zip
# sudo unzip /usr/share/fonts/cascadia-code.zip -d /usr/share/fonts/cascadia-code
# sudo cp /usr/share/fonts/cascadia-code/ttf/*.ttf /usr/share/fonts/
# 
# sudo wget https://github.com/naver/nanumfont/releases/download/VER2.5/NanumFont_TTF_ALL.zip -O /usr/share/fonts/nanum-fonts.zip
# sudo unzip /usr/share/fonts/nanum-fonts.zip -d /usr/share/fonts/nanum
# sudo cp /usr/share/fonts/nanum/NanumFont_TTF_ALL/*.ttf /usr/share/fonts/
# 
# sudo wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip -O /usr/share/fonts/d2coding.zip
# sudo unzip /usr/share/fonts/d2coding.zip -d /usr/share/fonts/d2coding
# sudo cp /usr/share/fonts/d2coding/D2Coding/*.ttf /usr/share/fonts/
# sudo fc-cache -f -v

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


