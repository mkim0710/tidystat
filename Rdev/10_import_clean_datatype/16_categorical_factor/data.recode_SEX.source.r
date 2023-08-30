# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/data.recode_SEX.source.r
#@ function.df_recode_SEX ======
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% select(SEX) %>% summary #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% select(SEX) %>% summary #-----
#  SEX       
#  1:148042  
#  2:135756 

?dplyr::recode
factor_vec <- factor(c("a", "b", "c"))
recode(factor_vec, a = "Apple", .default = levels(factor_vec))
recode(factor_vec, c = "Apple", .default = levels(factor_vec))


CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% str #-----
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female") %>% str #-----
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% as.character %>% recode(`1` = "Male", `2` = "Female") %>% str #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% str #-----
#  Factor w/ 2 levels "1","2": 2 1 1 2 2 2 1 1 1 2 ...
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female") %>% str #-----
#  Factor w/ 2 levels "Male","Female": 2 1 1 2 2 2 1 1 1 2 ...
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% as.character %>% recode(`1` = "Male", `2` = "Female") %>% str #-----
#  chr [1:283798] "Female" "Male" "Male" "Female" "Female" "Female" "Male" "Male" "Male" "Female" "Male" "Male" "Female" "Male" "Female" "Female" "Male" "Male" "Female" "Female" "Female" "Female" "Female" "Male" "Male" "Male" ...

str(CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX == "2") #----
str((CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female")) == "Female") #----
# > str(CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX == "2") #----
#  logi [1:283798] TRUE FALSE FALSE TRUE TRUE TRUE ...
# > str((CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female")) == "Female") #----
#  logi [1:283798] TRUE FALSE FALSE TRUE TRUE TRUE ...


data.recode_SEX = function(dataset) {
    df = df %>% mutate(Female = SEX == "2")
    df = df %>% mutate(SEX = SEX %>% recode(`1` = "Male", `2` = "Female"))
    df 
}
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_recode_SEX %>% select(SEX, Female) %>% summary #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_recode_SEX %>% select(SEX, Female) %>% summary #-----
#      SEX           Female       
#  Male  :148042   Mode :logical  
#  Female:135756   FALSE:148042   
#                  TRUE :135756   
