# function.df_dummy2factor.source.r


function.df_dummy2factor = function(df_dummy, varname_prefix = "") {
    df_dummy.matrix = as.matrix(df_dummy)
    out = factor(df_dummy.matrix %*% 1:ncol(df_dummy), labels = gsub(varname_prefix, "", colnames(df_dummy)))
    out
}

#@ test) function.dummy2factor() iris.Species.dummy -----
library(tidyverse)
# model.matrix(~ Species, data = iris) %>% str
# # > model.matrix(~ Species, data = iris) %>% str
# #  num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
# #  - attr(*, "dimnames")=List of 2
# #   ..$ : chr [1:150] "1" "2" "3" "4" ...
# #   ..$ : chr [1:3] "(Intercept)" "Speciesversicolor" "Speciesvirginica"
# #  - attr(*, "assign")= int [1:3] 0 1 1
# #  - attr(*, "contrasts")=List of 1
# #   ..$ Species: chr "contr.treatment"
# 
# useful::build.x(~ Species, data = iris, contrasts = F) %>% str
# # > useful::build.x(~ Species, data = iris, contrasts = F) %>% str
# #  num [1:150, 1:4] 1 1 1 1 1 1 1 1 1 1 ...
# #  - attr(*, "dimnames")=List of 2
# #   ..$ : chr [1:150] "1" "2" "3" "4" ...
# #   ..$ : chr [1:4] "(Intercept)" "Speciessetosa" "Speciesversicolor" "Speciesvirginica"
# #  - attr(*, "assign")= int [1:4] 0 1 1 1
# #  - attr(*, "contrasts")=List of 1
# #   ..$ Species: num [1:3, 1:3] 1 0 0 0 1 0 0 0 1
# #   .. ..- attr(*, "dimnames")=List of 2
# #   .. .. ..$ : chr [1:3] "setosa" "versicolor" "virginica"
# #   .. .. ..$ : chr [1:3] "setosa" "versicolor" "virginica"
# 
# library(caret)
# dummyVars(~ Species, data = iris) %>% str
# predict(dummyVars(~ Species, data = iris), newdata = iris) %>% str
# # > dummyVars(~ Species, data = iris) %>% str
# # List of 9
# #  $ call      : language dummyVars.default(formula = ~Species, data = iris)
# #  $ form      :Class 'formula'  language ~Species
# #   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
# #  $ vars      : chr "Species"
# #  $ facVars   : chr "Species"
# #  $ lvls      :List of 1
# #   ..$ Species: chr [1:3] "setosa" "versicolor" "virginica"
# #  $ sep       : chr "."
# #  $ terms     :Classes 'terms', 'formula'  language ~Species
# #   .. ..- attr(*, "variables")= language list(Species)
# #   .. ..- attr(*, "factors")= int [1, 1] 1
# #   .. .. ..- attr(*, "dimnames")=List of 2
# #   .. .. .. ..$ : chr "Species"
# #   .. .. .. ..$ : chr "Species"
# #   .. ..- attr(*, "term.labels")= chr "Species"
# #   .. ..- attr(*, "order")= int 1
# #   .. ..- attr(*, "intercept")= int 1
# #   .. ..- attr(*, "response")= int 0
# #   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
# #   .. ..- attr(*, "predvars")= language list(Species)
# #   .. ..- attr(*, "dataClasses")= Named chr "factor"
# #   .. .. ..- attr(*, "names")= chr "Species"
# #  $ levelsOnly: logi FALSE
# #  $ fullRank  : logi FALSE
# #  - attr(*, "class")= chr "dummyVars"
# # > predict(dummyVars(~ Species, data = iris), newdata = iris) %>% str
# #  num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
# #  - attr(*, "dimnames")=List of 2
# #   ..$ : chr [1:150] "1" "2" "3" "4" ...
# #   ..$ : chr [1:3] "Species.setosa" "Species.versicolor" "Species.virginica"
# 
# iris.Species.dummy = predict(dummyVars(~ Species, data = iris), newdata = iris)
# save(iris.Species.dummy, file = "data/iris.Species.dummy.rda")
load("data/iris.Species.dummy.rda")
iris.Species.dummy %>% str
iris.Species.dummy[c(1,51,101,150),]
# > iris.Species.dummy %>% str
#  num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:150] "1" "2" "3" "4" ...
#   ..$ : chr [1:3] "Species.setosa" "Species.versicolor" "Species.virginica"
# > iris.Species.dummy[c(1,51,101,150),]
#     Species.setosa Species.versicolor Species.virginica
# 1                1                  0                 0
# 51               0                  1                 0
# 101              0                  0                 1
# 150              0                  0                 1


iris.Species.dummy %>% function.dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy %>% as.data.frame %>% function.dummy2factor(varname_prefix = "Species.") %>% str
# > iris.Species.dummy %>% function.dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# > iris.Species.dummy %>% as.data.frame %>% function.dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...



#@ end -----
