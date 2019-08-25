# function.str_split_subset.source.r


"a/b" %>% str_split("/") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match,"a") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match_all,"a") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match_all,"a") %>% map(unlist) %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"a") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"^(?!.*a)") %>% str #----
# > "a/b" %>% str_split("/") %>% str #----
# List of 1
#  $ : chr [1:2] "a" "b"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% str #----
# List of 4
#  $ : chr [1:2] "a" "b"
#  $ : chr [1:2] "c" "a"
#  $ : chr "b"
#  $ : chr "a"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match,"a") %>% str #----
# List of 4
#  $ : chr [1:2, 1] "a" NA
#  $ : chr [1:2, 1] NA "a"
#  $ : chr [1, 1] NA
#  $ : chr [1, 1] "a"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"a") %>% str #----
# List of 4
#  $ : chr "a"
#  $ : chr "a"
#  $ : chr(0) 
#  $ : chr "a"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"^(?!.*a)") %>% str #----
# List of 4
#  $ : chr "b"
#  $ : chr "c"
#  $ : chr "b"
#  $ : chr(0) 











#@ debugged v4 -----
tmp.df = 
    d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.metformin$concept_name.toupper %>% table %>% 
    sort(decreasing = T) %>% as.tibble %>% set_names(c("concept_name.toupper", "n")) %>% mutate(concept_name.toupper = concept_name.toupper %>% as.factor) %>% 
    # $is.combination
    mutate( is.combination = grepl("/", concept_name.toupper) ) %>%  
    # $BrandName
    mutate( BrandName = concept_name.toupper %>% str_extract_all("\\[.+\\]") %>% map_chr(paste0, collapse = ", ") %>% na_if("") ) %>% 
    mutate( concept_name.toupper.rm_BrandName = concept_name.toupper %>% gsub("\\[.+\\]", "", .) ) %>% 
    # $concept_name.toupper.METFORMIN
    mutate(concept_name.toupper.METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.METFORMIN, sep = "/") %>% 
    filter(grepl("METFORMIN", concept_name.toupper.METFORMIN)) %>% 
    # # $concept_name.toupper.rm_METFORMIN
    # mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
    # filter(!is.combination | {is.combination & !grepl("METFORMIN", concept_name.toupper.rm_METFORMIN)}) %>% 
    as.tibble
tmp.df %>% select(concept_name.toupper.rm_BrandName, is.combination) %>% mutate(duplicated = duplicated(concept_name.toupper.rm_BrandName)) %>% print(n=99)
tmp.df %>% select(concept_name.toupper.rm_BrandName, is.combination) %>% 
    # $concept_name.toupper.rm_METFORMIN
    mutate(concept_name.toupper.METFORMIN = 
               concept_name.toupper.rm_BrandName %>% str_split("/") %>% map(str_subset, "METFORMIN") %>% map_chr(paste, collapse = "|")
    ) %>% 
    mutate(duplicated = duplicated(concept_name.toupper.rm_BrandName)) %>% print(n=99)
tmp.df %>% select(concept_name.toupper.rm_BrandName, is.combination) %>% 
    # $concept_name.toupper.rm_METFORMIN
    mutate(concept_name.toupper.rm_METFORMIN = 
               concept_name.toupper.rm_BrandName %>% str_split("/") %>% map(str_subset, "^(?!.*METFORMIN).*$") %>% map_chr(paste, collapse = "|") %>% na_if("")
    ) %>% 
    mutate(duplicated = duplicated(concept_name.toupper.rm_BrandName)) %>% print(n=99)
# > #@ debugged v4 -----
# > tmp.df = 
# +     d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.metformin$concept_name.toupper %>% table %>% 
# +     sort(decreasing = T) %>% as.tibble %>% set_names(c("concept_name.toupper", "n")) %>% mutate(concept_name.toupper = concept_name.toupper %>% as.factor) %>% 
# +     # $is.combination
# +     mutate( is.combination = grepl("/", concept_name.toupper) ) %>%  
# +     # $BrandName
# +     mutate( BrandName = concept_name.toupper %>% str_extract_all("\\[.+\\]") %>% map_chr(paste0, collapse = ", ") %>% na_if("") ) %>% 
# +     mutate( concept_name.toupper.rm_BrandName = concept_name.toupper %>% gsub("\\[.+\\]", "", .) ) %>% 
# +     # $concept_name.toupper.METFORMIN
# +     mutate(concept_name.toupper.METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.METFORMIN, sep = "/") %>% 
# +     filter(grepl("METFORMIN", concept_name.toupper.METFORMIN)) %>% 
# +     # # $concept_name.toupper.rm_METFORMIN
# +     # mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
# +     # filter(!is.combination | {is.combination & !grepl("METFORMIN", concept_name.toupper.rm_METFORMIN)}) %>% 
# +     as.tibble
# > tmp.df %>% select(concept_name.toupper.rm_BrandName, is.combination) %>% mutate(duplicated = duplicated(concept_name.toupper.rm_BrandName)) %>% print(n=99)
# # A tibble: 49 x 3
#    concept_name.toupper.rm_BrandName                                                           is.combination duplicated
#    <chr>                                                                                       <lgl>          <lgl>     
#  1 METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                                                  FALSE          FALSE     
#  2 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET                           FALSE          FALSE     
#  3 METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET                                                 FALSE          FALSE     
#  4 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ORAL TABLET                           FALSE          FALSE     
#  5 METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET                                                  FALSE          FALSE     
#  6 "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET "               FALSE          FALSE     
#  7 "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLET "              FALSE          FALSE     
#  8 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLET                  FALSE          FALSE     
#  9 "METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 50 MG ORAL TABLET "                          TRUE           FALSE     
# 10 GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                                 TRUE           FALSE     
# 11 "METFORMIN HYDROCHLORIDE 500 MG / SITAGLIPTIN 50 MG ORAL TABLET "                           TRUE           FALSE     
# 12 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SAXAGLIPTIN 2.5 MG EXTENDED RELEASE ORAL TABLET "  TRUE           FALSE     
# 13 GLYBURIDE 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                               TRUE           FALSE     
# 14 "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLET "               FALSE          FALSE     
# 15 "24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET "                        FALSE          FALSE     
# 16 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET                   FALSE          FALSE     
# 17 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SAXAGLIPTIN 5 MG EXTENDED RELEASE ORAL TABLET "    TRUE           FALSE     
# 18 "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET "                FALSE          FALSE     
# 19 "METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "                                               FALSE          FALSE     
# 20 "METFORMIN HYDROCHLORIDE 850 MG / PIOGLITAZONE 15 MG ORAL TABLET "                          TRUE           FALSE     
# 21 "24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ORAL TABLET "                        FALSE          FALSE     
# 22 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 50 MG EXTENDED RELEASE ORAL TABLET "   TRUE           FALSE     
# 23 "METFORMIN HYDROCHLORIDE 500 MG / PIOGLITAZONE 15 MG ORAL TABLET "                          TRUE           FALSE     
# 24 "24 HR METFORMIN HYDROCHLORIDE 500 MG / SAXAGLIPTIN 5 MG EXTENDED RELEASE ORAL TABLET "     TRUE           FALSE     
# 25 "METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "                                               FALSE          FALSE     
# 26 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 100 MG EXTENDED RELEASE ORAL TABLET "  TRUE           FALSE     
# 27 METFORMIN HYDROCHLORIDE 500 MG / PIOGLITAZONE 15 MG ORAL TABLET                             TRUE           FALSE     
# 28 GLYBURIDE 1.25 MG / METFORMIN HYDROCHLORIDE 250 MG ORAL TABLET                              TRUE           FALSE     
# 29 GLIPIZIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                                 TRUE           FALSE     
# 30 "METFORMIN HYDROCHLORIDE 100 MG/ML ORAL SOLUTION "                                          TRUE           FALSE     
# 31 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                         TRUE           FALSE     
# 32 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / PIOGLITAZONE 15 MG EXTENDED RELEASE ORAL TABLET "  TRUE           FALSE     
# 33 METFORMIN HYDROCHLORIDE 850 MG / PIOGLITAZONE 15 MG ORAL TABLET                             TRUE           FALSE     
# 34 GLIPIZIDE 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                               TRUE           FALSE     
# 35 "24 HR METFORMIN HYDROCHLORIDE 500 MG / SITAGLIPTIN 50 MG EXTENDED RELEASE ORAL TABLET "    TRUE           FALSE     
# 36 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "                          TRUE           FALSE     
# 37 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE TABLET                                FALSE          FALSE     
# 38 "METFORMIN HYDROCHLORIDE 500 MG / ROSIGLITAZONE 2 MG ORAL TABLET "                          TRUE           FALSE     
# 39 "CANAGLIFLOZIN 50 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                        TRUE           FALSE     
# 40 "METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                                              FALSE          FALSE     
# 41 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "                          TRUE           FALSE     
# 42 METFORMIN HCL POWDER                                                                        FALSE          FALSE     
# 43 "METFORMIN HYDROCHLORIDE 1000 MG / ROSIGLITAZONE 4 MG ORAL TABLET "                         TRUE           FALSE     
# 44 "ALOGLIPTIN 12.5 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                         TRUE           FALSE     
# 45 "METFORMIN HYDROCHLORIDE 1000 MG / ROSIGLITAZONE 2 MG ORAL TABLET "                         TRUE           FALSE     
# 46 "METFORMIN HYDROCHLORIDE 500 MG / ROSIGLITAZONE 4 MG ORAL TABLET "                          TRUE           FALSE     
# 47 "24 HR DAPAGLIFLOZIN 10 MG / METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLET " TRUE           FALSE     
# 48 "CANAGLIFLOZIN 150 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                       TRUE           FALSE     
# 49 "GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "                              TRUE           FALSE     
# > tmp.df %>% select(concept_name.toupper.rm_BrandName, is.combination) %>% 
# +     # $concept_name.toupper.rm_METFORMIN
# +     mutate(concept_name.toupper.METFORMIN = 
# +                concept_name.toupper.rm_BrandName %>% str_split("/") %>% map(str_subset, "METFORMIN") %>% map_chr(paste, collapse = "|")
# +     ) %>% 
# +     mutate(duplicated = duplicated(concept_name.toupper.rm_BrandName)) %>% print(n=99)
# # A tibble: 49 x 4
#    concept_name.toupper.rm_BrandName                                is.combination concept_name.toupper.METFORMIN                          duplicated
#    <chr>                                                            <lgl>          <chr>                                                   <lgl>     
#  1 METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                       FALSE          METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET              FALSE     
#  2 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABL~ FALSE          24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ~ FALSE     
#  3 METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET                      FALSE          METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET             FALSE     
#  4 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ORAL TABL~ FALSE          24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ~ FALSE     
#  5 METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET                       FALSE          METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET              FALSE     
#  6 "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE~ FALSE          "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDE~ FALSE     
#  7 "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEAS~ FALSE          "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTEND~ FALSE     
#  8 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ~ FALSE          OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED~ FALSE     
#  9 "METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 50 MG ORAL TABLE~ TRUE           "METFORMIN HYDROCHLORIDE 1000 MG "                      FALSE     
# 10 GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET      TRUE           " METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET"           FALSE     
# 11 "METFORMIN HYDROCHLORIDE 500 MG / SITAGLIPTIN 50 MG ORAL TABLET~ TRUE           "METFORMIN HYDROCHLORIDE 500 MG "                       FALSE     
# 12 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SAXAGLIPTIN 2.5 MG EXT~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 1000 MG "                FALSE     
# 13 GLYBURIDE 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET    TRUE           " METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET"           FALSE     
# 14 "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE~ FALSE          "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDE~ FALSE     
# 15 "24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TAB~ FALSE          "24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE~ FALSE     
# 16 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE O~ FALSE          OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED ~ FALSE     
# 17 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SAXAGLIPTIN 5 MG EXTEN~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 1000 MG "                FALSE     
# 18 "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ~ FALSE          "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED~ FALSE     
# 19 "METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "                    FALSE          "METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "           FALSE     
# 20 "METFORMIN HYDROCHLORIDE 850 MG / PIOGLITAZONE 15 MG ORAL TABLE~ TRUE           "METFORMIN HYDROCHLORIDE 850 MG "                       FALSE     
# 21 "24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ORAL TAB~ FALSE          "24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE~ FALSE     
# 22 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 50 MG EXTE~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 1000 MG "                FALSE     
# 23 "METFORMIN HYDROCHLORIDE 500 MG / PIOGLITAZONE 15 MG ORAL TABLE~ TRUE           "METFORMIN HYDROCHLORIDE 500 MG "                       FALSE     
# 24 "24 HR METFORMIN HYDROCHLORIDE 500 MG / SAXAGLIPTIN 5 MG EXTEND~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 500 MG "                 FALSE     
# 25 "METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "                    FALSE          "METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "           FALSE     
# 26 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 100 MG EXT~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 1000 MG "                FALSE     
# 27 METFORMIN HYDROCHLORIDE 500 MG / PIOGLITAZONE 15 MG ORAL TABLET  TRUE           "METFORMIN HYDROCHLORIDE 500 MG "                       FALSE     
# 28 GLYBURIDE 1.25 MG / METFORMIN HYDROCHLORIDE 250 MG ORAL TABLET   TRUE           " METFORMIN HYDROCHLORIDE 250 MG ORAL TABLET"           FALSE     
# 29 GLIPIZIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET      TRUE           " METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET"           FALSE     
# 30 "METFORMIN HYDROCHLORIDE 100 MG/ML ORAL SOLUTION "               TRUE           METFORMIN HYDROCHLORIDE 100 MG                          FALSE     
# 31 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABL~ TRUE           " METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "         FALSE     
# 32 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / PIOGLITAZONE 15 MG EXT~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 1000 MG "                FALSE     
# 33 METFORMIN HYDROCHLORIDE 850 MG / PIOGLITAZONE 15 MG ORAL TABLET  TRUE           "METFORMIN HYDROCHLORIDE 850 MG "                       FALSE     
# 34 GLIPIZIDE 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET    TRUE           " METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET"           FALSE     
# 35 "24 HR METFORMIN HYDROCHLORIDE 500 MG / SITAGLIPTIN 50 MG EXTEN~ TRUE           "24 HR METFORMIN HYDROCHLORIDE 500 MG "                 FALSE     
# 36 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLE~ TRUE           " METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "          FALSE     
# 37 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE TABLET     FALSE          24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ~ FALSE     
# 38 "METFORMIN HYDROCHLORIDE 500 MG / ROSIGLITAZONE 2 MG ORAL TABLE~ TRUE           "METFORMIN HYDROCHLORIDE 500 MG "                       FALSE     
# 39 "CANAGLIFLOZIN 50 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TAB~ TRUE           " METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "         FALSE     
# 40 "METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                   FALSE          "METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "          FALSE     
# 41 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 850 MG ORAL TABLE~ TRUE           " METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "          FALSE     
# 42 METFORMIN HCL POWDER                                             FALSE          METFORMIN HCL POWDER                                    FALSE     
# 43 "METFORMIN HYDROCHLORIDE 1000 MG / ROSIGLITAZONE 4 MG ORAL TABL~ TRUE           "METFORMIN HYDROCHLORIDE 1000 MG "                      FALSE     
# 44 "ALOGLIPTIN 12.5 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABL~ TRUE           " METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "         FALSE     
# 45 "METFORMIN HYDROCHLORIDE 1000 MG / ROSIGLITAZONE 2 MG ORAL TABL~ TRUE           "METFORMIN HYDROCHLORIDE 1000 MG "                      FALSE     
# 46 "METFORMIN HYDROCHLORIDE 500 MG / ROSIGLITAZONE 4 MG ORAL TABLE~ TRUE           "METFORMIN HYDROCHLORIDE 500 MG "                       FALSE     
# 47 "24 HR DAPAGLIFLOZIN 10 MG / METFORMIN HYDROCHLORIDE 1000 MG EX~ TRUE           " METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORA~ FALSE     
# 48 "CANAGLIFLOZIN 150 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TA~ TRUE           " METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "         FALSE     
# 49 "GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "   TRUE           " METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "          FALSE     
# > tmp.df %>% select(concept_name.toupper.rm_BrandName, is.combination) %>% 
# +     # $concept_name.toupper.rm_METFORMIN
# +     mutate(concept_name.toupper.rm_METFORMIN = 
# +                concept_name.toupper.rm_BrandName %>% str_split("/") %>% map(str_subset, "^(?!.*METFORMIN).*$") %>% map_chr(paste, collapse = "|") %>% na_if("")
# +     ) %>% 
# +     mutate(duplicated = duplicated(concept_name.toupper.rm_BrandName)) %>% print(n=99)
# # A tibble: 49 x 4
#    concept_name.toupper.rm_BrandName                                            is.combination concept_name.toupper.rm_METFORMIN           duplicated
#    <chr>                                                                        <lgl>          <chr>                                       <lgl>     
#  1 METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                                   FALSE          NA                                          FALSE     
#  2 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET            FALSE          NA                                          FALSE     
#  3 METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET                                  FALSE          NA                                          FALSE     
#  4 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ORAL TABLET            FALSE          NA                                          FALSE     
#  5 METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET                                   FALSE          NA                                          FALSE     
#  6 "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET~ FALSE          NA                                          FALSE     
#  7 "MODIFIED 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLE~ FALSE          NA                                          FALSE     
#  8 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLET   FALSE          NA                                          FALSE     
#  9 "METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 50 MG ORAL TABLET "           TRUE           " SITAGLIPTIN 50 MG ORAL TABLET "           FALSE     
# 10 GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                  TRUE           "GLYBURIDE 5 MG "                           FALSE     
# 11 "METFORMIN HYDROCHLORIDE 500 MG / SITAGLIPTIN 50 MG ORAL TABLET "            TRUE           " SITAGLIPTIN 50 MG ORAL TABLET "           FALSE     
# 12 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SAXAGLIPTIN 2.5 MG EXTENDED RELEAS~ TRUE           " SAXAGLIPTIN 2.5 MG EXTENDED RELEASE ORAL~ FALSE     
# 13 GLYBURIDE 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                TRUE           "GLYBURIDE 2.5 MG "                         FALSE     
# 14 "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEASE ORAL TABLET~ FALSE          NA                                          FALSE     
# 15 "24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET "         FALSE          NA                                          FALSE     
# 16 OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET    FALSE          NA                                          FALSE     
# 17 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SAXAGLIPTIN 5 MG EXTENDED RELEASE ~ TRUE           " SAXAGLIPTIN 5 MG EXTENDED RELEASE ORAL T~ FALSE     
# 18 "OSMOTIC 24 HR METFORMIN HYDROCHLORIDE 500 MG EXTENDED RELEASE ORAL TABLET " FALSE          NA                                          FALSE     
# 19 "METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "                                FALSE          NA                                          FALSE     
# 20 "METFORMIN HYDROCHLORIDE 850 MG / PIOGLITAZONE 15 MG ORAL TABLET "           TRUE           " PIOGLITAZONE 15 MG ORAL TABLET "          FALSE     
# 21 "24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE ORAL TABLET "         FALSE          NA                                          FALSE     
# 22 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 50 MG EXTENDED RELEASE~ TRUE           " SITAGLIPTIN 50 MG EXTENDED RELEASE ORAL ~ FALSE     
# 23 "METFORMIN HYDROCHLORIDE 500 MG / PIOGLITAZONE 15 MG ORAL TABLET "           TRUE           " PIOGLITAZONE 15 MG ORAL TABLET "          FALSE     
# 24 "24 HR METFORMIN HYDROCHLORIDE 500 MG / SAXAGLIPTIN 5 MG EXTENDED RELEASE O~ TRUE           " SAXAGLIPTIN 5 MG EXTENDED RELEASE ORAL T~ FALSE     
# 25 "METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "                                FALSE          NA                                          FALSE     
# 26 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / SITAGLIPTIN 100 MG EXTENDED RELEAS~ TRUE           " SITAGLIPTIN 100 MG EXTENDED RELEASE ORAL~ FALSE     
# 27 METFORMIN HYDROCHLORIDE 500 MG / PIOGLITAZONE 15 MG ORAL TABLET              TRUE           " PIOGLITAZONE 15 MG ORAL TABLET"           FALSE     
# 28 GLYBURIDE 1.25 MG / METFORMIN HYDROCHLORIDE 250 MG ORAL TABLET               TRUE           "GLYBURIDE 1.25 MG "                        FALSE     
# 29 GLIPIZIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                  TRUE           "GLIPIZIDE 5 MG "                           FALSE     
# 30 "METFORMIN HYDROCHLORIDE 100 MG/ML ORAL SOLUTION "                           TRUE           "ML ORAL SOLUTION "                         FALSE     
# 31 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "          TRUE           "LINAGLIPTIN 2.5 MG "                       FALSE     
# 32 "24 HR METFORMIN HYDROCHLORIDE 1000 MG / PIOGLITAZONE 15 MG EXTENDED RELEAS~ TRUE           " PIOGLITAZONE 15 MG EXTENDED RELEASE ORAL~ FALSE     
# 33 METFORMIN HYDROCHLORIDE 850 MG / PIOGLITAZONE 15 MG ORAL TABLET              TRUE           " PIOGLITAZONE 15 MG ORAL TABLET"           FALSE     
# 34 GLIPIZIDE 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET                TRUE           "GLIPIZIDE 2.5 MG "                         FALSE     
# 35 "24 HR METFORMIN HYDROCHLORIDE 500 MG / SITAGLIPTIN 50 MG EXTENDED RELEASE ~ TRUE           " SITAGLIPTIN 50 MG EXTENDED RELEASE ORAL ~ FALSE     
# 36 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "           TRUE           "LINAGLIPTIN 2.5 MG "                       FALSE     
# 37 24 HR METFORMIN HYDROCHLORIDE 750 MG EXTENDED RELEASE TABLET                 FALSE          NA                                          FALSE     
# 38 "METFORMIN HYDROCHLORIDE 500 MG / ROSIGLITAZONE 2 MG ORAL TABLET "           TRUE           " ROSIGLITAZONE 2 MG ORAL TABLET "          FALSE     
# 39 "CANAGLIFLOZIN 50 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "         TRUE           "CANAGLIFLOZIN 50 MG "                      FALSE     
# 40 "METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "                               FALSE          NA                                          FALSE     
# 41 "LINAGLIPTIN 2.5 MG / METFORMIN HYDROCHLORIDE 850 MG ORAL TABLET "           TRUE           "LINAGLIPTIN 2.5 MG "                       FALSE     
# 42 METFORMIN HCL POWDER                                                         FALSE          NA                                          FALSE     
# 43 "METFORMIN HYDROCHLORIDE 1000 MG / ROSIGLITAZONE 4 MG ORAL TABLET "          TRUE           " ROSIGLITAZONE 4 MG ORAL TABLET "          FALSE     
# 44 "ALOGLIPTIN 12.5 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "          TRUE           "ALOGLIPTIN 12.5 MG "                       FALSE     
# 45 "METFORMIN HYDROCHLORIDE 1000 MG / ROSIGLITAZONE 2 MG ORAL TABLET "          TRUE           " ROSIGLITAZONE 2 MG ORAL TABLET "          FALSE     
# 46 "METFORMIN HYDROCHLORIDE 500 MG / ROSIGLITAZONE 4 MG ORAL TABLET "           TRUE           " ROSIGLITAZONE 4 MG ORAL TABLET "          FALSE     
# 47 "24 HR DAPAGLIFLOZIN 10 MG / METFORMIN HYDROCHLORIDE 1000 MG EXTENDED RELEA~ TRUE           "24 HR DAPAGLIFLOZIN 10 MG "                FALSE     
# 48 "CANAGLIFLOZIN 150 MG / METFORMIN HYDROCHLORIDE 1000 MG ORAL TABLET "        TRUE           "CANAGLIFLOZIN 150 MG "                     FALSE     
# 49 "GLYBURIDE 5 MG / METFORMIN HYDROCHLORIDE 500 MG ORAL TABLET "               TRUE           "GLYBURIDE 5 MG "                           FALSE 













#@ end ----
