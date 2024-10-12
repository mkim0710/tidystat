# https://chatgpt.com/c/66feb

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## env1\$env.internal\$f_path.df_dirs_recursive.df_files() ----  
# .sourcename = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
# env1$path$df_dirs_recursive.df_files = env1$env.internal$f_path.df_dirs_recursive.df_files(input_path=env1$path$path1, print.message=FALSE)
# env1$path$df_dirs_recursive.df_files$path |> unique() |> paste0(collapse = "\n") |> cat("  \n", sep="")
# env1$path$df_dirs_recursive.df_files |> dplyr::filter(path.level <= 2) |> dplyr::select(print_tree_path_files.codes) |> unlist() |> paste(collapse="") |> cat("  \n", sep="")
# # Rdev
# # Rdev/-dev
# # Rdev/00_base_program
# # Rdev/00_protocol
# # Rdev/00_protocol/01_sample_size
# # Rdev/00_protocol/05_count_eligible
# # Rdev/00_protocol/06_count_exposure
# # Rdev/00_protocol/07_count_outcome
# # Rdev/10_import_clean_datatype
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
# # Rdev/50_model_formula_evaluation
# # Rdev/50_model_formula_evaluation/51_model_formula
# # Rdev/50_model_formula_evaluation/53_model_selection
# # Rdev/50_model_formula_evaluation/55_model_weighted
# # Rdev/50_model_formula_evaluation/56_model_bootstrap
# # Rdev/50_model_formula_evaluation/57_model_time2event
# # Rdev/50_model_formula_evaluation/57_model_trajectory
# # Rdev/50_model_formula_evaluation/59_model_evaluation
# # Rdev/60_communicate_report_export
#|________________________________________________________________________________|#  
cat("> .tmp |> str(max.level = 1, give.attr = FALSE)", "  \n", sep="") 
.tmp |> str(max.level = 1, give.attr = FALSE)
cat("> env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)", "  \n", sep="") 
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
## env0 = env1 ----
env0 = env1
## \% survival::lung |> 

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_formula.lhs_rhs_vars =  ----
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
    # library(survival)
    # MetaData$ModelList$time2event = NULL
    # MetaData$ModelList$time2event$formula = Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    #
    # MetaData$ModelList$time2event = MetaData$ModelList$time2event %>% c(.$formula |> env1$f$f_formula.lhs_rhs_vars(include_input_in_output = FALSE))
    # MetaData$ModelList$time2event %>% str(max.level = 1, give.attr = F)
    # # List of 7
    # #  $ formula :Class 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ terms   :Classes 'terms', 'formula'  language Surv(time = time2event, event = event) ~ Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ all.vars: chr [1:6] "time2event" "event" "Group" "StudyPopulation" ...
    # #  $ lhs     : language Surv(time = time2event, event = event)
    # #  $ lhs.vars: chr [1:2] "time2event" "event"
    # #  $ rhs     : language Group + StudyPopulation + A00_SEX + A01_AGE
    # #  $ rhs.vars: chr [1:4] "Group" "StudyPopulation" "A00_SEX" "A01_AGE"
}
### @ f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ----
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
#### env1$path$.subpath.filename.source.r ----  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.subpath = env1$path$CurrentSource.path.filename.ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.sourcename_root = env1$path$CurrentSource.path.filename.ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename_root" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.subpath = .subpath
if(!exists(".sourcename_root") && exists(".sourcename")) .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
.sourcename = .sourcename_root |> paste0(".source.r")
env1$path$.sourcename_root = .sourcename_root
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".source.r")
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# env1 = env0
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
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
.path.file = paste0(.path4write, "/", "pubmed_obesity_epidemiology_detailed.csv")
write.csv(detailed_pubmed_data, .path.file, row.names = FALSE)
paste0( "git add -f ",shQuote(.path.file) ) |> system(intern=TRUE)

# View the first few rows
head(detailed_pubmed_data)



###### \% |> () ----  



###### \% |> () ----  



###### \% |> () ----  








#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds"))) ----  
.path4write = env1$path$.path4write
# MetaData$DataSetNames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
cat("    ========================================================================    \n")
for (.objectname in names(MetaData$DataSetNames)) {
    assign(.objectname, structure(get(.objectname), MetaData = MetaData))
    .path.file = paste0(.path4write,"/",.objectname,".rds",".xz")
    cat(.objectname, ' |> write_rds(',shQuote(.path.file),', compress = "xz", compression = 9) |> system.time()', "  \n", sep="")
    cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, execute_code = FALSE)
    cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
}
# #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# .path.filename.xlsx = paste0(.path4write,"/",.objectname,".xlsx")
# system.time(openxlsx2::write_xlsx(get(.objectname), file=.path.filename.xlsx, as_table=TRUE))
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(.path.filename.xlsx)
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

