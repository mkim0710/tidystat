# .sourcename_root = "f_table1.flextable"  
#### Rdev/60_communicate_report_export/f_table1.flextable.dev.r----  
#### Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd----  
#### Rdev/60_communicate_report_export/f_table1.flextable.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_table1.flextable.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.source.r")  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.source.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext)); 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
#### env1$path$.subpath.filename.source.r ----  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.subpath = env1$path$CurrentSource.path.filename.ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.sourcename_root = env1$path$CurrentSource.path.filename.ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename_root" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.subpath = .subpath
if(!exists(".sourcename_root") && exists(".sourcename")) .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
.sourcename = .sourcename_root |> paste0(".source.r")
env1$path$.sourcename_root = .sourcename_root
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".source.r")
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# env1 = env0
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ f_stats_table.flextable_JAMA =  ----  
## -> included in "f_df.t.tribble_construct.source.r"? Not Yet
# https://chatgpt.com/c/66ef713d-52ac-800e-aca5-ac9bb72d680b
# /github_tidystat/Rdev/60_communicate_report_export/f_table1_print_df.flextable.source.r
.tmp$objectname = "f_stats_table.flextable_JAMA"
.tmp$object  <- function(DataSet, VarNames4Exposure = c("InterventionGroup"), Varnames_factor.exclude = NULL, addOverall = TRUE, includeNA = TRUE, print.Varnames_nonnormal = NULL, print.showAllLevels = TRUE) {
    
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  











#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ END ----  

