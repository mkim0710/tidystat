# library(icd) icd_is_valid().r

icd10cm2016 %>% select(three_digit, sub_chapter) %>% distinct |> str()
# > icd10cm2016 %>% select(three_digit, sub_chapter) %>% distinct |> str()
# 'data.frame':	1910 obs. of  2 variables:
#  $ three_digit: Factor w/ 1903 levels "A00","A01","A02",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ sub_chapter: Factor w/ 279 levels "Intestinal Infectious Diseases",..: 1 1 1 1 1 1 1 1 1 1 ...


icd_is_valid("I109")
icd_is_valid("I10")
icd_is_valid("IJK10")
icd_is_valid("I1000")
icd_is_valid("I10009")
icd_is_valid("I10009p")
icd_is_valid("I10009999")
# > icd_is_valid("IJK10")
# [1] FALSE
# > icd_is_valid("I109")
# [1] TRUE
# > icd_is_valid("I10")
# [1] TRUE
# > icd_is_valid("IJK10")
# [1] FALSE
# > icd_is_valid("I1000")
# [1] TRUE
# > icd_is_valid("I10009")
# [1] TRUE
# > icd_is_valid("I10009p")
# [1] TRUE
# > icd_is_valid("I10009999")
# [1] FALSE

icd_is_valid
# > icd_is_valid
# function (...) 
# {
#     very_soft_deprecate("is_valid")
#     is_valid(...)
# }
# <bytecode: 0x00000001b73e8120>
# <environment: namespace:icd>
  
  
# __________|------  
# @@ END----  

