# sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r")
# f_path.df_dirs_recursive.df_files.dev.r
# f_path.df_dirs_recursive.df_files.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_path.df_dirs_recursive.df_files.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/f_path.df_dirs_recursive.df_files.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/f_path.df_dirs_recursive.df_files.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/f_path.df_dirs_recursive.df_files.source.r")
# gitignore_escaped_select.UC.regex from gitignore.Rmd
# f_vec.extract_non_alphanumeric_list.dev.r
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
# "https://github.com/mkim0710/tidystat/blob/master/.Rprofile" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  ;  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  ;  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n") ; 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  ;   
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  ;   
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
#@@ START) source -----
### \$ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$subpath = subpath
sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
env1$path$sourcename_root = sourcename_root  
env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
cat("# ",'sourcename_root = "',sourcename_root,'"', "  \n",
    "# ",sourcename_root,".dev.r", "  \n",
    "# ",sourcename_root,".dev.Rmd", "  \n",
    "# ",sourcename_root,".source.r", "  \n",
    '# # source("',env1$path$source_base,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'"); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'"); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'"); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});', "  \n",
    sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
# subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); 
# if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  


#@ input_path = "Rdev" =====
library(tidyverse)
dir(full.names = FALSE) |> str() #----
dir(full.names = T) |> str() #----
# dir(full.names = T, recursive = T) |> str() #----
# input_path = "Rdev"
# dir(input_path, full.names = T, recursive = T) |> str() #----
# dir(input_path, full.names = T, recursive = T, include.dirs = T) |> str() #----
# setdiff( dir(input_path, full.names = T, recursive = T, include.dirs = T), dir(input_path, full.names = T, recursive = T) ) |> str() #----
# list.dirs(input_path, full.names = TRUE) |> str() #----
# # > dir(full.names = FALSE) |> str() #----
# #  chr [1:37] "-info" "-tmp" "-void.r" "[[Stat]] CRAN R - Shortcut.lnk" "bfg-1.13.0.jar" "bfg.txt" "bfg.zip" ...
# # > dir(full.names = T) |> str() #----
# #  chr [1:37] "./-info" "./-tmp" "./-void.r" "./[[Stat]] CRAN R - Shortcut.lnk" "./bfg-1.13.0.jar" "./bfg.txt" "./bfg.zip" ...
# # > dir(full.names = T, recursive = T) |> str() #----
# #  chr [1:444] "./-info/facets_2017 - annotate (3) tableone_by_P_WH.ge.5.zip" "./-info/facets_2017 - annotate.xlsx - 바로 가기.lnk" ...
# # > input_path = "Rdev"
# # > dir(input_path, full.names = T, recursive = T) |> str() #----
# #  chr [1:231] "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# # > dir(input_path, full.names = T, recursive = T, include.dirs = T) |> str() #----
# #  chr [1:273] "Rdev/-dev" "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# # > setdiff( dir(input_path, full.names = T, recursive = T, include.dirs = T), dir(input_path, full.names = T, recursive = T) ) |> str() #----
# #  chr [1:42] "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" "Rdev/00_protocol/01_sample_size" ...
# # > list.dirs(input_path, full.names = TRUE) |> str() #----
# #  chr [1:43] "Rdev" "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" "Rdev/00_protocol/01_sample_size" ...




library(tidyverse)


#@ source(file.path(.GlobalEnv$env1$source[[paste0("source.", .GlobalEnv$env1$source$tmp_objectname)]]$path, .GlobalEnv$env1$source[[paste0("source.", .GlobalEnv$env1$source$tmp_objectname)]]$filename)) ----
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(!exists("env1", envir=.GlobalEnv)) { assign("env1", new.env(), envir=.GlobalEnv) }  ;  
if(!"path" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$path <- list() }  ;  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  ;  
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  ;  
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github);
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  ;  
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  ;  
objectname = "path1"; object = env1$path$path0 |> paste0("/") |> paste0(env1$path$getwd |> str_replace(fixed(env1$path$path0), "") |> str_extract("[^/]+")); if(!objectname %in% names(.GlobalEnv$env1$path)) {.GlobalEnv$env1$path[[objectname]] = object}  ;  
### env1\$env.internal ====
if(!"env.internal" %in% names(.GlobalEnv$env1)) {
    sourcename = "env1$env.internal" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ====
if(!"f_path.df_dirs_recursive.df_files" %in% names(.GlobalEnv$env1)) {
    sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
}




#@ df_dirs_recursive = "Rdev" %>% f_path.df_dirs_recursive.df_files() =======
df_dirs_recursive = env1$env.internal$f_path.df_dirs_recursive.df_files()
df_dirs_recursive |> str(max.level = 2) #----
# df_dirs_recursive %>% {.$full_path} |> sort() |> paste(collapse="") |> cat("  \n", sep="") #----
# df_dirs_recursive %>% {.$path.basename} |> sort() |> paste(collapse="") |> cat("  \n", sep="")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) |> as_tibble() |> print(n=99) #----
# df_dirs_recursive %>% select(print_tree_path) |> as_tibble()
df_dirs_recursive %>% select(print_tree_path) |> unlist() |> paste(collapse = "\n") |> cat("  \n", sep="")  #----
df_dirs_recursive %>% select(print_tree_path_files) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")  #----
df_dirs_recursive %>% select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")  #----
# > df_dirs_recursive = f_path.df_dirs_recursive.df_files()
# .Platform$file.sep:  / 
# input_path0:  . 
# Finished iterating through paths.
#' > df_dirs_recursive |> str(max.level = 2) #----
#' tibble [61 × 17] (S3: tbl_df/tbl/data.frame)
#'  $ path.level               : num [1:61] 0 1 1 2 2 2 3 3 3 3 ...
#'  $ path                     : chr [1:61] "" "-info" "Rdev" "Rdev/-dev" ...
#'  $ path.basename            : chr [1:61] "." "-info" "Rdev" "-dev" ...
#'  $ path.parent              : chr [1:61] "." "." "." "./Rdev" ...
#'  $ full_path                : chr [1:61] "." "./-info" "./Rdev" "./Rdev/-dev" ...
#'  $ normalized_path          : chr [1:61] "D:/OneDrive/[][Rproject]/github_tidystat" "D:/OneDrive/[][Rproject]/github_tidystat/-info" "D:/OneDrive/[][Rproject]/github_tidystat/Rdev" "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/-dev" ...
#'  $ print_tree_path          : chr [1:61] "." "-info" "Rdev" "\t-dev" ...
#'  $ files                    :List of 61
#'  $ files.r                  :List of 61
#'  $ files.rmd                :List of 61
#'  $ files.rds                :List of 61
#'  $ files.rda                :List of 61
#'  $ print_tree_path_files    : chr [1:61] "@./\n-info\nbfg-1.13.0.jar\nbfg.txt\ndata\nEncoding.txt\nenv1$env.internal.source.r\nenv1.fun.t.tri"| __truncated__ "@-info/\n\tFACETS_data_2017.NA.NonLatino.tableone_by_P_WH.ge.5 -annotate.xlsx\n\tJK2079.GY20CCW.bind_rows0213.M"| __truncated__ "@Rdev/\n\t-dev\n\t00_base_program\n\t00_protocol\n\t10_import_clean_datatype\n\t20_tidy_group_by_match\n\t30_tr"| __truncated__ "@\t-dev/\n" ...
#'  $ print_tree_path_files.r  : chr [1:61] "@./\n-void.r\nenv1$env.internal.source.r\nenv1.fun.t.tibble.dev -tmp.r\nenv1.fun.t.tribble_co"| __truncated__ "@-info/\n" "@Rdev/\n\tdata.variable.Date.nID_anyTRUE_allTRUE.dev.r\n\tdata.variable.Date.nID_TRUE_NA.dev.r\n\tflowchart_inc"| __truncated__ "@\t-dev/\n\t\tobject.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r\n" ...
#'  $ print_tree_path_files.codes: chr [1:61] "@./\nf_df.t.tribble_construct -old.Rmd\nf_df.t.tribble_construct.Rmd\n" "@-info/\n" "@Rdev/\n" "@\t-dev/\n" ...
#'  $ print_tree_path_files.rds: chr [1:61] "@./\n" "@-info/\n" "@Rdev/\n" "@\t-dev/\n" ...
#'  $ print_tree_path_files.rda: chr [1:61] "@./\nf_df.t.tribble_construct.RData.xz\n" "@-info/\n" "@Rdev/\n" "@\t-dev/\n" ...
#' > # df_dirs_recursive %>% {.$full_path} |> sort() |> paste(collapse="") |> cat("  \n", sep="") #----
#' > # df_dirs_recursive %>% {.$path.basename} |> sort() |> paste(collapse="") |> cat("  \n", sep="")  #----
#' > df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) |> as_tibble() |> print(n=99) #----
#' # A tibble: 61 × 5
#'    path.level path.parent                                      path.basename                             path                                            full_path
#'         <dbl> <chr>                                            <chr>                                     <chr>                                           <chr>    
#'  1          0 .                                                .                                         ""                                              .        
#'  2          1 .                                                -info                                     "-info"                                         ./-info  
#'  3          1 .                                                Rdev                                      "Rdev"                                          ./Rdev   
#'  4          2 ./Rdev                                           -dev                                      "Rdev/-dev"                                     ./Rdev/-…
#'  5          2 ./Rdev                                           00_base_program                           "Rdev/00_base_program"                          ./Rdev/0…
#'  6          2 ./Rdev                                           00_protocol                               "Rdev/00_protocol"                              ./Rdev/0…
#'  7          3 ./Rdev/00_protocol                               01_sample_size                            "Rdev/00_protocol/01_sample_size"               ./Rdev/0…
#'  8          3 ./Rdev/00_protocol                               05_count_eligible                         "Rdev/00_protocol/05_count_eligible"            ./Rdev/0…
#'  9          3 ./Rdev/00_protocol                               06_count_exposure                         "Rdev/00_protocol/06_count_exposure"            ./Rdev/0…
#' 10          3 ./Rdev/00_protocol                               07_count_outcome                          "Rdev/00_protocol/07_count_outcome"             ./Rdev/0…
#' 11          2 ./Rdev                                           10_import_clean_datatype                  "Rdev/10_import_clean_datatype"                 ./Rdev/1…
#' 12          3 ./Rdev/10_import_clean_datatype                  11_metadata                               "Rdev/10_import_clean_datatype/11_metadata"     ./Rdev/1…
#' 13          3 ./Rdev/10_import_clean_datatype                  12_import_files                           "Rdev/10_import_clean_datatype/12_import_files" ./Rdev/1…
#' 14          3 ./Rdev/10_import_clean_datatype                  12_import_sqlite                          "Rdev/10_import_clean_datatype/12_import_sqlit… ./Rdev/1…
#' 15          3 ./Rdev/10_import_clean_datatype                  12_import_vocabulary                      "Rdev/10_import_clean_datatype/12_import_vocab… ./Rdev/1…
#' 16          3 ./Rdev/10_import_clean_datatype                  13_duplicated                             "Rdev/10_import_clean_datatype/13_duplicated"   ./Rdev/1…
#' 17          3 ./Rdev/10_import_clean_datatype                  13_missing_value                          "Rdev/10_import_clean_datatype/13_missing_valu… ./Rdev/1…
#' 18          3 ./Rdev/10_import_clean_datatype                  13_split_fold                             "Rdev/10_import_clean_datatype/13_split_fold"   ./Rdev/1…
#' 19          3 ./Rdev/10_import_clean_datatype                  15_cleaning_text                          "Rdev/10_import_clean_datatype/15_cleaning_tex… ./Rdev/1…
#' 20          3 ./Rdev/10_import_clean_datatype                  15_cleaning_time                          "Rdev/10_import_clean_datatype/15_cleaning_tim… ./Rdev/1…
#' 21          3 ./Rdev/10_import_clean_datatype                  16_categorical_factor                     "Rdev/10_import_clean_datatype/16_categorical_… ./Rdev/1…
#' 22          3 ./Rdev/10_import_clean_datatype                  17_categorical_indicators                 "Rdev/10_import_clean_datatype/17_categorical_… ./Rdev/1…
#' 23          3 ./Rdev/10_import_clean_datatype                  18_dichotomous_logical                    "Rdev/10_import_clean_datatype/18_dichotomous_… ./Rdev/1…
#' 24          3 ./Rdev/10_import_clean_datatype                  19_datetime                               "Rdev/10_import_clean_datatype/19_datetime"     ./Rdev/1…
#' 25          3 ./Rdev/10_import_clean_datatype                  19_numeric_integer                        "Rdev/10_import_clean_datatype/19_numeric_inte… ./Rdev/1…
#' 26          3 ./Rdev/10_import_clean_datatype                  array_list                                "Rdev/10_import_clean_datatype/array_list"      ./Rdev/1…
#' 27          2 ./Rdev                                           20_tidy_group_by_match                    "Rdev/20_tidy_group_by_match"                   ./Rdev/2…
#' 28          3 ./Rdev/20_tidy_group_by_match                    23_group_by_PersonID                      "Rdev/20_tidy_group_by_match/23_group_by_Perso… ./Rdev/2…
#' 29          3 ./Rdev/20_tidy_group_by_match                    25_study_population                       "Rdev/20_tidy_group_by_match/25_study_populati… ./Rdev/2…
#' 30          3 ./Rdev/20_tidy_group_by_match                    27_match                                  "Rdev/20_tidy_group_by_match/27_match"          ./Rdev/2…
#' 31          2 ./Rdev                                           30_transform_scale_categorical            "Rdev/30_transform_scale_categorical"           ./Rdev/3…
#' 32          2 ./Rdev                                           40_visualize_explore_bivariate_stratified "Rdev/40_visualize_explore_bivariate_stratifie… ./Rdev/4…
#' 33          3 ./Rdev/40_visualize_explore_bivariate_stratified 43_network                                "Rdev/40_visualize_explore_bivariate_stratifie… ./Rdev/4…
#' 34          3 ./Rdev/40_visualize_explore_bivariate_stratified 44_map                                    "Rdev/40_visualize_explore_bivariate_stratifie… ./Rdev/4…
#' 35          3 ./Rdev/40_visualize_explore_bivariate_stratified 45_bivariate_measures                     "Rdev/40_visualize_explore_bivariate_stratifie… ./Rdev/4…
#' 36          3 ./Rdev/40_visualize_explore_bivariate_stratified 47_bivariate_partial_stratified           "Rdev/40_visualize_explore_bivariate_stratifie… ./Rdev/4…
#' 37          2 ./Rdev                                           50_model_formula_evaluation               "Rdev/50_model_formula_evaluation"              ./Rdev/5…
#' 38          3 ./Rdev/50_model_formula_evaluation               51_model_formula                          "Rdev/50_model_formula_evaluation/51_model_for… ./Rdev/5…
#' 39          3 ./Rdev/50_model_formula_evaluation               53_model_selection                        "Rdev/50_model_formula_evaluation/53_model_sel… ./Rdev/5…
#' 40          3 ./Rdev/50_model_formula_evaluation               55_model_weighted                         "Rdev/50_model_formula_evaluation/55_model_wei… ./Rdev/5…
#' 41          3 ./Rdev/50_model_formula_evaluation               56_model_bootstrap                        "Rdev/50_model_formula_evaluation/56_model_boo… ./Rdev/5…
#' 42          3 ./Rdev/50_model_formula_evaluation               57_model_time2event                       "Rdev/50_model_formula_evaluation/57_model_tim… ./Rdev/5…
#' 43          3 ./Rdev/50_model_formula_evaluation               57_model_trajectory                       "Rdev/50_model_formula_evaluation/57_model_tra… ./Rdev/5…
#' 44          3 ./Rdev/50_model_formula_evaluation               59_model_evaluation                       "Rdev/50_model_formula_evaluation/59_model_eva… ./Rdev/5…
#' 45          2 ./Rdev                                           60_communicate_report_export              "Rdev/60_communicate_report_export"             ./Rdev/6…
#' 46          1 .                                                Rmd                                       "Rmd"                                           ./Rmd    
#' 47          1 .                                                Rplot                                     "Rplot"                                         ./Rplot  
#' 48          1 .                                                data                                      "data"                                          ./data   
#' 49          2 ./data                                           ATC_RxNorm_NDC                            "data/ATC_RxNorm_NDC"                           ./data/A…
#' 50          1 .                                                examples                                  "examples"                                      ./exampl…
#' 51          1 .                                                other                                     "other"                                         ./other  
#' 52          2 ./other                                          Bash                                      "other/Bash"                                    ./other/…
#' 53          2 ./other                                          Batch                                     "other/Batch"                                   ./other/…
#' 54          2 ./other                                          C                                         "other/C"                                       ./other/C
#' 55          2 ./other                                          Excel                                     "other/Excel"                                   ./other/…
#' 56          2 ./other                                          ODBC                                      "other/ODBC"                                    ./other/…
#' 57          2 ./other                                          SAS                                       "other/SAS"                                     ./other/…
#' 58          2 ./other                                          Stata                                     "other/Stata"                                   ./other/…
#' 59          2 ./other                                          VBA                                       "other/VBA"                                     ./other/…
#' 60          1 .                                                tests                                     "tests"                                         ./tests  
#' 61          1 .                                                vignettes                                 "vignettes"                                     ./vignet…
#' > # df_dirs_recursive %>% select(print_tree_path) |> as_tibble()
#' > df_dirs_recursive %>% select(print_tree_path) |> unlist() |> paste(collapse = "\n") |> cat("  \n", sep="")  #----
#' .
#' -info
#' Rdev
#' 	-dev
#' 	00_base_program
#' 	00_protocol
#' 		01_sample_size
#' 		05_count_eligible
#' 		06_count_exposure
#' 		07_count_outcome
#' 	10_import_clean_datatype
#' 		11_metadata
#' 		12_import_files
#' 		12_import_sqlite
#' 		12_import_vocabulary
#' 		13_duplicated
#' 		13_missing_value
#' 		13_split_fold
#' 		15_cleaning_text
#' 		15_cleaning_time
#' 		16_categorical_factor
#' 		17_categorical_indicators
#' 		18_dichotomous_logical
#' 		19_datetime
#' 		19_numeric_integer
#' 		array_list
#' 	20_tidy_group_by_match
#' 		23_group_by_PersonID
#' 		25_study_population
#' 		27_match
#' 	30_transform_scale_categorical
#' 	40_visualize_explore_bivariate_stratified
#' 		43_network
#' 		44_map
#' 		45_bivariate_measures
#' 		47_bivariate_partial_stratified
#' 	50_model_formula_evaluation
#' 		51_model_formula
#' 		53_model_selection
#' 		55_model_weighted
#' 		56_model_bootstrap
#' 		57_model_time2event
#' 		57_model_trajectory
#' 		59_model_evaluation
#' 	60_communicate_report_export
#' Rmd
#' Rplot
#' data
#' 	ATC_RxNorm_NDC
#' examples
#' other
#' 	Bash
#' 	Batch
#' 	C
#' 	Excel
#' 	ODBC
#' 	SAS
#' 	Stata
#' 	VBA
#' tests
#' vignettes
#' > df_dirs_recursive %>% select(print_tree_path_files) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")  #----
#' @./
#' -info
#' bfg-1.13.0.jar
#' bfg.txt
#' data
#' Encoding.txt
#' env1$env.internal.source.r
#' f_df.t.tribble_construct -old.Rmd
#' f_df.t.tribble_construct.dev.r
#' f_df.t.tribble_construct.Rmd
#' f_df.t.tribble_construct.source -old.r
#' f_df.t.tribble_construct.source.r
#' examples
#' f_clipboard_path_BackSlash.to_URL.dev.r
#' f_df.add_UC.dev.r
#' f_path.df_dirs_recursive.dev.r
#' f_path.df_dirs_recursive.df_files.dev.r
#' f_path.df_dirs_recursive.df_files.dev.r.xz
#' f_path.df_dirs_recursive.df_files.source.r
#' f_vec.extract_non_alphanumeric_list.dev.r
#' get_system_info.dev.r
#' get_system_info.source.r
#' git automatic commit.r
#' git merge conflicts.r
#' gitignore_escaped_select from gitignore.r
#' library(checkpoint).r
#' other
#' Rdev
#' README.md
#' Removing sensitive data from a repository.url
#' Rmd
#' Rplot
#' RStudio.Cloud set up.r
#' svyglm 10var vs 10var.inter.xlsx
#' tests
#' vignettes
#' @-info/
#' 	FACETS_data_2017.NA.NonLatino.tableone_by_P_WH.ge.5 -annotate.xlsx
#' 	JK2079.GY20CCW.bind_rows0213.MIN_Date.ge365.CC69.JAMIA21.CreateTableOne.by_SEX -annotate.xlsx
#' @Rdev/
#' 	-dev
#' 	00_base_program
#' 	00_protocol
#' 	10_import_clean_datatype
#' 	20_tidy_group_by_match
#' 	30_transform_scale_categorical
#' 	40_visualize_explore_bivariate_stratified
#' 	50_model_formula_evaluation
#' 	60_communicate_report_export
#' 	data.variable.Date.nID_anyTRUE_allTRUE.dev.r
#' 	data.variable.Date.nID_TRUE_NA.dev.r
#' 	flowchart_inclusion_exclusions.dev.r
#' 	f_df.transpose.dev.r
#' 	f_path.size_files.dev.r
#' 	fun.split_save_ICD1.dev.r
#' 	function.combination.dev.r
#' 	function.cross_join.dev.r
#' 	function.matrix.dev.r
#' 	function.p.observed_value.distribution_vector.dev.r
#' 	function.pairwise.data_frame.dev.r
#' 	function.tensor_product.dev.r
#' 	list.PERSON_ID.setdiff.diagram.n grViz().r
#' 	vector.setdiff.dev.r
#' @	-dev/
#' @	00_base_program/
#' 		function.alarm.dev.r
#' 		function.attach.dev.r
#' 		function.calculate_mode.dev.r
#' 		function.checkpoint.dev.r
#' 		function.compiler.dev.r
#' 		function.convert_to_standard_name.dev.r
#' 		function.deparse.cat.width.dev.r
#' 		function.dput.dev.r
#' 		function.eval.parse.Vectorize.dev.r
#' 		function.file.path.dev.r
#' 		function.FindDuplicateFiles.dev.r
#' 		function.frequencyDF.dev.r
#' 		function.group_by.do.dev.r
#' 		function.hangul.dev.r
#' 		function.iconv.dev.r
#' 		function.install.packages.dev.r
#' 		function.object.str_summary.dev.r
#' 		function.pipe.dev.r
#' 		function.print.options.dev.r
#' 		function.read_encoded_csv.dev.r
#' 		function.readClipboard.dev.r
#' 		function.rm_attr.dev.r
#' 		function.safe_sum.dev.r
#' 		function.show_c_source.dev.r
#' 		function.Stata2R.dev.r
#' 		function.str.dev.r
#' 		function.str2.longest_common_prefix.dev.r
#' 		function.Sys.setenv.dev.r
#' 		function.text2quo.dev.r
#' 		function.transpose_tibble.dev.r
#' 		function.write_rds.xz.dev.r
#' 		library(dplyr) nest().r
#' 		map.parent_name.dev.r
#' 		objectname.write_rds.dev.r
#' 		options.r
#' 		Rprofile.r
#' 		Rsnapshot.r
#' @	00_protocol/
#' 		01_sample_size
#' 		05_count_eligible
#' 		06_count_exposure
#' 		07_count_outcome
#' @		01_sample_size/
#' 			Rstata power cox.r
#' 			Rstata power mcc.r
#' 			Rstata power onemean twomeans.r
#' 			Rstata power oneproportion twoproportions.r
#' 			Sample size for diagnostic test.r
#' @		05_count_eligible/
#' @		06_count_exposure/
#' @		07_count_outcome/
#' @	10_import_clean_datatype/
#' 		11_metadata
#' 		12_import_files
#' 		12_import_sqlite
#' 		12_import_vocabulary
#' 		13_duplicated
#' 		13_missing_value
#' 		13_split_fold
#' 		15_cleaning_text
#' 		15_cleaning_time
#' 		16_categorical_factor
#' 		17_categorical_indicators
#' 		18_dichotomous_logical
#' 		19_datetime
#' 		19_numeric_integer
#' 		array_list
#' @		11_metadata/
#' 			fun.data.primarykey.dev.r
#' 			function.metadata.dev.r
#' @		12_import_files/
#' 			dir() read_dta() write_rds().r
#' 			dir() read_rda() write_rds().r
#' 			dir() read_rds(filenames2read).r
#' 			dir() read_sas() write_rds().r
#' 			function.list.files.file.info.dev.r
#' 			function.list.files.read.sqlite.dev.r
#' 			function.read_excel_allsheets.dev.r
#' 			read.csv(Population-UTF-8.CSV).r
#' @		12_import_sqlite/
#' 			function.sqlite.dbListTables.dbListFields.ifelse.bindcols.dev.r
#' 			function.sqlite.index.dev.r
#' 			function.sqlite.tbl.dev.r
#' @		12_import_vocabulary/
#' 			ATC_RxNorm_NDC from .r
#' 			function.OMOP_CommonDataModel.ATC_to_NDC.dev.r
#' 			function.OMOP_CommonDataModel.RxNorm_to_NDC.dev.r
#' @		13_duplicated/
#' 			data.duplicated.dev.r
#' 			function.left_anti_join.dev.r
#' @		13_missing_value/
#' 			data.mutate_at.rename_at.dev.r
#' 			data.NA.recode.dev.r
#' 			data.NotNA_p_df.dev.r
#' 			data.nproptable.dev.r
#' 			data.rm_cols_na.dev.r
#' 			data.summarize_all_sum_is.na.dev.r
#' @		13_split_fold/
#' 			function.vec.fold.index.dev.r
#' @		15_cleaning_text/
#' 			function.character.clean.dev.r
#' 			function.cleanHTML.dev.r
#' 			function.compareSentences.dev.r
#' 			function.RegEx.except.dev.r
#' 			function.sequence_with_leading_zeros.dev.r
#' 			function.str_extract_dose.dev.r
#' 			function.str_split_subset.dev.r
#' 			function.string.mutate.dev.r
#' 			function.vector.filterRegEx.dev.r
#' @		15_cleaning_time/
#' 			function.add_months.dev.r
#' 			function.floor_month.dev.r
#' 			function.time_since_t0.dev.r
#' 			function.YYYYMM_to_Date.dev.r
#' @		16_categorical_factor/
#' 			add.Date_ICD_chapter.dev.r
#' 			data.add_AgeGroup_Decade.dev.r
#' 			data.add_BMI.cut4.dev.r
#' 			data.add_BP_HTN_140_90.dev.r
#' 			data.add_FPG_ge100lt126.dev.r
#' 			data.add_IncomeQuartile_MedicalAid.dev.r
#' 			data.recode_Sex.dev.r
#' 			data_frame.map_df.as.factor.dev.r
#' 			function.cut_quartile.dev.r
#' @		17_categorical_indicators/
#' 			function.df_dummy2factor.dev.r
#' 			function.df_factor.one_hot_encode.dev.r
#' 			function.indicators2factor.dev.r
#' @		18_dichotomous_logical/
#' 			function.dichotomous2logical.dev.r
#' 			function.ExpressionText2StandardName.dev.r
#' 			function.is2level.dev.r
#' 			function.mutate_all.apply_ExpressionText.dev.r
#' @		19_datetime/
#' 			function.Time2RelativeTime.dev.r
#' @		19_numeric_integer/
#' 			function.check.integer.dev.r
#' 			function.check.integer.microbenchmark.r
#' 			function.df_continuous_vars.normalize.dev.r
#' 			function.numeric2integer.dev.r
#' @		array_list/
#' 			function.list_df2array.dev.r
#' 			function.vector2list.dev.r
#' 			help.array.r
#' 			list_list.to.data_frame.dev.r
#' 			list3d.to.array3d.dev.r
#' @	20_tidy_group_by_match/
#' 		23_group_by_PersonID
#' 		25_study_population
#' 		27_match
#' 		data.ExposedUnexposed.list.dev.r
#' @		23_group_by_PersonID/
#' 			data.byID_filter_min_rank.dev.r
#' 			data.byID_filter_minDate_maxDate.dev.r
#' 			function.filter.PrimaryKey_duplicated.dev.r
#' @		25_study_population/
#' 			data.drop_pmhx_negativetime.dev.r
#' 			tblPersonID_FilterName.ndDate.append_FilterRegexMet.dev.r
#' 			tblPersonID_FilterName.ndDate_CriteriaID.lgl.dev.r
#' @		27_match/
#' 			data.stratified.ccwc.dev.r
#' 			data.stratified.Match.dev.r
#' 			function.MatchingPairID_Exposed_Unexposed_shuffle.dev.r
#' 			function.MatchingPairID_Exposed_Unexposed_shuffle.microbenchmark.r
#' @	30_transform_scale_categorical/
#' 		data.recode.factor.dev.r
#' 		function.cut.quantile.dev.r
#' 		function.df2df_wave.dev.r
#' 		function.df2df_wave_cumulative.dev.r
#' 		function.df2matrix_wave.dev.r
#' 		function.rz_transformation.dev.r
#' @	40_visualize_explore_bivariate_stratified/
#' 		43_network
#' 		44_map
#' 		45_bivariate_measures
#' 		47_bivariate_partial_stratified
#' 		data.conditional_expectation.dev.r
#' 		data.ggplot.dev.r
#' @		43_network/
#' 			data.lgl.comat.gather.dev.r
#' 			data.lgl.comat.gather.microbenchmark.r
#' 			data_V1_V2_EdgeWeight.igraph.dev.r
#' 			data_V1_V2_EdgeWeight.statnet.df.dev.r
#' @		44_map/
#' 			function.MK.ClinicCluster.dev.r
#' 			function.MK.ClinicCluster.source) Run This.r
#' 			function.MK.Cluster4NoSingle.dev.r
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance10$Min.Pop10000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance10$Min.Pop30000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance30$Min.Pop10000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance30$Min.Pop30000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance10$Min.Pop10000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance10$Min.Pop30000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance30$Min.Pop10000.pdf
#' 			function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance30$Min.Pop30000.pdf
#' 			function.shapefile.fortify.join.dev.r
#' @		45_bivariate_measures/
#' 			function.df_nTotal_nEvent.append_CI.dev.r
#' 			matrix2x2.OR_CI_phi.dev.r
#' @		47_bivariate_partial_stratified/
#' 			array3d_R_C_strata.OR_CI_partial_cor_strata.dev.r
#' 			x1x2z.patial_correlation.dev.r
#' 			x1x2z.patial_correlation.microbenchmark.r
#' @	50_model_formula_evaluation/
#' 		51_model_formula
#' 		53_model_selection
#' 		55_model_weighted
#' 		56_model_bootstrap
#' 		57_model_time2event
#' 		57_model_trajectory
#' 		59_model_evaluation
#' 		function.matrix.split.dev.r
#' @		51_model_formula/
#' 			function.formula2text.dev.r
#' 			function.txt4varnames.ssv2formula.dev.r
#' @		53_model_selection/
#' 			trainset.cv.glmnet_alphas_cox.dev.r
#' @		55_model_weighted/
#' 			function.learn_wt.list.dev.r
#' 			function.svyglm.MainModel.byEffectModifier.dev.r
#' 			function.weighted.sum.dev.r
#' 			function.weighted_join_FIPS_HANES.dev.r
#' @		56_model_bootstrap/
#' 			function.boot.statistic_glm_coef.dev.r
#' 			function.boot.statistic_RiskDifference.dev.r
#' 			function.Data_Exposure_Outcome_shuffle.dev.r
#' @		57_model_time2event/
#' 			AnalyticDataset$Time2Censor_NewDMv3.rmd
#' 			AnalyticDataset.censor5yr.survfit.ggsurvplot_CIRiskTableP -old.rmd
#' 			AnalyticDataset.censor5yr.survfit.ggsurvplot_CIRiskTableP.source -old.r
#' 			AnalyticDataset.CensorEND.survfit.ggsurvplot_CIRiskTableP.rmd
#' 			AnalyticDataset.CensorLastMeasure.survfit.ggsurvplot_CIRiskTableP.rmd
#' 			AnalyticDataset.pairwise_survdiff_bonferroni.dev.r
#' 			data.PersonTime.dev.r
#' 			formulas4coxph_model_list.dev.r
#' @		57_model_trajectory/
#' 			function.traj_clusters_by_time.dev.r
#' @		59_model_evaluation/
#' 			function.ConfusionMatrix.asSquareMatrix.dev.r
#' 			function.ConfusionMatrix.Metrics.bootstrapCI.dev.r
#' 			function.ConfusionMatrix.Metrics.dev.r
#' 			function.threshold_roc.plot.dev.r
#' @	60_communicate_report_export/
#' 		calculate.smd.dev.r
#' 		data.CreateTableOne.dev.r
#' 		data.gather.group_by_variable.dev.r
#' 		data.median_IQR.dev.r
#' 		data_factor.byExposure.table_proptable.dev.r
#' 		data_logical.byExposure.table_proptable.dev.r
#' 		function.calculatePersonTime.dev.r
#' 		function.Code_vec.list.dot_x.dev.r
#' 		function.ggplot.ORCI.dev.r
#' 		function.HazardRatios.spread.dev.r
#' 		function.list_df2xlsx.dev.r
#' 		function.lm_object.summary.coefCI.dev.r
#' 		function.polr_object.summary.exp.dev.r
#' 		function.prop.table.addmargins.dev.r
#' 		function.RiskDifferenceCI.dev.r
#' 		function.tbl_varname_level_HRCI.dev.r
#' 		function.tbl_varname_level_ORCI.dev.r
#' @Rmd/
#' 	MK Lecture) OMOP_SYNTHETIC library(RODBC) library(ggplot2) library(jsonlite) 180403.nb.html
#' 	MK Lecture) OMOP_SYNTHETIC library(RODBC) library(ggplot2) library(jsonlite) 180403.pdf
#' 	MK Lecture) OMOP_SYNTHETIC library(RODBC) library(ggplot2) library(jsonlite) 180403.Rmd
#' @Rplot/
#' 	plot(select(data, y, x, e1, e1p10, e1m10, m10e10)).png
#' 	plot(select(data, y, x, e1, e2, e3, e4, e5, e10)).png
#' 	termDocMatrix.t.df.comat.gather.upper.tri.igraph_circle.pdf
#' 	termDocMatrix.t.df.comat.gather.upper.tri.igraph_circle.png
#' 	termDocMatrix.t.df.comat.gather.upper.tri.igraph_fruchterman(seed1).pdf
#' 	termDocMatrix.t.df.comat.gather.upper.tri.igraph_fruchterman(seed1).png
#' 	trainset.cv.glmnet_a0.5_plot.png
#' 	trainset.cv.glmnet_a1_plot.png
#' 	trainset_itrainset.cv.glmnet_imyFormula_a0.5_plot.png
#' 	trainset_itrainset.cv.glmnet_imyFormula_a1_plot.png
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle.pdf
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle.png
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).pdf
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).png
#' 	traj_clusters_by_sequence.1.png
#' 	traj_clusters_by_sequence.10.png
#' 	traj_clusters_by_sequence.11.png
#' 	traj_clusters_by_sequence.12.png
#' 	traj_clusters_by_sequence.13.png
#' 	traj_clusters_by_sequence.14.png
#' 	traj_clusters_by_sequence.15.png
#' 	traj_clusters_by_sequence.2.png
#' 	traj_clusters_by_sequence.3.png
#' 	traj_clusters_by_sequence.4.png
#' 	traj_clusters_by_sequence.5.png
#' 	traj_clusters_by_sequence.6.png
#' 	traj_clusters_by_sequence.7.png
#' 	traj_clusters_by_sequence.8.png
#' 	traj_clusters_by_sequence.9.png
#' 	traj_clusters_by_time.1.png
#' 	traj_clusters_by_time.2.png
#' 	traj_clusters_by_time.3.png
#' 	traj_clusters_by_time.4.png
#' 	traj_clusters_by_time.5.png
#' 	traj_clusters_by_time.6.png
#' 	traj_clusters_by_time.7.png
#' 	traj_clusters_by_time.8.png
#' 	traj_clusters_by_time.9.png
#' @data/
#' 	[[Github_file_size_limit_100MB]]
#' 	SurvivalAnalysis_addicts.dta.rda
#' 	SurvivalAnalysis_anderson.dta.rda
#' 	SurvivalAnalysis_bladder.dta.rda
#' 	SurvivalAnalysis_vets.dta.rda
#' 	ATC_RxNorm_NDC
#' 	ATC_RxNorm_NDC.rds
#' 	CDMv5_CONCEPT.rda
#' 	CMS_SynPUF_CDMv5.rda
#' 	CMS_SynPUF_CDMv5_YZ.json
#' 	CoxExample_tibble.cv.glmnet_alphas_cox.rda
#' 	data.SSQ_5_6.rda
#' 	ExampleData4defineDate.MDD.csv
#' 	ExampleData4defineDate.MDD.Time2Censor.csv
#' 	ExampleData4Time2Censor.csv
#' 	fhs.index100 from fhs.r
#' 	fhs.index100.rds
#' 	fhs.index100ge11le20.rds
#' 	fhs.index100le10.rds
#' 	framingham_baseline_2018.rda
#' 	Holdings_details_FTSE_Emerging_Markets_ETF 200930.csv
#' 	Holdings_details_Total_World_Stock_ETF 200930.csv
#' 	Holdings_VT_URTH_VWO.list from .r
#' 	Holdings_VT_URTH_VWO.list.rds
#' 	Holdings_VT_URTH_VWO.list.xlsx
#' 	icd_explain.r
#' 	ICD10_3char_sub_chapter.tibble from icd10_chapters.expand_range.ICD10_3char & icd10_sub_chapters.expand_range.ICD10_3char .r
#' 	ICD10_3char_sub_chapter.tibble.rda
#' 	ICD10_3char_sub_chapter.tibble.xlsx
#' 	icd10_chapters.expand_range.ICD10_3char.json
#' 	icd10_chapters.expand_range.ICD10_3char.rda
#' 	icd10_chapters.expand_range.json
#' 	icd10_chapters.expand_range.rda
#' 	icd10_chapters.json
#' 	icd10_chapters.rda
#' 	icd10_sub_chapters.expand_range.ICD10_3char from icd10_sub_chapters -clean.r
#' 	icd10_sub_chapters.expand_range.ICD10_3char.json
#' 	icd10_sub_chapters.expand_range.ICD10_3char.rda
#' 	icd10_sub_chapters.expand_range.json
#' 	icd10_sub_chapters.expand_range.rda
#' 	icd10_sub_chapters.json
#' 	icd10_sub_chapters.rda
#' 	icd10cm2016.rda
#' 	icd10cm2016.xlsx
#' 	icd10cm2019.csv
#' 	icd10cm2019.rds
#' 	ICD9_3char_sub_chapter.tibble from icd9_chapters.expand_range.ICD9_3char & icd9_sub_chapters.expand_range.ICD9_3char .r
#' 	ICD9_3char_sub_chapter.tibble.rda
#' 	ICD9_3char_sub_chapter.tibble.rds
#' 	ICD9_3char_sub_chapter.tibble.xlsx
#' 	icd9_chapters.expand_range.ICD9_3char.json
#' 	icd9_chapters.expand_range.ICD9_3char.rds
#' 	icd9_chapters.expand_range.json
#' 	icd9_chapters.expand_range.rds
#' 	icd9_chapters.json
#' 	icd9_sub_chapters.expand_range.ICD9_3char from .r
#' 	icd9_sub_chapters.expand_range.ICD9_3char.json
#' 	icd9_sub_chapters.expand_range.ICD9_3char.rds
#' 	icd9_sub_chapters.expand_range.json
#' 	icd9_sub_chapters.expand_range.rds
#' 	icd9_sub_chapters.json
#' 	iris.Species.dummy.rda
#' 	jinseob2kim_jinseob2kim.github.io_master_fstexample.rds
#' 	jinseob2kim_jinseob2kim.github.io_master_fstexample.txt
#' 	jinseob2kim_lecture-snuhlab_master_data_example_bnc.csv
#' 	jinseob2kim_lecture-snuhlab_master_data_example_bnc.rds
#' 	jinseob2kim_lecture-snuhlab_master_data_example_g1e.csv
#' 	jinseob2kim_lecture-snuhlab_master_data_example_g1e.rds
#' 	library_CrossScreening_nhanes.fish.match.rda
#' 	library_CrossScreening_nhanes.fish.rda
#' 	library_Epi_diet.rda
#' 	library_glmnet_CoxExample_tibble.rda
#' 	library(icd) icd_is_valid().r
#' 	library_Matching_lalonde.rda
#' 	library_mice_nhanes_mice.rda
#' 	library_NHANES_NHANES.rda
#' 	library_NHANES_NHANES48.na.omit.rda
#' 	library_NHANES_NHANESraw.rda
#' 	Population-EUC-KR.CSV
#' 	Population-UTF-8.CSV
#' 	Population.CSV
#' 	population_1960_2020.csv
#' 	RDataMining-Tweets-20160212.rds
#' 	rhc_mydata.rda
#' 	termDocMatrix.t.df.lgl.comat.gather.rda
#' 	termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph.rda
#' 	termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet.rda
#' 	termDocMatrix.t.df.rda
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple).rda
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.rda
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph.rda
#' 	trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet.rda
#' 	trainsetCC69agg4i07_829.cv.glmnet_alphas_cox.rda
#' 	trainsetCC69agg4i07_829.rda
#' 	URTH_holdings 201106.csv
#' @	ATC_RxNorm_NDC/
#' @examples/
#' 	replace().r
#' @other/
#' 	Bash
#' 	Batch
#' 	C
#' 	Excel
#' 	mkim0710.github.io.url
#' 	mkim0710_causal-inference-book.url
#' 	mkim0710_Markov.url
#' 	mkim0710_ODBC.url
#' 	mkim0710_PH207x.url
#' 	mkim0710_VBA.url
#' 	ODBC
#' 	R code TEMPLATES 160402.xlsx
#' 	SAS
#' 	sas-prog-for-r-users.url
#' 	Stata
#' 	VBA
#' @	Bash/
#' @	Batch/
#' 		Batch script) Template.bat
#' @	C/
#' @	Excel/
#' 		05. how to make rm anova plot with excel by jeehyoung.kim - NHANES 160328.xlsx
#' 		Data_for_lab_2018_MK(INDEX) -clean.xlsx
#' 		ID 207 Rist Matching 2. Numerical Example of Matching in a cohort study.xlsx
#' 		ID 207 Rist Matching 4. Numerical Example of Matching in a Case-Control Study.xlsx
#' 		ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.tableone_by_exposure -manuscript.xlsx
#' 		Lab_1_instructions_2018_MK(Welch) -clean.pdf
#' @	ODBC/
#' @	SAS/
#' @	Stata/
#' @	VBA/
#' 		Colour_text_survival.PPTM.BAS
#' 		fDocument_FindText_Color.DOCM.BAS
#' 		RecolourShapes.PPTM.BAS
#' 		text_colors_survival_old.PPTM.BAS
#' @tests/
#' @vignettes/
#' 
#' > df_dirs_recursive %>% select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")  #----
#' @./
#' f_df.t.tribble_construct -old.Rmd
#' f_df.t.tribble_construct.Rmd
#' @-info/
#' @Rdev/
#' @	-dev/
#' @	00_base_program/
#' @	00_protocol/
#' @		01_sample_size/
#' @		05_count_eligible/
#' @		06_count_exposure/
#' @		07_count_outcome/
#' @	10_import_clean_datatype/
#' @		11_metadata/
#' @		12_import_files/
#' @		12_import_sqlite/
#' @		12_import_vocabulary/
#' @		13_duplicated/
#' @		13_missing_value/
#' @		13_split_fold/
#' @		15_cleaning_text/
#' @		15_cleaning_time/
#' @		16_categorical_factor/
#' @		17_categorical_indicators/
#' @		18_dichotomous_logical/
#' @		19_datetime/
#' @		19_numeric_integer/
#' @		array_list/
#' @	20_tidy_group_by_match/
#' @		23_group_by_PersonID/
#' @		25_study_population/
#' @		27_match/
#' @	30_transform_scale_categorical/
#' @	40_visualize_explore_bivariate_stratified/
#' @		43_network/
#' @		44_map/
#' @		45_bivariate_measures/
#' @		47_bivariate_partial_stratified/
#' @	50_model_formula_evaluation/
#' @		51_model_formula/
#' @		53_model_selection/
#' @		55_model_weighted/
#' @		56_model_bootstrap/
#' @		57_model_time2event/
#' 			AnalyticDataset$Time2Censor_NewDMv3.rmd
#' 			AnalyticDataset.censor5yr.survfit.ggsurvplot_CIRiskTableP -old.rmd
#' 			AnalyticDataset.CensorEND.survfit.ggsurvplot_CIRiskTableP.rmd
#' 			AnalyticDataset.CensorLastMeasure.survfit.ggsurvplot_CIRiskTableP.rmd
#' @		57_model_trajectory/
#' @		59_model_evaluation/
#' @	60_communicate_report_export/
#' @Rmd/
#' 	MK Lecture) OMOP_SYNTHETIC library(RODBC) library(ggplot2) library(jsonlite) 180403.Rmd
#' @Rplot/
#' @data/
#' @	ATC_RxNorm_NDC/
#' @examples/
#' @other/
#' @	Bash/
#' @	Batch/
#' @	C/
#' @	Excel/
#' @	ODBC/
#' @	SAS/
#' @	Stata/
#' @	VBA/
#' @tests/
#' @vignettes/







#@ df_dirs_recursive = "Rdev" %>% f_path.df_dirs_recursive.df_files() =======
df_dirs_recursive = env1$env.internal$f_path.df_dirs_recursive.df_files()
df_dirs_recursive |> str(max.level = 2) #----
# df_dirs_recursive %>% {.$full_path} |> sort() |> paste(collapse="") |> cat("  \n", sep="") #----
# df_dirs_recursive %>% {.$path.basename} |> sort() |> paste(collapse="") |> cat("  \n", sep="")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) |> as_tibble() |> print(n=99) #----
# df_dirs_recursive %>% select(print_tree_path) |> as_tibble()
df_dirs_recursive %>% select(print_tree_path) |> unlist() |> paste(collapse = "\n") |> cat("  \n", sep="")  #----
df_dirs_recursive %>% select(print_tree_path_files) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")  #----
df_dirs_recursive %>% select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")  #----



#@ end -----

ls.str(env1) #-----
ls.str(env1$env.internal) #-----
# > ls.str(env1) #-----
# env.internal : <environment: 0x00000147edfbc480> 
# f_path.df_dirs_recursive.df_files : function (input_path = ".", max_depth = 9, current_depth = 0, gitignore_escaped_select.UC = env1$gitignore_escaped_select.UC)  
# gitignore_escaped_select.UC :  chr [1:23] "\\.RPROJ\\.USER" "\\.RHISTORY" "\\.RDATA" "\\.RUSERDATA" ".*\\.ZIP" ".*\\.7Z" ".*\\.RPROJ" "\\.GITIGNORE" "MH\\).*\\.R" ".*\\.LNK" ".*ALIAS" ...
# info :  list()
# path : List of 2
#  $ source_base_local : chr "D:/OneDrive/[][Rproject]/github_tidystat"
#  $ source_base_github: chr "https://github.com/mkim0710/tidystat/raw/master"
# > ls.str(env1$env.internal) #-----



#@ end ----



