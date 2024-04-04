# f_extract_non_alphanumeric_chars.source.r


library(tidyverse)

f_extract_non_alphanumeric_chars <- function(input_vec) {
  extract_non_alnum <- function(string) {
    positions <- gregexpr("[^[:alnum:]]", string)  # Match any non-alphanumeric character
    non_alnum_chars <- regmatches(string, positions)
    unlist(non_alnum_chars)  # Unlist to get a vector of non-alphanumeric characters
  }
  
  # Use map to apply extract_non_alnum to each element and maintain list structure
  result_list <- map(input_vec, extract_non_alnum)
  
  # Set the names of the list elements to match the input vector
  names(result_list) <- input_vec
  
  result_list
}

# Example usage of the function
input_vec <- c("Hello, World!", "R4 & Python?", "123% Ready!", "12345")
result <- f_extract_non_alphanumeric_chars(input_vec)
result %>% dput
list(`Hello, World!` = c(",", " ", "!"), `R4 & Python?` = c(" ", "&", " ", "?"), `123% Ready!` = c("%", " ", "!"), `12345` = character(0))


#@ end ----
