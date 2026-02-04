# Test file for fDf.filter (Data Frame Filtering Operations)
# Source: R/fDf.filter-source.R

library(testthat)

# Define test functions

fDf.fiter_different_rows <- function(
  inputDf,
  colName1 = names(inputDf)[1],
  colName2 = names(inputDf)[2],
  output_varName = "mismatched",
  add_row_number = FALSE,
  na_mode = c("distinct", "match", "ignore"),
  tol = 1e-8,
  verbose = FALSE,
  prefix = "",
  suffix = "",
  add_original_cols = FALSE
) {
  if (!inherits(inputDf, "data.frame")) {
    stop("The 'inputDf' must be a data frame.")
  }
  if (ncol(inputDf) < 2) {
    stop("The 'inputDf' must have at least two columns.")
  }

  na_mode <- match.arg(na_mode)

  if (!all(c(colName1, colName2) %in% names(inputDf))) {
    missing_cols <- c(colName1, colName2)[!(c(colName1, colName2) %in% names(inputDf))]
    stop(paste0("Column(s) ", paste(missing_cols, collapse = ", "), " not found in data."))
  }

  if (isTRUE(add_row_number)) {
    rowNumberCol <- paste0(prefix, "row_number", suffix)
    inputDf[[rowNumberCol]] <- seq_len(nrow(inputDf))
  }

  col1 <- inputDf[[colName1]]
  col2 <- inputDf[[colName2]]

  if (is.factor(col1)) col1 <- as.character(col1)
  if (is.factor(col2)) col2 <- as.character(col2)

  .rowMismatch <- function(v1, v2) {
    if (is.na(v1) || is.na(v2)) {
      if (na_mode == "ignore") return(FALSE)
      else if (na_mode == "match") return(xor(is.na(v1), is.na(v2)))
      else if (na_mode == "distinct") return(TRUE)
    }
    if (is.numeric(v1) && is.numeric(v2)) {
      return(abs(v1 - v2) > tol)
    } else {
      return(v1 != v2)
    }
  }

  mismatchVec <- mapply(.rowMismatch, col1, col2)
  mismatchRows <- inputDf[mismatchVec, , drop = FALSE]

  mismatchColName <- paste0(prefix, output_varName, suffix)
  if (nrow(mismatchRows) > 0) {
    mismatchRows[[mismatchColName]] <- TRUE
  } else {
    mismatchRows[[mismatchColName]] <- logical(0)
  }

  if (isTRUE(add_original_cols) && nrow(mismatchRows) > 0) {
    newCol1Name <- paste0(prefix, colName1, suffix)
    newCol2Name <- paste0(prefix, colName2, suffix)
    mismatchRows[[newCol1Name]] <- mismatchRows[[colName1]]
    mismatchRows[[newCol2Name]] <- mismatchRows[[colName2]]
  }

  return(mismatchRows)
}

fDf.checkConstancyAcrossVars.lgl <- function(dfInput, pattern, return_ids = FALSE, varname4ID = NULL) {
  if (!is.data.frame(dfInput)) {
    stop("Input must be a data frame")
  }
  if (return_ids && is.null(varname4ID)) {
    stop("varname4ID must be provided when return_ids=TRUE")
  }

  cols_vec <- grep(pattern, names(dfInput), value = TRUE)

  if (length(cols_vec) < 2) {
    warning("Insufficient columns (", length(cols_vec), ") for comparison")
    return(if (return_ids) character(0) else rep(FALSE, nrow(dfInput)))
  }

  lgl.inconsistent <- apply(dfInput[, cols_vec, drop = FALSE], 1, function(row) {
    non_na <- row[!is.na(row)]
    length(non_na) >= 2 && length(unique(non_na)) > 1
  })

  if (return_ids) {
    if (sum(lgl.inconsistent) == 0) return(character(0))
    return(dfInput[[varname4ID]][lgl.inconsistent])
  } else {
    return(lgl.inconsistent)
  }
}

describe("fDf.fiter_different_rows", {

  it("identifies rows where columns differ", {
    df <- data.frame(x = c(1, 2, 2, 4), y = c(1, 2, 4, 4))
    result <- fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 1)
    expect_equal(result$x[1], 2)
    expect_equal(result$y[1], 4)
  })

  it("returns empty data frame when all rows match", {
    df <- data.frame(x = c(1, 2, 3), y = c(1, 2, 3))
    result <- fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 0)
  })

  it("adds mismatched indicator column", {
    df <- data.frame(x = c(1, 2), y = c(1, 3))
    result <- fDf.fiter_different_rows(df)
    expect_true("mismatched" %in% names(result))
    expect_true(all(result$mismatched))
  })

  it("adds row number when add_row_number=TRUE", {
    df <- data.frame(x = c(1, 2, 3), y = c(1, 3, 3))
    result <- fDf.fiter_different_rows(df, add_row_number = TRUE)
    expect_true("row_number" %in% names(result))
    expect_equal(result$row_number, 2)
  })

  it("handles NA values with na_mode='distinct'", {
    df <- data.frame(x = c(1, NA, NA), y = c(1, 2, NA))
    result <- fDf.fiter_different_rows(df, na_mode = "distinct")
    expect_equal(nrow(result), 2)  # both NA rows are mismatches
  })

  it("handles NA values with na_mode='match'", {
    df <- data.frame(x = c(1, NA, NA), y = c(1, 2, NA))
    result <- fDf.fiter_different_rows(df, na_mode = "match")
    expect_equal(nrow(result), 1)  # only row 2 (NA vs 2) is mismatch
  })

  it("handles NA values with na_mode='ignore'", {
    df <- data.frame(x = c(1, NA, NA), y = c(1, 2, NA))
    result <- fDf.fiter_different_rows(df, na_mode = "ignore")
    expect_equal(nrow(result), 0)  # no mismatches when NA involved
  })

  it("respects numeric tolerance", {
    df <- data.frame(x = c(1.00000001, 2.0), y = c(1.00000000, 2.00000010))
    result <- fDf.fiter_different_rows(df, tol = 1e-8)
    expect_equal(nrow(result), 1)
  })

  it("uses custom column names", {
    df <- data.frame(a = c(1, 2), b = c(1, 3), c = c(5, 6))
    result <- fDf.fiter_different_rows(df, colName1 = "a", colName2 = "b")
    expect_equal(nrow(result), 1)
  })

  it("handles character columns", {
    df <- data.frame(x = c("a", "b"), y = c("a", "c"), stringsAsFactors = FALSE)
    result <- fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 1)
  })

  it("handles factor columns by converting to character", {
    df <- data.frame(x = factor(c("a", "b")), y = factor(c("a", "c")))
    result <- fDf.fiter_different_rows(df)
    expect_equal(nrow(result), 1)
  })

  it("throws error for non-data.frame input", {
    expect_error(
      fDf.fiter_different_rows(list(x = 1:3, y = 1:3)),
      "must be a data frame"
    )
  })

  it("throws error for data frame with less than 2 columns", {
    df <- data.frame(x = 1:3)
    expect_error(
      fDf.fiter_different_rows(df),
      "must have at least two columns"
    )
  })

  it("throws error for missing column names", {
    df <- data.frame(x = 1:3, y = 1:3)
    expect_error(
      fDf.fiter_different_rows(df, colName1 = "nonexistent"),
      "not found in data"
    )
  })

})

describe("fDf.checkConstancyAcrossVars.lgl", {

  it("returns logical vector indicating inconsistencies", {
    df <- data.frame(
      W1_SEX = c(1, 2, 1),
      W2_SEX = c(1, 2, 2),  # row 3 is inconsistent
      W3_SEX = c(1, 2, 1)
    )
    result <- fDf.checkConstancyAcrossVars.lgl(df, "SEX")
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
    result <- fDf.checkConstancyAcrossVars.lgl(df, "SEX")
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
    result <- fDf.checkConstancyAcrossVars.lgl(df, "VAL", return_ids = TRUE, varname4ID = "ID")
    expect_equal(result, "C")
  })

  it("returns empty character when no inconsistencies with return_ids=TRUE", {
    df <- data.frame(
      ID = c("A", "B"),
      W1_VAL = c(1, 2),
      W2_VAL = c(1, 2)
    )
    result <- fDf.checkConstancyAcrossVars.lgl(df, "VAL", return_ids = TRUE, varname4ID = "ID")
    expect_equal(result, character(0))
  })

  it("warns when insufficient columns match pattern", {
    df <- data.frame(W1_SEX = 1:3, OTHER = 4:6)
    expect_warning(
      result <- fDf.checkConstancyAcrossVars.lgl(df, "SEX"),
      "Insufficient columns"
    )
    expect_equal(result, rep(FALSE, 3))
  })

  it("throws error for non-data.frame input", {
    expect_error(
      fDf.checkConstancyAcrossVars.lgl(list(a = 1:3), "a"),
      "must be a data frame"
    )
  })

  it("throws error when return_ids=TRUE but varname4ID=NULL", {
    df <- data.frame(W1_VAL = 1:3, W2_VAL = 1:3)
    expect_error(
      fDf.checkConstancyAcrossVars.lgl(df, "VAL", return_ids = TRUE),
      "varname4ID must be provided"
    )
  })

})
