# f_objectname.read.checkEntity.source.r



# #@@ START ------
# #$ objectname = "tblID_gj3_jk" ====
# ##@ assign(objectname, readRDS(file.path(path4read, filename2read))) 
# ```{r, paged.print=FALSE}
# if (getwd() != path4read) warning("getwd() != path4read == ") else cat("getwd() == path4read == "); dput(path4read)  #----
# objectname = "tblID_gj3_jk"; cat("----\n> ", 'objectname = "', objectname, '"\n', sep = ""); 
# filename.ext = paste0(objectname, ".rds")
# filename2read = if(file.exists(file.path(path4read, filename.ext))) filename.ext else if(file.exists(file.path(path4read, paste0(filename.ext, ".xz")))) paste0(filename.ext, ".xz") else NULL ; cat("----\n> ", 'filename2read = "', filename2read, '"\n', sep = ""); 
# 
# if(!is.null(filename2read)) {
#     env.custom$f_path.size_files(path4read = path4read, regex4filename = filename2read)
#     system.time(assign(objectname, read_rds(file.path(path4read, filename2read)), envir = .GlobalEnv))
#     cat("----\n> "); CodeText = "dim(get(objectname))"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
#     cat("----\n> ", "n_distinct(get(objectname)$PERSON_ID)", "\n", sep = ""); get(objectname) %>% {.$PERSON_ID} %>% n_distinct
#     cat("----\n> ", "n_distinct(get(objectname)$RN_INDI)", "\n", sep = ""); get(objectname) %>% {.$RN_INDI} %>% n_distinct
#     cat("----\n> ", "names(get(objectname))", "\n", sep = ""); get(objectname) %>% names %>% {cat(deparse(., width.cutoff=120), '\n\n', sep='')} # dput() cat(deparse(., width.cutoff=120)), width.cutoff=500 is the max ----
#     cat("----\n> ", "names(get(objectname))", "\n", sep = ""); get(objectname) %>% names %>% paste(collapse = ", ") %>% {cat(., '\n\n', sep='')}; # tidydplyr::select: paste(collapse = ", ") %>% cat ----
#     cat("----\n> "); CodeText = "str(get(objectname), max.level = 2, give.attr = F)"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
#     cat("----\n> "); CodeText = "as_tibble(get(objectname))"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
#     cat("----\n> "); CodeText = "tail(get(objectname))"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
#     # cat("----\n> ", "summary(get(objectname) %>% dplyr::select_if(is.numeric))", "\n", sep = ""); get(objectname) %>% dplyr::select_if(is.numeric) %>% summary #-----
#     # cat("----\n> ", "summary(get(objectname) %>% dplyr::select_if(is.logical))", "\n", sep = ""); get(objectname) %>% dplyr::select_if(is.logical) %>% summary #-----
#     # cat("----\n> ", "summary(get(objectname) %>% dplyr::select_if(is.factor))", "\n", sep = ""); get(objectname) %>% dplyr::select_if(is.logical) %>% summary #-----
# }
# ```


library(tidyverse)
path4read  = env.custom$path$path1
path4write = env.custom$path$path2
if (getwd() != path4read) warning("getwd() != path4read == ") else cat("getwd() == path4read == "); dput(path4read)  #----
if (getwd() != path4write) warning("getwd() != path4write  == ") else cat("getwd() == path4write == "); dput(path4write)  #----

objectname <- "as1_7.na.Date.fct.select971"
filename.extensions <- c(".rds", ".xz")  # Possible file extensions


# Function to check file existence and return the first match
find_file_with_extension <- function(path, object_name, extensions) {
  for (ext in extensions) {
    full_filename <- paste0(object_name, ext)
    if (file.exists(file.path(path, full_filename))) {
      return(full_filename)
    }
  }
  return(NULL)  # Return NULL if no file is found
}

# Main processing function
process_data <- function(path, object_name) {
  # Check and set working directory
  if (getwd() != path) {
    warning("Current working directory does not match path4read.")
  } else {
    cat("Current working directory matches path4read.\n")
  }
  
  # Find the data file with the correct extension
  filename2read <- find_file_with_extension(path, object_name, filename.extensions)
  cat("Filename to read: ", filename2read, "\n")
  
  if (!is.null(filename2read)) {
    # Assuming env.custom$fun.path_files_size is a function to print file sizes
    env.custom$fun.path_files_size(path4read = path, regex4filename = filename2read)
    
    # Read the data file and measure the time taken
    filepath <- file.path(path, filename2read)
    time_taken <- system.time({
      data <- readRDS(filepath)
    })
    cat("Time taken to read data: ", time_taken, " seconds\n")
    
    # Data inspection and manipulation
    cat("Dimensions of the data: ", dim(data), "\n")
    cat("Number of distinct PERSON_ID values: ", n_distinct(data$PERSON_ID), "\n")
    cat("Number of distinct RN_INDI values: ", n_distinct(data$RN_INDI), "\n")
    cat("Column names: ", paste(names(data), collapse = ", "), "\n")
    
    # Structured summary of the data
    str(data, max.level = 2, give.attr = FALSE)
    
    # Convert to tibble and display
    tibble_data <- as_tibble(data)
    print(tibble_data)
    
    # Display the last few rows
    tail(data)
  } else {
    cat("No file found for reading.\n")
  }
}

# Run the main processing function with the specified path and object name
process_data(path4read, objectname)
