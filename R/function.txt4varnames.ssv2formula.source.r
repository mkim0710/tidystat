# function.txt4varnames.ssv2formula.source.r

# txt4varnames.csv
# txt4varnames.dput
# txt4varnames.ssv
# 
# function.txt4varnames.ssv2formula
# function.formula2txt4varnames.ssv
# 
# gsub(
# separate?
# strsplit







#@ txt = ' =====
txt = '
Cigar Cigar_ge1 Cigar_ge30 Cigar_ge50 Cigar_ge100 Cigar_ge365 Cigar_cutMY Cigar_cut800
CigarettePackYear CigarettePackYear_ge1 CigarettePackYear_cut40
Age Age_ge50 Age_cut2575
HighSchoolLastYear College1Year CollegeGraduate
FamilyIncome_ge7000 FamilyIncome_ge8000
bmi bmi_cut
PMHx_diabetes PMHx_highBP
Alcohol_le1pwk Alcohol_ge2le3pwk Alcohol_ge4pwk
nutrition_calories nutrition_protein nutrition_fat nutrition_carb
n1ah0287 ihd timeihd
'
txt %>% dput
# > txt %>% dput
# "\nCigar Cigar_ge1 Cigar_ge30 Cigar_ge50 Cigar_ge100 Cigar_ge365 Cigar_cutMY Cigar_cut800\nCigarettePackYear CigarettePackYear_ge1 CigarettePackYear_cut40\nAge Age_ge50 Age_cut2575\nHighSchoolLastYear College1Year CollegeGraduate\nFamilyIncome_ge7000 FamilyIncome_ge8000\nbmi bmi_cut\nPMHx_diabetes PMHx_highBP\nAlcohol_le1pwk Alcohol_ge2le3pwk Alcohol_ge4pwk\nnutrition_calories nutrition_protein nutrition_fat nutrition_carb\nn1ah0287 ihd timeihd\n"

txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% dput
# > txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% dput
# "Cigar Cigar_ge1 Cigar_ge30 Cigar_ge50 Cigar_ge100 Cigar_ge365 Cigar_cutMY Cigar_cut800 CigarettePackYear CigarettePackYear_ge1 CigarettePackYear_cut40 Age Age_ge50 Age_cut2575 HighSchoolLastYear College1Year CollegeGraduate FamilyIncome_ge7000 FamilyIncome_ge8000 bmi bmi_cut PMHx_diabetes PMHx_highBP Alcohol_le1pwk Alcohol_ge2le3pwk Alcohol_ge4pwk nutrition_calories nutrition_protein nutrition_fat nutrition_carb n1ah0287 ihd timeihd "

txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\ ", .) %>% dput
# > txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\ ", .) %>% dput
# "Cigar contn  Cigar_ge1 contn  Cigar_ge30 contn  Cigar_ge50 contn  Cigar_ge100 contn  Cigar_ge365 contn  Cigar_cutMY contn  Cigar_cut800 contn  CigarettePackYear contn  CigarettePackYear_ge1 contn  CigarettePackYear_cut40 contn  Age contn  Age_ge50 contn  Age_cut2575 contn  HighSchoolLastYear contn  College1Year contn  CollegeGraduate contn  FamilyIncome_ge7000 contn  FamilyIncome_ge8000 contn  bmi contn  bmi_cut contn  PMHx_diabetes contn  PMHx_highBP contn  Alcohol_le1pwk contn  Alcohol_ge2le3pwk contn  Alcohol_ge4pwk contn  nutrition_calories contn  nutrition_protein contn  nutrition_fat contn  nutrition_carb contn  n1ah0287 contn  ihd contn  timeihd contn  "

txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\\\ ", .) %>% dput
# > txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\\\ ", .) %>% dput
# "Cigar contn \\ Cigar_ge1 contn \\ Cigar_ge30 contn \\ Cigar_ge50 contn \\ Cigar_ge100 contn \\ Cigar_ge365 contn \\ Cigar_cutMY contn \\ Cigar_cut800 contn \\ CigarettePackYear contn \\ CigarettePackYear_ge1 contn \\ CigarettePackYear_cut40 contn \\ Age contn \\ Age_ge50 contn \\ Age_cut2575 contn \\ HighSchoolLastYear contn \\ College1Year contn \\ CollegeGraduate contn \\ FamilyIncome_ge7000 contn \\ FamilyIncome_ge8000 contn \\ bmi contn \\ bmi_cut contn \\ PMHx_diabetes contn \\ PMHx_highBP contn \\ Alcohol_le1pwk contn \\ Alcohol_ge2le3pwk contn \\ Alcohol_ge4pwk contn \\ nutrition_calories contn \\ nutrition_protein contn \\ nutrition_fat contn \\ nutrition_carb contn \\ n1ah0287 contn \\ ihd contn \\ timeihd contn \\ "

# . table1, by(Cigar_ge30) vars(Cigar contn \\ Cigar_ge1 contn \\ Cigar_ge30 contn \\ Cigar_ge50 contn \\ Cigar_ge100 contn \\ Cigar_ge365 contn \\ Cigar_cutMY contn \\ Cigar_cut800 contn \\ CigarettePackYear contn \\ CigarettePackYear_ge1 contn \\ CigarettePackYear_cut40 contn \\ Age contn \\ Age_ge50 contn \\ Age_cut2575 contn \\ HighSchoolLastYear contn \\ College1Year contn \\ CollegeGraduate contn \\ FamilyIncome_ge7000 contn \\ FamilyIncome_ge8000 contn \\ bmi contn \\ bmi_cut contn \\ PMHx_diabetes contn \\ PMHx_highBP contn \\ Alcohol_le1pwk contn \\ Alcohol_ge2le3pwk contn \\ Alcohol_ge4pwk contn \\ nutrition_calories contn \\ nutrition_protein contn \\ nutrition_fat contn \\ nutrition_carb contn \\ n1ah0287 contn \\ ihd contn \\ timeihd contn \\)  format(%2.1f)

# . table1, by(Cigar_ge30) vars(Cigar contn \\ Cigar_ge1 cat \\ Cigar_ge30 cat \\ Cigar_ge50 cat \\ Cigar_ge100 cat \\ Cigar_ge365 cat \\ Cigar_cutMY cat \\ Cigar_cut800 cat \\ CigarettePackYear contn \\ CigarettePackYear_ge1 cat \\ CigarettePackYear_cut40 cat \\ Age contn \\ Age_ge50 cat \\ Age_cut2575 cat \\ HighSchoolLastYear cat \\ College1Year cat \\ CollegeGraduate cat \\ FamilyIncome_ge7000 cat \\ FamilyIncome_ge8000 cat \\ bmi contn \\ bmi_cut cat \\ PMHx_diabetes cat \\ PMHx_highBP cat \\ Alcohol_le1pwk cat \\ Alcohol_ge2le3pwk cat \\ Alcohol_ge4pwk cat \\ nutrition_calories contn \\ nutrition_protein contn \\ nutrition_fat contn \\ nutrition_carb contn \\ n1ah0287 cat \\ ihd cat \\ timeihd contn \\) format(%2.1f) saving("table1, by(Cigar_ge30).xls", replace)
# . pwd









#@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
txt %>% gsub(" ", ", ", .) %>% dput
# > txt %>% gsub(" ", ", ", .) %>% dput
# "N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar"

n1_2016_withlabels_EPI522_merge_n2_recode %>% filter(N1GM0390 == 1 & Cigar_ge50 < 1) %>% 
    select(N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar)









#@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"

txt %>% gsub(" ", '\\", \\"', .)
# > txt %>% gsub(" ", '\\", \\"', .)
# [1] "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
"\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
# > "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
# [1] "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""

txt %>% gsub(" ", '\\", \\"', .) %>% dput
# > txt %>% gsub(" ", '\\", \\"', .) %>% dput
"\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
# > "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
# [1] "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""




txt %>% gsub(" ", "\\', \\'", .) %>% {paste0("'", ., "'")} %>% cat
# > txt %>% gsub(" ", "\\', \\'", .) %>% {paste0("'", ., "'")} %>% cat
# 'N1GM0390', 'N1GM0392', 'N1GM0392_recode', 'N1GM0394', 'N1GM0394_recode', 'Cigar'
txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% cat
# > txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% cat
# "N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar"

txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} %>% cat
# > txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} %>% cat
c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"  







#@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
txt %>% gsub("\\b", "@", .)
# > txt %>% gsub("\\b", "@", .)
# [1] "@N@1@G@M@0@3@9@0@ @N@1@G@M@0@3@9@2@ @N@1@G@M@0@3@9@2@_@r@e@c@o@d@e@ @N@1@G@M@0@3@9@4@ @N@1@G@M@0@3@9@4@_@r@e@c@o@d@e@ @C@i@g@a@r@"
txt %>% gsub("\\b", '\\"', .)
# > txt %>% gsub("\\b", '\\"', .)
# [1] "\"N\"1\"G\"M\"0\"3\"9\"0\" \"N\"1\"G\"M\"0\"3\"9\"2\" \"N\"1\"G\"M\"0\"3\"9\"2\"_\"r\"e\"c\"o\"d\"e\" \"N\"1\"G\"M\"0\"3\"9\"4\" \"N\"1\"G\"M\"0\"3\"9\"4\"_\"r\"e\"c\"o\"d\"e\" \"C\"i\"g\"a\"r\""






#@ ?boundary ====
?boundary
pattern <- "a.b"
strings <- c("abb", "a.b")
str_detect(strings, pattern)
str_detect(strings, fixed(pattern))
str_detect(strings, coll(pattern))
# > str_detect(strings, pattern)
# [1] TRUE TRUE
# > str_detect(strings, fixed(pattern))
# [1] FALSE  TRUE
# > str_detect(strings, coll(pattern))
# [1] FALSE  TRUE



# coll() is useful for locale-aware case-insensitive matching
i <- c("I", "\u0130", "i")
i
str_detect(i, fixed("i", TRUE))
str_detect(i, coll("i", TRUE))
str_detect(i, coll("i", TRUE, locale = "tr"))
# > str_detect(i, fixed("i", TRUE))
# [1]  TRUE FALSE  TRUE
# > str_detect(i, coll("i", TRUE))
# [1]  TRUE FALSE  TRUE
# > str_detect(i, coll("i", TRUE, locale = "tr"))
# [1] FALSE  TRUE  TRUE


# Word boundaries
words <- c("These are   some words.")
str_count(words, boundary("word"))
str_split(words, " ")[[1]]
str_split(words, boundary("word"))[[1]]
# > str_count(words, boundary("word"))
# [1] 4
# > str_split(words, " ")[[1]]
# [1] "These"  "are"    ""       ""       "some"   "words."
# > str_split(words, boundary("word"))[[1]]
# [1] "These" "are"   "some"  "words"


# Regular expression variations
str_extract_all("The Cat in the Hat", "[a-z]+")
str_extract_all("The Cat in the Hat", regex("[a-z]+", TRUE))
# > str_extract_all("The Cat in the Hat", "[a-z]+")
# [[1]]
# [1] "he"  "at"  "in"  "the" "at" 
# 
# > str_extract_all("The Cat in the Hat", regex("[a-z]+", TRUE))
# [[1]]
# [1] "The" "Cat" "in"  "the" "Hat"


str_extract_all("a\nb\nc", "^.")
str_extract_all("a\nb\nc", regex("^.", multiline = TRUE))
# > str_extract_all("a\nb\nc", "^.")
# [[1]]
# [1] "a"
# 
# > str_extract_all("a\nb\nc", regex("^.", multiline = TRUE))
# [[1]]
# [1] "a" "b" "c"


str_extract_all("a\nb\nc", "a.")
str_extract_all("a\nb\nc", regex("a.", dotall = TRUE))
# > str_extract_all("a\nb\nc", "a.")
# [[1]]
# character(0)
# 
# > str_extract_all("a\nb\nc", regex("a.", dotall = TRUE))
# [[1]]
# [1] "a\n"






# #@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
# txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
# 
# str_split(txt, boundary("word"))[[1]]
# txt %>% str_split(boundary("word"))[[1]]
# txt %>% str_split(boundary("word")) %>% unlist
# txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} %>% cat
# txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% cat
# # > str_split(txt, boundary("word"))[[1]]
# # [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"          
# # > txt %>% str_split(boundary("word"))[[1]]
# # Error in type(pattern) : argument "pattern" is missing, with no default
# # > txt %>% str_split(boundary("word")) %>% unlist
# # [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"          
# # > txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# # [1] "\"N1GM0390\\\", \\\"N1GM0392\\\", \\\"N1GM0392_recode\\\", \\\"N1GM0394\\\", \\\"N1GM0394_recode\\\", \\\"Cigar\""
# # > txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} %>% cat
# # "N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar"> txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# # [1] "\"N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar\""
# # > txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% cat
# # "N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar"
# 
# txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} %>% cat
# # > txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} %>% cat
# # c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# 
# 
# 
# 
# 
# #@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
# txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
# 
# txt %>% str_extract_all("[A-z_]+")
# txt %>% str_extract_all("[A-z0-9_]+")
# # > txt %>% str_extract_all("[A-z_]+")
# # [[1]]
# #  [1] "N"       "GM"      "N"       "GM"      "N"       "GM"      "_recode" "N"       "GM"      "N"       "GM"      "_recode" "Cigar"  
# # > txt %>% str_extract_all("[A-z0-9_]+")
# # [[1]]
# # [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"
# 
# 
# 
# txt %>% str_extract_all("[A-z0-9_]+") %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# txt %>% str_extract_all("[A-z0-9_]+") %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} %>% cat
# txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% cat
# # > txt %>% str_extract_all("[A-z0-9_]+") %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# # [1] "\"N1GM0390\\\", \\\"N1GM0392\\\", \\\"N1GM0392_recode\\\", \\\"N1GM0394\\\", \\\"N1GM0394_recode\\\", \\\"Cigar\""
# # > txt %>% str_extract_all("[A-z0-9_]+") %>% unlist %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} %>% cat
# # "N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar"> txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# # [1] "\"c(\"N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar\")\""
# # > txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% cat
# # "c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")"
# 
# 
# 
# 
# 
# txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% cat
# # > txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% cat
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")






#@ str_split(boundary("word")) vs. str_extract_all() -----
txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"

txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} %>% cat
txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% cat
# > txt %>% str_split(boundary("word")) %>% unlist %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} %>% cat
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% cat
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")













#@ txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"' -----
txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"'
txt %>% dput
# > txt %>% dput
# "\"N1GM0390\"        \"N1GM0392\"        \"N1GM0392_recode\" \"N1GM0394\"        \"N1GM0394_recode\" \"Cigar\""


txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% cat
txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('c(', ., ')')} %>% cat
# > txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% cat
# "N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar"
# > txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('c(', ., ')')} %>% cat
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")










#@ txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"' -----
txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"'
txt %>% dput
# > txt %>% dput
# "\"N1GM0390\"        \"N1GM0392\"        \"N1GM0392_recode\" \"N1GM0394\"        \"N1GM0394_recode\" \"Cigar\""

txt %>% gsub('"', "", .) %>% dput
# > txt %>% gsub('"', "", .) %>% dput
# "N1GM0390        N1GM0392        N1GM0392_recode N1GM0394        N1GM0394_recode Cigar"

txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", " ", .) %>% cat
txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% cat
txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('select(', ., ')')} %>% cat
# > txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", " ", .) %>% cat
# N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar
# > txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% cat
# N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar
# > txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('select(', ., ')')} %>% cat
# select(N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar)









#@ end ---

