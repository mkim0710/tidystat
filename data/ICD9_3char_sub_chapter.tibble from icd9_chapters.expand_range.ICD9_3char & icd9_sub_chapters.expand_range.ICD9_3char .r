#@ ICD9_3char_sub_chapter.tibble from icd9_chapters.expand_range.ICD9_3char & icd9_sub_chapters.expand_range.ICD9_3char .r  

library(tidyverse)
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/icd9_chapters.expand_range.ICD9_3char.rda"))
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/icd9_sub_chapters.expand_range.ICD9_3char.rda"))

icd9_chapters.expand_range.ICD9_3char |> str() #----
icd9_sub_chapters.expand_range.ICD9_3char |> str() #----
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










# @ icd9_chapters.expand_range.ICD9_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% enframe ----  
icd9_chapters.expand_range.ICD9_3char |> str()
icd9_chapters.expand_range.ICD9_3char %>% reduce(c) |> str()
icd9_chapters.expand_range.ICD9_3char |> names() |> str()
icd9_chapters.expand_range.ICD9_3char %>% {rep(names(.), times = map_dbl(., length))} |> str()
icd9_chapters.expand_range.ICD9_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} |> str()
icd9_chapters.expand_range.ICD9_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% enframe
# > icd9_chapters.expand_range.ICD9_3char |> str()
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
# > icd9_chapters.expand_range.ICD9_3char %>% reduce(c) |> str()
#  chr [1:1042] "001" "002" "003" "004" "005" "006" "007" "008" "009" "010" "011" "012" "013" "014" "015" "016" "017" ...
# > icd9_chapters.expand_range.ICD9_3char |> names() |> str()
#  chr [1:19] "Infectious And Parasitic Diseases" "Neoplasms" ...
# > icd9_chapters.expand_range.ICD9_3char %>% {rep(names(.), times = map_dbl(., length))} |> str()
#  chr [1:1042] "Infectious And Parasitic Diseases" "Infectious And Parasitic Diseases" ...
# > icd9_chapters.expand_range.ICD9_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} |> str()
#  Named chr [1:1042] "001" "002" "003" "004" "005" "006" "007" "008" "009" "010" "011" "012" "013" "014" "015" "016" ...
#  - attr(*, "names")= chr [1:1042] "Infectious And Parasitic Diseases" "Infectious And Parasitic Diseases" "Infectious And Parasitic Diseases" "Infectious And Parasitic Diseases" ...
# > icd9_chapters.expand_range.ICD9_3char %>% {set_names(reduce(., c), rep(names(.), times = map_dbl(., length)))} %>% enframe
# # A tibble: 1,042 x 2
#    name                              value
#    <chr>                             <chr>
#  1 Infectious And Parasitic Diseases 001  
#  2 Infectious And Parasitic Diseases 002  
#  3 Infectious And Parasitic Diseases 003  
#  4 Infectious And Parasitic Diseases 004  
#  5 Infectious And Parasitic Diseases 005  
#  6 Infectious And Parasitic Diseases 006  
#  7 Infectious And Parasitic Diseases 007  
#  8 Infectious And Parasitic Diseases 008  
#  9 Infectious And Parasitic Diseases 009  
# 10 Infectious And Parasitic Diseases 010  
# # ... with 1,032 more rows











# @ icd9_chapters.expand_range.ICD9_3char %>% enframe %>% unnest ----  
icd9_chapters.expand_range.ICD9_3char %>% enframe #----
icd9_chapters.expand_range.ICD9_3char %>% enframe %>% unnest #----
# > icd9_chapters.expand_range.ICD9_3char %>% enframe #----  
# # A tibble: 19 x 2
#    name                                                                                               value      
#    <chr>                                                                                              <list>     
#  1 Infectious And Parasitic Diseases                                                                  <chr [123]>
#  2 Neoplasms                                                                                          <chr [94]> 
#  3 Endocrine, Nutritional And Metabolic Diseases, And Immunity Disorders                              <chr [38]> 
#  4 Diseases Of The Blood And Blood-Forming Organs                                                     <chr [10]> 
#  5 Mental Disorders                                                                                   <chr [30]> 
#  6 Diseases Of The Nervous System And Sense Organs                                                    <chr [68]> 
#  7 Diseases Of The Circulatory System                                                                 <chr [60]> 
#  8 Diseases Of The Respiratory System                                                                 <chr [51]> 
#  9 Diseases Of The Digestive System                                                                   <chr [50]> 
# 10 Diseases Of The Genitourinary System                                                               <chr [48]> 
# 11 Complications Of Pregnancy, Childbirth, And The Puerperium                                         <chr [50]> 
# 12 Diseases Of The Skin And Subcutaneous Tissue                                                       <chr [26]> 
# 13 Diseases Of The Musculoskeletal System And Connective Tissue                                       <chr [30]> 
# 14 Congenital Anomalies                                                                               <chr [20]> 
# 15 Certain Conditions Originating In The Perinatal Period                                             <chr [20]> 
# 16 Symptoms, Signs, And Ill-Defined Conditions                                                        <chr [20]> 
# 17 Injury And Poisoning                                                                               <chr [190]>
# 18 Supplementary Classification Of Factors Influencing Health Status And Contact With Health Services <chr [90]> 
# 19 Supplementary Classification Of External Causes Of Injury And Poisoning                            <chr [24]> 
# > icd9_chapters.expand_range.ICD9_3char %>% enframe %>% unnest #----  
# # A tibble: 1,042 x 2
#    name                              value
#    <chr>                             <chr>
#  1 Infectious And Parasitic Diseases 001  
#  2 Infectious And Parasitic Diseases 002  
#  3 Infectious And Parasitic Diseases 003  
#  4 Infectious And Parasitic Diseases 004  
#  5 Infectious And Parasitic Diseases 005  
#  6 Infectious And Parasitic Diseases 006  
#  7 Infectious And Parasitic Diseases 007  
#  8 Infectious And Parasitic Diseases 008  
#  9 Infectious And Parasitic Diseases 009  
# 10 Infectious And Parasitic Diseases 010  
# # ... with 1,032 more rows
# Warning message:
# `cols` is now required when using unnest().
# Please use `cols = c(value)` 



full_join(
    (icd9_chapters.expand_range.ICD9_3char %>% enframe(name = "chapter", value = "ICD9_3char") %>% unnest)
    , (icd9_sub_chapters.expand_range.ICD9_3char %>% enframe(name = "sub_chapter", value = "ICD9_3char") %>% unnest)
    , by = "ICD9_3char"
) %>% select(ICD9_3char, sub_chapter, chapter)
# > full_join(
# +     (icd9_chapters.expand_range.ICD9_3char %>% enframe(name = "chapter", value = "ICD9_3char") %>% unnest)
# +     , (icd9_sub_chapters.expand_range.ICD9_3char %>% enframe(name = "sub_chapter", value = "ICD9_3char") %>% unnest)
# +     , by = "ICD9_3char"
# + ) %>% select(ICD9_3char, sub_chapter, chapter)
# # A tibble: 1,903 x 3
#    ICD9_3char sub_chapter                    chapter                                  
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


icd9_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD9_range_chapter") %>% unnest
icd9_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD9_range_sub_chapter") %>% unnest
# > full_join(
# +     (icd9_chapters.expand_range.ICD9_3char %>% enframe(name = "chapter", value = "ICD9_3char") %>% unnest)
# +     , (icd9_sub_chapters.expand_range.ICD9_3char %>% enframe(name = "sub_chapter", value = "ICD9_3char") %>% unnest)
# +     , by = "ICD9_3char"
# + ) %>% select(ICD9_3char, sub_chapter, chapter)
# # A tibble: 1,050 x 3
#    ICD9_3char sub_chapter                    chapter                          
#    <chr>      <chr>                          <chr>                            
#  1 001        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  2 002        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  3 003        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  4 004        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  5 005        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  6 006        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  7 007        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  8 008        Intestinal Infectious Diseases Infectious And Parasitic Diseases
#  9 009        Intestinal Infectious Diseases Infectious And Parasitic Diseases
# 10 010        Tuberculosis                   Infectious And Parasitic Diseases
# # ... with 1,040 more rows
# Warning messages:
# 1: `cols` is now required when using unnest().
# Please use `cols = c(ICD9_3char)` 
# 2: `cols` is now required when using unnest().
# Please use `cols = c(ICD9_3char)` 








# @ ICD9_3char_sub_chapter.tibble ICD9_3char_sub_chapter.tibble from icd9_chapters.expand_range.ICD9_3char & icd9_sub_chapters.expand_range.ICD9_3char ====  
ICD9_3char_sub_chapter.tibble = 
    full_join(
        (icd9_chapters.expand_range.ICD9_3char %>% enframe(name = "chapter", value = "ICD9_3char") %>% unnest)
        , (icd9_sub_chapters.expand_range.ICD9_3char %>% enframe(name = "sub_chapter", value = "ICD9_3char") %>% unnest)
        , by = "ICD9_3char"
    ) %>% 
    left_join((icd9_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD9_range_chapter") %>% unnest)) %>% 
    left_join((icd9_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD9_range_sub_chapter") %>% unnest)) %>% 
    select(ICD9_3char, ICD9_range_sub_chapter, sub_chapter, ICD9_range_chapter, chapter)
ICD9_3char_sub_chapter.tibble
# > ICD9_3char_sub_chapter.tibble = 
# +     full_join(
# +         (icd9_chapters.expand_range.ICD9_3char %>% enframe(name = "chapter", value = "ICD9_3char") %>% unnest)
# +         , (icd9_sub_chapters.expand_range.ICD9_3char %>% enframe(name = "sub_chapter", value = "ICD9_3char") %>% unnest)
# +         , by = "ICD9_3char"
# +     ) %>% 
# +     left_join((icd9_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "chapter", value = "ICD9_range_chapter") %>% unnest)) %>% 
# +     left_join((icd9_sub_chapters %>% map(function(x) paste0(x, collapse = "-")) %>% enframe(name = "sub_chapter", value = "ICD9_range_sub_chapter") %>% unnest)) %>% 
# +     select(ICD9_3char, ICD9_range_sub_chapter, sub_chapter, ICD9_range_chapter, chapter)
# Joining, by = "chapter"
# Joining, by = "sub_chapter"
# Warning messages:
# 1: `cols` is now required when using unnest().
# Please use `cols = c(ICD9_3char)` 
# 2: `cols` is now required when using unnest().
# Please use `cols = c(ICD9_3char)` 
# 3: `cols` is now required when using unnest().
# Please use `cols = c(ICD9_range_chapter)` 
# 4: `cols` is now required when using unnest().
# Please use `cols = c(ICD9_range_sub_chapter)` 
# > ICD9_3char_sub_chapter.tibble
# # A tibble: 1,050 x 5
#    ICD9_3char ICD9_range_sub_chapter sub_chapter                    ICD9_range_chapter chapter                          
#    <chr>      <chr>                  <chr>                          <chr>              <chr>                            
#  1 001        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  2 002        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  3 003        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  4 004        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  5 005        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  6 006        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  7 007        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  8 008        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
#  9 009        001-009                Intestinal Infectious Diseases 001-139            Infectious And Parasitic Diseases
# 10 010        010-018                Tuberculosis                   001-139            Infectious And Parasitic Diseases
# # ... with 1,040 more rows





# @ end ----  
save(ICD9_3char_sub_chapter.tibble, file = "ICD9_3char_sub_chapter.tibble.rda")



# @ end -----  

getwd()
.path4write = env1$path$.path4write
.objectname = "ICD9_3char_sub_chapter.tibble"
# saveRDS( get(.objectname), xzfile(file.path(.path4write, paste0(.objectname,".rds","")), compression=9) )
# write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")))
# R.utils::gzip(file.path(.path4write, paste0(.objectname,".rds")), overwrite=T, remove=F, compression=9)
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 )
# write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="xz", compression=9 )
openxlsx2::write_xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), as_table=TRUE)
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(.objectname,".xlsx"))

