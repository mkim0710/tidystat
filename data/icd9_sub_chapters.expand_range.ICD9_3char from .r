# icd9_sub_chapters.expand_range.ICD9_3char from .r
# icd10_sub_chapters.expand_range.ICD10_3char from icd10_sub_chapters .r

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
library(icd)
packageVersion("icd")
# > library(icd)
# ‘icd’ downloads data when needed. set_icd_data_dir() creates a data directory. 
# Default location is: ‘C:\Users\mkim0\AppData\Local/R/cache/R/icd’
# > packageVersion("icd")
# [1] ‘4.0.9’


# ?icd9_chapters
# ?icd9_sub_chapters

# ?icd9_majors

# ?icd9_names_multi_ccs
# ?icd9_names_single_ccs


icd9_chapters |> str() #-----
icd9_sub_chapters |> str() #-----
# > icd9_chapters |> str() #-----  
# List of 19
#  $ Infectious And Parasitic Diseases                                                                 : Named chr [1:2] "001" "139"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neoplasms                                                                                         : Named chr [1:2] "140" "239"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Endocrine, Nutritional And Metabolic Diseases, And Immunity Disorders                             : Named chr [1:2] "240" "279"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Blood And Blood-Forming Organs                                                    : Named chr [1:2] "280" "289"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mental Disorders                                                                                  : Named chr [1:2] "290" "319"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Nervous System And Sense Organs                                                   : Named chr [1:2] "320" "389"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Circulatory System                                                                : Named chr [1:2] "390" "459"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Respiratory System                                                                : Named chr [1:2] "460" "519"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Digestive System                                                                  : Named chr [1:2] "520" "579"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Genitourinary System                                                              : Named chr [1:2] "580" "629"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Complications Of Pregnancy, Childbirth, And The Puerperium                                        : Named chr [1:2] "630" "679"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Skin And Subcutaneous Tissue                                                      : Named chr [1:2] "680" "709"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Musculoskeletal System And Connective Tissue                                      : Named chr [1:2] "710" "739"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Congenital Anomalies                                                                              : Named chr [1:2] "740" "759"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Certain Conditions Originating In The Perinatal Period                                            : Named chr [1:2] "760" "779"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Symptoms, Signs, And Ill-Defined Conditions                                                       : Named chr [1:2] "780" "799"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Injury And Poisoning                                                                              : Named chr [1:2] "800" "999"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Supplementary Classification Of Factors Influencing Health Status And Contact With Health Services: Named chr [1:2] "V01" "V99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Supplementary Classification Of External Causes Of Injury And Poisoning                           : Named chr [1:2] "E000" "E999"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
# > icd9_sub_chapters |> str() #-----  
# List of 162
#  $ Intestinal Infectious Diseases                                                                                                                             : Named chr [1:2] "001" "009"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Tuberculosis                                                                                                                                               : Named chr [1:2] "010" "018"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Zoonotic Bacterial Diseases                                                                                                                                : Named chr [1:2] "020" "027"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Bacterial Diseases                                                                                                                                   : Named chr [1:2] "030" "041"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Human Immunodeficiency Virus (Hiv) Infection                                                                                                               : Named chr [1:2] "042" "042"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Poliomyelitis And Other Non-Arthropod-Borne Viral Diseases And Prion Diseases Of Central Nervous System                                                    : Named chr [1:2] "045" "049"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Viral Diseases Generally Accompanied By Exanthem                                                                                                           : Named chr [1:2] "050" "059"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Arthropod-Borne Viral Diseases                                                                                                                             : Named chr [1:2] "060" "066"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Due To Viruses And Chlamydiae                                                                                                               : Named chr [1:2] "070" "079"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Rickettsioses And Other Arthropod-Borne Diseases                                                                                                           : Named chr [1:2] "080" "088"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Syphilis And Other Venereal Diseases                                                                                                                       : Named chr [1:2] "090" "099"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Spirochetal Diseases                                                                                                                                 : Named chr [1:2] "100" "104"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mycoses                                                                                                                                                    : Named chr [1:2] "110" "118"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Helminthiases                                                                                                                                              : Named chr [1:2] "120" "129"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Infectious And Parasitic Diseases                                                                                                                    : Named chr [1:2] "130" "136"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Late Effects Of Infectious And Parasitic Diseases                                                                                                          : Named chr [1:2] "137" "139"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Lip, Oral Cavity, And Pharynx                                                                                                        : Named chr [1:2] "140" "149"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Digestive Organs And Peritoneum                                                                                                      : Named chr [1:2] "150" "159"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Respiratory And Intrathoracic Organs                                                                                                 : Named chr [1:2] "160" "165"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Bone, Connective Tissue, Skin, And Breast                                                                                            : Named chr [1:2] "170" "176"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Genitourinary Organs                                                                                                                 : Named chr [1:2] "179" "189"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Other And Unspecified Sites                                                                                                          : Named chr [1:2] "190" "199"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasm Of Lymphatic And Hematopoietic Tissue                                                                                                   : Named chr [1:2] "200" "208"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neuroendocrine Tumors                                                                                                                                      : Named chr [1:2] "209" "209"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Benign Neoplasms                                                                                                                                           : Named chr [1:2] "210" "229"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Carcinoma In Situ                                                                                                                                          : Named chr [1:2] "230" "234"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neoplasms Of Uncertain Behavior                                                                                                                            : Named chr [1:2] "235" "238"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neoplasms Of Unspecified Nature                                                                                                                            : Named chr [1:2] "239" "239"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Thyroid Gland                                                                                                                                 : Named chr [1:2] "240" "246"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Other Endocrine Glands                                                                                                                         : Named chr [1:2] "249" "259"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Nutritional Deficiencies                                                                                                                                   : Named chr [1:2] "260" "269"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Metabolic And Immunity Disorders                                                                                                                     : Named chr [1:2] "270" "279"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Blood And Blood-Forming Organs                                                                                                             : Named chr [1:2] "280" "289"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Organic Psychotic Conditions                                                                                                                               : Named chr [1:2] "290" "294"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Psychoses                                                                                                                                            : Named chr [1:2] "295" "299"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neurotic Disorders, Personality Disorders, And Other Nonpsychotic Mental Disorders                                                                         : Named chr [1:2] "300" "316"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Intellectual Disabilities                                                                                                                                  : Named chr [1:2] "317" "319"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Inflammatory Diseases Of The Central Nervous System                                                                                                        : Named chr [1:2] "320" "326"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Organic Sleep Disorders                                                                                                                                    : Named chr [1:2] "327" "327"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Hereditary And Degenerative Diseases Of The Central Nervous System                                                                                         : Named chr [1:2] "330" "337"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Pain                                                                                                                                                       : Named chr [1:2] "338" "338"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Headache Syndromes                                                                                                                                   : Named chr [1:2] "339" "339"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of The Central Nervous System                                                                                                              : Named chr [1:2] "340" "349"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of The Peripheral Nervous System                                                                                                                 : Named chr [1:2] "350" "359"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of The Eye And Adnexa                                                                                                                            : Named chr [1:2] "360" "379"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of The Ear And Mastoid Process                                                                                                                    : Named chr [1:2] "380" "389"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Acute Rheumatic Fever                                                                                                                                      : Named chr [1:2] "390" "392"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Chronic Rheumatic Heart Disease                                                                                                                            : Named chr [1:2] "393" "398"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Hypertensive Disease                                                                                                                                       : Named chr [1:2] "401" "405"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Ischemic Heart Disease                                                                                                                                     : Named chr [1:2] "410" "414"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Pulmonary Circulation                                                                                                                          : Named chr [1:2] "415" "417"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Forms Of Heart Disease                                                                                                                               : Named chr [1:2] "420" "429"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Cerebrovascular Disease                                                                                                                                    : Named chr [1:2] "430" "438"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Arteries, Arterioles, And Capillaries                                                                                                          : Named chr [1:2] "440" "449"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Veins And Lymphatics, And Other Diseases Of Circulatory System                                                                                 : Named chr [1:2] "451" "459"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Acute Respiratory Infections                                                                                                                               : Named chr [1:2] "460" "466"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Of The Upper Respiratory Tract                                                                                                              : Named chr [1:2] "470" "478"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Pneumonia And Influenza                                                                                                                                    : Named chr [1:2] "480" "488"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Chronic Obstructive Pulmonary Disease And Allied Conditions                                                                                                : Named chr [1:2] "490" "496"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Pneumoconioses And Other Lung Diseases Due To External Agents                                                                                              : Named chr [1:2] "500" "508"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Of Respiratory System                                                                                                                       : Named chr [1:2] "510" "519"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Oral Cavity, Salivary Glands, And Jaws                                                                                                         : Named chr [1:2] "520" "529"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Esophagus, Stomach, And Duodenum                                                                                                               : Named chr [1:2] "530" "539"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Appendicitis                                                                                                                                               : Named chr [1:2] "540" "543"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Hernia Of Abdominal Cavity                                                                                                                                 : Named chr [1:2] "550" "553"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Noninfectious Enteritis And Colitis                                                                                                                        : Named chr [1:2] "555" "558"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Of Intestines And Peritoneum                                                                                                                : Named chr [1:2] "560" "569"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Of Digestive System                                                                                                                         : Named chr [1:2] "570" "579"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Nephritis, Nephrotic Syndrome, And Nephrosis                                                                                                               : Named chr [1:2] "580" "589"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Of Urinary System                                                                                                                           : Named chr [1:2] "590" "599"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Male Genital Organs                                                                                                                            : Named chr [1:2] "600" "608"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Breast                                                                                                                                        : Named chr [1:2] "610" "612"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Inflammatory Disease Of Female Pelvic Organs                                                                                                               : Named chr [1:2] "614" "616"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of Female Genital Tract                                                                                                                    : Named chr [1:2] "617" "629"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Ectopic And Molar Pregnancy                                                                                                                                : Named chr [1:2] "630" "633"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Pregnancy With Abortive Outcome                                                                                                                      : Named chr [1:2] "634" "639"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Complications Mainly Related To Pregnancy                                                                                                                  : Named chr [1:2] "640" "649"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Normal Delivery, And Other Indications For Care In Pregnancy, Labor, And Delivery                                                                          : Named chr [1:2] "650" "659"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Complications Occurring Mainly In The Course Of Labor And Delivery                                                                                         : Named chr [1:2] "660" "669"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Complications Of The Puerperium                                                                                                                            : Named chr [1:2] "670" "677"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Maternal And Fetal Complications                                                                                                                     : Named chr [1:2] "678" "679"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Infections Of Skin And Subcutaneous Tissue                                                                                                                 : Named chr [1:2] "680" "686"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Inflammatory Conditions Of Skin And Subcutaneous Tissue                                                                                              : Named chr [1:2] "690" "698"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Of Skin And Subcutaneous Tissue                                                                                                             : Named chr [1:2] "700" "709"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Arthropathies And Related Disorders                                                                                                                        : Named chr [1:2] "710" "719"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Dorsopathies                                                                                                                                               : Named chr [1:2] "720" "724"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Rheumatism, Excluding The Back                                                                                                                             : Named chr [1:2] "725" "729"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Osteopathies, Chondropathies, And Acquired Musculoskeletal Deformities                                                                                     : Named chr [1:2] "730" "739"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Congenital Anomalies                                                                                                                                       : Named chr [1:2] "740" "759"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Maternal Causes Of Perinatal Morbidity And Mortality                                                                                                       : Named chr [1:2] "760" "763"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Conditions Originating In The Perinatal Period                                                                                                       : Named chr [1:2] "764" "779"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Symptoms                                                                                                                                                   : Named chr [1:2] "780" "789"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Nonspecific Abnormal Findings                                                                                                                              : Named chr [1:2] "790" "796"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Ill-Defined And Unknown Causes Of Morbidity And Mortality                                                                                                  : Named chr [1:2] "797" "799"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Fracture Of Skull                                                                                                                                          : Named chr [1:2] "800" "804"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Fracture Of Neck And Trunk                                                                                                                                 : Named chr [1:2] "805" "809"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Fracture Of Upper Limb                                                                                                                                     : Named chr [1:2] "810" "819"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Fracture Of Lower Limb                                                                                                                                     : Named chr [1:2] "820" "829"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Dislocation                                                                                                                                                : Named chr [1:2] "830" "839"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#   [list output truncated]



icd9_majors |> str() #----
# > icd9_majors |> str() #----  
#  Named chr [1:1234] "001" "002" "003" "004" "005" "006" "007" "008" "009" "010" "011" "012" "013" "014" "015" "016" "017" "018" "020" "021" "022" "023" "024" ...
#  - attr(*, "names")= chr [1:1234] "Cholera" "Typhoid and paratyphoid fevers" "Other salmonella infections" "Shigellosis" ...





icd9_map_ahrq |> str() #----
icd9_map_cc |> str() #----
icd9_map_charlson |> str() #----
icd9_map_elix |> str() #----
icd9_map_multi_ccs |> str() #----
icd9_map_pccc_dx |> str() #----
icd9_map_pccc_pcs |> str() #----
icd9_map_quan_deyo |> str() #----




# #@ icd9_chapters.expand_range = icd9_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])}) ------  
# icd9_chapters.expand_range = icd9_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])})
# icd9_chapters.expand_range |> str() #----  
# # icd9_chapters.expand_range.ICD9_3char = icd9_chapters.expand_range %>% map(function(x) unique(substr(x, 1, 3)))
# # icd9_chapters.expand_range.ICD9_3char |> str() #----  
# 
# # > icd9_chapters.expand_range = icd9_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])})
# # Error in icd9_expand_range_short(start, end, defined, ex_ambig_start,  : 
# #   is_defined(end, short_code = TRUE) is not TRUE
# # Called from: icd9_expand_range_short(start, end, defined, ex_ambig_start, 
# #     ex_ambig_end)
# 
# 
# 
# icd9_chapters |> str(max.level = 2, give.attr = TRUE)
# 
# ?icd:::expand_range.icd9
# ?icd::guess_short
# icd9_chapters$Neoplasms |> str(max.level = 2, give.attr = TRUE)
# 
# icd9_chapters$Neoplasms %>% {icd:::expand_range.icd9(.[1], .[2])} |> str(max.level = 2, give.attr = TRUE)
# icd9_chapters$`Injury And Poisoning` %>% {icd:::expand_range.icd9(.[1], .[2])} |> str(max.level = 2, give.attr = TRUE)
# icd9_chapters$`Supplementary Classification Of Factors Influencing Health Status And Contact With Health Services` %>% {icd:::expand_range.icd9(.[1], .[2])} |> str(max.level = 2, give.attr = TRUE)
# icd9_chapters$`Supplementary Classification Of External Causes Of Injury And Poisoning` %>% {icd:::expand_range.icd9(.[1], .[2])} |> str(max.level = 2, give.attr = TRUE)
# 
# 
# is_defined("V01")
# is_defined("V91")
# is_defined("V98")
# is_defined("V99")
# is_defined(paste0("V", 10:99))
# # > is_defined("V01")
# # [1] TRUE
# # > is_defined("V91")
# # [1] TRUE
# # > is_defined("V98")
# # [1] FALSE
# # > is_defined("V99")
# # [1] FALSE
# # > is_defined(paste0("V", 10:99))
# #  [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
# # [20]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
# # [39]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
# # [58]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
# # [77]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE



## @ icd9_chapters.expand_range = icd9_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])}) ------  
# icd9_chapters.expand_range = icd9_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])})
icd9_chapters.expand_range = icd9_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], ifelse(x[2] != "V99", x[2], "V91"))})
icd9_chapters.expand_range |> str() #----
# > icd9_chapters.expand_range |> str() #----  
# List of 19
#  $ Infectious And Parasitic Diseases                                                                 : 'icd9' chr [1:1510] "001" "0010" "0011" "0019" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neoplasms                                                                                         : 'icd9' chr [1:1156] "140" "1400" "1401" "1403" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Endocrine, Nutritional And Metabolic Diseases, And Immunity Disorders                             : 'icd9' chr [1:416] "240" "2400" "2409" "241" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Blood And Blood-Forming Organs                                                    : 'icd9' chr [1:148] "280" "2800" "2801" "2808" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mental Disorders                                                                                  : 'icd9' chr [1:585] "290" "2900" "2901" "29010" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Nervous System And Sense Organs                                                   : 'icd9' chr [1:1714] "320" "3200" "3201" "3202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Circulatory System                                                                : 'icd9' chr [1:608] "390" "391" "3910" "3911" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Respiratory System                                                                : 'icd9' chr [1:320] "460" "461" "4610" "4611" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Digestive System                                                                  : 'icd9' chr [1:757] "520" "5200" "5201" "5202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Genitourinary System                                                              : 'icd9' chr [1:473] "580" "5800" "5804" "5808" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Complications Of Pregnancy, Childbirth, And The Puerperium                                        : 'icd9' chr [1:1455] "630" "631" "6310" "6318" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Skin And Subcutaneous Tissue                                                      : 'icd9' chr [1:246] "680" "6800" "6801" "6802" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Musculoskeletal System And Connective Tissue                                      : 'icd9' chr [1:1031] "710" "7100" "7101" "7102" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Congenital Anomalies                                                                              : 'icd9' chr [1:500] "740" "7400" "7401" "7402" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Certain Conditions Originating In The Perinatal Period                                            : 'icd9' chr [1:322] "760" "7600" "7601" "7602" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Symptoms, Signs, And Ill-Defined Conditions                                                       : 'icd9' chr [1:443] "780" "7800" "78001" "78002" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Injury And Poisoning                                                                              : 'icd9' chr [1:3057] "800" "8000" "80000" "80001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Supplementary Classification Of Factors Influencing Health Status And Contact With Health Services: 'icd9' chr [1:1357] "V01" "V010" "V011" "V012" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Supplementary Classification Of External Causes Of Injury And Poisoning                           : 'icd9' chr [1:1463] "E000" "E0000" "E0001" "E0002" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE


icd9_chapters.expand_range.ICD9_3char = icd9_chapters.expand_range %>% map(function(x) unique(substr(x, 1, 3)))
icd9_chapters.expand_range.ICD9_3char |> str() #----
# > icd9_chapters.expand_range.ICD9_3char |> str() #----  
# List of 19
#  $ Infectious And Parasitic Diseases                                                                 : chr [1:123] "001" "002" "003" "004" ...
#  $ Neoplasms                                                                                         : chr [1:94] "140" "141" "142" "143" ...
#  $ Endocrine, Nutritional And Metabolic Diseases, And Immunity Disorders                             : chr [1:38] "240" "241" "242" "243" ...
#  $ Diseases Of The Blood And Blood-Forming Organs                                                    : chr [1:10] "280" "281" "282" "283" ...
#  $ Mental Disorders                                                                                  : chr [1:30] "290" "291" "292" "293" ...
#  $ Diseases Of The Nervous System And Sense Organs                                                   : chr [1:68] "320" "321" "322" "323" ...
#  $ Diseases Of The Circulatory System                                                                : chr [1:60] "390" "391" "392" "393" ...
#  $ Diseases Of The Respiratory System                                                                : chr [1:51] "460" "461" "462" "463" ...
#  $ Diseases Of The Digestive System                                                                  : chr [1:50] "520" "521" "522" "523" ...
#  $ Diseases Of The Genitourinary System                                                              : chr [1:48] "580" "581" "582" "583" ...
#  $ Complications Of Pregnancy, Childbirth, And The Puerperium                                        : chr [1:50] "630" "631" "632" "633" ...
#  $ Diseases Of The Skin And Subcutaneous Tissue                                                      : chr [1:26] "680" "681" "682" "683" ...
#  $ Diseases Of The Musculoskeletal System And Connective Tissue                                      : chr [1:30] "710" "711" "712" "713" ...
#  $ Congenital Anomalies                                                                              : chr [1:20] "740" "741" "742" "743" ...
#  $ Certain Conditions Originating In The Perinatal Period                                            : chr [1:20] "760" "761" "762" "763" ...
#  $ Symptoms, Signs, And Ill-Defined Conditions                                                       : chr [1:20] "780" "781" "782" "783" ...
#  $ Injury And Poisoning                                                                              : chr [1:190] "800" "801" "802" "803" ...
#  $ Supplementary Classification Of Factors Influencing Health Status And Contact With Health Services: chr [1:90] "V01" "V02" "V03" "V04" ...
#  $ Supplementary Classification Of External Causes Of Injury And Poisoning                           : chr [1:24] "E00" "E01" "E02" "E03" ...







## @ icd9_sub_chapters.expand_range = icd9_sub_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])}) ----  
icd9_sub_chapters.expand_range = icd9_sub_chapters %>% map(function(x) {icd:::expand_range.icd9(x[1], x[2])})
icd9_sub_chapters.expand_range |> str() #----
# > icd9_sub_chapters.expand_range |> str() #----  
# List of 162
#  $ Intestinal Infectious Diseases                                                                                                                             : 'icd9' chr [1:94] "001" "0010" "0011" "0019" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Tuberculosis                                                                                                                                               : 'icd9' chr [1:489] "010" "0100" "01000" "01001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Zoonotic Bacterial Diseases                                                                                                                                : 'icd9' chr [1:42] "020" "0200" "0201" "0202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Bacterial Diseases                                                                                                                                   : 'icd9' chr [1:122] "030" "0300" "0301" "0302" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Human Immunodeficiency Virus (Hiv) Infection                                                                                                               : 'icd9' chr "042"
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Poliomyelitis And Other Non-Arthropod-Borne Viral Diseases And Prion Diseases Of Central Nervous System                                                    : 'icd9' chr [1:45] "045" "0450" "04500" "04501" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Viral Diseases Generally Accompanied By Exanthem                                                                                                           : 'icd9' chr [1:116] "050" "0500" "0501" "0502" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Arthropod-Borne Viral Diseases                                                                                                                             : 'icd9' chr [1:41] "060" "0600" "0601" "0609" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Due To Viruses And Chlamydiae                                                                                                               : 'icd9' chr [1:112] "070" "0700" "0701" "0702" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Rickettsioses And Other Arthropod-Borne Diseases                                                                                                           : 'icd9' chr [1:61] "080" "081" "0810" "0811" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Syphilis And Other Venereal Diseases                                                                                                                       : 'icd9' chr [1:147] "090" "0900" "0901" "0902" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Spirochetal Diseases                                                                                                                                 : 'icd9' chr [1:28] "100" "1000" "1008" "10081" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mycoses                                                                                                                                                    : 'icd9' chr [1:81] "110" "1100" "1101" "1102" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Helminthiases                                                                                                                                              : 'icd9' chr [1:73] "120" "1200" "1201" "1202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Infectious And Parasitic Diseases                                                                                                                    : 'icd9' chr [1:47] "130" "1300" "1301" "1302" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Late Effects Of Infectious And Parasitic Diseases                                                                                                          : 'icd9' chr [1:11] "137" "1370" "1371" "1372" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Lip, Oral Cavity, And Pharynx                                                                                                        : 'icd9' chr [1:75] "140" "1400" "1401" "1403" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Digestive Organs And Peritoneum                                                                                                      : 'icd9' chr [1:70] "150" "1500" "1501" "1502" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Respiratory And Intrathoracic Organs                                                                                                 : 'icd9' chr [1:40] "160" "1600" "1601" "1602" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Bone, Connective Tissue, Skin, And Breast                                                                                            : 'icd9' chr [1:105] "170" "1700" "1701" "1702" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Genitourinary Organs                                                                                                                 : 'icd9' chr [1:60] "179" "180" "1800" "1801" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Other And Unspecified Sites                                                                                                          : 'icd9' chr [1:83] "190" "1900" "1901" "1902" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasm Of Lymphatic And Hematopoietic Tissue                                                                                                   : 'icd9' chr [1:391] "200" "2000" "20000" "20001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neuroendocrine Tumors                                                                                                                                      : 'icd9' chr [1:65] "209" "2090" "20900" "20901" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Benign Neoplasms                                                                                                                                           : 'icd9' chr [1:150] "210" "2100" "2101" "2102" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Carcinoma In Situ                                                                                                                                          : 'icd9' chr [1:46] "230" "2300" "2301" "2302" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neoplasms Of Uncertain Behavior                                                                                                                            : 'icd9' chr [1:58] "235" "2350" "2351" "2352" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neoplasms Of Unspecified Nature                                                                                                                            : 'icd9' chr [1:13] "239" "2390" "2391" "2392" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Thyroid Gland                                                                                                                                 : 'icd9' chr [1:52] "240" "2400" "2409" "241" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Other Endocrine Glands                                                                                                                         : 'icd9' chr [1:169] "249" "2490" "24900" "24901" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Nutritional Deficiencies                                                                                                                                   : 'icd9' chr [1:42] "260" "261" "262" "263" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Metabolic And Immunity Disorders                                                                                                                     : 'icd9' chr [1:153] "270" "2700" "2701" "2702" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Blood And Blood-Forming Organs                                                                                                             : 'icd9' chr [1:148] "280" "2800" "2801" "2808" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Organic Psychotic Conditions                                                                                                                               : 'icd9' chr [1:64] "290" "2900" "2901" "29010" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Psychoses                                                                                                                                            : 'icd9' chr [1:165] "295" "2950" "29500" "29501" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neurotic Disorders, Personality Disorders, And Other Nonpsychotic Mental Disorders                                                                         : 'icd9' chr [1:350] "300" "3000" "30000" "30001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Intellectual Disabilities                                                                                                                                  : 'icd9' chr [1:6] "317" "318" "3180" "3181" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Inflammatory Diseases Of The Central Nervous System                                                                                                        : 'icd9' chr [1:52] "320" "3200" "3201" "3202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Organic Sleep Disorders                                                                                                                                    : 'icd9' chr [1:47] "327" "3270" "32700" "32701" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Hereditary And Degenerative Diseases Of The Central Nervous System                                                                                         : 'icd9' chr [1:96] "330" "3300" "3301" "3302" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Pain                                                                                                                                                       : 'icd9' chr [1:14] "338" "3380" "3381" "33811" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Headache Syndromes                                                                                                                                   : 'icd9' chr [1:30] "339" "3390" "33900" "33901" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of The Central Nervous System                                                                                                              : 'icd9' chr [1:173] "340" "341" "3410" "3411" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of The Peripheral Nervous System                                                                                                                 : 'icd9' chr [1:105] "350" "3501" "3502" "3508" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of The Eye And Adnexa                                                                                                                            : 'icd9' chr [1:956] "360" "3600" "36000" "36001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of The Ear And Mastoid Process                                                                                                                    : 'icd9' chr [1:241] "380" "3800" "38000" "38001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Acute Rheumatic Fever                                                                                                                                      : 'icd9' chr [1:10] "390" "391" "3910" "3911" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Chronic Rheumatic Heart Disease                                                                                                                            : 'icd9' chr [1:28] "393" "394" "3940" "3941" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Hypertensive Disease                                                                                                                                       : 'icd9' chr [1:50] "401" "4010" "4011" "4019" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Ischemic Heart Disease                                                                                                                                     : 'icd9' chr [1:72] "410" "4100" "41000" "41001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Pulmonary Circulation                                                                                                                          : 'icd9' chr [1:18] "415" "4150" "4151" "41511" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Forms Of Heart Disease                                                                                                                               : 'icd9' chr [1:124] "420" "4200" "4209" "42090" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Cerebrovascular Disease                                                                                                                                    : 'icd9' chr [1:90] "430" "431" "432" "4320" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Arteries, Arterioles, And Capillaries                                                                                                          : 'icd9' chr [1:108] "440" "4400" "4401" "4402" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Veins And Lymphatics, And Other Diseases Of Circulatory System                                                                                 : 'icd9' chr [1:108] "451" "4510" "4511" "45111" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Acute Respiratory Infections                                                                                                                               : 'icd9' chr [1:36] "460" "461" "4610" "4611" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Of The Upper Respiratory Tract                                                                                                              : 'icd9' chr [1:69] "470" "471" "4710" "4711" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Pneumonia And Influenza                                                                                                                                    : 'icd9' chr [1:59] "480" "4800" "4801" "4802" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Chronic Obstructive Pulmonary Disease And Allied Conditions                                                                                                : 'icd9' chr [1:48] "490" "491" "4910" "4911" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Pneumoconioses And Other Lung Diseases Due To External Agents                                                                                              : 'icd9' chr [1:23] "500" "501" "502" "503" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Of Respiratory System                                                                                                                       : 'icd9' chr [1:85] "510" "5100" "5109" "511" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Oral Cavity, Salivary Glands, And Jaws                                                                                                         : 'icd9' chr [1:264] "520" "5200" "5201" "5202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Esophagus, Stomach, And Duodenum                                                                                                               : 'icd9' chr [1:198] "530" "5300" "5301" "53010" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Appendicitis                                                                                                                                               : 'icd9' chr [1:9] "540" "5400" "5401" "5409" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Hernia Of Abdominal Cavity                                                                                                                                 : 'icd9' chr [1:58] "550" "5500" "55000" "55001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Noninfectious Enteritis And Colitis                                                                                                                        : 'icd9' chr [1:27] "555" "5550" "5551" "5552" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Of Intestines And Peritoneum                                                                                                                : 'icd9' chr [1:99] "560" "5600" "5601" "5602" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Of Digestive System                                                                                                                         : 'icd9' chr [1:102] "570" "571" "5710" "5711" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Nephritis, Nephrotic Syndrome, And Nephrosis                                                                                                               : 'icd9' chr [1:63] "580" "5800" "5804" "5808" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Of Urinary System                                                                                                                           : 'icd9' chr [1:109] "590" "5900" "59000" "59001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Male Genital Organs                                                                                                                            : 'icd9' chr [1:80] "600" "6000" "60000" "60001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Breast                                                                                                                                        : 'icd9' chr [1:29] "610" "6100" "6101" "6102" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Inflammatory Disease Of Female Pelvic Organs                                                                                                               : 'icd9' chr [1:30] "614" "6140" "6141" "6142" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of Female Genital Tract                                                                                                                    : 'icd9' chr [1:162] "617" "6170" "6171" "6172" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Ectopic And Molar Pregnancy                                                                                                                                : 'icd9' chr [1:21] "630" "631" "6310" "6318" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Pregnancy With Abortive Outcome                                                                                                                      : 'icd9' chr [1:185] "634" "6340" "63400" "63401" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Complications Mainly Related To Pregnancy                                                                                                                  : 'icd9' chr [1:350] "640" "6400" "64000" "64001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Normal Delivery, And Other Indications For Care In Pregnancy, Labor, And Delivery                                                                          : 'icd9' chr [1:340] "650" "651" "6510" "65100" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Complications Occurring Mainly In The Course Of Labor And Delivery                                                                                         : 'icd9' chr [1:309] "660" "6600" "66000" "66001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Complications Of The Puerperium                                                                                                                            : 'icd9' chr [1:228] "670" "6700" "67000" "67002" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Maternal And Fetal Complications                                                                                                                     : 'icd9' chr [1:22] "678" "6780" "67800" "67801" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Infections Of Skin And Subcutaneous Tissue                                                                                                                 : 'icd9' chr [1:44] "680" "6800" "6801" "6802" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Inflammatory Conditions Of Skin And Subcutaneous Tissue                                                                                              : 'icd9' chr [1:101] "690" "6901" "69010" "69011" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Of Skin And Subcutaneous Tissue                                                                                                             : 'icd9' chr [1:101] "700" "701" "7010" "7011" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Arthropathies And Related Disorders                                                                                                                        : 'icd9' chr [1:575] "710" "7100" "7101" "7102" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Dorsopathies                                                                                                                                               : 'icd9' chr [1:84] "720" "7200" "7201" "7202" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Rheumatism, Excluding The Back                                                                                                                             : 'icd9' chr [1:128] "725" "726" "7260" "7261" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Osteopathies, Chondropathies, And Acquired Musculoskeletal Deformities                                                                                     : 'icd9' chr [1:244] "730" "7300" "73000" "73001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Congenital Anomalies                                                                                                                                       : 'icd9' chr [1:500] "740" "7400" "7401" "7402" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Maternal Causes Of Perinatal Morbidity And Mortality                                                                                                       : 'icd9' chr [1:63] "760" "7600" "7601" "7602" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Conditions Originating In The Perinatal Period                                                                                                       : 'icd9' chr [1:259] "764" "7640" "76400" "76401" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Symptoms                                                                                                                                                   : 'icd9' chr [1:267] "780" "7800" "78001" "78002" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Nonspecific Abnormal Findings                                                                                                                              : 'icd9' chr [1:144] "790" "7900" "79001" "79009" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Ill-Defined And Unknown Causes Of Morbidity And Mortality                                                                                                  : 'icd9' chr [1:32] "797" "798" "7980" "7981" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Fracture Of Skull                                                                                                                                          : 'icd9' chr [1:395] "800" "8000" "80000" "80001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Fracture Of Neck And Trunk                                                                                                                                 : 'icd9' chr [1:138] "805" "8050" "80500" "80501" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Fracture Of Upper Limb                                                                                                                                     : 'icd9' chr [1:171] "810" "8100" "81000" "81001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Fracture Of Lower Limb                                                                                                                                     : 'icd9' chr [1:116] "820" "8200" "82000" "82001" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Dislocation                                                                                                                                                : 'icd9' chr [1:158] "830" "8300" "8301" "831" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#   [list output truncated]


icd9_sub_chapters.expand_range.ICD9_3char = icd9_sub_chapters.expand_range %>% map(function(x) unique(substr(x, 1, 3)))
icd9_sub_chapters.expand_range.ICD9_3char |> str() #----
# > icd9_sub_chapters.expand_range.ICD9_3char |> str() #----  
# List of 162
#  $ Intestinal Infectious Diseases                                                                                                                             : chr [1:9] "001" "002" "003" "004" ...
#  $ Tuberculosis                                                                                                                                               : chr [1:9] "010" "011" "012" "013" ...
#  $ Zoonotic Bacterial Diseases                                                                                                                                : chr [1:8] "020" "021" "022" "023" ...
#  $ Other Bacterial Diseases                                                                                                                                   : chr [1:12] "030" "031" "032" "033" ...
#  $ Human Immunodeficiency Virus (Hiv) Infection                                                                                                               : chr "042"
#  $ Poliomyelitis And Other Non-Arthropod-Borne Viral Diseases And Prion Diseases Of Central Nervous System                                                    : chr [1:5] "045" "046" "047" "048" ...
#  $ Viral Diseases Generally Accompanied By Exanthem                                                                                                           : chr [1:10] "050" "051" "052" "053" ...
#  $ Arthropod-Borne Viral Diseases                                                                                                                             : chr [1:7] "060" "061" "062" "063" ...
#  $ Other Diseases Due To Viruses And Chlamydiae                                                                                                               : chr [1:10] "070" "071" "072" "073" ...
#  $ Rickettsioses And Other Arthropod-Borne Diseases                                                                                                           : chr [1:9] "080" "081" "082" "083" ...
#  $ Syphilis And Other Venereal Diseases                                                                                                                       : chr [1:10] "090" "091" "092" "093" ...
#  $ Other Spirochetal Diseases                                                                                                                                 : chr [1:5] "100" "101" "102" "103" ...
#  $ Mycoses                                                                                                                                                    : chr [1:8] "110" "111" "112" "114" ...
#  $ Helminthiases                                                                                                                                              : chr [1:10] "120" "121" "122" "123" ...
#  $ Other Infectious And Parasitic Diseases                                                                                                                    : chr [1:7] "130" "131" "132" "133" ...
#  $ Late Effects Of Infectious And Parasitic Diseases                                                                                                          : chr [1:3] "137" "138" "139"
#  $ Malignant Neoplasm Of Lip, Oral Cavity, And Pharynx                                                                                                        : chr [1:10] "140" "141" "142" "143" ...
#  $ Malignant Neoplasm Of Digestive Organs And Peritoneum                                                                                                      : chr [1:10] "150" "151" "152" "153" ...
#  $ Malignant Neoplasm Of Respiratory And Intrathoracic Organs                                                                                                 : chr [1:6] "160" "161" "162" "163" ...
#  $ Malignant Neoplasm Of Bone, Connective Tissue, Skin, And Breast                                                                                            : chr [1:7] "170" "171" "172" "173" ...
#  $ Malignant Neoplasm Of Genitourinary Organs                                                                                                                 : chr [1:11] "179" "180" "181" "182" ...
#  $ Malignant Neoplasm Of Other And Unspecified Sites                                                                                                          : chr [1:10] "190" "191" "192" "193" ...
#  $ Malignant Neoplasm Of Lymphatic And Hematopoietic Tissue                                                                                                   : chr [1:9] "200" "201" "202" "203" ...
#  $ Neuroendocrine Tumors                                                                                                                                      : chr "209"
#  $ Benign Neoplasms                                                                                                                                           : chr [1:20] "210" "211" "212" "213" ...
#  $ Carcinoma In Situ                                                                                                                                          : chr [1:5] "230" "231" "232" "233" ...
#  $ Neoplasms Of Uncertain Behavior                                                                                                                            : chr [1:4] "235" "236" "237" "238"
#  $ Neoplasms Of Unspecified Nature                                                                                                                            : chr "239"
#  $ Disorders Of Thyroid Gland                                                                                                                                 : chr [1:7] "240" "241" "242" "243" ...
#  $ Diseases Of Other Endocrine Glands                                                                                                                         : chr [1:11] "249" "250" "251" "252" ...
#  $ Nutritional Deficiencies                                                                                                                                   : chr [1:10] "260" "261" "262" "263" ...
#  $ Other Metabolic And Immunity Disorders                                                                                                                     : chr [1:10] "270" "271" "272" "273" ...
#  $ Diseases Of The Blood And Blood-Forming Organs                                                                                                             : chr [1:10] "280" "281" "282" "283" ...
#  $ Organic Psychotic Conditions                                                                                                                               : chr [1:5] "290" "291" "292" "293" ...
#  $ Other Psychoses                                                                                                                                            : chr [1:5] "295" "296" "297" "298" ...
#  $ Neurotic Disorders, Personality Disorders, And Other Nonpsychotic Mental Disorders                                                                         : chr [1:17] "300" "301" "302" "303" ...
#  $ Intellectual Disabilities                                                                                                                                  : chr [1:3] "317" "318" "319"
#  $ Inflammatory Diseases Of The Central Nervous System                                                                                                        : chr [1:7] "320" "321" "322" "323" ...
#  $ Organic Sleep Disorders                                                                                                                                    : chr "327"
#  $ Hereditary And Degenerative Diseases Of The Central Nervous System                                                                                         : chr [1:8] "330" "331" "332" "333" ...
#  $ Pain                                                                                                                                                       : chr "338"
#  $ Other Headache Syndromes                                                                                                                                   : chr "339"
#  $ Other Disorders Of The Central Nervous System                                                                                                              : chr [1:10] "340" "341" "342" "343" ...
#  $ Disorders Of The Peripheral Nervous System                                                                                                                 : chr [1:10] "350" "351" "352" "353" ...
#  $ Disorders Of The Eye And Adnexa                                                                                                                            : chr [1:20] "360" "361" "362" "363" ...
#  $ Diseases Of The Ear And Mastoid Process                                                                                                                    : chr [1:10] "380" "381" "382" "383" ...
#  $ Acute Rheumatic Fever                                                                                                                                      : chr [1:3] "390" "391" "392"
#  $ Chronic Rheumatic Heart Disease                                                                                                                            : chr [1:6] "393" "394" "395" "396" ...
#  $ Hypertensive Disease                                                                                                                                       : chr [1:5] "401" "402" "403" "404" ...
#  $ Ischemic Heart Disease                                                                                                                                     : chr [1:5] "410" "411" "412" "413" ...
#  $ Diseases Of Pulmonary Circulation                                                                                                                          : chr [1:3] "415" "416" "417"
#  $ Other Forms Of Heart Disease                                                                                                                               : chr [1:10] "420" "421" "422" "423" ...
#  $ Cerebrovascular Disease                                                                                                                                    : chr [1:9] "430" "431" "432" "433" ...
#  $ Diseases Of Arteries, Arterioles, And Capillaries                                                                                                          : chr [1:10] "440" "441" "442" "443" ...
#  $ Diseases Of Veins And Lymphatics, And Other Diseases Of Circulatory System                                                                                 : chr [1:9] "451" "452" "453" "454" ...
#  $ Acute Respiratory Infections                                                                                                                               : chr [1:7] "460" "461" "462" "463" ...
#  $ Other Diseases Of The Upper Respiratory Tract                                                                                                              : chr [1:9] "470" "471" "472" "473" ...
#  $ Pneumonia And Influenza                                                                                                                                    : chr [1:9] "480" "481" "482" "483" ...
#  $ Chronic Obstructive Pulmonary Disease And Allied Conditions                                                                                                : chr [1:7] "490" "491" "492" "493" ...
#  $ Pneumoconioses And Other Lung Diseases Due To External Agents                                                                                              : chr [1:9] "500" "501" "502" "503" ...
#  $ Other Diseases Of Respiratory System                                                                                                                       : chr [1:10] "510" "511" "512" "513" ...
#  $ Diseases Of Oral Cavity, Salivary Glands, And Jaws                                                                                                         : chr [1:10] "520" "521" "522" "523" ...
#  $ Diseases Of Esophagus, Stomach, And Duodenum                                                                                                               : chr [1:10] "530" "531" "532" "533" ...
#  $ Appendicitis                                                                                                                                               : chr [1:4] "540" "541" "542" "543"
#  $ Hernia Of Abdominal Cavity                                                                                                                                 : chr [1:4] "550" "551" "552" "553"
#  $ Noninfectious Enteritis And Colitis                                                                                                                        : chr [1:4] "555" "556" "557" "558"
#  $ Other Diseases Of Intestines And Peritoneum                                                                                                                : chr [1:8] "560" "562" "564" "565" ...
#  $ Other Diseases Of Digestive System                                                                                                                         : chr [1:10] "570" "571" "572" "573" ...
#  $ Nephritis, Nephrotic Syndrome, And Nephrosis                                                                                                               : chr [1:10] "580" "581" "582" "583" ...
#  $ Other Diseases Of Urinary System                                                                                                                           : chr [1:10] "590" "591" "592" "593" ...
#  $ Diseases Of Male Genital Organs                                                                                                                            : chr [1:9] "600" "601" "602" "603" ...
#  $ Disorders Of Breast                                                                                                                                        : chr [1:3] "610" "611" "612"
#  $ Inflammatory Disease Of Female Pelvic Organs                                                                                                               : chr [1:3] "614" "615" "616"
#  $ Other Disorders Of Female Genital Tract                                                                                                                    : chr [1:13] "617" "618" "619" "620" ...
#  $ Ectopic And Molar Pregnancy                                                                                                                                : chr [1:4] "630" "631" "632" "633"
#  $ Other Pregnancy With Abortive Outcome                                                                                                                      : chr [1:6] "634" "635" "636" "637" ...
#  $ Complications Mainly Related To Pregnancy                                                                                                                  : chr [1:10] "640" "641" "642" "643" ...
#  $ Normal Delivery, And Other Indications For Care In Pregnancy, Labor, And Delivery                                                                          : chr [1:10] "650" "651" "652" "653" ...
#  $ Complications Occurring Mainly In The Course Of Labor And Delivery                                                                                         : chr [1:10] "660" "661" "662" "663" ...
#  $ Complications Of The Puerperium                                                                                                                            : chr [1:8] "670" "671" "672" "673" ...
#  $ Other Maternal And Fetal Complications                                                                                                                     : chr [1:2] "678" "679"
#  $ Infections Of Skin And Subcutaneous Tissue                                                                                                                 : chr [1:7] "680" "681" "682" "683" ...
#  $ Other Inflammatory Conditions Of Skin And Subcutaneous Tissue                                                                                              : chr [1:9] "690" "691" "692" "693" ...
#  $ Other Diseases Of Skin And Subcutaneous Tissue                                                                                                             : chr [1:10] "700" "701" "702" "703" ...
#  $ Arthropathies And Related Disorders                                                                                                                        : chr [1:10] "710" "711" "712" "713" ...
#  $ Dorsopathies                                                                                                                                               : chr [1:5] "720" "721" "722" "723" ...
#  $ Rheumatism, Excluding The Back                                                                                                                             : chr [1:5] "725" "726" "727" "728" ...
#  $ Osteopathies, Chondropathies, And Acquired Musculoskeletal Deformities                                                                                     : chr [1:10] "730" "731" "732" "733" ...
#  $ Congenital Anomalies                                                                                                                                       : chr [1:20] "740" "741" "742" "743" ...
#  $ Maternal Causes Of Perinatal Morbidity And Mortality                                                                                                       : chr [1:4] "760" "761" "762" "763"
#  $ Other Conditions Originating In The Perinatal Period                                                                                                       : chr [1:16] "764" "765" "766" "767" ...
#  $ Symptoms                                                                                                                                                   : chr [1:10] "780" "781" "782" "783" ...
#  $ Nonspecific Abnormal Findings                                                                                                                              : chr [1:7] "790" "791" "792" "793" ...
#  $ Ill-Defined And Unknown Causes Of Morbidity And Mortality                                                                                                  : chr [1:3] "797" "798" "799"
#  $ Fracture Of Skull                                                                                                                                          : chr [1:5] "800" "801" "802" "803" ...
#  $ Fracture Of Neck And Trunk                                                                                                                                 : chr [1:5] "805" "806" "807" "808" ...
#  $ Fracture Of Upper Limb                                                                                                                                     : chr [1:10] "810" "811" "812" "813" ...
#  $ Fracture Of Lower Limb                                                                                                                                     : chr [1:10] "820" "821" "822" "823" ...
#  $ Dislocation                                                                                                                                                : chr [1:10] "830" "831" "832" "833" ...
#   [list output truncated]




## @ library(jsonlite) ----  

library(jsonlite)
  
  
# __________|------  
# ⸿ END-----  

library(jsonlite)
icd9_chapters %>% toJSON(pretty = T) %>% write("icd9_chapters.json")
icd9_sub_chapters %>% toJSON(pretty = T) %>% write("icd9_sub_chapters.json")


icd9_chapters.expand_range %>% toJSON(pretty = T) %>% write("icd9_chapters.expand_range.json")
icd9_chapters.expand_range.ICD9_3char %>% toJSON(pretty = T) %>% write("icd9_chapters.expand_range.ICD9_3char.json")


icd9_sub_chapters.expand_range %>% toJSON(pretty = T) %>% write("icd9_sub_chapters.expand_range.json")
icd9_sub_chapters.expand_range.ICD9_3char %>% toJSON(pretty = T) %>% write("icd9_sub_chapters.expand_range.ICD9_3char.json")

  
  
# __________|------  
# ⸿ END-----  

getwd()
.path4write = env1$path$path4write
.objectname = "icd9_chapters.expand_range"
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 )
.objectname = "icd9_chapters.expand_range.ICD9_3char"
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 )
.objectname = "icd9_sub_chapters.expand_range"
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 )
.objectname = "icd9_sub_chapters.expand_range.ICD9_3char"
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 )



