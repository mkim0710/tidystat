# https://chatgpt.com/c/9f7c2674-9b08-4b3c-8d72-6b7f1b009d09

library(dplyr)

# Create a function to generate and combine contingency tables with margins and separators
f_var_sequence.table <- function(data, var_sequence, var_sequence.short_name = NULL) {
  # Determine the complete list of levels for all variables
  all_levels <- sort(unique(as.vector(unlist(data[var_sequence]))))
  
  tables_list <- list()
  
  # Loop over the sequence of variables to generate pairs
  for (i in 1:(length(var_sequence) - 1)) {
    var1 <- var_sequence[i]
    var2 <- var_sequence[i + 1]
    
    # Ensure all combinations are present
    data[[var1]] <- factor(data[[var1]], levels = all_levels)
    data[[var2]] <- factor(data[[var2]], levels = all_levels)
    
    tbl <- table(data[[var1]], data[[var2]])
    tbl <- addmargins(tbl)
    
    # Use short names if provided
    if (is.null(var_sequence.short_name)) {
      colnames(tbl) <- paste0(var2, "_", colnames(tbl))
    } else {
      colnames(tbl) <- paste0(var_sequence.short_name[i + 1], "_", colnames(tbl))
    }
    
    rownames(tbl) <- paste0("prev_", rownames(tbl))
    
    # Ensure there is a row for each level even if it does not exist in the data
    for (level in all_levels) {
      level_name <- paste0("prev_", level)
      if (!(level_name %in% rownames(tbl))) {
        tbl <- rbind(tbl, setNames(rep(0, ncol(tbl)), colnames(tbl)))
        rownames(tbl)[nrow(tbl)] <- level_name
      }
    }
    tbl <- tbl[order(rownames(tbl)), ]  # Ensure rows are ordered
    
    # Convert to data frame and add unique separator column
    tbl_df <- as.data.frame.matrix(tbl)
    sep_col_name <- paste0("T", i, "|")
    tbl_df[[sep_col_name]] <- "  |"
    
    tables_list[[i]] <- tbl_df
  }
  
  # Combine tables horizontally
  combined_table <- do.call(cbind, tables_list)
  
  return(as.data.frame(combined_table))
}


# set.seed(123)
# data <- data.frame(
#   A01_VISIT = rep(1, 100),  # A01_VISIT has only one value
#   A02_VISIT = sample(0:1, 100, replace = TRUE),
#   A03_VISIT = sample(0:2, 100, replace = TRUE),
#   A04_VISIT = sample(0:1, 100, replace = TRUE),
#   A05_VISIT = sample(0:1, 100, replace = TRUE)
# )
# 
# # Define variable sequence
# var_sequence <- c("A01_VISIT", "A02_VISIT", "A03_VISIT", "A04_VISIT", "A05_VISIT")
# var_sequence.short_name <- c("V1", "V2", "V3", "V4", "V5")
# 
# 
# # Generate and combine tables with short names
# combined_table <- f_var_sequence.table(data, var_sequence, var_sequence.short_name)
# 
# # Print combined table
# print(combined_table)
# # > print(combined_table)
# #          V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|
# # prev_0      0    0    0      0   |   14   21   22     57   |   10   16    0     26   |   37   22    0     59   |
# # prev_1     57   43    0    100   |   12   18   13     43   |   21   18    0     39   |   22   19    0     41   |
# # prev_2      0    0    0      0   |    0    0    0      0   |   28    7    0     35   |    0    0    0      0   |
# # prev_Sum   57   43    0    100   |   26   39   35    100   |   59   41    0    100   |   59   41    0    100   |
# 
# 
# # Convert to tibble
# print(as_tibble(combined_table))
# # > print(as_tibble(combined_table))
# # # A tibble: 4 × 20
# #    V2_0  V2_1  V2_2 V2_Sum `T1|`  V3_0  V3_1  V3_2 V3_Sum `T2|`  V4_0  V4_1  V4_2 V4_Sum `T3|`  V5_0  V5_1  V5_2 V5_Sum `T4|`
# #   <dbl> <dbl> <dbl>  <dbl> <chr> <dbl> <dbl> <dbl>  <dbl> <chr> <dbl> <dbl> <dbl>  <dbl> <chr> <dbl> <dbl> <dbl>  <dbl> <chr>
# # 1     0     0     0      0 "  |"    14    21    22     57 "  |"    10    16     0     26 "  |"    37    22     0     59 "  |"
# # 2    57    43     0    100 "  |"    12    18    13     43 "  |"    21    18     0     39 "  |"    22    19     0     41 "  |"
# # 3     0     0     0      0 "  |"     0     0     0      0 "  |"    28     7     0     35 "  |"     0     0     0      0 "  |"
# # 4    57    43     0    100 "  |"    26    39    35    100 "  |"    59    41     0    100 "  |"    59    41     0    100 "  |"


