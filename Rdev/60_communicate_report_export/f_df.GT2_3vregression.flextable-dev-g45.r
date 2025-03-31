# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67e283be-2190-800e-ada3-5e69a1ea6e76?model=o1-pro
library(gtsummary)

# Example data set: 'trial' from gtsummary
# Assume "age" and "sex" are in the data; if 'trial' does not have "sex",
# you could replace that with "stage" or another variable.

adjusted_table <- trial |>
  tbl_uvregression(
    method       = glm,
    y            = response,                # The outcome
    include      = c(marker, grade),        # Covariates to iterate over
    formula      = "{y} ~ {x} + age",       # Adjust each model for age 
    method.args  = list(family = binomial), # Logistic regression
    exponentiate = TRUE                     # Report odds ratios
  )

adjusted_table


#' Create "Univariable" Table with Adjustment for Age/Sex
#'
#' @param input_df Data frame with outcome, candidate predictors, plus age/sex
#' @param outcome_var String name of outcome variable
#' @param adjust_vars Character vector of variables to adjust for (e.g., c("age", "sex"))
#' @param candidates Character vector of predictors to iterate over
#' @param family_fn Model family (default binomial for logistic regression)
#' @param exp Logical; if TRUE, exponentiate coefficients (default TRUE for OR)
#'
#' @return A gtsummary table summarizing multiple regression models
create_adjusted_table <- function(input_df,
                                  outcome_var,
                                  adjust_vars = c("age"), # c("age", "sex"),
                                  candidates,
                                  family_fn = binomial,
                                  exp = TRUE) {

  # Construct formula pattern, e.g. "{y} ~ {x} + age + sex"
  formula_text <- paste0(
    "{y} ~ {x} + ",
    paste(adjust_vars, collapse = " + ")
  )

  adjusted_tbl <-
    input_df |>
    tbl_uvregression(
      method       = glm,
      y            = outcome_var,
      include      = candidates,
      formula      = formula_text,
      method.args  = list(family = family_fn),
      exponentiate = exp
    )

  return(adjusted_tbl)
}

# Example usage:
adj_tbl_example <- create_adjusted_table(
  input_df   = trial,
  outcome_var= "response",
  adjust_vars= c("age", "stage"),  # replace "sex" if not in data
  candidates = c("marker", "grade"),
  family_fn  = binomial,
  exp        = TRUE
)

adj_tbl_example
