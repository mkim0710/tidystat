
# https://edwinth.github.io/blog/dplyr-recipes/



#@ bare_to_quo_in_func =====
bare_to_quo_in_func <- function(x, var) {
    x %>% select(!!enquo(var)) %>% head(1)
}
bare_to_quo_in_func(mtcars, mpg)
# > bare_to_quo_in_func(mtcars, mpg)
#           mpg
# Mazda RX4  21
bare_to_quo_in_func <- function(x, var) {
    x %>% select(!!enexpr(var)) %>% head(1)
}
bare_to_quo_in_func(mtcars, mpg)
# > bare_to_quo_in_func(mtcars, mpg)
#           mpg
# Mazda RX4  21




#@ char_to_quo =====
char_to_quo <- function(x, var) {
    x %>% select(!!rlang::sym(var)) %>% head(1)
}
char_to_quo(mtcars, "mpg")
# > char_to_quo(mtcars, "mpg")
#           mpg
# Mazda RX4  21

char_to_quo <- function(x, var) {
    x %>% select(!!expr(var)) %>% head(1)
}
char_to_quo(mtcars, "mpg")
# > char_to_quo(mtcars, "mpg")
#           mpg
# Mazda RX4  21


char_to_quo <- function(x, var) {
    x %>% select(!!enquo(var)) %>% head(1)
}
char_to_quo(mtcars, "mpg")
# > char_to_quo(mtcars, "mpg")
#           mpg
# Mazda RX4  21

char_to_quo <- function(x, var) {
    x %>% select(!!parse(text = var)) %>% head(1)
}
char_to_quo(mtcars, "mpg")
# > char_to_quo(mtcars, "mpg")
# Error: `structure(expression(mpg), srcfile = <environment>, wholeSrcref = structure(c(1L, 
# 0L, 2L, 0L, 0L, 0L, 1L, 2L), srcfile = <environment>, class = "srcref"))` must evaluate to column positions or names, not an expression vector
# Call `rlang::last_error()` to see a backtrace
# Called from: .abort(text)







#@ txt = "Variable1" ====
Variable1 = 111
txt = "Variable1"
txt %>% str
txt %>% dput
# > txt %>% str
#  chr "Variable1"
# > txt %>% dput
# "Variable1"

parse(text = txt)
parse(text = txt) %>% str
parse(text = txt) %>% dput
# > parse(text = txt)
# expression(Variable1)
# > parse(text = txt) %>% str
# length 1 expression(Variable1)
#  - attr(*, "srcref")=List of 1
#   ..$ : 'srcref' int [1:8] 1 1 1 9 1 9 1 1
#   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000263526b3510> 
#  - attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000263526b3510> 
#  - attr(*, "wholeSrcref")= 'srcref' int [1:8] 1 0 2 0 0 0 1 2
#   ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000263526b3510> 
# > parse(text = txt) %>% dput
# structure(expression(Variable1), srcfile = <environment>, wholeSrcref = structure(c(1L, 
# 0L, 2L, 0L, 0L, 0L, 1L, 2L), srcfile = <environment>, class = "srcref"))


eval(parse(text = txt))
eval(parse(text = txt)) %>% str
eval(parse(text = txt)) %>% dput
# > eval(parse(text = txt))
# [1] 111
# > eval(parse(text = txt)) %>% str
#  num 111
# > eval(parse(text = txt)) %>% dput
# 111


txt
get(txt)
get(txt) %>% str
get(txt) %>% dput
# > txt
# [1] "Variable1"
# > get(txt)
# [1] 111
# > get(txt) %>% str
#  num 111
# > get(txt) %>% dput
# 111

expr(txt)
expr(txt) %>% str
expr(txt) %>% dput
# > expr(txt)
# txt
# > expr(txt) %>% str
#  symbol txt
# > expr(txt) %>% dput
# txt


txt
eval(expr(txt))
eval(expr(txt)) %>% str
eval(expr(txt)) %>% dput
# > txt
# [1] "Variable1"
# > eval(expr(txt))
# [1] "Variable1"
# > eval(expr(txt)) %>% str
#  chr "Variable1"
# > eval(expr(txt)) %>% dput
# "Variable1"



rlang::sym(txt)
rlang::sym(txt) %>% str
rlang::sym(txt) %>% dput
# > rlang::sym(txt)
# Variable1
# > rlang::sym(txt) %>% str
#  symbol Variable1
# > rlang::sym(txt) %>% dput
# Variable1



expr(txt)
expr(txt) %>% str
expr(txt) %>% dput
# > expr(txt)
# txt
# > expr(txt) %>% str
#  symbol txt
# > expr(txt) %>% dput
# txt


txt
eval(expr(txt))
eval(expr(txt)) %>% str
eval(expr(txt)) %>% dput
# > txt
# [1] "Variable1"
# > eval(expr(txt))
# [1] "Variable1"
# > eval(expr(txt)) %>% str
#  chr "Variable1"
# > eval(expr(txt)) %>% dput
# "Variable1"




txt
eval(quo(txt))
eval(quo(txt)) %>% str
eval(quo(txt)) %>% dput
# > txt
# [1] "Variable1"
# > eval(quo(txt))
# <quosure>
# expr: ^txt
# env:  global
# > eval(quo(txt)) %>% str
#  language ~txt
#  - attr(*, ".Environment")=<environment: R_GlobalEnv> 
# > eval(quo(txt)) %>% dput
# ~txt



~txt
str(~txt)
eval(~txt)
eval(~txt) %>% str
eval(~txt) %>% dput
# > ~txt
# ~txt
# > str(~txt)
# Class 'formula'  language ~txt
#   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
# > eval(~txt)
# ~txt
# > eval(~txt) %>% str
# Class 'formula'  language ~txt
#   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
# > eval(~txt) %>% dput
# ~txt





#@ end -----


