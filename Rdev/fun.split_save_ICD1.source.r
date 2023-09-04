# fun.split_save_ICD1@ASROCKX300RYZEN.RMD
# fun.split_save_ICD1.source.r

format_time_diff <- function(diff_seconds) {
  diff_seconds <- as.numeric(diff_seconds, units = "secs")
  h <- floor(diff_seconds / 3600)
  m <- floor((diff_seconds %% 3600) / 60)
  s <- round(diff_seconds %% 60)
  return(sprintf('%02d:%02d:%02d', h, m, s))
}


# Main function
# fun.split_save_ICD1 <- function(dataset_name = "gy20_t1c_yr_icd.sas7bdat", 
#                                 varname_icd = "MAIN_SICK", 
#                                 varname_icd1 = NULL, 
#                                 path4write = getwd(), 
#                                 write_rds_compress = NULL) {
fun.split_save_ICD1 <- function(dataset_name = "nsc2_m20.sas7bdat", 
                                varname_icd = "SICK_SYM1", 
                                varname_icd1 = NULL, 
                                path4write = getwd(), 
                                write_rds_compress = NULL) {
  
  library(dplyr)
  library(purrr)

  # Using parent.frame() to modify the dataset_name variable directly in the calling environment.
  # This approach was chosen to seamlessly update the variable without the need for reassignment in the calling code.
  # Be cautious: This function will overwrite the dataset_name variable in the calling environment, 
  # which can be a surprise if not expected. Make sure the calling code is aware of this side effect.
  if (is.null(varname_icd1)) {
    t0_substr <- Sys.time()
    assign(dataset_name
           , get(dataset_name) %>% mutate(icd1char = substr(!!sym(varname_icd), 1, 1))
           # , envir = parent.env()  # caution) debug
           , envir = parent.frame()
    )
    cat("Time elapsed for substr(!!sym(varname_icd), 1, 1)): ", format_time_diff(difftime(Sys.time(), t0_substr, units = "secs")), "\n")
    varname_icd1 <- "icd1char"
  }
  
  map_chr(LETTERS, function(i) {
    t0_filter <- Sys.time()
    tmp.df <- get(dataset_name) %>% filter(!!sym(varname_icd1) == i)
    cat("Time elapsed for filter(!!sym(varname_icd1) == ", i, "): ", format_time_diff(difftime(Sys.time(), t0_filter, units = "secs")), "\n")

    # If no data for the character, skip
    if(nrow(tmp.df) == 0) {
        message(paste("No data for ICD starting with", i, ". Skipping."))
        return(paste0("N/A for ", i))
    }
    objectname <- paste0(dataset_name, "_", i)
    filename <- paste0(objectname, ".rds")
    
    tmp.df[[varname_icd1]] = NULL
    t0_write <- Sys.time()
    if (is.null(write_rds_compress)) write_rds(tmp.df, file.path(path4write, filename))
    else write_rds(tmp.df, file.path(path4write, filename), compress = write_rds_compress)
    cat("Time elapsed for write_rds(", objectname, "): ", format_time_diff(difftime(Sys.time(), t0_write, units = "secs")), "\n")
    return(objectname)
  })
}






# Split dataset based on the first character of the ICD code and save each subset as a separate RDS file
fun.split_save_ICD1_v2 <- function(dataset_name = "nsc2_m20.sas7bdat", 
                                varname_icd = "SICK_SYM1", 
                                varname_icd1 = NULL, 
                                path4write = getwd(), 
                                write_rds_compress = NULL) {
  
  # Extract the first character from the ICD code if varname_icd1 is not provided
  if (is.null(varname_icd1)) {
    t0_substr <- Sys.time()
    data <- get(dataset_name) %>% mutate(icd1char = substr(!!sym(varname_icd), 1, 1))
    cat("Time elapsed for substr: ", format_time_diff(difftime(Sys.time(), t0_substr, units = "secs")), "\n")
    varname_icd1 <- "icd1char"
  } else {
    data <- get(dataset_name)
  }
  
  # Iterate over each letter and filter the dataset, then save the filtered data
  result <- map_chr(LETTERS, function(i) {
    t0_filter <- Sys.time()
    filtered_data <- data %>% filter(!!sym(varname_icd1) == i)
    cat("Time elapsed for filtering data with ", i, ": ", format_time_diff(difftime(Sys.time(), t0_filter, units = "secs")), "\n")
    
    # If no data for the character, skip
    if(nrow(filtered_data) == 0) {
      message(paste("No data for ICD starting with", i, ". Skipping."))
      return(paste0("N/A for ", i))
    }
    
    objectname <- paste0(dataset_name, "_", i)
    filename <- paste0(objectname, ".rds")
    filtered_data[[varname_icd1]] <- NULL

    t0_write <- Sys.time()
    write_rds(filtered_data, file.path(path4write, filename), compress = ifelse(is.null(write_rds_compress), "xz", write_rds_compress))
    cat("Time elapsed for writing data with ", i, ": ", format_time_diff(difftime(Sys.time(), t0_write, units = "secs")), "\n")
    
    return(objectname)
  })
  
  return(result)
}






fun.split_save_ICD1_v3 <- function(dataset_name = "nsc2_m20.sas7bdat", 
                                varname_icd = "SICK_SYM1", 
                                path4write = getwd(), 
                                write_rds_compress = NULL) {
  
  data <- get(dataset_name)
  
  # Iterate over each letter and filter the dataset, then save the filtered data
  result <- map_chr(LETTERS, function(i) {
    t0_filter <- Sys.time()
    
    filtered_data <- data %>% filter(substr(!!sym(varname_icd), 1, 1) == i)
    
    cat("Time elapsed for filtering data with ", i, ": ", format_time_diff(difftime(Sys.time(), t0_filter, units = "secs")), "\n")
    
    # If no data for the character, skip
    if(nrow(filtered_data) == 0) {
      message(paste("No data for ICD starting with", i, ". Skipping."))
      return(paste0("N/A for ", i))
    }
    
    objectname <- paste0(dataset_name, "_", i)
    filename <- paste0(objectname, ".rds")

    t0_write <- Sys.time()
    write_rds(filtered_data, file.path(path4write, filename), compress = ifelse(is.null(write_rds_compress), "xz", write_rds_compress))
    cat("Time elapsed for writing data with ", i, ": ", format_time_diff(difftime(Sys.time(), t0_write, units = "secs")), "\n")
    
    return(objectname)
  })
  
  return(result)
}







library(sqldf)
fun.split_save_ICD1_db <- function(dataset_name = "nsc2_m20.sas7bdat", 
                                   varname_icd = "SICK_SYM1", 
                                   path4write = getwd(), 
                                   write_rds_compress = NULL,
                                   use_memory_db = TRUE) {
  
  data <- get(dataset_name)
  
  # Set up the database connection string
  db_connection_str <- if (use_memory_db) ":memory:" else tempfile(fileext = ".sqlite")
  
  # Create the SQLite database and load the dataset into it
  sqldf(paste0("attach '", db_connection_str, "' as db"))
  sqldf(paste0("CREATE TABLE db.data as select * from '", dataset_name, "'"))
  
  # Create an index on varname_icd for faster substring calculations
  sqldf(paste0("CREATE INDEX idx_", varname_icd, " on db.data(", varname_icd, ")"))
  
  result <- map_chr(LETTERS, function(i) {
    query <- paste0("SELECT * FROM db.data WHERE SUBSTR(", varname_icd, ",1,1) = '", i, "'")
    
    t0_query <- Sys.time()
    filtered_data <- sqldf(query)
    cat("Time elapsed for query with ", i, ": ", format_time_diff(difftime(Sys.time(), t0_query, units = "secs")), "\n")
    
    # If no data for the character, skip
    if(nrow(filtered_data) == 0) {
      message(paste("No data for ICD starting with", i, ". Skipping."))
      return(paste0("N/A for ", i))
    }
    
    objectname <- paste0(dataset_name, "_", i)
    filename <- paste0(objectname, ".rds")

    t0_write <- Sys.time()
    write_rds(filtered_data, file.path(path4write, filename), compress = ifelse(is.null(write_rds_compress), "xz", write_rds_compress))
    cat("Time elapsed for writing data with ", i, ": ", format_time_diff(difftime(Sys.time(), t0_write, units = "secs")), "\n")
    
    return(objectname)
  })
  
  # Drop the table and detach the database
  sqldf("DROP TABLE db.data")
  sqldf("detach database db")
  
  # If using a disk-based SQLite database, remove the temporary file
  if (!use_memory_db) file.remove(db_connection_str)
  
  return(result)
}

