# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67e2839c-92a4-800e-a486-6b3664aef472


#' @title fDf_adjustForVars_tblRegression
#' @description Iterates over a set of candidate covariates, fitting a series
#'   of multivariable models each adjusted for a specific set of variables.
#'
#' @param inputDf A data frame (or tibble) containing the outcome,
#'   adjustment variables, and covariates to test.
#' @param outcomeVarName A character string specifying the name of the outcome variable.
#' @param covariatesToTestVec A character vector with the names of the variables
#'   to test one at a time in separate models.
#' @param adjustVarNamesVec A character vector with the names of adjustment variables
#'   to be included in each model (e.g., `c("age", "sex")`).
#' @param familyArg A character or `family` object (e.g. `"binomial"`, `"gaussian"`)
#'   for `glm()`. Default is `"binomial"`.
#' @param exponentiateArg Logical. If `TRUE`, the model coefficients are exponentiated.
#'   Often used for logistic (OR) or Cox (HR) interpretation. Default is `TRUE`.
#' @param verboseArg Logical. If `TRUE`, prints intermediate outputs. Default is `FALSE`.
#'
#' @return A gtsummary object containing results of multiple regression models.
#'
#' @export
#'
#' @examples
#' # Using built-in trial data from gtsummary
#' library(gtsummary)
#' library(dplyr)
#'
#' # For demonstration, let's pretend there is a "sex" variable
#' set.seed(123)
#' trial_augmentedDf = trial %>%
#'   mutate(
#'     # Example: random 'sex' variable for demonstration
#'     sex = factor(rbinom(n(), 1, 0.4), labels = c("Female", "Male"))
#'   )
#'
#' # Fit logistic models for each covariate, adjusted for 'age' and 'sex'
#' resultTbl =
#'   fDf_adjustForVars_tblRegression(
#'     inputDf            = trial_augmentedDf,
#'     outcomeVarName     = "response",
#'     covariatesToTestVec = c("marker", "grade", "stage"),
#'     adjustVarNamesVec  = c("age", "sex"),
#'     familyArg          = "binomial",
#'     exponentiateArg    = TRUE
#'   )
#'
#' # Print the final gtsummary table
#' resultTbl
#'
fDf_adjustForVars_tblRegression = function(
  inputDf,
  outcomeVarName,
  covariatesToTestVec,
  adjustVarNamesVec,
  familyArg         = "binomial",
  exponentiateArg   = TRUE,
  verboseArg        = FALSE
) {
  # -- 1. Basic validation checks --
  if (!is.data.frame(inputDf)) {
    stop("`inputDf` must be a data frame or tibble.")
  }
  if (!is.character(outcomeVarName) || length(outcomeVarName) != 1) {
    stop("`outcomeVarName` must be a single character string indicating the outcome variable.")
  }
  if (!all(covariatesToTestVec %in% names(inputDf))) {
    stop("All variables in `covariatesToTestVec` must be present in `inputDf`.")
  }
  if (!all(adjustVarNamesVec %in% names(inputDf))) {
    stop("All variables in `adjustVarNamesVec` must be present in `inputDf`.")
  }
  if (!outcomeVarName %in% names(inputDf)) {
    stop("`outcomeVarName` must be present in `inputDf`.")
  }

  # -- 2. Create a function that fits the adjusted model for each covariate --
  custom_method = function(data, y, x) {
    # Build formula: outcome ~ covariate + adjustVar1 + adjustVar2 + ...
    rhsVarsVec = c(x, adjustVarNamesVec)  # the main x plus all adjustment variables
    frm = stats::as.formula(
      paste(y, "~", paste(rhsVarsVec, collapse = " + "))
    )

    if (verboseArg) {
      message("Fitting model: ", deparse(frm))
    }

    # Fit generalized linear model
    fit = stats::glm(frm, data = data, family = familyArg)
    return(fit)
  }

  # -- 3. Use tbl_uvregression with custom_method to repeatedly fit each adjusted model --
  tblOut =
    gtsummary::tbl_uvregression(
      data    = inputDf,
      method  = custom_method,
      y       = outcomeVarName,
      include = covariatesToTestVec,
      # exponentiate if logistic or Cox:
      exponentiate = exponentiateArg
    )

  # -- 4. Return final gtsummary object --
  return(tblOut)
}

# Using built-in trial data from gtsummary
library(gtsummary)
library(dplyr)

# For demonstration, let's pretend there is a "sex" variable
set.seed(123)
trial_augmentedDf = trial %>%
  mutate(
    # Example: random 'sex' variable for demonstration
    sex = factor(rbinom(n(), 1, 0.4), labels = c("Female", "Male"))
  )

# Fit logistic models for each covariate, adjusted for 'age' and 'sex'
resultTbl =
  fDf_adjustForVars_tblRegression(
    inputDf            = trial_augmentedDf,
    outcomeVarName     = "response",
    covariatesToTestVec = c("marker", "grade", "stage"),
    adjustVarNamesVec  = c("age", "sex"),
    familyArg          = "binomial",
    exponentiateArg    = TRUE
  )

# Print the final gtsummary table
resultTbl


resultTbl =
  fDf_adjustForVars_tblRegression(
    inputDf            = trial_augmentedDf,
    outcomeVarName     = "response",
    covariatesToTestVec = c("marker", "grade", "stage"),
    adjustVarNamesVec  = c("age", "sex"),
    familyArg          = "binomial",
    exponentiateArg    = TRUE
  )
resultTbl
