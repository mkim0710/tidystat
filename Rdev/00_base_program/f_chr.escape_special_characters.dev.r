---
# https://forum.posit.co/t/when-to-use-yaml-vs-when-to-use-setup-code-chunk/56169/
title: "`r params$doc_title`"
author: "MHKim"
date: "`r Sys.setlocale('LC_ALL', 'en_US.utf8'); format(Sys.time(), '%B %d, %Y')`"
output:
  html_notebook:  
    toc: yes
    toc_depth: 6
    toc_float:
      collapsed: false
      smooth_scroll: false
    number_sections: false
    code_folding: none
    df_print: tibble
    highlight: textmate
    fig_width: 10
    fig_height: 6
  html_document:
    toc: yes
    toc_depth: 6
    toc_float:
      collapsed: false
      smooth_scroll: false
    number_sections: false
    df_print: tibble
    code_folding: none
    highlight: textmate
    fig_width: 10
    fig_height: 6
  pdf_document: 
    toc: yes
    toc_depth: 6
    fig_width: 10
    fig_height: 6
    latex_engine: xelatex  # mainfont, sansfont, monofont, mathfont works only with xelatex and lualatex, but not pdflatex
    keep_tex: true
  word_document:
    toc: yes
    toc_depth: 6
    fig_width: 9
    fig_height: 6
# documentclass: scrartcl  # https://pandoc.org/MANUAL.html#variables-for-latex
# classoption: fontsize=9pt 
geometry: portrait, a3paper, margin=20mm # https://bookdown.org/yihui/rmarkdown/pdf-document.html#latex-options
# fontsize: 12pt
header-includes: 
  - \usepackage{fontspec}
  - \newcommand{\setfallbackfont}[4]{
      \IfFontExistsTF{#2}
        {#1{#2}}
        {\IfFontExistsTF{#3}
          {#1{#3}}
          {#1{#4}}}}
  # - \setfallbackfont{\setmainfont}{Roboto Condensed}{Noto Sans Condensed}{Arial Narrow}
  # - \setfallbackfont{\setsansfont}{Roboto Condensed}{Noto Sans Condensed}{Arial Narrow}
  - \setfallbackfont{\setmainfont}{Roboto}{Noto Sans}{Arial}
  - \setfallbackfont{\setsansfont}{Roboto}{Noto Sans}{Arial}
  - \setfallbackfont{\setmonofont}{Cascadia Code SemiBold}{Cascadia Code}{Fira Code}
  - \usepackage[hangul]{kotex}
  - \setfallbackfont{\setmainhangulfont}{NanumGothic}{HCR Dotum LVT}{Malgun Gothic}
  - \setfallbackfont{\setsanshangulfont}{NanumGothic}{HCR Dotum LVT}{Malgun Gothic}
  - \setfallbackfont{\setmonohangulfont}{D2Coding}{NanumGothicCoding}{NanumGothic}
params:
  doc_title: !r basename(rstudioapi::getSourceEditorContext()$path)
# https://stackoverflow.com/questions/55751815/r-markdown-difference-between-parameters-and-variables
# ?rmarkdown::html_document
---
<!-- https://stackoverflow.com/questions/28480625/r-knitr-markown-setting-html-page-width -->
<style type="text/css">
.main-content, .toc {max-width: 785px; margin: 0 auto; font-size: 1rem;} /* A4: 21cm x 29.7cm = 8.27in x 11.69in; 8.27in x 96px/in ≈ 793px */
html { font-size: 12px; }
body { font-size: 12px; font-family: 'Roboto Condensed', 'Noto Sans Condensed', 'Open Sans Condensed', 'Source Sans 3', 'Arial Narrow', Helvetica, sans-serif; }
h1.title { font-size: 28px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 14px; margin-bottom: 0; color: Navy; }
h1 { font-size: 24px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 12px; margin-bottom: 0; color: Navy; }
h2 { font-size: 21px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 11px; margin-bottom: 0; color: Navy; }
h3 { font-size: 18px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 9px; margin-bottom: 0; color: Navy; }
h4 { font-size: 16px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 8px; margin-bottom: 0; color: Navy; }
h5 { font-size: 14px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 7px; margin-bottom: 0; color: Navy; }
h6 { font-size: 12px; font-family: 'Roboto Serif', 'Noto Serif', 'Source Serif 4', serif; line-height: 1.1; margin-top: 6px; margin-bottom: 0; color: Navy; }
table, td, th, figure, figcaption { font-size: 10px; font-family: 'Roboto Condensed', 'Noto Sans Condensed', 'Open Sans Condensed', 'Source Sans 3', 'Arial Narrow', Helvetica, sans-serif; line-height: 1.1; margin-top: 5px; margin-bottom: 0; }
code { font-size: 11px; font-family: 'Cascadia Code SemiBold', 'Cascadia Code', 'Fira Code', Consolas, 'Source Code Pro', monospace; line-height: 1.1; margin-top: 6px; margin-bottom: 0; color: DimGray; background-color: Snow; }
pre { font-size: 11px; font-family: 'Cascadia Code SemiBold', 'Cascadia Code', 'Fira Code', Consolas, 'Source Code Pro', monospace; line-height: 1.1; margin-top: 6px; margin-bottom: 0; color: DimGray; background-color: Snow; }
</style>
  
<!-- font-size: 0.9em; /* 90% of inherited font size */ -->
  
<!-- Body text (body): The default font size is typically 16 pixels. -->
<!-- Paragraphs (p): Inherit the body's font size, so also typically 16 pixels. -->
<!-- List items (li): Inherit the body's font size, generally 16 pixels. -->
<!-- Headings (h1 to h6): The default sizes decrease with each level. For example: -->
<!-- h1: Typically around 32 pixels. -->
<!-- h2: Often around 24 pixels. -->
<!-- h3: Commonly around 18.72 pixels. -->
<!-- h4: Usually about 16 pixels. -->
<!-- h5: Generally around 13.28 pixels. -->
<!-- h6: Often about 10.72 pixels. -->
<!-- Blockquotes (blockquote): Usually inherit the body's font size, around 16 pixels. -->
<!-- Tables (table), table cells (td, th): Typically inherit the body's font size, so around 16 pixels. -->
<!-- Figures (figure) and figure captions (figcaption): Generally inherit the body's font size, so about 16 pixels. -->
<!-- 1: Approximately 8 pixels. -->
<!-- 2: Approximately 10 pixels. -->
<!-- 3: Approximately 12 pixels (this was often considered the default size). -->
<!-- 4: Approximately 14 pixels. -->
<!-- 5: Approximately 18 pixels. -->
<!-- 6: Approximately 24 pixels. -->
# _______________
<!-- {r Rstudio-RMarkDown-Shortcuts, eval=FALSE, include=FALSE} -->
<!-- ##### Rstudio RMarkDown Shortcuts -->
<!-- https://support.posit.co/hc/en-us/articles/200711853-Keyboard-Shortcuts-in-the-RStudio-IDE   -->
<!-- https://bookdown.org/yihui/rmarkdown-cookbook/rstudio-shortcuts.html   -->
<!-- Insert R chunk	Ctrl+Alt+I	Command+Option+I   -->
<!-- Preview HTML	Ctrl+Shift+K	Command+Shift+K   -->
<!-- Run all chunks above	Ctrl+Alt+P	Command+Option+P   -->
<!-- Run current chunk	Ctrl+Alt+C	Command+Option+C   -->
<!-- Run current chunk	Ctrl+Shift+Enter	Command+Shift+Enter   -->
<!-- Run next chunk	Ctrl+Alt+N	Command+Option+N   -->
<!-- Run all chunks	Ctrl+Alt+R	Command+Option+R   -->
<!-- Go to next chunk/title	Ctrl+PgDown	Command+PgDown   -->
<!-- Go to previous chunk/title	Ctrl+PgUp	Command+PgUp   -->
<!-- Show/hide document outline	Ctrl+Shift+O	Command+Shift+O   -->
<!-- F7 spell-check your document.   -->
<!-- Restart the R session   Ctrl + Alt + F10 (or Command + Option + F10 on macOS).   -->
<!--    -->
<!-- *** Caution: \% \$ \# \*   -->

  
```{r setup, echo=FALSE, results="hide"}
# ```{r setup, eval=TRUE, include=FALSE}
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
# str(knitr::opts_chunk$get())
# cat(deparse(knitr::opts_chunk$get(), width.cutoff=120), "\n", sep="")
# list(eval=TRUE, echo=TRUE, results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = "##",     highlight = TRUE, size = "normalsize", background = "#F7F7F7", strip.white = structure(TRUE, class = "AsIs"), cache = FALSE,     cache.path = "cache/", cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, autodep = FALSE, cache.rebuild = FALSE,     fig.keep = "high", fig.show = "asis", fig.align = "default", fig.path = "figure/", dev = NULL, dev.args = NULL, dpi = 72,     fig.ext = NULL, fig.width=7, fig.height=7, fig.env = "figure", fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:",     fig.subcap = NULL, fig.pos = "", out.width=NULL, out.height=NULL, out.extra = NULL, fig.retina = 1, external = TRUE,     sanitize = FALSE, interval = 1, aniopts = "controls,loop", warning = TRUE, error = TRUE, message = TRUE, render = NULL,     ref.label = NULL, child = NULL, engine = "R", split = FALSE, include = TRUE, purl = TRUE)
knitr::opts_chunk$set(
    eval=TRUE, echo=TRUE, results="markup", collapse=TRUE, # In Rstudio Notebook Source Pane & nb.HTML, results="hold" does not work
    comment="", fig.width=10, fig.height=6, # In Rstudio Notebook Source Pane & nb.HTML, comment="##" does not work?
    warning=TRUE, message=TRUE, include=TRUE, 
    error=FALSE,  # error=TRUE: show the errors without stopping R; error=FALSE: stop on error
    tidy.opts=list(width.cutoff=120), tidy=FALSE, 
    R.options = list(width=120), paged.print=FALSE
) 
# knitr::opts_chunk$set(message=TRUE) & {r, results="hide"} -> message shown in Rstudio Notebook Source Pane & knitted HTML, but not in Preview nb.HTML?!
# knitr::opts_chunk$set(message=FALSE) & {r, message=TRUE, results="hide"} -> message shown in Rstudio Notebook Source Pane & knitted HTML, but not in Preview nb.HTML?!
# *** results="hide": results shown only on Rstudio Notebook Source Pane, but not in nb.HTML nor knitted HTML
knitr::opts_knit$set(global.par = TRUE)


# ```{r options-width-NoEchoHideResults, echo=FALSE, results="hide"}
if(!exists("env1", envir=.GlobalEnv)) 
    assign("env1", new.env(), envir=.GlobalEnv)
if(!"info" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$info <- list()
env1$info$options.width = options()$width; cat(options()$width, "\n", sep="")


# ```{r loadPackages-NoEchoHideResults, echo=FALSE, results="hide"}
suppressPackageStartupMessages({for(packagename in c("tidyverse","formatR")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}});cat(" \n");
if(!exists("env1", envir=.GlobalEnv)) 
    assign("env1", new.env(), envir=.GlobalEnv)
## env1\$path ============  
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)  
## env1\$env.internal ============  
sourcename = "env1$env.internal" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
#### env1\$f_df.t.tribble_construct() ============  
sourcename = "f_df.t.tribble_construct" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# ```
#   
# <font size="3">\% env1</font>\  
#   
# ```{r env1-Info-NoEchoHideResults, echo=FALSE, results="hide"}
# https://yihui.org/knitr/options/#package-options
if(!exists("env1", envir=.GlobalEnv)) 
    assign("env1", new.env(), envir=.GlobalEnv)
if(!"info" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$info <- list()
#### env1\$info\$get_system_info() ============  
sourcename = "get_system_info" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
env1$info$info_system_info = env1$info$get_system_info()
# str(env1$info$info_system_info)
CodeText = "env1$info$info_system_info$machine_nodename"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
CodeText = "env1$info$info_system_info$Sys.getlocale$LC_COLLATE"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
# CodeText = "env1$info$info_system_info$l10n_info$localization_UTF8"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
env1$info$info_software_versions = env1$info$get_software_versions(library_names = c("tidyverse", "dplyr", "ggplot2", "purrr", "stringr", "datapasta","openxlsx"))
# str(env1$info$info_software_versions)


###### env1\$info\$DocumentTitle1 ============  
# ```{r env1-DocumentTitle1-NoEchoHideResults, echo=FALSE, results="hide"}
env1$info$DocumentTitle0 = paste0("00env1.minimum","-",basename(getwd()))
env1$info$DocumentTitle1 = paste0(env1$info$DocumentTitle0,"@", ifelse(grepl("MacBook-Pro", Sys.info()["nodename"]), "MBP", Sys.info()["nodename"]))
cat(env1$info$DocumentTitle0,"-",format(Sys.time(),"%y%m%d"), "\n", 
    env1$info$DocumentTitle0,"-",format(Sys.time(),"%y%m%d"),".Rmd", "\n", 
    env1$info$DocumentTitle0,"-dev",format(Sys.time(),"%y%m%d"),".Rmd", "\n", 
    env1$info$DocumentTitle0,"-clean",format(Sys.time(),"%y%m%d"),".Rmd", "\n", 
    sep="")
```
  
  
```{r env1-Path-NoEcho, echo=FALSE, results="markup", collapse=TRUE, paged.print=FALSE}
###### env1\$path ============  
# cat(" getwd() == "); dput(getwd()) #------------  
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
objectname = "path1"; object = env1$path$path0 |> paste0("/") |> paste0(env1$path$getwd |> str_replace(fixed(env1$path$path0), "") |> str_extract("[^/]+")); if(!objectname %in% names(env1$path)) {env1$path[[objectname]] = object};
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
paste0(env1$path$path1,"/",paste0("[Working Files List] ",basename(getwd()),".r")) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext)
# env1$path$project_base = "Rproject_HEALS0215"
# env1$path$data_suffix = "_01"
# # env1$path$data_suffix = ""
# env1$path$project_suffix = "GJ3"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$path4read = file.path(env1$path$path0, paste0(env1$path$project_base, env1$path$data_suffix))
# env1$path$path4write = file.path(env1$path$path4read, paste0(env1$path$project_base, env1$path$data_suffix, env1$path$project_suffix))
env1$path$path4read = ifelse(is.na(env1$path$path1), getwd(), env1$path$path1)
env1$path$path4write = getwd()
cat(" > str(env1$path)\n"); str(env1$path, max.level = 1, give.attr = F)  
path4read  = env1$path$path4read
path4write = env1$path$path4write
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# sourcename = "f_objectname.read.checkEntity" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# if (getwd() != path4write) warning("getwd() != path4write  == ") else cat(" getwd() == path4write == "); dput(path4write)  #------------  
```
  
  
#### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ------------  
```{r dfDIRsRecursive-NoEcho, echo=FALSE, results="markup", collapse=TRUE, paged.print=FALSE}
# #### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ------------  
# sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=".", print.message=FALSE)
# env1$path$print_tree_path = env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> 
#     dplyr::select(print_tree_path) |> unlist() |> paste(collapse="") 
# # env1$path$print_tree_path |> cat("\n")
# env1$path$print_tree_path_files.codes = env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> 
#     dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") 
# # env1$path$print_tree_path_files.codes |> cat("\n")
# env1$path$print_tree_path_files.data = env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> 
#     dplyr::select(print_tree_path_files.data) |> unlist() |> paste(collapse="") 
# env1$path$print_tree_path_files.data |> cat("\n")
```
  
  
#### env1\$f_path.size_files() ------------  
```{r sizeFiles-NoEchoNoMsgNoResults, echo=FALSE, warning=TRUE, message=NA, results="hide"}
# #### env1\$f_path.size_files() ------------  
# sourcename = "f_path.size_files" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# #### env1\$f_objectname.read.checkEntity() ------------  
# sourcename = "f_objectname.read.checkEntity" |> paste0(".source.r"); subpath=r"()"; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); suppressPackageStartupMessages(source( file.path(env1$path$source_base,subpath.filename.source.r) ))
# env1$f_path.size_files(path4read = path4read)
```
  
  
  
```{r open-envCustom-dfDirs-CodeBook, eval=TRUE, include=FALSE}
# if(!exists("env1", envir=.GlobalEnv)) 
#     assign("env1", new.env(), envir=.GlobalEnv)
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
# if(!"tmp" %in% names(env1)) env1$tmp = list()
# for (SourceFileBaseName in rev(c("00env1", "01df_dirs_recursive.df_files", "10CodeBook"))) {
#     env1$tmp$SourceFileName.ext = paste0(SourceFileBaseName,"-",basename(env1$path$path1),".Rmd");
#     if(env1$tmp$SourceFileName.ext != basename(env1$path$CurrentSource.path.filename.ext)) {
#         if(!file.exists(env1$tmp$SourceFileName.ext)) file.create(env1$tmp$SourceFileName.ext)
#         file.edit(env1$tmp$SourceFileName.ext);
#         file.edit(env1$path$CurrentSource.path.filename.ext);
#     }
# }
```
  
  
# @@ CODEBOOK ------------  
  
  
#@@ START) problem ------------  
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

```
  

```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

```
  
  
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

```
  
  
#@@ START) dev) f_chr.escape_special_characters ------------  
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
library(stringr)

vec_str.test = 
    c("D:\\OneDrive\\[Rproject]\\github",
      "D:/OneDrive/[Rproject]/github",
      "D:/OneDrive/{Rproject}/github",
      "D:/OneDrive/(Rproject)/github",
      "D:/OneDrive/R+project/github",
      "D:/OneDrive/R*project/github",
      "D:/OneDrive/R?project/github",
      "D:/OneDrive/R^project/github",
      "D:/OneDrive/R$project/github",
      "D:/OneDrive/R|project/github",
      "D:/OneDrive/R.project/github",
      "D:/OneDrive/R-project/github")
```


# \$ escape_special_characters.str_replace_all() 
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
# Function to escape special characters in a string for use in regex
escape_special_characters.str_replace_all <- function(string) {
  str_replace_all(string, "([]\\[{}()+*?^$|.-])", "\\\\\\1")
}

result.str_replace_all = vec_str.test |> map(escape_special_characters.str_replace_all)
result.str_replace_all |> str()
```


# \$ escape_special_characters.str_replace_all_v2() 
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
# Function to escape special characters in a string for use in regex
escape_special_characters.str_replace_all_v2 <- function(string) {
  str_replace_all(string, "([\\[\\]{}()+*?^$|.-])", "\\\\\\1")
}

result.str_replace_all = vec_str.test |> map(escape_special_characters.str_replace_all_v2)
result.str_replace_all |> str()
result.str_replace_all |> identical(result.str_replace_all)
```
  
  
# \$ escape_special_characters.gsub() 
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
library(stringr)
# Function to escape special characters in a string for use in regex
escape_special_characters.gsub <- function(string) {
  gsub("([][{}()+*?^$|.-])", "\\\\\\1", string)
}

result.gsub = vec_str.test |> map(escape_special_characters.gsub)
result.gsub |> str()
result.gsub |> identical(result.str_replace_all)
```


# \$ escape_special_characters.gsub_v2() 
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
library(stringr)

# Function to escape special characters in a string for use in regex
escape_special_characters.gsub_v2 <- function(string) {
  gsub("([\\[\\]{}()+*^$|.])", "\\\\\\1", string)
}

result.gsub_v2 = vec_str.test |> map(escape_special_characters.gsub_v2)
result.gsub_v2 |> str()
result.gsub_v2 |> identical(result.str_replace_all)
```


```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

```
  

```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

```
  
  
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

```
  
  
# @@ END ------------  
```{r END-NoEvalNoEchoNoMsgNoResults, eval=FALSE, echo=FALSE, warning=TRUE, message=NA, results="hide", collapse=TRUE, paged.print=FALSE}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ END ------------  
```
  
  
```{r updateTemplateNotebook-NoEchoNoResults, eval=TRUE, echo=FALSE, warning=TRUE, message=TRUE, results="hide", collapse=TRUE, paged.print=FALSE}
# @@ update tempate (notebook.Rmd) ------------   
env1$path$RTemplate.filename.ext = "notebook.Rmd"  
env1$path$MyTemplate.filename.ext = "templates-00env1.minimum.Rmd"  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", ""); 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
if (.Platform$OS.type == "windows") {
    if(basename(env1$path$CurrentSource.path.filename.ext) == env1$path$MyTemplate.filename.ext) {
        if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = normalizePath(file.path(Sys.getenv("APPDATA"), "RStudio"),winslash="/") |> str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = normalizePath("~/.config/rstudio")} ;
        destination_path = file.path(path4APPDATA_RStudio, "templates"); if(!dir.exists(destination_path)) dir.create(destination_path, recursive=TRUE) ; cat('browseURL("',destination_path,'")',"\n", sep="") ;
        destination_path.filename.ext = file.path(destination_path, env1$path$RTemplate.filename.ext);
        backup_to_path = file.path(env1$path$path0, "-backup") ; env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = destination_path.filename.ext, backup_to_path=backup_to_path) ; cat('%windir%\\explorer.exe "',backup_to_path|>normalizePath(winslash="\\"),'"',"\n", sep="") ;
        if(.Platform$OS.type == "windows") {browseURL(backup_to_path)}
        
        if(file.copy(from=env1$path$CurrentSource.path.filename.ext, to=destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", destination_path.filename.ext)) else warning(paste0("Update failed: ", destination_path.filename.ext));  
        # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(destination_path.filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",destination_path.filename.ext),wait=FALSE)};
        
        for ( destination_path.filename.ext in c(
            file.path(env1$path$source_base_local, "rstudio-prefs", "templates", env1$path$MyTemplate.filename.ext)
            , file.path(env1$path$path0, "Rproject_Rmd", env1$path$MyTemplate.filename.ext)
        )) {if(dir.exists(dirname(destination_path.filename.ext)) & env1$path$CurrentSource.path.filename.ext|>normalizePath(winslash="/") != destination_path.filename.ext) {
            if(file.copy(from=env1$path$CurrentSource.path.filename.ext, to=destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", destination_path.filename.ext)) else warning(paste0("Update failed: ", destination_path.filename.ext));
            # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(destination_path.filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",destination_path.filename.ext),wait=FALSE)};
        }}
        file.edit(env1$path$CurrentSource.path.filename.ext);
    }
    # if(!file.exists(file.path(path4APPDATA_RStudio, "templates", env1$path$RTemplate.filename.ext))) file.create(file.path(path4APPDATA_RStudio, "templates", env1$path$MyTemplate.filename.ext)); file.edit(file.path(path4APPDATA_RStudio, "templates", env1$path$RTemplate.filename.ext))
} 
```
  
  
```{r writeRDS-NoEcho, eval=TRUE, echo=FALSE, warning=TRUE, message=TRUE, results="markdown", collapse=TRUE, paged.print=FALSE}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# # @ write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds"))) ------------  
# objectname = "AnalyticDataset200621"
# system.time(write_rds( get(objectname), paste0(objectname,".rds") ))
# system.time(write_rds( get(paste0(objectname,".NA",".rmAllNA",".fct")), paste0(objectname,".NA",".rmAllNA",".fct",".rds") ))
# # system.time(write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds"))))
# # system.time(write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds")), compress = "gz" ))
# # system.time(write_rds( get(objectname), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 ))
# # system.time(openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
# # if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname, ".xlsx"))
```
  
  
```{r createBackup, eval=TRUE, include=FALSE}
if (Sys.getenv("PARENT_RENDERING") != "YES") {
    # if (.Platform$OS.type == "windows") {
        env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = rstudioapi::getSourceEditorContext()$path|>str_replace("\\.([[:alnum:]]+)$",".Rmd"), backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
        # env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = rstudioapi::getSourceEditorContext()$path|>str_replace("\\.([[:alnum:]]+)$",".nb.html"), backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
    # }
}
```
  
  
```{r Render, eval=TRUE, include=FALSE}
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.pdf = env1$path$CurrentSource.path.filename.ext |> str_replace("\\.([[:alnum:]]+)$",".pdf")
env1$path$CurrentSource.path.filename.html = env1$path$CurrentSource.path.filename.ext |> str_replace("\\.([[:alnum:]]+)$",".html")
if (Sys.getenv("PARENT_RENDERING") != "YES") {
    if (.Platform$OS.type == "windows") {
        tlmgr_installed_packages <- system2("tlmgr", args = c("info", "--list", "--only-installed"), stdout = TRUE)
        font_name = "roboto"; if(tlmgr_installed_packages |> str_subset(font_name) |> length() == 0) tinytex::tlmgr_install(font_name)
        font_name = "cascadia-code"; if(tlmgr_installed_packages |> str_subset(font_name) |> length() == 0) tinytex::tlmgr_install(font_name)
        cat('Starting: rstudioapi::getSourceEditorContext()$path |> rmarkdown::render(output_format = "pdf_document") \n')
        Sys.setenv(PARENT_RENDERING = "YES"); env1$path$CurrentSource.path.filename.ext |> rmarkdown::render(output_format = "pdf_document"); Sys.setenv(PARENT_RENDERING = "NO")
        env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = env1$path$CurrentSource.path.filename.pdf, backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
        env1$env.internal$f_file_PDF.sumatra(env1$path$CurrentSource.path.filename.pdf)
    }
}
# cat(' Sys.setenv(PARENT_RENDERING = "YES"); "',env1$path$CurrentSource.path.filename.ext,'" |> rmarkdown::render(output_format = "pdf_document"); Sys.setenv(PARENT_RENDERING = "NO")',"\n", 
#     ' if (.Platform$OS.type == "windows") { env1$env.internal$f_file_PDF.sumatra("',env1$path$CurrentSource.path.filename.pdf,'") } else { browseURL("',env1$path$CurrentSource.path.filename.pdf,'") }',"\n",
#     ' env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = "',env1$path$CurrentSource.path.filename.pdf,'", backup_to_path="-backup", timeFormat="%y%m%d", overwrite=TRUE)',"\n", sep="")
# cat("    ________________________________________________________________________    \n")
cat(' Sys.setenv(PARENT_RENDERING = "YES"); "',env1$path$CurrentSource.path.filename.ext,'" |> rmarkdown::render(output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO")',"\n", 
    ' if (.Platform$OS.type == "windows") { system("\\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\\" --app=\\"',env1$path$CurrentSource.path.filename.html |> normalizePath(winslash="/", mustWork = FALSE),'\\"") } else { browseURL("',env1$path$CurrentSource.path.filename.html,'") }',"\n",
    ' env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = "',env1$path$CurrentSource.path.filename.html,'", backup_to_path="-backup", timeFormat="%y%m%d", overwrite=TRUE)',"\n", sep="")
```
  
  
```{r gitCheckout, eval=TRUE, include=FALSE}
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.nb.html = env1$path$CurrentSource.path.filename.ext |> str_replace("\\.([[:alnum:]]+)$",".nb.html")
if (.Platform$OS.type == "windows" && Sys.getenv("PARENT_RENDERING") != "YES") { paste0('ping -n 5 127.0.0.1 > nul & "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',env1$path$CurrentSource.path.filename.nb.html|>normalizePath(winslash="/"),'"') |> shell(wait=FALSE) } # else { browseURL(env1$path$CurrentSource.path.filename.nb.html) }
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
cat(" * To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',env1$path$CurrentSource.path.filename.ext,'" |> system(intern=TRUE)',"\n",
    '"git checkout -- ',env1$path$CurrentSource.path.filename.nb.html,'" |> system(intern=TRUE)',"\n", sep="")
```
  
  
