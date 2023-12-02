




function.eval.parse.Vectorize = Vectorize(function(text4parse) {eval(parse(text = text4parse))}) 
function.eval.parse.Vectorize(paste(c(2,1,1.1), ">1")) %>% str
 # Named logi [1:3] TRUE FALSE TRUE
 # - attr(*, "names")= chr [1:3] "2 >1" "1 >1" "1.1 >1"


#---------------
function.eval.parse.Vectorize_old = function(text4parse) {
    Vectorize(function(x) {eval(parse(text = x))}) (text4parse)
}
function.eval.parse.Vectorize_old(paste(c(2,1,1.1), ">1")) %>% str
 # Named logi [1:3] TRUE FALSE TRUE
 # - attr(*, "names")= chr [1:3] "2 >1" "1 >1" "1.1 >1"


#---------------
temp.fun = function(x) eval(parse(text = paste(x, ">1")))
Vectorize(temp.fun)(c(2, 1, 1.1))
# > temp.fun = function(x) eval(parse(text = paste(x, ">1")))
# > Vectorize(temp.fun)(c(2, 1, 1.1))
# [1]  TRUE FALSE  TRUE


#---------------
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



