# https://gemini.google.com/gem/6f1fcc704709/ab05386c397cb892


#' @title Create Adjusted Regression Tables
#' @description Creates regression tables adjusted for age and sex, iterating over specified covariates.
#' @param inputDf A data frame containing the data for analysis.
#' @param outcomeVarChr The name of the outcome variable as a string.
#' @param covariateVecChr A vector of covariate names as strings.
#' @param ageVarChr The name of the age variable as a string.
#' @param sexVarChr The name of the sex variable as a string.
#' @param modelFun The regression function to use (e.g., glm, coxph).
#' @param modelArgsList A list of additional arguments to pass to the regression function.
#' @param exponentiateLgl Logical, whether to exponentiate the coefficients.
#' @param pvalueFun The function to format p-values.
#' @param verboseLgl Logical, whether to print intermediate outputs for debugging.
#' @return A merged gtsummary table containing the adjusted regression results.
#' @importFrom dplyr %>% mutate across all_of
#' @importFrom purrr map
#' @importFrom gtsummary tbl_regression tbl_merge
#' @importFrom rlang .data
#' @examples
#' # Example using the trial dataset
#' if (require("gtsummary") && require("survival")) {
#'   adjustedRegressionTable <- fDf_adjustedRegressionTable_gtsummary(
#'     inputDf = trial,
#'     outcomeVarChr = "response",
#'     covariateVecChr = c("grade", "marker"),
#'     ageVarChr = "age",
#'     sexVarChr = "trt",
#'     modelFun = glm,
#'     modelArgsList = list(family = binomial),
#'     exponentiateLgl = TRUE,
#'     pvalueFun = gtsummary::style_pvalue
#'   )
#'   print(adjustedRegressionTable)
#'
#' adjustedRegressionTableCox <- fDf_adjustedRegressionTable_gtsummary(
#'     inputDf = trial,
#'     outcomeVarChr = "Surv(ttdeath, death)",
#'     covariateVecChr = c("grade", "marker"),
#'     ageVarChr = "age",
#'     sexVarChr = "trt",
#'     modelFun = coxph,
#'     exponentiateLgl = TRUE,
#'     pvalueFun = gtsummary::style_pvalue
#'   )
#'   print(adjustedRegressionTableCox)
#' }
fDf_adjustedRegressionTable_gtsummary <- function(
    inputDf,
    outcomeVarChr,
    covariateVecChr,
    ageVarChr,
    sexVarChr,
    modelFun,
    modelArgsList = list(),
    exponentiateLgl = FALSE,
    pvalueFun = gtsummary::style_pvalue,
    verboseLgl = FALSE
) {
  # Safety checks
  if (!is.data.frame(inputDf)) {
    stop("inputDf must be a data frame.")
  }
  if (!is.character(outcomeVarChr) || length(outcomeVarChr) != 1) {
    stop("outcomeVarChr must be a single character string.")
  }
  if (!is.character(covariateVecChr) || length(covariateVecChr) < 1) {
    stop("covariateVecChr must be a character vector with at least one element.")
  }
  if (!is.character(ageVarChr) || length(ageVarChr) != 1) {
    stop("ageVarChr must be a single character string.")
  }
  if (!is.character(sexVarChr) || length(sexVarChr) != 1) {
    stop("sexVarChr must be a single character string.")
  }
  if (!is.logical(exponentiateLgl) || length(exponentiateLgl) != 1) {
    stop("exponentiateLgl must be a single logical value.")
  }
  if (!is.logical(verboseLgl) || length(verboseLgl) != 1) {
    stop("verboseLgl must be a single logical value.")
  }

  # Build regression model formula
  f_build_formula <- function(covariateChr) {
    stats::as.formula(paste(outcomeVarChr, "~", covariateChr, "+", ageVarChr, "+", sexVarChr))
  }

  # Create regression tables for each covariate
  regressionTablesList <- purrr::map(covariateVecChr, function(covariateChr) {
    modelFormula <- f_build_formula(covariateChr)

    # Construct the model with arguments
    modelCall <- as.call(c(
      list(modelFun, formula = modelFormula, data = quote(inputDf)),
      modelArgsList
    ))

    modelObj <- eval(modelCall)

    if (verboseLgl) {
      print(paste("Model for", covariateChr, ":"))
      print(summary(modelObj))
    }

    gtsummary::tbl_regression(
      modelObj,
      exponentiate = exponentiateLgl,
      pvalue_fun = pvalueFun
    )
  })

  # Merge the regression tables
  mergedTable <- gtsummary::tbl_merge(regressionTablesList, tab_spanner = covariateVecChr)

  return(mergedTable)
}

# Example using the trial dataset
if (require("gtsummary") && require("survival")) {
  adjustedRegressionTable <- fDf_adjustedRegressionTable_gtsummary(
    inputDf = trial,
    outcomeVarChr = "response",
    covariateVecChr = c("grade", "marker"),
    ageVarChr = "age",
    sexVarChr = "trt",
    modelFun = glm,
    modelArgsList = list(family = binomial),
    exponentiateLgl = TRUE,
    pvalueFun = gtsummary::style_pvalue
  )
  print(adjustedRegressionTable)

adjustedRegressionTableCox <- fDf_adjustedRegressionTable_gtsummary(
    inputDf = trial,
    outcomeVarChr = "Surv(ttdeath, death)",
    covariateVecChr = c("grade", "marker"),
    ageVarChr = "age",
    sexVarChr = "trt",
    modelFun = coxph,
    exponentiateLgl = TRUE,
    pvalueFun = gtsummary::style_pvalue
  )
  print(adjustedRegressionTableCox)
}
