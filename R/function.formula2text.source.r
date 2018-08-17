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


