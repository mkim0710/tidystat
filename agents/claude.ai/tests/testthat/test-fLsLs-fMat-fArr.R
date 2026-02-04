# Test file for fLsLs-fMat-fArr (Nested List, Matrix, Array Operations)
# Source: R/fLsLs-fMat-fArr-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fLsLs-fMat-fArr-source.R
.FileName.source.r <- "fLsLs-fMat-fArr-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("f_list_list.to_matrix (production)", {

  it("converts nested list to matrix (column-major)", {
    ll <- list(
      C1 = list(R1 = "R1C1", R2 = "R2C1"),
      C2 = list(R1 = "R1C2", R2 = "R2C2")
    )
    result <- env1$f$f_list_list.to_matrix(ll, type = "list_list[[indexColumn]][[indexRow]]")
    expect_true(is.matrix(result))
    expect_equal(dim(result), c(2, 2))
    expect_equal(result["R1", "C1"], "R1C1")
    expect_equal(result["R2", "C2"], "R2C2")
  })

  it("converts nested list to matrix (row-major)", {
    ll <- list(
      R1 = list(C1 = "R1C1", C2 = "R1C2"),
      R2 = list(C1 = "R2C1", C2 = "R2C2")
    )
    result <- env1$f$f_list_list.to_matrix(ll, type = "list_list[[indexRow]][[indexColumn]]")
    expect_true(is.matrix(result))
    expect_equal(dim(result), c(2, 2))
  })

  it("preserves dimension names", {
    ll <- list(
      Col1 = list(Row1 = 1, Row2 = 2),
      Col2 = list(Row1 = 3, Row2 = 4)
    )
    result <- env1$f$f_list_list.to_matrix(ll)
    expect_equal(colnames(result), c("Col1", "Col2"))
    expect_equal(rownames(result), c("Row1", "Row2"))
  })

  it("throws error for invalid type", {
    ll <- list(A = list(B = 1))
    expect_error(
      env1$f$f_list_list.to_matrix(ll, type = "invalid"),
      "Please specify type"
    )
  })

})

describe("f_matrix.to_list_list (production)", {

  it("converts matrix to nested list (column-major)", {
    m <- matrix(1:6, nrow = 2, ncol = 3,
                dimnames = list(c("R1", "R2"), c("C1", "C2", "C3")))
    result <- env1$f$f_matrix.to_list_list(m)
    expect_true(is.list(result))
    expect_equal(length(result), 3)
    expect_equal(names(result), c("C1", "C2", "C3"))
    expect_equal(result$C1$R1, 1)
    expect_equal(result$C2$R2, 4)
  })

  it("converts matrix to nested list (row-major)", {
    m <- matrix(1:6, nrow = 2, ncol = 3,
                dimnames = list(c("R1", "R2"), c("C1", "C2", "C3")))
    result <- env1$f$f_matrix.to_list_list(m, type = "list_list[[indexRow]][[indexColumn]]")
    expect_true(is.list(result))
    expect_equal(length(result), 2)
    expect_equal(names(result), c("R1", "R2"))
  })

  it("assigns default row/column names if missing", {
    m <- matrix(1:4, nrow = 2, ncol = 2)
    result <- env1$f$f_matrix.to_list_list(m)
    expect_equal(names(result), c("C1", "C2"))
    expect_equal(names(result$C1), c("R1", "R2"))
  })

  it("throws error for non-2D input", {
    arr <- array(1:8, dim = c(2, 2, 2))
    expect_error(
      env1$f$f_matrix.to_list_list(arr),
      "length\\(dim\\(input_matrix\\)\\) != 2"
    )
  })

})

describe("f_matrix.set_names.to_vector (production)", {

  it("converts matrix to named vector", {
    m <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2,
                dimnames = list(c("R1", "R2"), c("C1", "C2")))
    result <- env1$f$f_matrix.set_names.to_vector(m)
    expect_true(is.numeric(result))
    expect_equal(length(result), 4)
    expect_equal(names(result), c("R1C1", "R2C1", "R1C2", "R2C2"))
  })

  it("assigns default names if missing", {
    m <- matrix(1:6, nrow = 2, ncol = 3)
    result <- env1$f$f_matrix.set_names.to_vector(m)
    expect_true(all(grepl("^R[12]C[123]$", names(result))))
  })

  it("preserves values in correct order", {
    m <- matrix(c(10, 20, 30, 40), nrow = 2, ncol = 2,
                dimnames = list(c("A", "B"), c("X", "Y")))
    result <- env1$f$f_matrix.set_names.to_vector(m)
    expect_equal(result["AX"], 10)
    expect_equal(result["BX"], 20)
    expect_equal(result["AY"], 30)
    expect_equal(result["BY"], 40)
  })

})

describe("fLs.removeEnvAttr (production)", {

  it("removes .Environment attribute", {
    testList <- list(a = 1, b = 2)
    attr(testList$a, ".Environment") <- globalenv()
    result <- env1$f$fLs.removeEnvAttr(testList)
    expect_null(attr(result$a, ".Environment"))
  })

  it("processes nested lists", {
    testList <- list(
      outer = list(
        inner = 1
      )
    )
    attr(testList$outer$inner, ".Environment") <- globalenv()
    result <- env1$f$fLs.removeEnvAttr(testList)
    expect_null(attr(result$outer$inner, ".Environment"))
  })

  it("replaces environments with empty list when drop_env_objects=TRUE", {
    testEnv <- new.env()
    testEnv$x <- 1
    testList <- list(myEnv = testEnv, val = 42)
    result <- env1$f$fLs.removeEnvAttr(testList, drop_env_objects = TRUE)
    expect_equal(result$myEnv, list())
    expect_equal(result$val, 42)
  })

  it("converts environments to lists when convert_env_to_list=TRUE", {
    testEnv <- new.env()
    testEnv$x <- 1
    testEnv$y <- 2
    testList <- list(myEnv = testEnv)
    result <- env1$f$fLs.removeEnvAttr(testList, convert_env_to_list = TRUE)
    expect_true(is.list(result$myEnv))
    expect_equal(sort(names(result$myEnv)), c("x", "y"))
  })

  it("throws error when both drop_env_objects and convert_env_to_list are TRUE", {
    expect_error(
      env1$f$fLs.removeEnvAttr(list(a = 1), drop_env_objects = TRUE, convert_env_to_list = TRUE),
      "Choose \\*either\\*"
    )
  })

  it("throws error for non-list input", {
    expect_error(
      env1$f$fLs.removeEnvAttr(c(1, 2, 3)),
      "is.list"
    )
  })

})
