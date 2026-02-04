# Test file for fVecChr (Character Vector Operations)
# Source: R/fVecChr-source.R

library(testthat)

# Setup: Create mock env1 structure for testing
if (!exists("env1")) {
  env1 <- new.env()
  env1$f <- new.env()
}

# Define the function for testing (normally would be sourced from package)
fChr.as_numeric_safe_automatic <- function(char_vec,
                                           decimal_sep      = ".",
                                           thousands_sep    = ",",
                                           missing_codes    = c("NA", ""),
                                           force            = FALSE,
                                           remove_non_num   = FALSE,
                                           verbose          = FALSE) {

  if (length(char_vec) == 1L && is.na(char_vec)) return(NA_real_)

  if (is.factor(char_vec)) {
    char_vec <- as.character(char_vec)
  }
  stopifnot(is.character(char_vec))
  original_len <- length(char_vec)

  char_vec <- iconv(char_vec, from = "", to = "UTF-8", sub = "byte")
  bad_enc <- which(is.na(char_vec))
  char_vec[bad_enc] <- NA_character_

  if (original_len == 1L && grepl("\\s", char_vec))
    char_vec <- unlist(strsplit(char_vec, "\\s+"), use.names = FALSE)

  if (length(char_vec) == 0L) {
    return(numeric(0))
  }

  cleaned <- trimws(char_vec)
  cleaned[cleaned %in% missing_codes] <- NA_character_
  cleaned <- sub("^\\((.*)\\)$", "-\\1", cleaned)
  cleaned <- gsub("[\\$\u20AC\u00A3\u00A5%]", "", cleaned)
  if (nzchar(thousands_sep))
    cleaned <- gsub(paste0("\\", thousands_sep), "", cleaned, fixed = FALSE)
  if (decimal_sep != ".")
    cleaned <- sub(decimal_sep, ".", cleaned, fixed = TRUE)

  num_vec <- suppressWarnings(as.numeric(cleaned))
  bad_idx <- which(is.na(num_vec) & !is.na(cleaned))

  if (length(bad_idx) && !force) {
    return(char_vec)
  }

  attr(num_vec, "conversion_info") <-
    list(original_length = original_len,
         na_count        = sum(is.na(num_vec)),
         bad_indices     = bad_idx)

  num_vec
}

describe("fChr.as_numeric_safe_automatic", {

  it("converts simple numeric strings correctly", {
    result <- fChr.as_numeric_safe_automatic(c("1", "2", "3"))
    expect_equal(as.vector(result), c(1, 2, 3))
  })

  it("handles space-separated numbers in single string", {
    result <- fChr.as_numeric_safe_automatic("3925.355442 1716.978343")
    expect_equal(as.vector(result), c(3925.355442, 1716.978343))
  })

  it("returns original vector when non-numeric values present (default behavior)", {
    result <- fChr.as_numeric_safe_automatic(c("3925.355442", "abc"))
    expect_equal(result, c("3925.355442", "abc"))
  })

  it("converts non-numeric to NA when force=TRUE", {
    result <- fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), force = TRUE)
    expect_equal(as.vector(result), c(3925.355442, NA))
  })

  it("handles currency symbols", {
    result <- fChr.as_numeric_safe_automatic(c("$3,925.35", "1,716.97"))
    expect_equal(as.vector(result), c(3925.35, 1716.97))
  })

  it("handles parentheses for negative numbers", {
    result <- fChr.as_numeric_safe_automatic(c("(100)", "200"))
    expect_equal(as.vector(result), c(-100, 200))
  })

  it("handles thousands separators", {
    result <- fChr.as_numeric_safe_automatic(c("1,234,567", "89,012"))
    expect_equal(as.vector(result), c(1234567, 89012))
  })

  it("returns NA_real_ for single NA input", {
    result <- fChr.as_numeric_safe_automatic(NA_character_)
    expect_true(is.na(result))
    expect_true(is.numeric(result))
  })

  it("returns numeric(0) for empty input", {
    result <- fChr.as_numeric_safe_automatic(character(0))
    expect_equal(result, numeric(0))
  })

  it("handles factors by converting to character first", {
    input <- factor(c("1", "2", "3"))
    result <- fChr.as_numeric_safe_automatic(input)
    expect_equal(as.vector(result), c(1, 2, 3))
  })

  it("handles missing codes", {
    result <- fChr.as_numeric_safe_automatic(c("1", "NA", "", "2"))
    expect_equal(as.vector(result), c(1, NA, NA, 2))
  })

  it("preserves conversion_info attribute", {
    result <- fChr.as_numeric_safe_automatic(c("1", "2", "3"))
    expect_true(!is.null(attr(result, "conversion_info")))
    expect_equal(attr(result, "conversion_info")$original_length, 3)
  })

  it("handles European decimal separator", {
    result <- fChr.as_numeric_safe_automatic(c("1,5", "2,75"),
                                              decimal_sep = ",",
                                              thousands_sep = "")
    expect_equal(as.vector(result), c(1.5, 2.75))
  })

})
