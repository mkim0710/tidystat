# https://chatgpt.com/c/66feb

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .filename.source.r = "function.detachAllPackages" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = env1$f$f_path_file.paste0_collapse_if_not_empty(.relative.subpath, .filename.source.r))
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .filename.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .relative.subpath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = env1$f$f_path_file.paste0_collapse_if_not_empty(.relative.subpath, .filename.source.r))
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_base_program/001_base_file
# # Rdev/00_base_program/002_base_encoding_RegEx
# # Rdev/00_base_program/004_base_environment
# # Rdev/00_base_program/005_base_object
# # Rdev/00_base_program/007_base_expression
# # Rdev/00_base_program/009_base_computation
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/10_import_clean_datatype
# # Rdev/10_import_clean_datatype/11_literature
# # Rdev/10_import_clean_datatype/11_metadata
# # Rdev/10_import_clean_datatype/12_import_files
# # Rdev/10_import_clean_datatype/12_import_sqlite
# # Rdev/10_import_clean_datatype/12_import_vocabulary
# # Rdev/10_import_clean_datatype/13_duplicated
# # Rdev/10_import_clean_datatype/13_missing_value
# # Rdev/10_import_clean_datatype/13_split_fold
# # Rdev/10_import_clean_datatype/15_cleaning_text
# # Rdev/10_import_clean_datatype/15_cleaning_time
# # Rdev/10_import_clean_datatype/16_categorical_factor
# # Rdev/10_import_clean_datatype/16_categorical_labelled
# # Rdev/10_import_clean_datatype/17_categorical_indicators
# # Rdev/10_import_clean_datatype/18_dichotomous_logical
# # Rdev/10_import_clean_datatype/19_datetime
# # Rdev/10_import_clean_datatype/19_numeric_integer
# # Rdev/10_import_clean_datatype/array_list
# # Rdev/20_tidy_group_by_match
# # Rdev/20_tidy_group_by_match/23_group_by_PersonID
# # Rdev/20_tidy_group_by_match/25_study_population
# # Rdev/20_tidy_group_by_match/27_match
# # Rdev/30_transform_scale_categorical
# # Rdev/40_visualize_explore_bivariate_stratified
# # Rdev/40_visualize_explore_bivariate_stratified/43_network
# # Rdev/40_visualize_explore_bivariate_stratified/44_map
# # Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# # Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# # Rdev/40_visualize_explore_bivariate_stratified/49_time
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/52_model_estimation
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
# # Rdev/Rmd
# # Rdev/examples
# # Rdev/others
# # Rdev/others/Batch
# # Rdev/others/VBA
# # data
# # git
# # git/hooks
# # git/hooks/sample
# # rstudio-prefs
# # rstudio-prefs/Rocker
# # rstudio-prefs/VScode-R
# # rstudio-prefs/fonts
# # rstudio-prefs/templates
# # rstudio-prefs/themes
# # rstudio-prefs/themes/GitHub 
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ REFERENCES) ----  
##  ----  
## 
## 
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ DATA) example ----  
## \$ ADS_time2event =  ----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# suppressPackageStartupMessages(library(survival))
for(.packagename in c("survminer")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
# ?survival::lung
.objectname = DSN = "ADS_time2event"
assign(
    DSN, 
    survival::lung |> as_tibble() |> mutate(event = as.logical(status-1), Group = c("Male", "Female")[sex] |> as.factor(), StudyPopulation = time >= 30) |>
        # dplyr::select(-status, -sex)
        dplyr::select(-status)
)
ADS_time2event %>% {cat(" > ",deparse(substitute(.))," |> as_tibble() |> print()","  \n", sep=""); print(as_tibble(.))}
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
## env0 = env1 ----
env0 = env1


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .relative.subpath, .filename.source.r ======  
#### env1$path$.relative.subpath_filename.source.r ----  
# .relative.subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") {.relative.subpath = env1$path$LastSourceEditorContext.path_filename_ext |> dirname() |> env1$f$f_path.relative(); ".relative.subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# if(.relative.subpath!="") .relative.subpath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .filename.source.r = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") {.sourcename_root = env1$path$LastSourceEditorContext.path_filename_ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename_root" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.relative.subpath = .relative.subpath
if(!exists(".sourcename_root") && exists(".filename.source.r")) .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
.filename.source.r = .sourcename_root |> paste0(".source.r")
env1$path$.sourcename_root = .sourcename_root
env1$path$.relative.subpath_filename.dev.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.relative.subpath_filename.dev.Rmd = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".source.r")
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.relative.subpath_filename.dev.r, "----  \n",
    "#### ",env1$path$.relative.subpath_filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.relative.subpath_filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.relative.subpath_filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.dev.Rmd,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.relative.subpath_filename.source.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% source( file.path(env1$path$source_base,.relative.subpath_filename.source.r) ) ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.relative.subpath_filename.source.r = env1$f$f_path_file.paste0_collapse_if_not_empty(.relative.subpath, .filename.source.r))

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Not Yet included in env1$env.internal.source.r ----
## ->> Not Yet included in f_df.t.tribble_construct.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_formula.lhs_rhs_vars"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_formula.lhs_rhs_vars =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/f_formula.lhs_rhs_vars.dev.Rmd
.tmp$objectname = "f_formula.lhs_rhs_vars"
.tmp$object = function(formula, include_input_in_output = TRUE) {
    return.list = list()
    if(include_input_in_output) return.list$formula = formula
    return.list$terms = formula |> terms()
    return.list$all.vars = formula |> all.vars()
    return.list$lhs = formula[[2]]
    return.list$lhs.vars = formula[[2]] |> all.vars()
    return.list$rhs = formula[[3]]
    return.list$rhs.vars = formula[[3]] |> all.vars()
    return(return.list)

    # ## \% \%>\% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # .subsublistname = "time2event"; .sublistname = "ModelList"; .parentname = "MetaData"; if(!.subsublistname %in% names(.GlobalEnv[[.parentname]][[.sublistname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
    #
    # .packagename = "survival"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    # MetaData$ModelList$time2event = NULL
    # MetaData$ModelList$time2event$formula = Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    #
    # MetaData$ModelList$time2event = MetaData$ModelList$time2event %>% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # MetaData$ModelList$time2event |> str(max.level = 1, give.attr = F)
    # # List of 7
    # #  $ formula :Class 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ terms   :Classes 'terms', 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ all.vars: chr [1:6] "time2event" "event" "Group" "StudyPopulation" ...
    # #  $ lhs     : language Surv(time = time2event, event = event)
    # #  $ lhs.vars: chr [1:2] "time2event" "event"
    # #  $ rhs     : language Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ rhs.vars: chr [1:4] "Group" "StudyPopulation" "A00_SEX" "A01_AGE"
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


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
.path_file = paste0(.path4write, "/", "pubmed_obesity_epidemiology_detailed.csv")
write.csv(detailed_pubmed_data, .path_file, row.names = FALSE)
paste0( "git add -f ",shQuote(.path_file) ) |> system(intern=TRUE)

# View the first few rows
head(detailed_pubmed_data)



###### \% |> () ----  



###### \% |> () ----  



###### \% |> () ----  








# __________|------  
## @ write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") ----
if (Sys.getenv("PARENT_RENDERING") != "YES") {    
    .path4write = .path4write %>% str_replace(fixed(env1$path$path1), "") %>% str_replace("^/", "")  # [][Rproject] makes an error in git bash
    if(exists("MetaData") && !is.null(unlist(MetaData))) {
        # MetaData$DSNs |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
        cat("    ________________________________________________________________________    \n")
        for (DSN in names(MetaData$DSNs)) {    
            if(exists(DSN)) {
                assign(DSN, structure(get(DSN, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                if(is.null(attributes(.GlobalEnv[[DSN]])$DSN)) attributes(.GlobalEnv[[DSN]])$DSN = DSN
                if(attributes(.GlobalEnv[[DSN]])$DSN != DSN) attributes(.GlobalEnv[[DSN]])$DSN = DSN
                if (!is.null(attributes(attributes(.GlobalEnv[[DSN]])$DSN)$.path_file)) {
                    message( "attributes(attributes(",DSN,")$DSN)$.path_file == ",deparse(attributes(attributes(get(DSN))$DSN)$.path_file) )
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSN, .path_file = attributes(attributes(.GlobalEnv[[DSN]])$DSN)$.path_file, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                } else {
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSN, .path4write = .path4write, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                }
            } else {  message("!exists(",deparse(DSN),")")  }
            cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
        }
    }
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_filename.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_filename.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_filename.xlsx) else openxlsx2::xl_open(.path_filename.xlsx)
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_filename.UTF8BOM.csv = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8BOM.csv")
    # if (Sys.info()["sysname"] == "Windows") {
    #     readr::write_excel_csv(get(.objectname), file = .path_filename.UTF8BOM.csv) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    #     openxlsx2::xl_open(.path_filename.xlsx)
    # } else {
    #     readr::write_excel_csv(get(.objectname), file = .path_filename.UTF8BOM.csv|>paste0(".xz")) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    # }
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_filename.UTF8.csv.xz = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8.csv.xz")
    # readr::write_csv(get(.objectname), file = .path_filename.UTF8.csv.xz) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
}
if (Sys.getenv("PARENT_RENDERING") != "YES") {
    
}
##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

