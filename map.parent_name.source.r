# source("https://github.com/mkim0710/tidystat/raw/master/map.parent_name.source.r")

map.parent_name = function(vec, .f, ...) {
    # source("https://github.com/mkim0710/tidystat/raw/master/map.parent_name.source.r")
    if(is.vector(vec) & !is.list(vec)) {
        out1 = vec %>% seq_along %>% map(function(i) {
            out2 = do.call(.f, args = list(vec[i], ...))
            attr(out2, "parent_name") = names(vec)[i]
            out2
        })
        if (is.null(names(vec))) {
            names(out1) = vec
        } else {
            names(out1) = names(vec)
        }
    }
    if(is.list(vec)) {
        ls = vec
        out1 = ls %>% seq_along %>% map(function(i) {
            out2 = do.call(.f, args = list(ls[[i]], ...))
            attr(out2, "parent_name") = names(ls)[i]
            out2
        })
        names(out1) = names(ls)
    }
    out1
}

# map.parent_name2 = function(vec, .f) {
#     if(is.vector(vec) & !is.list(vec)) {
#         out1 = vec %>% seq_along %>% map(function(i) {
#             out2 = do.call(.f, args = list(vec[i]))
#             attr(out2, "parent_name") = names(vec)[i]
#             out2
#         })
#         if (is.null(names(vec))) {
#             names(out1) = vec
#         } else {
#             names(out1) = names(vec)
#         }
#     }
#     if(is.list(vec)) {
#         ls = vec
#         out1 = ls %>% seq_along %>% map(function(i) {
#             out2 = do.call(.f, args = list(ls[[i]]))
#             # attr(out2, "parent_name") = names(ls)[i]
#             parent.x = get(".x", envir = parent.frame())
#             # attr(out2, "parent_name") = names(parent.x)[i]
#             # parent.x is a vector of integers generated from seq_along()
#             attr(out2, "parent_name") = parent.x[i]
#             out2
#         })
#         names(out1) = names(ls)
#     }
#     out1
# }
map.parent_name2 = function(vec, .f, ...) {
    # source("https://github.com/mkim0710/tidystat/raw/master/map.parent_name.source.r")
    if(is.vector(vec) & !is.list(vec)) {
        out1 = vec %>% seq_along %>% map(function(i) {
            out2 = do.call(.f, args = list(vec[i], ...))
            attr(out2, "parent_name") = names(vec)[i]
            out2
        })
        if (is.null(names(vec))) {
            names(out1) = vec
        } else {
            names(out1) = names(vec)
        }
    }
    if(is.list(vec)) {
        ls = vec
        # without using seq_along()
        out1 = ls %>% map(function(x) {
            out2 = do.call(.f, args = list(x), ...)
            # attr(out2, "parent_name") = names(ls)[i]
            parent.x = get(".x", envir = parent.frame())
            # attr(out2, "parent_name") = names(parent.x)[which(parent.x == x)]
            attr(out2, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(x, object)}))]
            out2
        })
        names(out1) = names(ls)
    }
    out1
}

#@ test) map.parent_name() 1:3 -------
set.seed(1); 1:3 %>% map(rnorm, n = 10) %>% str
set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10) %>% str
set.seed(1); 1:3 %>% map(~rnorm(10, .x)) %>% str
# set.seed(1); 1:3 %>% map.parent_name(~rnorm(10, .x)) %>% str
set.seed(1); 1:3 %>% map(function(x) rnorm(10, x)) %>% str
set.seed(1); 1:3 %>% map.parent_name(.f = function(x) rnorm(10, x)) %>% str
# > set.seed(1); 1:3 %>% map(rnorm, n = 10) %>% str
# List of 3
#  $ : num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ : num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ : num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10) %>% str
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map(~rnorm(10, .x)) %>% str
# List of 3
#  $ : num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ : num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ : num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map(function(x) rnorm(10, x)) %>% str
# List of 3
#  $ : num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ : num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ : num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map.parent_name(.f = function(x) rnorm(10, x)) %>% str
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...


mtcars[, 1:3] %>% split(.$cyl) %>% str
# > mtcars[, 1:3] %>% split(.$cyl) %>% str
# List of 3
#  $ 4:'data.frame':	11 obs. of  3 variables:
#   ..$ mpg : num [1:11] 22.8 24.4 22.8 32.4 30.4 33.9 21.5 27.3 26 30.4 ...
#   ..$ cyl : num [1:11] 4 4 4 4 4 4 4 4 4 4 ...
#   ..$ disp: num [1:11] 108 146.7 140.8 78.7 75.7 ...
#  $ 6:'data.frame':	7 obs. of  3 variables:
#   ..$ mpg : num [1:7] 21 21 21.4 18.1 19.2 17.8 19.7
#   ..$ cyl : num [1:7] 6 6 6 6 6 6 6
#   ..$ disp: num [1:7] 160 160 258 225 168 ...
#  $ 8:'data.frame':	14 obs. of  3 variables:
#   ..$ mpg : num [1:14] 18.7 14.3 16.4 17.3 15.2 10.4 10.4 14.7 15.5 15.2 ...
#   ..$ cyl : num [1:14] 8 8 8 8 8 8 8 8 8 8 ...
#   ..$ disp: num [1:14] 360 360 276 276 276 ...

mtcars %>% split(.$cyl) %>% map(nrow) %>% str
mtcars %>% split(.$cyl) %>% map.parent_name(nrow) %>% str
mtcars %>% split(.$cyl) %>% map(~nrow(.x)) %>% str
# mtcars %>% split(.$cyl) %>% map.parent_name(~nrow(.x)) %>% str
mtcars %>% split(.$cyl) %>% map(function(x) nrow(x)) %>% str
mtcars %>% split(.$cyl) %>% map.parent_name(function(x) nrow(x)) %>% str
# > mtcars %>% split(.$cyl) %>% map(nrow) %>% str
# List of 3
#  $ 4: int 11
#  $ 6: int 7
#  $ 8: int 14
# > mtcars %>% split(.$cyl) %>% map.parent_name(nrow) %>% str
# List of 3
#  $ 4: atomic [1:1] 11
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 7
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 14
#   ..- attr(*, "parent_name")= chr "8"
# > mtcars %>% split(.$cyl) %>% map(~nrow(.x)) %>% str
# List of 3
#  $ 4: int 11
#  $ 6: int 7
#  $ 8: int 14
# > mtcars %>% split(.$cyl) %>% map(function(x) nrow(x)) %>% str
# List of 3
#  $ 4: int 11
#  $ 6: int 7
#  $ 8: int 14
# > mtcars %>% split(.$cyl) %>% map.parent_name(function(x) nrow(x)) %>% str
# List of 3
#  $ 4: atomic [1:1] 11
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 7
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 14
#   ..- attr(*, "parent_name")= chr "8"


mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% str(max.level = 1)
mtcars %>% split(.$cyl) %>% map.parent_name(lm, formula = mpg ~ wt) %>% str(max.level = 1)
mtcars %>% split(.$cyl) %>% map(~ lm(mpg ~ wt, data = .x)) %>% str(max.level = 1)
# mtcars %>% split(.$cyl) %>% map.parent_name(~ lm(mpg ~ wt, data = .x)) %>% str(max.level = 1)
mtcars %>% split(.$cyl) %>% map(function(x) lm(mpg ~ wt, data = x)) %>% str(max.level = 1)
mtcars %>% split(.$cyl) %>% map.parent_name(function(x) lm(mpg ~ wt, data = x)) %>% str(max.level = 1)
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% str(max.level = 1)
# List of 3
#  $ 4:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 6:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 8:List of 12
#   ..- attr(*, "class")= chr "lm"
# > mtcars %>% split(.$cyl) %>% map.parent_name(lm, formula = mpg ~ wt) %>% str(max.level = 1)
# List of 3
#  $ 4:List of 12
#   ..- attr(*, "class")= chr "lm"
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6:List of 12
#   ..- attr(*, "class")= chr "lm"
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8:List of 12
#   ..- attr(*, "class")= chr "lm"
#   ..- attr(*, "parent_name")= chr "8"
# > mtcars %>% split(.$cyl) %>% map(~ lm(mpg ~ wt, data = .x)) %>% str(max.level = 1)
# List of 3
#  $ 4:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 6:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 8:List of 12
#   ..- attr(*, "class")= chr "lm"
# > mtcars %>% split(.$cyl) %>% map(function(x) lm(mpg ~ wt, data = x)) %>% str(max.level = 1)
# List of 3
#  $ 4:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 6:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 8:List of 12
#   ..- attr(*, "class")= chr "lm"
# > mtcars %>% split(.$cyl) %>% map.parent_name(function(x) lm(mpg ~ wt, data = x)) %>% str(max.level = 1)
# List of 3
#  $ 4:List of 12
#   ..- attr(*, "class")= chr "lm"
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6:List of 12
#   ..- attr(*, "class")= chr "lm"
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8:List of 12
#   ..- attr(*, "class")= chr "lm"
#   ..- attr(*, "parent_name")= chr "8"

mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map(length) %>% str
mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name(length) %>% str
mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name2(length) %>% str
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map(length) %>% str
# List of 3
#  $ 4: int 12
#  $ 6: int 12
#  $ 8: int 12
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name(length) %>% str
# List of 3
#  $ 4: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "8"
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name2(length) %>% str
# List of 3
#  $ 4: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "8"








#@ end ----
