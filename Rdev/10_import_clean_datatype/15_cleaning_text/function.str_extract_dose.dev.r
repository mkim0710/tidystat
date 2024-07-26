# function.str_extract_dose.dev.r



#@ =====
tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
    concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN |> str_extract_all("[0-9]+ ?MG") %>% gsub(" ?MG", "", .)
)
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
# +     concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN |> str_extract_all("[0-9]+ ?MG") %>% gsub(" ?MG", "", .)
# + )
# # A tibble: 49 x 8
#    concept_name.toupper                           n is.combination BrandName  concept_name.toupper.rm_BrandName      concept_name.toupper.METFORMIN         concept_name.toupper.~ concept_name.toupper.~
#    <fct>                                      <int> <lgl>          <chr>      <chr>                                  <chr>                                  <chr>                  <chr>                 
#  1 METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET 68757 FALSE          NA         METFORMIN HYDROCHLORIDE 500 MG ORAL T~ METFORMIN HYDROCHLORIDE 500 MG ORAL T~ NA                     500                   
#  2 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTE~ 44001 FALSE          NA         24 HR METFORMIN HYDROCHLORIDE 500 MG ~ 24 HR METFORMIN HYDROCHLORIDE 500 MG ~ NA                     500                   
#  3 METFORMIN HYDROCHLORIDE 1000 MG ORAL TABL~ 15995 FALSE          NA         METFORMIN HYDROCHLORIDE 1000 MG ORAL ~ METFORMIN HYDROCHLORIDE 1000 MG ORAL ~ NA                     1000                  
#  4 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTE~ 13134 FALSE          NA         24 HR METFORMIN HYDROCHLORIDE 750 MG ~ 24 HR METFORMIN HYDROCHLORIDE 750 MG ~ NA                     750                   
#  5 METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET  6790 FALSE          NA         METFORMIN HYDROCHLORIDE 850 MG ORAL T~ METFORMIN HYDROCHLORIDE 850 MG ORAL T~ NA                     850                   
#  6 MODIFIED 24 HR METFORMIN HYDROCHLORIDE 50~  2126 FALSE          [GLUMETZA] "MODIFIED 24 HR METFORMIN HYDROCHLORI~ "MODIFIED 24 HR METFORMIN HYDROCHLORI~ NA                     500                   
#  7 MODIFIED 24 HR METFORMIN HYDROCHLORIDE 10~  1808 FALSE          [GLUMETZA] "MODIFIED 24 HR METFORMIN HYDROCHLORI~ "MODIFIED 24 HR METFORMIN HYDROCHLORI~ NA                     1000                  
#  8 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 100~  1290 FALSE          NA         OSMOTIC 24 HR METFORMIN HYDROCHLORIDE~ OSMOTIC 24 HR METFORMIN HYDROCHLORIDE~ NA                     1000                  
#  9 METFORMIN HYDROCHLORIDE 1000 MG / SITAGLI~  1035 TRUE           [JANUMET]  "METFORMIN HYDROCHLORIDE 1000 MG / SI~ "METFORMIN HYDROCHLORIDE 1000 MG "     " SITAGLIPTIN 50 MG O~ 1000                  
# 10 GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE ~   434 TRUE           NA         GLYBURIDE 5 MG / METFORMIN HYDROCHLOR~ " METFORMIN HYDROCHLORIDE 500 MG ORAL~ "GLYBURIDE 5 MG "      500                   
# # ... with 39 more rows


# ?str_extract_all

"a" |> str_extract_all("[0-9]+")
"a" |> str_extract_all("[0-9]+") |> str_extract_all("[0-9]+")
NA |> str_extract_all("[0-9]+")
"a" |> str_extract_all("[0-9]+") |> unlist() %>% {if(length(.)==0) as.character(NA) else .} |> str_extract_all("[0-9]+")
# > "a" |> str_extract_all("[0-9]+")
# [[1]]
# character(0)
# 
# > "a" |> str_extract_all("[0-9]+") |> str_extract_all("[0-9]+")
# [[1]]
# [1] "0"
# 
# Warning message:
# In stri_extract_all_regex(string, pattern, simplify = simplify,  :
#   argument is not an atomic vector; coercing
# > NA |> str_extract_all("[0-9]+")
# [[1]]
# [1] NA


#@ caution) if there is character(0), you should not unlist~!----

tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
    str_extract_all("[0-9]+ ?MG") %>% 
    dput
tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
    str_extract_all("[0-9]+ ?MG") %>% 
    unlist %>% 
    dput
tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
    str_extract_all("[0-9]+ ?MG") %>% 
    map_chr(function(txt) txt) %>% 
    dput
tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
    str_extract_all("[0-9]+ ?MG") %>% 
    map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
    dput
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
# +     str_extract_all("[0-9]+ ?MG") %>% 
# +     dput
# list("500 MG", "500 MG", "1000 MG", "750 MG", "850 MG", "500 MG", 
#     "1000 MG", "1000 MG", "1000 MG", "500 MG", "500 MG", "1000 MG", 
#     "500 MG", "1000 MG", "500 MG", "500 MG", "1000 MG", "500 MG", 
#     "500 MG", "850 MG", "750 MG", "1000 MG", "500 MG", "500 MG", 
#     "850 MG", "1000 MG", "500 MG", "250 MG", "500 MG", "100 MG", 
#     "1000 MG", "1000 MG", "850 MG", "500 MG", "500 MG", "500 MG", 
#     "750 MG", "500 MG", "1000 MG", "1000 MG", "850 MG", character(0), 
#     "1000 MG", "1000 MG", "1000 MG", "500 MG", "1000 MG", "1000 MG", 
#     "500 MG")
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
# +     str_extract_all("[0-9]+ ?MG") %>% 
# +     unlist %>% 
# +     dput
# c("500 MG", "500 MG", "1000 MG", "750 MG", "850 MG", "500 MG", 
# "1000 MG", "1000 MG", "1000 MG", "500 MG", "500 MG", "1000 MG", 
# "500 MG", "1000 MG", "500 MG", "500 MG", "1000 MG", "500 MG", 
# "500 MG", "850 MG", "750 MG", "1000 MG", "500 MG", "500 MG", 
# "850 MG", "1000 MG", "500 MG", "250 MG", "500 MG", "100 MG", 
# "1000 MG", "1000 MG", "850 MG", "500 MG", "500 MG", "500 MG", 
# "750 MG", "500 MG", "1000 MG", "1000 MG", "850 MG", "1000 MG", 
# "1000 MG", "1000 MG", "500 MG", "1000 MG", "1000 MG", "500 MG"
# )
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
# +     str_extract_all("[0-9]+ ?MG") %>% 
# +     map_chr(function(txt) txt) %>% 
# +     dput
# Error: Result 42 must be a single string, not a character vector of length 0
# Call `rlang::last_error()` to see a backtrace
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin$concept_name.toupper.METFORMIN %>% 
# +     str_extract_all("[0-9]+ ?MG") %>% 
# +     map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
# +     dput
# c("500 MG", "500 MG", "1000 MG", "750 MG", "850 MG", "500 MG", 
# "1000 MG", "1000 MG", "1000 MG", "500 MG", "500 MG", "1000 MG", 
# "500 MG", "1000 MG", "500 MG", "500 MG", "1000 MG", "500 MG", 
# "500 MG", "850 MG", "750 MG", "1000 MG", "500 MG", "500 MG", 
# "850 MG", "1000 MG", "500 MG", "250 MG", "500 MG", "100 MG", 
# "1000 MG", "1000 MG", "850 MG", "500 MG", "500 MG", "500 MG", 
# "750 MG", "500 MG", "1000 MG", "1000 MG", "850 MG", NA, "1000 MG", 
# "1000 MG", "1000 MG", "500 MG", "1000 MG", "1000 MG", "500 MG"
# )




tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
    concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN %>% 
        str_extract_all("[0-9]+ ?MG") %>% map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
        str_extract_all("[0-9]+") %>% as.numeric
) %>% {.$concept_name.toupper.METFORMIN.dose} %>% as.factor |> summary() #----
tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
    concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN %>% 
        str_extract_all("[0-9]+ ?MG") %>% map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
        str_extract_all("[0-9]+") %>% as.numeric
) %>% dplyr::filter(concept_name.toupper.METFORMIN.dose < 500) %>% unnest #----
tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
    concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN %>% 
        str_extract_all("[0-9]+ ?MG") %>% map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
        str_extract_all("[0-9]+") %>% as.numeric
) %>% dplyr::filter(is.na(concept_name.toupper.METFORMIN.dose)) #----
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
# +     concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN %>% 
# +         str_extract_all("[0-9]+ ?MG") %>% map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
# +         str_extract_all("[0-9]+") %>% as.numeric
# + ) %>% {.$concept_name.toupper.METFORMIN.dose} %>% as.factor |> summary() #----
#  100  250  500  750  850 1000 NA's 
#    1    1   20    3    5   18    1 
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
# +     concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN %>% 
# +         str_extract_all("[0-9]+ ?MG") %>% map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
# +         str_extract_all("[0-9]+") %>% as.numeric
# + ) %>% dplyr::filter(concept_name.toupper.METFORMIN.dose < 500) %>% unnest #----
# # A tibble: 2 x 8
#   concept_name.toupper                       n is.combination BrandName concept_name.toupper.rm_BrandName      concept_name.toupper.METFORM~ concept_name.toupper.r~ concept_name.toupper.ME~
#   <fct>                                  <int> <lgl>          <chr>     <chr>                                  <chr>                         <chr>                                      <dbl>
# 1 GLYBURIDE 1.25 MG / METFORMIN HYDROCH~    43 TRUE           NA        GLYBURIDE 1.25 MG / METFORMIN HYDROCH~ " METFORMIN HYDROCHLORIDE 25~ "GLYBURIDE 1.25 MG "                         250
# 2 METFORMIN HYDROCHLORIDE 100 MG/ML ORA~    41 TRUE           [RIOMET]  "METFORMIN HYDROCHLORIDE 100 MG/ML OR~ METFORMIN HYDROCHLORIDE 100 ~ "ML ORAL SOLUTION "                          100
# > tbl.concept_name.toupper.CONCEPT_NDC_metformin %>% mutate(
# +     concept_name.toupper.METFORMIN.dose = concept_name.toupper.METFORMIN %>% 
# +         str_extract_all("[0-9]+ ?MG") %>% map_chr(function(txt) txt %>% {if(length(.)==0) as.character(NA) else .} ) %>% 
# +         str_extract_all("[0-9]+") %>% as.numeric
# + ) %>% dplyr::filter(is.na(concept_name.toupper.METFORMIN.dose)) #----
# # A tibble: 1 x 8
#   concept_name.toupper     n is.combination BrandName concept_name.toupper.rm_BrandName concept_name.toupper.METFORMIN concept_name.toupper.rm_METFORMIN concept_name.toupper.METFORMIN.dose
#   <fct>                <int> <lgl>          <chr>     <chr>                             <chr>                          <chr>                                                           <dbl>
# 1 METFORMIN HCL POWDER     4 FALSE          NA        METFORMIN HCL POWDER              METFORMIN HCL POWDER           NA                                                                 NA

