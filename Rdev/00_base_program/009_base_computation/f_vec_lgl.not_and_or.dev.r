# Rdev/00_base_program/f_vec_lgl.not_and_or.dev.r  
# Rdev/00_base_program/f_vec_lgl.not_and_or.dev.Rmd  
# Rdev/00_base_program/f_vec_lgl.not_and_or.source.r 
# # source("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.source.r")  
# # if(!file.exists("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.source.r")  
# file.edit("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/00_base_program/f_vec_lgl.not_and_or.source.r"); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt); 
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
# env1$f$showSymbolPaths()
# env1$f$showProjectPathFiles()
# env1$f$showProjectPathsRecursively()
# env1$env.internal$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## § .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_vec_lgl.not_and_or" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$env.internal$showCodeText2open.FileName.source.r(.RelativeSubPath, .FileName.source.r)
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# #@@ START) examples -----  
# https://chatgpt.com/c/d388a642-48b0-42ea-a264-4ae2d77b024e

!TRUE && FALSE
!TRUE && TRUE
!FALSE && TRUE
!TRUE || FALSE
TRUE && FALSE || TRUE
!FALSE && TRUE || FALSE
# > !TRUE && FALSE
# [1] FALSE
# > !TRUE && TRUE
# [1] FALSE
# > !FALSE && TRUE
# [1] TRUE
# > !TRUE || FALSE
# [1] FALSE
# > TRUE && FALSE || TRUE
# [1] TRUE
# > !FALSE && TRUE || FALSE
# [1] TRUE


 !"A" %in% c("A", "B") &&  "C" %in% c("C", "D") || "E" %in% c("E", "F")
(!"A" %in% c("A", "B") && "C" %in% c("C", "D")) || "E" %in% c("E", "F")
 !"A" %in% c("A", "B") && ("C" %in% c("C", "D") || "E" %in% c("E", "F"))
# >  !"A" %in% c("A", "B") &&  "C" %in% c("C", "D") || "E" %in% c("E", "F")
# [1] TRUE
# > (!"A" %in% c("A", "B") && "C" %in% c("C", "D")) || "E" %in% c("E", "F")
# [1] TRUE
# >  !"A" %in% c("A", "B") && ("C" %in% c("C", "D") || "E" %in% c("E", "F"))
# [1] FALSE


TRUE * TRUE
TRUE * FALSE
FALSE * FALSE
# > TRUE * TRUE
# [1] 1
# > TRUE * FALSE
# [1] 0
# > FALSE * FALSE
# [1] 0

TRUE + TRUE
TRUE + FALSE
FALSE + FALSE
# > TRUE + TRUE
# [1] 2
# > TRUE + FALSE
# [1] 1
# > FALSE + FALSE
# [1] 0

any(c(TRUE, TRUE))
any(c(TRUE, FALSE))
any(c(FALSE, FALSE))
# > any(c(TRUE, TRUE))
# [1] TRUE
# > any(c(TRUE, FALSE))
# [1] TRUE
# > any(c(FALSE, FALSE))
# [1] FALSE

all(c(TRUE, TRUE))
all(c(TRUE, FALSE))
all(c(FALSE, FALSE))
# > all(c(TRUE, TRUE))
# [1] TRUE
# > all(c(TRUE, FALSE))
# [1] FALSE
# > all(c(FALSE, FALSE))
# [1] FALSE





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


