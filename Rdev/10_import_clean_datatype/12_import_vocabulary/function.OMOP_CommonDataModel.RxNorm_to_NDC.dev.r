# function.OMOP_CommonDataModel.RxNorm_to_NDC.dev.r


library(tidyverse)
ATC_RxNorm_NDC = readRDS("ATC_RxNorm_NDC.rds")
ATC_RxNorm_NDC |> str(max.level = 1) #-----
ATC_RxNorm_NDC |> str() #-----
# > ATC_RxNorm_NDC |> str(max.level = 1) #-----
# List of 9
#  $ CONCEPT             :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1132568 obs. of  10 variables:
#  $ CONCEPT_ANCESTOR    :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1807275 obs. of  4 variables:
#  $ CONCEPT_CLASS       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	327 obs. of  3 variables:
#  $ CONCEPT_RELATIONSHIP:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	3388136 obs. of  6 variables:
#  $ CONCEPT_SYNONYM     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1216731 obs. of  3 variables:
#  $ DOMAIN              :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  3 variables:
#  $ DRUG_STRENGTH       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	196806 obs. of  12 variables:
#  $ RELATIONSHIP        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	478 obs. of  6 variables:
#  $ VOCABULARY          :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	27 obs. of  5 variables:
# > ATC_RxNorm_NDC |> str() #-----
# List of 9
#  $ CONCEPT             :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1132568 obs. of  10 variables:
#   ..$ concept_id      : int [1:1132568] 0 21604228 21604186 21604092 40254475 21605302 21605290 21605288 40256693 40256481 ...
#   ..$ concept_name    : chr [1:1132568] "No matching concept" "Amides" "Halogenated hydrocarbons" "Carbamic acid esters" ...
#   ..$ domain_id       : chr [1:1132568] "Metadata" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:1132568] "None" "ATC" "ATC" "ATC" ...
#   ..$ concept_class_id: chr [1:1132568] "Undefined" "ATC 4th" "ATC 4th" "ATC 4th" ...
#   ..$ standard_concept: chr [1:1132568] NA "C" "C" "C" ...
#   ..$ concept_code    : chr [1:1132568] "No matching concept" "N01BB" "N01AB" "M03BA" ...
#   ..$ valid_start_date: int [1:1132568] 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 ...
#   ..$ valid_end_date  : int [1:1132568] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:1132568] NA NA NA NA ...
#  $ CONCEPT_ANCESTOR    :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1807275 obs. of  4 variables:
#   ..$ ancestor_concept_id     : int [1:1807275] 724394 719311 719311 724394 529118 727835 712757 700399 724394 719311 ...
#   ..$ descendant_concept_id   : int [1:1807275] 40071173 719379 19112714 40223005 42800805 36218990 40009148 19079743 40223006 44817821 ...
#   ..$ min_levels_of_separation: int [1:1807275] 1 2 1 2 1 1 1 1 1 1 ...
#   ..$ max_levels_of_separation: int [1:1807275] 2 3 1 3 1 1 2 1 1 1 ...
#  $ CONCEPT_CLASS       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	327 obs. of  3 variables:
#   ..$ concept_class_id        : chr [1:327] "Qualifier Value" "Quality Metric" "Race" "Read" ...
#   ..$ concept_class_name      : chr [1:327] "Qualifier Value" "Quality Metric" "Race" "Read" ...
#   ..$ concept_class_concept_id: int [1:327] 44819021 44819092 44819030 44819273 44818999 44819274 44819176 44819075 44819178 44819060 ...
#  $ CONCEPT_RELATIONSHIP:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	3388136 obs. of  6 variables:
#   ..$ concept_id_1    : int [1:3388136] 40177157 19117294 40223978 40062778 19109625 1387757 19043707 40233860 40113171 40092416 ...
#   ..$ concept_id_2    : int [1:3388136] 19126920 19025353 40063812 19082573 19106567 19082170 19135866 19082228 19082103 19082103 ...
#   ..$ relationship_id : chr [1:3388136] "RxNorm has dose form" "Constitutes" "Concept replaces" "RxNorm has dose form" ...
#   ..$ valid_start_date: int [1:3388136] 20100607 20050916 20121001 20050404 20050404 20080602 20050404 20110207 20050916 20050404 ...
#   ..$ valid_end_date  : int [1:3388136] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:3388136] NA NA NA NA ...
#  $ CONCEPT_SYNONYM     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1216731 obs. of  3 variables:
#   ..$ concept_id          : int [1:1216731] 19060549 19060750 19061497 19061785 19062416 19062639 19062779 19063354 19063899 19064588 ...
#   ..$ concept_synonym_name: chr [1:1216731] "Decaject-L.A." "Degest 2" "5 Benzagel" "Diabetic Tuss DM" ...
#   ..$ language_concept_id : int [1:1216731] 4180186 4180186 4180186 4180186 4180186 4180186 4180186 4180186 4180186 4180186 ...
#  $ DOMAIN              :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  3 variables:
#   ..$ domain_id        : chr [1:40] "Cost" "Condition/Device" "Gender" "Race" ...
#   ..$ domain_name      : chr [1:40] "Cost" "Condition/Device" "Gender" "Race" ...
#   ..$ domain_concept_id: int [1:40] 581456 235 2 3 4 7 8 10 12 13 ...
#  $ DRUG_STRENGTH       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	196806 obs. of  12 variables:
#   ..$ drug_concept_id            : int [1:196806] 40225700 40224876 40224894 40224163 40224798 40224795 40224794 40224334 40224343 40224361 ...
#   ..$ ingredient_concept_id      : int [1:196806] 40172900 738156 738156 40224159 1500211 1500211 1500211 945286 945286 945286 ...
#   ..$ amount_value               : num [1:196806] NA 10 150 NA 10 10 10 NA NA NA ...
#   ..$ amount_unit_concept_id     : int [1:196806] NA 8576 8576 NA 8576 8576 8576 NA NA NA ...
#   ..$ numerator_value            : num [1:196806] 50 NA NA 2.5 NA NA NA 10 100 20 ...
#   ..$ numerator_unit_concept_id  : int [1:196806] 8576 NA NA 8576 NA NA NA 8576 8576 8576 ...
#   ..$ denominator_value          : chr [1:196806] NA NA NA NA ...
#   ..$ denominator_unit_concept_id: int [1:196806] 8587 NA NA 8587 NA NA NA 8587 8587 8587 ...
#   ..$ box_size                   : chr [1:196806] NA NA NA NA ...
#   ..$ valid_start_date           : int [1:196806] 20100228 19700101 19700101 20100905 19700101 19700101 19700101 19700101 19700101 19700101 ...
#   ..$ valid_end_date             : int [1:196806] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason             : chr [1:196806] NA NA NA NA ...
#  $ RELATIONSHIP        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	478 obs. of  6 variables:
#   ..$ relationship_id        : chr [1:478] "Has time aspect" "Has specimen proc" "Has specimen source" "Has specimen morph" ...
#   ..$ relationship_name      : chr [1:478] "Has time aspect (SNOMED)" "Has specimen procedure (SNOMED)" "Has specimen source identity (SNOMED)" "Has specimen source morphology (SNOMED)" ...
#   ..$ is_hierarchical        : int [1:478] 0 0 0 0 0 0 0 0 0 0 ...
#   ..$ defines_ancestry       : int [1:478] 0 0 0 0 0 0 0 0 0 0 ...
#   ..$ reverse_relationship_id: chr [1:478] "Time aspect of" "Specimen proc of" "Specimen identity of" "Specimen morph of" ...
#   ..$ relationship_concept_id: int [1:478] 44818774 44818775 44818776 44818777 44818778 44818779 44818780 44818781 44818782 44818783 ...
#  $ VOCABULARY          :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	27 obs. of  5 variables:
#   ..$ vocabulary_id        : chr [1:27] "ATC" "RxNorm" "Obs Period Type" "Visit Type" ...
#   ..$ vocabulary_name      : chr [1:27] "WHO Anatomic Therapeutic Chemical Classification" "RxNorm (NLM)" "OMOP Observation Period Type" "OMOP Visit Type" ...
#   ..$ vocabulary_reference : chr [1:27] "FDB UK distribution package" "http://www.nlm.nih.gov/research/umls/rxnorm/docs/rxnormfiles.html" "OMOP generated" "OMOP generated" ...
#   ..$ vocabulary_version   : chr [1:27] "RXNORM 2018-08-12" "RXNORM 2018-08-12" NA NA ...
#   ..$ vocabulary_concept_id: int [1:27] 44819117 44819104 44819149 44819150 44819151 44819152 44819235 44819232 44819233 44819129 ...



function.OMOP_CommonDataModel.RxNorm_to_NDC = function(text4grepl.RxNorm = "clomiphene", OMOP_CommonDataModel = ATC_RxNorm_NDC) {
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_vocabulary/function.OMOP_CommonDataModel.RxNorm_to_NDC.dev.r
    
    #@ output.list =====
    output.list = list()
        
    #@ output.list$Step11.CONCEPT.filter_RxNorm ======
    output.list$Step11.CONCEPT.filter_RxNorm =
        OMOP_CommonDataModel$CONCEPT %>% 
    filter(grepl(
        toupper(text4grepl.RxNorm)
        , toupper(concept_name)
    )) %>% 
    filter(vocabulary_id == "RxNorm") %>% 
    arrange(concept_code) #----

    
    #@ output.list$Step15.DRUG_STRENGTH.filter_RxNorm_concept_id ======
    concept_id.selected = output.list$Step11.CONCEPT.filter_RxNorm$concept_id |> unique %>% sort
    output.list$Step15.DRUG_STRENGTH.filter_RxNorm_concept_id =
        OMOP_CommonDataModel$DRUG_STRENGTH %>% 
        filter(drug_concept_id %in% concept_id.selected | ingredient_concept_id %in% concept_id.selected) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(drug_concept_id = concept_id, drug_concept_name = concept_name, drug_vocabulary_id = vocabulary_id)) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(ingredient_concept_id = concept_id, ingredient_concept_name = concept_name, ingredient_vocabulary_id = vocabulary_id)) %>% 
        select(matches("drug"), matches("ingredient"), everything()) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    
    #@ output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id ======
    concept_id.selected = 
        output.list$Step11.CONCEPT.filter_RxNorm$concept_id |> unique %>% sort
    
    output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id =
        OMOP_CommonDataModel$CONCEPT_RELATIONSHIP %>%
        filter(concept_id_1 %in% concept_id.selected | concept_id_2 %in% concept_id.selected) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(concept_id_1 = concept_id, concept_name_1 = concept_name, vocabulary_id_1 = vocabulary_id)) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(concept_id_2 = concept_id, concept_name_2 = concept_name, vocabulary_id_2 = vocabulary_id)) %>% 
        select(ends_with("_1"), ends_with("_2"), everything()) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    
    
    
    #@ output.list$Step21.CONCEPT.filter_NDC ======
    concept_id.selected = 
        c(
            output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id %>% 
                filter(vocabulary_id_1 == "NDC") %>% {.$concept_id_1}
            , 
            output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id %>% 
                filter(vocabulary_id_2 == "NDC") %>% {.$concept_id_2}
        ) |> unique %>% sort
    output.list$Step21.CONCEPT.filter_NDC =
        OMOP_CommonDataModel$CONCEPT %>% 
        filter(concept_id %in% concept_id.selected) %>% 
        # filter(vocabulary_id == "NDC") %>% 
        arrange(concept_id) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    output.list
}


# https://www.aafp.org/afp/2016/0715/p106.html
# 
# https://en.wikipedia.org/wiki/ATC_code_G03
# https://www.whocc.no/atc_ddd_index/?code=G03GB&showdescription=yes 
# https://mor.nlm.nih.gov/RxNav/search?searchBy=String&searchTerm=clomifen
# https://mor.nlm.nih.gov/RxNav/search?searchBy=String&searchTerm=clomiphene
# https://mor.nlm.nih.gov/RxNav/search?searchBy=RXCUI&searchTerm=2596
# 
# https://en.wikipedia.org/wiki/ATC_code_L02
# https://www.whocc.no/atc_ddd_index/?code=L02BG
# https://mor.nlm.nih.gov/RxNav/search?searchBy=String&searchTerm=Letrozole
# https://mor.nlm.nih.gov/RxNav/search?searchBy=RXCUI&searchTerm=72965 



#@ RxNorm_clomiphene_to_NDC =====
t0 = Sys.time()
RxNorm_clomiphene_to_NDC = function.OMOP_CommonDataModel.RxNorm_to_NDC(text4grepl.RxNorm = "clomiphene", OMOP_CommonDataModel = ATC_RxNorm_NDC)
Sys.time() - t0
# > Sys.time() - t0
# Time difference of 4.695696 secs

getwd()
path4write = getwd()
objectname = "RxNorm_clomiphene_to_NDC"
write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds","")), compress="xz", compression=9 )
openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE)
openxlsx::openXL(paste0(objectname,".xlsx"))

RxNorm_clomiphene_to_NDC |> str() #----
# > RxNorm_clomiphene_to_NDC |> str() #----
# List of 4
#  $ Step11.CONCEPT.filter_RxNorm                        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	19 obs. of  10 variables:
#   ..$ concept_id      : int [1:19] 40236647 40236648 40236652 40236650 40236651 40236649 36216656 36216657 19011940 1598820 ...
#   ..$ concept_name    : chr [1:19] "Clomiphene Citrate 50 MG" "Clomiphene Citrate 50 MG Oral Tablet" "Clomiphene Citrate 50 MG [Serophene]" "Clomiphene Citrate 50 MG Oral Tablet [Serophene]" ...
#   ..$ domain_id       : chr [1:19] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:19] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ concept_class_id: chr [1:19] "Clinical Drug Comp" "Clinical Drug" "Branded Drug Comp" "Branded Drug" ...
#   ..$ standard_concept: chr [1:19] "S" "S" "S" "S" ...
#   ..$ concept_code    : chr [1:19] "1093059" "1093060" "1093061" "1093062" ...
#   ..$ valid_start_date: int [1:19] 20110403 20110403 20110403 20110403 20110403 20110403 20160801 20160801 19700101 19700101 ...
#   ..$ valid_end_date  : int [1:19] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20110402 ...
#   ..$ invalid_reason  : chr [1:19] NA NA NA NA ...
#  $ Step15.DRUG_STRENGTH.filter_RxNorm_concept_id       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	10 obs. of  16 variables:
#   ..$ drug_concept_id            : int [1:10] 40025730 40025728 40236650 1598819 40236648 40236652 40236647 40236649 40236651 40025729
#   ..$ drug_concept_name          : chr [1:10] "Clomiphene Oral Tablet [Serophene]" "Clomiphene Oral Tablet" "Clomiphene Citrate 50 MG Oral Tablet [Serophene]" "Clomiphene" ...
#   ..$ drug_vocabulary_id         : chr [1:10] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ ingredient_concept_id      : int [1:10] 1598819 1598819 1598819 1598819 1598819 1598819 1598819 1598819 1598819 1598819
#   ..$ ingredient_concept_name    : chr [1:10] "Clomiphene" "Clomiphene" "Clomiphene" "Clomiphene" ...
#   ..$ ingredient_vocabulary_id   : chr [1:10] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ amount_value               : num [1:10] NA NA 50 NA 50 50 50 50 50 NA
#   ..$ amount_unit_concept_id     : int [1:10] 8576 8576 8576 8576 8576 8576 8576 8576 8576 8576
#   ..$ numerator_value            : num [1:10] NA NA NA NA NA NA NA NA NA NA
#   ..$ numerator_unit_concept_id  : int [1:10] NA NA NA NA NA NA NA NA NA NA
#   ..$ denominator_value          : chr [1:10] NA NA NA NA ...
#   ..$ denominator_unit_concept_id: int [1:10] NA NA NA NA NA NA NA NA NA NA
#   ..$ box_size                   : chr [1:10] NA NA NA NA ...
#   ..$ valid_start_date           : int [1:10] 19700101 19700101 20110403 19700101 20110403 20110403 20110403 20110403 20110403 19700101
#   ..$ valid_end_date             : int [1:10] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231
#   ..$ invalid_reason             : chr [1:10] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:19] 1598819 1598820 1598833 19011940 19025986 19025987 19117702 19117703 36216656 36216657 ...
#  $ Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	334 obs. of  10 variables:
#   ..$ concept_id_1    : int [1:334] 40025728 40025730 40236650 36216657 40236648 40236648 40236648 40236648 40236648 40236648 ...
#   ..$ concept_name_1  : chr [1:334] "Clomiphene Oral Tablet" "Clomiphene Oral Tablet [Serophene]" "Clomiphene Citrate 50 MG Oral Tablet [Serophene]" "Clomiphene Pill" ...
#   ..$ vocabulary_id_1 : chr [1:334] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ concept_id_2    : int [1:334] 19082573 19082573 19082573 36217216 19082573 45241662 45233251 45203834 45028344 44985743 ...
#   ..$ concept_name_2  : chr [1:334] "Oral Tablet" "Oral Tablet" "Oral Tablet" "Pill" ...
#   ..$ vocabulary_id_2 : chr [1:334] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ relationship_id : chr [1:334] "RxNorm has dose form" "RxNorm has dose form" "RxNorm has dose form" "Has dose form group" ...
#   ..$ valid_start_date: int [1:334] 20050404 20050404 20110404 20160801 20110404 20130805 20110404 20110404 19700101 20110404 ...
#   ..$ valid_end_date  : int [1:334] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:334] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:19] 1598819 1598820 1598833 19011940 19025986 19025987 19117702 19117703 36216656 36216657 ...
#  $ Step21.CONCEPT.filter_NDC                           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	83 obs. of  10 variables:
#   ..$ concept_id      : int [1:83] 36177605 36178973 36178974 36178975 36191267 36193095 36493783 36497253 44410218 44413261 ...
#   ..$ concept_name    : chr [1:83] "Clomiphene Citrate 50 MG Oral Tablet" "Clomiphene Citrate 50 MG Oral Tablet" "Clomiphene Citrate 50 MG Oral Tablet" "Clomiphene Citrate 50 MG Oral Tablet" ...
#   ..$ domain_id       : chr [1:83] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:83] "NDC" "NDC" "NDC" "NDC" ...
#   ..$ concept_class_id: chr [1:83] "11-digit NDC" "11-digit NDC" "11-digit NDC" "11-digit NDC" ...
#   ..$ standard_concept: chr [1:83] NA NA NA NA ...
#   ..$ concept_code    : chr [1:83] "50090067701" "63629530201" "63629530202" "63629530203" ...
#   ..$ valid_start_date: int [1:83] 20180701 20180701 20180701 20180701 19901001 19990830 19990830 20171201 20170201 20160901 ...
#   ..$ valid_end_date  : int [1:83] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:83] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:83] 36177605 36178973 36178974 36178975 36191267 36193095 36493783 36497253 44410218 44413261 ...





#@ RxNorm_letrozole_to_NDC =====
t0 = Sys.time()
RxNorm_letrozole_to_NDC = function.OMOP_CommonDataModel.RxNorm_to_NDC(text4grepl.RxNorm = "letrozole", OMOP_CommonDataModel = ATC_RxNorm_NDC)
Sys.time() - t0
# > Sys.time() - t0
# Time difference of 4.695696 secs

getwd()
path4write = getwd()
objectname = "RxNorm_letrozole_to_NDC"
write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds","")), compress="xz", compression=9 )
openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE)
openxlsx::openXL(paste0(objectname,".xlsx"))

RxNorm_letrozole_to_NDC |> str() #----
# > RxNorm_letrozole_to_NDC |> str() #----
# List of 4
#  $ Step11.CONCEPT.filter_RxNorm                        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	15 obs. of  10 variables:
#   ..$ concept_id      : int [1:15] 36219872 36219873 1315947 1592194 1592640 1592195 1592641 1592196 1592642 19022830 ...
#   ..$ concept_name    : chr [1:15] "letrozole Oral Product" "letrozole Pill" "letrozole 2.5 MG Oral Tablet [Femara]" "{28 (letrozole 2.5 MG Oral Tablet) / 21 (ribociclib 200 MG Oral Tablet) } Pack" ...
#   ..$ domain_id       : chr [1:15] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:15] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ concept_class_id: chr [1:15] "Clinical Dose Group" "Clinical Dose Group" "Branded Drug" "Clinical Pack" ...
#   ..$ standard_concept: chr [1:15] "C" "C" "S" "S" ...
#   ..$ concept_code    : chr [1:15] "1163195" "1163196" "153124" "1923053" ...
#   ..$ valid_start_date: int [1:15] 20160801 20160801 19700101 20170807 20170807 20170807 20170807 20170807 20170807 19700101 ...
#   ..$ valid_end_date  : int [1:15] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:15] NA NA NA NA ...
#  $ Step15.DRUG_STRENGTH.filter_RxNorm_concept_id       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	7 obs. of  16 variables:
#   ..$ drug_concept_id            : int [1:7] 40058598 1315949 1315946 40058597 19048141 1315947 19022830
#   ..$ drug_concept_name          : chr [1:7] "letrozole Oral Tablet [Femara]" "letrozole 2.5 MG" "letrozole" "letrozole Oral Tablet" ...
#   ..$ drug_vocabulary_id         : chr [1:7] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ ingredient_concept_id      : int [1:7] 1315946 1315946 1315946 1315946 1315946 1315946 1315946
#   ..$ ingredient_concept_name    : chr [1:7] "letrozole" "letrozole" "letrozole" "letrozole" ...
#   ..$ ingredient_vocabulary_id   : chr [1:7] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ amount_value               : num [1:7] NA 2.5 NA NA 2.5 2.5 2.5
#   ..$ amount_unit_concept_id     : int [1:7] 8576 8576 8576 8576 8576 8576 8576
#   ..$ numerator_value            : num [1:7] NA NA NA NA NA NA NA
#   ..$ numerator_unit_concept_id  : int [1:7] NA NA NA NA NA NA NA
#   ..$ denominator_value          : chr [1:7] NA NA NA NA ...
#   ..$ denominator_unit_concept_id: int [1:7] NA NA NA NA NA NA NA
#   ..$ box_size                   : chr [1:7] NA NA NA NA ...
#   ..$ valid_start_date           : int [1:7] 19700101 19700101 19700101 19700101 19700101 19700101 19700101
#   ..$ valid_end_date             : int [1:7] 20991231 20991231 20991231 20991231 20991231 20991231 20991231
#   ..$ invalid_reason             : chr [1:7] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:15] 1315946 1315947 1315949 1592194 1592195 1592196 1592640 1592641 1592642 19022830 ...
#  $ Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	302 obs. of  10 variables:
#   ..$ concept_id_1    : int [1:302] 36219872 40058598 40058598 36219873 40058597 1315947 1315947 19022830 19022830 36219872 ...
#   ..$ concept_name_1  : chr [1:302] "letrozole Oral Product" "letrozole Oral Tablet [Femara]" "letrozole Oral Tablet [Femara]" "letrozole Pill" ...
#   ..$ vocabulary_id_1 : chr [1:302] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ concept_id_2    : int [1:302] 36232070 19082573 36232070 36217216 19082573 19082573 36232070 19082573 44936161 36217214 ...
#   ..$ concept_name_2  : chr [1:302] "Femara Oral Product" "Oral Tablet" "Femara Oral Product" "Pill" ...
#   ..$ vocabulary_id_2 : chr [1:302] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ relationship_id : chr [1:302] "Has tradename" "RxNorm has dose form" "RxNorm is a" "Has dose form group" ...
#   ..$ valid_start_date: int [1:302] 20160801 20050404 20160801 20160801 20050404 20050404 20160801 20050404 20130805 20160801 ...
#   ..$ valid_end_date  : int [1:302] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:302] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:15] 1315946 1315947 1315949 1592194 1592195 1592196 1592640 1592641 1592642 19022830 ...
#  $ Step21.CONCEPT.filter_NDC                           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	80 obs. of  10 variables:
#   ..$ concept_id      : int [1:80] 36177787 36191593 44411709 44415338 44418557 44428840 44433472 44436330 44467342 44467343 ...
#   ..$ concept_name    : chr [1:80] "letrozole 2.5 MG Oral Tablet" "letrozole 2.5mg/1 ORAL TABLET, FILM COATED" "letrozole 2.5 MG Oral Tablet [Femara]" "letrozole 2.5 MG Oral Tablet" ...
#   ..$ domain_id       : chr [1:80] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:80] "NDC" "NDC" "NDC" "NDC" ...
#   ..$ concept_class_id: chr [1:80] "11-digit NDC" "9-digit NDC" "11-digit NDC" "11-digit NDC" ...
#   ..$ standard_concept: chr [1:80] NA NA NA NA ...
#   ..$ concept_code    : chr [1:80] "50090347400" "500903474" "00078088150" "69189762001" ...
#   ..$ valid_start_date: int [1:80] 20180701 20110602 20170601 20170501 20170601 20160801 20170601 20170601 20170504 20170504 ...
#   ..$ valid_end_date  : int [1:80] 20991231 20991231 20991231 20180601 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:80] NA NA NA "D" ...
#   ..- attr(*, "concept_id.selected")= int [1:80] 36177787 36191593 44411709 44415338 44418557 44428840 44433472 44436330 44467342 44467343 ...


