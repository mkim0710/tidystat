# function.indicators2factor.dev.r


#@ ?factor ====
?factor
# Usage
# 
# factor(x = character(), levels, labels = levels,
#        exclude = NA, ordered = is.ordered(x), nmax = NA)
# 
# ordered(x, ...)
# 
# is.factor(x)
# is.ordered(x)
# 
# as.factor(x)
# as.ordered(x)
# 
# addNA(x, ifany = FALSE)


substring("statistics", 1:10, 1:10)
"statistics" |> str_split("") |> unlist()
# > substring("statistics", 1:10, 1:10)
#  [1] "s" "t" "a" "t" "i" "s" "t" "i" "c" "s"
# > "statistics" |> str_split("") |> unlist()
#  [1] "s" "t" "a" "t" "i" "s" "t" "i" "c" "s"

(ff <- factor(substring("statistics", 1:10, 1:10), levels = letters))
# > (ff <- factor(substring("statistics", 1:10, 1:10), levels = letters))
#  [1] s t a t i s t i c s
# Levels: a b c d e f g h i j k l m n o p q r s t u v w x y z

as.integer(ff)      # the internal codes
# > as.integer(ff)      # the internal codes
#  [1] 19 20  1 20  9 19 20  9  3 19

(f. <- factor(ff))  # drops the levels that do not occur ----
ff[, drop = TRUE]   # the same, more transparently ----
# > (f. <- factor(ff))  # drops the levels that do not occur ----
#  [1] s t a t i s t i c s
# Levels: a c i s t
# > ff[, drop = TRUE]   # the same, more transparently ----
#  [1] s t a t i s t i c s
# Levels: a c i s t

letters[1:20]
# > letters[1:20]
#  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"

factor(letters[1:20], labels = "letter")
# > factor(letters[1:20], labels = "letter")
#  [1] letter1  letter2  letter3  letter4  letter5  letter6  letter7  letter8  letter9  letter10 letter11 letter12 letter13 letter14 letter15
# [16] letter16 letter17 letter18 letter19 letter20
# 20 Levels: letter1 letter2 letter3 letter4 letter5 letter6 letter7 letter8 letter9 letter10 letter11 letter12 letter13 letter14 ... letter20


ordered(4:1)
class(ordered(4:1)) # "ordered", inheriting from "factor"
# > ordered(4:1)
# [1] 4 3 2 1
# Levels: 1 < 2 < 3 < 4
# > class(ordered(4:1)) # "ordered", inheriting from "factor"
# [1] "ordered" "factor" 

z <- factor(LETTERS[3:1], ordered = TRUE)
z
# > z
# [1] C B A
# Levels: A < B < C



## and "relational" methods work: ----
stopifnot(sort(z)[c(1,3)] == range(z), min(z) < max(z))

sort(z)[c(1,3)]
range(z)
# > sort(z)[c(1,3)]
# [1] A C
# Levels: A < B < C
# > range(z)
# [1] A C
# Levels: A < B < C

min(z)
max(z)
# > min(z)
# [1] A
# Levels: A < B < C
# > max(z)
# [1] C
# Levels: A < B < C


## suppose you want "NA" as a level, and to allow missing values. ----
factor(c(1, 2, NA))
# > factor(c(1, 2, NA))
# [1] 1    2    <NA>
# Levels: 1 2
(x <- factor(c(1, 2, NA), exclude = NULL))
is.na(x)
# > (x <- factor(c(1, 2, NA), exclude = NULL))
# [1] 1    2    <NA>
# Levels: 1 2 <NA>
# > is.na(x)
# [1] FALSE FALSE FALSE

x[2] = NA
is.na(x)
# > x[2] = NA
# > is.na(x)
# [1] FALSE FALSE FALSE

is.na(x)[2] <- TRUE
x  # [1] 1    <NA> <NA>
is.na(x)
# > x  # [1] 1    <NA> <NA>
# [1] 1    <NA> <NA>
# Levels: 1 2 <NA>
# > is.na(x)
# [1] FALSE  TRUE FALSE



## More rational, since R 3.4.0 : ----
factor(c(1:2, NA), exclude =  "" ) # keeps <NA> , as
factor(c(1:2, NA), exclude = NULL) # always did
# > factor(c(1:2, NA), exclude =  "" ) # keeps <NA> , as
# [1] 1    2    <NA>
# Levels: 1 2 <NA>
# > factor(c(1:2, NA), exclude = NULL) # always did
# [1] 1    2    <NA>
# Levels: 1 2 <NA>

## exclude = <character>
z # ordered levels 'A < B < C'
# > z # ordered levels 'A < B < C'
# [1] C B A
# Levels: A < B < C

factor(z, exclude = "C") # does exclude
factor(z, exclude = "B") # ditto
# > factor(z, exclude = "C") # does exclude
# [1] <NA> B    A   
# Levels: A < B
# > factor(z, exclude = "B") # ditto
# [1] C    <NA> A   
# Levels: A < C


## Now, labels maybe duplicated:
## factor() with duplicated labels allowing to "merge levels"
x <- c("Man", "Male", "Man", "Lady", "Female")
## Map from 4 different values to only two levels:
(xf <- factor(x, levels = c("Male", "Man" , "Lady",   "Female"),
                 labels = c("Male", "Male", "Female", "Female")))
# > (xf <- factor(x, levels = c("Male", "Man" , "Lady",   "Female"),
# +                  labels = c("Male", "Male", "Female", "Female")))
# [1] Male   Male   Male   Female Female
# Levels: Male Female


## Using addNA() ----
Month <- airquality$Month
Month |> dput()
# > Month <- airquality$Month
# > Month |> dput()
# c(5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 
# 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 
# 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 
# 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 6L, 7L, 7L, 
# 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 
# 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 8L, 8L, 8L, 
# 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 
# 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 9L, 9L, 9L, 9L, 
# 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 
# 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L)

addNA(Month) |> dput()
# > addNA(Month) |> dput()
# structure(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
# 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
# 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
# 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
# 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 
# 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 4L, 
# 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 
# 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 5L, 5L, 
# 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 
# 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L), .Label = c("5", 
# "6", "7", "8", "9", NA), class = "factor")

table(addNA(Month))
table(addNA(Month, ifany = TRUE))
# > table(addNA(Month))
# 
#    5    6    7    8    9 <NA> 
#   31   30   31   31   30    0 
# > table(addNA(Month, ifany = TRUE))
# 
#  5  6  7  8  9 
# 31 30 31 31 30 




# https://www.r-bloggers.com/conversion-between-factor-and-dummies-in-r/ ====

library(tidyverse)

data(iris)
str(iris)
# OUTPUT: 
# 'data.frame': 150 obs. of  5 variables:
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
 
# ### CONVERT THE FACTOR TO DUMMIES ### 
# library(caret)
# dummies <- predict(dummyVars(~ Species, data = iris), newdata = iris)
# head(dummies, n = 3)
# # OUTPUT:
# #   Species.setosa Species.versicolor Species.virginica
# # 1              1                  0                 0
# # 2              1                  0                 0
# # 3              1                  0                 0
#  
# dummies |> dput()
# > dummies |> dput()
dummies = structure(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), .Dim = c(150L, 3L), .Dimnames = list(
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", 
    "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", 
    "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", 
    "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", 
    "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", 
    "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", 
    "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", 
    "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", 
    "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", 
    "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", 
    "102", "103", "104", "105", "106", "107", "108", "109", "110", 
    "111", "112", "113", "114", "115", "116", "117", "118", "119", 
    "120", "121", "122", "123", "124", "125", "126", "127", "128", 
    "129", "130", "131", "132", "133", "134", "135", "136", "137", 
    "138", "139", "140", "141", "142", "143", "144", "145", "146", 
    "147", "148", "149", "150"), c("Species.setosa", "Species.versicolor", 
    "Species.virginica")))


### CONVERT DUMMIES TO THE FACTOR ###

#@ header <- unlist(strsplit(colnames(dummies), '[.]'))[2 * (1:ncol(dummies))] ----
colnames(dummies)
strsplit(colnames(dummies), '[.]') |> str()
unlist(strsplit(colnames(dummies), '[.]'))
1:ncol(dummies)
2 * (1:ncol(dummies))
unlist(strsplit(colnames(dummies), '[.]'))[2 * (1:ncol(dummies))]
header <- unlist(strsplit(colnames(dummies), '[.]'))[2 * (1:ncol(dummies))]
# > colnames(dummies)
# [1] "Species.setosa"     "Species.versicolor" "Species.virginica" 
# > strsplit(colnames(dummies), '[.]') |> str()
# List of 3
#  $ : chr [1:2] "Species" "setosa"
#  $ : chr [1:2] "Species" "versicolor"
#  $ : chr [1:2] "Species" "virginica"
# > unlist(strsplit(colnames(dummies), '[.]'))
# [1] "Species"    "setosa"     "Species"    "versicolor" "Species"    "virginica" 
# > 1:ncol(dummies)
# [1] 1 2 3
# > 2 * (1:ncol(dummies))
# [1] 2 4 6
# > unlist(strsplit(colnames(dummies), '[.]'))[2 * (1:ncol(dummies))]
# [1] "setosa"     "versicolor" "virginica" 



colnames(dummies) |> str()split("\\.") |> str()
colnames(dummies) |> str()split("\\.") %>% map(function(vec) vec[2]) |> unlist()
# > colnames(dummies) |> str()split("\\.") |> str()
# List of 3
#  $ : chr [1:2] "Species" "setosa"
#  $ : chr [1:2] "Species" "versicolor"
#  $ : chr [1:2] "Species" "virginica"
# > colnames(dummies) |> str()split("\\.") %>% map(function(vec) vec[2]) |> unlist()
# [1] "setosa"     "versicolor" "virginica" 


colnames(dummies) %>% gsub("^.+\\.", "", .)
colnames(dummies) |> str_replace_all("^.+\\.", "")
# > colnames(dummies) %>% gsub("^.+\\.", "", .)
# [1] "setosa"     "versicolor" "virginica" 
# > colnames(dummies) |> str_replace_all("^.+\\.", "")
# [1] "setosa"     "versicolor" "virginica" 






#@ -----
dummies |> str()
dummies |> as_tibble()
dummies %>% {.[0:(nrow(.)/10-1) * 10 + 1, ]} #----
# > dummies |> str()
#  num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:150] "1" "2" "3" "4" ...
#   ..$ : chr [1:3] "Species.setosa" "Species.versicolor" "Species.virginica"
# > dummies |> as_tibble()
# # A tibble: 150 x 3
#    Species.setosa Species.versicolor Species.virginica
#             <dbl>              <dbl>             <dbl>
#  1              1                  0                 0
#  2              1                  0                 0
#  3              1                  0                 0
#  4              1                  0                 0
#  5              1                  0                 0
#  6              1                  0                 0
#  7              1                  0                 0
#  8              1                  0                 0
#  9              1                  0                 0
# 10              1                  0                 0
# # ... with 140 more rows
# > dummies %>% {.[0:(nrow(.)/10-1) * 10 + 1, ]} #----
#     Species.setosa Species.versicolor Species.virginica
# 1                1                  0                 0
# 11               1                  0                 0
# 21               1                  0                 0
# 31               1                  0                 0
# 41               1                  0                 0
# 51               0                  1                 0
# 61               0                  1                 0
# 71               0                  1                 0
# 81               0                  1                 0
# 91               0                  1                 0
# 101              0                  0                 1
# 111              0                  0                 1
# 121              0                  0                 1
# 131              0                  0                 1
# 141              0                  0                 1


1:ncol(dummies) |> str()
(dummies %*% 1:ncol(dummies)) |> str()
(dummies %*% 1:ncol(dummies)) |> as_tibble()
(dummies %*% 1:ncol(dummies)) %>% {.[0:(nrow(.)/10-1) * 10 + 1, ]} #----
# > 1:ncol(dummies) |> str()
#  int [1:3] 1 2 3
# > (dummies %*% 1:ncol(dummies)) |> str()
#  num [1:150, 1] 1 1 1 1 1 1 1 1 1 1 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:150] "1" "2" "3" "4" ...
#   ..$ : NULL
# > (dummies %*% 1:ncol(dummies)) |> as_tibble()
# # A tibble: 150 x 1
#       V1
#    <dbl>
#  1     1
#  2     1
#  3     1
#  4     1
#  5     1
#  6     1
#  7     1
#  8     1
#  9     1
# 10     1
# # ... with 140 more rows
# > (dummies %*% 1:ncol(dummies)) %>% {.[0:(nrow(.)/10-1) * 10 + 1, ]} #----
#   1  11  21  31  41  51  61  71  81  91 101 111 121 131 141 
#   1   1   1   1   1   2   2   2   2   2   3   3   3   3   3 


factor(dummies %*% 1:ncol(dummies), labels = header) |> str()
factor(dummies %*% 1:ncol(dummies), labels = header) |> as_tibble()
factor(dummies %*% 1:ncol(dummies), labels = header) %>% {.[0:(length(.)/10-1) * 10 + 1]} #----
# > factor(dummies %*% 1:ncol(dummies), labels = header) |> str()
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# > factor(dummies %*% 1:ncol(dummies), labels = header) |> as_tibble()
# # A tibble: 150 x 1
#    value 
#    <fct> 
#  1 setosa
#  2 setosa
#  3 setosa
#  4 setosa
#  5 setosa
#  6 setosa
#  7 setosa
#  8 setosa
#  9 setosa
# 10 setosa
# # ... with 140 more rows
# > factor(dummies %*% 1:ncol(dummies), labels = header) %>% {.[0:(length(.)/10-1) * 10 + 1]} #----
#  [1] setosa     setosa     setosa     setosa     setosa     versicolor versicolor versicolor versicolor versicolor virginica  virginica 
# [13] virginica  virginica  virginica 
# Levels: setosa versicolor virginica

species <- factor(dummies %*% 1:ncol(dummies), labels = header)
str(species)
# OUTPUT:
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
 



### COMPARE THE ORIGINAL AND THE CALCULATED FACTORS ###
# library(compare)
all.equal(species, iris$Species)
# > all.equal(species, iris$Species)
# [1] TRUE









#@ function.indicators2factor = function(input.matrix, level = colnames(input.matrix)) { ======
function.indicators2factor = function(input.matrix, labels = colnames(input.matrix), str_replace_all.pattern2remove = NULL, remove_colnames_before_dot = T) {
    # https://github.com/mkim0710/tidystat/blob/master/R/function.indicators2factor.dev.r
    if (!is.null(str_replace_all.pattern2remove)) labels = labels |> str_replace_all(str_replace_all.pattern2remove, "")
    if (remove_colnames_before_dot) labels = labels |> str_replace_all("^.+\\.", "")
    if (is.data.frame(input.matrix)) input.matrix = as.matrix(input.matrix)
    out = factor(input.matrix %*% 1:ncol(input.matrix), labels = labels)
    out
}



# library(caret)
# dummies <- predict(dummyVars(~ Species, data = iris), newdata = iris)
# head(dummies, n = 3)
# # OUTPUT:
# #   Species.setosa Species.versicolor Species.virginica
# # 1              1                  0                 0
# # 2              1                  0                 0
# # 3              1                  0                 0
#  
# dummies |> dput()
# > dummies |> dput()
input.matrix = structure(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), .Dim = c(150L, 3L), .Dimnames = list(
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", 
    "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", 
    "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", 
    "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", 
    "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", 
    "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", 
    "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", 
    "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", 
    "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", 
    "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", 
    "102", "103", "104", "105", "106", "107", "108", "109", "110", 
    "111", "112", "113", "114", "115", "116", "117", "118", "119", 
    "120", "121", "122", "123", "124", "125", "126", "127", "128", 
    "129", "130", "131", "132", "133", "134", "135", "136", "137", 
    "138", "139", "140", "141", "142", "143", "144", "145", "146", 
    "147", "148", "149", "150"), c("Species.setosa", "Species.versicolor", 
    "Species.virginica")))

dummies %>% function.indicators2factor
# > function.indicators2factor(dummies)
#   [1] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
#  [12] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
#  [23] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
#  [34] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
#  [45] setosa     setosa     setosa     setosa     setosa     setosa     versicolor versicolor versicolor versicolor versicolor
#  [56] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
#  [67] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
#  [78] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
#  [89] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
# [100] versicolor virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica 
# [111] virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica 
# [122] virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica 
# [133] virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica 
# [144] virginica  virginica  virginica  virginica  virginica  virginica  virginica 
# Levels: setosa versicolor virginica


all.equal(dummies %>% function.indicators2factor, iris$Species)
# > all.equal(dummies %>% function.indicators2factor, iris$Species)
# [1] TRUE



# n1_2016_withlabels_EPI522_merge_n2_recode1026_drop.Alcohol.indicators.head = n1_2016_withlabels_EPI522_merge_n2_recode1026_drop %>% select(Alcohol_le1pwk, Alcohol_ge2le3pwk, Alcohol_ge4pwk) %>% head(10) %>% as.data.frame
# n1_2016_withlabels_EPI522_merge_n2_recode1026_drop.Alcohol.indicators.head |> dput()
n1_2016_withlabels_EPI522_merge_n2_recode1026_drop.Alcohol.indicators.head = 
    structure(list(
        Alcohol_le1pwk = c(0, NA, 1, 0, NA, 0, NA, 0, NA, 0)
        , Alcohol_ge2le3pwk = c(0, NA, 0, 1, NA, 1, NA, 0, NA, 1)
        , Alcohol_ge4pwk = c(1, NA, 0, 0, NA, 0, NA, 1, NA, 0)
    ), class = "data.frame", row.names = c(NA, -10L))
n1_2016_withlabels_EPI522_merge_n2_recode1026_drop.Alcohol.indicators.head %>% mutate(
    Alcohol = cbind(Alcohol_le1pwk, Alcohol_ge2le3pwk, Alcohol_ge4pwk) %>% function.indicators2factor
) |> as_tibble()
# > n1_2016_withlabels_EPI522_merge_n2_recode1026_drop.Alcohol.indicators.head %>% mutate(
# +     Alcohol = cbind(Alcohol_le1pwk, Alcohol_ge2le3pwk, Alcohol_ge4pwk) %>% function.indicators2factor
# + ) |> as_tibble()
# # A tibble: 10 x 4
#    Alcohol_le1pwk Alcohol_ge2le3pwk Alcohol_ge4pwk Alcohol          
#             <dbl>             <dbl>          <dbl> <fct>            
#  1              0                 0              1 Alcohol_ge4pwk   
#  2             NA                NA             NA NA               
#  3              1                 0              0 Alcohol_le1pwk   
#  4              0                 1              0 Alcohol_ge2le3pwk
#  5             NA                NA             NA NA               
#  6              0                 1              0 Alcohol_ge2le3pwk
#  7             NA                NA             NA NA               
#  8              0                 0              1 Alcohol_ge4pwk   
#  9             NA                NA             NA NA               
# 10              0                 1              0 Alcohol_ge2le3pwk


#@ end -----

