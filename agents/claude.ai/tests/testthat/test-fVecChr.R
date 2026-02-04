# Test file for fVecChr (Character Vector Operations)
# Source: R/fVecChr-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fVecChr-source.R
.FileName.source.r <- "fVecChr-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("fChr.as_numeric_safe_automatic (production)", {

  it("converts simple numeric strings correctly", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("1", "2", "3"))
    expect_equal(as.vector(result), c(1, 2, 3))
  })

  it("handles space-separated numbers in single string", {
    result <- env1$f$fChr.as_numeric_safe_automatic("3925.355442 1716.978343")
    expect_equal(as.vector(result), c(3925.355442, 1716.978343))
  })

  it("returns original vector when non-numeric values present (default behavior)", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("3925.355442", "abc"))
    expect_equal(result, c("3925.355442", "abc"))
  })

  it("converts non-numeric to NA when force=TRUE", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("3925.355442", "abc"), force = TRUE)
    expect_equal(as.vector(result), c(3925.355442, NA))
  })

  it("handles currency symbols", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("$3,925.35", "1,716.97"))
    expect_equal(as.vector(result), c(3925.35, 1716.97))
  })

  it("handles parentheses for negative numbers", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("(100)", "200"))
    expect_equal(as.vector(result), c(-100, 200))
  })

  it("handles thousands separators", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("1,234,567", "89,012"))
    expect_equal(as.vector(result), c(1234567, 89012))
  })

  it("returns NA_real_ for single NA input", {
    result <- env1$f$fChr.as_numeric_safe_automatic(NA_character_)
    expect_true(is.na(result))
    expect_true(is.numeric(result))
  })

  it("returns numeric(0) for empty input", {
    result <- env1$f$fChr.as_numeric_safe_automatic(character(0))
    expect_equal(result, numeric(0))
  })

  it("handles factors by converting to character first", {
    input <- factor(c("1", "2", "3"))
    result <- env1$f$fChr.as_numeric_safe_automatic(input)
    expect_equal(as.vector(result), c(1, 2, 3))
  })

  it("handles missing codes", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("1", "NA", "", "2"))
    expect_equal(as.vector(result), c(1, NA, NA, 2))
  })

  it("preserves conversion_info attribute", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("1", "2", "3"))
    expect_true(!is.null(attr(result, "conversion_info")))
    expect_equal(attr(result, "conversion_info")$original_length, 3)
  })

  it("handles European decimal separator", {
    result <- env1$f$fChr.as_numeric_safe_automatic(c("1,5", "2,75"),
                                              decimal_sep = ",",
                                              thousands_sep = "")
    expect_equal(as.vector(result), c(1.5, 2.75))
  })

})
