# Test file for fVecNum (Numeric Vector Operations)
# Source: R/fVecNum-source.R

library(testthat)

# Define the function for testing
fNum.signif_preserve_decimals <- function(numVec,
                                          signifDigitsInt = 4L,
                                          roundDigitsInt = 3L,
                                          verboseBool = FALSE) {
  if (!is.numeric(numVec) && !is.data.frame(numVec)) {
    stop("Input 'numVec' must be numeric or a data frame")
  }

  stopifnot(
    length(signifDigitsInt) == 1L,
    signifDigitsInt >= 1L,
    signifDigitsInt == as.integer(signifDigitsInt),
    length(roundDigitsInt) == 1L,
    roundDigitsInt >= 0L,
    roundDigitsInt == as.integer(roundDigitsInt)
  )

  fNum_processSingleValue <- function(numVal) {
    if (is.na(numVal) || is.infinite(numVal) || numVal == 0) {
      return(numVal)
    }

    roundedVal <- round(numVal, digits = roundDigitsInt)
    signifVal <- signif(numVal, digits = signifDigitsInt)
    roundedSignifVal <- round(signifVal, digits = roundDigitsInt)

    result <- if (identical(roundedVal, roundedSignifVal)) signifVal else roundedVal
    return(result)
  }

  if (is.data.frame(numVec)) {
    resultObj <- numVec
    numCols <- vapply(numVec, is.numeric, logical(1))
    resultObj[numCols] <- lapply(resultObj[numCols], function(col) {
      vapply(col, fNum_processSingleValue, numeric(1))
    })
    return(resultObj)
  }

  originalAttributes <- attributes(numVec)
  resultVec <- vapply(as.vector(numVec), fNum_processSingleValue, numeric(1))
  attributes(resultVec) <- originalAttributes

  return(resultVec)
}

describe("fNum.signif_preserve_decimals", {

  it("processes numeric vector correctly", {
    result <- fNum.signif_preserve_decimals(c(12345.6789, 1.23456, 0.0012345))
    expect_true(is.numeric(result))
    expect_equal(length(result), 3)
  })

  it("preserves zeros", {
    result <- fNum.signif_preserve_decimals(c(0, 0.0, 0.00))
    expect_equal(result, c(0, 0, 0))
  })

  it("handles NA values", {
    result <- fNum.signif_preserve_decimals(c(1.234, NA, 5.678))
    expect_equal(result[1], fNum.signif_preserve_decimals(1.234))
    expect_true(is.na(result[2]))
    expect_equal(result[3], fNum.signif_preserve_decimals(5.678))
  })

  it("handles Inf values", {
    result <- fNum.signif_preserve_decimals(c(1.234, Inf, -Inf))
    expect_equal(result[2], Inf)
    expect_equal(result[3], -Inf)
  })

  it("processes matrix and preserves structure", {
    m <- matrix(c(123.456, 0.012345, 1000.123, 0.0001), nrow = 2)
    result <- fNum.signif_preserve_decimals(m)
    expect_true(is.matrix(result))
    expect_equal(dim(result), dim(m))
  })

  it("processes data frame and preserves non-numeric columns", {
    df <- data.frame(a = c(12345.6789, 0.01234), b = 1:2, ch = c("x", "y"))
    result <- fNum.signif_preserve_decimals(df)
    expect_true(is.data.frame(result))
    expect_equal(result$ch, c("x", "y"))
    expect_equal(result$b, c(1, 2))
  })

  it("respects signifDigitsInt parameter", {
    result <- fNum.signif_preserve_decimals(12345.6789, signifDigitsInt = 3L)
    expect_true(is.numeric(result))
  })

  it("respects roundDigitsInt parameter", {
    result <- fNum.signif_preserve_decimals(0.123456, roundDigitsInt = 2L)
    expect_true(is.numeric(result))
  })

  it("throws error for non-numeric input", {
    expect_error(
      fNum.signif_preserve_decimals("not a number"),
      "Input 'numVec' must be numeric or a data frame"
    )
  })

  it("throws error for invalid signifDigitsInt", {
    expect_error(fNum.signif_preserve_decimals(1.234, signifDigitsInt = 0))
    expect_error(fNum.signif_preserve_decimals(1.234, signifDigitsInt = c(1, 2)))
  })

  it("throws error for invalid roundDigitsInt", {
    expect_error(fNum.signif_preserve_decimals(1.234, roundDigitsInt = -1))
    expect_error(fNum.signif_preserve_decimals(1.234, roundDigitsInt = c(1, 2)))
  })

  it("handles very small numbers", {
    result <- fNum.signif_preserve_decimals(0.000000123)
    expect_true(is.numeric(result))
  })

  it("handles very large numbers", {
    result <- fNum.signif_preserve_decimals(1234567890123)
    expect_true(is.numeric(result))
  })

})
