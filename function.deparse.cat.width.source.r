function.deparse.cat.width = function(x, width.cutoff = 500) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.deparse.cat.width.source.r")
    cat(deparse(x, width.cutoff = width.cutoff), sep = "\n")
}

# @ test) function.deparse.cat.width() --------
letters %>% print
letters %>% dput
letters %>% deparse
# letters %>% deparse %>% print  ## identical to: letters %>% deparse
letters %>% cat
letters %>% deparse %>% cat
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
