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

test_that("fVec.na.locf fills NAs correctly", {
  if (exists("fVec.na.locf", envir = env1$f)) {
    # Test basic LOCF
    vec_with_na <- c(1, NA, NA, 2, NA, 3)
    result <- env1$f$fVec.na.locf(vec_with_na)
    
    expect_equal(result, c(1, 1, 1, 2, 2, 3))
    expect_false(any(is.na(result[-1])))  # No NAs except possibly first
    
    # Test with leading NAs
    vec_leading <- c(NA, NA, 1, NA, 2)
    result_leading <- env1$f$fVec.na.locf(vec_leading, fillLeadingNA = TRUE)
    expect_false(any(is.na(result_leading)))
    
    # Test with all NAs
    vec_all_na <- c(NA, NA, NA)
    result_all_na <- env1$f$fVec.na.locf(vec_all_na, fillLeadingNA = TRUE, defaultValue = 0)
    expect_equal(result_all_na, c(0, 0, 0))
  } else {
    skip("fVec.na.locf not available")
  }
})

test_that("f_vec1_vec2.setdiff_list computes set differences", {
  if (exists("f_vec1_vec2.setdiff_list", envir = env1$f)) {
    vec1 <- c("a", "b", "c", "d")
    vec2 <- c("b", "c", "e", "f")
    
    result <- env1$f$f_vec1_vec2.setdiff_list(vec1, vec2, print_str = FALSE)
    
    expect_type(result, "list")
    expect_true("vec1_setdiff_vec2" %in% names(result))
    expect_true("vec2_setdiff_vec1" %in% names(result))
    expect_setequal(result$vec1_setdiff_vec2, c("a", "d"))
    expect_setequal(result$vec2_setdiff_vec1, c("e", "f"))
  } else {
    skip("f_vec1_vec2.setdiff_list not available")
  }
})

test_that("f_chr1.strsplit0_as_vec splits strings", {
  if (exists("f_chr1.strsplit0_as_vec", envir = env1$f)) {
    test_string <- "a,b,c,d"
    result <- env1$f$f_chr1.strsplit0_as_vec(test_string, split = ",")
    
    expect_type(result, "character")
    expect_length(result, 4)
    expect_equal(result, c("a", "b", "c", "d"))
  } else {
    skip("f_chr1.strsplit0_as_vec not available")
  }
})

test_that("fLs.removeEnvAttr removes environment attributes", {
  if (exists("fLs.removeEnvAttr", envir = env1$f)) {
    # Create a list with environment attributes
    test_list <- list(a = 1, b = 2, c = 3)
    attr(test_list, ".Environment") <- new.env()
    
    result <- env1$f$fLs.removeEnvAttr(test_list, verbose = FALSE)
    
    expect_type(result, "list")
    expect_null(attr(result, ".Environment"))
  } else {
    skip("fLs.removeEnvAttr not available")
  }
})
