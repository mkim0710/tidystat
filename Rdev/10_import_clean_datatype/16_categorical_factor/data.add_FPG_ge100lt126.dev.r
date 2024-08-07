# https://github.com/mkim0710/tidystat/edit/master/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_FPG_ge100lt126.dev.r
#%% f_df.add_FPG_ge100lt126() ======  
f_df.add_FPG_ge100lt126 <- function(dataset, varname4FPG = "BLDS") {
    dataset %>%
      mutate(
        FPG = get(varname4FPG),
        FPG_ge100 = get(varname4FPG) >= 100,
        FPG_ge100lt126 = get(varname4FPG) >= 100 & get(varname4FPG) < 126,
        FPG_ge126 = get(varname4FPG) >= 126
      )
}

gj_jk.Date.DTH.recode = 
    gj_jk.Date.DTH.recode %>% 
    f_df.add_FPG_ge100lt126 
gj_jk.Date.DTH.recode %>% select(BLDS, matches("FPG")) |> summary()
 #      BLDS             FPG         FPG_ge100       FPG_ge100lt126  FPG_ge126      
 # Min.   : 38.00   Min.   : 38.00   Mode :logical   Mode :logical   Mode :logical  
 # 1st Qu.: 86.00   1st Qu.: 86.00   FALSE:20040     FALSE:22755     FALSE:29203    
 # Median : 95.00   Median : 95.00   TRUE :11878     TRUE :9163      TRUE :2715     
 # Mean   : 99.96   Mean   : 99.96   NA's :13        NA's :13        NA's :13       
 # 3rd Qu.:106.00   3rd Qu.:106.00                                                  
 # Max.   :953.00   Max.   :953.00                                                  
 # NA's   :13       NA's   :13                                                      

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% f_df.add_FPG_ge100lt126 %>% select(matches("FPG")) |> summary() #----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% f_df.add_FPG_ge100lt126 %>% select(matches("FPG")) |> summary() #----  
#       FPG         FPG_ge100       FPG_ge126       FPG_ge100lt126 
#  Min.   : 36.00   Mode :logical   Mode :logical   Mode :logical  
#  1st Qu.: 85.00   FALSE:201498    FALSE:268556    FALSE:216740   
#  Median : 93.00   TRUE :82300     TRUE :15242     TRUE :67058    
#  Mean   : 96.56                                                  
#  3rd Qu.:101.00                                                  
#  Max.   :614.00 
