

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fChr.as_numeric_safe_automatic = function() ====
#' fChr.as_numeric_safe_automatic – strict all-or-nothing character → numeric
#'
#' Converts a character / factor vector that *should* be numeric and returns a
#' numeric vector **only if every cleaned token parses**.  
#' If any token remains non-numeric after cleaning, the default is to return the
#' original vector unchanged.  
#' • Set `force = TRUE` to coerce anyway.  
#' • Combine with `remove_non_num = TRUE` to *replace* the offending elements
#'   with `NA` (vector length is always preserved, so it plays nicely inside
#'   `dplyr::mutate()`).
#'
#' A lightweight `conversion_info` attribute keeps an audit trail.
#'
#' @param char_vec        Character vector or single whitespace-separated string
#'                        (factors are coerced to character).
#' @param decimal_sep     Decimal mark in the text (default `"."`; e.g. `","`).
#' @param thousands_sep   Thousands separator to strip (default `","`; `""` = none).
#' @param missing_codes   Tokens that should map directly to `NA`.
#' @param force           `FALSE` (default) → abort on any bad token; `TRUE` → proceed.
#' @param remove_non_num  With `force = TRUE`, replace bad tokens by `NA` (keeps length).
#' @param verbose         Logical; honours `options(verbose)`.
#'
#' @return Numeric vector (on success or when `force = TRUE`) carrying
#'         `conversion_info`, **or** the untouched `char_vec` when aborted.
#'
#' @examples
#' x <- c("3,925.355442", "(1 716.978343)", "$bad", "43.1")
#' fChr.as_numeric_safe_automatic(x)                      # aborted, returns x
#' fChr.as_numeric_safe_automatic(x, force = TRUE)        # bad tokens → NA
#' fChr.as_numeric_safe_automatic(x, force = TRUE,
#'                                remove_non_num = TRUE)  # bad tokens kept as NA
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fChr.as_numeric_safe_automatic" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(char_vec, 
                                           decimal_sep      = ".",
                                           thousands_sep    = ",",
                                           missing_codes    = c("NA", ""),
                                           force            = FALSE,
                                           remove_non_num   = FALSE,
                                           verbose          = isTRUE(getOption("verbose"))) {

    ## 0 – fast path for single NA (helps mutate/across on all-NA columns)
    if (length(char_vec) == 1L && is.na(char_vec)) return(NA_real_)

    ## 1 – factor → character
    if (is.factor(char_vec)) {
        if (verbose) message("Coercing factor to character")
        char_vec <- as.character(char_vec)
    }
    stopifnot(is.character(char_vec))
    original_len <- length(char_vec)

    ## 1a – **NEW**: make sure byte sequences are valid UTF-8 ------------------
    char_vec <- iconv(char_vec, from = "", to = "UTF-8", sub = "byte")
    # any element that still failed to convert becomes NA_character_
    bad_enc <- which(is.na(char_vec))
    if (length(bad_enc) && verbose)
        message("Invalid byte sequence(s) replaced by NA at index: ",
                paste(bad_enc, collapse = ", "))
    char_vec[bad_enc] <- NA_character_

    ## 2 – allow a single pasted line of numbers
    if (original_len == 1L && grepl("\\s", char_vec))
        char_vec <- unlist(strsplit(char_vec, "\\s+"), use.names = FALSE)

    if (length(char_vec) == 0L) {
        if (verbose) message("Empty input → numeric(0).")
        return(numeric(0))
    }

    ## 3 – cleaning
    cleaned <- trimws(char_vec)
    cleaned[cleaned %in% missing_codes] <- NA_character_
    cleaned <- sub("^\\((.*)\\)$", "-\\1", cleaned)          # "(123)" → -123
    cleaned <- gsub("[\\$€£¥%]", "", cleaned)                # currency / %
    if (nzchar(thousands_sep))
        cleaned <- gsub(paste0("\\", thousands_sep), "", cleaned, fixed = FALSE)
    if (decimal_sep != ".")
        cleaned <- sub(decimal_sep, ".", cleaned, fixed = TRUE)

    ## 4 – coercion
    num_vec <- suppressWarnings(as.numeric(cleaned))
    bad_idx <- which(is.na(num_vec) & !is.na(cleaned))

    ## 5 – strict default
    if (length(bad_idx) && !force) {
        if (verbose)
            message("Conversion aborted; non-numeric token(s): ",
                    paste(unique(cleaned[bad_idx]), collapse = ", "),
                    ".  Use force = TRUE to override.")
        return(char_vec)
    }

    ## 6 – force: keep length, bad tokens → NA (or already NA via remove_non_num)
    if (length(bad_idx) && remove_non_num && verbose)
        message("Non-numeric token(s) replaced by NA: ",
                paste(unique(cleaned[bad_idx]), collapse = ", "))

    ## 7 – audit info
    attr(num_vec, "conversion_info") <-
        list(original_length = original_len,
             na_count        = sum(is.na(num_vec)),
             bad_indices     = bad_idx)

    num_vec
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



