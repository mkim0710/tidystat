
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/18_dichotomous_logical/function.ExpressionText2StandardName.source.r
# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.convert_to_standard_name.source.r
function.convert_to_standard_name <- function(names_vector, prefix_before_number = "a") {
    out.vector = names_vector %>% trimws %>%
        str_replace_all("==", "_eq") %>%
        str_replace_all("<=", "_le") %>%
        str_replace_all("<", "_lt") %>%
        str_replace_all(">=", "_ge") %>%
        str_replace_all(">", "_gt") %>%
        str_replace_all("=", "_eq") %>%
        str_replace_all("[[:punct:]&&[^\\.]]", "") %>%  # Remove all punctuation except dot
        str_replace_all("\\d+\\.\\d+", function(x) gsub("\\.", "_", x)) %>%  # Replace dot in decimal numbers to underbar("_")
        str_replace_all(" ", "") %>%
        as.vector
    if (!is.null(prefix_before_number)) {out.vector = out.vector %>% {if_else(grepl("^[0-9]", .), paste0("a",.), .)} }
    return(out.vector)
}

# Example usage
original_names <- c("0", "0.5", "1", "alpha", "beta1")
standard_names <- function.convert_to_standard_name(original_names)
standard_names %>% dput
# > standard_names %>% dput
# c("a0", "a0_5", "a1", "alpha", "beta1")



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
