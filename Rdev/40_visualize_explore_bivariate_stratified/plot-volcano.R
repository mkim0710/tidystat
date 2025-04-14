# ---------------------------------------------------
# (1) Package installation and loading
# ---------------------------------------------------
# install.packages("ggplot2")   # if needed
# install.packages("ggrepel")   # if needed
library(ggplot2)
library(ggrepel)
library(dplyr)

# ---------------------------------------------------
# (2) Generate simulated GWAS-like data
# ---------------------------------------------------
set.seed(456)
volcano_data <- data.frame(
  SNP       = paste0("rs", 1:100),
  beta      = rnorm(100, mean=0, sd=1),
  p_value   = runif(100, min=1e-8, max=0.05),
  stringsAsFactors = FALSE
)

# ---------------------------------------------------
# (3) Calculate -log10(p-value) and define significance
# ---------------------------------------------------
threshold <- 5e-8  # genome-wide significance threshold (example)
volcano_data <- volcano_data %>%
  mutate(
    neg_log10_p = -log10(p_value),
    is_signif   = ifelse(p_value < threshold, TRUE, FALSE)
  )

# ---------------------------------------------------
# (4) Basic Volcano Plot with ggplot2
# ---------------------------------------------------
g <- ggplot(volcano_data, aes(x = beta, y = neg_log10_p)) +
  geom_point(aes(color = is_signif), alpha = 0.7) +
  scale_color_manual(values = c("FALSE" = "gray50", "TRUE" = "red")) +
  geom_hline(yintercept = -log10(threshold), linetype = "dashed", color = "blue") +
  labs(
    title = "Example Volcano Plot",
    x = expression(paste("Effect size (", beta, ")")),
    y = expression(-log[10](p-value))
  ) +
  theme_minimal()

# ---------------------------------------------------
# (5) Labeling top significant points
# ---------------------------------------------------
signif_points <- volcano_data %>%
  filter(is_signif == TRUE) %>%
  top_n(5, neg_log10_p)  # label top 5 significant hits (example)

g + geom_text_repel(
      data = signif_points,
      aes(label = SNP),
      size = 3,
      color = "black",
      box.padding = 0.3,
      point.padding = 0.2
    )
