# https://chatgpt.com/c/66feb29c-7a00-800e-982e-3c8d1323822a

# Load necessary libraries
library(httr)
library(jsonlite)
library(dplyr)

# Define the API endpoint
base_url <- "https://clinicaltrials.gov/api/query/study_fields"

# Define search expression
search_expr <- "(Obesity OR Overweight OR Adiposity) AND (Diet OR Exercise OR Pharmacotherapy OR Bariatric Surgery)"

# Define fields to retrieve, including ProtocolSection
fields <- c("NCTId", "Title", "Condition", "Intervention", "OverallStatus", 
            "StartDate", "CompletionDate", "ProtocolSection")

# Define the maximum number of studies to retrieve
max_records <- 1000  # Adjust as needed

# Function to retrieve data
retrieve_ctgov_data <- function(expr, fields, min_rnk = 1, max_rnk = 1000) {
  response <- GET(
    url = base_url,
    query = list(
      expr = expr,
      fields = paste(fields, collapse = ","),
      min_rnk = min_rnk,
      max_rnk = max_rnk,
      fmt = "json"
    )
  )
  
  if (response$status_code == 200) {
    data_json <- content(response, as = "text", encoding = "UTF-8")
    data_parsed <- fromJSON(data_json, flatten = TRUE)
    studies <- data_parsed$StudyFieldsResponse$StudyFields
    return(studies)
  } else {
    warning(paste("Failed to retrieve data. Status code:", response$status_code))
    return(NULL)
  }
}

# Retrieve data
studies <- retrieve_ctgov_data(search_expr, fields, min_rnk = 1, max_rnk = max_records)

# Check if data was retrieved
if (!is.null(studies)) {
  # Convert to data frame
  df <- as.data.frame(studies, stringsAsFactors = FALSE)
  
  # Clean and process data
  df_clean <- df %>%
    mutate(
      NCTId = sapply(NCTId, function(x) ifelse(length(x) > 0, x[1], NA)),
      Title = sapply(Title, function(x) ifelse(length(x) > 0, x[1], NA)),
      Condition = sapply(Condition, function(x) paste(x, collapse = "; ")),
      Intervention = sapply(Intervention, function(x) paste(x, collapse = "; ")),
      OverallStatus = sapply(OverallStatus, function(x) ifelse(length(x) > 0, x[1], NA)),
      StartDate = sapply(StartDate, function(x) ifelse(length(x) > 0, x[1], NA)),
      CompletionDate = sapply(CompletionDate, function(x) ifelse(length(x) > 0, x[1], NA))
    )
  
  # Extract ProtocolSection details (e.g., BriefSummary)
  protocol_sections <- studies$ProtocolSection
  
  # Example: Extract BriefSummary
  brief_summaries <- sapply(protocol_sections, function(x) {
    if (!is.null(x$BriefSummary)) {
      paste(x$BriefSummary, collapse = "; ")
    } else {
      NA
    }
  })
  
  df_clean$BriefSummary <- brief_summaries
  
  # View the cleaned data frame
  head(df_clean)
  
  # Optionally, save the data to a CSV file
  write.csv(df_clean, "obesity_clinical_trials.csv", row.names = FALSE)
  
  # Further analysis can be performed as needed
} else {
  stop("No data retrieved from ClinicalTrials.gov API.")
}
