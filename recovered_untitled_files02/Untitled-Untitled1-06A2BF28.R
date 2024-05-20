---
# https://forum.posit.co/t/when-to-use-yaml-vs-when-to-use-setup-code-chunk/56169/
title: "`r params$doc_title`"
author: "MHKim"
date: "`r format(Sys.time(), '%B %d, %Y')`"
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
mainfont: Arial
monofont: Consolas
header-includes: 
  - \usepackage{kotex}
  - \usepackage{fontspec}
  - \setmainhangulfont{HCR Batang}
  - \setsanshangulfont{HCR Dotum}
  - \setmonohangulfont{HCR Dotum}
params:
  doc_title: !r basename(rstudioapi::getSourceEditorContext()$path)
# https://stackoverflow.com/questions/55751815/r-markdown-difference-between-parameters-and-variables
# ?rmarkdown::html_document
---
<!-- https://stackoverflow.com/questions/28480625/r-knitr-markown-setting-html-page-width -->
<style type="text/css">
.main-content, .toc {max-width: 785px; margin: 0 auto; font-size: 1rem;} /* A4: 21cm x 29.7cm = 8.27in x 11.69in; 8.27in x 96px/in ≈ 793px */
html { font-size: 12px; }
body { font-size: 12px; font-family: 'Arial', 'Helvetica', sans-serif; }
h1.title { font-size: 28px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 14px; margin-bottom: 0; color: Navy; }
h1 { font-size: 24px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 12px; margin-bottom: 0; color: Navy; }
h2 { font-size: 21px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 11px; margin-bottom: 0; color: Navy; }
h3 { font-size: 18px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 9px; margin-bottom: 0; color: Navy; }
h4 { font-size: 16px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 8px; margin-bottom: 0; color: Navy; }
h5 { font-size: 14px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 7px; margin-bottom: 0; color: Navy; }
h6 { font-size: 12px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 6px; margin-bottom: 0; color: Navy; }
table, td, th, figure, figcaption { font-size: 10px; font-family: 'Arial', 'Helvetica', sans-serif; line-height: 1.1; margin-top: 5px; margin-bottom: 0; }
code { font-size: 12px; font-family: 'Cascadia Code SemiBold', Consolas, 'Source Code Pro', monospace; line-height: 1.1; margin-top: 6px; margin-bottom: 0; color: DimGray; background-color: Snow; }
pre { font-size: 12px; font-family: 'Cascadia Code SemiBold', Consolas, 'Source Code Pro', monospace; line-height: 1.1; margin-top: 7px; margin-bottom: 0; color: DimGray; background-color: Snow; }
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
```{r Rstudio-RMarkDown-Shortcuts, eval=FALSE, include=FALSE}
# ##### Rstudio RMarkDown Shortcuts
# https://support.posit.co/hc/en-us/articles/200711853-Keyboard-Shortcuts-in-the-RStudio-IDE  
# https://bookdown.org/yihui/rmarkdown-cookbook/rstudio-shortcuts.html  
# Insert R chunk	Ctrl+Alt+I	Command+Option+I\
# Preview HTML	Ctrl+Shift+K	Command+Shift+K\
# Run all chunks above	Ctrl+Alt+P	Command+Option+P\
# Run current chunk	Ctrl+Alt+C	Command+Option+C\
# Run current chunk	Ctrl+Shift+Enter	Command+Shift+Enter\
# Run next chunk	Ctrl+Alt+N	Command+Option+N\
# Run all chunks	Ctrl+Alt+R	Command+Option+R\
# Go to next chunk/title	Ctrl+PgDown	Command+PgDown\
# Go to previous chunk/title	Ctrl+PgUp	Command+PgUp\
# Show/hide document outline	Ctrl+Shift+O	Command+Shift+O\
# F7 spell-check your document.\
# Restart the R session   Ctrl + Alt + F10 (or Command + Option + F10 on macOS).\
# \
# *** Caution: \% \$ \# \* \
```


```{r setup, eval=TRUE, include=FALSE}
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
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
    tidy.opts=list(width.cutoff=120), tidy=TRUE, 
    R.options = list(width=120), paged.print=FALSE
) 
# knitr::opts_chunk$set(message=TRUE) & {r, results="hide"} -> message shown in Rstudio Notebook Source Pane & knitted HTML, but not in Preview nb.HTML?!
# knitr::opts_chunk$set(message=FALSE) & {r, message=TRUE, results="hide"} -> message shown in Rstudio Notebook Source Pane & knitted HTML, but not in Preview nb.HTML?!
# *** results="hide": results shown only on Rstudio Notebook Source Pane, but not in nb.HTML nor knitted HTML
knitr::opts_knit$set(global.par = TRUE)
```


```{r options-width-NoEchoHideResults, echo=FALSE, results="hide"}
if(!exists("env.custom", envir=.GlobalEnv)) 
    assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"info" %in% names(env.custom)) env.custom$info = list()
env.custom$info$options.width = options()$width; cat(options()$width, "\n", sep="")
```


```{r loadPackages-NoEchoHideResults, echo=FALSE, results="hide"}
suppressPackageStartupMessages({for(packagename in c("tidyverse","formatR")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}});cat("\n");
if(!exists("env.custom", envir=.GlobalEnv)) 
    assign("env.custom", new.env(), envir=.GlobalEnv)
## env.custom\$path ====
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
## env.custom\$env.internal ====
sourcename = "env.custom$env.internal"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); suppressPackageStartupMessages(source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
#### env.custom\$f_df.t.tribble_construct() ====
sourcename = "f_df.t.tribble_construct"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); suppressPackageStartupMessages(source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
```

<font size="3">\% env.custom</font>\

```{r envCustom-Info-NoEchoHideResults, echo=FALSE, results="hide"}
# https://yihui.org/knitr/options/#package-options
if(!exists("env.custom", envir=.GlobalEnv)) 
    assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"info" %in% names(env.custom)) env.custom$info = list()
#### env.custom\$info\$get_system_info() ====
sourcename = "get_system_info"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); suppressPackageStartupMessages(source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
env.custom$info$info_system_info = env.custom$info$get_system_info()
# str(env.custom$info$info_system_info)
CodeText = "env.custom$info$info_system_info$machine_nodename"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
CodeText = "env.custom$info$info_system_info$Sys.getlocale$LC_COLLATE"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
# CodeText = "env.custom$info$info_system_info$l10n_info$localization_UTF8"; cat(CodeText, ' = "', eval(parse(text=CodeText)), '"', "\n", sep="")
env.custom$info$info_software_versions = env.custom$info$get_software_versions(library_names = c("tidyverse", "dplyr", "ggplot2", "purrr", "stringr", "datapasta","openxlsx"))
# str(env.custom$info$info_software_versions)
```


###### env.custom\$info\$DocumentTitle1 ====
```{r envCustom-DocumentTitle1-NoEchoHideResults, echo=FALSE, results="hide"}
env.custom$info$DocumentTitle0 = paste0("00env.custom.minimum","-",basename(getwd()))
env.custom$info$DocumentTitle1 = paste0(env.custom$info$DocumentTitle0,"@", ifelse(grepl("MacBook-Pro", Sys.info()["nodename"]), "MBP", Sys.info()["nodename"]))
cat(env.custom$info$DocumentTitle0,"-",format(Sys.time(),"%y%m%d"), "\n", 
    env.custom$info$DocumentTitle0,"-",format(Sys.time(),"%y%m%d"),".Rmd", "\n", 
    env.custom$info$DocumentTitle0,"-dev",format(Sys.time(),"%y%m%d"),".Rmd", "\n", 
    env.custom$info$DocumentTitle0,"-clean",format(Sys.time(),"%y%m%d"),".Rmd", "\n", 
    sep="")
```


###### env.custom\$path ====
```{r envCustom-Path-NoEcho, echo=FALSE, results="markup", collapse=TRUE, paged.print=FALSE}
# cat("getwd() == "); dput(getwd()) #----
# env.custom$path$project_base = "Rproject_HEALS0215"
# env.custom$path$data_suffix = "_01"
# # env.custom$path$data_suffix = ""
# env.custom$path$project_suffix = "GJ3"
# 
# env.custom$path$path4read = file.path(env.custom$path$path0, paste0(env.custom$path$project_base, env.custom$path$data_suffix))
# env.custom$path$path4write = file.path(env.custom$path$path4read, paste0(env.custom$path$project_base, env.custom$path$data_suffix, env.custom$path$project_suffix))
env.custom$path$path4read = ifelse(is.na(env.custom$path$path1), getwd(), env.custom$path$path1)
env.custom$path$path4write = getwd()
cat("> str(env.custom$path)\n"); str(env.custom$path, max.level = 1, give.attr = F)  
path4read  = env.custom$path$path4read
path4write = env.custom$path$path4write
# sourcename = "f_objectname.read.checkEntity"; subpath=""; subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); suppressPackageStartupMessages(source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
# if (getwd() != path4write) warning("getwd() != path4write  == ") else cat("getwd() == path4write == "); dput(path4write)  #----
```




#@@ START) background -----


###@ Directory Listing -----
session-36531e49/
├── 10460832
├── 10460832-contents
├── 638F50C0
├── 638F50C0-contents
├── 690764CF
├── 690764CF-contents
...

###@ Metadata File Structure -----
{
  "path": "/path/to/original/file.R",
  "contents": "print('Hello, world!')",
  "properties": {
    "tempName": "Untitled",
    "dirty": true
  },
  "type": "r_source"
}

###@ Content File -----
print('Hello, world!')


```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
# https://chatgpt.com/c/8899ed03-9f26-42cc-9b0e-dd5aa3ad22a0

#@ Directory Listing -----
# session-36531e49/
# ├── 10460832
# ├── 10460832-contents
# ├── 638F50C0
# ├── 638F50C0-contents
# ├── 690764CF
# ├── 690764CF-contents
# ...

#@ Metadata File Structure -----
# {
#   "path": "/path/to/original/file.R",
#   "contents": "print('Hello, world!')",
#   "properties": {
#     "tempName": "Untitled",
#     "dirty": true
#   },
#   "type": "r_source"
# }

#@ Content File -----
# print('Hello, world!')


```


### \$ function_setdiff ======
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
function_setdiff = function(x, y) {
    out = list()
    out$setdiff_x_y = setdiff(x, y)
    out$setdiff_y_x = setdiff(y, x)
    out
}
```


##### > ".Rproj.user/shared" |> list.files(recursive = TRUE) |> deparse() |> cat() ----
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
# ".Rproj.user/shared" |> list.files(recursive = TRUE) |> deparse() |> cat()
.Rproj.user.shared.list.files1 = c("notebooks/40C0E44C-data.CreateTableOne.dev/1/E3EEE3A9702e3c18/chunks.json", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/E3EEE3A9800d5f74/chunks.json", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/E3EEE3A9a2e5d569/chunks.json", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/c2kv2ircdtmr9/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/c2x3oh7bg7vcn/00000f.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/c49999ibehcer/00000f.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/c4tzsvl4tx3z9/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cajqc0s3qa66a/00000f.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cajqc0s3qa66a/000010.error", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cfodvqfdr55z9/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cfypu2gan1bf2/00000f.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/chunks.json", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cin2ot4z8d41v/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/clrumf873fdfj/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cpqgn7q99rlw9/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/csetup_chunk/00000f.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cw2w3ivglpk94/000002.csv", 
"notebooks/40C0E44C-data.CreateTableOne.dev/1/s/cyymmc3upsdwu/000002.csv", 
"notebooks/5F81EFC4-01df_dirs_recursive.df_files-templates/1/s/c23qhhe5x2wrv/000002.csv", 
"notebooks/5F81EFC4-01df_dirs_recursive.df_files-templates/1/s/ce4o8kuj7o02a/000002.csv", 
"notebooks/5F81EFC4-01df_dirs_recursive.df_files-templates/1/s/chunks.json", 
"notebooks/5F81EFC4-01df_dirs_recursive.df_files-templates/1/s/cq21394qy6r6k/000002.csv", 
"notebooks/5F81EFC4-01df_dirs_recursive.df_files-templates/1/s/ct8kr3u95vsyn/000002.csv", 
"notebooks/5F81EFC4-01df_dirs_recursive.df_files-templates/1/s/cz29vill2otj7/000002.csv", 
"notebooks/6E4A1B4B-notebook/1/s/chunks.json", "notebooks/7A8FA73D-templates-00env.custom.minimum/1/E3EEE3A910067b8e/chunks.json", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/E3EEE3A917269cd5/chunks.json", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/c0uhg07q4d6fw/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/c10zsbyhuapsu/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/c2q3crr2qp3k8/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/c4o0rc7cr9pd0/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/c9297t90t4hiu/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/c9s76zfo3myti/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cbt3e1r4e3pgf/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cc2yziwhumm4a/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cce82lv80a8k7/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/ccj7funk5py3r/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/ccqfmd35do6vt/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cdl7qmkmkptfy/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cfkz173fnuh1r/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cg8yioy5sh7bn/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/chunks.json", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/chv0zlu3fsbxe/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/ciys6e08fee9h/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/ck58a5ff0jky2/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cmdj6ori11p58/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cn5544fos7006/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/crxqix184nn6r/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/csetup_chunk/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cuhej75jwtdsk/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cwsleju1hudba/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/cz2jiobqp5w72/00000f.csv", 
"notebooks/7A8FA73D-templates-00env.custom.minimum/1/s/czjehx3ly9n68/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/c0t9ghu2buef2/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/c99b55eelqwnh/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/ceh5ibu3bdppz/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/ch46cpe3wctnu/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/chunks.json", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cilmqv1876xll/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cipmsbib7861f/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cl1gjdhn5sge3/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cqq7blt8svvkv/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/csetup_chunk/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cuasmwvhip0fy/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cuigrrxwohy23/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cuzpcsb8h0w1d/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cyp5frst94ane/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cyrnlj0ymdq5k/00000f.csv", 
"notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/czk7rsj2uariz/00000f.csv", 
"notebooks/patch-chunk-names", "notebooks/paths")
```


##### > function_setdiff(".Rproj.user/shared" |> list.files(recursive = TRUE), .Rproj.user.shared.list.files1) |> str() ----
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
function_setdiff(".Rproj.user/shared" |> list.files(recursive = TRUE), .Rproj.user.shared.list.files1) |> str()
# > function_setdiff(".Rproj.user/shared" |> list.files(recursive = TRUE), .Rproj.user.shared.list.files1) |> str()
# List of 2
#  $ setdiff_x_y: chr(0) 
#  $ setdiff_y_x: chr "notebooks/6E4A1B4B-notebook/1/s/chunks.json"

```


##### > ".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE) |> dput() ----
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
# ".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE) |> dput()
.Rproj.user.E3EEE3A9.list.files1 = c("build_options", "copilot_options", "pcs/debug-breakpoints.pper",  "pcs/files-pane.pper", "pcs/packages-pane.pper", "pcs/source-pane.pper",  "pcs/windowlayoutstate.pper", "pcs/workbench-pane.pper", "persistent-state",  "saved_source_markers", "sources/prop/00965602", "sources/prop/0173D0A4",  "sources/prop/01AFB2EE", "sources/prop/05634E50", "sources/prop/0AA78314",  "sources/prop/101D96B9", "sources/prop/113E96D9", "sources/prop/15FCA076",  "sources/prop/16D60B62", "sources/prop/1B55F4AB", "sources/prop/1BB6DB06",  "sources/prop/1E9AB7AC", "sources/prop/1FFD9AC9", "sources/prop/2BDE767F",  "sources/prop/31C6C727", "sources/prop/364F61EC", "sources/prop/3742BDF1",  "sources/prop/3BA1EBD7", "sources/prop/3CF4DF68", "sources/prop/4105D26C",  "sources/prop/52FF770D", "sources/prop/57A92AF6", "sources/prop/5D8401EF",  "sources/prop/607BBC65", "sources/prop/64FF6493", "sources/prop/669F62A1",  "sources/prop/66A1D830", "sources/prop/67AAF20A", "sources/prop/685820B2",  "sources/prop/74656519", "sources/prop/77B63436", "sources/prop/7829259C",  "sources/prop/78B040BB", "sources/prop/7C7E305C", "sources/prop/7F844DC9",  "sources/prop/8AB57F3A", "sources/prop/8B245126", "sources/prop/9300290C",  "sources/prop/9444F480", "sources/prop/A0D94AC6", "sources/prop/A3F1A976",  "sources/prop/A664679E", "sources/prop/ABD3A4CD", "sources/prop/AC79737C",  "sources/prop/AFCC3AF9", "sources/prop/B0ABAF46", "sources/prop/B211075A",  "sources/prop/B3C86916", "sources/prop/B7C7B529", "sources/prop/B7D4047D",  "sources/prop/C1B2E00B", "sources/prop/C4D0A2D8", "sources/prop/CE5A4575",  "sources/prop/DBBE575C", "sources/prop/DF016A9E", "sources/prop/EA5E63B2",  "sources/prop/EF0AC0FE", "sources/prop/EF6E1100", "sources/prop/F829F38F",  "sources/prop/FD96AF4D", "sources/prop/FF1B8126", "sources/prop/FFA35E83",  "sources/prop/INDEX", "sources/session-36531e49/0E61B345-contents",  "sources/session-36531e49/10460832", "sources/session-36531e49/10460832-contents",  "sources/session-36531e49/174795B9-contents", "sources/session-36531e49/22452B12",  "sources/session-36531e49/22452B12-contents", "sources/session-36531e49/2A20CF9B-contents",  "sources/session-36531e49/38603E6E-contents", "sources/session-36531e49/46548A49-contents",  "sources/session-36531e49/528BC5EF-contents", "sources/session-36531e49/556D77EE-contents",  "sources/session-36531e49/5B0523FC-contents", "sources/session-36531e49/5D26FF15-contents",  "sources/session-36531e49/638F50C0", "sources/session-36531e49/638F50C0-contents",  "sources/session-36531e49/690764CF", "sources/session-36531e49/690764CF-contents",  "sources/session-36531e49/71F59863-contents", "sources/session-36531e49/8249F163",  "sources/session-36531e49/8249F163-contents", "sources/session-36531e49/8A69B8E1-contents",  "sources/session-36531e49/8C2A2429-contents", "sources/session-36531e49/9879D8CD",  "sources/session-36531e49/9879D8CD-contents", "sources/session-36531e49/A05040E0",  "sources/session-36531e49/A05040E0-contents", "sources/session-36531e49/AB6A0C82-contents",  "sources/session-36531e49/C1B3DBFF-contents", "sources/session-36531e49/CA927474-contents",  "sources/session-36531e49/CF32D5C1-contents", "sources/session-36531e49/D14D3FDE",  "sources/session-36531e49/D14D3FDE-contents", "sources/session-36531e49/D4502CEB",  "sources/session-36531e49/D4502CEB-contents", "sources/session-36531e49/E01BF946",  "sources/session-36531e49/E01BF946-contents", "sources/session-36531e49/E284179F-contents",  "sources/session-36531e49/F29AB6E7", "sources/session-36531e49/F29AB6E7-contents",  "sources/session-36531e49/FB61A0E1-contents", "sources/session-36531e49/FFF77695",  "sources/session-36531e49/FFF77695-contents", "sources/session-36531e49/lock_file" )
```




##### > function_setdiff(".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE), .Rproj.user.E3EEE3A9.list.files1) |> str() ----
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
function_setdiff(".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE), .Rproj.user.E3EEE3A9.list.files1) |> str()
# > function_setdiff(".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE), .Rproj.user.E3EEE3A9.list.files1) |> str()
# List of 2
#  $ setdiff_x_y: chr [1:25] "sources/prop/5057B9B6" "sources/prop/C8C3257E" "sources/session-bc8d1df6/10460832" "sources/session-bc8d1df6/10460832-contents" ...
#  $ setdiff_y_x: chr [1:43] "sources/session-36531e49/0E61B345-contents" "sources/session-36531e49/10460832" "sources/session-36531e49/10460832-contents" "sources/session-36531e49/174795B9-contents" ...

```



#@@ START) source -----
### \$ subpath, sourcename ======
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
# subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(subpath!="") utils::browseURL(normalizePath(subpath))
# sourcename = "default.template"
# subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# # % (source( file.path(env.custom$path$source_base,subpath.filename.source.r) )) ----
# (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
```


### \$ function -dev ======
```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)
library(jsonlite)

# Define the path to the sources directory
sources_dir <- file.path(".Rproj.user", "E3EEE3A9", "sources")
print(sources_dir)

# List all directories in the sources directory
list.dirs(file.path(".Rproj.user", "E3EEE3A9", "sources"), recursive = FALSE)
print(list.dirs(sources_dir, recursive = FALSE))
all_dirs <- list.dirs(sources_dir, recursive = FALSE)
print(all_dirs)

session_dirs <- all_dirs[grepl("session-", basename(all_dirs))]

print("List of session directories:")
print(session_dirs)
```


```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
# Check if there are any session directories
if (length(session_dirs) == 0) {
  stop("No session directories found.")
}

# Get the most recent session directory
most_recent_session <- session_dirs[which.max(file.info(session_dirs)$mtime)]

print(paste("Most recent session directory:", most_recent_session))

# List all files in the most recent session directory
session_files <- list.files(most_recent_session, full.names = TRUE)
print("List of session files:")
print(session_files)

# Create output folder if it doesn't exist
out_folder <- "recovered_untitled_files"
dir.create(out_folder, showWarnings = FALSE)

# Function to read and recover an untitled source file
recover_untitled_source_file <- function(metadata_file, content_file, out_folder) {
  # Read the metadata
  metadata <- fromJSON(metadata_file)
  print(paste("Processing metadata file:", metadata_file))
  print(metadata)
  
  # Determine the output filename
  if (!is.null(metadata$properties$tempName)) {
    filename <- metadata$properties$tempName
  } else {
    filename <- basename(metadata_file)
  }
  
  # Add a unique identifier to the filename to avoid conflicts
  filename <- paste0("Untitled-", filename, "-", basename(metadata_file))
  
  # Read the contents
  contents <- if (file.exists(content_file) && file.info(content_file)$size > 0) {
    readLines(content_file)
  } else if (!is.null(metadata$contents) && nchar(metadata$contents) > 0) {
    metadata$contents
  } else {
    "No contents found"
  }
  
  # Determine the output path
  target <- file.path(out_folder, paste0(filename, ".R"))
  
  # Write the contents to the target file
  writeLines(contents, con = target)
  
  # Return the path to the recovered file
  return(target)
}

# Iterate over session files to recover metadata and contents for untitled files
recovered_files <- lapply(session_files, function(file) {
  if (!grepl("-contents$", file)) {
    content_file <- paste0(file, "-contents")
    print(paste("Checking file:", file))
    if (file.exists(content_file)) {
      print(paste("Content file exists:", content_file))
      metadata <- fromJSON(file)
      print(paste("Metadata content:", toJSON(metadata, pretty = TRUE)))
      if (!is.null(metadata$properties$tempName) && grepl("Untitled", metadata$properties$tempName)) {
        print(paste("Recovering untitled file:", file))
        return(recover_untitled_source_file(file, content_file, out_folder))
      } else {
        print(paste("File", file, "is not untitled or has no tempName."))
      }
    } else {
      print(paste("Content file does not exist for metadata file:", file))
    }
  } else {
    print(paste("File", file, "is a content file, skipping."))
  }
  return(NULL)
})

# Print the paths of recovered files
print("Recovered files:")
print(recovered_files)
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


```{r, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
options(width=120)

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
```{r END-NoEvalNoEchoNoMsgNoResults, eval=FALSE, echo=FALSE, warning=TRUE, message=FALSE, results="hide", collapse=TRUE, paged.print=FALSE}
# @@ END ------------
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
```


```{r RenderMessages, eval=FALSE, include=FALSE}
# dput(names(knitr::knit_engines$get()))
```


```{r writeRDS-NoEcho, eval=TRUE, echo=FALSE, warning=TRUE, message=TRUE, results="markdown", collapse=TRUE, paged.print=FALSE}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# # @ write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds"))) -----
# objectname = "AnalyticDataset200621"
# system.time(write_rds( get(objectname), paste0(objectname,".rds") ))
# system.time(write_rds( get(paste0(objectname,".NA",".rmAllNA",".fct")), paste0(objectname,".NA",".rmAllNA",".fct",".rds") ))
# # system.time(write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds"))))
# # system.time(write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds")), compress = "gz" ))
# # system.time(write_rds( get(objectname), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 ))
# # system.time(openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
# # openxlsx::openXL(paste0(objectname, ".xlsx"))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
```


