# Test file for fLs-fVec (List and Vector Operations)
# Source: R/fLs-fVec-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fLs-fVec-source.R
.FileName.source.r <- "fLs-fVec-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("f_vec1_vec2.setdiff_list (production)", {

  it("computes union correctly", {
    result <- env1$f$f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(sort(result$union), c("a", "b", "c", "d"))
  })

  it("computes intersect correctly", {
    result <- env1$f$f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(sort(result$intersect), c("b", "c"))
  })

  it("computes setdiff_1_2 correctly", {
    result <- env1$f$f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(result$setdiff_1_2, c("a"))
  })

  it("computes setdiff_2_1 correctly", {
    result <- env1$f$f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(result$setdiff_2_1, c("d"))
  })

  it("identifies identical vectors", {
    result <- env1$f$f_vec1_vec2.setdiff_list(c("a", "b"), c("a", "b"))
    expect_true(isTRUE(result$identical))
  })

  it("returns data frame when output_as_data_frame=TRUE", {
    result <- env1$f$f_vec1_vec2.setdiff_list(c("a", "b"), c("b", "c"),
                                       output_as_data_frame = TRUE)
    expect_true(is.data.frame(result))
    expect_true("union" %in% names(result))
    expect_true("vec1" %in% names(result))
    expect_true("vec2" %in% names(result))
  })

  it("handles numeric input by converting to character", {
    result <- env1$f$f_vec1_vec2.setdiff_list(1:3, 2:4)
    expect_equal(sort(result$union), c("1", "2", "3", "4"))
  })

  it("handles empty vectors", {
    result <- env1$f$f_vec1_vec2.setdiff_list(character(0), c("a", "b"))
    expect_equal(result$setdiff_2_1, c("a", "b"))
    expect_equal(result$setdiff_1_2, character(0))
  })

})

describe("f_chr1.strsplit0_as_vec (production)", {

  it("splits string into individual characters", {
    result <- env1$f$f_chr1.strsplit0_as_vec("hello")
    expect_equal(result, c("h", "e", "l", "l", "o"))
  })

  it("splits by custom separator", {
    result <- env1$f$f_chr1.strsplit0_as_vec("a,b,c", split = ",")
    expect_equal(result, c("a", "b", "c"))
  })

  it("handles empty string", {
    result <- env1$f$f_chr1.strsplit0_as_vec("")
    expect_equal(result, character(0))
  })

  it("handles single character", {
    result <- env1$f$f_chr1.strsplit0_as_vec("x")
    expect_equal(result, "x")
  })

})

describe("f_chr1.strsplit0_as_vec.unique.sort (production)", {

  it("returns unique sorted characters", {
    result <- env1$f$f_chr1.strsplit0_as_vec.unique.sort("banana")
    expect_equal(result, c("a", "b", "n"))
  })

  it("handles string with no duplicates", {
    result <- env1$f$f_chr1.strsplit0_as_vec.unique.sort("abc")
    expect_equal(result, c("a", "b", "c"))
  })

  it("handles string with all same characters", {
    result <- env1$f$f_chr1.strsplit0_as_vec.unique.sort("aaaa")
    expect_equal(result, "a")
  })

})

describe("f_vec_chr.na_if_NotMatching (production)", {

  it("replaces non-matching elements with NA", {
    result <- env1$f$f_vec_chr.na_if_NotMatching(c("apple", "banana", "cherry"), "^a")
    expect_equal(result, c("apple", NA, NA))
  })

  it("keeps all elements when all match", {
    result <- env1$f$f_vec_chr.na_if_NotMatching(c("apple", "avocado", "apricot"), "^a")
    expect_equal(result, c("apple", "avocado", "apricot"))
  })

  it("returns all NA when none match", {
    result <- env1$f$f_vec_chr.na_if_NotMatching(c("banana", "cherry"), "^a")
    expect_equal(result, c(NA_character_, NA_character_))
  })

  it("handles complex regex patterns", {
    result <- env1$f$f_vec_chr.na_if_NotMatching(c("test123", "test456", "notest"), "^test\\d+$")
    expect_equal(result, c("test123", "test456", NA))
  })

  it("preserves vector length", {
    input <- c("a", "b", "c", "d")
    result <- env1$f$f_vec_chr.na_if_NotMatching(input, "^[ab]$")
    expect_equal(length(result), length(input))
  })

})

describe("fVec.na.locf (production)", {

  it("fills NA with last observation", {
    result <- env1$f$fVec.na.locf(c(1, NA, NA, 2, NA, 3))
    expect_equal(result, c(1, 1, 1, 2, 2, 3))
  })

  it("leaves leading NA when fillLeadingNA=FALSE", {
    result <- env1$f$fVec.na.locf(c(NA, NA, 1, NA, 2))
    expect_equal(result, c(NA, NA, 1, 1, 2))
  })

  it("fills leading NA when fillLeadingNA=TRUE", {
    result <- env1$f$fVec.na.locf(c(NA, NA, 1, NA, 2), fillLeadingNA = TRUE)
    expect_equal(result, c(1, 1, 1, 1, 2))
  })

  it("uses defaultValue for all-NA vector", {
    result <- env1$f$fVec.na.locf(c(NA, NA, NA), fillLeadingNA = TRUE, defaultValue = 0)
    expect_equal(result, c(0, 0, 0))
  })

  it("handles character vectors", {
    result <- env1$f$fVec.na.locf(c("a", NA, "b", NA))
    expect_equal(result, c("a", "a", "b", "b"))
  })

  it("handles logical vectors", {
    result <- env1$f$fVec.na.locf(c(TRUE, NA, FALSE, NA))
    expect_equal(result, c(TRUE, TRUE, FALSE, FALSE))
  })

  it("returns empty vector for empty input", {
    result <- env1$f$fVec.na.locf(numeric(0))
    expect_equal(result, numeric(0))
  })

  it("throws error for non-atomic input", {
    expect_error(
      env1$f$fVec.na.locf(list(1, 2, 3)),
      "Input must be atomic vector"
    )
  })

  it("throws error for matrix input", {
    expect_error(
      env1$f$fVec.na.locf(matrix(1:4, nrow = 2)),
      "Input must be atomic vector"
    )
  })

})
