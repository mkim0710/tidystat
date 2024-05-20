# https://github.com/mkim0710/tidystat/edit/master/Rdev/10_import_clean_datatype/16_categorical_factor/data.add_IncomeQuartile_MedicalAid.dev.r
#%% data.add_IncomeQuartile_MedicalAid() ====
data.add_IncomeQuartile_MedicalAid <- function(DF) {
  
  # Check if the column CTRB_PT_TYPE_CD exists
  if (is.null(DF$CTRB_PT_TYPE_CD)) {
    print(paste0('Error: no column - ', 'CTRB_PT_TYPE_CD'))
    return(DF) # Return the original DF if the column doesn't exist
  } else {
    DF$IncomeDecile <- as.numeric(DF$CTRB_PT_TYPE_CD) # Convert to numeric
    DF$MedicalAid <- (DF$IncomeDecile == 0)
    
    # Add IncomeQuartile based on the distribution of Income
    DF$IncomeQuartile <- as.factor(cut(DF$IncomeDecile, 
                                  breaks = quantile(DF$IncomeDecile, probs = 0:4/4, na.rm = TRUE), 
                                  labels = c("Q1", "Q2", "Q3", "Q4"),
                                  include.lowest = TRUE))

    return(DF) # Return the modified DF
  }
}

gj_jk.Date.DTH.recode = gj_jk.Date.DTH.recode %>% data.add_IncomeQuartile_MedicalAid
gj_jk.Date.DTH.recode %>% select(CTRB_PT_TYPE_CD, MedicalAid, matches("Income")) |> summary()
# > gj_jk.Date.DTH.recode %>% select(CTRB_PT_TYPE_CD, MedicalAid, matches("Income")) |> summary()
#  CTRB_PT_TYPE_CD    MedicalAid       IncomeDecile    IncomeQuartile
#  Length:31931       Mode :logical   Min.   : 0.000   Q1:9302       
#  Class :character   FALSE:31862     1st Qu.: 4.000   Q2:7873       
#  Mode  :character   TRUE :69        Median : 7.000   Q3:8346       
#                                     Mean   : 6.448   Q4:6410       
#                                     3rd Qu.: 9.000                 
#                                     Max.   :10.000  
