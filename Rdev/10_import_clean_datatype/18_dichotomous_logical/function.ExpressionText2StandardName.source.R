# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/18_dichotomous_logical/function.ExpressionText2StandardName.source.r
function.ExpressionText2StandardName <- function(vector_ExpressionText) {
    vector_ExpressionText = vector_ExpressionText %>% trimws
    vector_ExpressionText %>% 
        str_replace_all("==", "eq") %>% 
        str_replace_all("<=", "le") %>% 
        str_replace_all("<", "lt") %>% 
        str_replace_all(">=", "ge") %>% 
        str_replace_all(">", "gt") %>% 
        str_replace_all("=", "eq") %>% 
        str_replace_all("[[:punct:]&&[^\\.]]", "") %>%  # Remove all punctuation except dot
        str_replace_all("\\d+\\.\\d+", function(x) gsub("\\.", "_", x)) %>%  # Replace dot in decimal numbers to underbar("_")
        str_replace_all(" ", "") %>% 
        as.vector
}

tibble(ExpressionText = c('== 2', '== 1.1', " <= 2", "<2", "=1")) %>% mutate(StandardName = function.ExpressionText2StandardName(ExpressionText))
# # A tibble: 5 × 2
#   ExpressionText StandardName
#   <chr>          <chr>       
# 1 "== 2"         eq2         
# 2 "== 1.1"       eq1_1       
# 3 " <= 2"        le2         
# 4 "<2"           lt2         
# 5 "=1"           eq1  
