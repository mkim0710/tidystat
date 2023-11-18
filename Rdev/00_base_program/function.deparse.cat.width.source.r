

objectname = "KoGES201806vars_waves"
cat("----\n");get(objectname) %>% names %>% deparse %>% cat;cat("\n"); # dput() cat(deparse()) ----
cat("----\n");get(objectname) %>% names %>% {cat(deparse(., width.cutoff=120),sep='\n')};cat("\n"); # dput() cat(deparse(., width.cutoff=120)), width.cutoff=500 is the max ----
cat("----\n");get(objectname) %>% names %>% paste(collapse = ", ") %>% cat;cat("\n"); # tidyselect: paste(collapse = ", ") %>% cat ----
# > data %>% names %>% deparse %>% cat; cat("\n") #----
# c("Time2Event", "Event", "Exposure")
# > data %>% names %>% paste(collapse = ", ") #----
# [1] "Time2Event, Event, Exposure"







function.deparse.cat.width = function(x, deparse.width.cutoff = 500, cat.sep = "") {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.deparse.cat.width.source.r")
    cat(deparse(x, width.cutoff = deparse.width.cutoff), sep = cat.sep)
    if (cat.sep != "\n") cat("\n")
}

# @ test) function.deparse.cat.width() --------
letters %>% print
letters %>% dput
letters %>% deparse
# letters %>% deparse %>% print  ## identical to: letters %>% deparse
letters %>% cat;cat("\n")
letters %>% deparse %>% cat(sep = "");cat("\n")
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

installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat;cat("\n")
installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "");cat("\n")
installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse(width.cutoff = 500) %>% cat(sep = "\n");cat("\n")
installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "\n");cat("\n")
# > installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat
# c("base", "boot", "class", "cluster", "codetools", "compiler",  "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth",  "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet",  "parallel", "rpart", "spatial", "splines", "stats", "stats4",  "survival", "tcltk", "tools", "utils")
# > installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "")
# c("base", "boot", "class", "cluster", "codetools", "compiler", "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth", "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet", "parallel", "rpart", "spatial", "splines", "stats", "stats4", "survival", "tcltk", "tools", "utils")
# > installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse(width.cutoff = 500) %>% cat(sep = "\n")
# c("base", "boot", "class", "cluster", "codetools", "compiler", "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth", "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet", "parallel", "rpart", "spatial", "splines", "stats", "stats4", "survival", "tcltk", "tools", "utils")
# > installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "\n")
# c("base", "boot", "class", "cluster", "codetools", "compiler",
# "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth",
# "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet",
# "parallel", "rpart", "spatial", "splines", "stats", "stats4",
# "survival", "tcltk", "tools", "utils")

v1 = c("base", "boot", "class", "cluster", "codetools", "compiler",  "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth",  "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet",  "parallel", "rpart", "spatial", "splines", "stats", "stats4",  "survival", "tcltk", "tools", "utils")
v2 = c("base", "boot", "class", "cluster", "codetools", "compiler", "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth", "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet", "parallel", "rpart", "spatial", "splines", "stats", "stats4", "survival", "tcltk", "tools", "utils")
v3 = c("base", "boot", "class", "cluster", "codetools", "compiler", "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth", "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet", "parallel", "rpart", "spatial", "splines", "stats", "stats4", "survival", "tcltk", "tools", "utils")
v4 = c("base", "boot", "class", "cluster", "codetools", "compiler",
"datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth",
"lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet",
"parallel", "rpart", "spatial", "splines", "stats", "stats4",
"survival", "tcltk", "tools", "utils")

setdiff(v1, v2) %>% deparse %>% cat(sep = "");cat("\n")
setdiff(v2, v1) %>% deparse %>% cat(sep = "");cat("\n")
union(v1, v2) %>% deparse %>% cat(sep = "");cat("\n")
intersect(v1, v2) %>% deparse %>% cat(sep = "");cat("\n")

identical(v1, v2)
identical(v1, v3)
identical(v1, v4)
# > identical(v1, v2)
# [1] TRUE
# > identical(v1, v3)
# [1] TRUE
# > identical(v1, v4)
# [1] TRUE


#@ end ----

