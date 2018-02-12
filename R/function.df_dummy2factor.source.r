# function.df_dummy2factor.source.r


function.df_dummy2factor = function(df_dummy, varname_prefix = "") {
    if (any(is.na(df_dummy))) {
        warning("any(is.na(df_dummy))")
        # df_dummy[is.na(df_dummy)] = 0
    }
    if (!is.logical(as.matrix(df_dummy))) {
        warning("!is.logical(as.matrix(df_dummy))")
    }
    if (any(as.matrix(df_dummy)!=0 & as.matrix(df_dummy)!=1, na.rm = T)) {
        warning("any(as.matrix(df_dummy)!=0 & as.matrix(df_dummy)!=1, na.rm = T)")
    }
    library(tidyverse)
    df_dummy.logical.numeric = as.data.frame(df_dummy) %>% map_df(as.logical) %>% map_df(as.numeric)
    if (any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)) {
        warning("any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)")
        df_dummy.logical.numeric[which(rowSums(df_dummy.logical.numeric)!=1), ] = NA
    }
    df_dummy.logical.numeric.matrix = as.matrix(df_dummy.logical.numeric)
    out = factor(df_dummy.logical.numeric.matrix %*% 1:ncol(df_dummy.logical.numeric), labels = gsub(varname_prefix, "", colnames(df_dummy.logical.numeric)))
    out
}

#@ -----
as.logical(-0.1)
as.logical(0)
as.logical(0.1)
as.logical(1.1)
# > as.logical(-0.1)
# [1] TRUE
# > as.logical(0)
# [1] FALSE
# > as.logical(0.1)
# [1] TRUE
# > as.logical(1.1)
# [1] TRUE

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

iris.Species.dummy %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
iris.Species.dummy %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# > iris.Species.dummy %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# Warning message:
# In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# > iris.Species.dummy %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# Warning message:
# In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# > iris.Species.dummy %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] setosa     versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning message:
# In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# > iris.Species.dummy %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] setosa     versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning message:
# In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))

iris.Species.dummy2 = iris.Species.dummy
iris.Species.dummy2[1,] = c(0,0,1.1) 
iris.Species.dummy2 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy2 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy2 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
iris.Species.dummy2 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# > iris.Species.dummy2 = iris.Species.dummy
# > iris.Species.dummy2[1,] = c(0,0,1.1) 
# > iris.Species.dummy2 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 3 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(as.matrix(df_dummy)!=0 & as.matrix(df_dummy)!=1, na.rm = T)
# > iris.Species.dummy2 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: 3 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(as.matrix(df_dummy)!=0 & as.matrix(df_dummy)!=1, na.rm = T)
# > iris.Species.dummy2 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] virginica  versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(as.matrix(df_dummy)!=0 & as.matrix(df_dummy)!=1, na.rm = T)
# > iris.Species.dummy2 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] virginica  versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(as.matrix(df_dummy)!=0 & as.matrix(df_dummy)!=1, na.rm = T)


iris.Species.dummy3 = iris.Species.dummy
iris.Species.dummy3[1,] = c(0,NA,1) 
iris.Species.dummy3 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy3 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy3 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
iris.Species.dummy3 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# > iris.Species.dummy3 = iris.Species.dummy
# > iris.Species.dummy3[1,] = c(0,NA,1) 
# > iris.Species.dummy3 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: NA 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(is.na(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# > iris.Species.dummy3 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: NA 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(is.na(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# > iris.Species.dummy3 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] <NA>       versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(is.na(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# > iris.Species.dummy3 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] <NA>       versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(is.na(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))


iris.Species.dummy4 = iris.Species.dummy
iris.Species.dummy4[1,] = c(0,1,1) 
iris.Species.dummy4 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy4 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy4 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
iris.Species.dummy4 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# > iris.Species.dummy4 = iris.Species.dummy
# > iris.Species.dummy4[1,] = c(0,1,1) 
# > iris.Species.dummy4 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: NA 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)
# > iris.Species.dummy4 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: NA 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)
# > iris.Species.dummy4 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] <NA>       versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)
# > iris.Species.dummy4 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] <NA>       versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)


iris.Species.dummy5 = iris.Species.dummy
iris.Species.dummy5[1,] = c(0,0,0) 
iris.Species.dummy5 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy5 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
iris.Species.dummy5 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
iris.Species.dummy5 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# > iris.Species.dummy5 = iris.Species.dummy
# > iris.Species.dummy5[1,] = c(0,0,0) 
# > iris.Species.dummy5 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: NA 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)
# > iris.Species.dummy5 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% str
#  Factor w/ 3 levels "setosa","versicolor",..: NA 1 1 1 1 1 1 1 1 1 ...
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)
# > iris.Species.dummy5 %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] <NA>       versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)
# > iris.Species.dummy5 %>% as.data.frame %>% function.df_dummy2factor(varname_prefix = "Species.") %>% {.[c(1,51,101,150)]}
# [1] <NA>       versicolor virginica  virginica 
# Levels: setosa versicolor virginica
# Warning messages:
# 1: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   !is.logical(as.matrix(df_dummy))
# 2: In function.df_dummy2factor(., varname_prefix = "Species.") :
#   any(rowSums(df_dummy.logical.numeric)!=1, na.rm = T)




#@ end -----
