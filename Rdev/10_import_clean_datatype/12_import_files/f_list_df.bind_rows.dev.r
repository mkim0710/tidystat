# objectname = "f_list_df.bind_rows"
# f_list_df.bind_rows.dev.r
# f_list_df.bind_rows.source.r
#         https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_files/f_list_df.bind_rows.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/Rdev/10_import_clean_datatype/12_import_files/f_list_df.bind_rows.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
#|________________________________________________________________________________|#  ----
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env1$path$source_base,subpath.filename.source.r) ))
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_list_df.bind_rows"
# cat("# ", 'objectname = "', objectname, '"', "\n",
#     "# ", objectname, ".dev.r", "\n",
#     "# ", objectname, ".source.r", "\n",
#     "#         https://github.com/mkim0710/tidystat/blob/master/", "Rdev/10_import_clean_datatype/12_import_files/" objectname, ".dev.r", "\n",
#     '# source("https://github.com/mkim0710/tidystat/raw/master/', "Rdev/10_import_clean_datatype/12_import_files/", objectname, '.source.r")', "\n",
#     sep="")
# file.edit(paste0(objectname,".source.r"))
# file.edit(paste0(objectname,".dev.r"))


library(tidyverse)

# if(!exists("env1", envir = .GlobalEnv)) assign("env1", new.env(), envir = .GlobalEnv)
if(!exists("env1", envir = .GlobalEnv)) assign("env1", new.env(), envir = .GlobalEnv)
# env1 = as.environment(env1)
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir = .GlobalEnv)

if(!"path" %in% names(env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
    env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)  
} 
#@ for (env1.dependancy in c("")) { -----
for (env1.dependancy in c("f_df.tribble_construct")) {
    if(!env1.dependancy %in% names(env1)) {
        if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
        sourcename = env1.dependancy
        source(file.path(env1$path$source_base,"",paste0(sourcename,".source.r")))
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
if(!objectname %in% names(env1)) {
    packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
    env1[[objectname]] = object
    # cat("> env1$",objectname,"()\n",sep=""); get(objectname, envir=env1)() # Run the loaded function by default
}

# > Morticd10 = Morticd10_list %>% f_list_df.bind_rows
# > Morticd10 |> str()
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


