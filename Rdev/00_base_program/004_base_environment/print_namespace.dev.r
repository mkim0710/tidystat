# default.R
# "rstudio-prefs/templates/default.R" |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL()
# source(paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R")
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
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
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .FileName.source.r = "function.detachAllPackages" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r))
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
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  





##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
# https://chatgpt.com/c/9faf244b-181e-47ec-ae76-841d14f50e0f
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \% search()  -----  

### \% search() @ default Rocker 4.3.3
search() |> deparse() |> cat("  \n", sep="") 
c(".GlobalEnv", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")

### \% search() @ default Rocker 4.3.3 + library(tidyverse)
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
search() |> deparse() |> cat("  \n", sep="") 
c(".GlobalEnv", "package:lubridate", "package:forcats", "package:stringr", "package:dplyr", "package:purrr", "package:readr", "package:tidyr", "package:tibble", "package:ggplot2", "package:tidyverse", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")


### \% search() @ problem with .Rprofile on 2024-07-20
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
search() |> deparse() |> cat("  \n", sep="") 
c(".GlobalEnv", "tools:rstudio", "package:lubridate", "package:forcats", "package:stringr", "package:dplyr", "package:purrr", "package:readr", "package:tidyr", "package:tibble", "package:ggplot2", "package:tidyverse", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")  # "tools:rstudio" is loaded after .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://bookdown.dongzhuoer.com/hadley/r-pkgs/namespace
# https://chatgpt.com/c/027e3714-b507-4e91-a20a-7e4c591be8de
# https://homepage.divms.uiowa.edu/~luke/R/namespaces/morenames.html
# https://chatgpt.com/c/e5eff8f3-6345-4f11-a739-e019bb1ccb82
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
ls(envir = asNamespace("base")) %>%  str
# > ls(envir = asNamespace("base")) %>%  str
#  chr [1:1270] "-" "-.Date" "-.POSIXt" ":" "::" ":::" "!" "!.hexmode" "!.octmode" "!=" "(" "[" "[.AsIs" "[.data.frame" "[.Date" "[.difftime" "[.Dlist" ...
getNamespaceExports("base") |> str(max.level = 2, give.attr = TRUE)
# > getNamespaceExports("base") |> str(max.level = 2, give.attr = TRUE)
#  chr [1:1391] "!" "$" "&" "(" "*" "+" "-" "/" ":" "<" "=" ">" "as.matrix.data.frame" "@" "F" "I" "registerS3methods" "as.POSIXct.Date" "T" "[" "^" "c" "q" ...

env1$f$f_vec1_vec2.setdiff_list(ls(envir = asNamespace("base")), getNamespaceExports("base")) |> str(max.level = 2, give.attr = TRUE)
# > env1$f$f_vec1_vec2.setdiff_list(ls(envir = asNamespace("base")), getNamespaceExports("base")) |> str(max.level = 2, give.attr = TRUE)
# List of 7
#  $ vec1.character: chr [1:1270] "-" "-.Date" "-.POSIXt" ":" ...
#  $ vec2.character: chr [1:1391] "!" "$" "&" "(" ...
#  $ union         : chr [1:1391] "-" "-.Date" "-.POSIXt" ":" ...
#  $ intersect     : chr [1:1270] "-" "-.Date" "-.POSIXt" ":" ...
#  $ setdiff_1_2   : chr(0) 
#  $ setdiff_2_1   : chr [1:121] ".GlobalEnv" ".handleSimpleError" ".C" ".set_row_names" ...
#  $ identical     : chr [1:2] "Lengths (1270, 1391) differ (string compare on first 1270)" "1269 string mismatches"


setdiff(getNamespaceExports("base"), ls(envir = asNamespace("base"))) |> deparse() |> cat("  \n", sep="")
# > setdiff(getNamespaceExports("base"), ls(envir = asNamespace("base"))) |> deparse() |> cat("  \n", sep="")
c(".GlobalEnv", ".handleSimpleError", ".C", ".set_row_names",  ".NotYetImplemented", ".LC.categories", ".noGenerics", ".cache_class",  ".getRequiredPackages2", ".OptRequireMethods", ".makeMessage",  ".packages", ".amatch_costs", ".External.graphics", ".decode_numeric_version",  ".rowNamesDF<-", ".maskedMsg", ".colSums", ".Primitive", ".S3PrimitiveGenerics",  ".AutoloadEnv", ".Devices", ".userHooksEnv", ".subset", ".gt",  ".Library", ".ArgsEnv", ".popath", ".format.zeros", ".C_R_getTaskCallbackNames",  ".detach", ".kappa_tri", ".getRequiredPackages", ".doWrap", ".col",  ".POSIXct", ".POSIXlt", ".F_dchdc", ".isMethodsDispatchOn", ".gtn",  ".mergeExportMethods", ".primTrace", ".Machine", ".rowMeans",  ".Call", ".expand_R_libs_env_var", ".mergeImportMethods", ".subset2",  ".knownS3Generics", ".deparseOpts", ".row", ".standard_regexps",  ".__H__.rbind", ".signalSimpleWarning", ".External2", ".pretty",  ".Date", ".rowSums", ".formula2varlist", ".difftime", ".NotYetUsed",  ".First.sys", ".F_dqrqy", ".F_dqrxb", ".F_dqrcf", ".Last.value",  ".encode_numeric_version", "..getNamespace", ".F_dqrqty", ".getNamespace",  ".isOpen", ".F_dqrrsd", ".Traceback", ".Library.site", ".packageStartupMessage",  ".Call.graphics", ".C_R_addTaskCallback", ".amatch_bounds", ".S3_methods_table",  ".row_names_info", ".F_dqrdc2", ".leap.seconds", ".mapply", ".C_R_removeTaskCallback",  ".libPaths", ".getNamespaceInfo", ".S3method", ".primUntrace",  ".Options", ".colMeans", ".dynLibs", "...length", ".__H__.cbind",  ".External", ".BaseNamespaceEnv", ".Internal", ".Fortran", ".sys.timezone",  "..deparseOpts", ".TAOCP1997init", ".GenericArgsEnv", ".make_numeric_version",  ".F_dtrco", ".kronecker", ".traceback", ".bincode", ".class2",  ".Deprecated", ".check_tzones", ".doSortWrap", ".rmpkg", ".Platform",  ".__S3MethodsTable__.", "...elt", "...names", ".Script", ".doTrace",  ".Device", ".tryResumeInterrupt", ".valid.factor", ".Defunct" )

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##% loadedNamespaces() ----  
loadedNamespaces() |> deparse() |> cat("  \n", sep="")
# > loadedNamespaces() |> deparse() |> cat("  \n", sep="")
# c("gtable", "dplyr", "compiler", "stats", "tidyselect", "Rcpp",  "tinytex", "zip", "tidyverse", "stringr", "parallel", "tidyr",  "scales", "yaml", "fastmap", "base", "readr", "ggplot2", "R6",  "generics", "openxlsx2", "knitr", "forcats", "datasets", "methods",  "tibble", "munsell", "lubridate", "tzdb", "pillar", "rlang",  "utf8", "stringi", "xfun", "utils", "pkgload", "timechange",  "cli", "withr", "magrittr", "digest", "grid", "rstudioapi", "hms",  "graphics", "lifecycle", "vctrs", "writexl", "evaluate", "glue",  "fansi", "colorspace", "rmarkdown", "purrr", "grDevices", "tools",  "pkgconfig", "htmltools")


# Get all installed packages
installed_packages <- installed.packages()
package_names <- installed_packages[, "Package"]

# Get currently loaded namespaces
loaded_namespaces <- loadedNamespaces()

# Combine both lists and remove duplicates
all_namespaces <- unique(c(loaded_namespaces, package_names))

# Print total number of namespaces and the names
cat("Total possible namespaces (loaded + installed):", length(all_namespaces), "\n")
# print(all_namespaces)
all_namespaces |> deparse() |> cat("  \n", sep="")
# > all_namespaces |> deparse() |> cat("  \n", sep="")
# c("gtable", "dplyr", "compiler", "stats", "tidyselect", "Rcpp",  "tinytex", "zip", "tidyverse", "stringr", "parallel", "tidyr",  "scales", "yaml", "fastmap", "base", "readr", "ggplot2", "R6",  "generics", "openxlsx2", "knitr", "forcats", "datasets", "methods",  "tibble", "munsell", "lubridate", "tzdb", "pillar", "rlang",  "utf8", "stringi", "xfun", "utils", "pkgload", "timechange",  "cli", "withr", "magrittr", "digest", "grid", "rstudioapi", "hms",  "graphics", "lifecycle", "vctrs", "writexl", "evaluate", "glue",  "fansi", "colorspace", "rmarkdown", "purrr", "grDevices", "tools",  "pkgconfig", "htmltools", "arrow", "askpass", "assertthat", "backports",  "base64enc", "BiocManager", "bit", "bit64", "blob", "blogdown",  "bookdown", "brew", "brio", "broom", "bslib", "cachem", "callr",  "cellranger", "clipr", "commonmark", "conflicted", "covr", "cpp11",  "crayon", "credentials", "curl", "data.table", "datapasta", "DBI",  "dbplyr", "desc", "devtools", "DiagrammeR", "diffobj", "distill",  "docopt", "downlit", "dtplyr", "duckdb", "e1071", "ellipsis",  "farver", "fontawesome", "formatR", "fs", "fst", "fstcore", "gargle",  "gdata", "gert", "gh", "gitcreds", "gmodels", "googledrive",  "googlesheets4", "gridExtra", "gtools", "haven", "highr", "htmlwidgets",  "httpuv", "httr", "httr2", "ids", "igraph", "ini", "isoband",  "jquerylib", "jsonlite", "labeling", "labelled", "Lahman", "later",  "lazyeval", "littler", "memoise", "microbenchmark", "mime", "miniUI",  "minqa", "mitools", "modelr", "numDeriv", "nycflights13", "openssl",  "packrat", "patchwork", "pkgbuild", "pkgdown", "PKI", "plogr",  "png", "praise", "prettyunits", "processx", "profvis", "progress",  "promises", "proxy", "ps", "r2d3", "ragg", "rappdirs", "rcmdcheck",  "RColorBrewer", "RcppArmadillo", "readxl", "redland", "rematch",  "rematch2", "remotes", "renv", "reprex", "rex", "rJava", "RMariaDB",  "roxygen2", "RPostgres", "rprojroot", "rsconnect", "RSQLite",  "rticles", "rversions", "rvest", "sass", "selectr", "servr",  "sessioninfo", "shiny", "sourcetools", "survey", "sys", "systemfonts",  "tableone", "testit", "testthat", "textshaping", "tufte", "urlchecker",  "usethis", "uuid", "viridisLite", "visNetwork", "vroom", "waldo",  "webshot", "whisker", "whoami", "xaringan", "xml2", "xopen",  "xtable", "zoo", "boot", "class", "cluster", "codetools", "foreign",  "KernSmooth", "lattice", "MASS", "Matrix", "mgcv", "nlme", "nnet",  "rpart", "spatial", "splines", "stats4", "survival", "tcltk")

# Check if specific special namespaces exist
special_namespaces <- c("base", "Autoloads", "tools")
existing_special_namespaces <- special_namespaces[sapply(special_namespaces, isNamespaceLoaded)]

# Print special namespaces if they exist
# cat("Special namespaces that exist:", existing_special_namespaces, "\n")
existing_special_namespaces |> deparse() |> cat("  \n", sep="")
# > existing_special_namespaces |> deparse() |> cat("  \n", sep="")
# c("base", "tools")


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  





#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
# ### @ .RelativeSubPath, .FileName.source.r ======  
# .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .RelativeSubPath = env1$path$LastSourceEditorContext.path_FileNameExt |> dirname() |> env1$f$f_path.relative()  ;    ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO()    }
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "default.template" |> paste0(".source.r")
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .SourceName_root = env1$path$LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),"")  ;    ".SourceName_root" |> env1$f$f_ObjectName.get.dput.ECHO()    }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.RelativeSubPath = .RelativeSubPath
if(!exists(".SourceName_root") && exists(".FileName.source.r")) .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
.FileName.source.r = .SourceName_root |> paste0(".source.r")
env1$path$.SourceName_root = .SourceName_root
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".source.r")
cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
    "#### ",env1$path$.RelativeSubPath_FileName.dev.r, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r))
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# if(.FileName.source.r |> str_detect("^default")) { packageStartupMessage('.FileName.source.r |> str_detect("^default")') } else {
#     # # if(!file.exists(env1$path$subpath_FileName.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_FileName.dev.r); file.edit(env1$path$subpath_FileName.dev.r); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     # if(!file.exists(env1$path$subpath_FileName.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath_FileName.dev.Rmd); file.edit(env1$path$subpath_FileName.dev.Rmd); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     # if(!file.exists(env1$path$subpath_FileName.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_FileName.source.r); file.edit(env1$path$subpath_FileName.source.r); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     file2open = env1$path$subpath_FileName.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
#     file2open = env1$path$subpath_FileName.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt)
# }


#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# #@@ START) data -----  
# # \$ assign( DSN, read_rds(paste0(.path4read,"/",DSN,".rds")) ) ====  
# # .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # DSN = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# .RelativeSubPath = r"(data)"|>str_replace_all("\\\\","/")
# DSN = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # .RelativeSubPath_FileNameExt = DSN |> paste0(".rds") %>% paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.)
# # .path_FileNameExt = ifelse( file.exists(.RelativeSubPath_FileNameExt), .RelativeSubPath_FileNameExt, paste0(env1$path$source_base_github,"/data/",DSN,".rds") )
# # cat(".path_FileNameExt = ", .path_FileNameExt, "  \n", sep = "")
# # assign( DSN, read_rds(.path_FileNameExt) )
# DSN |> paste0(".rds") %>% paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.) |> read_rds() %>% assign(DSN, value = ., envir = .GlobalEnv)














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

