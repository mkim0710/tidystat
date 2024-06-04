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
"(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat()
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
# > "(?i)inconsolata.*regular" |> tinytex::tlmgr_search(file = TRUE, all = FALSE, global = FALSE, stdout = TRUE) |> paste0(collapse="\n") |> cat()
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
#   "	texmf-dist/tex/latex/inconsolata",
#   ".")


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
# .
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

"inconsolata" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat()
# > "inconsolata" |> f_font_regex_perl.search_path_local() |> paste0(collapse="\n") |> cat()
# tlmgr search --all 'inconsolata'
# 	texmf-dist/fonts/enc/dvips/inconsolata
# 	texmf-dist/fonts/map/dvips/inconsolata
# 	texmf-dist/fonts/opentype/public/inconsolata
# 	texmf-dist/fonts/tfm/public/inconsolata
# 	texmf-dist/fonts/type1/public/inconsolata
# 	texmf-dist/tex/context/fonts/mkiv
# 	texmf-dist/tex/latex/inconsolata
"inconsolata" |> f_font_regex_perl.search_path_local() |> env1$f_vec.dput_line_by_line()
c("	texmf-dist/fonts/enc/dvips/inconsolata",
  "	texmf-dist/fonts/map/dvips/inconsolata",
  "	texmf-dist/fonts/opentype/public/inconsolata",
  "	texmf-dist/fonts/tfm/public/inconsolata",
  "	texmf-dist/fonts/type1/public/inconsolata",
  "	texmf-dist/tex/context/fonts/mkiv",
  "	texmf-dist/tex/latex/inconsolata",
  ".")

c("\ttexmf-dist/fonts/enc/dvips/inconsolata", "\ttexmf-dist/fonts/map/dvips/inconsolata",
"\ttexmf-dist/fonts/opentype/public/inconsolata", "\ttexmf-dist/fonts/tfm/public/inconsolata",
"\ttexmf-dist/fonts/type1/public/inconsolata", "\ttexmf-dist/tex/latex/inconsolata",
".") %>% env1$f_vec.dput_line_by_line()

if(.Platform$OS.type == "windows") browseURL(paste0(Sys.getenv("APPDATA"),"/TinyTeX/texmf-dist/fonts"))


vec_font_regex_perl = c("Roboto Condensed" = "(?i)roboto.*condensed",
  "Roboto Serif" = "(?i)roboto.*serif",
  "Cascadia Code Semibold" = "(?i)cascadia.*code.*semibold",
  "NanumMyeongjo" = "(?i)nanum.*myeongjo",
  "NanumGothic" = "(?i)nanum.*gothic",
  "D2Coding" = "(?i)d2coding")
vec_font_regex_perl |> map(f_font_regex_perl.search_path_local) |> dput()

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









c(
  "fontspec",
  "xunicode",
  "xltxtra",
  "cm-unicode",
  "unicode-math",
  "roboto",
  "cascadia-code",
  "nanum-type1",
  "nanum-myeongjo",
  "nanum-gothic",
  "d2coding"
)








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


