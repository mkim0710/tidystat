# https://chatgpt.com/c/66feb001-819c-800e-acc7-ddb92559c775

# Load required libraries
library(rentrez)
library(dplyr)
library(tidyr)

# (Optional) Set your NCBI API key
# entrez_key("YOUR_API_KEY_HERE")

# Define your search query
query <- '("Obesity"[Mesh] OR obesity OR overweight OR "body mass index" OR BMI OR adiposity) AND ("Epidemiologic Studies"[Mesh] OR epidemiology OR epidemiologic OR incidence OR prevalence OR "risk factors" OR "cohort study" OR "cross-sectional study" OR "case-control study")'

# Perform the search
search_results <- entrez_search(db = "pubmed",
                                term = query,
                                retmax = 1000) # Adjust retmax as needed

# Retrieve PMIDs
pmids <- search_results$ids

# Function to fetch summaries and abstracts
fetch_pubmed_data <- function(pmids_batch) {
  summaries <- entrez_summary(db = "pubmed", id = pmids_batch)
  
  summary_df <- do.call(rbind, lapply(summaries, function(x) {
    data.frame(
      PMID = x$uid,
      Title = x$title,
      Source = x$source,
      PubDate = x$pubdate,
      Authors = paste(x$authors, collapse = ", "),
      stringsAsFactors = FALSE
    )
  }))
  
  abstracts <- entrez_fetch(db = "pubmed",
                            id = pmids_batch,
                            rettype = "abstract",
                            retmode = "text")
  
  abstracts_list <- strsplit(abstracts, "\n\n")[[1]]
  
  abstracts_clean <- sapply(abstracts_list, function(abstract) {
    lines <- strsplit(abstract, "\n")[[1]]
    if (length(lines) > 1) {
      paste(lines[-1], collapse = " ")
    } else {
      NA
    }
  })
  
  summary_df$Abstract <- abstracts_clean
  
  return(summary_df)
}

# Batch processing parameters
batch_size <- 100
num_batches <- ceiling(length(pmids) / batch_size)

# Initialize data frame
pubmed_data <- data.frame()

# Loop through batches
for (i in 1:num_batches) {
  start_index <- (i - 1) * batch_size + 1
  end_index <- min(i * batch_size, length(pmids))
  pmids_batch <- pmids[start_index:end_index]
  
  cat("Fetching batch", i, "of", num_batches, "\n")
  
  batch_data <- fetch_pubmed_data(pmids_batch)
  
  pubmed_data <- bind_rows(pubmed_data, batch_data)
  
  Sys.sleep(0.34) # Pause to respect rate limits
}

# Save to CSV
write.csv(pubmed_data, "pubmed_obesity_epidemiology_basic.csv", row.names = FALSE)

# View the first few rows
head(pubmed_data)
