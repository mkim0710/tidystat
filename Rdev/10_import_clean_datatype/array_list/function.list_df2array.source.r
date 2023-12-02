# function.list_df2array.source.r

library(dplyr)
library(purrr)


# Function to find the longest common prefix of two strings
# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.str2.longest_common_prefix.source.r
function.str2.longest_common_prefix <- function(str1, str2, print.intermediate = F) {
  chars1 <- strsplit(str1, "")[[1]]
  chars2 <- strsplit(str2, "")[[1]]
  if(print.intermediate) {print(chars1) ; print(chars2)}
  min_length <- min(length(chars1), length(chars2))
  chars1 <- chars1[1:min_length]
  chars2 <- chars2[1:min_length]
  if (identical(chars1, chars2)) {
    return(str1)
  } else {
    prefix_length <- which(map2_int(chars1, chars2, ~ ifelse(.x == .y, 1, 0)) == 0)[1] - 1
    # print(prefix_length)
      if (prefix_length == 0) {
          return(NA)
      } else {
        return(substring(str1, 1, prefix_length))
      }
  }
}

# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/function.list_df2array.source.r
function.list_df2array <- function(list_of_tibbles) {
  # Ensure the list is not empty
  if (length(list_of_tibbles) == 0) {
    stop("The list is empty")
  }

  # Check if all tibbles have the same dimensions
  n_rows <- nrow(list_of_tibbles[[1]])
  n_cols <- ncol(list_of_tibbles[[1]])

  if (!all(map_dbl(list_of_tibbles, nrow) == n_rows) || 
      !all(map_dbl(list_of_tibbles, ncol) == n_cols)) {
    stop("Not all tibbles have the same dimensions")
  }

  # Extract row names and check if they are meaningful
  row_names <- rownames(list_of_tibbles[[1]])
  if (is.null(row_names) || all(row_names == as.character(seq_along(row_names)))) {
    row_names <- NULL
  }

  # Process column names to find the longest common prefix
  all_col_names <- map(list_of_tibbles, names)
  common_col_names <- reduce(all_col_names, ~ map2_chr(.x, .y, function.str2.longest_common_prefix))

  # Convert each tibble to a matrix and stack them
  array_data <- array(dim = c(n_rows, n_cols, length(list_of_tibbles)))
  for (i in seq_along(list_of_tibbles)) {
    array_data[,,i] <- as.matrix(list_of_tibbles[[i]])
  }

  # Set dimnames
  list_names <- names(list_of_tibbles)
  dimnames(array_data) <- list(row_names, common_col_names, list_names)

  return(array_data)
}

# Example usage
df1 <- tibble(A0111 = c(1, NA, 3), A021 = c(4, NA, NA))
df2 <- tibble(A0122 = c(NA, 2, 3), A022 = c(4, 5, NA))
df3 <- tibble(A0133 = c(1, 2, NA), A023 = c(NA, 5, NA))

example_list <- list(df1 = df1, df2 = df2, df3 = df3)
tmp_array <- function.list_df2array(example_list)

# Display the output
print(tmp_array)
# > print(tmp_array)
# , , df1
# 
#      A01 A02
# [1,]   1   4
# [2,]  NA  NA
# [3,]   3  NA
# 
# , , df2
# 
#      A01 A02
# [1,]  NA   4
# [2,]   2   5
# [3,]   3  NA
# 
# , , df3
# 
#      A01 A02
# [1,]   1  NA
# [2,]   2   5
# [3,]  NA  NA







# ---------------------
# https://github.com/mkim0710/tidystat/edit/master/Rdev/10_import_clean_datatype/array_list/function.list_df2array.source.r
# Function to convert a list of tibbles to a 3D array
function.list_df2array_old <- function(list_of_tibbles) {
  # Ensure the list is not empty
  if (length(list_of_tibbles) == 0) {
    stop("The list is empty")
  }

  # Check if all tibbles have the same dimensions
  n_rows <- nrow(list_of_tibbles[[1]])
  n_cols <- ncol(list_of_tibbles[[1]])

  if (!all(map_dbl(list_of_tibbles, nrow) == n_rows) || 
      !all(map_dbl(list_of_tibbles, ncol) == n_cols)) {
    stop("Not all tibbles have the same dimensions")
  }

  # Convert each tibble to a matrix and stack them
  array_data <- array(dim = c(n_rows, n_cols, length(list_of_tibbles)))
  for (i in seq_along(list_of_tibbles)) {
    array_data[,,i] <- as.matrix(list_of_tibbles[[i]])
  }

  return(array_data)
}

# Example tibbles
df1 <- tibble(A01 = c(1, NA, 3), A02 = c(4, NA, NA))
df2 <- tibble(A01 = c(NA, 2, 3), A02 = c(4, 5, NA))
df3 <- tibble(A01 = c(1, 2, NA), A02 = c(NA, 5, NA))

# List of tibbles
example_list <- list(df1, df2, df3)

# Applying the function
tmp_array <- function.list_df2array(example_list)
tmp.array %>% str
# > tmp.array %>% str
#  num [1:3, 1:2, 1:3] 1 NA 3 4 NA NA NA 2 3 4 ...


# Expected output
print(tmp.array)
# , , 1
# 
#      [,1] [,2]
# [1,]    1    4
# [2,]   NA   NA
# [3,]    3   NA
# 
# , , 2
# 
#      [,1] [,2]
# [1,]   NA    4
# [2,]    2    5
# [3,]    3   NA
# 
# , , 3
# 
#      [,1] [,2]
# [1,]    1   NA
# [2,]    2    5
# [3,]   NA   NA
























#---------------------------------------------------------
# function.list_df2array.source.r
# data.mice complete() group_by(exposure) summarize(n(), sum(event)).r
# https://www.r-bloggers.com/tidyrcomplete-to-show-all-possible-combinations-of-variables/



data.mice %>% summary #----
data.mice %>% complete(1) %>% str #----
data.mice %>% complete(2) %>% str #----
data.mice %>% complete(3) %>% str #----
data.mice %>% complete(4) %>% str #----
data.mice %>% complete(5) %>% str #----
# > data.mice %>% summary #----
# Class: mids
# Number of multiple imputations:  5 
# Imputation methods:
#     N1GM0392_recode     N1GM0394_recode               Cigar          Cigar_ge50   CigarettePackYear                 Age            Age_ge50         Age_cut2575 
#               "pmm"               "pmm"               "pmm"               "pmm"               "pmm"                  ""                  ""                  "" 
#                Male           RaceWhite  HighSchoolLastYear        College1Year     CollegeGraduate FamilyIncome_ge7000 FamilyIncome_ge8000                 bmi 
#                  ""                  ""               "pmm"               "pmm"               "pmm"               "pmm"               "pmm"                  "" 
#       PMHx_diabetes         PMHx_highBP  nutrition_calories   nutrition_protein       nutrition_fat      nutrition_carb        Alcohol_3cat           CigarYear 
#               "pmm"               "pmm"               "pmm"               "pmm"               "pmm"               "pmm"           "polyreg"                  "" 
#        bmi4category        Cigar.cut100         Age.cut2575                 ihd             timeihd 
#                  ""           "polyreg"                  ""                  ""                  "" 
# PredictorMatrix:
#                   N1GM0392_recode N1GM0394_recode Cigar Cigar_ge50 CigarettePackYear Age Age_ge50 Age_cut2575 Male RaceWhite HighSchoolLastYear College1Year
# N1GM0392_recode                 0               1     1          1                 1   1        1           1    1         1                  1            1
# N1GM0394_recode                 1               0     1          1                 1   1        1           1    1         1                  1            1
# Cigar                           1               1     0          0                 0   1        1           1    1         1                  1            1
# Cigar_ge50                      1               1     1          0                 1   1        1           1    1         1                  1            1
# CigarettePackYear               1               1     1          1                 0   1        1           1    1         1                  1            1
# Age                             1               1     1          1                 1   0        0           0    1         1                  1            1
#                   CollegeGraduate FamilyIncome_ge7000 FamilyIncome_ge8000 bmi PMHx_diabetes PMHx_highBP nutrition_calories nutrition_protein nutrition_fat
# N1GM0392_recode                 1                   1                   1   1             1           1                  1                 1             1
# N1GM0394_recode                 1                   1                   1   1             1           1                  1                 1             1
# Cigar                           1                   1                   1   1             1           1                  1                 1             1
# Cigar_ge50                      1                   1                   1   1             1           1                  1                 1             1
# CigarettePackYear               1                   1                   1   1             1           1                  1                 1             1
# Age                             1                   1                   1   1             1           1                  1                 1             1
#                   nutrition_carb Alcohol_3cat CigarYear bmi4category Cigar.cut100 Age.cut2575 ihd timeihd
# N1GM0392_recode                1            1         0            1            1           0   1       1
# N1GM0394_recode                1            1         0            1            1           0   1       1
# Cigar                          1            1         0            1            0           0   1       1
# Cigar_ge50                     1            1         0            1            1           0   1       1
# CigarettePackYear              1            1         0            1            1           0   1       1
# Age                            1            1         0            1            1           0   1       1
# Number of logged events:  663 
#   it im             dep      meth
# 1  0  0                 collinear
# 2  0  0                 collinear
# 3  1  1 N1GM0392_recode       pmm
# 4  1  1 N1GM0394_recode       pmm
# 5  1  1 N1GM0394_recode       pmm
# 6  1  1           Cigar       pmm
#                                                                                                                                                                                                                                                                                                                       out
# 1                                                                                                                                                                                                                                                                                                             Age.cut2575
# 2                                                                                                                                                                                                                                                                                                               CigarYear
# 3                                                                                                                                                                                                                                       Cigar_ge50, Age_cut257545-, Age_cut257575-, Age_cut2575999-, Cigar.cut100[50,100)
# 4                                                                                                                                                                                                                                                        Cigar_ge50, Age_cut257545-, Age_cut257575-, Age_cut2575999-, ihd
# 5 * A ridge penalty had to be used to calculate the inverse crossproduct of the predictor matrix. Please remove duplicate variables or unique respondent names/numbers from the imputation model. It may be advisable to check the fraction of missing information (fmi) to evaluate the validity of the imputation model
# 6                                                                                                                                                                                                                                                                         Age_cut257545-, Age_cut257575-, Age_cut2575999-
# > data.mice %>% complete(1) %>% str #----
# 'data.frame':	14407 obs. of  29 variables:
#  $ N1GM0392_recode    : num  2 4 2 0.214 0.214 ...
#  $ N1GM0394_recode    : num  0 2 0 2 0 0 10 0 0 0.5 ...
#  $ Cigar              : num  25 50 25 25 25 ...
#  $ Cigar_ge50         : num  1 0 0 0 0 0 0 0 0 0 ...
#  $ CigarettePackYear  : num  92 72 0.137 0.274 21.6 ...
#  $ Age                : num  39 61 25 35 35 71 74 64 46 32 ...
#  $ Age_ge50           : num  0 1 0 0 0 1 1 1 0 0 ...
#  $ Age_cut2575        : Factor w/ 8 levels "0-","25-","35-",..: 3 5 2 3 3 6 6 5 4 2 ...
#  $ Male               : num  0 1 0 0 0 0 0 0 1 1 ...
#  $ RaceWhite          : num  1 1 0 0 1 0 0 1 0 0 ...
#  $ HighSchoolLastYear : num  1 1 1 1 1 0 0 0 0 0 ...
#  $ College1Year       : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ CollegeGraduate    : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ FamilyIncome_ge7000: num  0 1 0 1 1 0 1 1 0 0 ...
#  $ FamilyIncome_ge8000: num  0 1 0 0 1 0 1 1 0 0 ...
#  $ bmi                : num  22.9 27.1 40.5 31.1 21.5 ...
#  $ PMHx_diabetes      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ PMHx_highBP        : num  0 0 0 1 0 0 1 0 0 1 ...
#  $ nutrition_calories : num  2151 1452 678 1585 1749 ...
#  $ nutrition_protein  : num  119.1 67.9 23.5 59.8 46.8 ...
#  $ nutrition_fat      : num  117 55 27.6 69.9 70.2 ...
#  $ nutrition_carb     : num  103 161 61 178 232 ...
#  $ Alcohol_3cat       : Factor w/ 3 levels "Alcohol_le1pwk",..: 2 1 1 1 2 3 1 2 1 2 ...
#  $ CigarYear          : num  NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi4category       : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 2 3 4 4 2 4 3 3 3 2 ...
#  $ Cigar.cut100       : Factor w/ 3 levels "[0,50)","[50,100)",..: 2 1 1 1 1 1 1 1 1 1 ...
#  $ Age.cut2575        : Factor w/ 5 levels "[25,35)","[35,45)",..: 2 4 1 2 2 5 5 4 3 1 ...
#  $ ihd                : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ timeihd            : num  253 59 0 183 257 139 97 253 253 0 ...
# > data.mice %>% complete(2) %>% str #----
# 'data.frame':	14407 obs. of  29 variables:
#  $ N1GM0392_recode    : num  0.643 5 3 0.214 0.214 ...
#  $ N1GM0394_recode    : num  2 27 20 7 0 10 15 5 0.5 15 ...
#  $ Cigar              : num  25 25 25 25 50 ...
#  $ Cigar_ge50         : num  0 0 0 0 0 1 1 1 1 0 ...
#  $ CigarettePackYear  : num  0.137 0.137 0.137 0.137 0.137 ...
#  $ Age                : num  39 61 25 35 35 71 74 64 46 32 ...
#  $ Age_ge50           : num  0 1 0 0 0 1 1 1 0 0 ...
#  $ Age_cut2575        : Factor w/ 8 levels "0-","25-","35-",..: 3 5 2 3 3 6 6 5 4 2 ...
#  $ Male               : num  0 1 0 0 0 0 0 0 1 1 ...
#  $ RaceWhite          : num  1 1 0 0 1 0 0 1 0 0 ...
#  $ HighSchoolLastYear : num  1 1 1 1 1 0 0 0 0 0 ...
#  $ College1Year       : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ CollegeGraduate    : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ FamilyIncome_ge7000: num  0 1 0 1 1 0 1 1 0 0 ...
#  $ FamilyIncome_ge8000: num  0 1 0 0 1 0 1 1 0 0 ...
#  $ bmi                : num  22.9 27.1 40.5 31.1 21.5 ...
#  $ PMHx_diabetes      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ PMHx_highBP        : num  0 0 0 1 0 0 1 0 0 1 ...
#  $ nutrition_calories : num  2151 1452 678 1585 1749 ...
#  $ nutrition_protein  : num  119.1 67.9 23.5 59.8 46.8 ...
#  $ nutrition_fat      : num  117 55 27.6 69.9 70.2 ...
#  $ nutrition_carb     : num  103 161 61 178 232 ...
#  $ Alcohol_3cat       : Factor w/ 3 levels "Alcohol_le1pwk",..: 2 1 1 1 2 3 1 2 1 2 ...
#  $ CigarYear          : num  NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi4category       : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 2 3 4 4 2 4 3 3 3 2 ...
#  $ Cigar.cut100       : Factor w/ 3 levels "[0,50)","[50,100)",..: 1 1 1 1 1 2 2 2 2 1 ...
#  $ Age.cut2575        : Factor w/ 5 levels "[25,35)","[35,45)",..: 2 4 1 2 2 5 5 4 3 1 ...
#  $ ihd                : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ timeihd            : num  253 59 0 183 257 139 97 253 253 0 ...
# > data.mice %>% complete(3) %>% str #----
# 'data.frame':	14407 obs. of  29 variables:
#  $ N1GM0392_recode    : num  7 0.214 15 7 7 ...
#  $ N1GM0394_recode    : num  0 0 0 0 0 20 50 27 0 0 ...
#  $ Cigar              : num  25 25 25 25 25 ...
#  $ Cigar_ge50         : num  0 1 0 0 0 0 1 0 0 0 ...
#  $ CigarettePackYear  : num  72 0.274 0.137 46.25 46.25 ...
#  $ Age                : num  39 61 25 35 35 71 74 64 46 32 ...
#  $ Age_ge50           : num  0 1 0 0 0 1 1 1 0 0 ...
#  $ Age_cut2575        : Factor w/ 8 levels "0-","25-","35-",..: 3 5 2 3 3 6 6 5 4 2 ...
#  $ Male               : num  0 1 0 0 0 0 0 0 1 1 ...
#  $ RaceWhite          : num  1 1 0 0 1 0 0 1 0 0 ...
#  $ HighSchoolLastYear : num  1 1 1 1 1 0 0 0 0 0 ...
#  $ College1Year       : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ CollegeGraduate    : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ FamilyIncome_ge7000: num  0 1 0 1 1 0 0 1 0 0 ...
#  $ FamilyIncome_ge8000: num  0 1 0 0 1 0 0 1 0 0 ...
#  $ bmi                : num  22.9 27.1 40.5 31.1 21.5 ...
#  $ PMHx_diabetes      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ PMHx_highBP        : num  0 0 0 1 0 0 1 0 0 1 ...
#  $ nutrition_calories : num  2151 1452 678 1585 1749 ...
#  $ nutrition_protein  : num  119.1 67.9 23.5 59.8 46.8 ...
#  $ nutrition_fat      : num  117 55 27.6 69.9 70.2 ...
#  $ nutrition_carb     : num  103 161 61 178 232 ...
#  $ Alcohol_3cat       : Factor w/ 3 levels "Alcohol_le1pwk",..: 2 1 1 1 2 3 1 2 1 2 ...
#  $ CigarYear          : num  NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi4category       : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 2 3 4 4 2 4 3 3 3 2 ...
#  $ Cigar.cut100       : Factor w/ 3 levels "[0,50)","[50,100)",..: 3 2 1 1 1 1 2 1 1 1 ...
#  $ Age.cut2575        : Factor w/ 5 levels "[25,35)","[35,45)",..: 2 4 1 2 2 5 5 4 3 1 ...
#  $ ihd                : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ timeihd            : num  253 59 0 183 257 139 97 253 253 0 ...
# > data.mice %>% complete(4) %>% str #----
# 'data.frame':	14407 obs. of  29 variables:
#  $ N1GM0392_recode    : num  4 5 0.214 6 3 ...
#  $ N1GM0394_recode    : num  5 10 0 15 0.5 0 1 0 0 12 ...
#  $ Cigar              : num  50 25 25 25 25 ...
#  $ Cigar_ge50         : num  0 0 0 0 1 1 0 0 0 0 ...
#  $ CigarettePackYear  : num  0.137 22.5 0.137 0.274 0.137 ...
#  $ Age                : num  39 61 25 35 35 71 74 64 46 32 ...
#  $ Age_ge50           : num  0 1 0 0 0 1 1 1 0 0 ...
#  $ Age_cut2575        : Factor w/ 8 levels "0-","25-","35-",..: 3 5 2 3 3 6 6 5 4 2 ...
#  $ Male               : num  0 1 0 0 0 0 0 0 1 1 ...
#  $ RaceWhite          : num  1 1 0 0 1 0 0 1 0 0 ...
#  $ HighSchoolLastYear : num  1 1 1 1 1 0 0 0 0 0 ...
#  $ College1Year       : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ CollegeGraduate    : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ FamilyIncome_ge7000: num  0 1 0 1 1 0 1 1 0 0 ...
#  $ FamilyIncome_ge8000: num  0 1 0 0 1 0 0 1 0 0 ...
#  $ bmi                : num  22.9 27.1 40.5 31.1 21.5 ...
#  $ PMHx_diabetes      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ PMHx_highBP        : num  0 0 0 1 0 0 1 0 0 1 ...
#  $ nutrition_calories : num  2151 1452 678 1585 1749 ...
#  $ nutrition_protein  : num  119.1 67.9 23.5 59.8 46.8 ...
#  $ nutrition_fat      : num  117 55 27.6 69.9 70.2 ...
#  $ nutrition_carb     : num  103 161 61 178 232 ...
#  $ Alcohol_3cat       : Factor w/ 3 levels "Alcohol_le1pwk",..: 2 1 1 1 2 3 2 2 1 2 ...
#  $ CigarYear          : num  NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi4category       : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 2 3 4 4 2 4 3 3 3 2 ...
#  $ Cigar.cut100       : Factor w/ 3 levels "[0,50)","[50,100)",..: 3 1 1 1 2 2 1 1 1 1 ...
#  $ Age.cut2575        : Factor w/ 5 levels "[25,35)","[35,45)",..: 2 4 1 2 2 5 5 4 3 1 ...
#  $ ihd                : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ timeihd            : num  253 59 0 183 257 139 97 253 253 0 ...
# > data.mice %>% complete(5) %>% str #----
# 'data.frame':	14407 obs. of  29 variables:
#  $ N1GM0392_recode    : num  0.214 0.214 8 0.214 0.214 ...
#  $ N1GM0394_recode    : num  0 20 40 0 0 10 0 5 0 30 ...
#  $ Cigar              : num  25 50 25 25 25 ...
#  $ Cigar_ge50         : num  0 0 0 1 0 0 1 0 0 0 ...
#  $ CigarettePackYear  : num  0.274 0.137 0.137 0.137 0.274 ...
#  $ Age                : num  39 61 25 35 35 71 74 64 46 32 ...
#  $ Age_ge50           : num  0 1 0 0 0 1 1 1 0 0 ...
#  $ Age_cut2575        : Factor w/ 8 levels "0-","25-","35-",..: 3 5 2 3 3 6 6 5 4 2 ...
#  $ Male               : num  0 1 0 0 0 0 0 0 1 1 ...
#  $ RaceWhite          : num  1 1 0 0 1 0 0 1 0 0 ...
#  $ HighSchoolLastYear : num  1 1 1 1 1 0 0 0 0 0 ...
#  $ College1Year       : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ CollegeGraduate    : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ FamilyIncome_ge7000: num  0 1 0 1 1 0 1 1 0 0 ...
#  $ FamilyIncome_ge8000: num  0 1 0 0 1 0 1 1 0 0 ...
#  $ bmi                : num  22.9 27.1 40.5 31.1 21.5 ...
#  $ PMHx_diabetes      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ PMHx_highBP        : num  0 0 0 1 0 0 1 0 0 1 ...
#  $ nutrition_calories : num  2151 1452 678 1585 1749 ...
#  $ nutrition_protein  : num  119.1 67.9 23.5 59.8 46.8 ...
#  $ nutrition_fat      : num  117 55 27.6 69.9 70.2 ...
#  $ nutrition_carb     : num  103 161 61 178 232 ...
#  $ Alcohol_3cat       : Factor w/ 3 levels "Alcohol_le1pwk",..: 2 1 1 1 2 3 1 2 1 2 ...
#  $ CigarYear          : num  NA NA NA NA NA NA NA NA NA NA ...
#  $ bmi4category       : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 2 3 4 4 2 4 3 3 3 2 ...
#  $ Cigar.cut100       : Factor w/ 3 levels "[0,50)","[50,100)",..: 1 1 1 2 1 1 2 1 1 1 ...
#  $ Age.cut2575        : Factor w/ 5 levels "[25,35)","[35,45)",..: 2 4 1 2 2 5 5 4 3 1 ...
#  $ ihd                : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ timeihd            : num  253 59 0 183 257 139 97 253 253 0 ...







#@ -----
# 1:5 %>% {data.mice %>% complete(.) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))}

for (i in 1:5) {
    data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd)) %>% print
}
# > for (i in 1:5) {
# +     data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd)) %>% print
# + }
# # A tibble: 2 x 3
#   Cigar_ge50 `n()` `sum(ihd)`
#        <dbl> <int>      <dbl>
# 1          0 11333       1459
# 2          1  3074        450
# # A tibble: 2 x 3
#   Cigar_ge50 `n()` `sum(ihd)`
#        <dbl> <int>      <dbl>
# 1          0 10889       1285
# 2          1  3518        624
# # A tibble: 2 x 3
#   Cigar_ge50 `n()` `sum(ihd)`
#        <dbl> <int>      <dbl>
# 1          0 10778       1308
# 2          1  3629        601
# # A tibble: 2 x 3
#   Cigar_ge50 `n()` `sum(ihd)`
#        <dbl> <int>      <dbl>
# 1          0 11239       1395
# 2          1  3168        514
# # A tibble: 2 x 3
#   Cigar_ge50 `n()` `sum(ihd)`
#        <dbl> <int>      <dbl>
# 1          0 10901       1307
# 2          1  3506        602

1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% str #----
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% str #----
# List of 5
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  3 variables:
#   ..$ Cigar_ge50: num [1:2] 0 1
#   ..$ n()       : int [1:2] 11333 3074
#   ..$ sum(ihd)  : num [1:2] 1459 450
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  3 variables:
#   ..$ Cigar_ge50: num [1:2] 0 1
#   ..$ n()       : int [1:2] 10889 3518
#   ..$ sum(ihd)  : num [1:2] 1285 624
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  3 variables:
#   ..$ Cigar_ge50: num [1:2] 0 1
#   ..$ n()       : int [1:2] 10778 3629
#   ..$ sum(ihd)  : num [1:2] 1308 601
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  3 variables:
#   ..$ Cigar_ge50: num [1:2] 0 1
#   ..$ n()       : int [1:2] 11239 3168
#   ..$ sum(ihd)  : num [1:2] 1395 514
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  3 variables:
#   ..$ Cigar_ge50: num [1:2] 0 1
#   ..$ n()       : int [1:2] 10901 3506
#   ..$ sum(ihd)  : num [1:2] 1307 602


1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% str #----
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% str #----
# List of 5
#  $ : num [1:2, 1:3] 0 1 11333 3074 1459 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:3] "Cigar_ge50" "n()" "sum(ihd)"
#  $ : num [1:2, 1:3] 0 1 10889 3518 1285 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:3] "Cigar_ge50" "n()" "sum(ihd)"
#  $ : num [1:2, 1:3] 0 1 10778 3629 1308 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:3] "Cigar_ge50" "n()" "sum(ihd)"
#  $ : num [1:2, 1:3] 0 1 11239 3168 1395 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:3] "Cigar_ge50" "n()" "sum(ihd)"
#  $ : num [1:2, 1:3] 0 1 10901 3506 1307 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:3] "Cigar_ge50" "n()" "sum(ihd)"



# https://stackoverflow.com/questions/4310727/what-is-rs-multidimensional-equivalent-of-rbind-and-cbind =====
?abind::abind()

library(abind)
x = cbind(1:2,3:4)
y = cbind(5:6,7:8)
x
y
# > x
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > y
#      [,1] [,2]
# [1,]    5    7
# [2,]    6    8


library(abind)
abind(x, y, along = 3)
# > abind(x, y, along = 3)
# , , 1
# 
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# 
# , , 2
# 
#      [,1] [,2]
# [1,]    5    7
# [2,]    6    8



1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% str #----
1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3)
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% str #----
#  num [1:2, 1:3, 1:5] 0 1 11333 3074 1459 ...
#  - attr(*, "dimnames")=List of 3
#   ..$ : NULL
#   ..$ : chr [1:3] "Cigar_ge50" "n()" "sum(ihd)"
#   ..$ : NULL
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3)
# , , 1
# 
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 11333     1459
# [2,]          1  3074      450
# 
# , , 2
# 
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 10889     1285
# [2,]          1  3518      624
# 
# , , 3
# 
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 10778     1308
# [2,]          1  3629      601
# 
# , , 4
# 
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 11239     1395
# [2,]          1  3168      514
# 
# , , 5
# 
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 10901     1307
# [2,]          1  3506      602



1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 3, FUN = max) #----
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 3, FUN = max) #----
# [1] 11333 10889 10778 11239 10901


1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = min) #----
1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = max) #----
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = min) #----
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 10778     1285
# [2,]          1  3074      450
# > 1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd))) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = max) #----
#      Cigar_ge50   n() sum(ihd)
# [1,]          0 11333     1459
# [2,]          1  3629      624


?reduce
?paste
#@ data.mice.group_by_exposure.summarize_n_event ====
data.mice.group_by_exposure.summarize_n_event = list()
data.mice.group_by_exposure.summarize_n_event$min = 
    1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd)) %>% map_df(as.numeric)) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = min) #----
data.mice.group_by_exposure.summarize_n_event$max = 
    1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar_ge50) %>% summarize(n(), sum(ihd)) %>% map_df(as.numeric)) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = max) #----
data.mice.group_by_exposure.summarize_n_event$min_max =
    data.mice.group_by_exposure.summarize_n_event[c("min", "max")] %>% reduce(paste, sep = "-")
dim(data.mice.group_by_exposure.summarize_n_event$min_max) = dim(data.mice.group_by_exposure.summarize_n_event$min)
dimnames(data.mice.group_by_exposure.summarize_n_event$min_max) = dimnames(data.mice.group_by_exposure.summarize_n_event$min)
data.mice.group_by_exposure.summarize_n_event$min_max
# > data.mice.group_by_exposure.summarize_n_event$min_max
#      Cigar_ge50 n()           sum(ihd)   
# [1,] "0-0"      "10778-11333" "1285-1459"
# [2,] "1-1"      "3074-3629"   "450-624"  




data.mice.group_by_exposure.summarize_n_event = list()
data.mice.group_by_exposure.summarize_n_event$min = 
    1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar.cut100) %>% summarize(n(), sum(ihd)) %>% map_df(as.numeric)) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = min) #----
data.mice.group_by_exposure.summarize_n_event$max = 
    1:5 %>% map(function(i) data.mice %>% complete(i) %>% group_by(Cigar.cut100) %>% summarize(n(), sum(ihd)) %>% map_df(as.numeric)) %>% map(as.matrix) %>% abind(along = 3) %>% apply(MARGIN = 1:2, FUN = max) #----
data.mice.group_by_exposure.summarize_n_event$min_max =
    data.mice.group_by_exposure.summarize_n_event[c("min", "max")] %>% reduce(paste, sep = "-")
dim(data.mice.group_by_exposure.summarize_n_event$min_max) = dim(data.mice.group_by_exposure.summarize_n_event$min)
dimnames(data.mice.group_by_exposure.summarize_n_event$min_max) = dimnames(data.mice.group_by_exposure.summarize_n_event$min)
# data.mice.group_by_exposure.summarize_n_event$min_max
# > data.mice.group_by_exposure.summarize_n_event$min_max
#      Cigar.cut100 n()          sum(ihd)   
# [1,] "1-1"        "9988-11117" "1279-1450"
# [2,] "2-2"        "3125-3640"  "439-606"  
# [3,] "3-3"        "71-779"     "15-40"  




#@ end -----


