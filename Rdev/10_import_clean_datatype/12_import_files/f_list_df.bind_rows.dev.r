# objectname = "f_list_df.bind_rows"
# f_list_df.bind_rows.dev.r
# f_list_df.bind_rows.source.r
#         https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_files/f_list_df.bind_rows.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/Rdev/10_import_clean_datatype/12_import_files/f_list_df.bind_rows.source.r")
####################################################################################################
# objectname = "f_list_df.bind_rows"
# cat("# ", 'objectname = "', objectname, '"', "\n",
#     "# ", objectname, ".dev.r", "\n",
#     "# ", objectname, ".source.r", "\n",
#     "#         https://github.com/mkim0710/tidystat/blob/master/", "Rdev/10_import_clean_datatype/12_import_files/" objectname, ".dev.r", "\n",
#     '# source("https://github.com/mkim0710/tidystat/raw/master/', "Rdev/10_import_clean_datatype/12_import_files/", objectname, '.source.r")', "\n",
#     sep="")
# rstudioapi::navigateToFile(paste0(objectname,".source.r"))
# rstudioapi::navigateToFile(paste0(objectname,".dev.r"))


library(tidyverse)

# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep="")};
}
#@ for (env.custom.dependancy in c("")) { -----
for (env.custom.dependancy in c("f_df.tribble_construct")) {
    if(!env.custom.dependancy %in% names(env.custom)) {
        if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
        objectname = env.custom.dependancy
        source(file.path(file.path(env.custom$path$source_base_local,""), paste0(objectname,".source.r")))
    }
}


objectname = "f_list_df.bind_rows"
object = function(list_df) {
    which.classNotAllEqual = list_df %>% map(function(df) {df %>% map_chr(class)}) %>% as.data.frame %>% mutate(AllEqual = apply(., 1, function(x) {all(x == x[1])})) %>% {which(.$AllEqual == FALSE)}
    list_df2 = list_df %>% map(function(df) {
        df[which.classNotAllEqual] = df[which.classNotAllEqual] %>% map_df(as.character)
        attr(df, "which.classNotAllEqual") = which.classNotAllEqual
        df
    })
    list_df2 %>% reduce(bind_rows)
}    
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$", objectname, "()\n", sep=""); get(objectname, envir = env.custom)() # Run the loaded function by default
}

# > Morticd10 = Morticd10_list %>% f_list_df.bind_rows
# > Morticd10 %>% str
# spc_tbl_ [4,930,305 × 39] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#  $ Country   : num [1:4930305] 1400 1400 1400 1400 1400 1400 1400 1400 1400 1400 ...
#  $ Admin1    : chr [1:4930305] NA NA NA NA ...
#  $ SubDiv    : chr [1:4930305] NA NA NA NA ...
#  $ Year      : num [1:4930305] 2001 2001 2001 2001 2001 ...
#  $ List      : chr [1:4930305] "101" "101" "101" "101" ...
#  $ Cause     : chr [1:4930305] "1000" "1000" "1001" "1001" ...
#  $ Sex       : num [1:4930305] 1 2 1 2 1 2 1 2 1 2 ...
#  $ Frmat     : chr [1:4930305] "07" "07" "07" "07" ...
#  $ IM_Frmat  : chr [1:4930305] "08" "08" "08" "08" ...
#  $ Deaths1   : num [1:4930305] 332 222 24 14 0 0 0 0 0 0 ...
#  $ Deaths2   : num [1:4930305] 8 11 0 0 0 0 0 0 0 0 ...
#  $ Deaths3   : num [1:4930305] 2 1 0 0 0 0 0 0 0 0 ...
#  $ Deaths4   : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths5   : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths6   : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths7   : num [1:4930305] 1 1 0 0 0 0 0 0 0 0 ...
#  $ Deaths8   : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths9   : num [1:4930305] 9 1 1 0 0 0 0 0 0 0 ...
#  $ Deaths10  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths11  : num [1:4930305] 21 2 3 0 0 0 0 0 0 0 ...
#  $ Deaths12  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths13  : num [1:4930305] 36 12 7 3 0 0 0 0 0 0 ...
#  $ Deaths14  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths15  : num [1:4930305] 39 13 2 1 0 0 0 0 0 0 ...
#  $ Deaths16  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths17  : num [1:4930305] 53 21 3 4 0 0 0 0 0 0 ...
#  $ Deaths18  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths19  : num [1:4930305] 68 48 3 0 0 0 0 0 0 0 ...
#  $ Deaths20  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths21  : num [1:4930305] 95 112 5 6 0 0 0 0 0 0 ...
#  $ Deaths22  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths23  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths24  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths25  : num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ Deaths26  : num [1:4930305] 0 0 0 0 0 0 0 0 0 0 ...
#  $ IM_Deaths1: num [1:4930305] 8 11 0 0 0 0 0 0 0 0 ...
#  $ IM_Deaths2: num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ IM_Deaths3: num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  $ IM_Deaths4: num [1:4930305] NA NA NA NA NA NA NA NA NA NA ...
#  - attr(*, "spec")=
#   .. cols(
#   ..   Country = col_double(),
#   ..   Admin1 = col_double(),
#   ..   SubDiv = col_logical(),
#   ..   Year = col_double(),
#   ..   List = col_character(),
#   ..   Cause = col_character(),
#   ..   Sex = col_double(),
#   ..   Frmat = col_character(),
#   ..   IM_Frmat = col_character(),
#   ..   Deaths1 = col_double(),
#   ..   Deaths2 = col_double(),
#   ..   Deaths3 = col_double(),
#   ..   Deaths4 = col_double(),
#   ..   Deaths5 = col_double(),
#   ..   Deaths6 = col_double(),
#   ..   Deaths7 = col_double(),
#   ..   Deaths8 = col_double(),
#   ..   Deaths9 = col_double(),
#   ..   Deaths10 = col_double(),
#   ..   Deaths11 = col_double(),
#   ..   Deaths12 = col_double(),
#   ..   Deaths13 = col_double(),
#   ..   Deaths14 = col_double(),
#   ..   Deaths15 = col_double(),
#   ..   Deaths16 = col_double(),
#   ..   Deaths17 = col_double(),
#   ..   Deaths18 = col_double(),
#   ..   Deaths19 = col_double(),
#   ..   Deaths20 = col_double(),
#   ..   Deaths21 = col_double(),
#   ..   Deaths22 = col_double(),
#   ..   Deaths23 = col_double(),
#   ..   Deaths24 = col_double(),
#   ..   Deaths25 = col_double(),
#   ..   Deaths26 = col_double(),
#   ..   IM_Deaths1 = col_double(),
#   ..   IM_Deaths2 = col_double(),
#   ..   IM_Deaths3 = col_double(),
#   ..   IM_Deaths4 = col_double()
#   .. )
#  - attr(*, "problems")=<externalptr> 
#  - attr(*, "which.classNotAllEqual")= Named int [1:3] 2 3 5
#   ..- attr(*, "names")= chr [1:3] "Admin1" "SubDiv" "List"

#@ end -----



library(dplyr)
library(purrr)

# Custom function to identify and standardize data types across all data frames
standardize_data_types <- function(list_df) {
  # Check classes across the data frames
  class_df <- map_df(list_df, ~sapply(., class), .id = "Part")
  
  # Find the most common class for each column and create a map for conversion
  common_class <- apply(class_df[-1], 1, function(x) {
    uniq_x <- unique(x)
    if (length(uniq_x) == 1) {
      return(uniq_x)
    } else {
      # Assuming numeric and character are the most common conflicts
      if ("character" %in% uniq_x) {
        return("character")
      } else {
        return("numeric")
      }
    }
  })
  
  # Apply conversions based on the most common class
  list_df <- map(list_df, function(df) {
    for (col in names(common_class)) {
      if (common_class[col] == "character" && !inherits(df[[col]], "character")) {
        df[[col]] <- as.character(df[[col]])
      } else if (common_class[col] == "numeric" && !inherits(df[[col]], "numeric")) {
        df[[col]] <- as.numeric(df[[col]])
      }
    }
    return(df)
  })
  
  return(list_df)
}

# Function to bind rows from list of data frames
bind_rows_standardized <- function(list_df) {
  list_df <- standardize_data_types(list_df)
  bind_rows(list_df)
}

# Sample usage with Morticd10_list
Morticd10 <- bind_rows_standardized(Morticd10_list)

# Print the structure of the final data frame
str(Morticd10)

