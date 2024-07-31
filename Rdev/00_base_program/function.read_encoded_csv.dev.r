# function.read_encoded_csv.dev.r

library(tidyverse)
library(readr)
# > duplicate_ID92_190320 <- read_csv("G:/My Drive/duplicate_ID92_190320.txt")
# Parsed with column specification:
# cols(
#   `-` = col_logical()
# )
# Warning: 668 parsing failures.
# row col           expected actual                                    file
#   1   - 1/0/T/F/TRUE/FALSE        'G:/My Drive/duplicate_ID92_190320.txt'
#   2   - 1/0/T/F/TRUE/FALSE        'G:/My Drive/duplicate_ID92_190320.txt'
#   3   - 1/0/T/F/TRUE/FALSE        'G:/My Drive/duplicate_ID92_190320.txt'
#   4   - 1/0/T/F/TRUE/FALSE        'G:/My Drive/duplicate_ID92_190320.txt'
#   5   - 1/0/T/F/TRUE/FALSE        'G:/My Drive/duplicate_ID92_190320.txt'
# ... ... .................. ...... .......................................
# See problems(...) for more details.

# > View(duplicate_ID92_190320)
# > duplicate_ID92_190320 <- read.table("G:/My Drive/duplicate_ID92_190320.txt", header=TRUE, quote="\"")



duplicate_ID92_190320 <- read_lines("G:/My Drive/duplicate_ID92_190320.txt")
duplicate_ID92_190320 |> str() #----


# ?read_lines
duplicate_ID92_190320 <- read_lines("d:/duplicate_ID92_190320.txt")
duplicate_ID92_190320 |> str() #----
# > duplicate_ID92_190320 |> str() #----  
#  chr [1:649] "-" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ...


duplicate_ID92_190320 <- read_lines("d:/duplicate_ID92_190320.txt", locale = locale(encoding = "CP949"))
duplicate_ID92_190320 |> str() #----
vignette("locales")



# https://ericeikrem.com/r-blog/r-dealing-with-file-encodings-using-readrguess_encoding-and-stringistri_enc_detect/

read_encoded_csv <- function(file_to_read,file_encoding) {
  out <- tryCatch(
    {
      message("Trying encoding")
      read.csv(file_to_read, header=TRUE, sep=",", fileEncoding=file_encoding, dec=".")
    },
    error=function(cond) {
      message(paste("Encoding doesn't seem to work:", file_encoding))
      message("Here's the original error message:")
      message(cond)
      # Return value in case of error
      return(NA)
    },
    warning=function(cond) {
      message(paste("Encoding caused a warning:", file_encoding))
      message("Here's the original warning message:")
      message(cond)
      # Return value in case of warning
      return(NULL)
    },
    finally={ 
      message("\n")
      message(paste("Processed file:", file_to_read))
      message(paste("Processed encoding:", file_encoding))
    }
  )    
  return(out)
}




# Guessing The Encoding
# If we use guess_encoding from the readr-package, combined with knowledge of the encoding that the files are most likely to have, we can use something like this:

determine_encoding <- function(file_to_read,encodings_probable) {
  message(paste("DETERMINE ENCODING FOR NEW FILE: "), file_to_read)
  encoding_used <- ""
  encodings_guessed <- guess_encoding(file_to_read)[["encoding"]]
  encodings_all <- c("UTF-8","UTF-16BE","UTF-16LE","UTF-32BE","UTF-32LE",
                    "Shift_JIS","ISO-2022-JP","ISO-2022-CN","ISO-2022-KR",
                    "GB18030","Big5","EUC-JP","EUC-KR","ISO-8859-1","ISO-8859-2",
                    "ISO-8859-5","ISO-8859-6","ISO-8859-7","ISO-8859-8",
                    "ISO-8859-9","windows-1250","windows-1251","windows-1252",
                    "windows-1253","windows-1254","windows-1255","windows-1256",
                    "KOI8-R","IBM420","IBM424")
  for(encoding_guessed in encodings_guessed) {
    print(encoding_guessed)
    print(encodings_guessed)
    if(encoding_guessed %in% encodings_probable){
      t <- read_encoded_csv(file_to_read,encoding_guessed)
      if(reading_makes_sense(t)) {
        encoding_used <- encoding_guessed
        break()
      }
    }
  }
  if (encoding_used == "") {
    for (encoding_probable in encodings_probable) {
      t <- read_encoded_csv(file_to_read,encoding_probable)
      if(reading_makes_sense(t)) {
        encoding_used <- encoding_probable
        break()
      }
    }
  }
  if (encoding_used == "") {
    for (encoding_all in encodings_all) {
      t <- read_encoded_csv(file_to_read,encoding_all)
      if(reading_makes_sense(t)) {
        encoding_used <- encoding_all
        break()
      }
    }
  }
  return(encoding_used)
}



reading_makes_sense <- function(content_read) {
  out <- 
    (
    is.data.frame(content_read) &&
    nrow(content_read) > 0 &&
    ncol(content_read) > 0
    )
  
  return(out)
}


files <- list.files(path="data-original", pattern="*.csv", 
                    full.names=T, recursive=TRUE)
encodings_probable <- c("UTF-8","UTF-16LE")
lapply(files, function(x) {
  file_encoding <- determine_encoding(x,encodings_probable)
  message(paste("Determined encoding: ", file_encoding))
  if (file_encoding != "") {
    t <- read_encoded_csv(x,file_encoding)
    # apply function
    out <- dim(t)
  } else (out <- "No encoding found!")
  # write to file
  write.table(out, file = "data/test.txt", append = TRUE, 
              sep="\t", quote=F, row.names=T, col.names=x)
  rm(t)
})


