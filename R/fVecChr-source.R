

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fChr.as_numeric_safe_automatic = function() ====
#' fChr.as_numeric_safe_automatic - Strict Character-to-Numeric Converter
#'
#' Converts character or factor input to numeric values ONLY if ALL elements are numeric after cleaning.
#' By default, returns the original vector unchanged if any non-numeric elements exist.
#' Attaches metadata for audit purposes.
#'
#' @param charVec Character vector or single whitespace-separated string
#'                (factors are silently coerced to character)
#' @param decimal_sep Decimal separator in the text (default ".", use "," for EU)
#' @param thousands_sep Thousands separator to strip (default ",", use "" to skip)
#' @param missing_codes Values that should become NA before parsing (default c("NA", ""))
#' @param force Logical. Override strict checking and convert anyway (default FALSE)
#' @param removeNonNumeric Logical. If TRUE and force=TRUE, drop non-numeric elements (default FALSE)
#' @param verbose Logical. Show debugging info (default: getOption("verbose") or FALSE)
#'
#' @return Either a numeric vector (on success or force=TRUE) or the original charVec (when conversion aborted).
#'         Successful numeric output has a conversion_info attribute storing audit metadata.
#'
#' @examples
#' # All numeric - converts successfully
#' fChr.as_numeric_safe_automatic("3925.355442 1716.978343")
#' 
#' # With currency symbol and thousands separator
#' fChr.as_numeric_safe_automatic(c("$3,925.35", "1,716.97"))
#' 
#' # Contains non-numeric value - returns original vector
#' fChr.as_numeric_safe_automatic(c("3925.355442", "abc"))
#' 
#' # Force conversion with non-numeric values
#' fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), force = TRUE)
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fChr.as_numeric_safe_automatic" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(charVec, 
                           decimal_sep = ".",
                           thousands_sep = ",",
                           missing_codes = c("NA", ""),
                           force = FALSE,
                           removeNonNumeric = FALSE, 
                           verbose = isTRUE(getOption("verbose"))) {
  # For dplyr safety, save original length
  originalLength = length(charVec)
  
  # Handle single NA inputs
  if (length(charVec) == 1 && is.na(charVec)) {
    return(NA_real_)
  }
  
  # 1 - Input validation & factor handling
  if (is.factor(charVec)) {
    if (verbose) message("Coercing factor to character")
    charVec = as.character(charVec)
  }
  stopifnot(is.character(charVec))
  
  # 2 - Handle empty input
  if (length(charVec) == 0 || all(is.na(charVec) | charVec == "")) {
    if (verbose) message("Empty input → returning NA values")
    # Return NA vector of original length for dplyr safety
    return(rep(NA_real_, originalLength))
  }
  
  # Handle whitespace-separated string
  charVecCleaned = charVec
  if (length(charVec) == 1 && !is.na(charVec) && grepl("\\s", charVec)) {
    charVecCleaned = unlist(strsplit(charVec, "\\s+"), use.names = FALSE)
  }
  
  # 3 - Clean input
  cleanedVec = trimws(charVecCleaned)
  cleanedVec[cleanedVec %in% missing_codes | is.na(cleanedVec)] = NA_character_
  
  # Only process non-NA values
  nonNAidx = which(!is.na(cleanedVec))
  if (length(nonNAidx) > 0) {
    cleanedVec[nonNAidx] = sub("^\\((.*)\\)$", "-\\1", cleanedVec[nonNAidx])
    cleanedVec[nonNAidx] = gsub("[\\$€£¥%]", "", cleanedVec[nonNAidx])
    
    if (nzchar(thousands_sep))
      cleanedVec[nonNAidx] = gsub(paste0("\\", thousands_sep), "", cleanedVec[nonNAidx], fixed = FALSE)
    
    if (decimal_sep != ".")
      cleanedVec[nonNAidx] = sub(decimal_sep, ".", cleanedVec[nonNAidx], fixed = TRUE)
  }
  
  # 4 - Attempt coercion
  numericValuesVec = suppressWarnings(as.numeric(cleanedVec))
  badIndicesVec = which(is.na(numericValuesVec) & !is.na(cleanedVec))
  
  # 5 - Abort or continue?
  if (length(badIndicesVec) && !force) {
    if (verbose) {
      message("Conversion aborted: non-numeric token(s) detected → ",
              paste(unique(cleanedVec[badIndicesVec]), collapse = ", "),
              ". Use force = TRUE to override.")
    }
    # Return original for abort case, preserving original length
    return(charVec)
  }
  
  # 6 - When forcing, optionally drop bad tokens
  if (length(badIndicesVec) && removeNonNumeric) {
    numericValuesVec = numericValuesVec[-badIndicesVec]
    cleanedVec = cleanedVec[-badIndicesVec]  # only for verbose message
    
    if (verbose) {
      message("Non-numeric token(s) removed: ", 
              paste(unique(cleanedVec[badIndicesVec]), collapse = ", "))
    }
    
    # If removal resulted in empty vector, return NA vector of original length
    if (length(numericValuesVec) == 0) {
      return(rep(NA_real_, originalLength))
    }
    
    # For dplyr, if we've removed elements, we need to return a single value
    # or original length vector
    if (length(numericValuesVec) != originalLength) {
      if (length(numericValuesVec) == 1) {
        # If we have a single value, return it (will be recycled by dplyr)
        return(numericValuesVec)
      } else {
        # Otherwise, we need to create a vector of the original length with NAs
        resultVec = rep(NA_real_, originalLength)
        # Put values where they belong (if we can determine this)
        if (length(numericValuesVec) <= originalLength) {
          resultVec[seq_along(numericValuesVec)] = numericValuesVec
        }
        return(resultVec)
      }
    }
  }
  
  # 7 - Attach audit metadata
  attr(numericValuesVec, "conversion_info") = 
    list(original_length = originalLength,
         na_count = sum(is.na(numericValuesVec)),
         bad_indices = if (length(badIndicesVec)) badIndicesVec else integer(0))
  
  # If we're returning a vector with different length, adjust for dplyr
  if (length(numericValuesVec) != originalLength) {
    if (length(numericValuesVec) == 0) {
      return(rep(NA_real_, originalLength))
    } else if (length(numericValuesVec) == 1) {
      return(numericValuesVec) # Single value will be recycled
    } else {
      # Fill with values where possible, NAs elsewhere
      resultVec = rep(NA_real_, originalLength)
      resultVec[seq_along(numericValuesVec)] = numericValuesVec
      return(resultVec)
    }
  }
  
  return(numericValuesVec)
}
# # All numeric - works as before
# fChr.as_numeric_safe_automatic("3925.355442 1716.978343") %>% dput
# # c(3925.355442, 1716.978343)
# 
# # Contains non-numeric value - returns original 
# fChr.as_numeric_safe_automatic(c("3925.355442", "abc")) %>% dput
# # c("3925.355442", "abc")
# # Warning message:
# # In fChr.as_numeric_safe_automatic(c("3925.355442", "abc")) :
# #   Non-numeric values found: abc. Original vector returned. Use forceConversion=TRUE to override.
# 
# # Force conversion and keep NAs
# fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), force = TRUE) %>% dput
# structure(c(3925.355442, NA), conversion_info = list(original_length = 2L, na_count = 1L, bad_indices = 2L))
# # Warning messages:
# # 1: In fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), forceConversion = TRUE) :
# #   NAs introduced by coercion
# # 2: In fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), forceConversion = TRUE) :
# #   Non-numeric values found and converted to NA: abc
# 
# # Force conversion and remove NAs
# fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), force = TRUE, removeNonNumeric = TRUE) %>% dput
# structure(3925.355442, conversion_info = list(original_length = 2L, na_count = 0L, bad_indices = 2L))
# # Warning messages:
# # 1: In fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), forceConversion = TRUE,  :
# #   NAs introduced by coercion
# # 2: In fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), forceConversion = TRUE,  :
# #   Non-numeric values found and converted to NA: abc
# 
# # With currency symbol and thousands separator
# fChr.as_numeric_safe_automatic(c("$3,925.35", "1,716.97")) %>% dput
# structure(c(3925.35, 1716.97), conversion_info = list(original_length = 2L, na_count = 0L, bad_indices = integer(0)))
# 
# # Contains non-numeric value - returns original vector
# fChr.as_numeric_safe_automatic(c("3925.355442", "abc")) %>% dput
# c("3925.355442", "abc")
# 
# # Force conversion with non-numeric values
# fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), force = TRUE) %>% dput
# structure(c(3925.355442, NA), conversion_info = list(original_length = 2L, na_count = 1L, bad_indices = 2L))
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) fVecChr.as_numeric_safe_automatic  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "fVecChr.as_numeric_safe_automatic")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) as_numeric_safe_automatic  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "as_numeric_safe_automatic")



