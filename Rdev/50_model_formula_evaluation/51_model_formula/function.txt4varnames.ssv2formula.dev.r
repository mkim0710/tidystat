# function.txt4varnames.ssv2formula.dev.r

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





#@ ------------------------
ID_Criteria.n_distinct.tbl %>% names |> dput()
# > ID_Criteria.n_distinct.tbl %>% names |> dput()
# c("ENROLID", "Inc2.ia.1.a.ndDate", "Inc2.ia.1.b.1.ndDate", "Inc2.ia.1.b.2.ndDate", 
# "Inc2.ia.1.c.ndDate", "Inc2.ia.2.a.ndDate", "Inc2.ia.2.b.ndDate", 
# "Inc2.ia.3.a.ndDate", "Inc2.ia.3.b.ndDate", "Inc2.ia.3.c.ndDate", 
# "Inc2.ia.3.d.ndDate", "Inc2.ia.4.a.ndDate", "Inc2.ia.4.b.ndDate", 
# "Inc2.ia.4.c.1.ndDate", "Inc2.ia.4.c.2.ndDate", "Inc2.ia.4.c.3.ndDate"
# )
ID_Criteria.n_distinct.tbl %>% names %>% paste(collapse = "\n, ") |> cat() #----
# > ID_Criteria.n_distinct.tbl %>% names %>% paste(collapse = "\n, ") |> cat() #----
# ENROLID
# , Inc2.ia.1.a.ndDate
# , Inc2.ia.1.b.1.ndDate
# , Inc2.ia.1.b.2.ndDate
# , Inc2.ia.1.c.ndDate
# , Inc2.ia.2.a.ndDate
# , Inc2.ia.2.b.ndDate
# , Inc2.ia.3.a.ndDate
# , Inc2.ia.3.b.ndDate
# , Inc2.ia.3.c.ndDate
# , Inc2.ia.3.d.ndDate
# , Inc2.ia.4.a.ndDate
# , Inc2.ia.4.b.ndDate
# , Inc2.ia.4.c.1.ndDate
# , Inc2.ia.4.c.2.ndDate
# , Inc2.ia.4.c.3.ndDate


ID_Criteria.n_distinct_lgl.tbl = ID_Criteria.n_distinct.tbl %>% 
    mutate(
        ENROLID = ENROLID
        # , Exc1 = is.na(Exc1.ndDate) | (Exc1.ndDate == 0)
        # , Exc2 = is.na(Exc1.ndDate) | (Exc1.ndDate == 0)
        # , Exc4 = is.na(Exc4.ndDate) | (Exc4.ndDate < 2)
        # , Exc5 = rowSums(cbind(Exc5.i.ndDate, Exc5.ii.ndDate, Exc5.iii.ndDate), na.rm = T) > 0
        # , Exc6 = Exc6.ndDate > 0
        # , Exc10 = Exc10.ndDate > 0
        # , Exc11 = Exc11.ndDate > 0
        # , Exc12 = Exc12.ndDate > 0
        # , Exc13 = Exc13.ndDate > 0
        # , Inc2.ia.1.a.ndDate
# , Inc2.ia.1.b.1.ndDate
# , Inc2.ia.1.b.2.ndDate
# , Inc2.ia.1.c.ndDate
# , Inc2.ia.2.a.ndDate
# , Inc2.ia.2.b.ndDate
# , Inc2.ia.3.a.ndDate
# , Inc2.ia.3.b.ndDate
# , Inc2.ia.3.c.ndDate
# , Inc2.ia.3.d.ndDate
# , Inc2.ia.4.a.ndDate
# , Inc2.ia.4.b.ndDate
# , Inc2.ia.4.c.1.ndDate
# , Inc2.ia.4.c.2.ndDate
# , Inc2.ia.4.c.3.ndDate
    )



#@ ------------------------
#@ txt = "rowname                  HRCI p_value star  p.fdr *fdr  p.bon *bon  exp(coef) exp(2.5 %) exp(97.5 %)  se(coef)           z     Pr(>|z|)" ----
txt = "rowname                  HRCI p_value star  p.fdr *fdr  p.bon *bon  exp(coef) exp(2.5 %) exp(97.5 %)  se(coef)           z     Pr(>|z|)"
txt |> str_extract_all("[A-z0-9_.*()|>%]+") |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt |> str_extract_all("[A-z0-9_.*()|>%]+") |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# c("rowname", "HRCI", "p_value", "star", "p.fdr", "*fdr", "p.bon", "*bon", "exp(coef)", "exp(2.5", "%)", "exp(97.5", "%)", "se(coef)", "z", "Pr(>|z|)")



#@ txt = '"varname", "level", "varnamelevel", "coefficients", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)", "HR"' -----
txt = '"varname", "level", "varnamelevel", "coefficients", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)", "HR"'
txt |> str_extract_all("[A-z0-9_]+") |> str()
txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = ', ') |> str()
txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = ', ') |> str()
txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = ', ') %>% {paste0('select(', ., ')')} |> cat("\n")
# > txt |> str_extract_all("[A-z0-9_]+") |> str()
# List of 1
# $ : chr [1:13] "varname" "level" "varnamelevel" "coefficients" ...
# > txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = ', ') |> str()
# chr "c(\"varname\", \"level\", \"varnamelevel\", \"coefficients\", \"exp\", \"coef\", \"lower\", \"95\", \"upper\", "| __truncated__
# > txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = ', ') |> str()
# chr "varname, level, varnamelevel, coefficients, exp, coef, lower, 95, upper, 95, Pr, z, HR"
# > txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = ', ') %>% {paste0('select(', ., ')')} |> cat("\n")
# select(varname, level, varnamelevel, coefficients, exp, coef, lower, 95, upper, 95, Pr, z, HR)




#@ txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"' -----
txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"'
txt |> dput()
# > txt |> dput()
# "\"N1GM0390\"        \"N1GM0392\"        \"N1GM0392_recode\" \"N1GM0394\"        \"N1GM0394_recode\" \"Cigar\""


txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) |> cat("\n")
txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) |> cat("\n")
# "N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar"
# > txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")





#@ txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"' -----
txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"'
txt |> dput()
# > txt |> dput()
# "\"N1GM0390\"        \"N1GM0392\"        \"N1GM0392_recode\" \"N1GM0394\"        \"N1GM0394_recode\" \"Cigar\""

txt %>% gsub('"', "", .) |> dput()
# > txt %>% gsub('"', "", .) |> dput()
# "N1GM0390        N1GM0392        N1GM0392_recode N1GM0394        N1GM0394_recode Cigar"

txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", " ", .) |> cat("\n")
txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) |> cat("\n")
txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('select(', ., ')')} |> cat("\n")
# > txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", " ", .) |> cat("\n")
# N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar
# > txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) |> cat("\n")
# N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar
# > txt %>% gsub('"', "", .) %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('select(', ., ')')} |> cat("\n")
# select(N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar)





#@@@ gsub() vs. str_split(boundary("word")) vs. str_extract_all() -----
txt = '"N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"'

txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('c(', ., ')')} |> cat("\n")
txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = ', ') |> cat("\n")
txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt %>% gsub("[ \t\n\r\f\v]+", ", ", .) %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = ', ') |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")








#@ txt = "N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar" -----
txt = "N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar"

txt %>% gsub("[ \t\n\r\f\v]+", "", .) 
txt %>% gsub("[ \t\n\r\f\v]+", "", .) %>% gsub(",", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt %>% gsub("[ \t\n\r\f\v]+", "", .)
# [1] "N1GM0390,N1GM0392,N1GM0392_recode,N1GM0394,N1GM0394_recode,Cigar"
# > txt %>% gsub("[ \t\n\r\f\v]+", "", .) %>% gsub(",", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")



#@@@ gsub() vs. str_split(boundary("word")) vs. str_extract_all() -----
txt = "N1GM0390, N1GM0392, N1GM0392_recode, N1GM0394, N1GM0394_recode, Cigar"

txt %>% gsub("[ \t\n\r\f\v]+", "", .) %>% gsub(",", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = ', ') |> cat("\n")
txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt %>% gsub("[ \t\n\r\f\v]+", "", .) %>% gsub(",", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")








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
txt |> dput()
# > txt |> dput()
# "\nCigar Cigar_ge1 Cigar_ge30 Cigar_ge50 Cigar_ge100 Cigar_ge365 Cigar_cutMY Cigar_cut800\nCigarettePackYear CigarettePackYear_ge1 CigarettePackYear_cut40\nAge Age_ge50 Age_cut2575\nHighSchoolLastYear College1Year CollegeGraduate\nFamilyIncome_ge7000 FamilyIncome_ge8000\nbmi bmi_cut\nPMHx_diabetes PMHx_highBP\nAlcohol_le1pwk Alcohol_ge2le3pwk Alcohol_ge4pwk\nnutrition_calories nutrition_protein nutrition_fat nutrition_carb\nn1ah0287 ihd timeihd\n"

txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) |> dput()
# > txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) |> dput()
# "Cigar Cigar_ge1 Cigar_ge30 Cigar_ge50 Cigar_ge100 Cigar_ge365 Cigar_cutMY Cigar_cut800 CigarettePackYear CigarettePackYear_ge1 CigarettePackYear_cut40 Age Age_ge50 Age_cut2575 HighSchoolLastYear College1Year CollegeGraduate FamilyIncome_ge7000 FamilyIncome_ge8000 bmi bmi_cut PMHx_diabetes PMHx_highBP Alcohol_le1pwk Alcohol_ge2le3pwk Alcohol_ge4pwk nutrition_calories nutrition_protein nutrition_fat nutrition_carb n1ah0287 ihd timeihd "

txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\ ", .) |> dput()
# > txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\ ", .) |> dput()
# "Cigar contn  Cigar_ge1 contn  Cigar_ge30 contn  Cigar_ge50 contn  Cigar_ge100 contn  Cigar_ge365 contn  Cigar_cutMY contn  Cigar_cut800 contn  CigarettePackYear contn  CigarettePackYear_ge1 contn  CigarettePackYear_cut40 contn  Age contn  Age_ge50 contn  Age_cut2575 contn  HighSchoolLastYear contn  College1Year contn  CollegeGraduate contn  FamilyIncome_ge7000 contn  FamilyIncome_ge8000 contn  bmi contn  bmi_cut contn  PMHx_diabetes contn  PMHx_highBP contn  Alcohol_le1pwk contn  Alcohol_ge2le3pwk contn  Alcohol_ge4pwk contn  nutrition_calories contn  nutrition_protein contn  nutrition_fat contn  nutrition_carb contn  n1ah0287 contn  ihd contn  timeihd contn  "

txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\\\ ", .) |> dput()
# > txt %>% gsub("\n", " ", .) %>% gsub(" +", " ", .) %>% gsub("^ ", "", .) %>% gsub(" ", " contn \\\\ ", .) |> dput()
# "Cigar contn \\ Cigar_ge1 contn \\ Cigar_ge30 contn \\ Cigar_ge50 contn \\ Cigar_ge100 contn \\ Cigar_ge365 contn \\ Cigar_cutMY contn \\ Cigar_cut800 contn \\ CigarettePackYear contn \\ CigarettePackYear_ge1 contn \\ CigarettePackYear_cut40 contn \\ Age contn \\ Age_ge50 contn \\ Age_cut2575 contn \\ HighSchoolLastYear contn \\ College1Year contn \\ CollegeGraduate contn \\ FamilyIncome_ge7000 contn \\ FamilyIncome_ge8000 contn \\ bmi contn \\ bmi_cut contn \\ PMHx_diabetes contn \\ PMHx_highBP contn \\ Alcohol_le1pwk contn \\ Alcohol_ge2le3pwk contn \\ Alcohol_ge4pwk contn \\ nutrition_calories contn \\ nutrition_protein contn \\ nutrition_fat contn \\ nutrition_carb contn \\ n1ah0287 contn \\ ihd contn \\ timeihd contn \\ "

# . table1, by(Cigar_ge30) vars(Cigar contn \\ Cigar_ge1 contn \\ Cigar_ge30 contn \\ Cigar_ge50 contn \\ Cigar_ge100 contn \\ Cigar_ge365 contn \\ Cigar_cutMY contn \\ Cigar_cut800 contn \\ CigarettePackYear contn \\ CigarettePackYear_ge1 contn \\ CigarettePackYear_cut40 contn \\ Age contn \\ Age_ge50 contn \\ Age_cut2575 contn \\ HighSchoolLastYear contn \\ College1Year contn \\ CollegeGraduate contn \\ FamilyIncome_ge7000 contn \\ FamilyIncome_ge8000 contn \\ bmi contn \\ bmi_cut contn \\ PMHx_diabetes contn \\ PMHx_highBP contn \\ Alcohol_le1pwk contn \\ Alcohol_ge2le3pwk contn \\ Alcohol_ge4pwk contn \\ nutrition_calories contn \\ nutrition_protein contn \\ nutrition_fat contn \\ nutrition_carb contn \\ n1ah0287 contn \\ ihd contn \\ timeihd contn \\)  format(%2.1f)

# . table1, by(Cigar_ge30) vars(Cigar contn \\ Cigar_ge1 cat \\ Cigar_ge30 cat \\ Cigar_ge50 cat \\ Cigar_ge100 cat \\ Cigar_ge365 cat \\ Cigar_cutMY cat \\ Cigar_cut800 cat \\ CigarettePackYear contn \\ CigarettePackYear_ge1 cat \\ CigarettePackYear_cut40 cat \\ Age contn \\ Age_ge50 cat \\ Age_cut2575 cat \\ HighSchoolLastYear cat \\ College1Year cat \\ CollegeGraduate cat \\ FamilyIncome_ge7000 cat \\ FamilyIncome_ge8000 cat \\ bmi contn \\ bmi_cut cat \\ PMHx_diabetes cat \\ PMHx_highBP cat \\ Alcohol_le1pwk cat \\ Alcohol_ge2le3pwk cat \\ Alcohol_ge4pwk cat \\ nutrition_calories contn \\ nutrition_protein contn \\ nutrition_fat contn \\ nutrition_carb contn \\ n1ah0287 cat \\ ihd cat \\ timeihd contn \\) format(%2.1f) saving("table1, by(Cigar_ge30).xls", replace)
# . pwd









#@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
txt %>% gsub(" ", ", ", .) |> dput()
# > txt %>% gsub(" ", ", ", .) |> dput()
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

txt %>% gsub(" ", '\\", \\"', .) |> dput()
# > txt %>% gsub(" ", '\\", \\"', .) |> dput()
"\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
# > "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""
# [1] "\"N1GM0390\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0392_recode\"\", \"\"N1GM0394\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"N1GM0394_recode\"\", \"\"Cigar\""




txt %>% gsub(" ", "\\', \\'", .) %>% {paste0("'", ., "'")} |> cat("\n")
# > txt %>% gsub(" ", "\\', \\'", .) %>% {paste0("'", ., "'")} |> cat("\n")
# 'N1GM0390', 'N1GM0392', 'N1GM0392_recode', 'N1GM0394', 'N1GM0394_recode', 'Cigar'
txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} |> cat("\n")
# > txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} |> cat("\n")
# "N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar"

txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
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
# txt |> str_split(boundary("word"))[[1]]
# txt |> str_split(boundary("word")) |> unlist()
# txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} |> cat("\n")
# txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} |> cat("\n")
# # > str_split(txt, boundary("word"))[[1]]
# # [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"          
# # > txt |> str_split(boundary("word"))[[1]]
# # Error in type(pattern) : argument "pattern" is missing, with no default
# # > txt |> str_split(boundary("word")) |> unlist()
# # [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"          
# # > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# # [1] "\"N1GM0390\\\", \\\"N1GM0392\\\", \\\"N1GM0392_recode\\\", \\\"N1GM0394\\\", \\\"N1GM0394_recode\\\", \\\"Cigar\""
# # > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} |> cat("\n")
# # "N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar"> txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# # [1] "\"N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar\""
# # > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} |> cat("\n")
# # "N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar"
# 
# txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
# # > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
# # c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# 
# 
# 
# 
# 
# #@ txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar" -----
# txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"
# 
# txt |> str_extract_all("[A-z_]+")
# txt |> str_extract_all("[A-z0-9_]+")
# # > txt |> str_extract_all("[A-z_]+")
# # [[1]]
# #  [1] "N"       "GM"      "N"       "GM"      "N"       "GM"      "_recode" "N"       "GM"      "N"       "GM"      "_recode" "Cigar"  
# # > txt |> str_extract_all("[A-z0-9_]+")
# # [[1]]
# # [1] "N1GM0390"        "N1GM0392"        "N1GM0392_recode" "N1GM0394"        "N1GM0394_recode" "Cigar"
# 
# 
# 
# txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} |> cat("\n")
# txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} |> cat("\n")
# # > txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')}
# # [1] "\"N1GM0390\\\", \\\"N1GM0392\\\", \\\"N1GM0392_recode\\\", \\\"N1GM0394\\\", \\\"N1GM0394_recode\\\", \\\"Cigar\""
# # > txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '\\", \\"') %>% {paste0('"', ., '"')} |> cat("\n")
# # "N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar"> txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}
# # [1] "\"c(\"N1GM0390\", \"N1GM0392\", \"N1GM0392_recode\", \"N1GM0394\", \"N1GM0394_recode\", \"Cigar\")\""
# # > txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} |> cat("\n")
# # "c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")"
# 
# 
# 
# 
# 
# txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') |> cat("\n")
# # > txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")






#@@@ gsub() vs. str_split(boundary("word")) vs. str_extract_all() -----
txt = "N1GM0390 N1GM0392 N1GM0392_recode N1GM0394 N1GM0394_recode Cigar"

txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = ', ') |> cat("\n")
txt |> str_extract_all("[A-z0-9_]+") |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# > txt %>% gsub(" ", '\\", \\"', .) %>% {paste0('"', ., '"')} %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_split(boundary("word")) |> unlist() %>% paste0(collapse = '", "') %>% {paste0('"', ., '"')}  %>% {paste0('c(', ., ')')} |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")
# > txt |> str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') |> cat("\n")
# c("N1GM0390", "N1GM0392", "N1GM0392_recode", "N1GM0394", "N1GM0394_recode", "Cigar")










ENROLID.2353768.join_criteria.na_rm.2plus %>% select(-ENROLID) %>% names %>% paste(collapse=", ") |> cat() #----
# > ENROLID.2353768.join_criteria.na_rm.2plus %>% select(-ENROLID) %>% names %>% paste(collapse=", ") |> cat() #----
# btw_n365_enddate.ICD250_6480_6488, btw_n90_enddate.ICD250_6480_6488, btw_141_enddate.ICD6480_ICD6488, btw_n90_140.NDC_anyDM, btw_n90_140.ICD6480_ICD6488, criterion1, criterion2

ENROLID.2353768.join_criteria.na_rm.2plus %>% 
    group_by_at(vars(-ENROLID)) %>% summarize(n(), n()/2353768) |> print(n=99) #-----





#@ end ---

