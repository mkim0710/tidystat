


objectname = "KoGES201806vars_waves"
get(objectname) |> names() |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # dput(); |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # width.cutoff=500 is the max ----
get(objectname) |> names() |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",120-20,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") %>% {cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n", ., "  \n", sep="")}  ;   # tidyeval) paste(collapse=", ") |> cat("  \n", sep="") ----  


objectname = "KoGES201806vars_waves"
get(objectname) |> names() %>% {cat(deparse(., width.cutoff=120),"\n\n",sep="")} #=====


objectname = "KoGES201806vars_waves"
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); get(objectname) |> names() |> deparse() |> cat("  \n", sep="") # dput() cat(deparse()) ----
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); get(objectname) |> names() |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # dput(); |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # width.cutoff=500 is the max ----
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); get(objectname) |> names() |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",120-20,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") |> cat("  \n", sep=""); # tidyeval) paste(collapse=", ") |> cat("  \n", sep="") ----
# > data |> names() |> deparse() |> cat("  \n", sep="") #----  
# c("Time2Event", "Event", "Exposure")
# > data |> names() |> paste(collapse=", ") #----  
# [1] "Time2Event, Event, Exposure"







function.deparse.cat.width=function(x, deparse.width.cutoff=500, cat.sep="") {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.deparse.cat.width.dev.r")
    cat(deparse(x, width.cutoff=deparse.width.cutoff), sep = cat.sep)
    if (cat.sep != "\n") cat("  \n", sep="")
}

# @ test) function.deparse.cat.width() --------  
letters |> print()
letters |> dput()
letters |> deparse()
# letters |> deparse() |> print()  ## identical to: letters |> deparse()
letters |> cat("  \n", sep="")
letters |> deparse() |> cat("  \n", sep="")
letters %>% function.deparse.cat.width
# > letters |> print()
#  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
# > letters |> dput()
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
# "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", 
# "z")
# > letters |> deparse()
# [1] "c(\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", "     
# [2] "\"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", "
# [3] "\"z\")"                                                                                     
# > letters |> cat("  \n", sep="")
# a b c d e f g h i j k l m n o p q r s t u v w x y z
# > letters |> deparse() |> cat("  \n", sep="")
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",  "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y",  "z")
# > letters %>% function.deparse.cat.width
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse() |> cat("  \n", sep="")
installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse() |> cat("  \n", sep="")
installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse(width.cutoff=500) |> cat(sep = "\n");cat("  \n", sep="")
installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse() |> cat(sep = "\n");cat("  \n", sep="")
# > installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse() |> cat("  \n", sep="")
# c("base", "boot", "class", "cluster", "codetools", "compiler",  "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth",  "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet",  "parallel", "rpart", "spatial", "splines", "stats", "stats4",  "survival", "tcltk", "tools", "utils")
# > installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse() |> cat("  \n", sep="")
# c("base", "boot", "class", "cluster", "codetools", "compiler", "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth", "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet", "parallel", "rpart", "spatial", "splines", "stats", "stats4", "survival", "tcltk", "tools", "utils")
# > installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse(width.cutoff=500) |> cat(sep = "\n")
# c("base", "boot", "class", "cluster", "codetools", "compiler", "datasets", "foreign", "graphics", "grDevices", "grid", "KernSmooth", "lattice", "MASS", "Matrix", "methods", "mgcv", "nlme", "nnet", "parallel", "rpart", "spatial", "splines", "stats", "stats4", "survival", "tcltk", "tools", "utils")
# > installed.packages() |> as_tibble() %>% dplyr::filter(!is.na(Priority)) %>% select(Package) |> unlist() |> unname() |> deparse() |> cat(sep = "\n")
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

setdiff(v1, v2) |> deparse() |> cat("  \n", sep="")
setdiff(v2, v1) |> deparse() |> cat("  \n", sep="")
union(v1, v2) |> deparse() |> cat("  \n", sep="")
intersect(v1, v2) |> deparse() |> cat("  \n", sep="")

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

