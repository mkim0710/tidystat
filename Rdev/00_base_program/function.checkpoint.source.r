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


getOption("repos")
# > getOption("repos")
#                        CRAN 
# "https://cran.rstudio.com/" 
# attr(,"RStudio")
# [1] TRUE
library(checkpoint)
checkpoint("2019-04-15")  # default checkpoint for Microsoft R Open 3.5.3
getOption("repos")
.libPaths()
dput(installed.packages(.libPaths()[1])[, "Package"])
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





#@ end -----
