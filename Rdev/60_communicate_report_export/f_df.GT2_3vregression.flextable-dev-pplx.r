# https://www.perplexity.ai/search/7cb8840f-98b9-4044-9961-676ccad08333
library(gtsummary)
library(tidyverse)

# Create adjusted models for all covariates
trialdata %>%
  tbl_uvregression(
    method = glm,
    y = outcome,
    method.args = list(family = binomial),
    formula = "{y} ~ {x} + age + sex",  # Key modification
    exponentiate = TRUE,
    include = -c(age, sex)  # Exclude adjustment variables from main analysis
  ) %>%
  # Optional formatting
  modify_header(label ~ "**Adjusted Variable**") %>%
  bold_p()
