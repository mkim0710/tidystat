# https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/function.matrix.split.dev.r
function.matrix.split <- function(input_matrix, prop_train = 0.5, prop_validation = 0.2, set_seed = 123) {
  if (prop_train + prop_validation > 1) {
    stop("The sum of prop_train and prop_validation should not exceed 1.")
  }

  set.seed(set_seed)  # For reproducibility

  nrow_total <- nrow(input_matrix)
  nrow_train <- round(prop_train * nrow_total)
  nrow_validation <- round(prop_validation * nrow_total)

  # Shuffle indices
  shuffled_indices <- sample(nrow_total)

  # Create indices for each set
  shuffled_indices.train <- shuffled_indices[1:nrow_train]
  shuffled_indices.validation <- shuffled_indices[(nrow_train + 1):(nrow_train + nrow_validation)]
  shuffled_indices.test <- shuffled_indices[(nrow_train + nrow_validation + 1):nrow_total]

  # Subset input_matrix to create the sets, preserving row names
  output_matrix_train <- input_matrix[shuffled_indices.train, , drop = FALSE]
  output_matrix_validation <- input_matrix[shuffled_indices.validation, , drop = FALSE]
  output_matrix_test <- input_matrix[shuffled_indices.test, , drop = FALSE]

  # Assign original row names to subsets
  row.names(output_matrix_train) <- row.names(input_matrix)[shuffled_indices.train]
  row.names(output_matrix_validation) <- row.names(input_matrix)[shuffled_indices.validation]
  row.names(output_matrix_test) <- row.names(input_matrix)[shuffled_indices.test]

  # Return a list of the three datasets
  return(list(train_set = output_matrix_train, validation_set = output_matrix_validation, test_set = output_matrix_test))
}

# list_matrix.split <- function.matrix.split(your_input_matrix, prop_train = 0.5, prop_validation = 0.2)
# output_matrix_train <- list_matrix.split$training
# output_matrix_validation <- list_matrix.split$validation
# output_matrix_test <- list_matrix.split$test
