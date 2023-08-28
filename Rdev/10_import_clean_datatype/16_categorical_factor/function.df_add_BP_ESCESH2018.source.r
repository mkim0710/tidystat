
#@ function.df_add_BP_ESCESH2018 ======
function.df_add_BP_ESCESH2018 = function(df) {
    df = df %>% mutate(
        SBP = BP_HIGH, DBP = BP_LWST
        , BP_ESCESH2018 = case_when(
            SBP < 120 & DBP < 80 ~ "(1) Optimal BP",
            SBP >= 120 & SBP < 130 & DBP < 85 ~ "(2) Normal BP",
            SBP < 130 & DBP >= 80 & DBP < 85 ~ "(2) Normal BP",
            SBP >= 130 & SBP < 140 & DBP < 90 ~ "(3) High Normal BP",
            SBP < 140 & DBP >= 85 & DBP < 90 ~ "(3) High Normal BP",
            SBP >= 140 & SBP < 160 & DBP < 100 ~ "(4) HTN Grade 1",
            SBP < 160 & DBP >= 90 & DBP < 100 ~ "(4) HTN Grade 1",
            SBP >= 160 & SBP < 180 & DBP < 110 ~ "(5) HTN Grade 2",
            SBP < 180 & DBP >= 100 & DBP < 110 ~ "(5) HTN Grade 2",
            SBP >= 180 ~ "(6) HTN Grade 3",
            DBP >= 110 ~ "(6) HTN Grade 3",
            TRUE ~ "(99) Not elsewhere classified"
        ) %>% as.factor
    )
    df
}


CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_BP_ESCESH2018 %>% select(matches("BP")) %>% summary #----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_BP_ESCESH2018 %>% select(matches("BP")) %>% summary #----
#     BP_HIGH         BP_LWST            SBP             DBP                    BP_ESCESH2018   
#  Min.   : 64.0   Min.   : 36.00   Min.   : 64.0   Min.   : 36.00   (1) Optimal BP    :111610  
#  1st Qu.:110.0   1st Qu.: 70.00   1st Qu.:110.0   1st Qu.: 70.00   (2) Normal BP     : 71381  
#  Median :120.0   Median : 76.00   Median :120.0   Median : 76.00   (3) High Normal BP: 62210  
#  Mean   :121.7   Mean   : 75.91   Mean   :121.7   Mean   : 75.91   (4) HTN Grade 1   : 28045  
#  3rd Qu.:130.0   3rd Qu.: 80.00   3rd Qu.:130.0   3rd Qu.: 80.00   (5) HTN Grade 2   :  8548  
#  Max.   :300.0   Max.   :180.00   Max.   :300.0   Max.   :180.00   (6) HTN Grade 3   :  2004  
