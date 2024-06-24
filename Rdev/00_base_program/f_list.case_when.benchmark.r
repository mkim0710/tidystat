# f_list.case_when.benchmark.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.case_when.benchmark.r
# https://chatgpt.com/c/ae0a4d8f-a392-495b-b891-7d4449b1e2a4
# https://github.com/mkim0710/tidystat/blob/master/function.update.Rprofile.dev.r
# https://chatgpt.com/c/35fed29c-32c7-4de2-8405-51c030fa0b6d


library(microbenchmark)
library(dplyr)
library(purrr)

# Define functions for each approach
switch_approach <- function() {
  .Rprofile.path <- switch(
    TRUE,
    file.exists(".Rprofile") ~ normalizePath(".Rprofile", winslash = "/", mustWork = FALSE),
    file.exists(file.path("~", ".Rprofile")) ~ normalizePath(file.path("~", ".Rprofile"), winslash = "/", mustWork = FALSE),
    NA_character_
  )
}

case_when_approach <- function() {
  .Rprofile.path <- case_when(
    file.exists(".Rprofile") ~ normalizePath(".Rprofile", winslash = "/", mustWork = FALSE),
    file.exists(file.path("~", ".Rprofile")) ~ normalizePath(file.path("~", ".Rprofile"), winslash = "/", mustWork = FALSE),
    TRUE ~ NA_character_
  )
}

keep_map_chr_first_approach <- function() {
  .Rprofile.path <- list(
    ".Rprofile",
    file.path("~", ".Rprofile")
  ) %>%
    keep(file.exists) %>%
    map_chr(normalizePath, winslash = "/", mustWork = FALSE) %>%
    first(default = NA_character_)
}

# Run benchmark
benchmark_results <- microbenchmark(
  switch = switch_approach(),
  case_when = case_when_approach(),
  keep_map_chr_first = keep_map_chr_first_approach(),
  times = 1000
)

print(benchmark_results)
# > print(benchmark_results)
# Unit: nanoseconds
#                expr   min       lq       mean   median       uq     max neval
#              switch   273    382.0   1507.877    563.5    740.0  895672  1000
#           case_when 91734 105045.5 128654.178 113978.5 127795.0 3404231  1000
#  keep_map_chr_first 44844  52557.5  69698.162  60868.5  70547.5 2817187  1000


