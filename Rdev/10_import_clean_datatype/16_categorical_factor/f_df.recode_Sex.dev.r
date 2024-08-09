# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.recode_Sex.dev.r
# @ function.df_recode_SEX ======  
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% select(SEX) |> summary() #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% select(SEX) |> summary() #-----  
#  SEX       
#  1:148042  
#  2:135756 

# ?dplyr::recode
factor_vec <- factor(c("a", "b", "c"))
recode(factor_vec, a = "Apple", .default = levels(factor_vec))
recode(factor_vec, c = "Apple", .default = levels(factor_vec))

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX |> str() #-----
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female") |> str() #-----
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX |> as.character() %>% recode(`1` = "Male", `2` = "Female") |> str() #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX |> str() #-----  
#  Factor w/ 2 levels "1","2": 2 1 1 2 2 2 1 1 1 2 ...
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female") |> str() #-----  
#  Factor w/ 2 levels "Male","Female": 2 1 1 2 2 2 1 1 1 2 ...
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX |> as.character() %>% recode(`1` = "Male", `2` = "Female") |> str() #-----  
#  chr [1:283798] "Female" "Male" "Male" "Female" "Female" "Female" "Male" "Male" "Male" "Female" "Male" "Male" "Female" "Male" "Female" "Female" "Male" "Male" "Female" "Female" "Female" "Female" "Female" "Male" "Male" "Male" ...

str(CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX == "2") #----
str((CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female")) == "Female") #----
# > str(CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX == "2") #----  
#  logi [1:283798] TRUE FALSE FALSE TRUE TRUE TRUE ...
# > str((CohortGJ0910.BaselineJKGJ2085NoHx.drop_na$SEX %>% recode(`1` = "Male", `2` = "Female")) == "Female") #----  
#  logi [1:283798] TRUE FALSE FALSE TRUE TRUE TRUE ...

library(dplyr)
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.recode_Sex.dev.r
f_df.recode_Sex <- function(dataset, varname4Sex = "SEX", value4Female = "2") {
    dataset %>%
      mutate(
        Female = if_else(get(varname4Sex) == value4Female, 1, 0),
        Sex = as.factor(if_else(get(varname4Sex) == value4Female, "Female", "Male"))
      )
}

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_recode_SEX %>% select(Sex, Female) |> summary() #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_recode_SEX %>% select(Sex, Female) |> summary() #-----  
#      Sex           Female       
#  Male  :148042   Mode :logical  
#  Female:135756   FALSE:148042   
#                  TRUE :135756   
