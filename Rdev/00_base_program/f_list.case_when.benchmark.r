# f_list.case_when.benchmark.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.case_when.benchmark.r
# https://chatgpt.com/c/ae0a4d8f-a392-495b-b891-7d4449b1e2a4
# https://github.com/mkim0710/tidystat/blob/master/function.update.Rprofile.dev.r
# https://chatgpt.com/c/35fed29c-32c7-4de2-8405-51c030fa0b6d


library(microbenchmark)
library(dplyr)
library(purrr)

# Define functions for each approach
# switch_approach <- function() {
#   .Rprofile.path <- switch(
#     TRUE,
#     file.exists(".Rprofile") ~ normalizePath(".Rprofile", winslash = "/", mustWork = FALSE),
#     file.exists(file.path("~", ".Rprofile")) ~ normalizePath(file.path("~", ".Rprofile"), winslash = "/", mustWork = FALSE),
#     NA_character_
#   )
# }
# # > str(switch_approach())
# # Class 'formula'  language file.exists(".Rprofile") ~ normalizePath(".Rprofile", winslash = "/", mustWork = FALSE)
# #   ..- attr(*, ".Environment")=<environment: 0x55b804e12348> 


# Define functions for each approach
if_approach <- function() {
  if (file.exists(".Rprofile")) {
    normalizePath(".Rprofile", winslash = "/", mustWork = FALSE)
  } else if (file.exists(file.path("~", ".Rprofile"))) {
    normalizePath(file.path("~", ".Rprofile"), winslash = "/", mustWork = FALSE)
  } else {
    NA_character_
  }
}

case_when_approach <- function() {
  .Rprofile.path <- case_when(
    file.exists(".Rprofile") ~ normalizePath(".Rprofile", winslash = "/", mustWork = FALSE),
    file.exists(file.path("~", ".Rprofile")) ~ normalizePath(file.path("~", ".Rprofile"), winslash = "/", mustWork = FALSE),
    TRUE ~ NA_character_
  )
  return(.Rprofile.path)
}

keep_map_chr_first_approach <- function() {
  .Rprofile.path <- list(
    ".Rprofile",
    file.path("~", ".Rprofile")
  ) %>%
    keep(file.exists) %>%
    map_chr(normalizePath, winslash = "/", mustWork = FALSE) %>%
    first(default = NA_character_)
  return(.Rprofile.path)
}

# Run benchmark
benchmark_results <- microbenchmark(
  if_approach = if_approach(),
  case_when = case_when_approach(),
  keep_map_chr_first = keep_map_chr_first_approach(),
  times = 1000
)

print(benchmark_results)
# > print(benchmark_results)
# Unit: microseconds
#                expr    min       lq       mean   median       uq      max neval
#         if_approach  1.412   1.6645   3.762657   2.0940   2.4260 1596.850  1000
#           case_when 91.788 103.4440 126.704369 110.2985 120.2560 2978.550  1000
#  keep_map_chr_first 43.639  51.1745  65.673518  58.9155  65.9645 3047.238  1000


