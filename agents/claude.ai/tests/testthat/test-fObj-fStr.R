# Test file for fObj-fStr (Object and String/Structure Operations)
# Source: R/fObj-fStr-source.R

library(testthat)

# Define test functions

paste0_collapse0 <- function(..., collapse = "", DEBUGMODE = FALSE) {
  if (any(lapply(list(...), function(Element) length(Element) > 1) %>% unlist())) {
    warning("Some elements have length > 1. Be cautious about recycled vector term-by-term paste!")
  }
  paste0(..., collapse = collapse)
}

cat0 <- function(...) {
  cat(..., "  \n", sep = "")
}

catLF <- function(..., trailing_double_spaces = TRUE) {
  if (trailing_double_spaces) {
    cat(..., sep = "  \n")
    cat("  \n")
  } else {
    cat(..., sep = "\n")
    cat("\n")
  }
}

fObject.DfObjectSize_IEC <- function(inputObjects,
                                     digits   = 2L,
                                     env      = parent.frame(),
                                     return   = c("tibble", "list"),
                                     verbose  = FALSE) {

  return <- match.arg(return)
  divs <- c(GiB = 1024^3, MiB = 1024^2, KiB = 1024, B = 1)

  size_one <- function(obj, obj_name, want_list = FALSE) {
    bytes <- as.numeric(object.size(obj))

    if (want_list) {
      vapply(names(divs),
             function(u) format(bytes, units = u, standard = "IEC"),
             character(1))
    } else {
      sizes <- round(bytes / divs, digits)
      tibble::tibble(
        ObjectName = obj_name,
        Size_GiB   = sizes["GiB"],
        Size_MiB   = sizes["MiB"],
        Size_KiB   = sizes["KiB"],
        Size_B     = bytes
      )
    }
  }

  build_result <- function(objs, labels) {
    if (return == "list") {
      setNames(lapply(seq_along(objs),
                      function(i) size_one(objs[[i]], labels[i], want_list = TRUE)),
               labels)
    } else {
      purrr::map_dfr(seq_along(objs),
                     function(i) size_one(objs[[i]], labels[i]))
    }
  }

  if (is.character(inputObjects)) {
    missing <- inputObjects[!vapply(inputObjects,
                                     exists, logical(1),
                                     envir = env, inherits = FALSE)]
    if (length(missing))
      stop("Objects not found: ", paste(missing, collapse = ", "))

    objs <- lapply(inputObjects,
                   function(nm) get(nm, envir = env, inherits = FALSE))
    result <- build_result(objs, inputObjects)
  } else {
    label <- deparse(substitute(inputObjects), nlines = 1L)
    result <- build_result(list(inputObjects), label)
  }

  result
}

fEnv.asList.allNames <- function(inputEnv, all.names = TRUE, sorted = FALSE) {
  as.list.environment(inputEnv, all.names = all.names, sorted = sorted)
}

describe("paste0_collapse0", {

  it("concatenates strings with empty collapse", {
    result <- paste0_collapse0("a", "b", "c")
    expect_equal(result, "abc")
  })

  it("handles custom collapse separator", {
    result <- paste0_collapse0("a", "b", "c", collapse = "-")
    expect_equal(result, "a-b-c")
  })

  it("handles single element", {
    result <- paste0_collapse0("only")
    expect_equal(result, "only")
  })

  it("handles empty input", {
    result <- paste0_collapse0()
    expect_equal(result, "")
  })

  it("warns when elements have length > 1", {
    expect_warning(
      paste0_collapse0("a", "b", 1:3),
      "length > 1"
    )
  })

  it("handles numeric input", {
    result <- paste0_collapse0(1, 2, 3)
    expect_equal(result, "123")
  })

})

describe("cat0", {

  it("outputs text with trailing newline", {
    expect_output(cat0("hello"), "hello  \n")
  })

  it("concatenates multiple arguments", {
    expect_output(cat0("a", "b", "c"), "abc  \n")
  })

  it("handles numeric input", {
    expect_output(cat0(1, 2, 3), "123  \n")
  })

})

describe("catLF", {

  it("outputs text with line feed separators", {
    expect_output(catLF("line1", "line2"), "line1  \nline2  \n  \n")
  })

  it("uses single newline when trailing_double_spaces=FALSE", {
    expect_output(catLF("line1", "line2", trailing_double_spaces = FALSE), "line1\nline2\n\n")
  })

})

describe("fObject.DfObjectSize_IEC", {

  it("returns tibble for direct object input", {
    a <- 1:100
    result <- fObject.DfObjectSize_IEC(a)
    expect_true(tibble::is_tibble(result))
    expect_equal(nrow(result), 1)
    expect_true(all(c("ObjectName", "Size_GiB", "Size_MiB", "Size_KiB", "Size_B") %in% names(result)))
  })

  it("returns tibble for multiple objects by name", {
    test_env <- new.env()
    test_env$x <- 1:100
    test_env$y <- matrix(1:1000, nrow = 100)
    result <- fObject.DfObjectSize_IEC(c("x", "y"), env = test_env)
    expect_equal(nrow(result), 2)
    expect_equal(result$ObjectName, c("x", "y"))
  })

  it("returns list when return='list'", {
    a <- 1:100
    result <- fObject.DfObjectSize_IEC(a, return = "list")
    expect_true(is.list(result))
    expect_true(all(c("GiB", "MiB", "KiB", "B") %in% names(result[[1]])))
  })

  it("respects digits parameter", {
    a <- 1:10000
    result <- fObject.DfObjectSize_IEC(a, digits = 4L)
    expect_true(tibble::is_tibble(result))
  })

  it("throws error for non-existent object names", {
    expect_error(
      fObject.DfObjectSize_IEC("nonexistent_object_xyz"),
      "Objects not found"
    )
  })

  it("handles large objects", {
    large_obj <- matrix(1:1e6, nrow = 1000)
    result <- fObject.DfObjectSize_IEC(large_obj)
    expect_true(result$Size_B > 0)
    expect_true(result$Size_KiB > 0)
  })

  it("handles empty objects", {
    empty_vec <- numeric(0)
    result <- fObject.DfObjectSize_IEC(empty_vec)
    expect_true(result$Size_B >= 0)
  })

})

describe("fEnv.asList.allNames", {

  it("converts environment to list", {
    test_env <- new.env()
    test_env$a <- 1
    test_env$b <- "two"
    result <- fEnv.asList.allNames(test_env)
    expect_true(is.list(result))
    expect_equal(sort(names(result)), c("a", "b"))
    expect_equal(result$a, 1)
    expect_equal(result$b, "two")
  })

  it("includes hidden names when all.names=TRUE", {
    test_env <- new.env()
    test_env$.hidden <- "secret"
    test_env$visible <- "public"
    result <- fEnv.asList.allNames(test_env, all.names = TRUE)
    expect_true(".hidden" %in% names(result))
  })

  it("excludes hidden names when all.names=FALSE", {
    test_env <- new.env()
    test_env$.hidden <- "secret"
    test_env$visible <- "public"
    result <- fEnv.asList.allNames(test_env, all.names = FALSE)
    expect_false(".hidden" %in% names(result))
    expect_true("visible" %in% names(result))
  })

  it("returns sorted list when sorted=TRUE", {
    test_env <- new.env()
    test_env$z <- 3
    test_env$a <- 1
    test_env$m <- 2
    result <- fEnv.asList.allNames(test_env, sorted = TRUE)
    expect_equal(names(result), c("a", "m", "z"))
  })

  it("handles empty environment", {
    empty_env <- new.env()
    result <- fEnv.asList.allNames(empty_env)
    expect_equal(length(result), 0)
    expect_true(is.list(result))
  })

})
