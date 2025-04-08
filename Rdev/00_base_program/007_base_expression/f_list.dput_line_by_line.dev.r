# f_list.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
# https://chatgpt.com/c/8f4ff95d-9466-453e-8f07-5bba159d0c86
# https://github.com/MilesMcBain/datapasta/blob/master/R/vector_paste.R
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
# env1$f$showPathSymbols()
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
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \$ list_vec ====  
list_vec = list(`Roboto Condensed` = c("\ttexmf-dist/fonts/opentype/google/roboto", 
"\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto", 
"\ttexmf-dist/fonts/vf/google/roboto", "."), `Roboto Serif` = c("\ttexmf-dist/fonts/opentype/google/roboto", 
"\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto", 
"\ttexmf-dist/fonts/vf/google/roboto", "\ttexmf-dist/tex/latex/roboto", 
"."), `Cascadia Code Semibold` = c("\ttexmf-dist/fonts/opentype/public/cascadia-code", 
"\ttexmf-dist/fonts/tfm/public/cascadia-code", "\ttexmf-dist/fonts/type1/public/cascadia-code", 
"\ttexmf-dist/fonts/vf/public/cascadia-code", "."), NanumMyeongjo = NULL, 
    NanumGothic = NULL, D2Coding = NULL) 
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# |> deparse() |> cat("  \n", sep="") -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
list_vec |> deparse() |> cat("  \n", sep="")
list("Roboto Condensed" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "."), "Roboto Serif" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "\ttexmf-dist/tex/latex/roboto",  "."), "Cascadia Code Semibold" = c("\ttexmf-dist/fonts/opentype/public/cascadia-code",  "\ttexmf-dist/fonts/tfm/public/cascadia-code", "\ttexmf-dist/fonts/type1/public/cascadia-code",  "\ttexmf-dist/fonts/vf/public/cascadia-code", "."), NanumMyeongjo = NULL,      NanumGothic = NULL, D2Coding = NULL)

list_vec2 = list("Roboto Condensed" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "."), "Roboto Serif" = c("\ttexmf-dist/fonts/opentype/google/roboto",  "\ttexmf-dist/fonts/tfm/google/roboto", "\ttexmf-dist/fonts/type1/google/roboto",  "\ttexmf-dist/fonts/vf/google/roboto", "\ttexmf-dist/tex/latex/roboto",  "."), "Cascadia Code Semibold" = c("\ttexmf-dist/fonts/opentype/public/cascadia-code",  "\ttexmf-dist/fonts/tfm/public/cascadia-code", "\ttexmf-dist/fonts/type1/public/cascadia-code",  "\ttexmf-dist/fonts/vf/public/cascadia-code", "."), NanumMyeongjo = NULL,      NanumGothic = NULL, D2Coding = NULL)
all.equal(list_vec, list_vec)
# > all.equal(list_vec, list_vec)
# [1] TRUE
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
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
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \$ list_vec.formatted ====  
space_between_vec_elements="\n  "
list_vec.formatted <- map(names(list_vec), function(name) {
        paste0('"', name, '" = ', f_vec.format_line_by_line(list_vec[[name]], space_between_vec_elements))
    })
list_vec.formatted |> str(max.level = 2, give.attr = TRUE)
# > list_vec.formatted |> str(max.level = 2, give.attr = TRUE)
# List of 6
#  $ : chr "\"Roboto Condensed\" = c(\"\ttexmf-dist/fonts/opentype/google/roboto\",\n  \"\ttexmf-dist/fonts/tfm/google/robo"| __truncated__
#  $ : chr "\"Roboto Serif\" = c(\"\ttexmf-dist/fonts/opentype/google/roboto\",\n  \"\ttexmf-dist/fonts/tfm/google/roboto\""| __truncated__
#  $ : chr "\"Cascadia Code Semibold\" = c(\"\ttexmf-dist/fonts/opentype/public/cascadia-code\",\n  \"\ttexmf-dist/fonts/tf"| __truncated__
#  $ : chr "\"NanumMyeongjo\" = NULL"
#  $ : chr "\"NanumGothic\" = NULL"
#  $ : chr "\"D2Coding\" = NULL"
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
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
# list_vec.formatted.dput_line_by_line |> cat("  \n", sep="")
# # > list_vec.formatted.dput_line_by_line |> cat("  \n", sep="")
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
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
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
    f_list.format_line_by_line(list_vec, space_between_vec_elements, space_between_list_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
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
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

