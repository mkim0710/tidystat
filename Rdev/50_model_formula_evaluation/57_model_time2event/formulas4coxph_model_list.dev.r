# formulas4coxph_model_list.dev.r
# formulas4coxph_model_list.Cigar_ge50 from varnames4coxph_model_list.Cigar_ge50 .r

#@ varnames4coxph_model_list.Cigar_ge50 = list() -----  
varnames4coxph_model_list.Cigar_ge50 = list()
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "bmi4category"  # BMI
      , "PMHx_diabetes", "PMHx_highBP"  # Hx
      , "Alcohol_3cat"  # Alcohol
      , "HighSchoolLastYear", "FamilyIncome_ge7000"  # Social
      , "nutrition_calories", "nutrition_protein", "nutrition_fat", "nutrition_carb"  # nutrition
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "PMHx_diabetes", "PMHx_highBP"  # Hx
      , "Alcohol_3cat"  # Alcohol
      , "HighSchoolLastYear", "FamilyIncome_ge7000"  # Social
      , "nutrition_calories", "nutrition_protein", "nutrition_fat", "nutrition_carb"  # nutrition
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "bmi4category"  # BMI
      , "Alcohol_3cat"  # Alcohol
      , "HighSchoolLastYear", "FamilyIncome_ge7000"  # Social
      , "nutrition_calories", "nutrition_protein", "nutrition_fat", "nutrition_carb"  # nutrition
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "bmi4category"  # BMI
      , "Alcohol_3cat"  # Alcohol
      , "HighSchoolLastYear", "FamilyIncome_ge7000"  # Social
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "bmi4category"  # BMI
      , "Alcohol_3cat"  # Alcohol
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.BMI = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "bmi4category"  # BMI
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
    )
varnames4coxph_model_list.Cigar_ge50$Unadjusted = 
    c("ihd", "timeihd"
      , "Cigar_ge50"
    )
varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition = 
    c("ihd", "timeihd"
      , "Cigar_ge50", "CigarettePackYear"
      , "Age"
      , "Male"
      , "RaceWhite"
      , "Alcohol_3cat"  # Alcohol
      , "HighSchoolLastYear", "FamilyIncome_ge7000"  # Social
      , "nutrition_calories", "nutrition_protein", "nutrition_fat", "nutrition_carb"  # nutrition
    )
varnames4coxph_model_list.Cigar_ge50 |> str() #----
# > varnames4coxph_model_list.Cigar_ge50 |> str() #----  
# List of 11
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition: chr [1:17] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition    : chr [1:16] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition   : chr [1:15] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social             : chr [1:11] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol                    : chr [1:9] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex.Race.BMI                            : chr [1:8] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex.Race                                : chr [1:7] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette.Age.Sex                                     : chr [1:6] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...
#  $ Cigar.Cigarette                                             : chr [1:4] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear"
#  $ Unadjusted                                                  : chr [1:3] "ihd" "timeihd" "Cigar_ge50"
#  $ Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition       : chr [1:14] "ihd" "timeihd" "Cigar_ge50" "CigarettePackYear" ...


varname4time = "timeihd"
varname4event = "ihd"

varnames4coxph_model_list.Cigar_ge50$Unadjusted |> dput()
# > varnames4coxph_model_list.Cigar_ge50$Unadjusted |> dput()
# c("ihd", "timeihd", "Cigar_ge50")

varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex |> dput()
# > varnames4coxph_model_list.Cigar_ge50$Cigar.Cigarette.Age.Sex |> dput()
# c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male")


c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% {.[!. %in% c(varname4time, varname4event)]}
# > c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% {.[!. %in% c(varname4time, varname4event)]}
# [1] "Cigar_ge50"        "CigarettePackYear" "Age"               "Male"

c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event))
# > c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event))
# [1] "Cigar_ge50"        "CigarettePackYear" "Age"               "Male"             

c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ")
# > c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ")
# [1] "Cigar_ge50 + CigarettePackYear + Age + Male"


library(survival)
# ?survival::Surv
paste0("Surv(",varname4time, ", ", varname4event, ") ~ ")
# > paste0("Surv(",varname4time, ", ", varname4event, ") ~ ")
# [1] "Surv(timeihd, ihd) ~ "


c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)}
# > c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)}
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male"


c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)} %>% as.formula
# > c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)} %>% as.formula
# Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male
# <environment: 0x000000001d2718e8


c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)} %>% as.formula |> dput()
# > c("ihd", "timeihd", "Cigar_ge50", "CigarettePackYear", "Age", "Male") %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)} %>% as.formula |> dput()
# Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male


#@ formulas4coxph_model_list.Cigar_ge50 ====  
formulas4coxph_model_list.Cigar_ge50 =
    varnames4coxph_model_list.Cigar_ge50 %>% map(function(vec) {
        vec %>% setdiff(c(varname4time, varname4event)) |> paste0(collapse = " + ") %>% {paste0("Surv(",varname4time, ", ", varname4event, ") ~ ", .)} %>% as.formula
    })
formulas4coxph_model_list.Cigar_ge50 |> str()
# > formulas4coxph_model_list.Cigar_ge50 |> str()
# List of 11
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition:Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + PMHx_diabetes + PMH| __truncated__
#   .. ..- attr(*, ".Environment")=<environment: 0x000000003a807628> 
#  $ Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition    :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + PMHx_diabetes + PMHx_highBP + Alco| __truncated__
#   .. ..- attr(*, ".Environment")=<environment: 0x000000003933ec98> 
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition   :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + Alcohol_3cat + High| __truncated__
#   .. ..- attr(*, ".Environment")=<environment: 0x0000000033298588> 
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social             :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + Alcohol_3cat + High| __truncated__
#   .. ..- attr(*, ".Environment")=<environment: 0x00000000223d0b48> 
#  $ Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol                    :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + Alcohol_3cat
#   .. ..- attr(*, ".Environment")=<environment: 0x000000002d1d0988> 
#  $ Cigar.Cigarette.Age.Sex.Race.BMI                            :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category
#   .. ..- attr(*, ".Environment")=<environment: 0x00000000229a7710> 
#  $ Cigar.Cigarette.Age.Sex.Race                                :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite
#   .. ..- attr(*, ".Environment")=<environment: 0x000000001d7f9440> 
#  $ Cigar.Cigarette.Age.Sex                                     :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male
#   .. ..- attr(*, ".Environment")=<environment: 0x0000000022c69b28> 
#  $ Cigar.Cigarette                                             :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear
#   .. ..- attr(*, ".Environment")=<environment: 0x00000000385a2340> 
#  $ Unadjusted                                                  :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50
#   .. ..- attr(*, ".Environment")=<environment: 0x00000000391298e0> 
#  $ Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition       :Class 'formula'  language Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + Alcohol_3cat + HighSchoolLastYear | __truncated__
#   .. ..- attr(*, ".Environment")=<environment: 0x0000000024d386f0> 



formulas4coxph_model_list.Cigar_ge50 |> dput()
# > formulas4coxph_model_list.Cigar_ge50 |> dput()
# list(Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition = Surv(timeihd, 
#     ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + 
#     bmi4category + PMHx_diabetes + PMHx_highBP + Alcohol_3cat + 
#     HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories + 
#     nutrition_protein + nutrition_fat + nutrition_carb, Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition = Surv(timeihd, 
#     ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + 
#     PMHx_diabetes + PMHx_highBP + Alcohol_3cat + HighSchoolLastYear + 
#     FamilyIncome_ge7000 + nutrition_calories + nutrition_protein + 
#     nutrition_fat + nutrition_carb, Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition = Surv(timeihd, 
#     ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + 
#     bmi4category + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + 
#     nutrition_calories + nutrition_protein + nutrition_fat + 
#     nutrition_carb, Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social = Surv(timeihd, 
#     ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + 
#     bmi4category + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000, 
#     Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol = Surv(timeihd, 
#         ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + 
#         RaceWhite + bmi4category + Alcohol_3cat, Cigar.Cigarette.Age.Sex.Race.BMI = Surv(timeihd, 
#         ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + 
#         RaceWhite + bmi4category, Cigar.Cigarette.Age.Sex.Race = Surv(timeihd, 
#         ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + 
#         RaceWhite, Cigar.Cigarette.Age.Sex = Surv(timeihd, ihd) ~ 
#         Cigar_ge50 + CigarettePackYear + Age + Male, Cigar.Cigarette = Surv(timeihd, 
#         ihd) ~ Cigar_ge50 + CigarettePackYear, Unadjusted = Surv(timeihd, 
#         ihd) ~ Cigar_ge50, Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition = Surv(timeihd, 
#         ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + 
#         RaceWhite + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + 
#         nutrition_calories + nutrition_protein + nutrition_fat + 
#         nutrition_carb)


formulas4coxph_model_list.Cigar_ge50 %>% map(deparse)
# > formulas4coxph_model_list.Cigar_ge50 %>% map(deparse)
# $`Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition`
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + " "    RaceWhite + bmi4category + PMHx_diabetes + PMHx_highBP + "      
# [3] "    Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + "      "    nutrition_calories + nutrition_protein + nutrition_fat + "      
# [5] "    nutrition_carb"                                                 
# 
# $Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + "  "    RaceWhite + PMHx_diabetes + PMHx_highBP + Alcohol_3cat + "       
# [3] "    HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories + " "    nutrition_protein + nutrition_fat + nutrition_carb"              
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + " "    RaceWhite + bmi4category + Alcohol_3cat + HighSchoolLastYear + "
# [3] "    FamilyIncome_ge7000 + nutrition_calories + nutrition_protein + " "    nutrition_fat + nutrition_carb"                                 
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + " "    RaceWhite + bmi4category + Alcohol_3cat + HighSchoolLastYear + "
# [3] "    FamilyIncome_ge7000"                                            
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + " "    RaceWhite + bmi4category + Alcohol_3cat"                        
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + " "    RaceWhite + bmi4category"                                       
# 
# $Cigar.Cigarette.Age.Sex.Race
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + " "    RaceWhite"                                                      
# 
# $Cigar.Cigarette.Age.Sex
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male"
# 
# $Cigar.Cigarette
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear"
# 
# $Unadjusted
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50"
# 
# $Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + "        "    RaceWhite + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + "
# [3] "    nutrition_calories + nutrition_protein + nutrition_fat + "              "    nutrition_carb"     



formulas4coxph_model_list.Cigar_ge50 %>% map(deparse) %>% map(paste, collapse = " ")
# > formulas4coxph_model_list.Cigar_ge50 %>% map(deparse) %>% map(paste, collapse = " ")
# $`Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition`
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + bmi4category + PMHx_diabetes + PMHx_highBP +      Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 +      nutrition_calories + nutrition_protein + nutrition_fat +      nutrition_carb"
# 
# $Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + PMHx_diabetes + PMHx_highBP + Alcohol_3cat +      HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories +      nutrition_protein + nutrition_fat + nutrition_carb"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + bmi4category + Alcohol_3cat + HighSchoolLastYear +      FamilyIncome_ge7000 + nutrition_calories + nutrition_protein +      nutrition_fat + nutrition_carb"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + bmi4category + Alcohol_3cat + HighSchoolLastYear +      FamilyIncome_ge7000"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + bmi4category + Alcohol_3cat"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + bmi4category"
# 
# $Cigar.Cigarette.Age.Sex.Race
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite"
# 
# $Cigar.Cigarette.Age.Sex
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male"
# 
# $Cigar.Cigarette
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear"
# 
# $Unadjusted
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50"
# 
# $Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male +      RaceWhite + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 +      nutrition_calories + nutrition_protein + nutrition_fat +      nutrition_carb"





function.formula2text = function(formula) {
    formula |> as.character() %>% {paste(.[2], .[1], .[3])}
}

formulas4coxph_model_list.Cigar_ge50 %>% map(function.formula2text)
# > formulas4coxph_model_list.Cigar_ge50 %>% map(function.formula2text)
# $`Cigar.Cigarette.Age.Sex.Race.BMI.Hx.Alcohol.Social.nutrition`
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + PMHx_diabetes + PMHx_highBP + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories + nutrition_protein + nutrition_fat + nutrition_carb"
# 
# $Cigar.Cigarette.Age.Sex.Race.Hx.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + PMHx_diabetes + PMHx_highBP + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories + nutrition_protein + nutrition_fat + nutrition_carb"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories + nutrition_protein + nutrition_fat + nutrition_carb"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol.Social
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI.Alcohol
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category + Alcohol_3cat"
# 
# $Cigar.Cigarette.Age.Sex.Race.BMI
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + bmi4category"
# 
# $Cigar.Cigarette.Age.Sex.Race
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite"
# 
# $Cigar.Cigarette.Age.Sex
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male"
# 
# $Cigar.Cigarette
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear"
# 
# $Unadjusted
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50"
# 
# $Cigar.Cigarette.Age.Sex.Race.Alcohol.Social.nutrition
# [1] "Surv(timeihd, ihd) ~ Cigar_ge50 + CigarettePackYear + Age + Male + RaceWhite + Alcohol_3cat + HighSchoolLastYear + FamilyIncome_ge7000 + nutrition_calories + nutrition_protein + nutrition_fat + nutrition_carb"






#@ end -----  

