#@ ICD10_3char_sub_chapter.tibble from icd10_chapters.expand_range.ICD10_3char & icd10_sub_chapters.expand_range.ICD10_3char .r

library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/data/icd10_chapters.expand_range.ICD10_3char.rda"))
load(url("https://github.com/mkim0710/tidystat/raw/master/data/icd10_sub_chapters.expand_range.ICD10_3char.rda"))

icd10_chapters.expand_range.ICD10_3char %>% str
icd10_sub_chapters.expand_range.ICD10_3char %>% str
# > icd10_chapters.expand_range.ICD10_3char %>% str
# List of 21
#  $ Certain infectious and parasitic diseases                                                          : chr [1:167] "A00" "A01" "A02" "A03" ...
#  $ Neoplasms                                                                                          : chr [1:141] "C00" "C01" "C02" "C03" ...
#  $ Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism: chr [1:35] "D50" "D51" "D52" "D53" ...
#  $ Endocrine, nutritional and metabolic diseases                                                      : chr [1:73] "E00" "E01" "E02" "E03" ...
#  $ Mental, Behavioral and Neurodevelopmental disorders                                                : chr [1:72] "F01" "F02" "F03" "F04" ...
#  $ Diseases of the nervous system                                                                     : chr [1:68] "G00" "G01" "G02" "G03" ...
#  $ Diseases of the eye and adnexa                                                                     : chr [1:40] "H00" "H01" "H02" "H04" ...
#  $ Diseases of the ear and mastoid process                                                            : chr [1:24] "H60" "H61" "H62" "H65" ...
#  $ Diseases of the circulatory system                                                                 : chr [1:77] "I00" "I01" "I02" "I05" ...
#  $ Diseases of the respiratory system                                                                 : chr [1:63] "J00" "J01" "J02" "J03" ...
#  $ Diseases of the digestive system                                                                   : chr [1:72] "K00" "K01" "K02" "K03" ...
#  $ Diseases of the skin and subcutaneous tissue                                                       : chr [1:74] "L00" "L01" "L02" "L03" ...
#  $ Diseases of the musculoskeletal system and connective tissue                                       : chr [1:77] "M00" "M01" "M02" "M05" ...
#  $ Diseases of the genitourinary system                                                               : chr [1:85] "N00" "N01" "N02" "N03" ...
#  $ Pregnancy, childbirth and the puerperium                                                           : chr [1:72] "O00" "O01" "O02" "O03" ...
#  $ Certain conditions originating in the perinatal period                                             : chr [1:59] "P00" "P01" "P02" "P03" ...
#  $ Congenital malformations, deformations and chromosomal abnormalities                               : chr [1:87] "Q00" "Q01" "Q02" "Q03" ...
#  $ Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified            : chr [1:89] "R00" "R01" "R03" "R04" ...
#  $ Injury, poisoning and certain other consequences of external causes                                : chr [1:171] "S00" "S01" "S02" "S03" ...
#  $ External causes of morbidity                                                                       : chr [1:271] "V00" "V01" "V02" "V03" ...
#  $ Factors influencing health status and contact with health services                                 : chr [1:86] "Z00" "Z01" "Z02" "Z03" ...
# > icd10_sub_chapters.expand_range.ICD10_3char %>% str
# List of 279
#  $ Intestinal Infectious Diseases                                                                                                                                                : chr [1:10] "A00" "A01" "A02" "A03" ...
#  $ Tuberculosis                                                                                                                                                                  : chr [1:4] "A15" "A17" "A18" "A19"
#  $ Certain Zoonotic Bacterial Diseases                                                                                                                                           : chr [1:9] "A20" "A21" "A22" "A23" ...
#  $ Other Bacterial Diseases                                                                                                                                                      : chr [1:18] "A30" "A31" "A32" "A33" ...
#  $ Infections With A Predominantly Sexual Mode Of Transmission                                                                                                                   : chr [1:13] "A50" "A51" "A52" "A53" ...
#  $ Other Spirochetal Diseases                                                                                                                                                    : chr [1:5] "A65" "A66" "A67" "A68" ...
#  $ Other Diseases Caused By Chlamydiae                                                                                                                                           : chr [1:3] "A70" "A71" "A74"
#  $ Rickettsioses                                                                                                                                                                 : chr [1:4] "A75" "A77" "A78" "A79"
#  $ Viral And Prion Infections Of The Central Nervous System                                                                                                                      : chr [1:10] "A80" "A81" "A82" "A83" ...
#  $ Arthropod-Borne Viral Fevers And Viral Hemorrhagic Fevers                                                                                                                     : chr [1:9] "A90" "A91" "A92" "A93" ...
#  $ Viral Infections Characterized By Skin And Mucous Membrane Lesions                                                                                                            : chr [1:10] "B00" "B01" "B02" "B03" ...
#  $ Other Human Herpesviruses                                                                                                                                                     : chr "B10"
#  $ Viral Hepatitis                                                                                                                                                               : chr [1:5] "B15" "B16" "B17" "B18" ...
#  $ Human Immunodeficiency Virus [HIV] Disease                                                                                                                                    : chr "B20"
#  $ Other Viral Diseases                                                                                                                                                          : chr [1:6] "B25" "B26" "B27" "B30" ...
#  $ Mycoses                                                                                                                                                                       : chr [1:15] "B35" "B36" "B37" "B38" ...
#  $ Protozoal Diseases                                                                                                                                                            : chr [1:12] "B50" "B51" "B52" "B53" ...
#  $ Helminthiases                                                                                                                                                                 : chr [1:19] "B65" "B66" "B67" "B68" ...
#  $ Pediculosis, Acariasis And Other Infestations                                                                                                                                 : chr [1:5] "B85" "B86" "B87" "B88" ...
#  $ Sequelae Of Infectious And Parasitic Diseases                                                                                                                                 : chr [1:4] "B90" "B91" "B92" "B94"
#  $ Bacterial And Viral Infectious Agents                                                                                                                                         : chr [1:3] "B95" "B96" "B97"
#  $ Other Infectious Diseases                                                                                                                                                     : chr "B99"
#  $ Malignant Neoplasms Of Lip, Oral Cavity And Pharynx                                                                                                                           : chr [1:15] "C00" "C01" "C02" "C03" ...
#  $ Malignant Neoplasms Of Digestive Organs                                                                                                                                       : chr [1:12] "C15" "C16" "C17" "C18" ...
#  $ Malignant Neoplasms Of Respiratory And Intrathoracic Organs                                                                                                                   : chr [1:8] "C30" "C31" "C32" "C33" ...
#  $ Malignant Neoplasms Of Bone And Articular Cartilage                                                                                                                           : chr [1:2] "C40" "C41"
#  $ Melanoma And Other Malignant Neoplasms Of Skin                                                                                                                                : chr [1:3] "C43" "C4A" "C44"
#  $ Malignant Neoplasms Of Mesothelial And Soft Tissue                                                                                                                            : chr [1:5] "C45" "C46" "C47" "C48" ...
#  $ Malignant Neoplasms Of Breast                                                                                                                                                 : chr "C50"
#  $ Malignant Neoplasms Of Female Genital Organs                                                                                                                                  : chr [1:8] "C51" "C52" "C53" "C54" ...
#  $ Malignant Neoplasms Of Male Genital Organs                                                                                                                                    : chr [1:4] "C60" "C61" "C62" "C63"
#  $ Malignant Neoplasms Of Urinary Tract                                                                                                                                          : chr [1:5] "C64" "C65" "C66" "C67" ...
#  $ Malignant Neoplasms Of Eye, Brain And Other Parts Of Central Nervous System                                                                                                   : chr [1:4] "C69" "C70" "C71" "C72"
#  $ Malignant Neoplasms Of Thyroid And Other Endocrine Glands                                                                                                                     : chr [1:3] "C73" "C74" "C75"
#  $ Malignant Neuroendocrine Tumors                                                                                                                                               : chr "C7A"
#  $ Secondary Neuroendocrine Tumors                                                                                                                                               : chr "C7B"
#  $ Malignant Neoplasms Of Ill-Defined, Other Secondary And Unspecified Sites                                                                                                     : chr [1:5] "C76" "C77" "C78" "C79" ...
#  $ Malignant Neoplasms Of Lymphoid, Hematopoietic And Related Tissue                                                                                                             : chr [1:14] "C81" "C82" "C83" "C84" ...
#  $ In Situ Neoplasms                                                                                                                                                             : chr [1:9] "D00" "D01" "D02" "D03" ...
#  $ Benign Neoplasms, Except Benign Neuroendocrine Tumors                                                                                                                         : chr [1:27] "D10" "D11" "D12" "D13" ...
#  $ Benign Neuroendocrine Tumors                                                                                                                                                  : chr "D3A"
#  $ Neoplasms Of Uncertain Behavior, Polycythemia Vera And Myelodysplastic Syndromes                                                                                              : chr [1:12] "D37" "D38" "D39" "D40" ...
#  $ Neoplasms Of Unspecified Behavior                                                                                                                                             : chr "D49"
#  $ Nutritional Anemias                                                                                                                                                           : chr [1:4] "D50" "D51" "D52" "D53"
#  $ Hemolytic Anemias                                                                                                                                                             : chr [1:5] "D55" "D56" "D57" "D58" ...
#  $ Aplastic And Other Anemias And Other Bone Marrow Failure Syndromes                                                                                                            : chr [1:5] "D60" "D61" "D62" "D63" ...
#  $ Coagulation Defects, Purpura And Other Hemorrhagic Conditions                                                                                                                 : chr [1:5] "D65" "D66" "D67" "D68" ...
#  $ Other Disorders Of Blood And Blood-Forming Organs                                                                                                                             : chr [1:8] "D70" "D71" "D72" "D73" ...
#  $ Intraoperative And Postprocedural Complications Of The Spleen                                                                                                                 : chr "D78"
#  $ Certain Disorders Involving The Immune Mechanism                                                                                                                              : chr [1:7] "D80" "D81" "D82" "D83" ...
#  $ Disorders Of Thyroid Gland                                                                                                                                                    : chr [1:8] "E00" "E01" "E02" "E03" ...
#  $ Diabetes Mellitus                                                                                                                                                             : chr [1:5] "E08" "E09" "E10" "E11" ...
#  $ Other Disorders Of Glucose Regulation And Pancreatic Internal Secretion                                                                                                       : chr [1:2] "E15" "E16"
#  $ Disorders Of Other Endocrine Glands                                                                                                                                           : chr [1:15] "E20" "E21" "E22" "E23" ...
#  $ Intraoperative Complications Of Endocrine System                                                                                                                              : chr "E36"
#  $ Malnutrition                                                                                                                                                                  : chr [1:7] "E40" "E41" "E42" "E43" ...
#  $ Other Nutritional Deficiencies                                                                                                                                                : chr [1:13] "E50" "E51" "E52" "E53" ...
#  $ Overweight, Obesity And Other Hyperalimentation                                                                                                                               : chr [1:4] "E65" "E66" "E67" "E68"
#  $ Metabolic Disorders                                                                                                                                                           : chr [1:17] "E70" "E71" "E72" "E73" ...
#  $ Postprocedural Endocrine And Metabolic Complications And Disorders, Not Elsewhere Classified                                                                                  : chr "E89"
#  $ Mental Disorders Due To Known Physiological Conditions                                                                                                                        : chr [1:8] "F01" "F02" "F03" "F04" ...
#  $ Mental And Behavioral Disorders Due To Psychoactive Substance Use                                                                                                             : chr [1:10] "F10" "F11" "F12" "F13" ...
#  $ Schizophrenia, Schizotypal, Delusional, And Other Non-Mood Psychotic Disorders                                                                                                : chr [1:8] "F20" "F21" "F22" "F23" ...
#  $ Mood [Affective] Disorders                                                                                                                                                    : chr [1:6] "F30" "F31" "F32" "F33" ...
#  $ Anxiety, Dissociative, Stress-Related, Somatoform And Other Nonpsychotic Mental Disorders                                                                                     : chr [1:7] "F40" "F41" "F42" "F43" ...
#  $ Behavioral Syndromes Associated With Physiological Disturbances And Physical Factors                                                                                          : chr [1:7] "F50" "F51" "F52" "F53" ...
#  $ Disorders Of Adult Personality And Behavior                                                                                                                                   : chr [1:7] "F60" "F63" "F64" "F65" ...
#  $ Intellectual Disabilities                                                                                                                                                     : chr [1:6] "F70" "F71" "F72" "F73" ...
#  $ Pervasive And Specific Developmental Disorders                                                                                                                                : chr [1:6] "F80" "F81" "F82" "F84" ...
#  $ Behavioral And Emotional Disorders With Onset Usually Occurring In Childhood And Adolescence                                                                                  : chr [1:6] "F90" "F91" "F93" "F94" ...
#  $ Unspecified Mental Disorder                                                                                                                                                   : chr "F99"
#  $ Inflammatory Diseases Of The Central Nervous System                                                                                                                           : chr [1:10] "G00" "G01" "G02" "G03" ...
#  $ Systemic Atrophies Primarily Affecting The Central Nervous System                                                                                                             : chr [1:5] "G10" "G11" "G12" "G13" ...
#  $ Extrapyramidal And Movement Disorders                                                                                                                                         : chr [1:6] "G20" "G21" "G23" "G24" ...
#  $ Other Degenerative Diseases Of The Nervous System                                                                                                                             : chr [1:3] "G30" "G31" "G32"
#  $ Demyelinating Diseases Of The Central Nervous System                                                                                                                          : chr [1:3] "G35" "G36" "G37"
#  $ Episodic And Paroxysmal Disorders                                                                                                                                             : chr [1:6] "G40" "G43" "G44" "G45" ...
#  $ Nerve, Nerve Root And Plexus Disorders                                                                                                                                        : chr [1:10] "G50" "G51" "G52" "G53" ...
#  $ Polyneuropathies And Other Disorders Of The Peripheral Nervous System                                                                                                         : chr [1:6] "G60" "G61" "G62" "G63" ...
#  $ Diseases Of Myoneural Junction And Muscle                                                                                                                                     : chr [1:4] "G70" "G71" "G72" "G73"
#  $ Cerebral Palsy And Other Paralytic Syndromes                                                                                                                                  : chr [1:4] "G80" "G81" "G82" "G83"
#  $ Other Disorders Of The Nervous System                                                                                                                                         : chr [1:11] "G89" "G90" "G91" "G92" ...
#  $ Disorders Of Eyelid, Lacrimal System And Orbit                                                                                                                                : chr [1:5] "H00" "H01" "H02" "H04" ...
#  $ Disorders Of Conjunctiva                                                                                                                                                      : chr [1:2] "H10" "H11"
#  $ Disorders Of Sclera, Cornea, Iris And Ciliary Body                                                                                                                            : chr [1:7] "H15" "H16" "H17" "H18" ...
#  $ Disorders Of Lens                                                                                                                                                             : chr [1:4] "H25" "H26" "H27" "H28"
#  $ Disorders Of Choroid And Retina                                                                                                                                               : chr [1:7] "H30" "H31" "H32" "H33" ...
#  $ Glaucoma                                                                                                                                                                      : chr [1:2] "H40" "H42"
#  $ Disorders Of Vitreous Body And Globe                                                                                                                                          : chr [1:2] "H43" "H44"
#  $ Disorders Of Optic Nerve And Visual Pathways                                                                                                                                  : chr [1:2] "H46" "H47"
#  $ Disorders Of Ocular Muscles, Binocular Movement, Accommodation And Refraction                                                                                                 : chr [1:4] "H49" "H50" "H51" "H52"
#  $ Visual Disturbances And Blindness                                                                                                                                             : chr [1:2] "H53" "H54"
#  $ Other Disorders Of Eye And Adnexa                                                                                                                                             : chr [1:2] "H55" "H57"
#  $ Intraoperative And Postprocedural Complications And Disorders Of Eye And Adnexa, Not Elsewhere Classified                                                                     : chr "H59"
#  $ Diseases Of External Ear                                                                                                                                                      : chr [1:3] "H60" "H61" "H62"
#  $ Diseases Of Middle Ear And Mastoid                                                                                                                                            : chr [1:11] "H65" "H66" "H67" "H68" ...
#  $ Diseases Of Inner Ear                                                                                                                                                         : chr [1:4] "H80" "H81" "H82" "H83"
#  $ Other Disorders Of Ear                                                                                                                                                        : chr [1:5] "H90" "H91" "H92" "H93" ...
#  $ Intraoperative And Postprocedural Complications And Disorders Of Ear And Mastoid Process, Not Elsewhere Classified                                                            : chr "H95"
#   [list output truncated]












#@ icd10_chapters.expand_range.ICD10_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% enframe ----
icd10_chapters.expand_range.ICD10_3char %>% str
icd10_chapters.expand_range.ICD10_3char %>% reduce(c) %>% str
icd10_chapters.expand_range.ICD10_3char %>% names %>% str
icd10_chapters.expand_range.ICD10_3char %>% {rep(names(.), times = map_dbl(., length))} %>% str
icd10_chapters.expand_range.ICD10_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% str
icd10_chapters.expand_range.ICD10_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% enframe
# > icd10_chapters.expand_range.ICD10_3char %>% str
# List of 21
#  $ Certain infectious and parasitic diseases                                                          : chr [1:167] "A00" "A01" "A02" "A03" ...
#  $ Neoplasms                                                                                          : chr [1:141] "C00" "C01" "C02" "C03" ...
#  $ Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism: chr [1:35] "D50" "D51" "D52" "D53" ...
#  $ Endocrine, nutritional and metabolic diseases                                                      : chr [1:73] "E00" "E01" "E02" "E03" ...
#  $ Mental, Behavioral and Neurodevelopmental disorders                                                : chr [1:72] "F01" "F02" "F03" "F04" ...
#  $ Diseases of the nervous system                                                                     : chr [1:68] "G00" "G01" "G02" "G03" ...
#  $ Diseases of the eye and adnexa                                                                     : chr [1:40] "H00" "H01" "H02" "H04" ...
#  $ Diseases of the ear and mastoid process                                                            : chr [1:24] "H60" "H61" "H62" "H65" ...
#  $ Diseases of the circulatory system                                                                 : chr [1:77] "I00" "I01" "I02" "I05" ...
#  $ Diseases of the respiratory system                                                                 : chr [1:63] "J00" "J01" "J02" "J03" ...
#  $ Diseases of the digestive system                                                                   : chr [1:72] "K00" "K01" "K02" "K03" ...
#  $ Diseases of the skin and subcutaneous tissue                                                       : chr [1:74] "L00" "L01" "L02" "L03" ...
#  $ Diseases of the musculoskeletal system and connective tissue                                       : chr [1:77] "M00" "M01" "M02" "M05" ...
#  $ Diseases of the genitourinary system                                                               : chr [1:85] "N00" "N01" "N02" "N03" ...
#  $ Pregnancy, childbirth and the puerperium                                                           : chr [1:72] "O00" "O01" "O02" "O03" ...
#  $ Certain conditions originating in the perinatal period                                             : chr [1:59] "P00" "P01" "P02" "P03" ...
#  $ Congenital malformations, deformations and chromosomal abnormalities                               : chr [1:87] "Q00" "Q01" "Q02" "Q03" ...
#  $ Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified            : chr [1:89] "R00" "R01" "R03" "R04" ...
#  $ Injury, poisoning and certain other consequences of external causes                                : chr [1:171] "S00" "S01" "S02" "S03" ...
#  $ External causes of morbidity                                                                       : chr [1:271] "V00" "V01" "V02" "V03" ...
#  $ Factors influencing health status and contact with health services                                 : chr [1:86] "Z00" "Z01" "Z02" "Z03" ...
# > icd10_chapters.expand_range.ICD10_3char %>% reduce(c) %>% str
#  chr [1:1903] "A00" "A01" "A02" "A03" "A04" "A05" "A06" "A07" "A08" "A09" "A15" "A17" "A18" "A19" "A20" "A21" "A22" "A23" ...
# > icd10_chapters.expand_range.ICD10_3char %>% names %>% str
#  chr [1:21] "Certain infectious and parasitic diseases" "Neoplasms" ...
# > icd10_chapters.expand_range.ICD10_3char %>% {rep(names(.), times = map_dbl(., length))} %>% str
#  chr [1:1903] "Certain infectious and parasitic diseases" "Certain infectious and parasitic diseases" ...
# > icd10_chapters.expand_range.ICD10_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% str
#  Named chr [1:1903] "A00" "A01" "A02" "A03" "A04" "A05" "A06" "A07" "A08" "A09" "A15" "A17" "A18" "A19" "A20" "A21" "A22" ...
#  - attr(*, "names")= chr [1:1903] "Certain infectious and parasitic diseases" "Certain infectious and parasitic diseases" "Certain infectious and parasitic diseases" "Certain infectious and parasitic diseases" ...
# > icd10_chapters.expand_range.ICD10_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% enframe
# # A tibble: 1,903 x 2
#    name                                      value
#    <chr>                                     <chr>
#  1 Certain infectious and parasitic diseases A00
#  2 Certain infectious and parasitic diseases A01
#  3 Certain infectious and parasitic diseases A02
#  4 Certain infectious and parasitic diseases A03
#  5 Certain infectious and parasitic diseases A04
#  6 Certain infectious and parasitic diseases A05
#  7 Certain infectious and parasitic diseases A06
#  8 Certain infectious and parasitic diseases A07
#  9 Certain infectious and parasitic diseases A08
# 10 Certain infectious and parasitic diseases A09
# # ... with 1,893 more rows












#@ icd10_chapters.expand_range.ICD10_3char %>% enframe %>% unnest ----
icd10_chapters.expand_range.ICD10_3char %>% enframe
icd10_chapters.expand_range.ICD10_3char %>% enframe %>% unnest
# > icd10_chapters.expand_range.ICD10_3char %>% enframe
# # A tibble: 21 x 2
#    name                                                                                                value      
#    <chr>                                                                                               <list>     
#  1 Certain infectious and parasitic diseases                                                           <chr [167]>
#  2 Neoplasms                                                                                           <chr [141]>
#  3 Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism <chr [35]> 
#  4 Endocrine, nutritional and metabolic diseases                                                       <chr [73]> 
#  5 Mental, Behavioral and Neurodevelopmental disorders                                                 <chr [72]> 
#  6 Diseases of the nervous system                                                                      <chr [68]> 
#  7 Diseases of the eye and adnexa                                                                      <chr [40]> 
#  8 Diseases of the ear and mastoid process                                                             <chr [24]> 
#  9 Diseases of the circulatory system                                                                  <chr [77]> 
# 10 Diseases of the respiratory system                                                                  <chr [63]> 
# # ... with 11 more rows
# > icd10_chapters.expand_range.ICD10_3char %>% enframe %>% unnest
# # A tibble: 1,903 x 2
#    name                                      value
#    <chr>                                     <chr>
#  1 Certain infectious and parasitic diseases A00  
#  2 Certain infectious and parasitic diseases A01  
#  3 Certain infectious and parasitic diseases A02  
#  4 Certain infectious and parasitic diseases A03  
#  5 Certain infectious and parasitic diseases A04  
#  6 Certain infectious and parasitic diseases A05  
#  7 Certain infectious and parasitic diseases A06  
#  8 Certain infectious and parasitic diseases A07  
#  9 Certain infectious and parasitic diseases A08  
# 10 Certain infectious and parasitic diseases A09  
# # ... with 1,893 more rows


full_join(
    (icd10_chapters.expand_range.ICD10_3char %>% enframe(name = "chapter", value = "ICD10_3char") %>% unnest)
    , (icd10_sub_chapters.expand_range.ICD10_3char %>% enframe(name = "sub_chapter", value = "ICD10_3char") %>% unnest)
    , by = "ICD10_3char"
) %>% select(ICD10_3char, sub_chapter, chapter)
# > full_join(
# +     (icd10_chapters.expand_range.ICD10_3char %>% enframe(name = "chapter", value = "ICD10_3char") %>% unnest)
# +     , (icd10_sub_chapters.expand_range.ICD10_3char %>% enframe(name = "sub_chapter", value = "ICD10_3char") %>% unnest)
# +     , by = "ICD10_3char"
# + ) %>% select(ICD10_3char, sub_chapter, chapter)
# # A tibble: 1,903 x 3
#    ICD10_3char sub_chapter                    chapter                                  
#    <chr>       <chr>                          <chr>                                    
#  1 A00         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  2 A01         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  3 A02         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  4 A03         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  5 A04         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  6 A05         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  7 A06         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  8 A07         Intestinal Infectious Diseases Certain infectious and parasitic diseases
#  9 A08         Intestinal Infectious Diseases Certain infectious and parasitic diseases
# 10 A09         Intestinal Infectious Diseases Certain infectious and parasitic diseases
# # ... with 1,893 more rows


icd10_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD10_range_chapter") %>% unnest
icd10_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD10_range_sub_chapter") %>% unnest
# > icd10_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD10_range_chapter") %>% unnest
# # A tibble: 21 x 2
#    chapter                                                                                             ICD10_range_chapter
#    <chr>                                                                                               <chr>            
#  1 Certain infectious and parasitic diseases                                                           A00-B99          
#  2 Neoplasms                                                                                           C00-D49          
#  3 Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism D50-D89          
#  4 Endocrine, nutritional and metabolic diseases                                                       E00-E89          
#  5 Mental, Behavioral and Neurodevelopmental disorders                                                 F01-F99          
#  6 Diseases of the nervous system                                                                      G00-G99          
#  7 Diseases of the eye and adnexa                                                                      H00-H59          
#  8 Diseases of the ear and mastoid process                                                             H60-H95          
#  9 Diseases of the circulatory system                                                                  I00-I99          
# 10 Diseases of the respiratory system                                                                  J00-J99          
# # ... with 11 more rows
# > icd10_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD10_range_sub_chapter") %>% unnest
# # A tibble: 279 x 2
#    sub_chapter                                                 ICD10_range_sub_chapter
#    <chr>                                                       <chr>                
#  1 Intestinal Infectious Diseases                              A00-A09              
#  2 Tuberculosis                                                A15-A19              
#  3 Certain Zoonotic Bacterial Diseases                         A20-A28              
#  4 Other Bacterial Diseases                                    A30-A49              
#  5 Infections With A Predominantly Sexual Mode Of Transmission A50-A64              
#  6 Other Spirochetal Diseases                                  A65-A69              
#  7 Other Diseases Caused By Chlamydiae                         A70-A74              
#  8 Rickettsioses                                               A75-A79              
#  9 Viral And Prion Infections Of The Central Nervous System    A80-A89              
# 10 Arthropod-Borne Viral Fevers And Viral Hemorrhagic Fevers   A90-A99              
# # ... with 269 more rows









#@ ICD10_3char_sub_chapter.tibble ICD10_3char_sub_chapter.tibble from icd10_chapters.expand_range.ICD10_3char & icd10_sub_chapters.expand_range.ICD10_3char ====
ICD10_3char_sub_chapter.tibble = 
    full_join(
        (icd10_chapters.expand_range.ICD10_3char %>% enframe(name = "chapter", value = "ICD10_3char") %>% unnest)
        , (icd10_sub_chapters.expand_range.ICD10_3char %>% enframe(name = "sub_chapter", value = "ICD10_3char") %>% unnest)
        , by = "ICD10_3char"
    ) %>% 
    left_join((icd10_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD10_range_chapter") %>% unnest)) %>% 
    left_join((icd10_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD10_range_sub_chapter") %>% unnest)) %>% 
    select(ICD10_3char, ICD10_range_sub_chapter, sub_chapter, ICD10_range_chapter, chapter)
ICD10_3char_sub_chapter.tibble
# > ICD10_3char_sub_chapter.tibble = 
# +     full_join(
# +         (icd10_chapters.expand_range.ICD10_3char %>% enframe(name = "chapter", value = "ICD10_3char") %>% unnest)
# +         , (icd10_sub_chapters.expand_range.ICD10_3char %>% enframe(name = "sub_chapter", value = "ICD10_3char") %>% unnest)
# +         , by = "ICD10_3char"
# +     ) %>% 
# +     left_join((icd10_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD10_range_chapter") %>% unnest)) %>% 
# +     left_join((icd10_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD10_range_sub_chapter") %>% unnest)) %>% 
# +     select(ICD10_3char, ICD10_range_sub_chapter, sub_chapter, ICD10_range_chapter, chapter)
# Joining, by = "chapter"
# Joining, by = "sub_chapter"
# > ICD10_3char_sub_chapter.tibble
# # A tibble: 1,903 x 5
#    ICD10_3char ICD10_range_sub_chapter sub_chapter                    ICD10_range_chapter chapter                                  
#    <chr>       <chr>                   <chr>                          <chr>               <chr>                                    
#  1 A00         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  2 A01         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  3 A02         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  4 A03         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  5 A04         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  6 A05         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  7 A06         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  8 A07         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
#  9 A08         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
# 10 A09         A00-A09                 Intestinal Infectious Diseases A00-B99             Certain infectious and parasitic diseases
# # ... with 1,893 more rows







#@ end ----
save(ICD10_3char_sub_chapter.tibble, file = "ICD10_3char_sub_chapter.tibble.rda")
