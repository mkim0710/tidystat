# Test file for fDf.filter (Data Frame Filtering Operations)
# Source: R/fDf.filter-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fDf.filter-source.R
.FileName.source.r <- "fDf.filter-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("fDf.fiter_different_rows (production)", {

  it("identifies rows where columns differ", {
    df <- data.frame(x = c(1, 2, 2, 4), y = c(1, 2, 4, 4))
    result <- env1$f$fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 1)
    expect_equal(result$x[1], 2)
    expect_equal(result$y[1], 4)
  })

  it("returns empty data frame when all rows match", {
    df <- data.frame(x = c(1, 2, 3), y = c(1, 2, 3))
    result <- env1$f$fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 0)
  })

  it("adds mismatched indicator column", {
    df <- data.frame(x = c(1, 2), y = c(1, 3))
    result <- env1$f$fDf.fiter_different_rows(df)
    expect_true("mismatched" %in% names(result))
    expect_true(all(result$mismatched))
  })

  it("adds row number when add_row_number=TRUE", {
    df <- data.frame(x = c(1, 2, 3), y = c(1, 3, 3))
    result <- env1$f$fDf.fiter_different_rows(df, add_row_number = TRUE)
    expect_true("row_number" %in% names(result))
    expect_equal(result$row_number, 2)
  })

  it("handles NA values with na_mode='distinct'", {
    df <- data.frame(x = c(1, NA, NA), y = c(1, 2, NA))
    result <- env1$f$fDf.fiter_different_rows(df, na_mode = "distinct")
    expect_equal(nrow(result), 2)  # both NA rows are mismatches
  })

  it("handles NA values with na_mode='match'", {
    df <- data.frame(x = c(1, NA, NA), y = c(1, 2, NA))
    result <- env1$f$fDf.fiter_different_rows(df, na_mode = "match")
    expect_equal(nrow(result), 1)  # only row 2 (NA vs 2) is mismatch
  })

  it("handles NA values with na_mode='ignore'", {
    df <- data.frame(x = c(1, NA, NA), y = c(1, 2, NA))
    result <- env1$f$fDf.fiter_different_rows(df, na_mode = "ignore")
    expect_equal(nrow(result), 0)  # no mismatches when NA involved
  })

  it("respects numeric tolerance", {
    df <- data.frame(x = c(1.00000001, 2.0), y = c(1.00000000, 2.00000010))
    result <- env1$f$fDf.fiter_different_rows(df, tol = 1e-8)
    expect_equal(nrow(result), 1)
  })

  it("uses custom column names", {
    df <- data.frame(a = c(1, 2), b = c(1, 3), c = c(5, 6))
    result <- env1$f$fDf.fiter_different_rows(df, colName1 = "a", colName2 = "b")
    expect_equal(nrow(result), 1)
  })

  it("handles character columns", {
    df <- data.frame(x = c("a", "b"), y = c("a", "c"), stringsAsFactors = FALSE)
    result <- env1$f$fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 1)
  })

  it("handles factor columns by converting to character", {
    df <- data.frame(x = factor(c("a", "b")), y = factor(c("a", "c")))
    result <- env1$f$fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 1)
  })

  it("throws error for non-data.frame input", {
    expect_error(
      env1$f$fDf.fiter_different_rows(list(x = 1:3, y = 1:3)),
      "must be a data frame"
    )
  })

  it("throws error for data frame with less than 2 columns", {
    df <- data.frame(x = 1:3)
    expect_error(
      env1$f$fDf.fiter_different_rows(df),
      "must have at least two columns"
    )
  })

  it("throws error for missing column names", {
    df <- data.frame(x = 1:3, y = 1:3)
    expect_error(
      env1$f$fDf.fiter_different_rows(df, colName1 = "nonexistent"),
      "not found in data"
    )
  })

})

describe("fDf.checkConstancyAcrossVars.lgl (production)", {

  it("returns logical vector indicating inconsistencies", {
    df <- data.frame(
      W1_SEX = c(1, 2, 1),
      W2_SEX = c(1, 2, 2),  # row 3 is inconsistent
      W3_SEX = c(1, 2, 1)
    )
    result <- env1$f$fDf.checkConstancyAcrossVars.lgl(df, "SEX")
    expect_true(is.logical(result))
    expect_equal(length(result), 3)
    expect_false(result[1])  # consistent
    expect_false(result[2])  # consistent
    expect_true(result[3])   # inconsistent
  })

  it("handles NA values correctly", {
    df <- data.frame(
      W1_SEX = c(1, NA, 1),
      W2_SEX = c(1, NA, NA),
      W3_SEX = c(1, NA, 2)  # row 3 is inconsistent
    )
    result <- env1$f$fDf.checkConstancyAcrossVars.lgl(df, "SEX")
    expect_false(result[1])  # all 1s
    expect_false(result[2])  # all NA (not enough non-NA)
    expect_true(result[3])   # 1 and 2 (inconsistent)
  })

  it("returns IDs when return_ids=TRUE", {
    df <- data.frame(
      ID = c("A", "B", "C"),
      W1_VAL = c(1, 2, 1),
      W2_VAL = c(1, 2, 2)
    )
    result <- env1$f$fDf.checkConstancyAcrossVars.lgl(df, "VAL", return_ids = TRUE, varname4ID = "ID")
    expect_equal(result, "C")
  })

  it("returns empty character when no inconsistencies with return_ids=TRUE", {
    df <- data.frame(
      ID = c("A", "B"),
      W1_VAL = c(1, 2),
      W2_VAL = c(1, 2)
    )
    result <- env1$f$fDf.checkConstancyAcrossVars.lgl(df, "VAL", return_ids = TRUE, varname4ID = "ID")
    expect_equal(result, character(0))
  })

  it("warns when insufficient columns match pattern", {
    df <- data.frame(W1_SEX = 1:3, OTHER = 4:6)
    expect_warning(
      result <- env1$f$fDf.checkConstancyAcrossVars.lgl(df, "SEX"),
      "Insufficient columns"
    )
    expect_equal(result, rep(FALSE, 3))
  })

  it("throws error for non-data.frame input", {
    expect_error(
      env1$f$fDf.checkConstancyAcrossVars.lgl(list(a = 1:3), "a"),
      "must be a data frame"
    )
  })

  it("throws error when return_ids=TRUE but varname4ID=NULL", {
    df <- data.frame(W1_VAL = 1:3, W2_VAL = 1:3)
    expect_error(
      env1$f$fDf.checkConstancyAcrossVars.lgl(df, "VAL", return_ids = TRUE),
      "varname4ID must be provided"
    )
  })

})
