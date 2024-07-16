# f_list.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
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
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
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
sourcename = "env1$env.internal" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### env1\$f_df.t.tribble_construct() ====
sourcename = "f_df.t.tribble_construct" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|# 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#$ list_vec ====
list_vec = list(`Roboto Condensed` = c("\ttexmf-dist/fonts/opentype/google/roboto", 
"\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto", 
"\ttexmf-dist/fonts/vf/google/roboto", "."), `Roboto Serif` = c("\ttexmf-dist/fonts/opentype/google/roboto", 
"\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto", 
"\ttexmf-dist/fonts/vf/google/roboto", "\ttexmf-dist/tex/latex/roboto", 
"."), `Cascadia Code Semibold` = c("\ttexmf-dist/fonts/opentype/public/cascadia-code", 
"\ttexmf-dist/fonts/tfm/public/cascadia-code", "\ttexmf-dist/fonts/type1/public/cascadia-code", 
"\ttexmf-dist/fonts/vf/public/cascadia-code", "."), NanumMyeongjo = NULL, 
    NanumGothic = NULL, D2Coding = NULL) 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# %>% deparse() |> cat() -----
library(tidyverse)
list_vec %>% deparse() |> cat()
list("Roboto Condensed" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "."), "Roboto Serif" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "\ttexmf-dist/tex/latex/roboto",  "."), "Cascadia Code Semibold" = c("\ttexmf-dist/fonts/opentype/public/cascadia-code",  "\ttexmf-dist/fonts/tfm/public/cascadia-code", "\ttexmf-dist/fonts/type1/public/cascadia-code",  "\ttexmf-dist/fonts/vf/public/cascadia-code", "."), NanumMyeongjo = NULL,      NanumGothic = NULL, D2Coding = NULL)

list_vec2 = list("Roboto Condensed" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "."), "Roboto Serif" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "\ttexmf-dist/tex/latex/roboto",  "."), "Cascadia Code Semibold" = c("\ttexmf-dist/fonts/opentype/public/cascadia-code",  "\ttexmf-dist/fonts/tfm/public/cascadia-code", "\ttexmf-dist/fonts/type1/public/cascadia-code",  "\ttexmf-dist/fonts/vf/public/cascadia-code", "."), NanumMyeongjo = NULL,      NanumGothic = NULL, D2Coding = NULL)
all.equal(list_vec, list_vec)
# > all.equal(list_vec, list_vec)
# [1] TRUE
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% list_vec %>% f_vec.dput_line_by_line() ------
# # > list_vec %>% f_vec.dput_line_by_line()
# # c("c(\"\\ttexmf-dist/fonts/opentype/google/roboto\", \"\\ttexmf-dist/fonts/tfm/google/roboto\", \"\\ttexmf-dist/fonts/type1/google/roboto\", \"\\ttexmf-dist/fonts/vf/google/roboto\", \".\")",
# #   "c(\"\\ttexmf-dist/fonts/opentype/google/roboto\", \"\\ttexmf-dist/fonts/tfm/google/roboto\", \"\\ttexmf-dist/fonts/type1/google/roboto\", \"\\ttexmf-dist/fonts/vf/google/roboto\", \"\\ttexmf-dist/tex/latex/roboto\", \".\")",
# #   "c(\"\\ttexmf-dist/fonts/opentype/public/cascadia-code\", \"\\ttexmf-dist/fonts/tfm/public/cascadia-code\", \"\\ttexmf-dist/fonts/type1/public/cascadia-code\", \"\\ttexmf-dist/fonts/vf/public/cascadia-code\", \".\")",
# #   "NULL",
# #   "NULL",
# #   "NULL")
# # Warning message:
# # In stri_replace_all_regex(string, pattern, fix_replacement(replacement),  :
# #   argument is not an atomic vector; coercing
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#$ list_vec.formatted ====
space_between_vec_elements="\n  "
list_vec.formatted <- map(names(list_vec), function(name) {
        paste0('"', name, '" = ', f_vec.format_line_by_line(list_vec[[name]], space_between_vec_elements))
    })
list_vec.formatted %>% str
# > list_vec.formatted %>% str
# List of 6
#  $ : chr "\"Roboto Condensed\" = c(\"\ttexmf-dist/fonts/opentype/google/roboto\",\n  \"\ttexmf-dist/fonts/tfm/google/robo"| __truncated__
#  $ : chr "\"Roboto Serif\" = c(\"\ttexmf-dist/fonts/opentype/google/roboto\",\n  \"\ttexmf-dist/fonts/tfm/google/roboto\""| __truncated__
#  $ : chr "\"Cascadia Code Semibold\" = c(\"\ttexmf-dist/fonts/opentype/public/cascadia-code\",\n  \"\ttexmf-dist/fonts/tf"| __truncated__
#  $ : chr "\"NanumMyeongjo\" = NULL"
#  $ : chr "\"NanumGothic\" = NULL"
#  $ : chr "\"D2Coding\" = NULL"
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% list_vec.formatted %>% f_vec.dput_line_by_line() ----
# list_vec.formatted.dput_line_by_line = c("\"Roboto Condensed\" = c(\"	texmf-dist/fonts/opentype/google/roboto\",
# 	\"	texmf-dist/fonts/tfm/google/roboto\",
# 	\"	texmf-dist/fonts/type1/google/roboto\",
# 	\"	texmf-dist/fonts/vf/google/roboto\",
# 	\".\")
# ",
#   "\"Roboto Serif\" = c(\"	texmf-dist/fonts/opentype/google/roboto\",
# 	\"	texmf-dist/fonts/tfm/google/roboto\",
# 	\"	texmf-dist/fonts/type1/google/roboto\",
# 	\"	texmf-dist/fonts/vf/google/roboto\",
# 	\"	texmf-dist/tex/latex/roboto\",
# 	\".\")
# ",
#   "\"Cascadia Code Semibold\" = c(\"	texmf-dist/fonts/opentype/public/cascadia-code\",
# 	\"	texmf-dist/fonts/tfm/public/cascadia-code\",
# 	\"	texmf-dist/fonts/type1/public/cascadia-code\",
# 	\"	texmf-dist/fonts/vf/public/cascadia-code\",
# 	\".\")
# ",
#   "\"NanumMyeongjo\" = NULL",
#   "\"NanumGothic\" = NULL",
#   "\"D2Coding\" = NULL")
# list_vec.formatted.dput_line_by_line |> cat()
# # > list_vec.formatted.dput_line_by_line |> cat()
# # "Roboto Condensed" = c("	texmf-dist/fonts/opentype/google/roboto",
# # 	"	texmf-dist/fonts/tfm/google/roboto",
# # 	"	texmf-dist/fonts/type1/google/roboto",
# # 	"	texmf-dist/fonts/vf/google/roboto",
# # 	".")
# #  "Roboto Serif" = c("	texmf-dist/fonts/opentype/google/roboto",
# # 	"	texmf-dist/fonts/tfm/google/roboto",
# # 	"	texmf-dist/fonts/type1/google/roboto",
# # 	"	texmf-dist/fonts/vf/google/roboto",
# # 	"	texmf-dist/tex/latex/roboto",
# # 	".")
# #  "Cascadia Code Semibold" = c("	texmf-dist/fonts/opentype/public/cascadia-code",
# # 	"	texmf-dist/fonts/tfm/public/cascadia-code",
# # 	"	texmf-dist/fonts/type1/public/cascadia-code",
# # 	"	texmf-dist/fonts/vf/public/cascadia-code",
# # 	".")
# #  "NanumMyeongjo" = NULL "NanumGothic" = NULL "D2Coding" = NULL
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% f_list.format_line_by_line <- function(list_vec, space_between_vec_elements="\n\t") { -----
f_list.format_line_by_line <- function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    .f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
        if (is.null(vec)) {
            return("NULL")
        } else {
            vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
        }
    }
    
    list_vec.formatted <- map(names(list_vec), function(name) {
        paste0('"', name, '" = c(', space_between_vec_elements, .f_vec.paste_collapse(list_vec[[name]], space_between_vec_elements), ")")
    })
    paste0("list(", ifelse(sep_parentheses,space_between_list_elements,""), paste0(list_vec.formatted, collapse = paste0(",",space_between_list_elements)), ifelse(sep_parentheses,str_extract(space_between_list_elements,"\n"),""), ")", end_of_text)
    
}
f_list.dput_line_by_line = function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    f_list.format_line_by_line(list_vec, space_between_vec_elements, space_between_list_elements, sep_parentheses, end_of_text) |> cat("\n")
}

list_vec |> f_list.format_line_by_line()
list_vec |> f_list.dput_line_by_line()
# > list_vec |> f_list.dput_line_by_line()
# list("Roboto Condensed" = c(
#          "	texmf-dist/fonts/opentype/google/roboto",
#          "	texmf-dist/fonts/tfm/google/roboto",
#          "	texmf-dist/fonts/type1/google/roboto",
#          "	texmf-dist/fonts/vf/google/roboto",
#          "."),
#      "Roboto Serif" = c(
#          "	texmf-dist/fonts/opentype/google/roboto",
#          "	texmf-dist/fonts/tfm/google/roboto",
#          "	texmf-dist/fonts/type1/google/roboto",
#          "	texmf-dist/fonts/vf/google/roboto",
#          "	texmf-dist/tex/latex/roboto",
#          "."),
#      "Cascadia Code Semibold" = c(
#          "	texmf-dist/fonts/opentype/public/cascadia-code",
#          "	texmf-dist/fonts/tfm/public/cascadia-code",
#          "	texmf-dist/fonts/type1/public/cascadia-code",
#          "	texmf-dist/fonts/vf/public/cascadia-code",
#          "."),
#      "NanumMyeongjo" = c(
#          NULL),
#      "NanumGothic" = c(
#          NULL),
#      "D2Coding" = c(
#          NULL))
list_vec2 = list("Roboto Condensed" = c(
         "	texmf-dist/fonts/opentype/google/roboto",
         "	texmf-dist/fonts/tfm/google/roboto",
         "	texmf-dist/fonts/type1/google/roboto",
         "	texmf-dist/fonts/vf/google/roboto",
         "."),
     "Roboto Serif" = c(
         "	texmf-dist/fonts/opentype/google/roboto",
         "	texmf-dist/fonts/tfm/google/roboto",
         "	texmf-dist/fonts/type1/google/roboto",
         "	texmf-dist/fonts/vf/google/roboto",
         "	texmf-dist/tex/latex/roboto",
         "."),
     "Cascadia Code Semibold" = c(
         "	texmf-dist/fonts/opentype/public/cascadia-code",
         "	texmf-dist/fonts/tfm/public/cascadia-code",
         "	texmf-dist/fonts/type1/public/cascadia-code",
         "	texmf-dist/fonts/vf/public/cascadia-code",
         "."),
     "NanumMyeongjo" = c(
         NULL),
     "NanumGothic" = c(
         NULL),
     "D2Coding" = c(
         NULL))
all.equal(list_vec, list_vec2)
# > all.equal(list_vec, list_vec2)
# [1] TRUE
list_vec |> f_list.format_line_by_line(sep_parentheses = TRUE)
list_vec |> f_list.dput_line_by_line(sep_parentheses = TRUE)
# > list_vec |> f_list.format_line_by_line(sep_parentheses = TRUE)
# [1] "list(\n     \"Roboto Condensed\" = c(\n         \"\ttexmf-dist/fonts/opentype/google/roboto\",\n         \"\ttexmf-dist/fonts/tfm/google/roboto\",\n         \"\ttexmf-dist/fonts/type1/google/roboto\",\n         \"\ttexmf-dist/fonts/vf/google/roboto\",\n         \".\"),\n     \"Roboto Serif\" = c(\n         \"\ttexmf-dist/fonts/opentype/google/roboto\",\n         \"\ttexmf-dist/fonts/tfm/google/roboto\",\n         \"\ttexmf-dist/fonts/type1/google/roboto\",\n         \"\ttexmf-dist/fonts/vf/google/roboto\",\n         \"\ttexmf-dist/tex/latex/roboto\",\n         \".\"),\n     \"Cascadia Code Semibold\" = c(\n         \"\ttexmf-dist/fonts/opentype/public/cascadia-code\",\n         \"\ttexmf-dist/fonts/tfm/public/cascadia-code\",\n         \"\ttexmf-dist/fonts/type1/public/cascadia-code\",\n         \"\ttexmf-dist/fonts/vf/public/cascadia-code\",\n         \".\"),\n     \"NanumMyeongjo\" = c(\n         NULL),\n     \"NanumGothic\" = c(\n         NULL),\n     \"D2Coding\" = c(\n         NULL)\n)\n"
# > list_vec |> f_list.dput_line_by_line(sep_parentheses = TRUE)
# list(
#      "Roboto Condensed" = c(
#          "	texmf-dist/fonts/opentype/google/roboto",
#          "	texmf-dist/fonts/tfm/google/roboto",
#          "	texmf-dist/fonts/type1/google/roboto",
#          "	texmf-dist/fonts/vf/google/roboto",
#          "."),
#      "Roboto Serif" = c(
#          "	texmf-dist/fonts/opentype/google/roboto",
#          "	texmf-dist/fonts/tfm/google/roboto",
#          "	texmf-dist/fonts/type1/google/roboto",
#          "	texmf-dist/fonts/vf/google/roboto",
#          "	texmf-dist/tex/latex/roboto",
#          "."),
#      "Cascadia Code Semibold" = c(
#          "	texmf-dist/fonts/opentype/public/cascadia-code",
#          "	texmf-dist/fonts/tfm/public/cascadia-code",
#          "	texmf-dist/fonts/type1/public/cascadia-code",
#          "	texmf-dist/fonts/vf/public/cascadia-code",
#          "."),
#      "NanumMyeongjo" = c(
#          NULL),
#      "NanumGothic" = c(
#          NULL),
#      "D2Coding" = c(
#          NULL)
# )
list_vec |> f_list.format_line_by_line(space_between_vec_elements = "")
list_vec |> f_list.dput_line_by_line(space_between_vec_elements = "")
# > list_vec |> f_list.format_line_by_line(space_between_vec_elements = "")
# [1] "list(\"Roboto Condensed\" = c(\"\ttexmf-dist/fonts/opentype/google/roboto\",\"\ttexmf-dist/fonts/tfm/google/roboto\",\"\ttexmf-dist/fonts/type1/google/roboto\",\"\ttexmf-dist/fonts/vf/google/roboto\",\".\"),\n     \"Roboto Serif\" = c(\"\ttexmf-dist/fonts/opentype/google/roboto\",\"\ttexmf-dist/fonts/tfm/google/roboto\",\"\ttexmf-dist/fonts/type1/google/roboto\",\"\ttexmf-dist/fonts/vf/google/roboto\",\"\ttexmf-dist/tex/latex/roboto\",\".\"),\n     \"Cascadia Code Semibold\" = c(\"\ttexmf-dist/fonts/opentype/public/cascadia-code\",\"\ttexmf-dist/fonts/tfm/public/cascadia-code\",\"\ttexmf-dist/fonts/type1/public/cascadia-code\",\"\ttexmf-dist/fonts/vf/public/cascadia-code\",\".\"),\n     \"NanumMyeongjo\" = c(NULL),\n     \"NanumGothic\" = c(NULL),\n     \"D2Coding\" = c(NULL))\n"
# > list_vec |> f_list.dput_line_by_line(space_between_vec_elements = "")
# list("Roboto Condensed" = c("	texmf-dist/fonts/opentype/google/roboto","	texmf-dist/fonts/tfm/google/roboto","	texmf-dist/fonts/type1/google/roboto","	texmf-dist/fonts/vf/google/roboto","."),
#      "Roboto Serif" = c("	texmf-dist/fonts/opentype/google/roboto","	texmf-dist/fonts/tfm/google/roboto","	texmf-dist/fonts/type1/google/roboto","	texmf-dist/fonts/vf/google/roboto","	texmf-dist/tex/latex/roboto","."),
#      "Cascadia Code Semibold" = c("	texmf-dist/fonts/opentype/public/cascadia-code","	texmf-dist/fonts/tfm/public/cascadia-code","	texmf-dist/fonts/type1/public/cascadia-code","	texmf-dist/fonts/vf/public/cascadia-code","."),
#      "NanumMyeongjo" = c(NULL),
#      "NanumGothic" = c(NULL),
#      "D2Coding" = c(NULL))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

