# Test file for fLs-fVec (List and Vector Operations)
# Source: R/fLs-fVec-source.R

library(testthat)

# Define test functions

f_vec1_vec2.setdiff_list <- function(vec1, vec2, print_str = FALSE, output_as_data_frame = FALSE) {
  vec1 <- as.character(vec1)
  vec2 <- as.character(vec2)
  output_list <- list(
    vec1.character = vec1,
    vec2.character = vec2,
    union = union(vec1, vec2),
    intersect = intersect(vec1, vec2),
    setdiff_1_2 = setdiff(vec1, vec2),
    setdiff_2_1 = setdiff(vec2, vec1),
    identical = all.equal(vec1, vec2)
  )
  if (output_as_data_frame) {
    output_df <- data.frame(
      union         = output_list$union,
      vec1          = output_list$union %in% output_list$vec1.character,
      vec2          = output_list$union %in% output_list$vec2.character,
      intersect     = output_list$union %in% output_list$intersect,
      setdiff_1_2   = output_list$union %in% output_list$setdiff_1_2,
      setdiff_2_1   = output_list$union %in% output_list$setdiff_2_1
    )
    return(output_df)
  }
  invisible(output_list)
}

f_chr1.strsplit0_as_vec <- function(input_chr1, split = "") {
  stringr::str_split_1(string = input_chr1, pattern = split)
}

f_chr1.strsplit0_as_vec.unique.sort <- function(input_chr1, split = "") {
  stringr::str_split_1(string = input_chr1, pattern = split) |> unique() |> sort()
}

f_vec_chr.na_if_NotMatching <- function(input_vec_chr, RegEx4keep) {
  ifelse(stringr::str_detect(input_vec_chr, RegEx4keep), input_vec_chr, NA)
}

fVec.na.locf <- function(x, fillLeadingNA = FALSE, defaultValue = NA, verbose = FALSE) {
  if (!is.atomic(x) || !is.null(dim(x))) {
    stop("Input must be atomic vector (numeric/character/logical/factor)")
  }

  if (length(x) == 0) {
    return(x)
  }

  resultVec <- x
  lastValue <- NA
  firstNonNAIndex <- NA_integer_

  for (indexInt in seq_along(resultVec)) {
    currentVal <- resultVec[indexInt]

    if (!is.na(currentVal)) {
      lastValue <- currentVal
      if (is.na(firstNonNAIndex)) {
        firstNonNAIndex <- indexInt
      }
    } else if (!is.na(lastValue)) {
      resultVec[indexInt] <- lastValue
    }
  }

  if (fillLeadingNA && !is.na(firstNonNAIndex) && firstNonNAIndex > 1) {
    fillValue <- resultVec[firstNonNAIndex]
    resultVec[1:(firstNonNAIndex - 1)] <- fillValue
  } else if (fillLeadingNA && is.na(firstNonNAIndex)) {
    resultVec[] <- defaultValue
  }

  return(resultVec)
}

describe("f_vec1_vec2.setdiff_list", {

  it("computes union correctly", {
    result <- f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(sort(result$union), c("a", "b", "c", "d"))
  })

  it("computes intersect correctly", {
    result <- f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(sort(result$intersect), c("b", "c"))
  })

  it("computes setdiff_1_2 correctly", {
    result <- f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(result$setdiff_1_2, c("a"))
  })

  it("computes setdiff_2_1 correctly", {
    result <- f_vec1_vec2.setdiff_list(c("a", "b", "c"), c("b", "c", "d"))
    expect_equal(result$setdiff_2_1, c("d"))
  })

  it("identifies identical vectors", {
    result <- f_vec1_vec2.setdiff_list(c("a", "b"), c("a", "b"))
    expect_true(isTRUE(result$identical))
  })

  it("returns data frame when output_as_data_frame=TRUE", {
    result <- f_vec1_vec2.setdiff_list(c("a", "b"), c("b", "c"),
                                       output_as_data_frame = TRUE)
    expect_true(is.data.frame(result))
    expect_true("union" %in% names(result))
    expect_true("vec1" %in% names(result))
    expect_true("vec2" %in% names(result))
  })

  it("handles numeric input by converting to character", {
    result <- f_vec1_vec2.setdiff_list(1:3, 2:4)
    expect_equal(sort(result$union), c("1", "2", "3", "4"))
  })

  it("handles empty vectors", {
    result <- f_vec1_vec2.setdiff_list(character(0), c("a", "b"))
    expect_equal(result$setdiff_2_1, c("a", "b"))
    expect_equal(result$setdiff_1_2, character(0))
  })

})

describe("f_chr1.strsplit0_as_vec", {

  it("splits string into individual characters", {
    result <- f_chr1.strsplit0_as_vec("hello")
    expect_equal(result, c("h", "e", "l", "l", "o"))
  })

  it("splits by custom separator", {
    result <- f_chr1.strsplit0_as_vec("a,b,c", split = ",")
    expect_equal(result, c("a", "b", "c"))
  })

  it("handles empty string", {
    result <- f_chr1.strsplit0_as_vec("")
    expect_equal(result, character(0))
  })

  it("handles single character", {
    result <- f_chr1.strsplit0_as_vec("x")
    expect_equal(result, "x")
  })

})

describe("f_chr1.strsplit0_as_vec.unique.sort", {

  it("returns unique sorted characters", {
    result <- f_chr1.strsplit0_as_vec.unique.sort("banana")
    expect_equal(result, c("a", "b", "n"))
  })

  it("handles string with no duplicates", {
    result <- f_chr1.strsplit0_as_vec.unique.sort("abc")
    expect_equal(result, c("a", "b", "c"))
  })

  it("handles string with all same characters", {
    result <- f_chr1.strsplit0_as_vec.unique.sort("aaaa")
    expect_equal(result, "a")
  })

})

describe("f_vec_chr.na_if_NotMatching", {

  it("replaces non-matching elements with NA", {
    result <- f_vec_chr.na_if_NotMatching(c("apple", "banana", "cherry"), "^a")
    expect_equal(result, c("apple", NA, NA))
  })

  it("keeps all elements when all match", {
    result <- f_vec_chr.na_if_NotMatching(c("apple", "avocado", "apricot"), "^a")
    expect_equal(result, c("apple", "avocado", "apricot"))
  })

  it("returns all NA when none match", {
    result <- f_vec_chr.na_if_NotMatching(c("banana", "cherry"), "^a")
    expect_equal(result, c(NA_character_, NA_character_))
  })

  it("handles complex regex patterns", {
    result <- f_vec_chr.na_if_NotMatching(c("test123", "test456", "notest"), "^test\\d+$")
    expect_equal(result, c("test123", "test456", NA))
  })

  it("preserves vector length", {
    input <- c("a", "b", "c", "d")
    result <- f_vec_chr.na_if_NotMatching(input, "^[ab]$")
    expect_equal(length(result), length(input))
  })

})

describe("fVec.na.locf", {

  it("fills NA with last observation", {
    result <- fVec.na.locf(c(1, NA, NA, 2, NA, 3))
    expect_equal(result, c(1, 1, 1, 2, 2, 3))
  })

  it("leaves leading NA when fillLeadingNA=FALSE", {
    result <- fVec.na.locf(c(NA, NA, 1, NA, 2))
    expect_equal(result, c(NA, NA, 1, 1, 2))
  })

  it("fills leading NA when fillLeadingNA=TRUE", {
    result <- fVec.na.locf(c(NA, NA, 1, NA, 2), fillLeadingNA = TRUE)
    expect_equal(result, c(1, 1, 1, 1, 2))
  })

  it("uses defaultValue for all-NA vector", {
    result <- fVec.na.locf(c(NA, NA, NA), fillLeadingNA = TRUE, defaultValue = 0)
    expect_equal(result, c(0, 0, 0))
  })

  it("handles character vectors", {
    result <- fVec.na.locf(c("a", NA, "b", NA))
    expect_equal(result, c("a", "a", "b", "b"))
  })

  it("handles logical vectors", {
    result <- fVec.na.locf(c(TRUE, NA, FALSE, NA))
    expect_equal(result, c(TRUE, TRUE, FALSE, FALSE))
  })

  it("returns empty vector for empty input", {
    result <- fVec.na.locf(numeric(0))
    expect_equal(result, numeric(0))
  })

  it("throws error for non-atomic input", {
    expect_error(
      fVec.na.locf(list(1, 2, 3)),
      "Input must be atomic vector"
    )
  })

  it("throws error for matrix input", {
    expect_error(
      fVec.na.locf(matrix(1:4, nrow = 2)),
      "Input must be atomic vector"
    )
  })

})
