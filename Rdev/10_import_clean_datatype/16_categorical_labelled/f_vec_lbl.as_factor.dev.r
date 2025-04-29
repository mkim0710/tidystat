# f_vec_lbl_sex.as_character.dev.r
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_FileNameExt), output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
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
## \$ env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) dev -----  
## env0 = env1 ----
env0 = env1
## \% survival::lung |> 

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Not Yet included in env1$env.internal.source.r ----
## ->> Not Yet included in f_df.t.tribble_construct.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_formula.lhs_rhs_vars"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_formula.lhs_rhs_vars =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/f_formula.lhs_rhs_vars.dev.Rmd
.tmp$objectname = "f_formula.lhs_rhs_vars"
.tmp$object = function(formula, include_input_in_output = TRUE) {
    return.list = list()
    if(include_input_in_output) return.list$formula = formula
    return.list$terms = formula |> terms()
    return.list$all.vars = formula |> all.vars()
    return.list$lhs = formula[[2]]
    return.list$lhs.vars = formula[[2]] |> all.vars()
    return.list$rhs = formula[[3]]
    return.list$rhs.vars = formula[[3]] |> all.vars()
    return(return.list)

    # ## \% \%>\% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # .subsublistname = "time2event"; .sublistname = "ModelList"; .parentname = "MetaData"; if(!.subsublistname %in% names(.GlobalEnv[[.parentname]][[.sublistname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
    #
    # .packagename = "survival"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    # MetaData$ModelList$time2event = NULL
    # MetaData$ModelList$time2event$formula = Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    #
    # MetaData$ModelList$time2event = MetaData$ModelList$time2event %>% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # MetaData$ModelList$time2event |> str(max.level = 1, give.attr = F)
    # # List of 7
    # #  $ formula :Class 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ terms   :Classes 'terms', 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ all.vars: chr [1:6] "time2event" "event" "Group" "StudyPopulation" ...
    # #  $ lhs     : language Surv(time = time2event, event = event)
    # #  $ lhs.vars: chr [1:2] "time2event" "event"
    # #  $ rhs     : language Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ rhs.vars: chr [1:4] "Group" "StudyPopulation" "A00_SEX" "A01_AGE"
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## § .RelativeSubPath, .FileName.source.r ======  
#### env1$path$.RelativeSubPath_FileName.source.r ----  
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
    '# # source("',env1$path$source_base,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'"); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt);', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'"); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt);', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'"); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(env1$path$LastSourceEditorContext.path_FileNameExt);', "  \n",
    sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://haven.tidyverse.org/reference/labelled.html
# https://chatgpt.com/c/349f6c28-2835-445f-aeb2-bc291bfadc41
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# \% library(haven) ----
## \% haven::labelled() ----
s1 <- haven::labelled(c("M", "M", "F"), c(Male = "M", Female = "F"))
s1 |> str(max.level = 2, give.attr = TRUE)
s1 %>% dput
#' > s1 |> str(max.level = 2, give.attr = TRUE)
#'  chr+lbl [1:3] M, M, F
#'  @ labels: Named chr [1:2] "M" "F"
#'   ..- attr(*, "names")= chr [1:2] "Male" "Female"
#' > s1 %>% dput
#' structure(c("M", "M", "F"), labels = c(Male = "M", Female = "F"), class = c("haven_labelled", "vctrs_vctr", "character"))

s2 <- haven::labelled(c(1, 1, 2), c(Male = 1, Female = 2))
s2 |> str(max.level = 2, give.attr = TRUE)
s2 %>% dput
#' > s2 |> str(max.level = 2, give.attr = TRUE)
#'  dbl+lbl [1:3] 1, 1, 2
#'  @ labels: Named num [1:2] 1 2
#'   ..- attr(*, "names")= chr [1:2] "Male" "Female"
#' > s2 %>% dput
#' structure(c(1, 1, 2), labels = c(Male = 1, Female = 2), class = c("haven_labelled", "vctrs_vctr", "double"))


s3 <- haven::labelled(
  c(1, 1, 2),
  c(Male = 1, Female = 2),
  label = "Assigned sex at birth"
)
s3 |> str(max.level = 2, give.attr = TRUE)
s3 %>% dput
#' > s3 |> str(max.level = 2, give.attr = TRUE)
#'  chr+lbl [1:5] M  , M  , F  , X  , N/A
#'  @ labels: Named chr [1:4] "M" "F" "X" "N/A"
#'   ..- attr(*, "names")= chr [1:4] "Male" "Female" "Refused" "Not applicable"
#' > s3 %>% dput
#' structure(c("M", "M", "F", "X", "N/A"), labels = c(Male = "M", Female = "F", Refused = "X", `Not applicable` = "N/A"), class = c("haven_labelled", "vctrs_vctr", "character"))


### \% haven::labelled() |> as_factor() ----
# Unfortunately it's not possible to make as.factor work for labelled objects
# so instead use as_factor. This works for all types of labelled vectors.
as_factor(s1)
#> [1] Male   Male   Female
#> Levels: Female Male
as_factor(s1, levels = "values")
#> [1] M M F
#> Levels: M F
as_factor(s2)
#> [1] Male   Male   Female
#> Levels: Male Female


### \% multiple types of missing values ??? ----
# Other statistical software supports multiple types of missing values
s3 <- haven::labelled(
  c("M", "M", "F", "X", "N/A"),
  c(Male = "M", Female = "F", Refused = "X", "Not applicable" = "N/A")
)
s3
#> <labelled<character>[5]>
#> [1] M   M   F   X   N/A
#> 
#> Labels:
#>  value          label
#>      M           Male
#>      F         Female
#>      X        Refused
#>    N/A Not applicable
as_factor(s3)
#> [1] Male           Male           Female         Refused       
#> [5] Not applicable
#> Levels: Female Male Not applicable Refused


## \% haven::zap_labels() ----
# Often when you have a partially labelled numeric vector, labelled values
# are special types of missing. Use zap_labels to replace labels with missing
# values
x <- haven::labelled(c(1, 2, 1, 2, 10, 9), c(Unknown = 9, Refused = 10))
haven::zap_labels(x)
#> [1]  1  2  1  2 10  9



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://cran.r-project.org/web/packages/labelled/vignettes/intro_labelled.html
# https://larmarange.github.io/labelled/reference/recode.haven_labelled.html
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

# \% library(labelled) ----
# library(labelled)

## \% labelled::var_label() ----
labelled::var_label(iris$Sepal.Length) <- "Length of sepal"

labelled::var_label(iris) <- list(
  Petal.Length = "Length of petal",
  Petal.Width = "Width of Petal"
)
labelled::var_label(iris$Petal.Width)
## [1] "Width of Petal"
labelled::var_label(iris)
## $Sepal.Length
## [1] "Length of sepal"
## 
## $Sepal.Width
## NULL
## 
## $Petal.Length
## [1] "Length of petal"
## 
## $Petal.Width
## [1] "Width of Petal"
## 
## $Species
## NULL
labelled::var_label(iris$Sepal.Length) <- NULL

## \% labelled::look_for() ----
labelled::look_for(iris)
##  pos variable     label           col_type missing values    
##  1   Sepal.Length —               dbl      0                 
##  2   Sepal.Width  —               dbl      0                 
##  3   Petal.Length Length of petal dbl      0                 
##  4   Petal.Width  Width of Petal  dbl      0                 
##  5   Species      —               fct      0       setosa    
##                                                    versicolor
##                                                    virginica
labelled::look_for(iris, "pet")
##  pos variable     label           col_type missing values
##  3   Petal.Length Length of petal dbl      0             
##  4   Petal.Width  Width of Petal  dbl      0
labelled::look_for(iris, details = FALSE)
##  pos variable     label          
##  1   Sepal.Length —              
##  2   Sepal.Width  —              
##  3   Petal.Length Length of petal
##  4   Petal.Width  Width of Petal 
##  5   Species      —



v <- labelled::labelled(
  c(1, 2, 2, 2, 3, 9, 1, 3, 2, NA),
  c(yes = 1, no = 3, "don't know" = 8, refused = 9)
)
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value      label
##      1        yes
##      3         no
##      8 don't know
##      9    refused
labelled::val_labels(v)
##        yes         no don't know    refused 
##          1          3          8          9
labelled::val_label(v, 8)
## [1] "don't know"
labelled::val_labels(v) <- c(yes = 1, nno = 3, bug = 5)
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes
##      3   nno
##      5   bug
labelled::val_label(v, 3) <- "no"
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes
##      3    no
##      5   bug


## \% labelled::val_label() ----
#@ With val_label(), you can also add or remove specific value labels.
labelled::val_label(v, 2) <- "maybe"
labelled::val_label(v, 5) <- NULL
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes
##      3    no
##      2 maybe

#@ To remove all value labels, use val_labels() and NULL. The haven_labelled class will also be removed.

labelled::val_labels(v) <- NULL
v
##  [1]  1  2  2  2  3  9  1  3  2 NA

#@ Adding a value label to a non labelled vector will apply haven_labelled class to it.
labelled::val_label(v, 1) <- "yes"
v
## <labelled<double>[10]>
##  [1]  1  2  2  2  3  9  1  3  2 NA
## 
## Labels:
##  value label
##      1   yes

#@ Note that applying val_labels() to a factor will generate an error!
f <- factor(1:3)
f
## [1] 1 2 3
## Levels: 1 2 3
# labelled::val_labels(f) <- c(yes = 1, no = 3)
# ## Error in `val_labels<-.factor`(`*tmp*`, value = c(yes = 1, no = 3)): Value labels cannot be applied to factors.


#@ You could also apply val_labels() to several columns of a data frame.
df <- data.frame(v1 = 1:3, v2 = c(2, 3, 1), v3 = 3:1)

labelled::val_label(df, 1) <- "yes"
labelled::val_label(df[, c("v1", "v3")], 2) <- "maybe"
labelled::val_label(df[, c("v2", "v3")], 3) <- "no"
labelled::val_labels(df)
## $v1
##   yes maybe 
##     1     2 
## 
## $v2
## yes  no 
##   1   3 
## 
## $v3
##   yes maybe    no 
##     1     2     3
labelled::val_labels(df[, c("v1", "v3")]) <- c(YES = 1, MAYBE = 2, NO = 3)
labelled::val_labels(df)
## $v1
##   YES MAYBE    NO 
##     1     2     3 
## 
## $v2
## yes  no 
##   1   3 
## 
## $v3
##   YES MAYBE    NO 
##     1     2     3
labelled::val_labels(df) <- NULL
labelled::val_labels(df)
## $v1
## NULL
## 
## $v2
## NULL
## 
## $v3
## NULL
labelled::val_labels(df) <- list(v1 = c(yes = 1, no = 3), v2 = c(a = 1, b = 2, c = 3))
labelled::val_labels(df)
## $v1
## yes  no 
##   1   3 
## 
## $v2
## a b c 
## 1 2 3 
## 
## $v3
## NULL




## \% labelled:::recode.haven_labelled() ----
# combine value labels
x <- haven::labelled(
  1:4,
  c(
    "strongly agree" = 1,
    "agree" = 2,
    "disagree" = 3,
    "strongly disagree" = 4
  )
)
# library(labelled)
# dplyr::recode(
#   x,
#   `1` = 1L,
#   `2` = 1L,
#   `3` = 2L,
#   `4` = 2L,
#   .combine_value_labels = TRUE
# )
labelled:::recode.haven_labelled(
  x,
  `1` = 1L,
  `2` = 1L,
  `3` = 2L,
  `4` = 2L,
  .combine_value_labels = TRUE
)
# > dplyr::recode(
# +   x,
# +   `1` = 1L,
# +   `2` = 1L,
# +   `3` = 2L,
# +   `4` = 2L,
# +   .combine_value_labels = TRUE
# + )
# Error in UseMethod("recode") : 
#   no applicable method for 'recode' applied to an .object of class "c('haven_labelled', 'vctrs_vctr', 'integer')"
#> <labelled<integer>[4]>
#> [1] 1 1 2 2
#> 
#> Labels:
#>  value                        label
#>      1       strongly agree / agree
#>      2 disagree / strongly disagree
labelled:::recode.haven_labelled(
  x,
  `2` = 1L,
  `4` = 3L,
  .combine_value_labels = TRUE
)
#> <labelled<integer>[4]>
#> [1] 1 1 3 3
#> 
#> Labels:
#>  value                        label
#>      1       strongly agree / agree
#>      3 disagree / strongly disagree
labelled:::recode.haven_labelled(
  x,
  `2` = 1L,
  `4` = 3L,
  .combine_value_labels = TRUE,
  .sep = " or "
)
#> <labelled<integer>[4]>
#> [1] 1 1 3 3
#> 
#> Labels:
#>  value                         label
#>      1       strongly agree or agree
#>      3 disagree or strongly disagree
labelled:::recode.haven_labelled(
  x,
  `2` = 1L,
  .default = 2L,
  .combine_value_labels = TRUE
)
#> <labelled<integer>[4]>
#> [1] 2 1 2 2
#> 
#> Labels:
#>  value                                         label
#>      1                                         agree
#>      2 strongly agree / disagree / strongly disagree

# example when combining some values without a label
y <- haven::labelled(1:4, c("strongly agree" = 1))
labelled:::recode.haven_labelled(y, `2` = 1L, `4` = 3L, .combine_value_labels = TRUE)
#> <labelled<integer>[4]>
#> [1] 1 1 3 3
#> 
#> Labels:
#>  value          label
#>      1 strongly agree

#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@@ START) data -----

## \$ fruit ====
# > fruit |> str(max.level = 2, give.attr = TRUE)
#  chr [1:80] "apple" "apricot" "avocado" "banana" "bell pepper" "bilberry" "blackberry" "blackcurrant" "blood orange" "blueberry" ...
# > fruit %>% as.factor |> str(max.level = 2, give.attr = TRUE)
#  Factor w/ 80 levels "apple","apricot",..: 1 2 3 4 5 6 7 8 9 10 ...
# > fruit %>% as.factor %>% is.factor
# [1] TRUE
# > fruit %>% as.factor %>% is.numeric
# [1] FALSE


## \$ vec_lbl_sex ====
vec_lbl_sex = structure(c(1, 2, 2, 1, 2), label = "성별", labels = c(남자 = 1, 여자 = 2), class = c("haven_labelled", "vctrs_vctr", "double"))

vec_lbl_sex |> str(max.level = 2, give.attr = TRUE)
#' > vec_lbl_sex |> str(max.level = 2, give.attr = TRUE)
#'  dbl+lbl [1:5] 1, 2, 2, 1, 2
#'  @ label : chr "성별"
#'  @ labels: Named num [1:2] 1 2
#'   ..- attr(*, "names")= chr [1:2] "남자" "여자"

vec_lbl_sex %>% is.numeric
vec_lbl_sex %>% is.factor
# > vec_lbl_sex %>% is.numeric
# [1] TRUE
# > vec_lbl_sex %>% is.factor
# [1] FALSE



### \% haven::labelled() |> as.factor() ----
# vec_lbl_sex %>% as.numeric
# vec_lbl_sex %>% as.character
# vec_lbl_sex %>% as.factor
# # > vec_lbl_sex %>% as.numeric
# # Error in `as.numeric()`:
# # ! Can't convert `x` <haven_labelled> to <double>.
# # Run `rlang::last_trace()` to see where the error occurred.
# # > vec_lbl_sex %>% as.character
# # Error in `as.character()`:
# # ! Can't convert `x` <haven_labelled> to <character>.
# # Run `rlang::last_trace()` to see where the error occurred.
# # > vec_lbl_sex %>% as.factor
# # Error in `as.character()`:
# # ! Can't convert `x` <haven_labelled> to <character>.
# # Run `rlang::last_trace()` to see where the error occurred.


### \% haven::labelled() |> as_factor() ----
# vec_lbl_sex %>% as_numeric
# vec_lbl_sex %>% as_character
vec_lbl_sex %>% as_factor
# > vec_lbl_sex %>% as_numeric
# Error in as_numeric(.) : could not find function "as_numeric"
# > vec_lbl_sex %>% as_character
# Error in as_character(.) : could not find function "as_character"
# > vec_lbl_sex %>% as_factor
# [1] 남자 여자 여자 남자 여자
# attr(,"label")
# [1] 성별
# Levels: 남자 여자


vec_lbl_sex %>% haven::zap_label() |> str(max.level = 2, give.attr = TRUE)
vec_lbl_sex %>% haven::zap_labels() |> str(max.level = 2, give.attr = TRUE)
#' > vec_lbl_sex %>% haven::zap_label() |> str(max.level = 2, give.attr = TRUE)
#'  dbl+lbl [1:5] 1, 2, 2, 1, 2
#'  @ labels: Named num [1:2] 1 2
#'   ..- attr(*, "names")= chr [1:2] "남자" "여자"
#' > vec_lbl_sex %>% haven::zap_labels() |> str(max.level = 2, give.attr = TRUE)
#'  num [1:5] 1 2 2 1 2
#'  - attr(*, "label")= chr "성별"



## \$ vec_lbl_age ====
vec_lbl_age = structure(c(22, 43, 42, 41, 41), label = "나이")

vec_lbl_age |> str(max.level = 2, give.attr = TRUE)
# > vec_lbl_age |> str(max.level = 2, give.attr = TRUE)
#  num [1:5] 22 43 42 41 41
#  - attr(*, "label")= chr "나이"


### \% haven::labelled() |> as.factor() ----
vec_lbl_age %>% as.numeric
vec_lbl_age %>% as.character
vec_lbl_age %>% as.factor
# > vec_lbl_age %>% as.numeric
# [1] 22 43 42 41 41
# > vec_lbl_age %>% as.character
# [1] "22" "43" "42" "41" "41"
# > vec_lbl_age %>% as.factor
# [1] 22 43 42 41 41
# Levels: 22 41 42 43


### \% haven::labelled() |> as_factor() ----
# vec_lbl_age %>% as_numeric
# vec_lbl_age %>% as_character
vec_lbl_age %>% as_factor
# > vec_lbl_age %>% as_numeric
# Error in as_numeric(.) : could not find function "as_numeric"
# > vec_lbl_age %>% as_character
# Error in as_character(.) : could not find function "as_character"
# > vec_lbl_age %>% as_factor
# [1] 22 43 42 41 41
# Levels: 22 41 42 43






# __________|------  
## § write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") ----
if (Sys.getenv("PARENT_RENDERING") != "YES") {    
    .path4write = .path4write %>% str_replace(fixed(env1$path$path1), "") %>% str_replace("^/", "")  # [][Rproject] makes an error in git bash
    if(exists("MetaData") && !is.null(unlist(MetaData))) {
        # MetaData$DSnames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
        cat("    ________________________________________________________________________    \n")
        for (DSname in names(MetaData$DSnames)) {    
            if(exists(DSname)) {
                assign(DSname, structure(get(DSname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                if(is.null(attributes(.GlobalEnv[[DSname]])$DSname)) attributes(.GlobalEnv[[DSname]])$DSname = DSname
                if(attributes(.GlobalEnv[[DSname]])$DSname != DSname) attributes(.GlobalEnv[[DSname]])$DSname = DSname
                if (!is.null(attributes(attributes(.GlobalEnv[[DSname]])$DSname)$.path_file)) {
                    message( "attributes(attributes(",DSname,")$DSname)$.path_file == ",deparse(attributes(attributes(get(DSname))$DSname)$.path_file) )
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSname, .path_file = attributes(attributes(.GlobalEnv[[DSname]])$DSname)$.path_file, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                } else {
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSname, .path4write = .path4write, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                }
            } else {  message("!exists(",deparse(DSname),")")  }
            cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
        }
    }
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    .objectname |> write_rds.ECHO.CodeText(EXECUTE_write_rds = FALSE, EXECUTE_write_rds_xz = FALSE)
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx") |> str_replace("^D:/D_Repositories", "D:/OneDrive/[][Rproject]")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)    
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.UTF8BOM.csv = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8BOM.csv") |> str_replace("^D:/D_Repositories", "D:/OneDrive/[][Rproject]")
    # if (Sys.info()["sysname"] == "Windows") {
    #     readr::write_excel_csv(get(.objectname), file = .path_FileName.UTF8BOM.csv) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    #     openxlsx2::xl_open(.path_FileName.UTF8BOM.csv)
    # } else {
    #     readr::write_excel_csv(get(.objectname), file = .path_FileName.UTF8BOM.csv|>paste0(".xz")) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    # }
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.UTF8.csv.xz = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8.csv.xz")
    # readr::write_csv(get(.objectname), file = .path_FileName.UTF8.csv.xz) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
}
if (Sys.getenv("PARENT_RENDERING") != "YES") {
    
}
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


