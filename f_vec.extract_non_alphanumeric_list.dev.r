# f_vec.extract_non_alphanumeric_list.dev.r



f_vec.extract_non_alphanumeric_list <- function(input_vec) {
  f_str.extract_non_alphanumeric_vec <- function(string) {
    positions <- gregexpr("[^[:alnum:]]", string)  # Match any non-alphanumeric character
    non_alnum_chars <- regmatches(string, positions)
    unlist(non_alnum_chars)  # Unlist to get a vector of non-alphanumeric characters
  }
  
  # Use map to apply f_str.extract_non_alphanumeric_vec to each element and maintain list structure
  result_list <- map(input_vec, f_str.extract_non_alphanumeric_vec)
  
  # Set the names of the list elements to match the input vector
  names(result_list) <- input_vec
  
  result_list
}

# Example usage of the function
input_vec <- c("Hello, World!", "R4 & Python?", "123% Ready!", "12345")
result <- f_vec.extract_non_alphanumeric_list(input_vec)
result |> dput()
list(`Hello, World!` = c(",", " ", "!"), `R4 & Python?` = c(" ", "&", " ", "?"), `123% Ready!` = c("%", " ", "!"), `12345` = character(0))




# @ end -----  
