add_income_medicalAid_and_quartile_columns <- function(DF) {
  
  # Check if the column CTRB_PT_TYPE_CD exists
  if (is.null(DF$CTRB_PT_TYPE_CD)) {
    print(paste0('Error: no column - ', 'CTRB_PT_TYPE_CD'))
    return(DF) # Return the original DF if the column doesn't exist
  } else {
    DF$Income <- DF$CTRB_PT_TYPE_CD
    DF$MedicalAid <- (DF$CTRB_PT_TYPE_CD == 0) * 1
    
    # Add IncomeQuartile based on the distribution of Income
    DF$IncomeQuartile <- as.factor(cut(DF$Income, 
                                  breaks = quantile(DF$Income, probs = 0:4/4, na.rm = TRUE), 
                                  labels = c("Q1", "Q2", "Q3", "Q4"),
                                  include.lowest = TRUE))

    return(DF) # Return the modified DF
  }
}
