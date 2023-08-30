# https://github.com/mkim0710/tidystat/edit/master/Rdev/10_import_clean_datatype/16_categorical_factor/data.add_FPG_ge100lt126.source.r
#%% data.add_FPG_ge100lt126() ======
data.add_FPG_ge100lt126 <- function(dataset, varname4FPG = "BLDS") {
    dataset %>%
      mutate(
        FPG = get(varname4FPG),
        FPG_ge100 = get(varname4FPG) >= 100,
        FPG_ge100lt126 = get(varname4FPG) >= 100 & get(varname4FPG) < 126,
        FPG_ge126 = get(varname4FPG) >= 126
      )
}

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% data.add_FPG_ge100lt126 %>% select(matches("FPG")) %>% summary #----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% data.add_FPG_ge100lt126 %>% select(matches("FPG")) %>% summary #----
#       FPG         FPG_ge100       FPG_ge126       FPG_ge100lt126 
#  Min.   : 36.00   Mode :logical   Mode :logical   Mode :logical  
#  1st Qu.: 85.00   FALSE:201498    FALSE:268556    FALSE:216740   
#  Median : 93.00   TRUE :82300     TRUE :15242     TRUE :67058    
#  Mean   : 96.56                                                  
#  3rd Qu.:101.00                                                  
#  Max.   :614.00 
