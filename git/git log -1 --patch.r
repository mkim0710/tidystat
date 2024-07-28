'git log -1 --stat' |> system(intern=TRUE) |> cat(sep='\n')
#' > 'git log -1 --stat' |> system(intern=TRUE) |> cat(sep='\n')
#' commit afe6c085f7184556d2e8b18f109148a1923aabfc
#' Author: mkim0710@RStudio.Cloud <mkim0710@gmail.com>
#' Date:   Fri May 17 09:08:20 2024 +0000
#' 
#'     @ Posit.Cloud
#' 
#'  rstudio-prefs/templates/default.R | 2 ++
#'  1 file changed, 2 insertions(+)
#'  
'git log -1 --patch' |> system(intern=TRUE) |> cat(sep='\n')
#' > 'git log -1 --patch' |> system(intern=TRUE) |> cat(sep='\n')
#' commit afe6c085f7184556d2e8b18f109148a1923aabfc
#' Author: mkim0710@RStudio.Cloud <mkim0710@gmail.com>
#' Date:   Fri May 17 09:08:20 2024 +0000
#' 
#'     @ Posit.Cloud
#' 
#' diff --git a/rstudio-prefs/templates/default.R b/rstudio-prefs/templates/default.R
#' index 74a2986..b4ab7a4 100644
#' --- a/rstudio-prefs/templates/default.R
#' +++ b/rstudio-prefs/templates/default.R
#' @@ -24,7 +24,9 @@ if(!exists("env1", envir=.GlobalEnv)) assign("env1", new.env(), envi
#'  ## env1\$path ====
#'  # path2look = "/"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE)
#'  # path2look = "~"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE)
#' +# # "/cloud/home/r149319" @ Posit.Cloud
#'  # path2look = "."; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE)
#' +# # "/cloud/project" @ Posit.Cloud
#'  if(!"path" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$path <- list() }  
#'  objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  
#'  objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  
 
