# function.OMOP_CommonDataModel.ATC_to_NDC.dev.r


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



function.OMOP_CommonDataModel.ATC_to_NDC = function(text4grepl.ATC_code = "^C02", OMOP_CommonDataModel = ATC_RxNorm_NDC) {
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_vocabulary/function.OMOP_CommonDataModel.ATC_to_NDC.dev.r
    
    #@ output.list =====
    output.list = list()
    
    #@ output.list$Step01.CONCEPT.filter_ATC ====
    output.list$Step01.CONCEPT.filter_ATC =
        OMOP_CommonDataModel$CONCEPT %>% 
        dplyr::filter(grepl(
            text4grepl.ATC_code
            , toupper(concept_code)
        )) %>% 
        dplyr::filter(vocabulary_id == "ATC") %>% 
        arrange(concept_code) #----
    
    #@ output.list$Step09.CONCEPT_RELATIONSHIP.filter_ATC_concept_id ======
    concept_id.selected = 
        output.list$Step01.CONCEPT.filter_ATC$concept_id |> unique() |> sort()
    output.list$Step09.CONCEPT_RELATIONSHIP.filter_ATC_concept_id =
        OMOP_CommonDataModel$CONCEPT_RELATIONSHIP %>%
        dplyr::filter(concept_id_1 %in% concept_id.selected | concept_id_2 %in% concept_id.selected) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(concept_id_1 = concept_id, concept_name_1 = concept_name, vocabulary_id_1 = vocabulary_id)) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(concept_id_2 = concept_id, concept_name_2 = concept_name, vocabulary_id_2 = vocabulary_id)) %>% 
        select(ends_with("_1"), ends_with("_2"), everything()) %>%
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    
    #@ output.list$Step11.CONCEPT.filter_RxNorm ======
    concept_id.selected = 
        c(
            output.list$Step09.CONCEPT_RELATIONSHIP.filter_ATC_concept_id %>% 
                dplyr::filter(vocabulary_id_1 == "RxNorm") %>% {.$concept_id_1}
            , 
            output.list$Step09.CONCEPT_RELATIONSHIP.filter_ATC_concept_id %>% 
                dplyr::filter(vocabulary_id_2 == "RxNorm") %>% {.$concept_id_2}
        ) |> unique() |> sort()
    output.list$Step11.CONCEPT.filter_RxNorm =
        OMOP_CommonDataModel$CONCEPT %>% 
        dplyr::filter(concept_id %in% concept_id.selected) %>% 
        # dplyr::filter(vocabulary_id == "RxNorm") %>% 
        arrange(concept_id) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    
    #@ output.list$Step15.DRUG_STRENGTH.filter_RxNorm_concept_id ======
    concept_id.selected = output.list$Step11.CONCEPT.filter_RxNorm$concept_id |> unique() |> sort()
    output.list$Step15.DRUG_STRENGTH.filter_RxNorm_concept_id =
        OMOP_CommonDataModel$DRUG_STRENGTH %>% 
        dplyr::filter(drug_concept_id %in% concept_id.selected | ingredient_concept_id %in% concept_id.selected) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(drug_concept_id = concept_id, drug_concept_name = concept_name, drug_vocabulary_id = vocabulary_id)) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(ingredient_concept_id = concept_id, ingredient_concept_name = concept_name, ingredient_vocabulary_id = vocabulary_id)) %>% 
        select(matches("drug"), matches("ingredient"), everything()) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    
    #@ output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id ======
    concept_id.selected = 
        output.list$Step11.CONCEPT.filter_RxNorm$concept_id |> unique() |> sort()
    
    output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id =
        OMOP_CommonDataModel$CONCEPT_RELATIONSHIP %>%
        dplyr::filter(concept_id_1 %in% concept_id.selected | concept_id_2 %in% concept_id.selected) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(concept_id_1 = concept_id, concept_name_1 = concept_name, vocabulary_id_1 = vocabulary_id)) %>% 
        left_join(OMOP_CommonDataModel$CONCEPT %>% transmute(concept_id_2 = concept_id, concept_name_2 = concept_name, vocabulary_id_2 = vocabulary_id)) %>% 
        select(ends_with("_1"), ends_with("_2"), everything()) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    
    
    
    #@ output.list$Step21.CONCEPT.filter_NDC ======
    concept_id.selected = 
        c(
            output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id %>% 
                dplyr::filter(vocabulary_id_1 == "NDC") %>% {.$concept_id_1}
            , 
            output.list$Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id %>% 
                dplyr::filter(vocabulary_id_2 == "NDC") %>% {.$concept_id_2}
        ) |> unique() |> sort()
    output.list$Step21.CONCEPT.filter_NDC =
        OMOP_CommonDataModel$CONCEPT %>% 
        dplyr::filter(concept_id %in% concept_id.selected) %>% 
        # dplyr::filter(vocabulary_id == "NDC") %>% 
        arrange(concept_id) %>% 
        {attributes(.)$concept_id.selected = concept_id.selected; .} #----
    
    output.list
}



# https://www.whocc.no/atc_ddd_index/?code=C
# https://www.whocc.no/atc_ddd_index/?code=C02&showdescription=yes
# https://en.wikipedia.org/wiki/ATC_code_C02



#@ ATC_C02_to_NDC =====
.t0 = Sys.time()
ATC_C02_to_NDC = function.OMOP_CommonDataModel.ATC_to_NDC(text4grepl.ATC_code = "^C02", OMOP_CommonDataModel = ATC_RxNorm_NDC)
Sys.time() - .t0
# > Sys.time() - .t0
# Time difference of 3.515852 secs

getwd()
path4write = getwd()
objectname = "ATC_C02_to_NDC"
write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds","")), compress="xz", compression=9 )
openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE)
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))

ATC_C02_to_NDC |> str() #-----
# > ATC_C02_to_NDC |> str() #-----
# List of 6
#  $ Step01.CONCEPT.filter_ATC                           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	109 obs. of  10 variables:
#   ..$ concept_id      : int [1:109] 21600381 21600382 21600383 21600384 21600385 21600386 21600387 21600388 21600389 21600390 ...
#   ..$ concept_name    : chr [1:109] "ANTIHYPERTENSIVES" "ANTIADRENERGIC AGENTS, CENTRALLY ACTING" "Rauwolfia alkaloids" "rescinnamine" ...
#   ..$ domain_id       : chr [1:109] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:109] "ATC" "ATC" "ATC" "ATC" ...
#   ..$ concept_class_id: chr [1:109] "ATC 2nd" "ATC 3rd" "ATC 4th" "ATC 5th" ...
#   ..$ standard_concept: chr [1:109] "C" "C" "C" "C" ...
#   ..$ concept_code    : chr [1:109] "C02" "C02A" "C02AA" "C02AA01" ...
#   ..$ valid_start_date: int [1:109] 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 ...
#   ..$ valid_end_date  : int [1:109] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:109] NA NA NA NA ...
#  $ Step09.CONCEPT_RELATIONSHIP.filter_ATC_concept_id   :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	922 obs. of  10 variables:
#   ..$ concept_id_1    : int [1:922] 21600467 21600385 21600385 21600385 19106541 21600399 1326379 45893474 21600405 21600405 ...
#   ..$ concept_name_1  : chr [1:922] "clonidine and diuretics" "reserpine" "reserpine" "reserpine" ...
#   ..$ vocabulary_id_1 : chr [1:922] "ATC" "ATC" "ATC" "ATC" ...
#   ..$ concept_id_2    : int [1:922] 19048633 1362225 1362225 1362225 21600387 19032342 21600387 44506615 19005658 19005658 ...
#   ..$ concept_name_2  : chr [1:922] "Chlorthalidone 15 MG / Clonidine 0.2 MG Oral Tablet [Combipres]" "Reserpine" "Reserpine" "Reserpine" ...
#   ..$ vocabulary_id_2 : chr [1:922] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ relationship_id : chr [1:922] "ATC - RxNorm" "ATC - RxNorm name" "ATC - RxNorm" "Maps to" ...
#   ..$ valid_start_date: int [1:922] 20120815 20120815 20141201 20141201 20120815 20120815 20120815 20150817 20141201 20141201 ...
#   ..$ valid_end_date  : int [1:922] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:922] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:109] 21600381 21600382 21600383 21600384 21600385 21600386 21600387 21600388 21600389 21600390 ...
#  $ Step11.CONCEPT.filter_RxNorm                        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	270 obs. of  10 variables:
#   ..$ concept_id      : int [1:270] 974426 1305447 1305449 1305450 1305451 1305472 1305477 1309068 1309069 1309070 ...
#   ..$ concept_name    : chr [1:270] "Hydralazine 25 MG / Hydrochlorothiazide 25 MG Oral Tablet" "Methyldopa" "Methyldopa 125 MG Oral Tablet" "Methyldopa 250 MG Oral Tablet" ...
#   ..$ domain_id       : chr [1:270] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:270] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ concept_class_id: chr [1:270] "Clinical Drug" "Ingredient" "Clinical Drug" "Clinical Drug" ...
#   ..$ standard_concept: chr [1:270] NA "S" "S" "S" ...
#   ..$ concept_code    : chr [1:270] "242956" "6876" "197955" "197956" ...
#   ..$ valid_start_date: int [1:270] 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 19700101 ...
#   ..$ valid_end_date  : int [1:270] 20100403 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:270] "U" NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:270] 974426 1305447 1305449 1305450 1305451 1305472 1305477 1309068 1309069 1309070 ...
#  $ Step15.DRUG_STRENGTH.filter_RxNorm_concept_id       :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	978 obs. of  16 variables:
#   ..$ drug_concept_id            : int [1:978] 19009226 40233125 44506615 1305451 1309071 19032342 19034479 19037460 1350520 19106550 ...
#   ..$ drug_concept_name          : chr [1:978] "Guanethidine 2.5 MG/ML Ophthalmic Solution" "Clonidine Hydrochloride 0.17 MG Extended Release Oral Tablet" "riociguat 1.5 MG Oral Tablet" "Methyldopa 50 MG/ML Oral Suspension" ...
#   ..$ drug_vocabulary_id         : chr [1:978] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ ingredient_concept_id      : int [1:978] 1366279 1398937 44506752 1305447 1309068 1344965 1362225 1362225 1350489 1350489 ...
#   ..$ ingredient_concept_name    : chr [1:978] "Guanethidine" "Clonidine" "riociguat" "Methyldopa" ...
#   ..$ ingredient_vocabulary_id   : chr [1:978] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ amount_value               : num [1:978] NA 0.17 1.5 NA 5 1 0.1 0.125 5 0.5 ...
#   ..$ amount_unit_concept_id     : int [1:978] NA 8576 8576 NA 8576 8576 8576 8576 8576 8576 ...
#   ..$ numerator_value            : num [1:978] 2.5 NA NA 50 NA NA NA NA NA NA ...
#   ..$ numerator_unit_concept_id  : int [1:978] 8576 NA NA 8576 NA NA NA NA NA NA ...
#   ..$ denominator_value          : chr [1:978] NA NA NA NA ...
#   ..$ denominator_unit_concept_id: int [1:978] 8587 NA NA 8587 NA NA NA NA NA NA ...
#   ..$ box_size                   : chr [1:978] NA NA NA NA ...
#   ..$ valid_start_date           : int [1:978] 19700101 20100103 20131104 19700101 19700101 19700101 19700101 19700101 19700101 19700101 ...
#   ..$ valid_end_date             : int [1:978] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason             : chr [1:978] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:270] 974426 1305447 1305449 1305450 1305451 1305472 1305477 1309068 1309069 1309070 ...
#  $ Step19.CONCEPT_RELATIONSHIP.filter_RxNorm_concept_id:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	13374 obs. of  10 variables:
#   ..$ concept_id_1    : int [1:13374] 19104537 19082103 1309071 19082573 19032342 1362225 19082573 19080912 1350520 1305451 ...
#   ..$ concept_name_1  : chr [1:13374] "Hydralazine 0.2 MG/ML Injectable Solution" "Injectable Solution" "Minoxidil 5 MG Oral Tablet" "Oral Tablet" ...
#   ..$ vocabulary_id_1 : chr [1:13374] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ concept_id_2    : int [1:13374] 19082103 19104537 19082573 1309071 19082573 19080912 19032342 1362225 19082077 19082191 ...
#   ..$ concept_name_2  : chr [1:13374] "Injectable Solution" "Hydralazine 0.2 MG/ML Injectable Solution" "Oral Tablet" "Minoxidil 5 MG Oral Tablet" ...
#   ..$ vocabulary_id_2 : chr [1:13374] "RxNorm" "RxNorm" "RxNorm" "RxNorm" ...
#   ..$ relationship_id : chr [1:13374] "RxNorm has dose form" "RxNorm dose form of" "RxNorm has dose form" "RxNorm dose form of" ...
#   ..$ valid_start_date: int [1:13374] 20050404 20050404 20050404 20050404 20050404 20060120 20050404 20060120 20050404 20050404 ...
#   ..$ valid_end_date  : int [1:13374] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:13374] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:270] 974426 1305447 1305449 1305450 1305451 1305472 1305477 1309068 1309069 1309070 ...
#  $ Step21.CONCEPT.filter_NDC                           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4628 obs. of  10 variables:
#   ..$ concept_id      : int [1:4628] 750171 750557 750558 750559 750560 750561 750562 750563 750564 750863 ...
#   ..$ concept_name    : chr [1:4628] "1 ML Hydralazine Hydrochloride 20 MG/ML Injection" "Doxazosin 1 MG Oral Tablet" "Doxazosin 1 MG Oral Tablet" "Doxazosin 2 MG Oral Tablet" ...
#   ..$ domain_id       : chr [1:4628] "Drug" "Drug" "Drug" "Drug" ...
#   ..$ vocabulary_id   : chr [1:4628] "NDC" "NDC" "NDC" "NDC" ...
#   ..$ concept_class_id: chr [1:4628] "11-digit NDC" "11-digit NDC" "11-digit NDC" "11-digit NDC" ...
#   ..$ standard_concept: chr [1:4628] NA NA NA NA ...
#   ..$ concept_code    : chr [1:4628] "63323061400" "55801035601" "55801035602" "55801035701" ...
#   ..$ valid_start_date: int [1:4628] 20180501 20180501 20180501 20180501 20180501 20180501 20180501 20180501 20180501 20180501 ...
#   ..$ valid_end_date  : int [1:4628] 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 20991231 ...
#   ..$ invalid_reason  : chr [1:4628] NA NA NA NA ...
#   ..- attr(*, "concept_id.selected")= int [1:4628] 750171 750557 750558 750559 750560 750561 750562 750563 750564 750863 ...






