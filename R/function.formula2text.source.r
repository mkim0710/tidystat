#@ function.formula2text.source.r


formula4MainModel = Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year
formula4MainModel %>% str
# > formula4MainModel %>% str
# Class 'formula'  language Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4| __truncated__
#   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 

formula4MainModel %>% as.list
formula4MainModel %>% as.list %>% str
# > formula4MainModel %>% as.list %>% str
# List of 3
#  $ : symbol ~
#  $ : symbol Depressed
#  $ : language SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college | __truncated__
#  - attr(*, "class")= chr "formula"
#  - attr(*, ".Environment")=<environment: R_GlobalEnv> 


formula4MainModel[[3]] %>% str
# > formula4MainModel[[3]] %>% str
#  language SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college | __truncated__
formula4MainModel[[3]]



formula4MainModel %>% as.character
# > formula4MainModel %>% as.character
# [1] "~"                                                                                                                                        
# [2] "Depressed"                                                                                                                                
# [3] "SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year"


?as.formula

formula4MainModel %>% deparse
# > formula4MainModel %>% deparse
# [1] "Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + "
# [2] "    AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + "   
# [3] "    HIQ_6 + HUQ_3_lt_1year"                

formula4MainModel %>% dput %>% str
# > formula4MainModel %>% dput %>% str
# Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + 
#     AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + 
#     HIQ_6 + HUQ_3_lt_1year
# Class 'formula'  language Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married +     | __truncated__
#   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 


formula4MainModel %>% format
# > formula4MainModel %>% format
# [1] "Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + "
# [2] "    AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + "   
# [3] "    HIQ_6 + HUQ_3_lt_1year"                               


formula4MainModel %>% {paste(.[[2]], .[[1]], .[[3]])}
# > formula4MainModel %>% {paste(.[[2]], .[[1]], .[[3]])}
# [1] "Depressed ~ +"                                                                                                                       
# [2] "Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6"
# [3] "Depressed ~ HUQ_3_lt_1year"         

formula4MainModel %>% as.character %>% {paste(.[2], .[1], .[3])}
# > formula4MainModel %>% as.character %>% {paste(.[2], .[1], .[3])}
# [1] "Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year"



function.formula2text = function(formula) {
    formula %>% as.character %>% {paste(.[2], .[1], .[3])}
}

formula4MainModel %>% function.formula2text
formula4MainModel %>% deparse




# http://www.cookbook-r.com/Formulas/Creating_a_formula_from_a_string/
# https://stackoverflow.com/questions/14671172/how-to-convert-r-formula-to-text
frm <- celkem ~ rok + mesic
Reduce(paste, deparse(frm))
# [1] "celkem ~ rok + mesic"

library(formula.tools)
as.character(frm)
# [1] "celkem ~ rok + mesic"


frm <- formula(paste("y ~ ", paste0("x", 1:12, collapse = " + ")))

deparse(frm)
# [1] "y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + "
# [2] "    x12"                                                      
Reduce(paste, deparse(frm))
# [1] "y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 +      x12"

paste("my text", format(frm))
## [1] "my text celkem ~ rok + mesic"








#@ -------
library(tidyverse)
require(mice)

nhanes2 %>% dput
# > nhanes2 %>% dput
# structure(list(age = structure(c(1L, 2L, 1L, 3L, 1L, 3L, 1L, 
# 1L, 2L, 2L, 1L, 2L, 3L, 2L, 1L, 1L, 3L, 2L, 1L, 3L, 1L, 1L, 1L, 
# 3L, 2L), .Label = c("20-39", "40-59", "60-99"), class = "factor"), 
#     bmi = c(NA, 22.7, NA, NA, 20.4, NA, 22.5, 30.1, 22, NA, NA, 
#     NA, 21.7, 28.7, 29.6, NA, 27.2, 26.3, 35.3, 25.5, NA, 33.2, 
#     27.5, 24.9, 27.4), hyp = structure(c(NA, 1L, 1L, NA, 1L, 
#     NA, 1L, 1L, 1L, NA, NA, NA, 1L, 2L, 1L, NA, 2L, 2L, 1L, 2L, 
#     NA, 1L, 1L, 1L, 1L), .Label = c("no", "yes"), class = "factor"), 
#     chl = c(NA, 187, 187, NA, 113, 184, 118, 187, 238, NA, NA, 
#     NA, 206, 204, NA, NA, 284, 199, 218, NA, NA, 229, 131, NA, 
#     186)), row.names = c("1", "2", "3", "4", "5", "6", "7", "8", 
# "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", 
# "20", "21", "22", "23", "24", "25"), class = "data.frame")

fit = nhanes2.imp %>% mice::with.mids(lm(chl ~ age + bmi))
fit = nhanes2.imp %>% with.mids(lm(chl ~ age + bmi))
fit = nhanes2.imp %>% with(lm(chl ~ age + bmi))
# > fit = nhanes2.imp %>% mice::with.mids(lm(chl ~ age + bmi))
# Error: 'with.mids' is not an exported object from 'namespace:mice'
# > fit = nhanes2.imp %>% with.mids(lm(chl ~ age + bmi))
# Error in with.mids(., lm(chl ~ age + bmi)) : 
#   could not find function "with.mids"
# > fit = nhanes2.imp %>% with(lm(chl ~ age + bmi))




as.expression(paste0("lm(", as.character(formula)[2], " ~ ", as.character(formula)[3], ")"))
# > as.expression(paste0("lm(", as.character(formula)[2], " ~ ", as.character(formula)[3], ")"))
# expression("lm(chl ~ age + bmi)")


formula = chl ~ age + bmi
as.character(formula)
# > as.character(formula)
# [1] "~"         "chl"       "age + bmi"
formula[[1]]
formula[[2]]
formula[[3]]
# > formula[[1]]
# `~`
# > formula[[2]]
# chl
# > formula[[3]]
# age + bmi




as.expression(parse(text = paste0("lm(", as.character(formula)[2], " ~ ", as.character(formula)[3], ")")))
# > as.expression(parse(text = paste0("lm(", as.character(formula)[2], " ~ ", as.character(formula)[3], ")")))
# expression(lm(chl ~ age + bmi))


#@ end -----


