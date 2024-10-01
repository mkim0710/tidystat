# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/map.parent_name.dev.r")


list_of_element %>% 
    imap(function(element, element_name) {
        # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
        print(Sys.time())
        cat(paste0("Beginning .f() map from list element named: ", element_name, "  #---- \n"))
        # Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) )); gc()
        function4map(element)
    }) 


            # # Codes to insert inside in the beginning annonymous function for map
            # parent.x = get(".x", envir = parent.frame())
            # i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, input_object_name_of_map_function_to_investigate) } ))
            # 
            # # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
            # print(Sys.time())
            # #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
            # cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))

            # # Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) )); gc()


map.parent_name = function(vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/map.parent_name.dev.r")
    if(is.vector(vec) & !is.list(vec)) {
        out1 = vec %>% seq_along %>% map(function(i) {
            out2 = do.call(.f, args = list(vec[i], ...))
            
            if (.print.Sys.time == T) print(Sys.time())
            cat(paste0("Finished .f() map from vector element [", i, "] named: ", ifelse(is.null(names(vec)[i]), "NULL", names(vec)[i]), "  #---- \n"))
            
            if (.add.attributes == T) attr(out2, "parent_name") = names(vec)[i]
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
            
            if (.print.Sys.time == T) print(Sys.time())
            cat(paste0("Finished .f() map from list element [[", i, "]] named: ", ifelse(is.null(names(ls)[i]), "NULL", names(ls)[i]), "  #---- \n"))
            
            if (.add.attributes == T) attr(out2, "parent_name") = names(ls)[i]
            out2
        })
        names(out1) = names(ls)
    }
    # object.size(`[<-.data.frame`) # about 1 MB (1140144 bytes)
    if (.add.attributes == T) {
        attr(out1, "function.input") = list(
            map.function.name = "map.parent_name"
            , map.function.source = map.parent_name
            , vec.name = deparse(substitute(vec))
            , vec.object.size = object.size(vec)
            # , vec.1st.element = ifelse(object.size(vec) <= .max.object.size.to.store, vec, paste0("object.size larger than ", .max.object.size.to.store))
            , vec = paste0("Not stored b/c object.size larger than ", .max.object.size.to.store)
            , .f.name = deparse(substitute(.f))
            , .f = .f
        ) # list inside attr() is not shown with str(max.level = 1)
        if (object.size(vec) <= .max.object.size.to.store) {
            attr(out1, "function.input")$vec = vec
        }
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
map.parent_name2 = function(vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/map.parent_name.dev.r")
    if(is.vector(vec) & !is.list(vec)) {
        out1 = vec %>% seq_along %>% map(function(i) {
            out2 = do.call(.f, args = list(vec[i], ...))
            
            if (.print.Sys.time == T) print(Sys.time())
            cat(paste0("Finished .f() map from vector element [", i, "] named: ", ifelse(is.null(names(vec)[i]), "NULL", names(vec)[i]), "  #---- \n"))
            
            if (.add.attributes == T) attr(out2, "parent_name") = names(vec)[i]
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
        out1 = ls %>% map(function(input_object_name_of_map_function_to_investigate) {
            out2 = do.call(.f, args = list(input_object_name_of_map_function_to_investigate))
            # attr(out2, "parent_name") = names(ls)[i]
            parent.x = get(".x", envir = parent.frame())
            i = which(map_lgl(parent.x, function(children_from_parent.x) {identical(children_from_parent.x, input_object_name_of_map_function_to_investigate)}))
            
            if (.print.Sys.time == T) print(Sys.time())
            cat(paste0("Finished .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))
            
            # attr(out2, "parent_name") = names(parent.x)[which(parent.x == input_object_name_of_map_function_to_investigate)]
            # attr(out2, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(children_from_parent.x) {identical(children_from_parent.x, input_object_name_of_map_function_to_investigate)}))]
            if (.add.attributes == T) attr(out2, "parent_name") = names(parent.x)[i]
            out2
        })
        names(out1) = names(ls)
    }
    # object.size(`[<-.data.frame`) # about 1 MB (1140144 bytes)
    if (.add.attributes == T) {
        attr(out1, "function.input") = list(
            map.function.name = "map.parent_name2"
            , map.function.source = map.parent_name2
            , vec.name = deparse(substitute(vec))
            , vec.object.size = object.size(vec)
            # , vec.1st.element = ifelse(object.size(vec) <= .max.object.size.to.store, vec, paste0("object.size larger than ", .max.object.size.to.store))
            , vec = paste0("Not stored b/c object.size larger than ", .max.object.size.to.store)
            , .f.name = deparse(substitute(.f))
            , .f = .f
        ) # list inside attr() is not shown with str(max.level = 1)
        if (object.size(vec) <= .max.object.size.to.store) {
            attr(out1, "function.input")$vec = vec
        }
    }
    out1
}


## @ test) map.parent_name() 1:3 -------  
library(tidyverse)
set.seed(1); 1:3 %>% map(rnorm, n = 10) |> str()
set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10, .add.attributes = F) |> str()
set.seed(1); 1:3 %>% map.parent_name2(rnorm, n = 10, .add.attributes = F) |> str()
set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10, .add.attributes = F, .print.Sys.time = T) |> str()
set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10, .max.object.size.to.store = 10) |> str()
set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10) |> str()
set.seed(1); 1:3 %>% map.parent_name2(rnorm, n = 10) |> str()

set.seed(1); 1:3 %>% map(~rnorm(10, .x)) |> str()
# set.seed(1); 1:3 %>% map.parent_name(~rnorm(10, .x)) |> str()
set.seed(1); 1:3 %>% map(function(x) rnorm(10, x)) |> str()
set.seed(1); 1:3 %>% map.parent_name(.f = function(x) rnorm(10, x)) |> str()
set.seed(1); 1:3 %>% map.parent_name2(.f = function(x) rnorm(10, x)) |> str()
# > set.seed(1); 1:3 %>% map(rnorm, n = 10) |> str()
# List of 3
#  $ : num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ : num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ : num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10, .add.attributes = F) |> str()
# [1] "Finished .f() map from vector element [1] named: NULL"
# [1] "Finished .f() map from vector element [2] named: NULL"
# [1] "Finished .f() map from vector element [3] named: NULL"
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map.parent_name2(rnorm, n = 10, .add.attributes = F) |> str()
# [1] "Finished .f() map from vector element [1] named: NULL"
# [1] "Finished .f() map from vector element [2] named: NULL"
# [1] "Finished .f() map from vector element [3] named: NULL"
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10, .add.attributes = F, .print.Sys.time = T) |> str()
# [1] "2017-08-26 02:22:35 EDT"
# [1] "Finished .f() map from vector element [1] named: NULL"
# [1] "2017-08-26 02:22:35 EDT"
# [1] "Finished .f() map from vector element [2] named: NULL"
# [1] "2017-08-26 02:22:35 EDT"
# [1] "Finished .f() map from vector element [3] named: NULL"
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
# > set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10, .max.object.size.to.store = 10) |> str()
# [1] "Finished .f() map from vector element [1] named: NULL"
# [1] "Finished .f() map from vector element [2] named: NULL"
# [1] "Finished .f() map from vector element [3] named: NULL"
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 19 49 1 19 1 1 49
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000048e87d0> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 56
#   ..$ vec                : chr "Not stored b/c object.size larger than 10"
#   ..$ .f.name            : chr "rnorm"
#   ..$ .f                 :function (n, mean = 0, sd = 1)  
# > set.seed(1); 1:3 %>% map.parent_name(rnorm, n = 10) |> str()
# [1] "Finished .f() map from vector element [1] named: NULL"
# [1] "Finished .f() map from vector element [2] named: NULL"
# [1] "Finished .f() map from vector element [3] named: NULL"
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 19 49 1 19 1 1 49
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000048e87d0> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 56
#   ..$ vec                : int [1:3] 1 2 3
#   ..$ .f.name            : chr "rnorm"
#   ..$ .f                 :function (n, mean = 0, sd = 1)  
# > set.seed(1); 1:3 %>% map.parent_name2(rnorm, n = 10) |> str()
# [1] "Finished .f() map from vector element [1] named: NULL"
# [1] "Finished .f() map from vector element [2] named: NULL"
# [1] "Finished .f() map from vector element [3] named: NULL"
# List of 3
#  $ 1: num [1:10] 0.374 1.184 0.164 2.595 1.33 ...
#  $ 2: num [1:10] 3.512 2.39 1.379 -0.215 3.125 ...
#  $ 3: num [1:10] 3.92 3.78 3.07 1.01 3.62 ...
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name2"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 20 55 1 20 1 1 55
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000048b5378> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 56
#   ..$ vec                : int [1:3] 1 2 3
#   ..$ .f.name            : chr "rnorm"
#   ..$ .f                 :function (n, mean = 0, sd = 1)

mtcars[, 1:3] %>% split(.$cyl) |> str()
# > mtcars[, 1:3] %>% split(.$cyl) |> str()
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


mtcars %>% split(.$cyl) %>% map(nrow) |> str()
mtcars %>% split(.$cyl) %>% map.parent_name(nrow, .add.attributes = F) |> str()
mtcars %>% split(.$cyl) %>% map.parent_name2(nrow, .add.attributes = F) |> str()
mtcars %>% split(.$cyl) %>% map.parent_name(nrow, .max.object.size.to.store = 10^4) |> str()
mtcars %>% split(.$cyl) %>% map.parent_name2(nrow, .max.object.size.to.store = 10^4) |> str()
mtcars %>% split(.$cyl) %>% map(~nrow(.x)) |> str()
# mtcars %>% split(.$cyl) %>% map.parent_name(~nrow(.x)) |> str()
mtcars %>% split(.$cyl) %>% map(function(x) nrow(x)) |> str()
mtcars %>% split(.$cyl) %>% map.parent_name(function(x) nrow(x)) |> str()
mtcars %>% split(.$cyl) %>% map.parent_name2(function(x) nrow(x)) |> str()
# > mtcars %>% split(.$cyl) %>% map(nrow) |> str()
# List of 3
#  $ 4: int 11
#  $ 6: int 7
#  $ 8: int 14
# > mtcars %>% split(.$cyl) %>% map.parent_name(nrow, .add.attributes = F) |> str()
# [1] "Finished .f() map from list element [[1]] named: 4"
# [1] "Finished .f() map from list element [[2]] named: 6"
# [1] "Finished .f() map from list element [[3]] named: 8"
# List of 3
#  $ 4: int 11
#  $ 6: int 7
#  $ 8: int 14
# > mtcars %>% split(.$cyl) %>% map.parent_name2(nrow, .add.attributes = F) |> str()
# [1] "Finished .f() map from list element [[1]] named: 4"
# [1] "Finished .f() map from list element [[2]] named: 6"
# [1] "Finished .f() map from list element [[3]] named: 8"
# List of 3
#  $ 4: int 11
#  $ 6: int 7
#  $ 8: int 14
# > mtcars %>% split(.$cyl) %>% map.parent_name(nrow, .max.object.size.to.store = 10^4) |> str()
# [1] "Finished .f() map from list element [[1]] named: 4"
# [1] "Finished .f() map from list element [[2]] named: 6"
# [1] "Finished .f() map from list element [[3]] named: 8"
# List of 3
#  $ 4: atomic [1:1] 11
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 7
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 14
#   ..- attr(*, "parent_name")= chr "8"
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 19 49 1 19 1 1 49
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000048e87d0> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 11472
#   ..$ vec                : chr "Not stored b/c object.size larger than 10000"
#   ..$ .f.name            : chr "nrow"
#   ..$ .f                 :function (x)  
# > mtcars %>% split(.$cyl) %>% map.parent_name2(nrow, .max.object.size.to.store = 10^4) |> str()
# [1] "Finished .f() map from list element [[1]] named: 4"
# [1] "Finished .f() map from list element [[2]] named: 6"
# [1] "Finished .f() map from list element [[3]] named: 8"
# List of 3
#  $ 4: atomic [1:1] 11
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 7
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 14
#   ..- attr(*, "parent_name")= chr "8"
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name2"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), .print.Sys.time = F, .add.attributes = T, ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 20 55 1 20 1 1 55
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000048b5378> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 11472
#   ..$ vec                : chr "Not stored b/c object.size larger than 10000"
#   ..$ .f.name            : chr "nrow"
#   ..$ .f                 :function (x) 

mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) |> str(max.level = 1)
mtcars %>% split(.$cyl) %>% map.parent_name(lm, formula = mpg ~ wt) |> str(max.level = 1)
mtcars %>% split(.$cyl) %>% map.parent_name2(lm, formula = mpg ~ wt) |> str(max.level = 1)
mtcars %>% split(.$cyl) %>% map(~ lm(mpg ~ wt, data = .x)) |> str(max.level = 1)
# mtcars %>% split(.$cyl) %>% map.parent_name(~ lm(mpg ~ wt, data = .x)) |> str(max.level = 1)
mtcars %>% split(.$cyl) %>% map(function(x) lm(mpg ~ wt, data = x)) |> str(max.level = 1)
mtcars %>% split(.$cyl) %>% map.parent_name(function(x) lm(mpg ~ wt, data = x)) |> str(max.level = 1)
mtcars %>% split(.$cyl) %>% map.parent_name2(function(x) lm(mpg ~ wt, data = x)) |> str(max.level = 1)
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) |> str(max.level = 1)
# List of 3
#  $ 4:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 6:List of 12
#   ..- attr(*, "class")= chr "lm"
#  $ 8:List of 12
#   ..- attr(*, "class")= chr "lm"
# > mtcars %>% split(.$cyl) %>% map.parent_name(lm, formula = mpg ~ wt) |> str(max.level = 1)
# [1] ".f() map from list element [[1]] named: 4"
# [1] ".f() map from list element [[2]] named: 6"
# [1] ".f() map from list element [[3]] named: 8"
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
#  - attr(*, "function.input")=List of 7
# > mtcars %>% split(.$cyl) %>% map.parent_name2(lm, formula = mpg ~ wt) |> str(max.level = 1)
# [1] ".f() map from list element [[1]] named: 4"
# [1] ".f() map from list element [[2]] named: 6"
# [1] ".f() map from list element [[3]] named: 8"
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
#  - attr(*, "function.input")=List of 7

mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map(length) |> str()
mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name(length, .max.object.size.to.store = 10^4) |> str()
mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name2(length, .max.object.size.to.store = 10^4) |> str()
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map(length) |> str()
# List of 3
#  $ 4: int 12
#  $ 6: int 12
#  $ 8: int 12
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name(length, .max.object.size.to.store = 10^4) |> str()
# [1] ".f() map from list element [[1]] named: 4"
# [1] ".f() map from list element [[2]] named: 6"
# [1] ".f() map from list element [[3]] named: 8"
# List of 3
#  $ 4: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "8"
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 19 41 1 19 1 1 41
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000142d79e0> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 50840
#   ..$ vec                : chr "Not stored b/c object.size larger than 10000"
#   ..$ .f.name            : chr "length"
#   ..$ .f                 :function (x)  
# > mtcars %>% split(.$cyl) %>% map(lm, formula = mpg ~ wt) %>% map.parent_name2(length, .max.object.size.to.store = 10^4) |> str()
# [1] ".f() map from list element [[1]] named: 4"
# [1] ".f() map from list element [[2]] named: 6"
# [1] ".f() map from list element [[3]] named: 8"
# List of 3
#  $ 4: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "4"
#  $ 6: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "6"
#  $ 8: atomic [1:1] 12
#   ..- attr(*, "parent_name")= chr "8"
#  - attr(*, "function.input")=List of 7
#   ..$ map.function.name  : chr "map.parent_name2"
#   ..$ map.function.source:function (vec, .f, .max.object.size.to.store = object.size(`[<-.data.frame`), ...)  
#   .. ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 20 47 1 20 1 1 47
#   .. .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000014307a68> 
#   ..$ vec.name           : chr "."
#   ..$ vec.object.size    :Class 'object_size'  num 50840
#   ..$ vec                : chr "Not stored b/c object.size larger than 10000"
#   ..$ .f.name            : chr "length"
#   ..$ .f                 :function (x) 







# @@ END----  
