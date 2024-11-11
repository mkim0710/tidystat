##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
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
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ ./ -----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##@ .Rprofile.dev.r -----
# https://chatgpt.com/c/66f10f41-74a8-800e-aa53-a5b4410ee12a

# Get current R version and determine user library path dynamically
r_version <- paste0(R.version$major, ".", R.version$minor)
user_lib <- switch(.Platform$OS.type,
                   "windows" = file.path(Sys.getenv("USERPROFILE"), "Documents", "R", "win-library", r_version),
                   file.path(Sys.getenv("HOME"), "R", paste0(ifelse(.Platform$OS.type == "unix", Sys.info()["machine"], "x86_64-pc-linux-gnu"), "-library"), r_version))

# Set library path if system library is not writable
if (!file.access(.libPaths()[1], 2) == 0) {
  dir.create(user_lib, recursive = TRUE, showWarnings = FALSE)
  .libPaths(c(user_lib, .libPaths()))
}

# Function to ensure a package is installed and loaded
ensure_package <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg, repos = "https://cloud.r-project.org")
  library(pkg, character.only = TRUE)
}

# Ensure tidyverse is installed and loaded
ensure_package("tidyverse")



##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/ ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##@ f_clipboard_path_BackSlash.to_URL.dev.r ----


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##@ f_file.encrypt_hybrid.dev.r ----

##@ f_path.zip.dev.r ----

##@ flowchart_inclusion_exclusions.dev.r ----

##@ function.detachAllPackages.dev.r ----


##@ function.tensor_product.dev.r ----






##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/00_base_program/ ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##@ f_chr_utf8.ToInt.dev.Rmd ---- 

##@ f_path.escape_special_characters.dev.Rmd ----

##@ f_CodeText.eval_cat.dev.r ----

##@ f_expression.substitute_echo_and_dput.source.r ----

##@ f_filename.unix_find_path_local.dev.r ----
##@ f_font.tlmgr_installed.dev.r ----
##@ f_font_regex_perl.search_TeXLiveDB.dev.r ----

##@ f_lgl.not_and_or.dev.r ----
##@ f_list.dput_line_by_line.dev.r ----
##@ f_list.substitute.deparse.dev.Rmd ----

##@ f_password.encrypt.dev.r ----
##@ f_password.encrypt-PowerShell.r ----

##@ f_RegEx.NegativeLookbehind.dev.g.Rmd ----

##@ f_session_recover.dev.r ----
##@ f_session_recover.RsRecovr.r ----

##@ f_URL.GET_content.dev.r ----

##@ f_vec_lgl.all_not.dev.r ----
##@ f_VarName.RegEx.dev.Rmd ----
##@ f_vec.dput_line_by_line.dev.r ----

##@ function.calculate_mode.dev.r ----
##@ function.convert_to_standard_name.dev.r ----
##@ function.deparse.cat.width.dev.r ----
##@ function.parse.eval.Vectorize.dev.r ----
##@ function.frequencyDF.dev.r ----
##@ function.hangul.dev -tmp.r ----
##@ function.iconv.dev.r ----
##@ function.pipe.dev.r ----
##@ function.read_encoded_csv.dev.r ----
##@ function.readClipboard.dev.r ----
##@ function.str2.longest_common_prefix.dev.r ----
##@ function.text2quo.dev.r ----

##@ print_environment_hierarchy.dev.r ----
##@ print_namespace.dev.r ----





##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/10_import_clean_datatype/16_categorical_factor/ ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##@ f_chr_rounded_number.replace.source.r -----
.tmp$objectname = "f_chr_rounded_number.replace"
.tmp$object = function(text) {
  # Define the mapping of Unicode characters to regular numbers
  unicode_to_number <- c(
    # Parenthesized Numbers
    "\u2460" = "1", "\u2461" = "2", "\u2462" = "3", "\u2463" = "4", "\u2464" = "5",
    "\u2465" = "6", "\u2466" = "7", "\u2467" = "8", "\u2468" = "9", "\u2469" = "10",
    "\u246A" = "11", "\u246B" = "12", "\u246C" = "13", "\u246D" = "14", "\u246E" = "15",
    "\u246F" = "16", "\u2470" = "17", "\u2471" = "18", "\u2472" = "19", "\u2473" = "20",
    
    # Circled Numbers
    "\u24EA" = "0", "\u2460" = "1", "\u2461" = "2", "\u2462" = "3", "\u2463" = "4",
    "\u2464" = "5", "\u2465" = "6", "\u2466" = "7", "\u2467" = "8", "\u2468" = "9",
    "\u2469" = "10", "\u246A" = "11", "\u246B" = "12", "\u246C" = "13", "\u246D" = "14",
    "\u246E" = "15", "\u246F" = "16", "\u2470" = "17", "\u2471" = "18", "\u2472" = "19",
    "\u2473" = "20",
    
    # Negative Circled Numbers
    "\u2776" = "1", "\u2777" = "2", "\u2778" = "3", "\u2779" = "4", "\u277A" = "5",
    "\u277B" = "6", "\u277C" = "7", "\u277D" = "8", "\u277E" = "9", "\u277F" = "10",
    
    # Double Circled Numbers
    "\u24F5" = "1", "\u24F6" = "2", "\u24F7" = "3", "\u24F8" = "4", "\u24F9" = "5",
    "\u24FA" = "6", "\u24FB" = "7", "\u24FC" = "8", "\u24FD" = "9", "\u24FE" = "10",
    
    # Dingbat Circled Numbers
    "\u2780" = "1", "\u2781" = "2", "\u2782" = "3", "\u2783" = "4", "\u2784" = "5",
    "\u2785" = "6", "\u2786" = "7", "\u2787" = "8", "\u2788" = "9", "\u2789" = "10",
    
    # Fullwidth Numbers
    "\uFF10" = "0", "\uFF11" = "1", "\uFF12" = "2", "\uFF13" = "3", "\uFF14" = "4",
    "\uFF15" = "5", "\uFF16" = "6", "\uFF17" = "7", "\uFF18" = "8", "\uFF19" = "9"
  )
  
  # Convert each character in the text to its corresponding number if it matches the mapping
  replaced_text <- sapply(strsplit(text, NULL)[[1]], function(char) {
    if (char %in% names(unicode_to_number)) {
      unicode_to_number[[char]]
    } else {
      char
    }
  })
  
  # Combine the replaced characters back into a single string
  return(paste(replaced_text, collapse = ""))
}






##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/20_tidy_group_by_match/ ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##@ f_Metadata_CodeToCreateDataSet.parse_eval.dev.Rmd -----
##@ f_Metadata_CodeToCreateDataSet.parse_eval.dev-GPT-pending.Rmd -----
##@ f_Metadata_CodeToCreateDataSet.parse_eval.dev-Gemini-pending.Rmd -----





##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/50_model_formula_evaluation/52_model_estimation/ ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% trainset_cost.gradient_descent.dev-GPT.Rmd -----  
.subpath_filename.r = "Rdev/50_model_formula_evaluation/52_model_estimation/trainset_cost.gradient_descent.dev-GPT.Rmd"
.subpath_filename.r |> dirname() |> cat("\n"); .subpath_filename.r |> basename() |> cat("\n");
file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext))




##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/50_model_formula_evaluation/53_model_selection/ ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% trainset.cv.glm.dev-GPT.Rmd -----  
.subpath_filename.r = "Rdev/50_model_formula_evaluation/53_model_selection/trainset.cv.glm.dev-GPT.Rmd"
.subpath_filename.r |> dirname() |> cat("\n"); .subpath_filename.r |> basename() |> cat("\n");
file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext))




##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@ Rdev/50_model_formula_evaluation/56_model_bootstrap/ ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% f_DataSet.SMOTE.dev-GPT.Rmd -----  
.subpath_filename.r = "Rdev/50_model_formula_evaluation/56_model_bootstrap/f_DataSet.SMOTE.dev-GPT.Rmd"
.subpath_filename.r |> dirname() |> cat("\n"); .subpath_filename.r |> basename() |> cat("\n");
file.path(env1$path$source_base, .subpath_filename.r) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$lastSourceEditorContext.path_filename.ext)) if(env1$path$lastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$lastSourceEditorContext.path_filename.ext))




##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#@@  ----
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

##@ function.df_lgl.VennDiagram -dev1.Rmd ----





##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#@@ END ----
system('git add -f "data/ATC_RxNorm_NDC.rds.xz"')
system('git add -f "data/CDMv5_CONCEPT.rds.xz"')
system('git add -f "data/CMS_SynPUF_CDMv5.rds.xz"')
system('git add -f "data/ATC_RxNorm_NDC.rds.xz"')
system('git add -f "data/CDMv5_CONCEPT.rds.xz"')
system('git add -f "data/CMS_SynPUF_CDMv5.rds.xz"')

