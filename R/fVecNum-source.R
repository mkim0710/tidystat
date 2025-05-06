

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fNum.signif_preserve_decimals = function() ====
#' Apply Significant Digits While Preserving Initial Decimal Places
#'
#' @description
#' Applies significant digit rounding (`signif()`) while ensuring that
#' decimal places up to a specified position remain unchanged.
#' 
#' @details
#' For each number, we compare:
#' 1. `round(x, roundDigitsInt)` - what must be preserved
#' 2. `signif(x, signifDigitsInt)` - desired precision
#' 
#' If rounding the `signif()` result would alter the protected decimals,
#' we keep the rounded value instead.
#'
#' @param numVec Numeric vector, matrix, array, or data frame
#' @param signifDigitsInt Integer specifying significant digits to keep (default: 4L)
#' @param roundDigitsInt Integer specifying decimal places to preserve (default: 2L)
#' @param verboseBool Logical for debugging output (default: FALSE)
#'
#' @return Object of same type and structure as input with processed values
#'
#' @examples
#' fNum.signif_preserve_decimals(c(12345.6789, 1.23456, 0.0012345)) %>% dput
#' # c(12345.679, 1.235, 0.001234)
#' # # [1] 12345.679000     1.235000     0.001234
#'
#' # Matrix example
#' m <- matrix(c(123.456, 0.012345), nrow = 1)
#' fNum.signif_preserve_decimals(m) %>% dput
#' # structure(c(123.456, 0.01234), dim = 1:2)
#' #         [,1]    [,2]
#' # [1,] 123.456 0.01234
#'
#' # Data frame with mixed columns
#' df <- data.frame(a = c(12345.6789, 0.01234), b = 1:2, ch = c("x","y"))
#' fNum.signif_preserve_decimals(df) %>% dput
#' # structure(list(a = c(12345.679, 0.01234), b = c(1, 2), ch = c("x", "y")), row.names = c(NA, -2L), class = "data.frame")
#' #             a b ch
#' # 1 12345.67900 1  x
#' # 2     0.01234 2  y
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fNum.signif_preserve_decimals" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(numVec, 
                                      signifDigitsInt = 4L, 
                                      roundDigitsInt = 3L, 
                                      verboseBool = isTRUE(getOption("verbose"))) {
  # Input validation ----
  if (!is.numeric(numVec) && !is.data.frame(numVec)) {
    stop("Input 'numVec' must be numeric or a data frame")
  }
  
  # More concise validation using stopifnot
  stopifnot(
    length(signifDigitsInt) == 1L,
    signifDigitsInt >= 1L,
    signifDigitsInt == as.integer(signifDigitsInt),
    length(roundDigitsInt) == 1L,
    roundDigitsInt >= 0L,
    roundDigitsInt == as.integer(roundDigitsInt)
  )
  
  # Function to process a single value ----
  fNum_processSingleValue = function(numVal) {
    # Handle NA/NaN/Inf/zero
    if (is.na(numVal) || is.infinite(numVal) || numVal == 0) {
      return(numVal)
    }
    
    # Calculate rounded value to preserve
    roundedVal = round(numVal, digits = roundDigitsInt)
    
    # Apply signif for desired precision
    signifVal = signif(numVal, digits = signifDigitsInt)
    
    # Round the signif value to check if it preserves required decimals
    roundedSignifVal = round(signifVal, digits = roundDigitsInt)
    
    # Choose final result
    result = if (identical(roundedVal, roundedSignifVal)) signifVal else roundedVal
    
    if (verboseBool) {
      cat("Value:", numVal, 
          "\nRounded:", roundedVal,
          "\nSignif:", signifVal,
          "\nRounded signif:", roundedSignifVal,
          "\nResult:", result, "\n\n")
    }
    
    return(result)
  }
  
  # Handle different input types ----
  if (is.data.frame(numVec)) {
    # For data frames, apply to each numeric column only
    resultObj = numVec
    numCols = vapply(numVec, is.numeric, logical(1))
    resultObj[numCols] = lapply(resultObj[numCols], function(col) {
      vapply(col, fNum_processSingleValue, numeric(1))
    })
    return(resultObj)
  }
  
  # For vectors, matrices, arrays - preserve all attributes
  originalAttributes = attributes(numVec)
  resultVec = vapply(as.vector(numVec), fNum_processSingleValue, numeric(1))
  
  # Restore all original attributes in one operation
  attributes(resultVec) = originalAttributes
  
  return(resultVec)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) signif_preserve_decimals  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "signif_preserve_decimals")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) round.signif_preserve_decimals  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "round.signif_preserve_decimals")


