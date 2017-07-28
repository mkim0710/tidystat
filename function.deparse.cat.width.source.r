function.deparse.cat.width = function(x, width.cutoff = 500) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.deparse.cat.width.source.r")
    cat(deparse(x, width.cutoff = width.cutoff), sep = "\n")
}

#@ test) function.deparse.cat.width() --------
# > dput(letters)
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
# "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", 
# "z")
# > function.deparse.cat.width(letters)
# c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
