#!/usr/bin/env Rscript
# Model: Cascade (SWE-1); Details: temperature=0.7, max_tokens=2000; Timestamp: 2025-10-29 20:50 KST; Source: Windsurf
# Prompt: Create a script to analyze R file dependencies and generate DEPENDENCIES.md
# Step: 01
# Version: v01
# Dependencies: stringr, dplyr, purrr, tidyr, igraph
# Produces: docs/DEPENDENCIES.md
# Previous: N/A (Initial version)
# History: N/A (Initial version)
# Changes: Initial creation of dependency analysis script

# Load required packages
suppressPackageStartupMessages({
  library(stringr)
  library(dplyr)
  library(purrr)
  library(tidyr)
  library(igraph)
})

# Configuration
project_root <- normalizePath("../")
output_file <- file.path(project_root, "docs", "DEPENDENCIES.md")

# Find all R files in the project
r_files <- list.files(
  path = project_root, 
  pattern = "\\.R$", 
  recursive = TRUE, 
  full.names = TRUE,
  ignore.case = TRUE
)

# Filter out files in .git, .Rproj.user, and other common directories
exclude_dirs <- c(
  "^\\.", "^_", "^vignettes", "^inst", "^man", "^docs",
  "^Rproj", "^rstudio-prefs"
)
r_files <- r_files[!grepl(paste0("(", paste(exclude_dirs, collapse = "|"), ")"), r_files)]

# Function to extract dependencies from an R file
extract_deps <- function(file_path) {
  if (!file.exists(file_path)) return(character(0))
  
  content <- readLines(file_path, warn = FALSE)
  
  # Patterns to match different types of dependencies
  patterns <- c(
    # source() calls
    'source\\s*\\([^)]*["\']([^"\']+\\.R)["\'][^)]*\\)',
    # library() calls
    'library\\s*\\(\\s*["\']?([a-zA-Z0-9.]+)["\']?\\s*\\)',
    # import::from() calls
    'import::?from\\s*\\([^)]*["\']([^"\']+)["\']'
  )
  
  # Find all matches
  matches <- unlist(lapply(patterns, function(p) {
    m <- str_match_all(content, p)
    unlist(lapply(m, function(x) if(nrow(x) > 0) x[,2] else character(0)))
  }))
  
  # Clean and normalize paths
  matches <- trimws(matches)
  matches <- matches[matches != ""]
  
  # Convert to absolute paths if relative
  matches <- sapply(matches, function(x) {
    if (file.exists(x)) {
      normalizePath(x)
    } else if (file.exists(file.path(dirname(file_path), x))) {
      normalizePath(file.path(dirname(file_path), x))
    } else {
      x  # Return as is if can't resolve
    }
  })
  
  unique(matches)
}

# Build dependency graph
deps_list <- list()
for (file in r_files) {
  deps_list[[file]] <- extract_deps(file)
}

# Create a data frame of edges (from -> to)
edge_list <- map2_dfr(
  names(deps_list),
  deps_list,
  ~ {
    if (length(.y) > 0) {
      data.frame(from = .x, to = .y, stringsAsFactors = FALSE)
    } else {
      data.frame(from = character(0), to = character(0), stringsAsFactors = FALSE)
    }
  }
)

# Create a table of file information
file_info <- data.frame(
  File = r_files,
  stringsAsFactors = FALSE
) %>%
  mutate(
    Sources = map_chr(File, ~ {
      deps <- deps_list[[.x]]
      if (length(deps) == 0 || all(is.na(deps))) return("")
      deps <- deps[!is.na(deps) & deps != ""]
      if (length(deps) == 0) return("")
      paste0("- ", basename(deps), collapse = "\n")
    }),
    Sourced_By = map_chr(File, ~ {
      sources_this_file <- names(deps_list)[sapply(deps_list, function(deps) .x %in% deps)]
      if (length(sources_this_file) == 0) return("")
      sources_this_file <- sources_this_file[!is.na(sources_this_file) & sources_this_file != ""]
      if (length(sources_this_file) == 0) return("")
      paste0("- ", basename(sources_this_file), collapse = "\n")
    }),
    Notes = ""
  )

# Generate Mermaid diagram
mermaid_diagram <- "```mermaid\ngraph LR\n"
for (i in seq_len(nrow(edge_list))) {
  from <- basename(edge_list$from[i])
  to <- basename(edge_list$to[i])
  mermaid_diagram <- paste0(mermaid_diagram, 
                          sprintf("    %s --> %s\n", 
                                 gsub("[- .]", "", from), 
                                 gsub("[- .]", "", to)))
}
mermaid_diagram <- paste0(mermaid_diagram, "```\n\n")

# Check for circular dependencies
g <- graph_from_data_frame(edge_list)
is_dag <- is_dag(g)
circular <- if (!is_dag) {
  cycles <- girth(g, TRUE)$circle
  if (length(cycles) > 0) {
    paste("Circular dependencies found:", 
          paste(basename(V(g)$name[cycles]), collapse = " -> "))
  } else {
    "No circular dependencies detected."
  }
} else {
  "No circular dependencies detected."
}

# Generate the markdown content
markdown_content <- c(
  "# R File Dependencies\n\n",
  "## Dependency Graph\n\n",
  mermaid_diagram,
  "## File Dependencies\n\n",
  "| File | Sources | Sourced By | Notes |\n",
  "|------|---------|------------|-------|\n",
  apply(file_info, 1, function(row) {
    file <- basename(row["File"])
    sources <- gsub("\n", "<br>", row["Sources"])
    sourced_by <- gsub("\n", "<br>", row["Sourced_By"])
    notes <- row["Notes"]
    sprintf("| %s | %s | %s | %s |", file, sources, sourced_by, notes)
  }),
  "\n\n## Dependency Analysis\n\n",
  circular, "\n"
)

# Ensure docs directory exists
if (!dir.exists(dirname(output_file))) {
  dir.create(dirname(output_file), recursive = TRUE, showWarnings = FALSE)
}

# Write to file
writeLines(markdown_content, output_file)

cat(sprintf("Dependency analysis complete. Results written to: %s\n", output_file))
