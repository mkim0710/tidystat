# f_df.add_UC.dev.r


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


# Function to UpperCase and retain factor if original column was a factor
f_vec.toupper_factor <- function(input_vec) {
  if (is.factor(input_vec)) {
    factor(toupper(levels(input_vec))[input_vec])
  } else if (is.character(input_vec)) {
    toupper(input_vec)
  } else {
    input_vec
  }
}

# Duplicate columns with '.UC' suffix, convert to UpperCase, and retain factor type if applicable
health_data_modified <- health_data %>%
  mutate(across(.cols = c(where(is.character), where(is.factor)),
                .fns = list(UC = ~f_vec.toupper_factor(.)),
                .names = "{.col}.UC"))

# Display the modified dataset
print(health_data_modified)
# > print(health_data_modified)
# # A tibble: 3 × 10
#   patient_id diagnosis    treatment  severity effectiveness patient_id.UC diagnosis.UC treatment.UC severity.UC effectiveness.UC
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

# Duplicate character and factor columns, append '.UC' suffix, and convert to UpperCase
health_data_modified <- health_data %>%
  mutate(across(.cols = c(where(is.character), where(is.factor)),
                .fns = list(UC = ~toupper(as.character(.))),
                .names = "{.col}.UC"))


# Display the modified dataset
print(health_data_modified)
# > print(health_data_modified)
# # A tibble: 3 × 10
#   patient_id diagnosis    treatment  severity effectiveness patient_id.UC diagnosis.UC treatment.UC severity.UC effectiveness.UC
#   <chr>      <chr>        <chr>      <fct>    <fct>         <chr>              <chr>             <chr>             <chr>            <chr>                
# 1 P001       Diabetes     Metformin  High     Good          P001               DIABETES          METFORMIN         HIGH             GOOD                 
# 2 P002       Hypertension Lisinopril Moderate Moderate      P002               HYPERTENSION      LISINOPRIL        MODERATE         MODERATE             
# 3 P003       Asthma       Inhaler    Mild     Poor          P003               ASTHMA            INHALER           MILD             POOR     








#! f_df.add_UC =====  


# Function to add '.UC' columns to a data frame
f_df.add_UC <- function(df) {
    # Function to UpperCase and retain factor if original column was a factor
    f_vec.toupper_factor <- function(input_vec) {
        if (is.factor(input_vec)) {
            factor(toupper(levels(input_vec))[input_vec])
        } else if (is.character(input_vec)) {
            toupper(input_vec)
        } else {
            input_vec
        }
    }
    df %>%
        mutate(across(.cols = c(where(is.character), where(is.factor)),
                      .fns = list(UC = ~f_vec.toupper_factor(.)),
                      .names = "{.col}.UC"))
}


# Example usage with a sample healthcare dataset
health_data <- tibble(
  patient_id = c("P001", "P002", "P003"),
  diagnosis = c("Diabetes", "Hypertension", "Asthma"),
  treatment = c("Metformin", "Lisinopril", "Inhaler"),
  severity = factor(c("High", "Moderate", "Mild")),
  effectiveness = factor(c("Good", "Moderate", "Poor"))
)

health_data %>% f_df.add_UC
# > health_data %>% f_df.add_UC
# # A tibble: 3 × 10
#   patient_id diagnosis    treatment  severity effectiveness patient_id.UC diagnosis.UC treatment.UC severity.UC effectiveness.UC
#   <chr>      <chr>        <chr>      <fct>    <fct>         <chr>         <chr>        <chr>        <fct>       <fct>           
# 1 P001       Diabetes     Metformin  High     Good          P001          DIABETES     METFORMIN    HIGH        GOOD            
# 2 P002       Hypertension Lisinopril Moderate Moderate      P002          HYPERTENSION LISINOPRIL   MODERATE    MODERATE        
# 3 P003       Asthma       Inhaler    Mild     Poor          P003          ASTHMA       INHALER      MILD        POOR          
  
# __________|------  
# 〚〛 END-----  


