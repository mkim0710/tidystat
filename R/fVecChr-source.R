

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
  # 1 — Input validation & factor handling
  if (is.factor(charVec)) {
    if (verbose) message("Coercing factor to character")
    charVec = as.character(charVec)
  }
  stopifnot(is.character(charVec))
  
  # 2 — Handle empty input and split whitespace-separated strings
  if (length(charVec) == 0 || all(charVec == "")) {
    if (verbose) message("Empty input → numeric(0).")
    return(numeric(0))
  }
  
  if (length(charVec) == 1L && grepl("\\s", charVec)) {
    charVec = unlist(strsplit(charVec, "\\s+"), use.names = FALSE)
  }
  
  # 3 — Clean input
  cleanedVec = trimws(charVec)
  cleanedVec[cleanedVec %in% missing_codes] = NA_character_
  cleanedVec = sub("^\\((.*)\\)$", "-\\1", cleanedVec)       # "(123)" → "-123"
  cleanedVec = gsub("[\\$€£¥%]", "", cleanedVec)             # strip currency/%
  
  if (nzchar(thousands_sep))
    cleanedVec = gsub(paste0("\\", thousands_sep), "", cleanedVec, fixed = FALSE)
  
  if (decimal_sep != ".")
    cleanedVec = sub(decimal_sep, ".", cleanedVec, fixed = TRUE)
  
  if (verbose) {
    cat("After cleaning:\n")
    print(cleanedVec)
  }
  
  # 4 — Attempt coercion
  numericValuesVec = suppressWarnings(as.numeric(cleanedVec))
  badIndicesVec = which(is.na(numericValuesVec) & !is.na(cleanedVec))
  
  # 5 — Abort or continue?
  if (length(badIndicesVec) && !force) {
    if (verbose) {
      message("Conversion aborted: non-numeric token(s) detected → ",
              paste(unique(cleanedVec[badIndicesVec]), collapse = ", "),
              ". Use force = TRUE to override.")
    }
    return(charVec)  # unchanged
  }
  
  # 6 — When forcing, optionally drop bad tokens
  if (length(badIndicesVec)) {
    if (removeNonNumeric) {
      numericValuesVec = numericValuesVec[-badIndicesVec]
      cleanedVec = cleanedVec[-badIndicesVec]  # only for verbose message
    }
    
    if (verbose) {
      message("Non-numeric token(s) ", 
              if (removeNonNumeric) "removed:" else "coerced to NA:",
              " ", paste(unique(cleanedVec[badIndicesVec]), collapse = ", "))
    }
  }
  
  # 7 — Attach audit metadata
  attr(numericValuesVec, "conversion_info") = 
    list(original_length = length(charVec),
         na_count = sum(is.na(numericValuesVec)),
         bad_indices = if (length(badIndicesVec)) badIndicesVec else integer(0))
  
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



