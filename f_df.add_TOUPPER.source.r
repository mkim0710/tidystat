# f_df.add_TOUPPER.source.r


# Load necessary libraries
library(dplyr)
library(tibble)  # For easy data frame creation

# Create a sample healthcare dataset
health_data <- tibble(
  patient_id = c("P001", "P002", "P003"),
  diagnosis = c("Diabetes", "Hypertension", "Asthma"),
  treatment = c("Metformin", "Lisinopril", "Inhaler"),
  severity = factor(c("High", "Moderate", "Mild")),
  effectiveness = factor(c("Good", "Moderate", "Poor"))
)

# Function to uppercase and retain factor if original column was a factor
uppercase_factor <- function(x) {
  if (is.factor(x)) {
    factor(toupper(levels(x))[x])
  } else {
    toupper(x)
  }
}

# Duplicate columns with '.TOUPPER' suffix, convert to uppercase, and retain factor type if applicable
health_data_modified <- health_data %>%
  mutate(across(.cols = c(where(is.character), where(is.factor)),
                .fns = list(TOUPPER = ~uppercase_factor(.)),
                .names = "{.col}.TOUPPER"))

# Display the modified dataset
print(health_data_modified)
# > print(health_data_modified)
# # A tibble: 3 × 10
#   patient_id diagnosis    treatment  severity effectiveness patient_id.TOUPPER diagnosis.TOUPPER treatment.TOUPPER severity.TOUPPER effectiveness.TOUPPER
#   <chr>      <chr>        <chr>      <fct>    <fct>         <chr>              <chr>             <chr>             <fct>            <fct>                
# 1 P001       Diabetes     Metformin  High     Good          P001               DIABETES          METFORMIN         HIGH             GOOD                 
# 2 P002       Hypertension Lisinopril Moderate Moderate      P002               HYPERTENSION      LISINOPRIL        MODERATE         MODERATE             
# 3 P003       Asthma       Inhaler    Mild     Poor          P003               ASTHMA            INHALER           MILD             POOR        








# Load necessary libraries
library(dplyr)
library(tibble)  # For easy data frame creation

# Create a sample healthcare dataset
health_data <- tibble(
  patient_id = c("P001", "P002", "P003"),
  diagnosis = c("Diabetes", "Hypertension", "Asthma"),
  treatment = c("Metformin", "Lisinopril", "Inhaler"),
  severity = factor(c("High", "Moderate", "Mild")),
  effectiveness = factor(c("Good", "Moderate", "Poor"))
)

# Duplicate character and factor columns, append '.TOUPPER' suffix, and convert to uppercase
health_data_modified <- health_data %>%
  mutate(across(.cols = c(where(is.character), where(is.factor)),
                .fns = list(TOUPPER = ~toupper(as.character(.))),
                .names = "{.col}.TOUPPER"))



mutate(across(.cols = c(where(is.character), where(is.factor)),
              .fns = list(TOUPPER = ~toupper(as.character(.))),
                .names = "{.col}.TOUPPER"))


# Display the modified dataset
print(health_data_modified)
# > print(health_data_modified)
# # A tibble: 3 × 10
#   patient_id diagnosis    treatment  severity effectiveness patient_id.TOUPPER diagnosis.TOUPPER treatment.TOUPPER severity.TOUPPER effectiveness.TOUPPER
#   <chr>      <chr>        <chr>      <fct>    <fct>         <chr>              <chr>             <chr>             <chr>            <chr>                
# 1 P001       Diabetes     Metformin  High     Good          P001               DIABETES          METFORMIN         HIGH             GOOD                 
# 2 P002       Hypertension Lisinopril Moderate Moderate      P002               HYPERTENSION      LISINOPRIL        MODERATE         MODERATE             
# 3 P003       Asthma       Inhaler    Mild     Poor          P003               ASTHMA            INHALER           MILD             POOR     








#! f_df_add_TOUPPER =====


# Function to add '.TOUPPER' columns to a data frame
f_df_add_TOUPPER <- function(df) {
    # Function to uppercase and retain factor if original column was a factor
    uppercase_factor <- function(x) {
        if (is.factor(x)) {
            factor(toupper(levels(x))[x])
        } else {
            toupper(x)
        }
    }
    df %>%
        mutate(across(.cols = c(where(is.character), where(is.factor)),
                      .fns = list(TOUPPER = ~uppercase_factor(.)),
                      .names = "{.col}.TOUPPER"))
}

# Example usage with a sample healthcare dataset
health_data <- tibble(
  patient_id = c("P001", "P002", "P003"),
  diagnosis = c("Diabetes", "Hypertension", "Asthma"),
  treatment = c("Metformin", "Lisinopril", "Inhaler"),
  severity = factor(c("High", "Moderate", "Mild")),
  effectiveness = factor(c("Good", "Moderate", "Poor"))
)

# Apply the function to the healthcare dataset
health_data_modified <- f_df_add_TOUPPER(health_data)

# Display the modified dataset
print(health_data_modified)

#@ end -----


