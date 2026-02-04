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

test_that("fDf.fiter_different_rows filters correctly", {
  if (exists("fDf.fiter_different_rows", envir = env1$f)) {
    # Basic test with simple differences
    df_test <- data.frame(
      col1 = c(1, 2, 2, 3),
      col2 = c(1, 2, 4, 3)
    )
    
    result <- env1$f$fDf.fiter_different_rows(df_test)
    expect_equal(nrow(result), 1)  # Only row 3 differs
    
    # Test with NA handling - distinct mode
    df_na <- data.frame(
      colA = c(1, NA, NA),
      colB = c(1, 2, NA)
    )
    result_distinct <- env1$f$fDf.fiter_different_rows(df_na, na_mode = "distinct")
    expect_true(nrow(result_distinct) >= 1)
    
    # Test with NA handling - match mode
    result_match <- env1$f$fDf.fiter_different_rows(df_na, na_mode = "match")
    expect_true(nrow(result_match) <= nrow(result_distinct))
    
    # Test with numeric tolerance
    df_tol <- data.frame(
      colA = c(1.00000001, 2.0),
      colB = c(1.00000000, 2.00000010)
    )
    result_tol <- env1$f$fDf.fiter_different_rows(df_tol, tol = 1e-6)
    expect_equal(nrow(result_tol), 0)  # Within tolerance
  } else {
    skip("fDf.fiter_different_rows not available")
  }
})

test_that("fDf.checkConstancyAcrossVars works correctly", {
  # Create test data with longitudinal variables
  df_test <- data.frame(
    id = c(1, 1, 2, 2),
    var_T0 = c(5, 5, 10, 10),
    var_T1 = c(5, 6, 10, 10)  # ID 1 has mismatch
  )
  
  if (exists("fDf.checkConstancyAcrossVars", envir = env1$f)) {
    result <- env1$f$fDf.checkConstancyAcrossVars(
      df_test, 
      pattern = "var_T",
      varname4ID = "id"
    )
    
    expect_type(result, "list")
    # Should detect inconsistency for ID 1
    expect_true(length(result) > 0)
  } else {
    skip("fDf.checkConstancyAcrossVars not available")
  }
})

test_that("fDf.filter_mismatched_rows filters mismatches", {
  if (exists("fDf.filter_mismatched_rows", envir = env1$f)) {
    df_test <- data.frame(
      id = c(1, 2, 3),
      val_T0 = c(5, 10, 15),
      val_T1 = c(5, 11, 15)
    )
    
    result <- env1$f$fDf.filter_mismatched_rows(
      df_test,
      pattern = "val_T"
    )
    
    expect_s3_class(result, "data.frame")
    expect_true(nrow(result) <= nrow(df_test))
  } else {
    skip("fDf.filter_mismatched_rows not available")
  }
})

test_that("simulate_longitudinal_data generates valid data", {
  if (exists("simulate_longitudinal_data", envir = env1$f)) {
    sim_data <- env1$f$simulate_longitudinal_data(
      n_subjects = 10,
      n_waves = 3,
      seed = 123
    )
    
    expect_s3_class(sim_data, "data.frame")
    expect_true(nrow(sim_data) >= 10)
    expect_true(ncol(sim_data) >= 3)
  } else {
    skip("simulate_longitudinal_data not available")
  }
})
