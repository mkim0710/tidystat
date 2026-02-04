# Test file for fVecNum (Numeric Vector Operations)
# Source: R/fVecNum-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fVecNum-source.R
.FileName.source.r <- "fVecNum-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("fNum.signif_preserve_decimals (production)", {

  it("processes numeric vector correctly", {
    result <- env1$f$fNum.signif_preserve_decimals(c(12345.6789, 1.23456, 0.0012345))
    expect_true(is.numeric(result))
    expect_equal(length(result), 3)
  })

  it("preserves zeros", {
    result <- env1$f$fNum.signif_preserve_decimals(c(0, 0.0, 0.00))
    expect_equal(result, c(0, 0, 0))
  })

  it("handles NA values", {
    result <- env1$f$fNum.signif_preserve_decimals(c(1.234, NA, 5.678))
    expect_equal(result[1], env1$f$fNum.signif_preserve_decimals(1.234))
    expect_true(is.na(result[2]))
    expect_equal(result[3], env1$f$fNum.signif_preserve_decimals(5.678))
  })

  it("handles Inf values", {
    result <- env1$f$fNum.signif_preserve_decimals(c(1.234, Inf, -Inf))
    expect_equal(result[2], Inf)
    expect_equal(result[3], -Inf)
  })

  it("processes matrix and preserves structure", {
    m <- matrix(c(123.456, 0.012345, 1000.123, 0.0001), nrow = 2)
    result <- env1$f$fNum.signif_preserve_decimals(m)
    expect_true(is.matrix(result))
    expect_equal(dim(result), dim(m))
  })

  it("processes data frame and preserves non-numeric columns", {
    df <- data.frame(a = c(12345.6789, 0.01234), b = 1:2, ch = c("x", "y"))
    result <- env1$f$fNum.signif_preserve_decimals(df)
    expect_true(is.data.frame(result))
    expect_equal(result$ch, c("x", "y"))
    expect_equal(result$b, c(1, 2))
  })

  it("respects signifDigitsInt parameter", {
    result <- env1$f$fNum.signif_preserve_decimals(12345.6789, signifDigitsInt = 3L)
    expect_true(is.numeric(result))
  })

  it("respects roundDigitsInt parameter", {
    result <- env1$f$fNum.signif_preserve_decimals(0.123456, roundDigitsInt = 2L)
    expect_true(is.numeric(result))
  })

  it("throws error for non-numeric input", {
    expect_error(
      env1$f$fNum.signif_preserve_decimals("not a number"),
      "Input 'numVec' must be numeric or a data frame"
    )
  })

  it("throws error for invalid signifDigitsInt", {
    expect_error(env1$f$fNum.signif_preserve_decimals(1.234, signifDigitsInt = 0))
    expect_error(env1$f$fNum.signif_preserve_decimals(1.234, signifDigitsInt = c(1, 2)))
  })

  it("throws error for invalid roundDigitsInt", {
    expect_error(env1$f$fNum.signif_preserve_decimals(1.234, roundDigitsInt = -1))
    expect_error(env1$f$fNum.signif_preserve_decimals(1.234, roundDigitsInt = c(1, 2)))
  })

  it("handles very small numbers", {
    result <- env1$f$fNum.signif_preserve_decimals(0.000000123)
    expect_true(is.numeric(result))
  })

  it("handles very large numbers", {
    result <- env1$f$fNum.signif_preserve_decimals(1234567890123)
    expect_true(is.numeric(result))
  })

})
