








#-----------
function.apply_ExpressionText <- function(input_vector, ExpressionText, print.intermediate = TRUE) {
    function.eval.parse.Vectorize = Vectorize(function(text4parse) {eval(parse(text = text4parse))}) 
    out_vector = function.eval.parse.Vectorize(paste(input_vector, ExpressionText))
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
data %>% map(~paste(.x, ExpressionText)) %>% str

data %>% map(~function.apply_ExpressionText(.x, ExpressionText)) %>% str
data %>% map_df(~function.apply_ExpressionText(.x, ExpressionText)) %>% str
data %>% map_df(~tibble(function.apply_ExpressionText(.x, ExpressionText))) %>% str
data %>% map_df(~unname(function.apply_ExpressionText(.x, ExpressionText))) %>% str
data %>% mutate_all(function.apply_ExpressionText, ExpressionText) %>% str
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
