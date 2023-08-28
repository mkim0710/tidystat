#@ function.df_add_FPG_ge100lt126 ======
function.df_add_FPG_ge100lt126 = function(df) {
    df = df %>% mutate(
        FPG = BLDS
        , FPG_ge100 = BLDS >= 100
        , FPG_ge100lt126 = BLDS >= 100 & BLDS < 126
        , FPG_ge126 = BLDS >= 126
    )
    df
}

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_FPG_ge100lt126 %>% select(matches("FPG")) %>% summary #----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_FPG_ge100lt126 %>% select(matches("FPG")) %>% summary #----
#       FPG         FPG_ge100       FPG_ge126       FPG_ge100lt126 
#  Min.   : 36.00   Mode :logical   Mode :logical   Mode :logical  
#  1st Qu.: 85.00   FALSE:201498    FALSE:268556    FALSE:216740   
#  Median : 93.00   TRUE :82300     TRUE :15242     TRUE :67058    
#  Mean   : 96.56                                                  
#  3rd Qu.:101.00                                                  
#  Max.   :614.00 
