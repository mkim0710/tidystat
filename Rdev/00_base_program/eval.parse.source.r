

eval(parse(text = paste(1, ">1")))
eval(parse(text = paste(1.1, ">1")))
eval(parse(text = paste(2, ">1")))
eval(parse(text = paste(c(1,2), ">1")))
eval(parse(text = paste(c(2,2), ">1")))
eval(parse(text = paste(c(2,2,1), ">1")))
eval(parse(text = paste(c(2,2,1.1), ">1")))
# > eval(parse(text = paste(1, ">1")))
# [1] FALSE
# > eval(parse(text = paste(1.1, ">1")))
# [1] TRUE
# > eval(parse(text = paste(2, ">1")))
# [1] TRUE
# > eval(parse(text = paste(c(1,2), ">1")))
# [1] TRUE
# > eval(parse(text = paste(c(2,2), ">1")))
# [1] TRUE
# > eval(parse(text = paste(c(2,2,1), ">1")))
# [1] FALSE
# > eval(parse(text = paste(c(2,2,1.1), ">1")))
# [1] TRUE

temp.fun = function(x) eval(parse(text = paste(x, ">1")))
Vectorize(temp.fun)(c(2, 1, 1.1))
# > temp.fun = function(x) eval(parse(text = paste(x, ">1")))
# > Vectorize(temp.fun)(c(2, 1, 1.1))
# [1]  TRUE FALSE  TRUE


