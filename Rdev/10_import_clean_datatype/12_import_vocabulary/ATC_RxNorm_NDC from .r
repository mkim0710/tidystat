# ATC_RxNorm_NDC from .r

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# getwd() |> dput()
# # > getwd() |> dput()
# # "X:/mkim/Rproject"
# # .path4read = "//DON/marketscan_users/smacdonald/"
# # .path4write = "//DON/marketscan_users/mkim/"
# # .path4read = "/proj/marketscan_users/marketscan/mkim/"
# # .path4write = "/proj/marketscan_users/marketscan/mkim/"
# .path4read = "../data/"
# .path4write = "../data/"
.path4read = "ATC_RxNorm_NDC/"
.path4write = "ATC_RxNorm_NDC/"


## @ filenames = list.files(.path4read) %>% grep("csv$",. , value = T) ====  
filenames = list.files(.path4read) %>% grep("csv$",. , value = T) 
filenames |> dput()
# > filenames |> dput()
# c("CONCEPT.csv", "CONCEPT_ANCESTOR.csv", "CONCEPT_CLASS.csv", 
# "CONCEPT_RELATIONSHIP.csv", "CONCEPT_SYNONYM.csv", "DOMAIN.csv", 
# "DRUG_STRENGTH.csv", "RELATIONSHIP.csv", "VOCABULARY.csv")


filenames %>% map(function(i) {
    # .extension = ".csv"
    # filename = gsub(paste0(.extension, "$"), "", i)

    print("i")
    print(i)
    # .t0 = Sys.time()
    # print("t0")
    # print(t0)
    
    zip(
        paste0(.path4read, i, ".zip")
        , paste0(.path4read, i)
    )
    
    # rm(i)
    # gc()
    # print("Sys.time() - .t0")
    # print(Sys.time() - .t0)
    # Sys.time() - .t0
    # out
    i
}) %>% set_names(filenames)
# > filenames %>% map(function(i) {
# +     # .extension = ".csv"
# +     # filename = gsub(paste0(.extension, "$"), "", i)
# + 
# +     print("i")
# +     print(i)
# +     # .t0 = Sys.time()
# +     # print("t0")
# +     # print(t0)
# +     
# +     zip(
# +         paste0(.path4read, i, ".zip")
# +         , paste0(.path4read, i)
# +     )
# +     
# +     # rm(i)
# +     # gc()
# +     # print("Sys.time() - .t0")
# +     # print(Sys.time() - .t0)
# +     # Sys.time() - .t0
# +     # out
# +     i
# + }) %>% set_names(filenames)
# [1] "i"
# [1] "CONCEPT.csv"
#   adding: ATC_RxNorm_NDC/CONCEPT.csv (deflated 80%)
# [1] "i"
# [1] "CONCEPT_ANCESTOR.csv"
#   adding: ATC_RxNorm_NDC/CONCEPT_ANCESTOR.csv (deflated 72%)
# [1] "i"
# [1] "CONCEPT_CLASS.csv"
#   adding: ATC_RxNorm_NDC/CONCEPT_CLASS.csv (deflated 68%)
# [1] "i"
# [1] "CONCEPT_RELATIONSHIP.csv"
#   adding: ATC_RxNorm_NDC/CONCEPT_RELATIONSHIP.csv (deflated 82%)
# [1] "i"
# [1] "CONCEPT_SYNONYM.csv"
#   adding: ATC_RxNorm_NDC/CONCEPT_SYNONYM.csv (deflated 73%)
# [1] "i"
# [1] "DOMAIN.csv"
#   adding: ATC_RxNorm_NDC/DOMAIN.csv (deflated 63%)
# [1] "i"
# [1] "DRUG_STRENGTH.csv"
#   adding: ATC_RxNorm_NDC/DRUG_STRENGTH.csv (deflated 84%)
# [1] "i"
# [1] "RELATIONSHIP.csv"
#   adding: ATC_RxNorm_NDC/RELATIONSHIP.csv (deflated 77%)
# [1] "i"
# [1] "VOCABULARY.csv"
#   adding: ATC_RxNorm_NDC/VOCABULARY.csv (deflated 61%)
# $`CONCEPT.csv`
# [1] "CONCEPT.csv"
# 
# $CONCEPT_ANCESTOR.csv
# [1] "CONCEPT_ANCESTOR.csv"
# 
# $CONCEPT_CLASS.csv
# [1] "CONCEPT_CLASS.csv"
# 
# $CONCEPT_RELATIONSHIP.csv
# [1] "CONCEPT_RELATIONSHIP.csv"
# 
# $CONCEPT_SYNONYM.csv
# [1] "CONCEPT_SYNONYM.csv"
# 
# $DOMAIN.csv
# [1] "DOMAIN.csv"
# 
# $DRUG_STRENGTH.csv
# [1] "DRUG_STRENGTH.csv"
# 
# $RELATIONSHIP.csv
# [1] "RELATIONSHIP.csv"
# 
# $VOCABULARY.csv
# [1] "VOCABULARY.csv"



out.list = filenames %>% map(function(i) {
    .extension = ".csv"
    # i = gsub(".rds$", "", i)
    # i = gsub(".rda$", "", i)
    filename = gsub(paste0(.extension, "$"), "", i)
    print("filename")
    print(filename)
    # .t0 = Sys.time()
    # print("t0")
    # print(t0)

    # assign(
    #     filename
    #     , read_tsv(paste0(.path4read, filename, .extension))
    # )
    # saveRDS(eval(parse(text = filename)), paste0(.path4write, filename, ".rds"))

    out = read_tsv(paste0(.path4read, filename, .extension))
    saveRDS(out, paste0(.path4write, filename, ".rds"))

    
    # rm(filename)
    # gc()
    # print("Sys.time() - .t0")
    # print(Sys.time() - .t0)
    # Sys.time() - .t0
    out
}) %>% set_names(filenames)
out.list |> str(max.level = 1, give.attr = TRUE)
# > out.list = filenames %>% map(function(i) {
# +     .extension = ".csv"
# +     # i = gsub(".rds$", "", i)
# +     # i = gsub(".rda$", "", i)
# +     filename = gsub(paste0(.extension, "$"), "", i)
# +     print("filename")
# +     print(filename)
# +     # .t0 = Sys.time()
# +     # print("t0")
# +     # print(t0)
# + 
# +     # assign(
# +     #     filename
# +     #     , read_tsv(paste0(.path4read, filename, .extension))
# +     # )
# +     # saveRDS(eval(parse(text = filename)), paste0(.path4write, filename, ".rds"))
# + 
# +     out = read_tsv(paste0(.path4read, filename, .extension))
# +     saveRDS(out, paste0(.path4write, filename, ".rds"))
# + 
# +     
# +     # rm(filename)
# +     # gc()
# +     # print("Sys.time() - .t0")
# +     # print(Sys.time() - .t0)
# +     # Sys.time() - .t0
# +     out
# + }) %>% set_names(filenames)
# [1] "filename"
# [1] "CONCEPT"
# Parsed with column specification:
# cols(
#   concept_id = col_integer(),
#   concept_name = col_character(),
#   domain_id = col_character(),
#   vocabulary_id = col_character(),
#   concept_class_id = col_character(),
#   standard_concept = col_character(),
#   concept_code = col_character(),
#   valid_start_date = col_integer(),
#   valid_end_date = col_integer(),
#   invalid_reason = col_character()
# )
# [1] "filename"
# [1] "CONCEPT_ANCESTOR"
# Parsed with column specification:
# cols(
#   ancestor_concept_id = col_integer(),
#   descendant_concept_id = col_integer(),
#   min_levels_of_separation = col_integer(),
#   max_levels_of_separation = col_integer()
# )
# [1] "filename"
# [1] "CONCEPT_CLASS"
# Parsed with column specification:
# cols(
#   concept_class_id = col_character(),
#   concept_class_name = col_character(),
#   concept_class_concept_id = col_integer()
# )
# [1] "filename"
# [1] "CONCEPT_RELATIONSHIP"
# Parsed with column specification:
# cols(
#   concept_id_1 = col_integer(),
#   concept_id_2 = col_integer(),
#   relationship_id = col_character(),
#   valid_start_date = col_integer(),
#   valid_end_date = col_integer(),
#   invalid_reason = col_character()
# )
# |................................................................................| 100%  159 MB
# [1] "filename"
# [1] "CONCEPT_SYNONYM"
# Parsed with column specification:
# cols(
#   concept_id = col_integer(),
#   concept_synonym_name = col_character(),
#   language_concept_id = col_integer()
# )
# [1] "filename"
# [1] "DOMAIN"
# Parsed with column specification:
# cols(
#   domain_id = col_character(),
#   domain_name = col_character(),
#   domain_concept_id = col_integer()
# )
# [1] "filename"
# [1] "DRUG_STRENGTH"
# Parsed with column specification:
# cols(
#   drug_concept_id = col_integer(),
#   ingredient_concept_id = col_integer(),
#   amount_value = col_double(),
#   amount_unit_concept_id = col_integer(),
#   numerator_value = col_double(),
#   numerator_unit_concept_id = col_integer(),
#   denominator_value = col_character(),
#   denominator_unit_concept_id = col_integer(),
#   box_size = col_character(),
#   valid_start_date = col_integer(),
#   valid_end_date = col_integer(),
#   invalid_reason = col_character()
# )
# |................................................................................| 100%    9 MB
# [1] "filename"
# [1] "RELATIONSHIP"
# Parsed with column specification:
# cols(
#   relationship_id = col_character(),
#   relationship_name = col_character(),
#   is_hierarchical = col_integer(),
#   defines_ancestry = col_integer(),
#   reverse_relationship_id = col_character(),
#   relationship_concept_id = col_integer()
# )
# [1] "filename"
# [1] "VOCABULARY"
# Parsed with column specification:
# cols(
#   vocabulary_id = col_character(),
#   vocabulary_name = col_character(),
#   vocabulary_reference = col_character(),
#   vocabulary_version = col_character(),
#   vocabulary_concept_id = col_integer()
# )
# > out.list |> str(max.level = 1, give.attr = TRUE)
# List of 9
#  $ CONCEPT.csv             :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1132568 obs. of  10 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ CONCEPT_ANCESTOR.csv    :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1807275 obs. of  4 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ CONCEPT_CLASS.csv       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	327 obs. of  3 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ CONCEPT_RELATIONSHIP.csv:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	3388136 obs. of  6 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ CONCEPT_SYNONYM.csv     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1216731 obs. of  3 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ DOMAIN.csv              :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  3 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ DRUG_STRENGTH.csv       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	196806 obs. of  12 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ RELATIONSHIP.csv        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	478 obs. of  6 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"
#  $ VOCABULARY.csv          :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	27 obs. of  5 variables:
#   ..- attr(*, "spec")=List of 2
#   .. ..- attr(*, "class")= chr "col_spec"



## @ names(out.list) = names(out.list) %>% gsub(paste0(.extension, "$"), "", .) =====  
names(out.list) |> dput()
.extension = ".csv"
names(out.list) = names(out.list) %>% gsub(paste0(.extension, "$"), "", .)
names(out.list) |> dput()
# > names(out.list) |> dput()
# c("CONCEPT.csv", "CONCEPT_ANCESTOR.csv", "CONCEPT_CLASS.csv", 
# "CONCEPT_RELATIONSHIP.csv", "CONCEPT_SYNONYM.csv", "DOMAIN.csv", 
# "DRUG_STRENGTH.csv", "RELATIONSHIP.csv", "VOCABULARY.csv")
# > .extension = ".csv"
# > names(out.list) = names(out.list) %>% gsub(paste0(.extension, "$"), "", .)
# > names(out.list) |> dput()
# c("CONCEPT", "CONCEPT_ANCESTOR", "CONCEPT_CLASS", "CONCEPT_RELATIONSHIP", 
# "CONCEPT_SYNONYM", "DOMAIN", "DRUG_STRENGTH", "RELATIONSHIP", 
# "VOCABULARY")

saveRDS(out.list, "ATC_RxNorm_NDC.rds")
  
  
# __________|------  
# @@ END-----  
