
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
library(lubridate)

# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/19_numeric_integer/function.df_continuous_vars.normalize.dev.r
function.df_continuous_vars.normalize <- function(input_df) {
  input_df %>%
    mutate(across(where(~ is.numeric(.) && length(unique(.)) > 2),
                  ~ scale(.) %>% as.vector))
}

example_df <- tibble(
  id = as.integer(1:10),
  age = as.integer(c(30, 25, 22, 35, 28, 27, 29, 30, 31, 33)),
  height = c(175, 168, 170, 180, 172, 165, 177, 169, 173, 182),
  gender = c("M", "F", "M", "F", "M", "M", "F", "F", "M", "F"),
  logical = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE), # Logical column
  factor_level2 = factor(c("A", "B", "A", "B", "A", "B", "A", "B", "A", "B")), # Factor with 2 levels
  factor_strings = factor(c("Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape", "Honeydew", "Icaco", "Jackfruit")), # Factor with strings
  binary_numeric = c(1, 2, 1, 2, 1, 2, 1, 2, 1, 2), # Numeric column with values 1 & 2
  date = seq(ymd('2020-01-01'), by = "month", length.out = 10) # Date column
)
normalized_df <- function.df_continuous_vars.normalize(example_df)
# example_df |> as_tibble()
example_df |> summary()
# normalized_df |> as_tibble()
normalized_df |> summary()
# > example_df |> as_tibble()
# # A tibble: 10 × 9
#       id   age height gender logical factor_level2 factor_strings binary_numeric date      
#    <int> <int>  <dbl> <chr>  <lgl>   <fct>         <fct>                   <dbl> <date>    
#  1     1    30    175 M      TRUE    A             Apple                       1 2020-01-01
#  2     2    25    168 F      FALSE   B             Banana                      2 2020-02-01
#  3     3    22    170 M      TRUE    A             Cherry                      1 2020-03-01
#  4     4    35    180 F      FALSE   B             Date                        2 2020-04-01
#  5     5    28    172 M      TRUE    A             Elderberry                  1 2020-05-01
#  6     6    27    165 M      FALSE   B             Fig                         2 2020-06-01
#  7     7    29    177 F      TRUE    A             Grape                       1 2020-07-01
#  8     8    30    169 F      FALSE   B             Honeydew                    2 2020-08-01
#  9     9    31    173 M      TRUE    A             Icaco                       1 2020-09-01
# 10    10    33    182 F      FALSE   B             Jackfruit                   2 2020-10-01
# > example_df |> summary()
#        id             age            height         gender           logical        factor_level2    factor_strings binary_numeric      date           
#  Min.   : 1.00   Min.   :22.00   Min.   :165.0   Length:10          Mode :logical   A:5           Apple     :1      Min.   :1.0    Min.   :2020-01-01  
#  1st Qu.: 3.25   1st Qu.:27.25   1st Qu.:169.2   Class :character   FALSE:5         B:5           Banana    :1      1st Qu.:1.0    1st Qu.:2020-03-08  
#  Median : 5.50   Median :29.50   Median :172.5   Mode  :character   TRUE :5                       Cherry    :1      Median :1.5    Median :2020-05-16  
#  Mean   : 5.50   Mean   :29.00   Mean   :173.1                                                    Date      :1      Mean   :1.5    Mean   :2020-05-16  
#  3rd Qu.: 7.75   3rd Qu.:30.75   3rd Qu.:176.5                                                    Elderberry:1      3rd Qu.:2.0    3rd Qu.:2020-07-24  
#  Max.   :10.00   Max.   :35.00   Max.   :182.0                                                    Fig       :1      Max.   :2.0    Max.   :2020-10-01  
#                                                                                                   (Other)   :4                                         
# > normalized_df |> as_tibble()
# # A tibble: 10 × 9
#        id    age  height gender logical factor_level2 factor_strings binary_numeric date      
#     <dbl>  <dbl>   <dbl> <chr>  <lgl>   <fct>         <fct>                   <dbl> <date>    
#  1 -1.49   0.265  0.350  M      TRUE    A             Apple                       1 2020-01-01
#  2 -1.16  -1.06  -0.940  F      FALSE   B             Banana                      2 2020-02-01
#  3 -0.826 -1.86  -0.571  M      TRUE    A             Cherry                      1 2020-03-01
#  4 -0.495  1.59   1.27   F      FALSE   B             Date                        2 2020-04-01
#  5 -0.165 -0.265 -0.203  M      TRUE    A             Elderberry                  1 2020-05-01
#  6  0.165 -0.530 -1.49   M      FALSE   B             Fig                         2 2020-06-01
#  7  0.495  0      0.719  F      TRUE    A             Grape                       1 2020-07-01
#  8  0.826  0.265 -0.756  F      FALSE   B             Honeydew                    2 2020-08-01
#  9  1.16   0.530 -0.0184 M      TRUE    A             Icaco                       1 2020-09-01
# 10  1.49   1.06   1.64   F      FALSE   B             Jackfruit                   2 2020-10-01
# > normalized_df |> summary()
#        id               age              height           gender           logical        factor_level2    factor_strings binary_numeric      date           
#  Min.   :-1.4863   Min.   :-1.8562   Min.   :-1.4930   Length:10          Mode :logical   A:5           Apple     :1      Min.   :1.0    Min.   :2020-01-01  
#  1st Qu.:-0.7432   1st Qu.:-0.4640   1st Qu.:-0.7096   Class :character   FALSE:5         B:5           Banana    :1      1st Qu.:1.0    1st Qu.:2020-03-08  
#  Median : 0.0000   Median : 0.1326   Median :-0.1106   Mode  :character   TRUE :5                       Cherry    :1      Median :1.5    Median :2020-05-16  
#  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000                                                    Date      :1      Mean   :1.5    Mean   :2020-05-16  
#  3rd Qu.: 0.7432   3rd Qu.: 0.4640   3rd Qu.: 0.6267                                                    Elderberry:1      3rd Qu.:2.0    3rd Qu.:2020-07-24  
#  Max.   : 1.4863   Max.   : 1.5910   Max.   : 1.6405                                                    Fig       :1      Max.   :2.0    Max.   :2020-10-01  
#                                                                                                         (Other)   :4  
