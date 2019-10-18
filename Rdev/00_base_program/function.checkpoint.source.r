# function.checkpoint.source.r




dput(unlist(strsplit(Sys.getlocale(), ";")))
dput(l10n_info())
dput(.Platform)
dput(Sys.info())
# > dput(unlist(strsplit(Sys.getlocale(), ";")))
# c("LC_CTYPE=en_US.UTF-8", "LC_NUMERIC=C", "LC_TIME=en_US.UTF-8", 
# "LC_COLLATE=en_US.UTF-8", "LC_MONETARY=en_US.UTF-8", "LC_MESSAGES=en_US.UTF-8", 
# "LC_PAPER=en_US.UTF-8", "LC_NAME=C", "LC_ADDRESS=C", "LC_TELEPHONE=C", 
# "LC_MEASUREMENT=en_US.UTF-8", "LC_IDENTIFICATION=C")
# > dput(l10n_info())
# structure(list(MBCS = TRUE, `UTF-8` = TRUE, `Latin-1` = FALSE), .Names = c("MBCS", 
# "UTF-8", "Latin-1"))
# > dput(.Platform)
# structure(list(OS.type = "unix", file.sep = "/", dynlib.ext = ".so", 
#     GUI = "RStudio", endian = "little", pkgType = "source", path.sep = ":", 
#     r_arch = ""), .Names = c("OS.type", "file.sep", "dynlib.ext", 
# "GUI", "endian", "pkgType", "path.sep", "r_arch"))
# > dput(Sys.info())
# structure(c("Linux", "3.10.0-957.12.2.el7.x86_64", "#1 SMP Tue May 14 21:24:32 UTC 2019", 
# "don.sph.harvard.edu", "x86_64", "unknown", "mkim", "mkim"), .Names = c("sysname", 
# "release", "version", "nodename", "machine", "login", "user", 
# "effective_user"))


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
# ✖ dplyr::filter() masks stats::filter()
# ✖ dplyr::lag()    masks stats::lag()

# select = dplyr::select
getwd() %>% dput
path4read = "../data/data.ID_DATE_DX.distinct/"
path4write = "../data/data.ID_DATE_DX.distinct/"


#@ objectname = "os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014"----
objectname = "os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014"
filename = paste0(objectname, ".rds")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
t0 = Sys.time()
assign(objectname, readRDS(file.path(path4read, filename)) %>% as.tibble)
Sys.time() - t0
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                                                                                           filename       size      KB       MB       GB
# 1 ../data/data.ID_DATE_DX.distinct//os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014.rds 5353198720 5227733 5105.208 4.985555# > t0 = Sys.time()
# > assign(objectname, readRDS(file.path(path4read, filename)) %>% as.tibble)
# Warning message:
# `as.tibble()` is deprecated, use `as_tibble()` (but mind the new semantics).
# This warning is displayed once per session. 
# > Sys.time() - t0
# Time difference of 28.87869 secs



#@ end -----
