# Test file for fObj-fStr (Object and String/Structure Operations)
# Source: R/fObj-fStr-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fObj-fStr-source.R
.FileName.source.r <- "fObj-fStr-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("paste0_collapse0 (production)", {

  it("concatenates strings with empty collapse", {
    result <- env1$f$paste0_collapse0("a", "b", "c")
    expect_equal(result, "abc")
  })

  it("handles custom collapse separator", {
    result <- env1$f$paste0_collapse0("a", "b", "c", collapse = "-")
    expect_equal(result, "a-b-c")
  })

  it("handles single element", {
    result <- env1$f$paste0_collapse0("only")
    expect_equal(result, "only")
  })

  it("handles empty input", {
    result <- env1$f$paste0_collapse0()
    expect_equal(result, "")
  })

  it("warns when elements have length > 1", {
    expect_warning(
      env1$f$paste0_collapse0("a", "b", 1:3),
      "length > 1"
    )
  })

  it("handles numeric input", {
    result <- env1$f$paste0_collapse0(1, 2, 3)
    expect_equal(result, "123")
  })

})

describe("cat0 (production)", {

  it("outputs text with trailing newline", {
    expect_output(env1$f$cat0("hello"), "hello  \n")
  })

  it("concatenates multiple arguments", {
    expect_output(env1$f$cat0("a", "b", "c"), "abc  \n")
  })

  it("handles numeric input", {
    expect_output(env1$f$cat0(1, 2, 3), "123  \n")
  })

})

describe("catLF (production)", {

  it("outputs text with line feed separators", {
    expect_output(env1$f$catLF("line1", "line2"), "line1  \nline2  \n  \n")
  })

  it("uses single newline when trailing_double_spaces=FALSE", {
    expect_output(env1$f$catLF("line1", "line2", trailing_double_spaces = FALSE), "line1\nline2\n\n")
  })

})

describe("fObject.DfObjectSize_IEC (production)", {

  it("returns tibble for direct object input", {
    a <- 1:100
    result <- env1$f$fObject.DfObjectSize_IEC(a)
    expect_true(tibble::is_tibble(result))
    expect_equal(nrow(result), 1)
    expect_true(all(c("ObjectName", "Size_GiB", "Size_MiB", "Size_KiB", "Size_B") %in% names(result)))
  })

  it("returns tibble for multiple objects by name", {
    test_env <- new.env()
    test_env$x <- 1:100
    test_env$y <- matrix(1:1000, nrow = 100)
    result <- env1$f$fObject.DfObjectSize_IEC(c("x", "y"), env = test_env)
    expect_equal(nrow(result), 2)
    expect_equal(result$ObjectName, c("x", "y"))
  })

  it("returns list when return='list'", {
    a <- 1:100
    result <- env1$f$fObject.DfObjectSize_IEC(a, return = "list")
    expect_true(is.list(result))
    expect_true(all(c("GiB", "MiB", "KiB", "B") %in% names(result[[1]])))
  })

  it("respects digits parameter", {
    a <- 1:10000
    result <- env1$f$fObject.DfObjectSize_IEC(a, digits = 4L)
    expect_true(tibble::is_tibble(result))
  })

  it("throws error for non-existent object names", {
    expect_error(
      env1$f$fObject.DfObjectSize_IEC("nonexistent_object_xyz"),
      "Objects not found"
    )
  })

  it("handles large objects", {
    large_obj <- matrix(1:1e6, nrow = 1000)
    result <- env1$f$fObject.DfObjectSize_IEC(large_obj)
    expect_true(result$Size_B > 0)
    expect_true(result$Size_KiB > 0)
  })

  it("handles empty objects", {
    empty_vec <- numeric(0)
    result <- env1$f$fObject.DfObjectSize_IEC(empty_vec)
    expect_true(result$Size_B >= 0)
  })

})

describe("fEnv.asList.allNames (production)", {

  it("converts environment to list", {
    test_env <- new.env()
    test_env$a <- 1
    test_env$b <- "two"
    result <- env1$f$fEnv.asList.allNames(test_env)
    expect_true(is.list(result))
    expect_equal(sort(names(result)), c("a", "b"))
    expect_equal(result$a, 1)
    expect_equal(result$b, "two")
  })

  it("includes hidden names when all.names=TRUE", {
    test_env <- new.env()
    test_env$.hidden <- "secret"
    test_env$visible <- "public"
    result <- env1$f$fEnv.asList.allNames(test_env, all.names = TRUE)
    expect_true(".hidden" %in% names(result))
  })

  it("excludes hidden names when all.names=FALSE", {
    test_env <- new.env()
    test_env$.hidden <- "secret"
    test_env$visible <- "public"
    result <- env1$f$fEnv.asList.allNames(test_env, all.names = FALSE)
    expect_false(".hidden" %in% names(result))
    expect_true("visible" %in% names(result))
  })

  it("returns sorted list when sorted=TRUE", {
    test_env <- new.env()
    test_env$z <- 3
    test_env$a <- 1
    test_env$m <- 2
    result <- env1$f$fEnv.asList.allNames(test_env, sorted = TRUE)
    expect_equal(names(result), c("a", "m", "z"))
  })

  it("handles empty environment", {
    empty_env <- new.env()
    result <- env1$f$fEnv.asList.allNames(empty_env)
    expect_equal(length(result), 0)
    expect_true(is.list(result))
  })

})
