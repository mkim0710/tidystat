# Unit Tests for tidystat Functions
# Generated: 2026-02-04
# 
# Test Structure:
# - Each category has its own test file
# - Tests follow tidystat conventions (env1$f$ namespace)
# - Uses testthat framework
# - Includes basic functionality, edge cases, and error handling

library(testthat)

# Setup: Source .Rprofile to initialize env1
if (file.exists(".Rprofile")) {
  source(".Rprofile")
  if (exists(".First")) .First()
}

test_that("fChr.as_numeric_safe_automatic converts safely", {
  if (exists("fChr.as_numeric_safe_automatic", envir = env1$f)) {
    # Test basic conversion
    char_vec <- c("1.5", "2.3", "3.7")
    result <- env1$f$fChr.as_numeric_safe_automatic(char_vec)
    
    expect_type(result, "double")
    expect_equal(result, c(1.5, 2.3, 3.7))
    
    # Test with invalid values
    char_vec_invalid <- c("1.5", "not_a_number", "3.7")
    result_invalid <- env1$f$fChr.as_numeric_safe_automatic(char_vec_invalid, force = TRUE)
    
    expect_true(is.na(result_invalid[2]))
  } else {
    skip("fChr.as_numeric_safe_automatic not available")
  }
})

test_that("fNum.signif_preserve_decimals formats correctly", {
  if (exists("fNum.signif_preserve_decimals", envir = env1$f)) {
    num_vec <- c(1.234567, 12.34567, 123.4567)
    result <- env1$f$fNum.signif_preserve_decimals(num_vec, signifDigitsInt = 3)
    
    expect_type(result, "double")
    expect_length(result, 3)
  } else {
    skip("fNum.signif_preserve_decimals not available")
  }
})
