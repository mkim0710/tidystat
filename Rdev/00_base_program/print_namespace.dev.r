# default.R
# "rstudio-prefs/templates/default.R" |> normalizePath(winslash="/") |> utils::browseURL()
# source(paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R")
# # source("https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/templates/default.R")
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {.CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {.CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### @ .subpath, .sourcename ======





#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) dev -----
# https://chatgpt.com/c/9faf244b-181e-47ec-ae76-841d14f50e0f
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \% search()  -----

### \% search() @ default Rocker 4.3.3
search() |> deparse() |> cat("  \n", sep="") 
c(".GlobalEnv", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")

### \% search() @ default Rocker 4.3.3 + library(tidyverse)
library(tidyverse)
search() |> deparse() |> cat("  \n", sep="") 
c(".GlobalEnv", "package:lubridate", "package:forcats", "package:stringr", "package:dplyr", "package:purrr", "package:readr", "package:tidyr", "package:tibble", "package:ggplot2", "package:tidyverse", "tools:rstudio", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")


### \% search() @ problem with .Rprofile on 2024-07-20
library(tidyverse)
search() |> deparse() |> cat("  \n", sep="") 
c(".GlobalEnv", "tools:rstudio", "package:lubridate", "package:forcats", "package:stringr", "package:dplyr", "package:purrr", "package:readr", "package:tidyr", "package:tibble", "package:ggplot2", "package:tidyverse", "package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "Autoloads", "package:base")  # "tools:rstudio" is loaded after library(tidyverse)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://bookdown.dongzhuoer.com/hadley/r-pkgs/namespace
# https://chatgpt.com/c/027e3714-b507-4e91-a20a-7e4c591be8de
# https://homepage.divms.uiowa.edu/~luke/R/namespaces/morenames.html
# https://chatgpt.com/c/e5eff8f3-6345-4f11-a739-e019bb1ccb82
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
ls(envir = asNamespace("base")) %>%  str
# > ls(envir = asNamespace("base")) %>%  str
#  chr [1:1270] "-" "-.Date" "-.POSIXt" ":" "::" ":::" "!" "!.hexmode" "!.octmode" "!=" "(" "[" "[.AsIs" "[.data.frame" "[.Date" "[.difftime" "[.Dlist" ...
getNamespaceExports("base") %>% str
# > getNamespaceExports("base") %>% str
#  chr [1:1391] "!" "$" "&" "(" "*" "+" "-" "/" ":" "<" "=" ">" "as.matrix.data.frame" "@" "F" "I" "registerS3methods" "as.POSIXct.Date" "T" "[" "^" "c" "q" ...

env1$f$f_vec1_vec2.setdiff(ls(envir = asNamespace("base")), getNamespaceExports("base")) %>% str
# > env1$f$f_vec1_vec2.setdiff(ls(envir = asNamespace("base")), getNamespaceExports("base")) %>% str
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

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
##% loadedNamespaces() ----
loadedNamespaces() |> deparse() |> cat("  \n", sep="")
# > loadedNamespaces() |> deparse() |> cat("  \n", sep="")
# c("gtable", "dplyr", "compiler", "stats", "tidyselect", "Rcpp",  "tinytex", "zip", "tidyverse", "stringr", "parallel", "tidyr",  "scales", "yaml", "fastmap", "base", "readr", "ggplot2", "R6",  "generics", "openxlsx", "knitr", "forcats", "datasets", "methods",  "tibble", "munsell", "lubridate", "tzdb", "pillar", "rlang",  "utf8", "stringi", "xfun", "utils", "pkgload", "timechange",  "cli", "withr", "magrittr", "digest", "grid", "rstudioapi", "hms",  "graphics", "lifecycle", "vctrs", "writexl", "evaluate", "glue",  "fansi", "colorspace", "rmarkdown", "purrr", "grDevices", "tools",  "pkgconfig", "htmltools")


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
# c("gtable", "dplyr", "compiler", "stats", "tidyselect", "Rcpp",  "tinytex", "zip", "tidyverse", "stringr", "parallel", "tidyr",  "scales", "yaml", "fastmap", "base", "readr", "ggplot2", "R6",  "generics", "openxlsx", "knitr", "forcats", "datasets", "methods",  "tibble", "munsell", "lubridate", "tzdb", "pillar", "rlang",  "utf8", "stringi", "xfun", "utils", "pkgload", "timechange",  "cli", "withr", "magrittr", "digest", "grid", "rstudioapi", "hms",  "graphics", "lifecycle", "vctrs", "writexl", "evaluate", "glue",  "fansi", "colorspace", "rmarkdown", "purrr", "grDevices", "tools",  "pkgconfig", "htmltools", "arrow", "askpass", "assertthat", "backports",  "base64enc", "BiocManager", "bit", "bit64", "blob", "blogdown",  "bookdown", "brew", "brio", "broom", "bslib", "cachem", "callr",  "cellranger", "clipr", "commonmark", "conflicted", "covr", "cpp11",  "crayon", "credentials", "curl", "data.table", "datapasta", "DBI",  "dbplyr", "desc", "devtools", "DiagrammeR", "diffobj", "distill",  "docopt", "downlit", "dtplyr", "duckdb", "e1071", "ellipsis",  "farver", "fontawesome", "formatR", "fs", "fst", "fstcore", "gargle",  "gdata", "gert", "gh", "gitcreds", "gmodels", "googledrive",  "googlesheets4", "gridExtra", "gtools", "haven", "highr", "htmlwidgets",  "httpuv", "httr", "httr2", "ids", "igraph", "ini", "isoband",  "jquerylib", "jsonlite", "labeling", "labelled", "Lahman", "later",  "lazyeval", "littler", "memoise", "microbenchmark", "mime", "miniUI",  "minqa", "mitools", "modelr", "numDeriv", "nycflights13", "openssl",  "packrat", "patchwork", "pkgbuild", "pkgdown", "PKI", "plogr",  "png", "praise", "prettyunits", "processx", "profvis", "progress",  "promises", "proxy", "ps", "r2d3", "ragg", "rappdirs", "rcmdcheck",  "RColorBrewer", "RcppArmadillo", "readxl", "redland", "rematch",  "rematch2", "remotes", "renv", "reprex", "rex", "rJava", "RMariaDB",  "roxygen2", "RPostgres", "rprojroot", "rsconnect", "RSQLite",  "rticles", "rversions", "rvest", "sass", "selectr", "servr",  "sessioninfo", "shiny", "sourcetools", "survey", "sys", "systemfonts",  "tableone", "testit", "testthat", "textshaping", "tufte", "urlchecker",  "usethis", "uuid", "viridisLite", "visNetwork", "vroom", "waldo",  "webshot", "whisker", "whoami", "xaringan", "xml2", "xopen",  "xtable", "zoo", "boot", "class", "cluster", "codetools", "foreign",  "KernSmooth", "lattice", "MASS", "Matrix", "mgcv", "nlme", "nnet",  "rpart", "spatial", "splines", "stats4", "survival", "tcltk")

# Check if specific special namespaces exist
special_namespaces <- c("base", "Autoloads", "tools")
existing_special_namespaces <- special_namespaces[sapply(special_namespaces, isNamespaceLoaded)]

# Print special namespaces if they exist
# cat("Special namespaces that exist:", existing_special_namespaces, "\n")
existing_special_namespaces |> deparse() |> cat("  \n", sep="")
# > existing_special_namespaces |> deparse() |> cat("  \n", sep="")
# c("base", "tools")


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
# ### @ .subpath, .sourcename ======
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
# .subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename)
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
# # source( file.path(env1$path$source_base,subpath.filename.source.r) )
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$.subpath = .subpath
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$.sourcename_root = .sourcename_root  
# env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
# env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
# env1$path$.subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename |> str_detect("^default")) { packageStartupMessage('sourcename |> str_detect("^default")') } else {
#     # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); file.edit(env1$path$subpath.filename.dev.r); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#     # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); file.edit(env1$path$subpath.filename.dev.Rmd); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#     # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); file.edit(env1$path$subpath.filename.source.r); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#     file2open = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#     file2open = env1$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
# }


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# #@@ START) data -----
# # \$ assign( DataSetName, read_rds(paste0(.path4read,"/",DataSetName,".rds")) ) ====
# # .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# .subpath = "data"
# DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# path.filename.ext = ifelse(
#     file.exists(paste0(subpath,"/",DataSetName,".rds"))
#     , paste0(subpath,"/",DataSetName,".rds")
#     , paste0(env1$path$source_base_github,"/",subpath,"/",DataSetName,".rds")
# )
# cat("path.filename.ext = ", path.filename.ext, "\n", sep = "")
# assign( DataSetName, read_rds(path.filename.ext) )














#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

