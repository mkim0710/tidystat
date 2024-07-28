# function.checkpoint.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/get_system_info.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.get_cpu_internal.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.checkpoint.dev.r

get_system_info = function() {
    summary_list = list(
        GUI = .Platform$GUI,
        os_type = .Platform$OS.type,
        os_sysname = as.character(Sys.info()["sysname"]),
        os_version = as.character(Sys.info()["version"]),
        machine_type = as.character(Sys.info()["machine"]),
        machine_nodename = as.character(Sys.info()["nodename"]),
        encoding = l10n_info()$codeset,
        encoding_UTF8 = l10n_info()$`UTF-8`,
        encoding_Latin1 = l10n_info()$`Latin-1`,
        locale_COLLATE = Sys.getlocale(category = "LC_COLLATE"), 
        locale_CTYPE = Sys.getlocale(category = "LC_CTYPE"), 
        locale_NUMERIC = Sys.getlocale(category = "LC_NUMERIC"), 
        locale_TIME = Sys.getlocale(category = "LC_TIME")
    )
}
str(get_system_info())
# > str(get_system_info())
# List of 13
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "windows"
#  $ os_sysname      : chr "Windows"
#  $ os_version      : chr "build 19045"
#  $ machine_type    : chr "x86-64"
#  $ machine_nodename: chr "LIVAI7-8700"
#  $ encoding        : NULL
#  $ encoding_UTF8   : logi TRUE
#  $ encoding_Latin1 : logi FALSE
#  $ locale_COLLATE  : chr "Korean_Korea.utf8"
#  $ locale_CTYPE    : chr "Korean_Korea.utf8"
#  $ locale_NUMERIC  : chr "C"
#  $ locale_TIME     : chr "Korean_Korea.utf8"

# > str(get_system_info())
# List of 13
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "unix"
#  $ os_sysname      : chr "Darwin"
#  $ os_version      : chr "Darwin Kernel Version 22.6.0: Wed Jul  5 22:22:05 PDT 2023; root:xnu-8796.141.3~6/RELEASE_ARM64_T6000"
#  $ machine_type    : chr "arm64"
#  $ machine_nodename: chr "Min-Hyungs-MacBook-Pro.local"
#  $ encoding        : chr "UTF-8"
#  $ encoding_UTF8   : logi TRUE
#  $ encoding_Latin1 : logi FALSE
#  $ locale_COLLATE  : chr "en_US.UTF-8"
#  $ locale_CTYPE    : chr "en_US.UTF-8"
#  $ locale_NUMERIC  : chr "C"
#  $ locale_TIME     : chr "en_US.UTF-8"

dput(sessionInfo())
dput(R.Version())
getOption("repos")
# > dput(R.Version())
# structure(list(platform = "x86_64-pc-linux-gnu", arch = "x86_64", 
#     os = "linux-gnu", system = "x86_64, linux-gnu", status = "", 
#     major = "3", minor = "4.3", year = "2017", month = "11", 
#     day = "30", `svn rev` = "73796", language = "R", version.string = "R version 3.4.3 (2017-11-30)", 
#     nickname = "Kite-Eating Tree"), .Names = c("platform", "arch", 
# "os", "system", "status", "major", "minor", "year", "month", 
# "day", "svn rev", "language", "version.string", "nickname"))
# > getOption("repos")
#                        CRAN 
# "https://cran.rstudio.com/" 
# attr(,"RStudio")
# [1] TRUE

library(checkpoint)
checkpoint("2019-04-15", scanForPackages = F)  # default checkpoint for Microsoft R Open 3.5.3
getOption("repos")
.libPaths()
dput(installed.packages(.libPaths()[1])[, "Package"])
# > checkpoint("2019-04-15", scanForPackages = F)  # default checkpoint for Microsoft R Open 3.5.3
# Skipping package scanning
# checkpoint process complete
# ---
# > getOption("repos")
# [1] "https://mran.microsoft.com/snapshot/2019-04-15"
# > .libPaths()
# [1] "/home/mkim/.checkpoint/2019-04-15/lib/x86_64-pc-linux-gnu/3.4.3" "/home/mkim/.checkpoint/R-3.4.3"                                 
# [3] "/usr/local/lib64/R/library"                                     
# > dput(installed.packages(.libPaths()[1])[, "Package"])
# structure(c("boot", "cli", "cmprsk", "cowplot", "datapasta", 
# "DBI", "dplyr", "exactRankTests", "fansi", "ggpubr", "ggsci", 
# "ggsignif", "glue", "haven", "km.ci", "KMsurv", "lubridate", 
# "openxlsx", "pillar", "pkgconfig", "plogr", "polynom", "Rcpp", 
# "rlang", "survival", "survMisc", "tableone", "tibble", "tidyselect", 
# "tidyverse", "xtable"), .Names = c("boot", "cli", "cmprsk", "cowplot", 
# "datapasta", "DBI", "dplyr", "exactRankTests", "fansi", "ggpubr", 
# "ggsci", "ggsignif", "glue", "haven", "km.ci", "KMsurv", "lubridate", 
# "openxlsx", "pillar", "pkgconfig", "plogr", "polynom", "Rcpp", 
# "rlang", "survival", "survMisc", "tableone", "tibble", "tidyselect", 
# "tidyverse", "xtable"))



library(tidyverse)
# > library(tidyverse)
# ── Attaching packages ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
# ✔ ggplot2 2.2.1       ✔ purrr   0.2.4  
# ✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
# ✔ tidyr   0.8.1       ✔ stringr 1.2.0  
# ✔ readr   1.1.1       ✔ forcats 0.3.0  
# ── Conflicts ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
# ✖ dplyr::filter() masks stats::dplyr::filter()
# ✖ dplyr::lag()    masks stats::dplyr::lag()

# select = dplyr::select
getwd() |> dput()
.path4read = "../data/data.ID_DATE_DX.distinct/"
.path4write = "../data/data.ID_DATE_DX.distinct/"


#@ objectname = "os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014"----
objectname = "os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014"
filename = paste0(objectname,".rds")
filename %>% {file.info(file.path(.path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) |> print() #----
.t0 = Sys.time()
assign(objectname, readRDS(file.path(.path4read, filename)) |> as_tibble())
Sys.time() - .t0
# > filename %>% {file.info(file.path(.path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) |> print() #----
#                                                                                                                           filename       size      KB       MB       GB
# 1 ../data/data.ID_DATE_DX.distinct//os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014.rds 5353198720 5227733 5105.208 4.985555# > .t0 = Sys.time()
# > assign(objectname, readRDS(file.path(.path4read, filename)) |> as_tibble())
# Warning message:
# `as_tibble()` is deprecated, use `as_tibble()` (but mind the new semantics).
# This warning is displayed once per session. 
# > Sys.time() - .t0
# Time difference of 28.87869 secs



#@ end -----
