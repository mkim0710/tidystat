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





#@ -----

txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
txt %>% gsub(" ", ", ", .) %>% dput
# > txt %>% gsub(" ", ", ", .) %>% dput
# "N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar"

n1_2016_withlabels_EPI522_merge_n2_recode %>% filter(N1GM0390 == 1 & Cigar_ge50 < 1) %>% 
    select(N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar)



#@ -----
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





#@ -----
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

#@ -----
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

