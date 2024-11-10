
function.mutate_all.apply_ExpressionText <- function(input_df, ExpressionText, use.StandardName = TRUE, VERBOSE = TRUE) {
    if(length(ExpressionText) == 1) {
        ExpressionText = rep(ExpressionText, ncol(input_df))
    }
    function.parse.eval.Vectorize = Vectorize(function(.CodeText) {eval(parse(text=.CodeText))})
    vector.apply_ExpressionText <- function(input_vector, ExpressionText, VERBOSE = VERBOSE) {
        out_vector = function.parse.eval.Vectorize(paste(input_vector, ExpressionText))
        out_vector
    }
    output_df = input_df %>% mutate_all(vector.apply_ExpressionText, ExpressionText)
    
    
    function.ExpressionText2StandardName <- function(vector_ExpressionText) {
        vector_ExpressionText = vector_ExpressionText %>% trimws
        vector_ExpressionText %>% 
            str_replace_all("==", "eq") %>% 
            str_replace_all("<=", "le") %>% 
            str_replace_all("<", "lt") %>% 
            str_replace_all(">=", "ge") %>% 
            str_replace_all(">", "gt") %>% 
            str_replace_all("=", "eq") %>% 
            str_replace_all("[[:punct:]&&[^\\._]]", "") %>%  # Remove all punctuation except dot
            str_replace_all("\\d+\\.\\d+", function(x) gsub("\\.", "_", x)) %>%  # Replace dot in decimal numbers to underbar("_")
            str_replace_all(" ", "") |> 
            as.vector()
    }
    
    if(use.StandardName) {
        names(output_df) = str_c(names(input_df), "_", function.ExpressionText2StandardName(ExpressionText))
    } else if(!use.StandardName) {
        names(output_df) = str_c(names(input_df), ExpressionText)
    }
    
    output_df = bind_cols(input_df, output_df)
    output_df
}


# Example data
data <- tibble(
    A01_DM_C = c(1.1, 1, 2, 2, 1),
    A02_DM_C = c(1, 2, 1, 2, 2),
    A03_DM_C = c(2, 2, 2, 1, 1)
)

data %>% function.mutate_all.apply_ExpressionText(" == 1.1") %>%
    left_join(data %>% function.mutate_all.apply_ExpressionText(">1")) %>% 
    str
# Joining with `by = join_by(A01_DM_C, A02_DM_C, A03_DM_C)`tibble [5 × 9] (S3: tbl_df/tbl/data.frame)
#  $ A01_DM_C      : num [1:5] 1.1 1 2 2 1
#  $ A02_DM_C      : num [1:5] 1 2 1 2 2
#  $ A03_DM_C      : num [1:5] 2 2 2 1 1
#  $ A01_DM_C_eq1_1: Named logi [1:5] TRUE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "1.1  == 1.1" "1  == 1.1" "2  == 1.1" "2  == 1.1" ...
#  $ A02_DM_C_eq1_1: Named logi [1:5] FALSE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "1  == 1.1" "2  == 1.1" "1  == 1.1" "2  == 1.1" ...
#  $ A03_DM_C_eq1_1: Named logi [1:5] FALSE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "2  == 1.1" "2  == 1.1" "2  == 1.1" "1  == 1.1" ...
#  $ A01_DM_C_gt1  : Named logi [1:5] TRUE FALSE TRUE TRUE FALSE
#   ..- attr(*, "names")= chr [1:5] "1.1 >1" "1 >1" "2 >1" "2 >1" ...
#  $ A02_DM_C_gt1  : Named logi [1:5] FALSE TRUE FALSE TRUE TRUE
#   ..- attr(*, "names")= chr [1:5] "1 >1" "2 >1" "1 >1" "2 >1" ...
#  $ A03_DM_C_gt1  : Named logi [1:5] TRUE TRUE TRUE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "2 >1" "2 >1" "2 >1" "1 >1" ...






#-----------  
function.apply_ExpressionText <- function(input_vector, ExpressionText, VERBOSE = TRUE) {
    function.parse.eval.Vectorize = Vectorize(function(.CodeText) {eval(parse(text=.CodeText))}) 
    out_vector = function.parse.eval.Vectorize(paste(input_vector, ExpressionText))
    out_vector
}

# Example data
data <- tibble(
  A01_DM_C = c(1.1, 1, 2, 2, 1),
  A02_DM_C = c(1, 2, 1, 2, 2),
  A03_DM_C = c(2, 2, 2, 1, 1)
)

ExpressionText = " == 1.1"
function.apply_ExpressionText(data$A01_DM_C, ExpressionText)

ExpressionText = " == 1.1"
data %>% map(~paste(.x, ExpressionText)) |> str()

data %>% map(~function.apply_ExpressionText(.x, ExpressionText)) |> str()
data %>% map_df(~function.apply_ExpressionText(.x, ExpressionText)) |> str()
data %>% map_df(~tibble(function.apply_ExpressionText(.x, ExpressionText))) |> str()
data %>% map_df(~unname(function.apply_ExpressionText(.x, ExpressionText))) |> str()
data %>% mutate_all(function.apply_ExpressionText, ExpressionText) |> str()
# 1.1  == 1.1   1  == 1.1   2  == 1.1   2  == 1.1   1  == 1.1 
#        TRUE       FALSE       FALSE       FALSE       FALSE 
# List of 3
#  $ A01_DM_C: chr [1:5] "1.1  == 1.1" "1  == 1.1" "2  == 1.1" "2  == 1.1" ...
#  $ A02_DM_C: chr [1:5] "1  == 1.1" "2  == 1.1" "1  == 1.1" "2  == 1.1" ...
#  $ A03_DM_C: chr [1:5] "2  == 1.1" "2  == 1.1" "2  == 1.1" "1  == 1.1" ...
# List of 3
#  $ A01_DM_C: Named logi [1:5] TRUE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "1.1  == 1.1" "1  == 1.1" "2  == 1.1" "2  == 1.1" ...
#  $ A02_DM_C: Named logi [1:5] FALSE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "1  == 1.1" "2  == 1.1" "1  == 1.1" "2  == 1.1" ...
#  $ A03_DM_C: Named logi [1:5] FALSE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "2  == 1.1" "2  == 1.1" "2  == 1.1" "1  == 1.1" ...
# New names:New names:New names:tibble [3 × 11] (S3: tbl_df/tbl/data.frame)
#  $ 1.1  == 1.1  : logi [1:3] TRUE NA NA
#  $ 1  == 1.1...2: logi [1:3] FALSE NA NA
#  $ 2  == 1.1...3: logi [1:3] FALSE NA FALSE
#  $ 2  == 1.1...4: logi [1:3] FALSE FALSE NA
#  $ 1  == 1.1...5: logi [1:3] FALSE NA FALSE
#  $ 1  == 1.1...1: logi [1:3] NA FALSE NA
#  $ 2  == 1.1...2: logi [1:3] NA FALSE FALSE
#  $ 1  == 1.1...3: logi [1:3] NA FALSE NA
#  $ 2  == 1.1...5: logi [1:3] NA FALSE NA
#  $ 2  == 1.1...1: logi [1:3] NA NA FALSE
#  $ 1  == 1.1...4: logi [1:3] NA NA FALSE
# tibble [15 × 1] (S3: tbl_df/tbl/data.frame)
#  $ function.apply_ExpressionText(.x, ExpressionText): Named logi [1:15] TRUE FALSE FALSE FALSE FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:15] "1.1  == 1.1" "1  == 1.1" "2  == 1.1" "2  == 1.1" ...
# tibble [5 × 3] (S3: tbl_df/tbl/data.frame)
#  $ A01_DM_C: logi [1:5] TRUE FALSE FALSE FALSE FALSE
#  $ A02_DM_C: logi [1:5] FALSE FALSE FALSE FALSE FALSE
#  $ A03_DM_C: logi [1:5] FALSE FALSE FALSE FALSE FALSE
# tibble [5 × 3] (S3: tbl_df/tbl/data.frame)
#  $ A01_DM_C: Named logi [1:5] TRUE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "1.1  == 1.1" "1  == 1.1" "2  == 1.1" "2  == 1.1" ...
#  $ A02_DM_C: Named logi [1:5] FALSE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "1  == 1.1" "2  == 1.1" "1  == 1.1" "2  == 1.1" ...
#  $ A03_DM_C: Named logi [1:5] FALSE FALSE FALSE FALSE FALSE
#   ..- attr(*, "names")= chr [1:5] "2  == 1.1" "2  == 1.1" "2  == 1.1" "1  == 1.1" ...
