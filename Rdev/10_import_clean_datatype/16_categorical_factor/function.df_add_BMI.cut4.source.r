
#@ function.df_add_BMI.cut4 ======
function.df_add_BMI.cut4 = function(df) {
    df %>% mutate(
        BMI = as.numeric(WEIGHT) / (as.numeric(HEIGHT)/100)^2
        , BMI_lt185 = BMI < 18.5
        , BMI_ge185lt230 = BMI >= 18.5 & BMI < 23
        , BMI_ge230lt250 = BMI >= 23 & BMI < 25
        , BMI_ge185lt250 = BMI >= 18.5 & BMI < 25
        , BMI_ge250lt300 = BMI >= 25 & BMI < 30
        , BMI_ge300 = BMI >= 30
        , BMI_ge350 = BMI >= 35
        , BMI_ge400 = BMI >= 40
        , BMI.cut4 = BMI %>% cut(breaks = c(0, 18.5, 25, 30, Inf), include.lowest = T, right = F)
    )
}

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_BMI.cut4 %>% select(matches("BMI")) %>% summary #----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_BMI %>% select(matches("BMI")) %>% summary #----
#       BMI        BMI_lt185       BMI_ge185lt230  BMI_ge230lt250  BMI_ge185lt250  BMI_ge250lt300  BMI_ge300       BMI_ge350       BMI_ge400            BMI_4cat     
#  Min.   :11.96   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   [0,18.5) : 11948  
#  1st Qu.:21.31   FALSE:271850    FALSE:167553    FALSE:214403    FALSE:98158     FALSE:206858    FALSE:274528    FALSE:283030    FALSE:283697    [18.5,25):185640  
#  Median :23.38   TRUE :11948     TRUE :116245    TRUE :69395     TRUE :185640    TRUE :76940     TRUE :9270      TRUE :768       TRUE :101       [25,30)  : 76940  
#  Mean   :23.57                                                                                                                                   [30,Inf] :  9270  
#  3rd Qu.:25.54                                                                                                                                                     
#  Max.   :66.94   

