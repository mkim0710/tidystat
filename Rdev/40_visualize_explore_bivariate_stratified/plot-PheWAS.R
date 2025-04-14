# # ---------------------------------------------------
# # (1) Package installation and loading
# # ---------------------------------------------------
# # install.packages("PheWAS")   # if needed
# # install.packages("circlize") # if needed
# library(PheWAS)
# library(circlize)
# library(dplyr)
# 
# # ---------------------------------------------------
# # (2) Generate simulated PheWAS-like data
# # ---------------------------------------------------
# set.seed(123)
# phewas_data <- data.frame(
#   phenotype = paste0("PH", 1:20),   # 20 phenotypes
#   p_value   = runif(20, min=1e-4, max=0.05),  # random p-values
#   beta      = rnorm(20, mean=0, sd=0.5),      # random effect sizes
#   stringsAsFactors = FALSE
# )
# 
# # ---------------------------------------------------
# # (3) Calculate -log10(p-value) and define thresholds
# # ---------------------------------------------------
# phewas_data <- phewas_data %>%
#   mutate(
#     neg_log10_p = -log10(p_value),
#     is_signif   = ifelse(p_value < 0.01, TRUE, FALSE)  # example threshold
#   )
# 
# # ---------------------------------------------------
# # (4) Prepare data for circular plot
# # ---------------------------------------------------
# # 4-1. Sort by p-value or any other criterion
# phewas_data <- phewas_data %>% arrange(p_value)
# 
# # 4-2. Clear any existing Circos plot settings
# circos.clear()
# # Set starting angle and gap between sectors
# circos.par(start.degree = 90, gap.after = 2)
# 
# # ---------------------------------------------------
# # (5) Create the Circle Plot
# # ---------------------------------------------------
# factors <- factor(phewas_data$phenotype, levels = phewas_data$phenotype)
# circos.initialize(factors = factors, xlim = c(0, 1))
# 
# circos.trackPlotRegion(
#   factors = factors,
#   ylim = c(0, max(phewas_data$neg_log10_p) + 0.5),
#   track.height = 0.2,
#   panel.fun = function(x, y) {
#     current_phenotype <- get.cell.meta.data("sector.index")
#     y_value <- phewas_data$neg_log10_p[
#       phewas_data$phenotype == current_phenotype
#     ]
#     
#     # Plot points in each sector (radial direction)
#     circos.points(
#       x = 1,
#       y = y_value,
#       cex = 0.8,
#       col = ifelse(
#         phewas_data$is_signif[phewas_data$phenotype == current_phenotype],
#         "red", "blue"
#       ),
#       pch = 16
#     )
#     
#     # Optional guideline (e.g., -log10(0.01) ~ 2)
#     circos.lines(c(0, 2), y = c(2, 2), lty = 2, col = "gray60")
#   }
# )
# 
# title("Example PheWAS Circle Plot")


# Example data structure (simulated)
set.seed(1)
df <- data.frame(
  genotype = rbinom(1000, size=2, prob=0.3),  # e.g., 0/1/2 genotype calls
  phenotype_1 = rbinom(1000, 1, 0.2),
  phenotype_2 = rbinom(1000, 1, 0.1),
  phenotype_3 = rbinom(1000, 1, 0.05),
  cov1 = rnorm(1000, mean=50, sd=10),
  cov2 = rnorm(1000, mean=100, sd=25),
  stringsAsFactors = FALSE
)

# List of phenotypes (columns) to analyze
phenos <- c("phenotype_1", "phenotype_2", "phenotype_3")

# Empty list to store results
results_list <- list()

# Loop over phenotypes and run logistic regressions
for (ph in phenos) {
  # Build formula: phenotype ~ genotype + covariates
  formula_str <- paste(ph, "~ genotype + cov1 + cov2")
  
  # Fit logistic regression
  fit <- glm(formula_str, data=df, family="binomial")
  
  # Extract coefficient (genotype) and p-value
  coef_info <- summary(fit)$coefficients["genotype", ]
  beta_est  <- coef_info["Estimate"]
  pval      <- coef_info["Pr(>|z|)"]
  
  # Store in a data frame
  results_list[[ph]] <- data.frame(
    phenotype = ph,
    beta      = beta_est,
    p_value   = pval,
    stringsAsFactors = FALSE
  )
}

# Combine results
results_df <- do.call(rbind, results_list)

# Multiple-testing correction (e.g., FDR)
results_df$fdr <- p.adjust(results_df$p_value, method="fdr")

results_df



# install.packages("circlize") if needed
library(circlize)
library(dplyr)

results_df <- results_df %>%
  mutate(neg_log10_p = -log10(p_value))

# Sort by p-value or by phenotype group
results_df <- results_df %>% arrange(p_value)

# Circos initialization
circos.clear()
circos.par(start.degree = 90, gap.after = 2)

factors <- factor(results_df$phenotype, levels = results_df$phenotype)
circos.initialize(factors = factors, xlim = c(0,1))

# Create a track with the points
circos.trackPlotRegion(
  factors = factors,
  ylim = c(0, max(results_df$neg_log10_p) + 1),
  track.height = 0.2,
  panel.fun = function(x, y) {
    current_ph <- get.cell.meta.data("sector.index")
    val <- results_df$neg_log10_p[results_df$phenotype == current_ph]
    
    circos.points(
      x = 0.5,   # radial position (constant for demonstration)
      y = val,
      pch = 16,
      cex = 0.8
    )
    
    # Optionally add reference lines, e.g., FDR threshold
    # (This is just an example; adjust as needed)
  }
)

title("Manual PheWAS Circle Plot")



library(ggplot2)

results_df$neg_log10_p <- -log10(results_df$p_value)

ggplot(results_df, aes(x = beta, y = neg_log10_p)) +
  geom_point(alpha = 0.7) +
  geom_hline(yintercept = -log10(0.05/length(phenos)), # simplistic Bonferroni
             linetype="dashed", color="blue") +
  labs(x = "Effect size (Beta)", y = "-log10(p-value)") +
  theme_minimal()
