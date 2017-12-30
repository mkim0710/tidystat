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

installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat
installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "")
installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse(width.cutoff = 500) %>% cat(sep = "\n")
installed.packages() %>% as.tibble %>% filter(!is.na(Priority)) %>% select(Package) %>% unlist %>% unname %>% deparse %>% cat(sep = "\n")
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

identical(v1, v2)
identical(v1, v3)
identical(v1, v4)
# > identical(v1, v2)
# [1] TRUE
# > identical(v1, v3)
# [1] TRUE
# > identical(v1, v4)
# [1] TRUE
