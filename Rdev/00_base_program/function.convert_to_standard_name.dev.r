.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/18_dichotomous_logical/function.ExpressionText2StandardName.dev.r
# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.convert_to_standard_name.dev.r
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
        str_replace_all(" ", "") |>
        as.vector()
    if (!is.null(prefix_before_number)) {out.vector = out.vector %>% {if_else(grepl("^[0-9]", .), paste0("a",.), .)} }
    return(out.vector)
}

# Example usage
original_names <- c("0", "0.5", "1", "alpha", "beta1")
standard_names <- function.convert_to_standard_name(original_names)
standard_names |> dput()
# > standard_names |> dput()
# c("a0", "a0_5", "a1", "alpha", "beta1")
