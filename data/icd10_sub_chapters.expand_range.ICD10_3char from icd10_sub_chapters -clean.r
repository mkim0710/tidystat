# icd10_sub_chapters.expand_range.ICD10_3char from icd10_sub_chapters .r

library(tidyverse)
library(icd)
packageVersion("icd")

# ?icd10_chapters
# ?icd10_sub_chapters
# ?icd10_comorbid
# ?icd10_comorbid_ahrq
# ?icd10_comorbid_ccs
# ?icd10_comorbid_charlson
# ?icd10_comorbid_elix
# ?icd10_comorbid_hcc
# ?icd10_comorbid_pccc_dx
# ?icd10_comorbid_pccc_pcs
# ?icd10_comorbid_quan_deyo
# ?icd10_comorbid_quan_elix
# ?icd10_comorbid_reduce


# ?icd10_map_ahrq
# ?icd10_map_ahrq_pcs
# ?icd10_map_cc
# ?icd10_map_ccs
# ?icd10_map_charlson
# ?icd10_map_elix
# ?icd10_map_pccc_dx
# ?icd10_map_pccc_pcs
# ?icd10_map_quan_deyo
# ?icd10_map_quan_elix


icd10cm2019 |> str() #-----
# > icd10cm2019 |> str() #-----
# 'data.frame':	94444 obs. of  8 variables:
#  $ code       : 'icd10cm' chr  "A00" "A000" "A001" "A009" ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ billable   : logi  FALSE TRUE TRUE TRUE FALSE FALSE ...
#  $ short_desc : chr  "Cholera" "Cholera due to Vibrio cholerae 01, biovar cholerae" "Cholera due to Vibrio cholerae 01, biovar eltor" "Cholera, unspecified" ...
#  $ long_desc  : chr  "Cholera" "Cholera due to Vibrio cholerae 01, biovar cholerae" "Cholera due to Vibrio cholerae 01, biovar eltor" "Cholera, unspecified" ...
#  $ three_digit: Factor w/ 1910 levels "A00","A01","A02",..: 1 1 1 1 2 2 2 2 2 2 ...
#  $ major      : Factor w/ 1910 levels "Abdominal and pelvic pain",..: 264 264 264 264 1825 1825 1825 1825 1825 1825 ...
#   ..- attr(*, "icd_short_diag")= logi TRUE
#  $ sub_chapter: Factor w/ 283 levels "Intestinal Infectious Diseases",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ chapter    : Factor w/ 21 levels "Certain infectious and parasitic diseases",..: 1 1 1 1 1 1 1 1 1 1 ...


icd10_chapters |> str() #-----
icd10_sub_chapters |> str() #----
# > icd10_chapters |> str() -----
# List of 21
#  $ Certain infectious and parasitic diseases                                                          : Named chr [1:2] "A00" "B99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neoplasms                                                                                          : Named chr [1:2] "C00" "D49"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism: Named chr [1:2] "D50" "D89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Endocrine, nutritional and metabolic diseases                                                      : Named chr [1:2] "E00" "E89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mental, Behavioral and Neurodevelopmental disorders                                                : Named chr [1:2] "F01" "F99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the nervous system                                                                     : Named chr [1:2] "G00" "G99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the eye and adnexa                                                                     : Named chr [1:2] "H00" "H59"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the ear and mastoid process                                                            : Named chr [1:2] "H60" "H95"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the circulatory system                                                                 : Named chr [1:2] "I00" "I99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the respiratory system                                                                 : Named chr [1:2] "J00" "J99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the digestive system                                                                   : Named chr [1:2] "K00" "K95"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the skin and subcutaneous tissue                                                       : Named chr [1:2] "L00" "L99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the musculoskeletal system and connective tissue                                       : Named chr [1:2] "M00" "M99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases of the genitourinary system                                                               : Named chr [1:2] "N00" "N99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Pregnancy, childbirth and the puerperium                                                           : Named chr [1:2] "O00" "O9A"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Certain conditions originating in the perinatal period                                             : Named chr [1:2] "P00" "P96"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Congenital malformations, deformations and chromosomal abnormalities                               : Named chr [1:2] "Q00" "Q99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified            : Named chr [1:2] "R00" "R99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Injury, poisoning and certain other consequences of external causes                                : Named chr [1:2] "S00" "T88"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ External causes of morbidity                                                                       : Named chr [1:2] "V00" "Y99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Factors influencing health status and contact with health services                                 : Named chr [1:2] "Z00" "Z99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
# > icd10_sub_chapters |> str() ----
# List of 279
#  $ Intestinal Infectious Diseases                                                                                                                                                : Named chr [1:2] "A00" "A09"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Tuberculosis                                                                                                                                                                  : Named chr [1:2] "A15" "A19"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Certain Zoonotic Bacterial Diseases                                                                                                                                           : Named chr [1:2] "A20" "A28"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Bacterial Diseases                                                                                                                                                      : Named chr [1:2] "A30" "A49"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Infections With A Predominantly Sexual Mode Of Transmission                                                                                                                   : Named chr [1:2] "A50" "A64"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Spirochetal Diseases                                                                                                                                                    : Named chr [1:2] "A65" "A69"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Diseases Caused By Chlamydiae                                                                                                                                           : Named chr [1:2] "A70" "A74"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Rickettsioses                                                                                                                                                                 : Named chr [1:2] "A75" "A79"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Viral And Prion Infections Of The Central Nervous System                                                                                                                      : Named chr [1:2] "A80" "A89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Arthropod-Borne Viral Fevers And Viral Hemorrhagic Fevers                                                                                                                     : Named chr [1:2] "A90" "A99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Viral Infections Characterized By Skin And Mucous Membrane Lesions                                                                                                            : Named chr [1:2] "B00" "B09"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Human Herpesviruses                                                                                                                                                     : Named chr [1:2] "B10" "B10"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Viral Hepatitis                                                                                                                                                               : Named chr [1:2] "B15" "B19"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Human Immunodeficiency Virus [HIV] Disease                                                                                                                                    : Named chr [1:2] "B20" "B20"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Viral Diseases                                                                                                                                                          : Named chr [1:2] "B25" "B34"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mycoses                                                                                                                                                                       : Named chr [1:2] "B35" "B49"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Protozoal Diseases                                                                                                                                                            : Named chr [1:2] "B50" "B64"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Helminthiases                                                                                                                                                                 : Named chr [1:2] "B65" "B83"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Pediculosis, Acariasis And Other Infestations                                                                                                                                 : Named chr [1:2] "B85" "B89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Sequelae Of Infectious And Parasitic Diseases                                                                                                                                 : Named chr [1:2] "B90" "B94"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Bacterial And Viral Infectious Agents                                                                                                                                         : Named chr [1:2] "B95" "B97"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Infectious Diseases                                                                                                                                                     : Named chr [1:2] "B99" "B99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Lip, Oral Cavity And Pharynx                                                                                                                           : Named chr [1:2] "C00" "C14"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Digestive Organs                                                                                                                                       : Named chr [1:2] "C15" "C26"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Respiratory And Intrathoracic Organs                                                                                                                   : Named chr [1:2] "C30" "C39"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Bone And Articular Cartilage                                                                                                                           : Named chr [1:2] "C40" "C41"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Melanoma And Other Malignant Neoplasms Of Skin                                                                                                                                : Named chr [1:2] "C43" "C44"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Mesothelial And Soft Tissue                                                                                                                            : Named chr [1:2] "C45" "C49"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Breast                                                                                                                                                 : Named chr [1:2] "C50" "C50"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Female Genital Organs                                                                                                                                  : Named chr [1:2] "C51" "C58"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Male Genital Organs                                                                                                                                    : Named chr [1:2] "C60" "C63"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Urinary Tract                                                                                                                                          : Named chr [1:2] "C64" "C68"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Eye, Brain And Other Parts Of Central Nervous System                                                                                                   : Named chr [1:2] "C69" "C72"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Thyroid And Other Endocrine Glands                                                                                                                     : Named chr [1:2] "C73" "C75"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neuroendocrine Tumors                                                                                                                                               : Named chr [1:2] "C7A" "C7A"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Secondary Neuroendocrine Tumors                                                                                                                                               : Named chr [1:2] "C7B" "C7B"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Ill-Defined, Other Secondary And Unspecified Sites                                                                                                     : Named chr [1:2] "C76" "C80"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malignant Neoplasms Of Lymphoid, Hematopoietic And Related Tissue                                                                                                             : Named chr [1:2] "C81" "C96"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ In Situ Neoplasms                                                                                                                                                             : Named chr [1:2] "D00" "D09"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Benign Neoplasms, Except Benign Neuroendocrine Tumors                                                                                                                         : Named chr [1:2] "D10" "D36"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Benign Neuroendocrine Tumors                                                                                                                                                  : Named chr [1:2] "D3A" "D3A"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neoplasms Of Uncertain Behavior, Polycythemia Vera And Myelodysplastic Syndromes                                                                                              : Named chr [1:2] "D37" "D48"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Neoplasms Of Unspecified Behavior                                                                                                                                             : Named chr [1:2] "D49" "D49"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Nutritional Anemias                                                                                                                                                           : Named chr [1:2] "D50" "D53"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Hemolytic Anemias                                                                                                                                                             : Named chr [1:2] "D55" "D59"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Aplastic And Other Anemias And Other Bone Marrow Failure Syndromes                                                                                                            : Named chr [1:2] "D60" "D64"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Coagulation Defects, Purpura And Other Hemorrhagic Conditions                                                                                                                 : Named chr [1:2] "D65" "D69"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of Blood And Blood-Forming Organs                                                                                                                             : Named chr [1:2] "D70" "D77"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Intraoperative And Postprocedural Complications Of The Spleen                                                                                                                 : Named chr [1:2] "D78" "D78"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Certain Disorders Involving The Immune Mechanism                                                                                                                              : Named chr [1:2] "D80" "D89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Thyroid Gland                                                                                                                                                    : Named chr [1:2] "E00" "E07"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diabetes Mellitus                                                                                                                                                             : Named chr [1:2] "E08" "E13"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of Glucose Regulation And Pancreatic Internal Secretion                                                                                                       : Named chr [1:2] "E15" "E16"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Other Endocrine Glands                                                                                                                                           : Named chr [1:2] "E20" "E35"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Intraoperative Complications Of Endocrine System                                                                                                                              : Named chr [1:2] "E36" "E36"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Malnutrition                                                                                                                                                                  : Named chr [1:2] "E40" "E46"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Nutritional Deficiencies                                                                                                                                                : Named chr [1:2] "E50" "E64"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Overweight, Obesity And Other Hyperalimentation                                                                                                                               : Named chr [1:2] "E65" "E68"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Metabolic Disorders                                                                                                                                                           : Named chr [1:2] "E70" "E88"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Postprocedural Endocrine And Metabolic Complications And Disorders, Not Elsewhere Classified                                                                                  : Named chr [1:2] "E89" "E89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mental Disorders Due To Known Physiological Conditions                                                                                                                        : Named chr [1:2] "F01" "F09"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mental And Behavioral Disorders Due To Psychoactive Substance Use                                                                                                             : Named chr [1:2] "F10" "F19"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Schizophrenia, Schizotypal, Delusional, And Other Non-Mood Psychotic Disorders                                                                                                : Named chr [1:2] "F20" "F29"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Mood [Affective] Disorders                                                                                                                                                    : Named chr [1:2] "F30" "F39"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Anxiety, Dissociative, Stress-Related, Somatoform And Other Nonpsychotic Mental Disorders                                                                                     : Named chr [1:2] "F40" "F48"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Behavioral Syndromes Associated With Physiological Disturbances And Physical Factors                                                                                          : Named chr [1:2] "F50" "F59"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Adult Personality And Behavior                                                                                                                                   : Named chr [1:2] "F60" "F69"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Intellectual Disabilities                                                                                                                                                     : Named chr [1:2] "F70" "F79"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Pervasive And Specific Developmental Disorders                                                                                                                                : Named chr [1:2] "F80" "F89"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Behavioral And Emotional Disorders With Onset Usually Occurring In Childhood And Adolescence                                                                                  : Named chr [1:2] "F90" "F98"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Unspecified Mental Disorder                                                                                                                                                   : Named chr [1:2] "F99" "F99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Inflammatory Diseases Of The Central Nervous System                                                                                                                           : Named chr [1:2] "G00" "G09"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Systemic Atrophies Primarily Affecting The Central Nervous System                                                                                                             : Named chr [1:2] "G10" "G14"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Extrapyramidal And Movement Disorders                                                                                                                                         : Named chr [1:2] "G20" "G26"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Degenerative Diseases Of The Nervous System                                                                                                                             : Named chr [1:2] "G30" "G32"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Demyelinating Diseases Of The Central Nervous System                                                                                                                          : Named chr [1:2] "G35" "G37"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Episodic And Paroxysmal Disorders                                                                                                                                             : Named chr [1:2] "G40" "G47"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Nerve, Nerve Root And Plexus Disorders                                                                                                                                        : Named chr [1:2] "G50" "G59"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Polyneuropathies And Other Disorders Of The Peripheral Nervous System                                                                                                         : Named chr [1:2] "G60" "G65"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Myoneural Junction And Muscle                                                                                                                                     : Named chr [1:2] "G70" "G73"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Cerebral Palsy And Other Paralytic Syndromes                                                                                                                                  : Named chr [1:2] "G80" "G83"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of The Nervous System                                                                                                                                         : Named chr [1:2] "G89" "G99"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Eyelid, Lacrimal System And Orbit                                                                                                                                : Named chr [1:2] "H00" "H05"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Conjunctiva                                                                                                                                                      : Named chr [1:2] "H10" "H11"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Sclera, Cornea, Iris And Ciliary Body                                                                                                                            : Named chr [1:2] "H15" "H22"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Lens                                                                                                                                                             : Named chr [1:2] "H25" "H28"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Choroid And Retina                                                                                                                                               : Named chr [1:2] "H30" "H36"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Glaucoma                                                                                                                                                                      : Named chr [1:2] "H40" "H42"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Vitreous Body And Globe                                                                                                                                          : Named chr [1:2] "H43" "H44"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Optic Nerve And Visual Pathways                                                                                                                                  : Named chr [1:2] "H46" "H47"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Disorders Of Ocular Muscles, Binocular Movement, Accommodation And Refraction                                                                                                 : Named chr [1:2] "H49" "H52"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Visual Disturbances And Blindness                                                                                                                                             : Named chr [1:2] "H53" "H54"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of Eye And Adnexa                                                                                                                                             : Named chr [1:2] "H55" "H57"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Intraoperative And Postprocedural Complications And Disorders Of Eye And Adnexa, Not Elsewhere Classified                                                                     : Named chr [1:2] "H59" "H59"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of External Ear                                                                                                                                                      : Named chr [1:2] "H60" "H62"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Middle Ear And Mastoid                                                                                                                                            : Named chr [1:2] "H65" "H75"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Diseases Of Inner Ear                                                                                                                                                         : Named chr [1:2] "H80" "H83"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Other Disorders Of Ear                                                                                                                                                        : Named chr [1:2] "H90" "H94"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#  $ Intraoperative And Postprocedural Complications And Disorders Of Ear And Mastoid Process, Not Elsewhere Classified                                                            : Named chr [1:2] "H95" "H95"
#   ..- attr(*, "names")= chr [1:2] "start" "end"
#   [list output truncated]









#@ icd10_chapters.expand_range = icd10_chapters %>% map(function(x) {icd:::expand_range.icd10cm(x[1], x[2])}) ------  
icd10_chapters.expand_range = icd10_chapters %>% map(function(x) {icd:::expand_range.icd10cm(x[1], x[2])})
icd10_chapters.expand_range |> str()
# > icd10_chapters.expand_range |> str()
# List of 21
#  $ Certain infectious and parasitic diseases                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:1292] A00 A000 A001 A009 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neoplasms                                                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:2025] C00 C000 C001 C002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism:Classes 'icd10cm', 'icd10', 'character'  atomic [1:298] D50 D500 D501 D508 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Endocrine, nutritional and metabolic diseases                                                      :Classes 'icd10cm', 'icd10', 'character'  atomic [1:879] E00 E000 E001 E002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mental, Behavioral and Neurodevelopmental disorders                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:927] F01 F015 F0150 F0151 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the nervous system                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:792] G00 G000 G001 G002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the eye and adnexa                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:3135] H00 H000 H0001 H00011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the ear and mastoid process                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:855] H60 H600 H6000 H6001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the circulatory system                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:1587] I00 I01 I010 I011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the respiratory system                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:436] J00 J01 J010 J0100 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the digestive system                                                                   :Classes 'icd10cm', 'icd10', 'character'  atomic [1:896] K00 K000 K001 K002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the skin and subcutaneous tissue                                                       :Classes 'icd10cm', 'icd10', 'character'  atomic [1:950] L00 L01 L010 L0100 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the musculoskeletal system and connective tissue                                       :Classes 'icd10cm', 'icd10', 'character'  atomic [1:8261] M00 M000 M0000 M0001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases of the genitourinary system                                                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:726] N00 N000 N001 N002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Pregnancy, childbirth and the puerperium                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:2687] O00 O000 O001 O002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Certain conditions originating in the perinatal period                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:504] P00 P000 P001 P002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Congenital malformations, deformations and chromosomal abnormalities                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:944] Q00 Q000 Q001 Q002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:792] R00 R000 R001 R002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Injury, poisoning and certain other consequences of external causes                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:52574] S00 S000 S0000 S0000XA ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ External causes of morbidity                                                                       :Classes 'icd10cm', 'icd10', 'character'  atomic [1:9629] V00 V000 V0001 V0001XA ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Factors influencing health status and contact with health services                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:1548] Z00 Z000 Z0000 Z0001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE




icd10_chapters.expand_range.ICD10_3char = icd10_chapters.expand_range %>% map(function(x) unique(substr(x, 1, 3)))
icd10_chapters.expand_range.ICD10_3char |> str()
# > icd10_chapters.expand_range.ICD10_3char |> str() ----
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








#@ icd10_sub_chapters.expand_range = icd10_sub_chapters %>% map(function(x) {icd:::expand_range.icd10cm(x[1], x[2])}) ----  
icd10_sub_chapters.expand_range = icd10_sub_chapters %>% map(function(x) {icd:::expand_range.icd10cm(x[1], x[2])})
icd10_sub_chapters.expand_range |> str()
# > icd10_sub_chapters.expand_range |> str() -----
# List of 279
#  $ Intestinal Infectious Diseases                                                                                                                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:92] A00 A000 A001 A009 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Tuberculosis                                                                                                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:61] A15 A150 A154 A155 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Certain Zoonotic Bacterial Diseases                                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:57] A20 A200 A201 A202 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Bacterial Diseases                                                                                                                                                      :Classes 'icd10cm', 'icd10', 'character'  atomic [1:143] A30 A300 A301 A302 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Infections With A Predominantly Sexual Mode Of Transmission                                                                                                                   :Classes 'icd10cm', 'icd10', 'character'  atomic [1:169] A50 A500 A5001 A5002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Spirochetal Diseases                                                                                                                                                    :Classes 'icd10cm', 'icd10', 'character'  atomic [1:33] A65 A66 A660 A661 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Diseases Caused By Chlamydiae                                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:11] A70 A71 A710 A711 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Rickettsioses                                                                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:25] A75 A750 A751 A752 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Viral And Prion Infections Of The Central Nervous System                                                                                                                      :Classes 'icd10cm', 'icd10', 'character'  atomic [1:58] A80 A800 A801 A802 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Arthropod-Borne Viral Fevers And Viral Hemorrhagic Fevers                                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:39] A90 A91 A92 A920 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Viral Infections Characterized By Skin And Mucous Membrane Lesions                                                                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:103] B00 B000 B001 B002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Human Herpesviruses                                                                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:8] B10 B100 B1001 B1009 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Viral Hepatitis                                                                                                                                                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:31] B15 B150 B159 B16 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Human Immunodeficiency Virus [HIV] Disease                                                                                                                                    :Classes 'icd10cm', 'icd10', 'character'  atomic [1:1] B20
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Viral Diseases                                                                                                                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:67] B25 B250 B251 B252 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mycoses                                                                                                                                                                       :Classes 'icd10cm', 'icd10', 'character'  atomic [1:123] B35 B350 B351 B352 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Protozoal Diseases                                                                                                                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:67] B50 B500 B508 B509 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Helminthiases                                                                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:106] B65 B650 B651 B652 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Pediculosis, Acariasis And Other Infestations                                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:26] B85 B850 B851 B852 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Sequelae Of Infectious And Parasitic Diseases                                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:14] B90 B900 B901 B902 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Bacterial And Viral Infectious Agents                                                                                                                                         :Classes 'icd10cm', 'icd10', 'character'  atomic [1:55] B95 B950 B951 B952 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Infectious Diseases                                                                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:3] B99 B998 B999
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Lip, Oral Cavity And Pharynx                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:78] C00 C000 C001 C002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Digestive Organs                                                                                                                                       :Classes 'icd10cm', 'icd10', 'character'  atomic [1:69] C15 C153 C154 C155 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Respiratory And Intrathoracic Organs                                                                                                                   :Classes 'icd10cm', 'icd10', 'character'  atomic [1:51] C30 C300 C301 C31 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Bone And Articular Cartilage                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:32] C40 C400 C4000 C4001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Melanoma And Other Malignant Neoplasms Of Skin                                                                                                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:181] C43 C430 C431 C4310 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Mesothelial And Soft Tissue                                                                                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:55] C45 C450 C451 C452 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Breast                                                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:82] C50 C500 C5001 C50011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Female Genital Organs                                                                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:43] C51 C510 C511 C512 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Male Genital Organs                                                                                                                                    :Classes 'icd10cm', 'icd10', 'character'  atomic [1:33] C60 C600 C601 C602 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Urinary Tract                                                                                                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:28] C64 C641 C642 C649 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Eye, Brain And Other Parts Of Central Nervous System                                                                                                   :Classes 'icd10cm', 'icd10', 'character'  atomic [1:71] C69 C690 C6900 C6901 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Thyroid And Other Endocrine Glands                                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:23] C73 C74 C740 C7400 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neuroendocrine Tumors                                                                                                                                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:28] C7A C7A0 C7A00 C7A01 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Secondary Neuroendocrine Tumors                                                                                                                                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:10] C7B C7B0 C7B00 C7B01 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Ill-Defined, Other Secondary And Unspecified Sites                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:76] C76 C760 C761 C762 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malignant Neoplasms Of Lymphoid, Hematopoietic And Related Tissue                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:565] C81 C810 C8100 C8101 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ In Situ Neoplasms                                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:133] D00 D000 D0000 D0001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Benign Neoplasms, Except Benign Neuroendocrine Tumors                                                                                                                         :Classes 'icd10cm', 'icd10', 'character'  atomic [1:303] D10 D100 D101 D102 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Benign Neuroendocrine Tumors                                                                                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:27] D3A D3A0 D3A00 D3A01 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neoplasms Of Uncertain Behavior, Polycythemia Vera And Myelodysplastic Syndromes                                                                                              :Classes 'icd10cm', 'icd10', 'character'  atomic [1:124] D37 D370 D3701 D3702 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Neoplasms Of Unspecified Behavior                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:13] D49 D490 D491 D492 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Nutritional Anemias                                                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:23] D50 D500 D501 D508 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Hemolytic Anemias                                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:57] D55 D550 D551 D552 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Aplastic And Other Anemias And Other Bone Marrow Failure Syndromes                                                                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:35] D60 D600 D601 D608 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Coagulation Defects, Purpura And Other Hemorrhagic Conditions                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:39] D65 D66 D67 D68 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of Blood And Blood-Forming Organs                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:56] D70 D700 D701 D702 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Intraoperative And Postprocedural Complications Of The Spleen                                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:13] D78 D780 D7801 D7802 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Certain Disorders Involving The Immune Mechanism                                                                                                                              :Classes 'icd10cm', 'icd10', 'character'  atomic [1:75] D80 D800 D801 D802 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Thyroid Gland                                                                                                                                                    :Classes 'icd10cm', 'icd10', 'character'  atomic [1:63] E00 E000 E001 E002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diabetes Mellitus                                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:289] E08 E080 E0800 E0801 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of Glucose Regulation And Pancreatic Internal Secretion                                                                                                       :Classes 'icd10cm', 'icd10', 'character'  atomic [1:9] E15 E16 E160 E161 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Other Endocrine Glands                                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:107] E20 E200 E201 E208 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Intraoperative Complications Of Endocrine System                                                                                                                              :Classes 'icd10cm', 'icd10', 'character'  atomic [1:8] E36 E360 E3601 E3602 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Malnutrition                                                                                                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:9] E40 E41 E42 E43 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Nutritional Deficiencies                                                                                                                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:59] E50 E500 E501 E502 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Overweight, Obesity And Other Hyperalimentation                                                                                                                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:17] E65 E66 E660 E6601 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Metabolic Disorders                                                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:303] E70 E700 E701 E702 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Postprocedural Endocrine And Metabolic Complications And Disorders, Not Elsewhere Classified                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:15] E89 E890 E891 E892 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mental Disorders Due To Known Physiological Conditions                                                                                                                        :Classes 'icd10cm', 'icd10', 'character'  atomic [1:33] F01 F015 F0150 F0151 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mental And Behavioral Disorders Due To Psychoactive Substance Use                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:544] F10 F101 F1010 F1012 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Schizophrenia, Schizotypal, Delusional, And Other Non-Mood Psychotic Disorders                                                                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:21] F20 F200 F201 F202 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Mood [Affective] Disorders                                                                                                                                                    :Classes 'icd10cm', 'icd10', 'character'  atomic [1:71] F30 F301 F3010 F3011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Anxiety, Dissociative, Stress-Related, Somatoform And Other Nonpsychotic Mental Disorders                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:85] F40 F400 F4000 F4001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Behavioral Syndromes Associated With Physiological Disturbances And Physical Factors                                                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:50] F50 F500 F5000 F5001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Adult Personality And Behavior                                                                                                                                   :Classes 'icd10cm', 'icd10', 'character'  atomic [1:50] F60 F600 F601 F602 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Intellectual Disabilities                                                                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:6] F70 F71 F72 F73 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Pervasive And Specific Developmental Disorders                                                                                                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:26] F80 F800 F801 F802 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Behavioral And Emotional Disorders With Onset Usually Occurring In Childhood And Adolescence                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:40] F90 F900 F901 F902 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Unspecified Mental Disorder                                                                                                                                                   :Classes 'icd10cm', 'icd10', 'character'  atomic [1:1] F99
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Inflammatory Diseases Of The Central Nervous System                                                                                                                           :Classes 'icd10cm', 'icd10', 'character'  atomic [1:43] G00 G000 G001 G002 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Systemic Atrophies Primarily Affecting The Central Nervous System                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:25] G10 G11 G110 G111 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Extrapyramidal And Movement Disorders                                                                                                                                         :Classes 'icd10cm', 'icd10', 'character'  atomic [1:50] G20 G21 G210 G211 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Degenerative Diseases Of The Nervous System                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:24] G30 G300 G301 G308 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Demyelinating Diseases Of The Central Nervous System                                                                                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:15] G35 G36 G360 G361 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Episodic And Paroxysmal Disorders                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:283] G40 G400 G4000 G40001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Nerve, Nerve Root And Plexus Disorders                                                                                                                                        :Classes 'icd10cm', 'icd10', 'character'  atomic [1:110] G50 G500 G501 G508 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Polyneuropathies And Other Disorders Of The Peripheral Nervous System                                                                                                         :Classes 'icd10cm', 'icd10', 'character'  atomic [1:29] G60 G600 G601 G602 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Myoneural Junction And Muscle                                                                                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:39] G70 G700 G7000 G7001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Cerebral Palsy And Other Paralytic Syndromes                                                                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:67] G80 G800 G801 G802 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of The Nervous System                                                                                                                                         :Classes 'icd10cm', 'icd10', 'character'  atomic [1:107] G89 G890 G891 G8911 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Eyelid, Lacrimal System And Orbit                                                                                                                                :Classes 'icd10cm', 'icd10', 'character'  atomic [1:654] H00 H000 H0001 H00011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Conjunctiva                                                                                                                                                      :Classes 'icd10cm', 'icd10', 'character'  atomic [1:214] H10 H100 H1001 H10011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Sclera, Cornea, Iris And Ciliary Body                                                                                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:618] H15 H150 H1500 H15001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Lens                                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:156] H25 H250 H2501 H25011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Choroid And Retina                                                                                                                                               :Classes 'icd10cm', 'icd10', 'character'  atomic [1:458] H30 H300 H3000 H30001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Glaucoma                                                                                                                                                                      :Classes 'icd10cm', 'icd10', 'character'  atomic [1:296] H40 H400 H4000 H40001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Vitreous Body And Globe                                                                                                                                          :Classes 'icd10cm', 'icd10', 'character'  atomic [1:220] H43 H430 H4300 H4301 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Optic Nerve And Visual Pathways                                                                                                                                  :Classes 'icd10cm', 'icd10', 'character'  atomic [1:122] H46 H460 H4600 H4601 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Disorders Of Ocular Muscles, Binocular Movement, Accommodation And Refraction                                                                                                 :Classes 'icd10cm', 'icd10', 'character'  atomic [1:175] H49 H490 H4900 H4901 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Visual Disturbances And Blindness                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:123] H53 H530 H5300 H53001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of Eye And Adnexa                                                                                                                                             :Classes 'icd10cm', 'icd10', 'character'  atomic [1:31] H55 H550 H5500 H5501 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Intraoperative And Postprocedural Complications And Disorders Of Eye And Adnexa, Not Elsewhere Classified                                                                     :Classes 'icd10cm', 'icd10', 'character'  atomic [1:68] H59 H590 H5901 H59011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of External Ear                                                                                                                                                      :Classes 'icd10cm', 'icd10', 'character'  atomic [1:191] H60 H600 H6000 H6001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Middle Ear And Mastoid                                                                                                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:380] H65 H650 H6500 H6501 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Diseases Of Inner Ear                                                                                                                                                         :Classes 'icd10cm', 'icd10', 'character'  atomic [1:108] H80 H800 H8000 H8001 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Other Disorders Of Ear                                                                                                                                                        :Classes 'icd10cm', 'icd10', 'character'  atomic [1:132] H90 H900 H901 H9011 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#  $ Intraoperative And Postprocedural Complications And Disorders Of Ear And Mastoid Process, Not Elsewhere Classified                                                            :Classes 'icd10cm', 'icd10', 'character'  atomic [1:44] H95 H950 H9500 H9501 ...
#   .. ..- attr(*, "icd_short_diag")= logi TRUE
#   [list output truncated]




icd10_sub_chapters.expand_range.ICD10_3char = icd10_sub_chapters.expand_range %>% map(function(x) unique(substr(x, 1, 3)))
icd10_sub_chapters.expand_range.ICD10_3char |> str()
# > icd10_sub_chapters.expand_range.ICD10_3char |> str() -----
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









#@ library(jsonlite) ----  

library(jsonlite)
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/icd10_chapters.expand_range.ICD10_3char.rda"))
icd10_chapters.expand_range.ICD10_3char %>% toJSON
# > icd10_chapters.expand_range.ICD10_3char %>% toJSON
# {"Certain infectious and parasitic diseases":["A00","A01","A02","A03","A04","A05","A06","A07","A08","A09","A15","A17","A18","A19","A20","A21","A22","A23","A24","A25","A26","A27","A28","A30","A31","A32","A33","A34","A35","A36","A37","A38","A39","A40","A41","A42","A43","A44","A46","A48","A49","A50","A51","A52","A53","A54","A55","A56","A57","A58","A59","A60","A63","A64","A65","A66","A67","A68","A69","A70","A71","A74","A75","A77","A78","A79","A80","A81","A82","A83","A84","A85","A86","A87","A88","A89","A90","A91","A92","A93","A94","A95","A96","A98","A99","B00","B01","B02","B03","B04","B05","B06","B07","B08","B09","B10","B15","B16","B17","B18","B19","B20","B25","B26","B27","B30","B33","B34","B35","B36","B37","B38","B39","B40","B41","B42","B43","B44","B45","B46","B47","B48","B49","B50","B51","B52","B53","B54","B55","B56","B57","B58","B59","B60","B64","B65","B66","B67","B68","B69","B70","B71","B72","B73","B74","B75","B76","B77","B78","B79","B80","B81","B82","B83","B85","B86","B87","B88","B89","B90","B91","B92","B94","B95","B96","B97","B99"],"Neoplasms":["C00","C01","C02","C03","C04","C05","C06","C07","C08","C09","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24","C25","C26","C30","C31","C32","C33","C34","C37","C38","C39","C40","C41","C43","C4A","C44","C45","C46","C47","C48","C49","C50","C51","C52","C53","C54","C55","C56","C57","C58","C60","C61","C62","C63","C64","C65","C66","C67","C68","C69","C70","C71","C72","C73","C74","C75","C7A","C7B","C76","C77","C78","C79","C80","C81","C82","C83","C84","C85","C86","C88","C90","C91","C92","C93","C94","C95","C96","D00","D01","D02","D03","D04","D05","D06","D07","D09","D10","D11","D12","D13","D14","D15","D16","D17","D18","D19","D20","D21","D22","D23","D24","D25","D26","D27","D28","D29","D30","D31","D32","D33","D34","D35","D36","D3A","D37","D38","D39","D40","D41","D42","D43","D44","D45","D46","D47","D48","D49"],"Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism":["D50","D51","D52","D53","D55","D56","D57","D58","D59","D60","D61","D62","D63","D64","D65","D66","D67","D68","D69","D70","D71","D72","D73","D74","D75","D76","D77","D78","D80","D81","D82","D83","D84","D86","D89"],"Endocrine, nutritional and metabolic diseases":["E00","E01","E02","E03","E04","E05","E06","E07","E08","E09","E10","E11","E13","E15","E16","E20","E21","E22","E23","E24","E25","E26","E27","E28","E29","E30","E31","E32","E34","E35","E36","E40","E41","E42","E43","E44","E45","E46","E50","E51","E52","E53","E54","E55","E56","E58","E59","E60","E61","E63","E64","E65","E66","E67","E68","E70","E71","E72","E73","E74","E75","E76","E77","E78","E79","E80","E83","E84","E85","E86","E87","E88","E89"],"Mental, Behavioral and Neurodevelopmental disorders":["F01","F02","F03","F04","F05","F06","F07","F09","F10","F11","F12","F13","F14","F15","F16","F17","F18","F19","F20","F21","F22","F23","F24","F25","F28","F29","F30","F31","F32","F33","F34","F39","F40","F41","F42","F43","F44","F45","F48","F50","F51","F52","F53","F54","F55","F59","F60","F63","F64","F65","F66","F68","F69","F70","F71","F72","F73","F78","F79","F80","F81","F82","F84","F88","F89","F90","F91","F93","F94","F95","F98","F99"],"Diseases of the nervous system":["G00","G01","G02","G03","G04","G05","G06","G07","G08","G09","G10","G11","G12","G13","G14","G20","G21","G23","G24","G25","G26","G30","G31","G32","G35","G36","G37","G40","G43","G44","G45","G46","G47","G50","G51","G52","G53","G54","G55","G56","G57","G58","G59","G60","G61","G62","G63","G64","G65","G70","G71","G72","G73","G80","G81","G82","G83","G89","G90","G91","G92","G93","G94","G95","G96","G97","G98","G99"],"Diseases of the eye and adnexa":["H00","H01","H02","H04","H05","H10","H11","H15","H16","H17","H18","H20","H21","H22","H25","H26","H27","H28","H30","H31","H32","H33","H34","H35","H36","H40","H42","H43","H44","H46","H47","H49","H50","H51","H52","H53","H54","H55","H57","H59"],"Diseases of the ear and mastoid process":["H60","H61","H62","H65","H66","H67","H68","H69","H70","H71","H72","H73","H74","H75","H80","H81","H82","H83","H90","H91","H92","H93","H94","H95"],"Diseases of the circulatory system":["I00","I01","I02","I05","I06","I07","I08","I09","I10","I11","I12","I13","I15","I20","I21","I22","I23","I24","I25","I26","I27","I28","I30","I31","I32","I33","I34","I35","I36","I37","I38","I39","I40","I41","I42","I43","I44","I45","I46","I47","I48","I49","I50","I51","I52","I60","I61","I62","I63","I65","I66","I67","I68","I69","I70","I71","I72","I73","I74","I75","I76","I77","I78","I79","I80","I81","I82","I83","I85","I86","I87","I88","I89","I95","I96","I97","I99"],"Diseases of the respiratory system":["J00","J01","J02","J03","J04","J05","J06","J09","J10","J11","J12","J13","J14","J15","J16","J17","J18","J20","J21","J22","J30","J31","J32","J33","J34","J35","J36","J37","J38","J39","J40","J41","J42","J43","J44","J45","J47","J60","J61","J62","J63","J64","J65","J66","J67","J68","J69","J70","J80","J81","J82","J84","J85","J86","J90","J91","J92","J93","J94","J95","J96","J98","J99"],"Diseases of the digestive system":["K00","K01","K02","K03","K04","K05","K06","K08","K09","K11","K12","K13","K14","K20","K21","K22","K23","K25","K26","K27","K28","K29","K30","K31","K35","K36","K37","K38","K40","K41","K42","K43","K44","K45","K46","K50","K51","K52","K55","K56","K57","K58","K59","K60","K61","K62","K63","K64","K65","K66","K67","K68","K70","K71","K72","K73","K74","K75","K76","K77","K80","K81","K82","K83","K85","K86","K87","K90","K91","K92","K94","K95"],"Diseases of the skin and subcutaneous tissue":["L00","L01","L02","L03","L04","L05","L08","L10","L11","L12","L13","L14","L20","L21","L22","L23","L24","L25","L26","L27","L28","L29","L30","L40","L41","L42","L43","L44","L45","L49","L50","L51","L52","L53","L54","L55","L56","L57","L58","L59","L60","L62","L63","L64","L65","L66","L67","L68","L70","L71","L72","L73","L74","L75","L76","L80","L81","L82","L83","L84","L85","L86","L87","L88","L89","L90","L91","L92","L93","L94","L95","L97","L98","L99"],"Diseases of the musculoskeletal system and connective tissue":["M00","M01","M02","M05","M06","M07","M08","M1A","M10","M11","M12","M13","M14","M15","M16","M17","M18","M19","M20","M21","M22","M23","M24","M25","M26","M27","M30","M31","M32","M33","M34","M35","M36","M40","M41","M42","M43","M45","M46","M47","M48","M49","M50","M51","M53","M54","M60","M61","M62","M63","M65","M66","M67","M70","M71","M72","M75","M76","M77","M79","M80","M81","M83","M84","M85","M86","M87","M88","M89","M90","M91","M92","M93","M94","M95","M96","M99"],"Diseases of the genitourinary system":["N00","N01","N02","N03","N04","N05","N06","N07","N08","N10","N11","N12","N13","N14","N15","N16","N17","N18","N19","N20","N21","N22","N23","N25","N26","N27","N28","N29","N30","N31","N32","N33","N34","N35","N36","N37","N39","N40","N41","N42","N43","N44","N45","N46","N47","N48","N49","N50","N51","N52","N53","N60","N61","N62","N63","N64","N65","N70","N71","N72","N73","N74","N75","N76","N77","N80","N81","N82","N83","N84","N85","N86","N87","N88","N89","N90","N91","N92","N93","N94","N95","N96","N97","N98","N99"],"Pregnancy, childbirth and the puerperium":["O00","O01","O02","O03","O04","O07","O08","O09","O10","O11","O12","O13","O14","O15","O16","O20","O21","O22","O23","O24","O25","O26","O28","O29","O30","O31","O32","O33","O34","O35","O36","O40","O41","O42","O43","O44","O45","O46","O47","O48","O60","O61","O62","O63","O64","O65","O66","O67","O68","O69","O70","O71","O72","O73","O74","O75","O76","O77","O80","O82","O85","O86","O87","O88","O89","O90","O91","O92","O94","O98","O99","O9A"],"Certain conditions originating in the perinatal period":["P00","P01","P02","P03","P04","P05","P07","P08","P09","P10","P11","P12","P13","P14","P15","P19","P22","P23","P24","P25","P26","P27","P28","P29","P35","P36","P37","P38","P39","P50","P51","P52","P53","P54","P55","P56","P57","P58","P59","P60","P61","P70","P71","P72","P74","P76","P77","P78","P80","P81","P83","P84","P90","P91","P92","P93","P94","P95","P96"],"Congenital malformations, deformations and chromosomal abnormalities":["Q00","Q01","Q02","Q03","Q04","Q05","Q06","Q07","Q10","Q11","Q12","Q13","Q14","Q15","Q16","Q17","Q18","Q20","Q21","Q22","Q23","Q24","Q25","Q26","Q27","Q28","Q30","Q31","Q32","Q33","Q34","Q35","Q36","Q37","Q38","Q39","Q40","Q41","Q42","Q43","Q44","Q45","Q50","Q51","Q52","Q53","Q54","Q55","Q56","Q60","Q61","Q62","Q63","Q64","Q65","Q66","Q67","Q68","Q69","Q70","Q71","Q72","Q73","Q74","Q75","Q76","Q77","Q78","Q79","Q80","Q81","Q82","Q83","Q84","Q85","Q86","Q87","Q89","Q90","Q91","Q92","Q93","Q95","Q96","Q97","Q98","Q99"],"Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified":["R00","R01","R03","R04","R05","R06","R07","R09","R10","R11","R12","R13","R14","R15","R16","R17","R18","R19","R20","R21","R22","R23","R25","R26","R27","R29","R30","R31","R32","R33","R34","R35","R36","R37","R39","R40","R41","R42","R43","R44","R45","R46","R47","R48","R49","R50","R51","R52","R53","R54","R55","R56","R57","R58","R59","R60","R61","R62","R63","R64","R65","R68","R69","R70","R71","R73","R74","R75","R76","R77","R78","R79","R80","R81","R82","R83","R84","R85","R86","R87","R88","R89","R90","R91","R92","R93","R94","R97","R99"],"Injury, poisoning and certain other consequences of external causes":["S00","S01","S02","S03","S04","S05","S06","S07","S08","S09","S10","S11","S12","S13","S14","S15","S16","S17","S19","S20","S21","S22","S23","S24","S25","S26","S27","S28","S29","S30","S31","S32","S33","S34","S35","S36","S37","S38","S39","S40","S41","S42","S43","S44","S45","S46","S47","S48","S49","S50","S51","S52","S53","S54","S55","S56","S57","S58","S59","S60","S61","S62","S63","S64","S65","S66","S67","S68","S69","S70","S71","S72","S73","S74","S75","S76","S77","S78","S79","S80","S81","S82","S83","S84","S85","S86","S87","S88","S89","S90","S91","S92","S93","S94","S95","S96","S97","S98","S99","T07","T14","T15","T16","T17","T18","T19","T20","T21","T22","T23","T24","T25","T26","T27","T28","T30","T31","T32","T33","T34","T36","T37","T38","T39","T40","T41","T42","T43","T44","T45","T46","T47","T48","T49","T50","T51","T52","T53","T54","T55","T56","T57","T58","T59","T60","T61","T62","T63","T64","T65","T66","T67","T68","T69","T70","T71","T73","T74","T75","T76","T78","T79","T80","T81","T82","T83","T84","T85","T86","T87","T88"],"External causes of morbidity":["V00","V01","V02","V03","V04","V05","V06","V09","V10","V11","V12","V13","V14","V15","V16","V17","V18","V19","V20","V21","V22","V23","V24","V25","V26","V27","V28","V29","V30","V31","V32","V33","V34","V35","V36","V37","V38","V39","V40","V41","V42","V43","V44","V45","V46","V47","V48","V49","V50","V51","V52","V53","V54","V55","V56","V57","V58","V59","V60","V61","V62","V63","V64","V65","V66","V67","V68","V69","V70","V71","V72","V73","V74","V75","V76","V77","V78","V79","V80","V81","V82","V83","V84","V85","V86","V87","V88","V89","V90","V91","V92","V93","V94","V95","V96","V97","V98","V99","W00","W01","W03","W04","W05","W06","W07","W08","W09","W10","W11","W12","W13","W14","W15","W16","W17","W18","W19","W20","W21","W22","W23","W24","W25","W26","W27","W28","W29","W30","W31","W32","W33","W34","W35","W36","W37","W38","W39","W40","W42","W45","W46","W49","W50","W51","W52","W53","W54","W55","W56","W57","W58","W59","W60","W61","W62","W64","W65","W67","W69","W73","W74","W85","W86","W88","W89","W90","W92","W93","W94","W99","X00","X01","X02","X03","X04","X05","X06","X08","X10","X11","X12","X13","X14","X15","X16","X17","X18","X19","X30","X31","X32","X34","X35","X36","X37","X38","X39","X52","X58","X71","X72","X73","X74","X75","X76","X77","X78","X79","X80","X81","X82","X83","X92","X93","X94","X95","X96","X97","X98","X99","Y00","Y01","Y02","Y03","Y04","Y07","Y08","Y09","Y21","Y22","Y23","Y24","Y25","Y26","Y27","Y28","Y29","Y30","Y31","Y32","Y33","Y35","Y36","Y37","Y38","Y62","Y63","Y64","Y65","Y66","Y69","Y70","Y71","Y72","Y73","Y74","Y75","Y76","Y77","Y78","Y79","Y80","Y81","Y82","Y83","Y84","Y90","Y92","Y93","Y95","Y99"],"Factors influencing health status and contact with health services":["Z00","Z01","Z02","Z03","Z04","Z08","Z09","Z11","Z12","Z13","Z14","Z15","Z16","Z17","Z18","Z20","Z21","Z22","Z23","Z28","Z30","Z31","Z32","Z33","Z34","Z36","Z3A","Z37","Z38","Z39","Z40","Z41","Z42","Z43","Z44","Z45","Z46","Z47","Z48","Z49","Z51","Z52","Z53","Z55","Z56","Z57","Z59","Z60","Z62","Z63","Z64","Z65","Z66","Z67","Z68","Z69","Z70","Z71","Z72","Z73","Z74","Z75","Z76","Z77","Z78","Z79","Z80","Z81","Z82","Z83","Z84","Z85","Z86","Z87","Z88","Z89","Z90","Z91","Z92","Z93","Z94","Z95","Z96","Z97","Z98","Z99"]} 
icd10_chapters.expand_range.ICD10_3char %>% toJSON(pretty = T)
# > icd10_chapters.expand_range.ICD10_3char %>% toJSON(pretty = T) ------
# {
#   "Certain infectious and parasitic diseases": ["A00", "A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A15", "A17", "A18", "A19", "A20", "A21", "A22", "A23", "A24", "A25", "A26", "A27", "A28", "A30", "A31", "A32", "A33", "A34", "A35", "A36", "A37", "A38", "A39", "A40", "A41", "A42", "A43", "A44", "A46", "A48", "A49", "A50", "A51", "A52", "A53", "A54", "A55", "A56", "A57", "A58", "A59", "A60", "A63", "A64", "A65", "A66", "A67", "A68", "A69", "A70", "A71", "A74", "A75", "A77", "A78", "A79", "A80", "A81", "A82", "A83", "A84", "A85", "A86", "A87", "A88", "A89", "A90", "A91", "A92", "A93", "A94", "A95", "A96", "A98", "A99", "B00", "B01", "B02", "B03", "B04", "B05", "B06", "B07", "B08", "B09", "B10", "B15", "B16", "B17", "B18", "B19", "B20", "B25", "B26", "B27", "B30", "B33", "B34", "B35", "B36", "B37", "B38", "B39", "B40", "B41", "B42", "B43", "B44", "B45", "B46", "B47", "B48", "B49", "B50", "B51", "B52", "B53", "B54", "B55", "B56", "B57", "B58", "B59", "B60", "B64", "B65", "B66", "B67", "B68", "B69", "B70", "B71", "B72", "B73", "B74", "B75", "B76", "B77", "B78", "B79", "B80", "B81", "B82", "B83", "B85", "B86", "B87", "B88", "B89", "B90", "B91", "B92", "B94", "B95", "B96", "B97", "B99"],
#   "Neoplasms": ["C00", "C01", "C02", "C03", "C04", "C05", "C06", "C07", "C08", "C09", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18", "C19", "C20", "C21", "C22", "C23", "C24", "C25", "C26", "C30", "C31", "C32", "C33", "C34", "C37", "C38", "C39", "C40", "C41", "C43", "C4A", "C44", "C45", "C46", "C47", "C48", "C49", "C50", "C51", "C52", "C53", "C54", "C55", "C56", "C57", "C58", "C60", "C61", "C62", "C63", "C64", "C65", "C66", "C67", "C68", "C69", "C70", "C71", "C72", "C73", "C74", "C75", "C7A", "C7B", "C76", "C77", "C78", "C79", "C80", "C81", "C82", "C83", "C84", "C85", "C86", "C88", "C90", "C91", "C92", "C93", "C94", "C95", "C96", "D00", "D01", "D02", "D03", "D04", "D05", "D06", "D07", "D09", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "D25", "D26", "D27", "D28", "D29", "D30", "D31", "D32", "D33", "D34", "D35", "D36", "D3A", "D37", "D38", "D39", "D40", "D41", "D42", "D43", "D44", "D45", "D46", "D47", "D48", "D49"],
#   "Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism": ["D50", "D51", "D52", "D53", "D55", "D56", "D57", "D58", "D59", "D60", "D61", "D62", "D63", "D64", "D65", "D66", "D67", "D68", "D69", "D70", "D71", "D72", "D73", "D74", "D75", "D76", "D77", "D78", "D80", "D81", "D82", "D83", "D84", "D86", "D89"],
#   "Endocrine, nutritional and metabolic diseases": ["E00", "E01", "E02", "E03", "E04", "E05", "E06", "E07", "E08", "E09", "E10", "E11", "E13", "E15", "E16", "E20", "E21", "E22", "E23", "E24", "E25", "E26", "E27", "E28", "E29", "E30", "E31", "E32", "E34", "E35", "E36", "E40", "E41", "E42", "E43", "E44", "E45", "E46", "E50", "E51", "E52", "E53", "E54", "E55", "E56", "E58", "E59", "E60", "E61", "E63", "E64", "E65", "E66", "E67", "E68", "E70", "E71", "E72", "E73", "E74", "E75", "E76", "E77", "E78", "E79", "E80", "E83", "E84", "E85", "E86", "E87", "E88", "E89"],
#   "Mental, Behavioral and Neurodevelopmental disorders": ["F01", "F02", "F03", "F04", "F05", "F06", "F07", "F09", "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19", "F20", "F21", "F22", "F23", "F24", "F25", "F28", "F29", "F30", "F31", "F32", "F33", "F34", "F39", "F40", "F41", "F42", "F43", "F44", "F45", "F48", "F50", "F51", "F52", "F53", "F54", "F55", "F59", "F60", "F63", "F64", "F65", "F66", "F68", "F69", "F70", "F71", "F72", "F73", "F78", "F79", "F80", "F81", "F82", "F84", "F88", "F89", "F90", "F91", "F93", "F94", "F95", "F98", "F99"],
#   "Diseases of the nervous system": ["G00", "G01", "G02", "G03", "G04", "G05", "G06", "G07", "G08", "G09", "G10", "G11", "G12", "G13", "G14", "G20", "G21", "G23", "G24", "G25", "G26", "G30", "G31", "G32", "G35", "G36", "G37", "G40", "G43", "G44", "G45", "G46", "G47", "G50", "G51", "G52", "G53", "G54", "G55", "G56", "G57", "G58", "G59", "G60", "G61", "G62", "G63", "G64", "G65", "G70", "G71", "G72", "G73", "G80", "G81", "G82", "G83", "G89", "G90", "G91", "G92", "G93", "G94", "G95", "G96", "G97", "G98", "G99"],
#   "Diseases of the eye and adnexa": ["H00", "H01", "H02", "H04", "H05", "H10", "H11", "H15", "H16", "H17", "H18", "H20", "H21", "H22", "H25", "H26", "H27", "H28", "H30", "H31", "H32", "H33", "H34", "H35", "H36", "H40", "H42", "H43", "H44", "H46", "H47", "H49", "H50", "H51", "H52", "H53", "H54", "H55", "H57", "H59"],
#   "Diseases of the ear and mastoid process": ["H60", "H61", "H62", "H65", "H66", "H67", "H68", "H69", "H70", "H71", "H72", "H73", "H74", "H75", "H80", "H81", "H82", "H83", "H90", "H91", "H92", "H93", "H94", "H95"],
#   "Diseases of the circulatory system": ["I00", "I01", "I02", "I05", "I06", "I07", "I08", "I09", "I10", "I11", "I12", "I13", "I15", "I20", "I21", "I22", "I23", "I24", "I25", "I26", "I27", "I28", "I30", "I31", "I32", "I33", "I34", "I35", "I36", "I37", "I38", "I39", "I40", "I41", "I42", "I43", "I44", "I45", "I46", "I47", "I48", "I49", "I50", "I51", "I52", "I60", "I61", "I62", "I63", "I65", "I66", "I67", "I68", "I69", "I70", "I71", "I72", "I73", "I74", "I75", "I76", "I77", "I78", "I79", "I80", "I81", "I82", "I83", "I85", "I86", "I87", "I88", "I89", "I95", "I96", "I97", "I99"],
#   "Diseases of the respiratory system": ["J00", "J01", "J02", "J03", "J04", "J05", "J06", "J09", "J10", "J11", "J12", "J13", "J14", "J15", "J16", "J17", "J18", "J20", "J21", "J22", "J30", "J31", "J32", "J33", "J34", "J35", "J36", "J37", "J38", "J39", "J40", "J41", "J42", "J43", "J44", "J45", "J47", "J60", "J61", "J62", "J63", "J64", "J65", "J66", "J67", "J68", "J69", "J70", "J80", "J81", "J82", "J84", "J85", "J86", "J90", "J91", "J92", "J93", "J94", "J95", "J96", "J98", "J99"],
#   "Diseases of the digestive system": ["K00", "K01", "K02", "K03", "K04", "K05", "K06", "K08", "K09", "K11", "K12", "K13", "K14", "K20", "K21", "K22", "K23", "K25", "K26", "K27", "K28", "K29", "K30", "K31", "K35", "K36", "K37", "K38", "K40", "K41", "K42", "K43", "K44", "K45", "K46", "K50", "K51", "K52", "K55", "K56", "K57", "K58", "K59", "K60", "K61", "K62", "K63", "K64", "K65", "K66", "K67", "K68", "K70", "K71", "K72", "K73", "K74", "K75", "K76", "K77", "K80", "K81", "K82", "K83", "K85", "K86", "K87", "K90", "K91", "K92", "K94", "K95"],
#   "Diseases of the skin and subcutaneous tissue": ["L00", "L01", "L02", "L03", "L04", "L05", "L08", "L10", "L11", "L12", "L13", "L14", "L20", "L21", "L22", "L23", "L24", "L25", "L26", "L27", "L28", "L29", "L30", "L40", "L41", "L42", "L43", "L44", "L45", "L49", "L50", "L51", "L52", "L53", "L54", "L55", "L56", "L57", "L58", "L59", "L60", "L62", "L63", "L64", "L65", "L66", "L67", "L68", "L70", "L71", "L72", "L73", "L74", "L75", "L76", "L80", "L81", "L82", "L83", "L84", "L85", "L86", "L87", "L88", "L89", "L90", "L91", "L92", "L93", "L94", "L95", "L97", "L98", "L99"],
#   "Diseases of the musculoskeletal system and connective tissue": ["M00", "M01", "M02", "M05", "M06", "M07", "M08", "M1A", "M10", "M11", "M12", "M13", "M14", "M15", "M16", "M17", "M18", "M19", "M20", "M21", "M22", "M23", "M24", "M25", "M26", "M27", "M30", "M31", "M32", "M33", "M34", "M35", "M36", "M40", "M41", "M42", "M43", "M45", "M46", "M47", "M48", "M49", "M50", "M51", "M53", "M54", "M60", "M61", "M62", "M63", "M65", "M66", "M67", "M70", "M71", "M72", "M75", "M76", "M77", "M79", "M80", "M81", "M83", "M84", "M85", "M86", "M87", "M88", "M89", "M90", "M91", "M92", "M93", "M94", "M95", "M96", "M99"],
#   "Diseases of the genitourinary system": ["N00", "N01", "N02", "N03", "N04", "N05", "N06", "N07", "N08", "N10", "N11", "N12", "N13", "N14", "N15", "N16", "N17", "N18", "N19", "N20", "N21", "N22", "N23", "N25", "N26", "N27", "N28", "N29", "N30", "N31", "N32", "N33", "N34", "N35", "N36", "N37", "N39", "N40", "N41", "N42", "N43", "N44", "N45", "N46", "N47", "N48", "N49", "N50", "N51", "N52", "N53", "N60", "N61", "N62", "N63", "N64", "N65", "N70", "N71", "N72", "N73", "N74", "N75", "N76", "N77", "N80", "N81", "N82", "N83", "N84", "N85", "N86", "N87", "N88", "N89", "N90", "N91", "N92", "N93", "N94", "N95", "N96", "N97", "N98", "N99"],
#   "Pregnancy, childbirth and the puerperium": ["O00", "O01", "O02", "O03", "O04", "O07", "O08", "O09", "O10", "O11", "O12", "O13", "O14", "O15", "O16", "O20", "O21", "O22", "O23", "O24", "O25", "O26", "O28", "O29", "O30", "O31", "O32", "O33", "O34", "O35", "O36", "O40", "O41", "O42", "O43", "O44", "O45", "O46", "O47", "O48", "O60", "O61", "O62", "O63", "O64", "O65", "O66", "O67", "O68", "O69", "O70", "O71", "O72", "O73", "O74", "O75", "O76", "O77", "O80", "O82", "O85", "O86", "O87", "O88", "O89", "O90", "O91", "O92", "O94", "O98", "O99", "O9A"],
#   "Certain conditions originating in the perinatal period": ["P00", "P01", "P02", "P03", "P04", "P05", "P07", "P08", "P09", "P10", "P11", "P12", "P13", "P14", "P15", "P19", "P22", "P23", "P24", "P25", "P26", "P27", "P28", "P29", "P35", "P36", "P37", "P38", "P39", "P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57", "P58", "P59", "P60", "P61", "P70", "P71", "P72", "P74", "P76", "P77", "P78", "P80", "P81", "P83", "P84", "P90", "P91", "P92", "P93", "P94", "P95", "P96"],
#   "Congenital malformations, deformations and chromosomal abnormalities": ["Q00", "Q01", "Q02", "Q03", "Q04", "Q05", "Q06", "Q07", "Q10", "Q11", "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", "Q18", "Q20", "Q21", "Q22", "Q23", "Q24", "Q25", "Q26", "Q27", "Q28", "Q30", "Q31", "Q32", "Q33", "Q34", "Q35", "Q36", "Q37", "Q38", "Q39", "Q40", "Q41", "Q42", "Q43", "Q44", "Q45", "Q50", "Q51", "Q52", "Q53", "Q54", "Q55", "Q56", "Q60", "Q61", "Q62", "Q63", "Q64", "Q65", "Q66", "Q67", "Q68", "Q69", "Q70", "Q71", "Q72", "Q73", "Q74", "Q75", "Q76", "Q77", "Q78", "Q79", "Q80", "Q81", "Q82", "Q83", "Q84", "Q85", "Q86", "Q87", "Q89", "Q90", "Q91", "Q92", "Q93", "Q95", "Q96", "Q97", "Q98", "Q99"],
#   "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified": ["R00", "R01", "R03", "R04", "R05", "R06", "R07", "R09", "R10", "R11", "R12", "R13", "R14", "R15", "R16", "R17", "R18", "R19", "R20", "R21", "R22", "R23", "R25", "R26", "R27", "R29", "R30", "R31", "R32", "R33", "R34", "R35", "R36", "R37", "R39", "R40", "R41", "R42", "R43", "R44", "R45", "R46", "R47", "R48", "R49", "R50", "R51", "R52", "R53", "R54", "R55", "R56", "R57", "R58", "R59", "R60", "R61", "R62", "R63", "R64", "R65", "R68", "R69", "R70", "R71", "R73", "R74", "R75", "R76", "R77", "R78", "R79", "R80", "R81", "R82", "R83", "R84", "R85", "R86", "R87", "R88", "R89", "R90", "R91", "R92", "R93", "R94", "R97", "R99"],
#   "Injury, poisoning and certain other consequences of external causes": ["S00", "S01", "S02", "S03", "S04", "S05", "S06", "S07", "S08", "S09", "S10", "S11", "S12", "S13", "S14", "S15", "S16", "S17", "S19", "S20", "S21", "S22", "S23", "S24", "S25", "S26", "S27", "S28", "S29", "S30", "S31", "S32", "S33", "S34", "S35", "S36", "S37", "S38", "S39", "S40", "S41", "S42", "S43", "S44", "S45", "S46", "S47", "S48", "S49", "S50", "S51", "S52", "S53", "S54", "S55", "S56", "S57", "S58", "S59", "S60", "S61", "S62", "S63", "S64", "S65", "S66", "S67", "S68", "S69", "S70", "S71", "S72", "S73", "S74", "S75", "S76", "S77", "S78", "S79", "S80", "S81", "S82", "S83", "S84", "S85", "S86", "S87", "S88", "S89", "S90", "S91", "S92", "S93", "S94", "S95", "S96", "S97", "S98", "S99", "T07", "T14", "T15", "T16", "T17", "T18", "T19", "T20", "T21", "T22", "T23", "T24", "T25", "T26", "T27", "T28", "T30", "T31", "T32", "T33", "T34", "T36", "T37", "T38", "T39", "T40", "T41", "T42", "T43", "T44", "T45", "T46", "T47", "T48", "T49", "T50", "T51", "T52", "T53", "T54", "T55", "T56", "T57", "T58", "T59", "T60", "T61", "T62", "T63", "T64", "T65", "T66", "T67", "T68", "T69", "T70", "T71", "T73", "T74", "T75", "T76", "T78", "T79", "T80", "T81", "T82", "T83", "T84", "T85", "T86", "T87", "T88"],
#   "External causes of morbidity": ["V00", "V01", "V02", "V03", "V04", "V05", "V06", "V09", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", "V20", "V21", "V22", "V23", "V24", "V25", "V26", "V27", "V28", "V29", "V30", "V31", "V32", "V33", "V34", "V35", "V36", "V37", "V38", "V39", "V40", "V41", "V42", "V43", "V44", "V45", "V46", "V47", "V48", "V49", "V50", "V51", "V52", "V53", "V54", "V55", "V56", "V57", "V58", "V59", "V60", "V61", "V62", "V63", "V64", "V65", "V66", "V67", "V68", "V69", "V70", "V71", "V72", "V73", "V74", "V75", "V76", "V77", "V78", "V79", "V80", "V81", "V82", "V83", "V84", "V85", "V86", "V87", "V88", "V89", "V90", "V91", "V92", "V93", "V94", "V95", "V96", "V97", "V98", "V99", "W00", "W01", "W03", "W04", "W05", "W06", "W07", "W08", "W09", "W10", "W11", "W12", "W13", "W14", "W15", "W16", "W17", "W18", "W19", "W20", "W21", "W22", "W23", "W24", "W25", "W26", "W27", "W28", "W29", "W30", "W31", "W32", "W33", "W34", "W35", "W36", "W37", "W38", "W39", "W40", "W42", "W45", "W46", "W49", "W50", "W51", "W52", "W53", "W54", "W55", "W56", "W57", "W58", "W59", "W60", "W61", "W62", "W64", "W65", "W67", "W69", "W73", "W74", "W85", "W86", "W88", "W89", "W90", "W92", "W93", "W94", "W99", "X00", "X01", "X02", "X03", "X04", "X05", "X06", "X08", "X10", "X11", "X12", "X13", "X14", "X15", "X16", "X17", "X18", "X19", "X30", "X31", "X32", "X34", "X35", "X36", "X37", "X38", "X39", "X52", "X58", "X71", "X72", "X73", "X74", "X75", "X76", "X77", "X78", "X79", "X80", "X81", "X82", "X83", "X92", "X93", "X94", "X95", "X96", "X97", "X98", "X99", "Y00", "Y01", "Y02", "Y03", "Y04", "Y07", "Y08", "Y09", "Y21", "Y22", "Y23", "Y24", "Y25", "Y26", "Y27", "Y28", "Y29", "Y30", "Y31", "Y32", "Y33", "Y35", "Y36", "Y37", "Y38", "Y62", "Y63", "Y64", "Y65", "Y66", "Y69", "Y70", "Y71", "Y72", "Y73", "Y74", "Y75", "Y76", "Y77", "Y78", "Y79", "Y80", "Y81", "Y82", "Y83", "Y84", "Y90", "Y92", "Y93", "Y95", "Y99"],
#   "Factors influencing health status and contact with health services": ["Z00", "Z01", "Z02", "Z03", "Z04", "Z08", "Z09", "Z11", "Z12", "Z13", "Z14", "Z15", "Z16", "Z17", "Z18", "Z20", "Z21", "Z22", "Z23", "Z28", "Z30", "Z31", "Z32", "Z33", "Z34", "Z36", "Z3A", "Z37", "Z38", "Z39", "Z40", "Z41", "Z42", "Z43", "Z44", "Z45", "Z46", "Z47", "Z48", "Z49", "Z51", "Z52", "Z53", "Z55", "Z56", "Z57", "Z59", "Z60", "Z62", "Z63", "Z64", "Z65", "Z66", "Z67", "Z68", "Z69", "Z70", "Z71", "Z72", "Z73", "Z74", "Z75", "Z76", "Z77", "Z78", "Z79", "Z80", "Z81", "Z82", "Z83", "Z84", "Z85", "Z86", "Z87", "Z88", "Z89", "Z90", "Z91", "Z92", "Z93", "Z94", "Z95", "Z96", "Z97", "Z98", "Z99"]
# } 



load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/icd10_sub_chapters.expand_range.ICD10_3char.rda"))
icd10_sub_chapters.expand_range.ICD10_3char %>% toJSON(pretty = T)
# > icd10_sub_chapters.expand_range.ICD10_3char %>% toJSON(pretty = T) ------
# {
#   "Intestinal Infectious Diseases": ["A00", "A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09"],
#   "Tuberculosis": ["A15", "A17", "A18", "A19"],
#   "Certain Zoonotic Bacterial Diseases": ["A20", "A21", "A22", "A23", "A24", "A25", "A26", "A27", "A28"],
#   "Other Bacterial Diseases": ["A30", "A31", "A32", "A33", "A34", "A35", "A36", "A37", "A38", "A39", "A40", "A41", "A42", "A43", "A44", "A46", "A48", "A49"],
#   "Infections With A Predominantly Sexual Mode Of Transmission": ["A50", "A51", "A52", "A53", "A54", "A55", "A56", "A57", "A58", "A59", "A60", "A63", "A64"],
#   "Other Spirochetal Diseases": ["A65", "A66", "A67", "A68", "A69"],
#   "Other Diseases Caused By Chlamydiae": ["A70", "A71", "A74"],
#   "Rickettsioses": ["A75", "A77", "A78", "A79"],
#   "Viral And Prion Infections Of The Central Nervous System": ["A80", "A81", "A82", "A83", "A84", "A85", "A86", "A87", "A88", "A89"],
#   "Arthropod-Borne Viral Fevers And Viral Hemorrhagic Fevers": ["A90", "A91", "A92", "A93", "A94", "A95", "A96", "A98", "A99"],
#   "Viral Infections Characterized By Skin And Mucous Membrane Lesions": ["B00", "B01", "B02", "B03", "B04", "B05", "B06", "B07", "B08", "B09"],
#   "Other Human Herpesviruses": ["B10"],
#   "Viral Hepatitis": ["B15", "B16", "B17", "B18", "B19"],
#   "Human Immunodeficiency Virus [HIV] Disease": ["B20"],
#   "Other Viral Diseases": ["B25", "B26", "B27", "B30", "B33", "B34"],
#   "Mycoses": ["B35", "B36", "B37", "B38", "B39", "B40", "B41", "B42", "B43", "B44", "B45", "B46", "B47", "B48", "B49"],
#   "Protozoal Diseases": ["B50", "B51", "B52", "B53", "B54", "B55", "B56", "B57", "B58", "B59", "B60", "B64"],
#   "Helminthiases": ["B65", "B66", "B67", "B68", "B69", "B70", "B71", "B72", "B73", "B74", "B75", "B76", "B77", "B78", "B79", "B80", "B81", "B82", "B83"],
#   "Pediculosis, Acariasis And Other Infestations": ["B85", "B86", "B87", "B88", "B89"],
#   "Sequelae Of Infectious And Parasitic Diseases": ["B90", "B91", "B92", "B94"],
#   "Bacterial And Viral Infectious Agents": ["B95", "B96", "B97"],
#   "Other Infectious Diseases": ["B99"],
#   "Malignant Neoplasms Of Lip, Oral Cavity And Pharynx": ["C00", "C01", "C02", "C03", "C04", "C05", "C06", "C07", "C08", "C09", "C10", "C11", "C12", "C13", "C14"],
#   "Malignant Neoplasms Of Digestive Organs": ["C15", "C16", "C17", "C18", "C19", "C20", "C21", "C22", "C23", "C24", "C25", "C26"],
#   "Malignant Neoplasms Of Respiratory And Intrathoracic Organs": ["C30", "C31", "C32", "C33", "C34", "C37", "C38", "C39"],
#   "Malignant Neoplasms Of Bone And Articular Cartilage": ["C40", "C41"],
#   "Melanoma And Other Malignant Neoplasms Of Skin": ["C43", "C4A", "C44"],
#   "Malignant Neoplasms Of Mesothelial And Soft Tissue": ["C45", "C46", "C47", "C48", "C49"],
#   "Malignant Neoplasms Of Breast": ["C50"],
#   "Malignant Neoplasms Of Female Genital Organs": ["C51", "C52", "C53", "C54", "C55", "C56", "C57", "C58"],
#   "Malignant Neoplasms Of Male Genital Organs": ["C60", "C61", "C62", "C63"],
#   "Malignant Neoplasms Of Urinary Tract": ["C64", "C65", "C66", "C67", "C68"],
#   "Malignant Neoplasms Of Eye, Brain And Other Parts Of Central Nervous System": ["C69", "C70", "C71", "C72"],
#   "Malignant Neoplasms Of Thyroid And Other Endocrine Glands": ["C73", "C74", "C75"],
#   "Malignant Neuroendocrine Tumors": ["C7A"],
#   "Secondary Neuroendocrine Tumors": ["C7B"],
#   "Malignant Neoplasms Of Ill-Defined, Other Secondary And Unspecified Sites": ["C76", "C77", "C78", "C79", "C80"],
#   "Malignant Neoplasms Of Lymphoid, Hematopoietic And Related Tissue": ["C81", "C82", "C83", "C84", "C85", "C86", "C88", "C90", "C91", "C92", "C93", "C94", "C95", "C96"],
#   "In Situ Neoplasms": ["D00", "D01", "D02", "D03", "D04", "D05", "D06", "D07", "D09"],
#   "Benign Neoplasms, Except Benign Neuroendocrine Tumors": ["D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "D25", "D26", "D27", "D28", "D29", "D30", "D31", "D32", "D33", "D34", "D35", "D36"],
#   "Benign Neuroendocrine Tumors": ["D3A"],
#   "Neoplasms Of Uncertain Behavior, Polycythemia Vera And Myelodysplastic Syndromes": ["D37", "D38", "D39", "D40", "D41", "D42", "D43", "D44", "D45", "D46", "D47", "D48"],
#   "Neoplasms Of Unspecified Behavior": ["D49"],
#   "Nutritional Anemias": ["D50", "D51", "D52", "D53"],
#   "Hemolytic Anemias": ["D55", "D56", "D57", "D58", "D59"],
#   "Aplastic And Other Anemias And Other Bone Marrow Failure Syndromes": ["D60", "D61", "D62", "D63", "D64"],
#   "Coagulation Defects, Purpura And Other Hemorrhagic Conditions": ["D65", "D66", "D67", "D68", "D69"],
#   "Other Disorders Of Blood And Blood-Forming Organs": ["D70", "D71", "D72", "D73", "D74", "D75", "D76", "D77"],
#   "Intraoperative And Postprocedural Complications Of The Spleen": ["D78"],
#   "Certain Disorders Involving The Immune Mechanism": ["D80", "D81", "D82", "D83", "D84", "D86", "D89"],
#   "Disorders Of Thyroid Gland": ["E00", "E01", "E02", "E03", "E04", "E05", "E06", "E07"],
#   "Diabetes Mellitus": ["E08", "E09", "E10", "E11", "E13"],
#   "Other Disorders Of Glucose Regulation And Pancreatic Internal Secretion": ["E15", "E16"],
#   "Disorders Of Other Endocrine Glands": ["E20", "E21", "E22", "E23", "E24", "E25", "E26", "E27", "E28", "E29", "E30", "E31", "E32", "E34", "E35"],
#   "Intraoperative Complications Of Endocrine System": ["E36"],
#   "Malnutrition": ["E40", "E41", "E42", "E43", "E44", "E45", "E46"],
#   "Other Nutritional Deficiencies": ["E50", "E51", "E52", "E53", "E54", "E55", "E56", "E58", "E59", "E60", "E61", "E63", "E64"],
#   "Overweight, Obesity And Other Hyperalimentation": ["E65", "E66", "E67", "E68"],
#   "Metabolic Disorders": ["E70", "E71", "E72", "E73", "E74", "E75", "E76", "E77", "E78", "E79", "E80", "E83", "E84", "E85", "E86", "E87", "E88"],
#   "Postprocedural Endocrine And Metabolic Complications And Disorders, Not Elsewhere Classified": ["E89"],
#   "Mental Disorders Due To Known Physiological Conditions": ["F01", "F02", "F03", "F04", "F05", "F06", "F07", "F09"],
#   "Mental And Behavioral Disorders Due To Psychoactive Substance Use": ["F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19"],
#   "Schizophrenia, Schizotypal, Delusional, And Other Non-Mood Psychotic Disorders": ["F20", "F21", "F22", "F23", "F24", "F25", "F28", "F29"],
#   "Mood [Affective] Disorders": ["F30", "F31", "F32", "F33", "F34", "F39"],
#   "Anxiety, Dissociative, Stress-Related, Somatoform And Other Nonpsychotic Mental Disorders": ["F40", "F41", "F42", "F43", "F44", "F45", "F48"],
#   "Behavioral Syndromes Associated With Physiological Disturbances And Physical Factors": ["F50", "F51", "F52", "F53", "F54", "F55", "F59"],
#   "Disorders Of Adult Personality And Behavior": ["F60", "F63", "F64", "F65", "F66", "F68", "F69"],
#   "Intellectual Disabilities": ["F70", "F71", "F72", "F73", "F78", "F79"],
#   "Pervasive And Specific Developmental Disorders": ["F80", "F81", "F82", "F84", "F88", "F89"],
#   "Behavioral And Emotional Disorders With Onset Usually Occurring In Childhood And Adolescence": ["F90", "F91", "F93", "F94", "F95", "F98"],
#   "Unspecified Mental Disorder": ["F99"],
#   "Inflammatory Diseases Of The Central Nervous System": ["G00", "G01", "G02", "G03", "G04", "G05", "G06", "G07", "G08", "G09"],
#   "Systemic Atrophies Primarily Affecting The Central Nervous System": ["G10", "G11", "G12", "G13", "G14"],
#   "Extrapyramidal And Movement Disorders": ["G20", "G21", "G23", "G24", "G25", "G26"],
#   "Other Degenerative Diseases Of The Nervous System": ["G30", "G31", "G32"],
#   "Demyelinating Diseases Of The Central Nervous System": ["G35", "G36", "G37"],
#   "Episodic And Paroxysmal Disorders": ["G40", "G43", "G44", "G45", "G46", "G47"],
#   "Nerve, Nerve Root And Plexus Disorders": ["G50", "G51", "G52", "G53", "G54", "G55", "G56", "G57", "G58", "G59"],
#   "Polyneuropathies And Other Disorders Of The Peripheral Nervous System": ["G60", "G61", "G62", "G63", "G64", "G65"],
#   "Diseases Of Myoneural Junction And Muscle": ["G70", "G71", "G72", "G73"],
#   "Cerebral Palsy And Other Paralytic Syndromes": ["G80", "G81", "G82", "G83"],
#   "Other Disorders Of The Nervous System": ["G89", "G90", "G91", "G92", "G93", "G94", "G95", "G96", "G97", "G98", "G99"],
#   "Disorders Of Eyelid, Lacrimal System And Orbit": ["H00", "H01", "H02", "H04", "H05"],
#   "Disorders Of Conjunctiva": ["H10", "H11"],
#   "Disorders Of Sclera, Cornea, Iris And Ciliary Body": ["H15", "H16", "H17", "H18", "H20", "H21", "H22"],
#   "Disorders Of Lens": ["H25", "H26", "H27", "H28"],
#   "Disorders Of Choroid And Retina": ["H30", "H31", "H32", "H33", "H34", "H35", "H36"],
#   "Glaucoma": ["H40", "H42"],
#   "Disorders Of Vitreous Body And Globe": ["H43", "H44"],
#   "Disorders Of Optic Nerve And Visual Pathways": ["H46", "H47"],
#   "Disorders Of Ocular Muscles, Binocular Movement, Accommodation And Refraction": ["H49", "H50", "H51", "H52"],
#   "Visual Disturbances And Blindness": ["H53", "H54"],
#   "Other Disorders Of Eye And Adnexa": ["H55", "H57"],
#   "Intraoperative And Postprocedural Complications And Disorders Of Eye And Adnexa, Not Elsewhere Classified": ["H59"],
#   "Diseases Of External Ear": ["H60", "H61", "H62"],
#   "Diseases Of Middle Ear And Mastoid": ["H65", "H66", "H67", "H68", "H69", "H70", "H71", "H72", "H73", "H74", "H75"],
#   "Diseases Of Inner Ear": ["H80", "H81", "H82", "H83"],
#   "Other Disorders Of Ear": ["H90", "H91", "H92", "H93", "H94"],
#   "Intraoperative And Postprocedural Complications And Disorders Of Ear And Mastoid Process, Not Elsewhere Classified": ["H95"],
#   "Acute Rheumatic Fever": ["I00", "I01", "I02"],
#   "Chronic Rheumatic Heart Diseases": ["I05", "I06", "I07", "I08", "I09"],
#   "Hypertensive Diseases": ["I10", "I11", "I12", "I13", "I15"],
#   "Ischemic Heart Diseases": ["I20", "I21", "I22", "I23", "I24", "I25"],
#   "Pulmonary Heart Disease And Diseases Of Pulmonary Circulation": ["I26", "I27", "I28"],
#   "Other Forms Of Heart Disease": ["I30", "I31", "I32", "I33", "I34", "I35", "I36", "I37", "I38", "I39", "I40", "I41", "I42", "I43", "I44", "I45", "I46", "I47", "I48", "I49", "I50", "I51", "I52"],
#   "Cerebrovascular Diseases": ["I60", "I61", "I62", "I63", "I65", "I66", "I67", "I68", "I69"],
#   "Diseases Of Arteries, Arterioles And Capillaries": ["I70", "I71", "I72", "I73", "I74", "I75", "I76", "I77", "I78", "I79"],
#   "Diseases Of Veins, Lymphatic Vessels And Lymph Nodes, Not Elsewhere Classified": ["I80", "I81", "I82", "I83", "I85", "I86", "I87", "I88", "I89"],
#   "Other And Unspecified Disorders Of The Circulatory System": ["I95", "I96", "I97", "I99"],
#   "Acute Upper Respiratory Infections": ["J00", "J01", "J02", "J03", "J04", "J05", "J06"],
#   "Influenza And Pneumonia": ["J09", "J10", "J11", "J12", "J13", "J14", "J15", "J16", "J17", "J18"],
#   "Other Acute Lower Respiratory Infections": ["J20", "J21", "J22"],
#   "Other Diseases Of Upper Respiratory Tract": ["J30", "J31", "J32", "J33", "J34", "J35", "J36", "J37", "J38", "J39"],
#   "Chronic Lower Respiratory Diseases": ["J40", "J41", "J42", "J43", "J44", "J45", "J47"],
#   "Lung Diseases Due To External Agents": ["J60", "J61", "J62", "J63", "J64", "J65", "J66", "J67", "J68", "J69", "J70"],
#   "Other Respiratory Diseases Principally Affecting The Interstitium": ["J80", "J81", "J82", "J84"],
#   "Suppurative And Necrotic Conditions Of The Lower Respiratory Tract": ["J85", "J86"],
#   "Other Diseases Of The Pleura": ["J90", "J91", "J92", "J93", "J94"],
#   "Intraoperative And Postprocedural Complications And Disorders Of Respiratory System, Not Elsewhere Classified": ["J95"],
#   "Other Diseases Of The Respiratory System": ["J96", "J98", "J99"],
#   "Diseases Of Oral Cavity And Salivary Glands": ["K00", "K01", "K02", "K03", "K04", "K05", "K06", "K08", "K09", "K11", "K12", "K13", "K14"],
#   "Diseases Of Esophagus, Stomach And Duodenum": ["K20", "K21", "K22", "K23", "K25", "K26", "K27", "K28", "K29", "K30", "K31"],
#   "Diseases Of Appendix": ["K35", "K36", "K37", "K38"],
#   "Hernia": ["K40", "K41", "K42", "K43", "K44", "K45", "K46"],
#   "Noninfective Enteritis And Colitis": ["K50", "K51", "K52"],
#   "Other Diseases Of Intestines": ["K55", "K56", "K57", "K58", "K59", "K60", "K61", "K62", "K63", "K64"],
#   "Diseases Of Peritoneum And Retroperitoneum": ["K65", "K66", "K67", "K68"],
#   "Diseases Of Liver": ["K70", "K71", "K72", "K73", "K74", "K75", "K76", "K77"],
#   "Disorders Of Gallbladder, Biliary Tract And Pancreas": ["K80", "K81", "K82", "K83", "K85", "K86", "K87"],
#   "Other Diseases Of The Digestive System": ["K90", "K91", "K92", "K94", "K95"],
#   "Infections Of The Skin And Subcutaneous Tissue": ["L00", "L01", "L02", "L03", "L04", "L05", "L08"],
#   "Bullous Disorders": ["L10", "L11", "L12", "L13", "L14"],
#   "Dermatitis And Eczema": ["L20", "L21", "L22", "L23", "L24", "L25", "L26", "L27", "L28", "L29", "L30"],
#   "Papulosquamous Disorders": ["L40", "L41", "L42", "L43", "L44", "L45"],
#   "Urticaria And Erythema": ["L49", "L50", "L51", "L52", "L53", "L54"],
#   "Radiation-Related Disorders Of The Skin And Subcutaneous Tissue": ["L55", "L56", "L57", "L58", "L59"],
#   "Disorders Of Skin Appendages": ["L60", "L62", "L63", "L64", "L65", "L66", "L67", "L68", "L70", "L71", "L72", "L73", "L74", "L75"],
#   "Intraoperative And Postprocedural Complications Of Skin And Subcutaneous Tissue": ["L76"],
#   "Other Disorders Of The Skin And Subcutaneous Tissue": ["L80", "L81", "L82", "L83", "L84", "L85", "L86", "L87", "L88", "L89", "L90", "L91", "L92", "L93", "L94", "L95", "L97", "L98", "L99"],
#   "Infectious Arthropathies": ["M00", "M01", "M02"],
#   "Inflammatory Polyarthropathies": ["M05", "M06", "M07", "M08", "M1A", "M10", "M11", "M12", "M13", "M14"],
#   "Osteoarthritis": ["M15", "M16", "M17", "M18", "M19"],
#   "Other Joint Disorders": ["M20", "M21", "M22", "M23", "M24", "M25"],
#   "Dentofacial Anomalies [Including Malocclusion] And Other Disorders Of Jaw": ["M26", "M27"],
#   "Systemic Connective Tissue Disorders": ["M30", "M31", "M32", "M33", "M34", "M35", "M36"],
#   "Deforming Dorsopathies": ["M40", "M41", "M42", "M43"],
#   "Spondylopathies": ["M45", "M46", "M47", "M48", "M49"],
#   "Other Dorsopathies": ["M50", "M51", "M53", "M54"],
#   "Disorders Of Muscles": ["M60", "M61", "M62", "M63"],
#   "Disorders Of Synovium And Tendon": ["M65", "M66", "M67"],
#   "Other Soft Tissue Disorders": ["M70", "M71", "M72", "M75", "M76", "M77", "M79"],
#   "Disorders Of Bone Density And Structure": ["M80", "M81", "M83", "M84", "M85"],
#   "Other Osteopathies": ["M86", "M87", "M88", "M89", "M90"],
#   "Chondropathies": ["M91", "M92", "M93", "M94"],
#   "Other Disorders Of The Musculoskeletal System And Connective Tissue": ["M95"],
#   "Intraoperative And Postprocedural Complications And Disorders Of Musculoskeletal System, Not Elsewhere Classified": ["M96"],
#   "Biomechanical Lesions, Not Elsewhere Classified": ["M99"],
#   "Glomerular Diseases": ["N00", "N01", "N02", "N03", "N04", "N05", "N06", "N07", "N08"],
#   "Renal Tubulo-Interstitial Diseases": ["N10", "N11", "N12", "N13", "N14", "N15", "N16"],
#   "Acute Kidney Failure And Chronic Kidney Disease": ["N17", "N18", "N19"],
#   "Urolithiasis": ["N20", "N21", "N22", "N23"],
#   "Other Disorders Of Kidney And Ureter": ["N25", "N26", "N27", "N28", "N29"],
#   "Other Diseases Of The Urinary System": ["N30", "N31", "N32", "N33", "N34", "N35", "N36", "N37", "N39"],
#   "Diseases Of Male Genital Organs": ["N40", "N41", "N42", "N43", "N44", "N45", "N46", "N47", "N48", "N49", "N50", "N51", "N52", "N53"],
#   "Disorders Of Breast": ["N60", "N61", "N62", "N63", "N64", "N65"],
#   "Inflammatory Diseases Of Female Pelvic Organs": ["N70", "N71", "N72", "N73", "N74", "N75", "N76", "N77"],
#   "Noninflammatory Disorders Of Female Genital Tract": ["N80", "N81", "N82", "N83", "N84", "N85", "N86", "N87", "N88", "N89", "N90", "N91", "N92", "N93", "N94", "N95", "N96", "N97", "N98"],
#   "Intraoperative And Postprocedural Complications And Disorders Of Genitourinary System, Not Elsewhere Classified": ["N99"],
#   "Pregnancy With Abortive Outcome": ["O00", "O01", "O02", "O03", "O04", "O07", "O08"],
#   "Supervision Of High Risk Pregnancy": ["O09"],
#   "Edema, Proteinuria And Hypertensive Disorders In Pregnancy, Childbirth And The Puerperium": ["O10", "O11", "O12", "O13", "O14", "O15", "O16"],
#   "Other Maternal Disorders Predominantly Related To Pregnancy": ["O20", "O21", "O22", "O23", "O24", "O25", "O26", "O28", "O29"],
#   "Maternal Care Related To The Fetus And Amniotic Cavity And Possible Delivery Problems": ["O30", "O31", "O32", "O33", "O34", "O35", "O36", "O40", "O41", "O42", "O43", "O44", "O45", "O46", "O47", "O48"],
#   "Complications Of Labor And Delivery": ["O60", "O61", "O62", "O63", "O64", "O65", "O66", "O67", "O68", "O69", "O70", "O71", "O72", "O73", "O74", "O75", "O76", "O77"],
#   "Encounter For Delivery": ["O80", "O82"],
#   "Complications Predominantly Related To The Puerperium": ["O85", "O86", "O87", "O88", "O89", "O90", "O91", "O92"],
#   "Other Obstetric Conditions, Not Elsewhere Classified": ["O94", "O98", "O99", "O9A"],
#   "Newborn Affected By Maternal Factors And By Complications Of Pregnancy, Labor, And Delivery": ["P00", "P01", "P02", "P03", "P04"],
#   "Disorders Of Newborn Related To Length Of Gestation And Fetal Growth": ["P05", "P07", "P08"],
#   "Abnormal Findings On Neonatal Screening": ["P09"],
#   "Birth Trauma": ["P10", "P11", "P12", "P13", "P14", "P15"],
#   "Respiratory And Cardiovascular Disorders Specific To The Perinatal Period": ["P19", "P22", "P23", "P24", "P25", "P26", "P27", "P28", "P29"],
#   "Infections Specific To The Perinatal Period": ["P35", "P36", "P37", "P38", "P39"],
#   "Hemorrhagic And Hematological Disorders Of Newborn": ["P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57", "P58", "P59", "P60", "P61"],
#   "Transitory Endocrine And Metabolic Disorders Specific To Newborn": ["P70", "P71", "P72", "P74"],
#   "Digestive System Disorders Of Newborn": ["P76", "P77", "P78"],
#   "Conditions Involving The Integument And Temperature Regulation Of Newborn": ["P80", "P81", "P83"],
#   "Other Problems With Newborn": ["P84"],
#   "Other Disorders Originating In The Perinatal Period": ["P90", "P91", "P92", "P93", "P94", "P95", "P96"],
#   "Congenital Malformations Of The Nervous System": ["Q00", "Q01", "Q02", "Q03", "Q04", "Q05", "Q06", "Q07"],
#   "Congenital Malformations Of Eye, Ear, Face And Neck": ["Q10", "Q11", "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", "Q18"],
#   "Congenital Malformations Of The Circulatory System": ["Q20", "Q21", "Q22", "Q23", "Q24", "Q25", "Q26", "Q27", "Q28"],
#   "Congenital Malformations Of The Respiratory System": ["Q30", "Q31", "Q32", "Q33", "Q34"],
#   "Cleft Lip And Cleft Palate": ["Q35", "Q36", "Q37"],
#   "Other Congenital Malformations Of The Digestive System": ["Q38", "Q39", "Q40", "Q41", "Q42", "Q43", "Q44", "Q45"],
#   "Congenital Malformations Of Genital Organs": ["Q50", "Q51", "Q52", "Q53", "Q54", "Q55", "Q56"],
#   "Congenital Malformations Of The Urinary System": ["Q60", "Q61", "Q62", "Q63", "Q64"],
#   "Congenital Malformations And Deformations Of The Musculoskeletal System": ["Q65", "Q66", "Q67", "Q68", "Q69", "Q70", "Q71", "Q72", "Q73", "Q74", "Q75", "Q76", "Q77", "Q78", "Q79"],
#   "Other Congenital Malformations": ["Q80", "Q81", "Q82", "Q83", "Q84", "Q85", "Q86", "Q87", "Q89"],
#   "Chromosomal Abnormalities, Not Elsewhere Classified": ["Q90", "Q91", "Q92", "Q93", "Q95", "Q96", "Q97", "Q98", "Q99"],
#   "Symptoms And Signs Involving The Circulatory And Respiratory Systems": ["R00", "R01", "R03", "R04", "R05", "R06", "R07", "R09"],
#   "Symptoms And Signs Involving The Digestive System And Abdomen": ["R10", "R11", "R12", "R13", "R14", "R15", "R16", "R17", "R18", "R19"],
#   "Symptoms And Signs Involving The Skin And Subcutaneous Tissue": ["R20", "R21", "R22", "R23"],
#   "Symptoms And Signs Involving The Nervous And Musculoskeletal Systems": ["R25", "R26", "R27", "R29"],
#   "Symptoms And Signs Involving The Genitourinary System": ["R30", "R31", "R32", "R33", "R34", "R35", "R36", "R37", "R39"],
#   "Symptoms And Signs Involving Cognition, Perception, Emotional State And Behavior": ["R40", "R41", "R42", "R43", "R44", "R45", "R46"],
#   "Symptoms And Signs Involving Speech And Voice": ["R47", "R48", "R49"],
#   "General Symptoms And Signs": ["R50", "R51", "R52", "R53", "R54", "R55", "R56", "R57", "R58", "R59", "R60", "R61", "R62", "R63", "R64", "R65", "R68", "R69"],
#   "Abnormal Findings On Examination Of Blood, Without Diagnosis": ["R70", "R71", "R73", "R74", "R75", "R76", "R77", "R78", "R79"],
#   "Abnormal Findings On Examination Of Urine, Without Diagnosis": ["R80", "R81", "R82"],
#   "Abnormal Findings On Examination Of Other Body Fluids, Substances And Tissues, Without Diagnosis": ["R83", "R84", "R85", "R86", "R87", "R88", "R89"],
#   "Abnormal Findings On Diagnostic Imaging And In Function Studies, Without Diagnosis": ["R90", "R91", "R92", "R93", "R94"],
#   "Abnormal Tumor Markers": ["R97"],
#   "Ill-Defined And Unknown Cause Of Mortality": ["R99"],
#   "Injuries To The Head": ["S00", "S01", "S02", "S03", "S04", "S05", "S06", "S07", "S08", "S09"],
#   "Injuries To The Neck": ["S10", "S11", "S12", "S13", "S14", "S15", "S16", "S17", "S19"],
#   "Injuries To The Thorax": ["S20", "S21", "S22", "S23", "S24", "S25", "S26", "S27", "S28", "S29"],
#   "Injuries To The Abdomen, Lower Back, Lumbar Spine, Pelvis And External Genitals": ["S30", "S31", "S32", "S33", "S34", "S35", "S36", "S37", "S38", "S39"],
#   "Injuries To The Shoulder And Upper Arm": ["S40", "S41", "S42", "S43", "S44", "S45", "S46", "S47", "S48", "S49"],
#   "Injuries To The Elbow And Forearm": ["S50", "S51", "S52", "S53", "S54", "S55", "S56", "S57", "S58", "S59"],
#   "Injuries To The Wrist, Hand And Fingers": ["S60", "S61", "S62", "S63", "S64", "S65", "S66", "S67", "S68", "S69"],
#   "Injuries To The Hip And Thigh": ["S70", "S71", "S72", "S73", "S74", "S75", "S76", "S77", "S78", "S79"],
#   "Injuries To The Knee And Lower Leg": ["S80", "S81", "S82", "S83", "S84", "S85", "S86", "S87", "S88", "S89"],
#   "Injuries To The Ankle And Foot": ["S90", "S91", "S92", "S93", "S94", "S95", "S96", "S97", "S98", "S99"],
#   "Injuries Involving Multiple Body Regions": ["T07"],
#   "Injury Of Unspecified Body Region": ["T14"],
#   "Effects Of Foreign Body Entering Through Natural Orifice": ["T15", "T16", "T17", "T18", "T19"],
#   "Burns And Corrosions Of External Body Surface, Specified By Site": ["T20", "T21", "T22", "T23", "T24", "T25"],
#   "Burns And Corrosions Confined To Eye And Internal Organs": ["T26", "T27", "T28"],
#   "Burns And Corrosions Of Multiple And Unspecified Body Regions": ["T30", "T31", "T32"],
#   "Frostbite": ["T33", "T34"],
#   "Poisoning By, Adverse Effects Of And Underdosing Of Drugs, Medicaments And Biological Substances": ["T36", "T37", "T38", "T39", "T40", "T41", "T42", "T43", "T44", "T45", "T46", "T47", "T48", "T49", "T50"],
#   "Toxic Effects Of Substances Chiefly Nonmedicinal As To Source": ["T51", "T52", "T53", "T54", "T55", "T56", "T57", "T58", "T59", "T60", "T61", "T62", "T63", "T64", "T65"],
#   "Other And Unspecified Effects Of External Causes": ["T66", "T67", "T68", "T69", "T70", "T71", "T73", "T74", "T75", "T76", "T78"],
#   "Certain Early Complications Of Trauma": ["T79"],
#   "Complications Of Surgical And Medical Care, Not Elsewhere Classified": ["T80", "T81", "T82", "T83", "T84", "T85", "T86", "T87", "T88"],
#   "Pedestrian Injured In Transport Accident": ["V00", "V01", "V02", "V03", "V04", "V05", "V06", "V09"],
#   "Pedal Cycle Rider Injured In Transport Accident": ["V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19"],
#   "Motorcycle Rider Injured In Transport Accident": ["V20", "V21", "V22", "V23", "V24", "V25", "V26", "V27", "V28", "V29"],
#   "Occupant Of Three-Wheeled Motor Vehicle Injured In Transport Accident": ["V30", "V31", "V32", "V33", "V34", "V35", "V36", "V37", "V38", "V39"],
#   "Car Occupant Injured In Transport Accident": ["V40", "V41", "V42", "V43", "V44", "V45", "V46", "V47", "V48", "V49"],
#   "Occupant Of Pick-Up Truck Or Van Injured In Transport Accident": ["V50", "V51", "V52", "V53", "V54", "V55", "V56", "V57", "V58", "V59"],
#   "Occupant Of Heavy Transport Vehicle Injured In Transport Accident": ["V60", "V61", "V62", "V63", "V64", "V65", "V66", "V67", "V68", "V69"],
#   "Bus Occupant Injured In Transport Accident": ["V70", "V71", "V72", "V73", "V74", "V75", "V76", "V77", "V78", "V79"],
#   "Other Land Transport Accidents": ["V80", "V81", "V82", "V83", "V84", "V85", "V86", "V87", "V88", "V89"],
#   "Water Transport Accidents": ["V90", "V91", "V92", "V93", "V94"],
#   "Air And Space Transport Accidents": ["V95", "V96", "V97"],
#   "Other And Unspecified Transport Accidents": ["V98", "V99"],
#   "Slipping, Tripping, Stumbling And Falls": ["W00", "W01", "W03", "W04", "W05", "W06", "W07", "W08", "W09", "W10", "W11", "W12", "W13", "W14", "W15", "W16", "W17", "W18", "W19"],
#   "Exposure To Inanimate Mechanical Forces": ["W20", "W21", "W22", "W23", "W24", "W25", "W26", "W27", "W28", "W29", "W30", "W31", "W32", "W33", "W34", "W35", "W36", "W37", "W38", "W39", "W40", "W42", "W45", "W46", "W49"],
#   "Exposure To Animate Mechanical Forces": ["W50", "W51", "W52", "W53", "W54", "W55", "W56", "W57", "W58", "W59", "W60", "W61", "W62", "W64"],
#   "Accidental Non-Transport Drowning And Submersion": ["W65", "W67", "W69", "W73", "W74"],
#   "Exposure To Electric Current, Radiation And Extreme Ambient Air Temperature And Pressure": ["W85", "W86", "W88", "W89", "W90", "W92", "W93", "W94", "W99"],
#   "Exposure To Smoke, Fire And Flames": ["X00", "X01", "X02", "X03", "X04", "X05", "X06", "X08"],
#   "Contact With Heat And Hot Substances": ["X10", "X11", "X12", "X13", "X14", "X15", "X16", "X17", "X18", "X19"],
#   "Exposure To Forces Of Nature": ["X30", "X31", "X32", "X34", "X35", "X36", "X37", "X38", "X39"],
#   "Accidental Exposure To Other Specified Factors": ["X52", "X58"],
#   "Intentional Self-Harm": ["X71", "X72", "X73", "X74", "X75", "X76", "X77", "X78", "X79", "X80", "X81", "X82", "X83"],
#   "Assault": ["X92", "X93", "X94", "X95", "X96", "X97", "X98", "X99", "Y00", "Y01", "Y02", "Y03", "Y04", "Y07", "Y08", "Y09"],
#   "Event Of Undetermined Intent": ["Y21", "Y22", "Y23", "Y24", "Y25", "Y26", "Y27", "Y28", "Y29", "Y30", "Y31", "Y32", "Y33"],
#   "Legal Intervention, Operations Of War, Military Operations, And Terrorism": ["Y35", "Y36", "Y37", "Y38"],
#   "Misadventures To Patients During Surgical And Medical Care": ["Y62", "Y63", "Y64", "Y65", "Y66", "Y69"],
#   "Medical Devices Associated With Adverse Incidents In Diagnostic And Therapeutic Use": ["Y70", "Y71", "Y72", "Y73", "Y74", "Y75", "Y76", "Y77", "Y78", "Y79", "Y80", "Y81", "Y82"],
#   "Surgical And Other Medical Procedures As The Cause Of Abnormal Reaction Of The Patient, Or Of Later Complication, Without Mention Of Misadventure At The Time Of The Procedure": ["Y83", "Y84"],
#   "Supplementary Factors Related To Causes Of Morbidity Classified Elsewhere": ["Y90", "Y92", "Y93", "Y95", "Y99"],
#   "Persons Encountering Health Services For Examinations": ["Z00", "Z01", "Z02", "Z03", "Z04", "Z08", "Z09", "Z11", "Z12", "Z13"],
#   "Genetic Carrier And Genetic Susceptibility To Disease": ["Z14", "Z15"],
#   "Resistance To Antimicrobial Drugs": ["Z16"],
#   "Estrogen Receptor Status": ["Z17"],
#   "Retained Foreign Body Fragments": ["Z18"],
#   "Persons With Potential Health Hazards Related To Communicable Diseases": ["Z20", "Z21", "Z22", "Z23", "Z28"],
#   "Persons Encountering Health Services In Circumstances Related To Reproduction": ["Z30", "Z31", "Z32", "Z33", "Z34", "Z36", "Z3A", "Z37", "Z38", "Z39"],
#   "Encounters For Other Specific Health Care": ["Z40", "Z41", "Z42", "Z43", "Z44", "Z45", "Z46", "Z47", "Z48", "Z49", "Z51", "Z52", "Z53"],
#   "Persons With Potential Health Hazards Related To Socioeconomic And Psychosocial Circumstances": ["Z55", "Z56", "Z57", "Z59", "Z60", "Z62", "Z63", "Z64", "Z65"],
#   "Do Not Resuscitate Status": ["Z66"],
#   "Blood Type": ["Z67"],
#   "Body Mass Index [BMI]": ["Z68"],
#   "Persons Encountering Health Services In Other Circumstances": ["Z69", "Z70", "Z71", "Z72", "Z73", "Z74", "Z75", "Z76"],
#   "Persons With Potential Health Hazards Related To Family And Personal History And Certain Conditions Influencing Health Status": ["Z77", "Z78", "Z79", "Z80", "Z81", "Z82", "Z83", "Z84", "Z85", "Z86", "Z87", "Z88", "Z89", "Z90", "Z91", "Z92", "Z93", "Z94", "Z95", "Z96", "Z97", "Z98", "Z99"]
# } 
















#@ end -----  
save(icd10_chapters, file = "icd10_chapters.rda")
save(icd10_sub_chapters, file = "icd10_sub_chapters.rda")

save(icd10_chapters.expand_range, file = "icd10_chapters.expand_range.rda")
save(icd10_chapters.expand_range.ICD10_3char, file = "icd10_chapters.expand_range.ICD10_3char.rda")

save(icd10_sub_chapters.expand_range, file = "icd10_sub_chapters.expand_range.rda")
save(icd10_sub_chapters.expand_range.ICD10_3char, file = "icd10_sub_chapters.expand_range.ICD10_3char.rda")



openxlsx::write.xlsx(icd10_chapters.expand_range, file = "icd10_chapters.expand_range.xlsx", asTable=TRUE)
# > openxlsx::write.xlsx(icd10_chapters.expand_range, file = "icd10_chapters.expand_range.xlsx", asTable=TRUE)
# Error in writeDataTable(wb = wb, sheet = i, x = x[[i]], startCol = startCol[[i]],  : 
#   x must be a data.frame.
# In addition: Warning message:
# In openxlsx::write.xlsx(icd10_chapters.expand_range, file = "icd10_chapters.expand_range.xlsx",  :
#   Truncating list names to 31 characters.

openxlsx::write.xlsx(ICD10_3char_sub_chapter.tibble, file = "ICD10_3char_sub_chapter.tibble.xlsx", asTable=TRUE)



library(jsonlite)
icd10_chapters %>% toJSON(pretty = T) %>% write("icd10_chapters.json")
icd10_sub_chapters %>% toJSON(pretty = T) %>% write("icd10_sub_chapters.json")

icd10_chapters.expand_range %>% toJSON(pretty = T) %>% write("icd10_chapters.expand_range.json")
icd10_chapters.expand_range.ICD10_3char %>% toJSON(pretty = T) %>% write("icd10_chapters.expand_range.ICD10_3char.json")


icd10_sub_chapters.expand_range %>% toJSON(pretty = T) %>% write("icd10_sub_chapters.expand_range.json")
icd10_sub_chapters.expand_range.ICD10_3char %>% toJSON(pretty = T) %>% write("icd10_sub_chapters.expand_range.ICD10_3char.json")


