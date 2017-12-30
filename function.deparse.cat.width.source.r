function.deparse.cat.width = function(x, deparse.width.cutoff = 500, cat.sep = "") {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.deparse.cat.width.source.r")
    cat(deparse(x, width.cutoff = deparse.width.cutoff), sep = cat.sep)
}

# @ test) function.deparse.cat.width() --------
letters %>% print
letters %>% dput
letters %>% deparse
# letters %>% deparse %>% print  ## identical to: letters %>% deparse
letters %>% cat
letters %>% deparse %>% cat(sep = "")
letters %>% deparse %>% cat(sep = "")
letters %>% function.deparse.cat.width
# > letters %>% print
#  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
# > letters %>% dput
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
# "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", 
# "z")
# > letters %>% deparse
# [1] "c(\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", "     
# [2] "\"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", "
# [3] "\"z\")"                                                                                     
# > letters %>% cat
# a b c d e f g h i j k l m n o p q r s t u v w x y z
# > letters %>% deparse %>% cat
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",  "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y",  "z")
# > letters %>% function.deparse.cat.width
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

installed.packages() %>% as.tibble %>% filter(is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat
installed.packages() %>% as.tibble %>% filter(is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "")
installed.packages() %>% as.tibble %>% filter(is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "\n")

v1 = c("assertthat", "backports", "base64enc", "BH", "BiasedUrn",  "bindr", "bindrcpp", "broom", "callr", "cellranger", "cli", "clipr",  "cmprsk", "coda", "colorspace", "crayon", "curl", "data.table",  "DBI", "dbplyr", "devtools", "dichromat", "digest", "dplyr",  "e1071", "Epi", "epiR", "estimability", "etm", "evaluate", "forcats",  "foreach", "gdata", "gdtools", "ggiraph", "ggplot2", "git2r",  "glmnet", "glue", "gmodels", "gtable", "gtools", "haven", "highr",  "hms", "htmltools", "htmlwidgets", "httr", "installr", "iterators",  "jsonlite", "knitr", "labeling", "latticeExtra", "lazyeval",  "lsmeans", "lubridate", "magrittr", "markdown", "Matching", "memoise",  "mime", "mnormt", "modelr", "moonBook", "moonBook2", "multcomp",  "munsell", "mvtnorm", "mycor", "nortest", "numDeriv", "officer",  "openssl", "openxlsx", "pkgconfig", "plogr", "plyr", "psych",  "purrr", "R.methodsS3", "R.oo", "R.utils", "R6", "RColorBrewer",  "Rcpp", "readr", "readxl", "rematch", "reprex", "reshape2", "rlang",  "rmarkdown", "rprojroot", "rstudioapi", "rvest", "rvg", "sandwich",  "scales", "selectr", "stringi", "stringr", "survey", "tableone",  "TH.data", "tibble", "tidyr", "tidyselect", "tidyverse", "useful",  "uuid", "viridisLite", "whisker", "withr", "XML", "xml2", "xtable",  "yaml", "zip", "zoo", "translations")
v2 = c("assertthat", "backports", "base64enc", "BH", "BiasedUrn", "bindr", "bindrcpp", "broom", "callr", "cellranger", "cli", "clipr", "cmprsk", "coda", "colorspace", "crayon", "curl", "data.table", "DBI", "dbplyr", "devtools", "dichromat", "digest", "dplyr", "e1071", "Epi", "epiR", "estimability", "etm", "evaluate", "forcats", "foreach", "gdata", "gdtools", "ggiraph", "ggplot2", "git2r", "glmnet", "glue", "gmodels", "gtable", "gtools", "haven", "highr", "hms", "htmltools", "htmlwidgets", "httr", "installr", "iterators", "jsonlite", "knitr", "labeling", "latticeExtra", "lazyeval", "lsmeans", "lubridate", "magrittr", "markdown", "Matching", "memoise", "mime", "mnormt", "modelr", "moonBook", "moonBook2", "multcomp", "munsell", "mvtnorm", "mycor", "nortest", "numDeriv", "officer", "openssl", "openxlsx", "pkgconfig", "plogr", "plyr", "psych", "purrr", "R.methodsS3", "R.oo", "R.utils", "R6", "RColorBrewer", "Rcpp", "readr", "readxl", "rematch", "reprex", "reshape2", "rlang", "rmarkdown", "rprojroot", "rstudioapi", "rvest", "rvg", "sandwich", "scales", "selectr", "stringi", "stringr", "survey", "tableone", "TH.data", "tibble", "tidyr", "tidyselect", "tidyverse", "useful", "uuid", "viridisLite", "whisker", "withr", "XML", "xml2", "xtable", "yaml", "zip", "zoo", "translations")
v3 = c("assertthat", "backports", "base64enc", "BH", "BiasedUrn", "bindr", "bindrcpp", "broom", "callr", "cellranger", "cli", "clipr", "cmprsk", "coda", "colorspace", "crayon", "curl", "data.table", "DBI", "dbplyr", "devtools", "dichromat", "digest", "dplyr", "e1071", "Epi", "epiR", "estimability", "etm", "evaluate", "forcats", "foreach", "gdata", "gdtools", "ggiraph", "ggplot2", "git2r", "glmnet", "glue", "gmodels", "gtable", "gtools", "haven", "highr", "hms", "htmltools", "htmlwidgets", "httr", "installr",  "iterators", "jsonlite", "knitr", "labeling", "latticeExtra", "lazyeval", "lsmeans", "lubridate", "magrittr", "markdown", "Matching", "memoise", "mime", "mnormt", "modelr", "moonBook", "moonBook2", "multcomp", "munsell", "mvtnorm", "mycor", "nortest", "numDeriv", "officer", "openssl", "openxlsx", "pkgconfig", "plogr", "plyr", "psych", "purrr", "R.methodsS3", "R.oo", "R.utils", "R6", "RColorBrewer", "Rcpp", "readr", "readxl", "rematch", "reprex", "reshape2", "rlang", "rmarkdown", "rprojroot", "rstudioapi",  "rvest", "rvg", "sandwich", "scales", "selectr", "stringi", "stringr", "survey", "tableone", "TH.data", "tibble", "tidyr", "tidyselect", "tidyverse", "useful", "uuid", "viridisLite", "whisker", "withr", "XML", "xml2", "xtable", "yaml", "zip", "zoo", "translations")
v4 = c("assertthat", "backports", "base64enc", "BH", "BiasedUrn", "bindr", "bindrcpp", "broom", "callr", "cellranger", "cli", "clipr", "cmprsk", "coda", "colorspace", "crayon", "curl", "data.table", "DBI", "dbplyr", "devtools", "dichromat", "digest", "dplyr", "e1071", "Epi", "epiR", "estimability", "etm", "evaluate", "forcats", "foreach", "gdata", "gdtools", "ggiraph", "ggplot2", "git2r", "glmnet", "glue", "gmodels", "gtable", "gtools", "haven", "highr", "hms", "htmltools", "htmlwidgets", "httr", "installr", 
"iterators", "jsonlite", "knitr", "labeling", "latticeExtra", "lazyeval", "lsmeans", "lubridate", "magrittr", "markdown", "Matching", "memoise", "mime", "mnormt", "modelr", "moonBook", "moonBook2", "multcomp", "munsell", "mvtnorm", "mycor", "nortest", "numDeriv", "officer", "openssl", "openxlsx", "pkgconfig", "plogr", "plyr", "psych", "purrr", "R.methodsS3", "R.oo", "R.utils", "R6", "RColorBrewer", "Rcpp", "readr", "readxl", "rematch", "reprex", "reshape2", "rlang", "rmarkdown", "rprojroot", "rstudioapi", 
"rvest", "rvg", "sandwich", "scales", "selectr", "stringi", "stringr", "survey", "tableone", "TH.data", "tibble", "tidyr", "tidyselect", "tidyverse", "useful", "uuid", "viridisLite", "whisker", "withr", "XML", "xml2", "xtable", "yaml", "zip", "zoo", "translations")

identical(v1, v2)
identical(v1, v3)
identical(v1, v4)
# > identical(v1, v2)
# [1] TRUE
# > identical(v1, v3)
# [1] TRUE
# > identical(v1, v4)
# [1] TRUE
