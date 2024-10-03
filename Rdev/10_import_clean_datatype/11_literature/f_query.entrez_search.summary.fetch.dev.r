# https://chatgpt.com/c/66feb001-819c-800e-acc7-ddb92559c775


library(rentrez)
library(dplyr)
library(tidyr)
library(xml2)
library(purrr)

# (Optional) Set your NCBI API key
# Replace "YOUR_API_KEY_HERE" with your actual API key
# entrez_key("YOUR_API_KEY_HERE")

# Define your search query
query <- '("Obesity"[Mesh] OR obesity OR overweight OR "body mass index" OR BMI OR adiposity) AND ("Epidemiologic Studies"[Mesh] OR epidemiology OR epidemiologic OR incidence OR prevalence OR "risk factors" OR "cohort study" OR "cross-sectional study" OR "case-control study")'

# Perform the search
search_results <- entrez_search(
  db = "pubmed",
  term = query,
  retmax = 1000 # Adjust retmax as needed
)

# Retrieve PMIDs
pmids <- search_results$ids

# Check the number of results
total_results <- search_results$count
cat("Total articles found:", total_results, "\n")

# Function to fetch detailed metadata and abstracts
fetch_detailed_metadata <- function(pmids_batch) {
  # Fetch XML data for the batch of PMIDs
  xml_data <- entrez_fetch(
    db = "pubmed",
    id = pmids_batch,
    rettype = "xml",
    retmode = "xml"
  )

  # Parse the XML
  xml_parsed <- read_xml(xml_data)

  # Extract all PubmedArticle nodes
  records <- xml_find_all(xml_parsed, ".//PubmedArticle")

  # Extract desired fields using XPath
  data_list <- map(records, function(record) {
    PMID <- xml_text(xml_find_first(record, ".//PMID"))
    Title <- xml_text(xml_find_first(record, ".//ArticleTitle"))
    
    # Some abstracts might have multiple AbstractText nodes (e.g., with labels)
    abstract_nodes <- xml_find_all(record, ".//Abstract/AbstractText")
    if (length(abstract_nodes) > 0) {
      Abstract <- paste(xml_text(abstract_nodes), collapse = " ")
    } else {
      Abstract <- NA
    }
    
    Authors <- xml_find_all(record, ".//Author")
    Authors <- paste(map_chr(Authors, function(author) {
      last <- xml_text(xml_find_first(author, ".//LastName"))
      fore <- xml_text(xml_find_first(author, ".//ForeName"))
      paste(fore, last)
    }), collapse = ", ")
    
    Journal <- xml_text(xml_find_first(record, ".//Journal/Title"))
    PubDate <- xml_text(xml_find_first(record, ".//PubDate"))
    
    # Extract MeSH terms
    mesh_nodes <- xml_find_all(record, ".//MeshHeading/DescriptorName")
    if (length(mesh_nodes) > 0) {
      MeSH <- paste(xml_text(mesh_nodes), collapse = "; ")
    } else {
      MeSH <- NA
    }

    # Return as a data frame row
    data.frame(
      PMID = PMID,
      Title = Title,
      Abstract = Abstract,
      Authors = Authors,
      Journal = Journal,
      PubDate = PubDate,
      MeSH_Terms = MeSH,
      stringsAsFactors = FALSE
    )
  })

  # Combine all rows into a single data frame
  data_df <- bind_rows(data_list)

  return(data_df)
}

# Define batch size
batch_size <- 100
num_batches <- ceiling(length(pmids) / batch_size)

# Initialize an empty data frame to store results
detailed_pubmed_data <- data.frame()

for (i in 1:num_batches) {
  # Define the current batch of PMIDs
  start_index <- (i - 1) * batch_size + 1
  end_index <- min(i * batch_size, length(pmids))
  pmids_batch <- pmids[start_index:end_index]

  cat("Fetching detailed metadata for batch", i, "of", num_batches, "\n")

  # Fetch detailed metadata for the current batch
  batch_data <- fetch_detailed_metadata(pmids_batch)

  # Append to the main data frame
  detailed_pubmed_data <- bind_rows(detailed_pubmed_data, batch_data)

  # Pause to respect API rate limits (no more than 3 requests per second)
  Sys.sleep(0.34)
}

# Save detailed metadata to a CSV file
write.csv(detailed_pubmed_data, "pubmed_obesity_epidemiology_detailed.csv", row.names = FALSE)

# View the first few rows
head(detailed_pubmed_data)

