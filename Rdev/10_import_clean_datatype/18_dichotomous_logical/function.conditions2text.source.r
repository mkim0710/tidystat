# https://github.com/mkim0710/tidystat/tree/master/Rdev/10_import_clean_datatype/18_dichotomous_logical

function.conditions2text <- function(vector_conditions) {
    vector_conditions = vector_conditions %>% trimws
    vector_conditions %>% 
        str_replace_all("==", "eq") %>% 
        str_replace_all("<=", "le") %>% 
        str_replace_all("<", "lt") %>% 
        str_replace_all(">=", "ge") %>% 
        str_replace_all(">", "gt") %>% 
        str_replace_all("[[:punct:]&&[^\\.]]", "") %>%  # Remove all punctuation except dot
        str_replace_all("\\d+\\.\\d+", function(x) gsub("\\.", "_", x)) %>%  # Replace dot in decimal numbers to underbar("_")
        str_replace_all(" ", "") %>% 
        as.vector
}

tibble(conditions = c('== 2', '== 1.1', " <= 2", "<2")) %>% mutate(conditions_suffix = function.conditions2text(conditions))
# # A tibble: 4 × 2
#   conditions conditions_suffix
#   <chr>      <chr>            
# 1 "== 2"     eq2              
# 2 "== 1.1"   eq1_1            
# 3 " <= 2"    le2              
# 4 "<2"       lt2   
