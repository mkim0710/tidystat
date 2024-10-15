# Rdev/60_communicate_report_export/f_df.print_byVar.dev.r  
# Rdev/60_communicate_report_export/f_df.print_byVar.dev.Rmd  
# Rdev/60_communicate_report_export/f_df.print_byVar  
# # source("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar")  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar.dev.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar.dev.Rmd"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_df.print_byVar"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) |> paste0('"',.,'"') |> paste(collapse = ", \n  ") |> cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/00_protocol/05_count_eligible
# # Rdev/00_protocol/06_count_exposure
# # Rdev/00_protocol/07_count_outcome
# # Rdev/10_import_clean_datatype
# # Rdev/10_import_clean_datatype/11_metadata
# # Rdev/10_import_clean_datatype/12_import_files
# # Rdev/10_import_clean_datatype/12_import_sqlite
# # Rdev/10_import_clean_datatype/12_import_vocabulary
# # Rdev/10_import_clean_datatype/13_duplicated
# # Rdev/10_import_clean_datatype/13_missing_value
# # Rdev/10_import_clean_datatype/13_split_fold
# # Rdev/10_import_clean_datatype/15_cleaning_text
# # Rdev/10_import_clean_datatype/15_cleaning_time
# # Rdev/10_import_clean_datatype/16_categorical_factor
# # Rdev/10_import_clean_datatype/17_categorical_indicators
# # Rdev/10_import_clean_datatype/18_dichotomous_logical
# # Rdev/10_import_clean_datatype/19_datetime
# # Rdev/10_import_clean_datatype/19_numeric_integer
# # Rdev/10_import_clean_datatype/array_list
# # Rdev/20_tidy_group_by_match
# # Rdev/20_tidy_group_by_match/23_group_by_PersonID
# # Rdev/20_tidy_group_by_match/25_study_population
# # Rdev/20_tidy_group_by_match/27_match
# # Rdev/30_transform_scale_categorical
# # Rdev/40_visualize_explore_bivariate_stratified
# # Rdev/40_visualize_explore_bivariate_stratified/43_network
# # Rdev/40_visualize_explore_bivariate_stratified/44_map
# # Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# # Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
#|________________________________________________________________________________|#  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
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
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])} 
#|________________________________________________________________________________|#
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) data -----  

## \$ survival::lung ----  
survival::lung |> str()
survival::lung |> summary()
# > survival::lung |> str()
# 'data.frame':	228 obs. of  10 variables:
#  $ inst     : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time     : num  306 455 1010 210 883 ...
#  $ status   : num  2 2 1 2 2 1 2 2 2 2 ...
#  $ age      : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex      : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog  : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno: num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal : num  1175 1225 NA 1150 NA ...
#  $ wt.loss  : num  NA 15 15 11 0 0 10 1 16 34 ...
# > survival::lung |> summary()
#       inst            time            status           age             sex           ph.ecog          ph.karno        pat.karno         meal.cal         wt.loss       
#  Min.   : 1.00   Min.   :   5.0   Min.   :1.000   Min.   :39.00   Min.   :1.000   Min.   :0.0000   Min.   : 50.00   Min.   : 30.00   Min.   :  96.0   Min.   :-24.000  
#  1st Qu.: 3.00   1st Qu.: 166.8   1st Qu.:1.000   1st Qu.:56.00   1st Qu.:1.000   1st Qu.:0.0000   1st Qu.: 75.00   1st Qu.: 70.00   1st Qu.: 635.0   1st Qu.:  0.000  
#  Median :11.00   Median : 255.5   Median :2.000   Median :63.00   Median :1.000   Median :1.0000   Median : 80.00   Median : 80.00   Median : 975.0   Median :  7.000  
#  Mean   :11.09   Mean   : 305.2   Mean   :1.724   Mean   :62.45   Mean   :1.395   Mean   :0.9515   Mean   : 81.94   Mean   : 79.96   Mean   : 928.8   Mean   :  9.832  
#  3rd Qu.:16.00   3rd Qu.: 396.5   3rd Qu.:2.000   3rd Qu.:69.00   3rd Qu.:2.000   3rd Qu.:1.0000   3rd Qu.: 90.00   3rd Qu.: 90.00   3rd Qu.:1150.0   3rd Qu.: 15.750  
#  Max.   :33.00   Max.   :1022.0   Max.   :2.000   Max.   :82.00   Max.   :2.000   Max.   :3.0000   Max.   :100.00   Max.   :100.00   Max.   :2600.0   Max.   : 68.000  
#  NA's   :1                                                                        NA's   :1        NA's   :1        NA's   :3        NA's   :47       NA's   :14       


### \% by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})  ----  
?by
survival::lung |> as_tibble() |> rownames_to_column() %>% 
    by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})
# .$sex: 1
# # A tibble: 138 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 1           3   306      2    74       1       90       100     1175      NA
#  2 2           3   455      2    68       0       90        90     1225      15
#  3 3           3  1010      1    56       0       90        90       NA      15
#  4 4           5   210      2    57       1       90        60     1150      11
#  5 5           1   883      2    60       0      100        90       NA       0
#  6 6          12  1022      1    74       1       50        80      513       0
#  7 9           1   218      2    53       1       70        80      825      16
#  8 10          7   166      2    61       2       70        70      271      34
#  9 11          6   170      2    57       1       80        80     1025      27
# 10 14         21    71      2    60      NA       60        70     1225      32
# # ℹ 128 more rows
# # ℹ Use `print(n = ...)` to see more rows
# --------------------------------------------------------------------------------  
# .$sex: 2
# # A tibble: 90 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 7           7   310      2    68       2       70        60      384      10
#  2 8          11   361      2    71       2       60        80      538       1
#  3 12         16   654      2    68       2       70        70       NA      23
#  4 13         11   728      2    68       1       90        90       NA       5
#  5 19          1    61      2    56       2       60        60      238      10
#  6 22          6    81      2    49       0      100        70     1175      -8
#  7 26         12   520      2    70       1       90        80      825       6
#  8 31         12   473      2    69       1       90        90     1025      -1
#  9 34         16   107      2    60       2       50        60      925     -15
# 10 36          1   122      2    62       2       50        50     1025      NA
# # ℹ 80 more rows
# # ℹ Use `print(n = ...)` to see more rows


## \$ data2$sex[c(1,3,5,7,9)] = NA ----  
data = survival::lung |> as_tibble() |> rownames_to_column()
data2 = data
data2$sex[c(1,3,5,7,9)] = NA

### \% by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})  ----  
data2 %>% by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})
# .$sex: 1
# # A tibble: 131 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 10          7   166      2    61       2       70        70      271      34
#  2 11          6   170      2    57       1       80        80     1025      27
#  3 14         21    71      2    60      NA       60        70     1225      32
#  4 15         12   567      2    57       1       80        70     2600      60
#  5 16          1   144      2    67       1       80        90       NA      15
#  6 17         22   613      2    70       1       90       100     1150      -5
#  7 18         16   707      2    63       2       50        70     1025      22
#  8 20         21    88      2    57       1       90        80     1175      NA
#  9 21         11   301      2    67       1       80        80     1025      17
# 10 23         11   624      2    50       1       70        80       NA      16
# # ℹ 121 more rows
# # ℹ Use `print(n = ...)` to see more rows
# --------------------------------------------------------------------------------  
# .$sex: 2
# # A tibble: 88 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 12         16   654      2    68       2       70        70       NA      23
#  2 13         11   728      2    68       1       90        90       NA       5
#  3 19          1    61      2    56       2       60        60      238      10
#  4 22          6    81      2    49       0      100        70     1175      -8
#  5 26         12   520      2    70       1       90        80      825       6
#  6 31         12   473      2    69       1       90        90     1025      -1
#  7 34         16   107      2    60       2       50        60      925     -15
#  8 36          1   122      2    62       2       50        50     1025      NA
#  9 38         15   965      1    66       1       70        90      875       4
# 10 40          1   731      2    64       1       80       100     1175      15
# # ℹ 78 more rows
# # ℹ Use `print(n = ...)` to see more rows


data3 
data2 |> 
    mutate(sex = sex |> as.character() |> replace_na("N/A")) %>% 
    by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})
# .$sex: 1
# # A tibble: 131 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 10          7   166      2    61       2       70        70      271      34
#  2 11          6   170      2    57       1       80        80     1025      27
#  3 14         21    71      2    60      NA       60        70     1225      32
#  4 15         12   567      2    57       1       80        70     2600      60
#  5 16          1   144      2    67       1       80        90       NA      15
#  6 17         22   613      2    70       1       90       100     1150      -5
#  7 18         16   707      2    63       2       50        70     1025      22
#  8 20         21    88      2    57       1       90        80     1175      NA
#  9 21         11   301      2    67       1       80        80     1025      17
# 10 23         11   624      2    50       1       70        80       NA      16
# # ℹ 121 more rows
# # ℹ Use `print(n = ...)` to see more rows
# --------------------------------------------------------------------------------  
# .$sex: 2
# # A tibble: 88 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 12         16   654      2    68       2       70        70       NA      23
#  2 13         11   728      2    68       1       90        90       NA       5
#  3 19          1    61      2    56       2       60        60      238      10
#  4 22          6    81      2    49       0      100        70     1175      -8
#  5 26         12   520      2    70       1       90        80      825       6
#  6 31         12   473      2    69       1       90        90     1025      -1
#  7 34         16   107      2    60       2       50        60      925     -15
#  8 36          1   122      2    62       2       50        50     1025      NA
#  9 38         15   965      1    66       1       70        90      875       4
# 10 40          1   731      2    64       1       80       100     1175      15
# # ℹ 78 more rows
# # ℹ Use `print(n = ...)` to see more rows
# --------------------------------------------------------------------------------  
# .$sex: N/A
# # A tibble: 9 × 10
#   rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#   <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
# 1 1           3   306      2    74       1       90       100     1175      NA
# 2 2           3   455      2    68       0       90        90     1225      15
# 3 3           3  1010      1    56       0       90        90       NA      15
# 4 4           5   210      2    57       1       90        60     1150      11
# 5 5           1   883      2    60       0      100        90       NA       0
# 6 6          12  1022      1    74       1       50        80      513       0
# 7 7           7   310      2    68       2       70        60      384      10
# 8 8          11   361      2    71       2       60        80      538       1
# 9 9           1   218      2    53       1       70        80      825      16



## \$ data3 = data2 |> mutate(sex = c("Male", "Female")[sex])  ----  
data3 = data2 |> mutate(sex = c("Male", "Female")[sex]) |> 
    mutate(sex = sex |> as.character() |> replace_na("N/A")) 
data3

### \% by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})  ----  
data3 %>% by(.$sex, function(df) {df |> dplyr::select(-sex) |> print(n=99)})
# .$sex: Female
# # A tibble: 88 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 12         16   654      2    68       2       70        70       NA      23
#  2 13         11   728      2    68       1       90        90       NA       5
#  3 19          1    61      2    56       2       60        60      238      10
#  4 22          6    81      2    49       0      100        70     1175      -8
#  5 26         12   520      2    70       1       90        80      825       6
#  6 31         12   473      2    69       1       90        90     1025      -1
#  7 34         16   107      2    60       2       50        60      925     -15
#  8 36          1   122      2    62       2       50        50     1025      NA
#  9 38         15   965      1    66       1       70        90      875       4
# 10 40          1   731      2    64       1       80       100     1175      15
# # ℹ 78 more rows
# # ℹ Use `print(n = ...)` to see more rows
# --------------------------------------------------------------------------------  
# .$sex: Male
# # A tibble: 131 × 10
#    rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1 10          7   166      2    61       2       70        70      271      34
#  2 11          6   170      2    57       1       80        80     1025      27
#  3 14         21    71      2    60      NA       60        70     1225      32
#  4 15         12   567      2    57       1       80        70     2600      60
#  5 16          1   144      2    67       1       80        90       NA      15
#  6 17         22   613      2    70       1       90       100     1150      -5
#  7 18         16   707      2    63       2       50        70     1025      22
#  8 20         21    88      2    57       1       90        80     1175      NA
#  9 21         11   301      2    67       1       80        80     1025      17
# 10 23         11   624      2    50       1       70        80       NA      16
# # ℹ 121 more rows
# # ℹ Use `print(n = ...)` to see more rows
# --------------------------------------------------------------------------------  
# .$sex: N/A
# # A tibble: 9 × 10
#   rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#   <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
# 1 1           3   306      2    74       1       90       100     1175      NA
# 2 2           3   455      2    68       0       90        90     1225      15
# 3 3           3  1010      1    56       0       90        90       NA      15
# 4 4           5   210      2    57       1       90        60     1150      11
# 5 5           1   883      2    60       0      100        90       NA       0
# 6 6          12  1022      1    74       1       50        80      513       0
# 7 7           7   310      2    68       2       70        60      384      10
# 8 8          11   361      2    71       2       60        80      538       1
# 9 9           1   218      2    53       1       70        80      825      16



#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/c/0a303d17-ec74-41ca-8012-c9921709ad57
# @@ Dev) f_df.print_byVar() ----  

## \% f_df.print_byVar = function(df, byVar, n = NULL) { ----  

### \% by(INDICES = .[[quo_name(byVar)]], function(df_subset) {df_subset |> dplyr::select(-!!quo_name(byVar))}) 
f_df.print_byVar = function(df, byVar, n = NULL) {
    byVar <- enquo(byVar)
    df = df |> as_tibble()
    if(!"Num" %in% names(df)) df = df |> rownames_to_column("Num") |> mutate(Num = Num |> as.integer())
    df |>
        mutate(!!quo_name(byVar) := as.character(!!byVar) |> replace_na("N/A")) %>% 
        by(INDICES = .[[quo_name(byVar)]], function(df_subset) {df_subset |> dplyr::select(-!!quo_name(byVar))}) |> 
        print(n = n)
}
data3 |> f_df.print_byVar(sex)
# .[[quo_name(byVar)]]: Female
# # A tibble: 89 × 11
#      Num rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <int> <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1     8 8          11   361      2    71       2       60        80      538       1
#  2    12 12         16   654      2    68       2       70        70       NA      23
#  3    13 13         11   728      2    68       1       90        90       NA       5
#  4    19 19          1    61      2    56       2       60        60      238      10
#  5    22 22          6    81      2    49       0      100        70     1175      -8
#  6    26 26         12   520      2    70       1       90        80      825       6
#  7    31 31         12   473      2    69       1       90        90     1025      -1
#  8    34 34         16   107      2    60       2       50        60      925     -15
#  9    36 36          1   122      2    62       2       50        50     1025      NA
# 10    38 38         15   965      1    66       1       70        90      875       4
# # ℹ 79 more rows
# # ℹ Use `print(n = ...)` to see more rows
# ------------------------------------------------------------------------------------------  
# .[[quo_name(byVar)]]: Male
# # A tibble: 134 × 11
#      Num rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#    <int> <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
#  1     2 2           3   455      2    68       0       90        90     1225      15
#  2     4 4           5   210      2    57       1       90        60     1150      11
#  3     6 6          12  1022      1    74       1       50        80      513       0
#  4    10 10          7   166      2    61       2       70        70      271      34
#  5    11 11          6   170      2    57       1       80        80     1025      27
#  6    14 14         21    71      2    60      NA       60        70     1225      32
#  7    15 15         12   567      2    57       1       80        70     2600      60
#  8    16 16          1   144      2    67       1       80        90       NA      15
#  9    17 17         22   613      2    70       1       90       100     1150      -5
# 10    18 18         16   707      2    63       2       50        70     1025      22
# # ℹ 124 more rows
# # ℹ Use `print(n = ...)` to see more rows
# ------------------------------------------------------------------------------------------  
# .[[quo_name(byVar)]]: N/A
# # A tibble: 5 × 11
#     Num rowname  inst  time status   age ph.ecog ph.karno pat.karno meal.cal wt.loss
#   <int> <chr>   <dbl> <dbl>  <dbl> <dbl>   <dbl>    <dbl>     <dbl>    <dbl>   <dbl>
# 1     1 1           3   306      2    74       1       90       100     1175      NA
# 2     3 3           3  1010      1    56       0       90        90       NA      15
# 3     5 5           1   883      2    60       0      100        90       NA       0
# 4     7 7           7   310      2    68       2       70        60      384      10
# 5     9 9           1   218      2    53       1       70        80      825      16


#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


