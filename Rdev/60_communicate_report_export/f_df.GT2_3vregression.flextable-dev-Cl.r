# https://claude.ai/chat/12d7c928-3b8e-4710-88f1-3adcd404db0f

# Create a function for adjusted regression models
fDf_adjustedRegressionTbl_tbl <- function(inputDf, 
                                          covariatesVec, 
                                          adjustmentVec = c("age", "sex"),
                                          outcomeVar, 
                                          methodFunc = glm, 
                                          methodArgsList = list(family = binomial),
                                          exponentiateBool = TRUE,
                                          pvalueFun = label_style_pvalue()) {
  
  # Input validation
  if (!is.data.frame(inputDf)) {
    stop("inputDf must be a data frame")
  }
  
  if (!all(c(covariatesVec, adjustmentVec, outcomeVar) %in% names(inputDf))) {
    stop("All variables must exist in the data frame")
  }
  
  # Create list to store individual regression tables
  tblList <- list()
  
  # Iterate through covariates of interest
  for (i in seq_along(covariatesVec)) {
    # Create formula with current covariate + adjustment variables
    currentFormula <- as.formula(
      paste(outcomeVar, "~", 
            paste(c(covariatesVec[i], adjustmentVec), collapse = " + "))
    )
    
    # Build regression model
    modelArgs <- c(
      list(formula = currentFormula, data = inputDf),
      methodArgsList
    )
    currentModel <- do.call(methodFunc, modelArgs)
    
    # Create gtsummary table for this model
    currentTbl <- tbl_regression(
      currentModel,
      include = covariatesVec[i],  # Only show the covariate of interest
      exponentiate = exponentiateBool,
      pvalue_fun = pvalueFun
    )
    
    # Store in list
    tblList[[i]] <- currentTbl
  }
  
  # Merge all tables
  finalTbl <- tbl_stack(tblList)
  
  # Add note about adjustment
  adjustmentNote <- paste("All models adjusted for", 
                          paste(adjustmentVec, collapse = " and "))
  finalTbl <- finalTbl %>%
    modify_caption(adjustmentNote)
  
  return(finalTbl)
}

library(gtsummary)
library(dplyr)

# Example usage with trial dataset
adjustedTbl <- fDf_adjustedRegressionTbl_tbl(
  inputDf = trial,
  covariatesVec = c("marker", "grade", "stage"), # Variables to test
  adjustmentVec = c("age", "trt"), # Adjustment variables
  outcomeVar = "response",  # Outcome variable
  methodFunc = glm,
  methodArgsList = list(family = binomial),
  exponentiateBool = TRUE,
  pvalueFun = label_style_pvalue(digits = 2)
)

# Add more formatting if desired
adjustedTbl %>%
  bold_labels() %>%
  add_significance_stars() %>%
  modify_header(label = "**Variable**")
