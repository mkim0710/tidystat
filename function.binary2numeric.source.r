function.binary2numeric = function(x) {
  # source("https://github.com/mkim0710/tidystat/raw/master/function.binary2numeric.source.r")
  if (is.character(x)) {
    x = as.factor(x)
  }
  if (length(levels(x)) == 2) {
    x = as.numeric(x)
  }
  if (is.logical(x)) {
    x = as.numeric(x)
  } 
  x
}

#@ test ----
# > function.binary2numeric(c(T, F ,T))
# [1] 1 0 1
# > function.binary2numeric(c("A", "A", "B", "B", "A"))
# [1] 1 1 2 2 1
# > function.binary2numeric(c("A", "A", "B", "C", "A"))
# [1] A A B C A
# Levels: A B C
