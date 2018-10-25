# function.indicators2factor.source.r

# https://www.r-bloggers.com/conversion-between-factor-and-dummies-in-r/

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
# dummies %>% dput
# > dummies %>% dput
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
strsplit(colnames(dummies), '[.]') %>% str
unlist(strsplit(colnames(dummies), '[.]'))
1:ncol(dummies)
2 * (1:ncol(dummies))
unlist(strsplit(colnames(dummies), '[.]'))[2 * (1:ncol(dummies))]
header <- unlist(strsplit(colnames(dummies), '[.]'))[2 * (1:ncol(dummies))]
# > colnames(dummies)
# [1] "Species.setosa"     "Species.versicolor" "Species.virginica" 
# > strsplit(colnames(dummies), '[.]') %>% str
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



colnames(dummies) %>% strsplit("\\.") %>% str
colnames(dummies) %>% strsplit("\\.") %>% map(function(vec) vec[2]) %>% unlist
# > colnames(dummies) %>% strsplit("\\.") %>% str
# List of 3
#  $ : chr [1:2] "Species" "setosa"
#  $ : chr [1:2] "Species" "versicolor"
#  $ : chr [1:2] "Species" "virginica"
# > colnames(dummies) %>% strsplit("\\.") %>% map(function(vec) vec[2]) %>% unlist
# [1] "setosa"     "versicolor" "virginica" 


colnames(dummies) %>% gsub("^.+\\.", "", .)
colnames(dummies) %>% str_replace_all("^.+\\.", "")
# > colnames(dummies) %>% gsub("^.+\\.", "", .)
# [1] "setosa"     "versicolor" "virginica" 
# > colnames(dummies) %>% str_replace_all("^.+\\.", "")
# [1] "setosa"     "versicolor" "virginica" 






#@ -----
dummies %>% str
dummies %>% as.tibble
dummies %>% {.[0:(nrow(.)/10-1) * 10 + 1, ]} #----
# > dummies %>% str
#  num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:150] "1" "2" "3" "4" ...
#   ..$ : chr [1:3] "Species.setosa" "Species.versicolor" "Species.virginica"
# > dummies %>% as.tibble
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


1:ncol(dummies) %>% str
(dummies %*% 1:ncol(dummies)) %>% str
(dummies %*% 1:ncol(dummies)) %>% as.tibble
(dummies %*% 1:ncol(dummies)) %>% {.[0:(nrow(.)/10-1) * 10 + 1, ]} #----
# > 1:ncol(dummies) %>% str
#  int [1:3] 1 2 3
# > (dummies %*% 1:ncol(dummies)) %>% str
#  num [1:150, 1] 1 1 1 1 1 1 1 1 1 1 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:150] "1" "2" "3" "4" ...
#   ..$ : NULL
# > (dummies %*% 1:ncol(dummies)) %>% as.tibble
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


factor(dummies %*% 1:ncol(dummies), labels = header) %>% str
factor(dummies %*% 1:ncol(dummies), labels = header) %>% as.tibble
factor(dummies %*% 1:ncol(dummies), labels = header) %>% {.[0:(length(.)/10-1) * 10 + 1]} #----
# > factor(dummies %*% 1:ncol(dummies), labels = header) %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# > factor(dummies %*% 1:ncol(dummies), labels = header) %>% as.tibble
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



#@ end -----

