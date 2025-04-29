# default.R
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# #@ The templates at source_base_github (default.R, templates-00env1.minimum.Rmd) ++++++++++++   
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
# # \% Source the source_base_github templates & check if there is no error  ~~~~~~~~~~~~  
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0(env1$path$source_base,"/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "default.R" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> source(); Sys.setenv(PARENT_RENDERING = "NO")  }
# if (Sys.getenv("PARENT_RENDERING") != "YES") {  Sys.setenv(PARENT_RENDERING = "YES"); options(expressions = 500); "templates-00env1.minimum.Rmd" %>% paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",.) |> download.file("templates-00env1.minimum-test.Rmd") ; "templates-00env1.minimum-test.Rmd" |> rmarkdown::render(output_dir = dirname(env1$path$LastSourceEditorContext.path_FileNameExt), output_format = "html_document"); Sys.setenv(PARENT_RENDERING = "NO"); "templates-00env1.minimum-test.html" |> browseURL()  }

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# env1$f$MH_shortcuts()
# env1$f$openWorkingFilesList()
# env1$f$showCodeText2restartSession.pending()
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# env1$f$showSymbolPaths()
# env1$f$showProjectPathFiles()
# env1$f$showProjectPathsRecursively()
# env1$env.internal$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ REFERENCES) ----  
##  ----  
## 
## 
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ DATA) example ----  

## \% input_vec_chr = fruit[1:8*10] ----
input_vec_chr = fruit[1:8*10]
input_vec_chr[3:7] = ""
input_vec_chr %>% dput
# > input_vec_chr %>% dput
# c("blueberry", "coconut", "", "", "", "", "", "watermelon")


## \% "env1$env.internal.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = TRUE, level4TOC = 1) ----
# "env1$env.internal.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = TRUE, level4TOC = 1) %>% dput

input_vec_chr.SECTION_removed = input_vec_chr
input_vec_chr.SECTION_extracted = 
    c("##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ", 
      "# TABLE OF CONTENTS ----  ", "#| ------------------------- < To be covered at .Rprofile >                 ...128", 
      "#| ------------------------- < If .Rprofile not available >                 ...131", 
      "# ⸿ system, environment                                                    ...189", 
      "# ⸿ f_function, f_expression, f_CodeText                                   ...345", 
      "# ⸿ f_file, f_URL, f_path                                                  ...792", 
      "# ## ::OPTION:: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.merge_with_input_vec_chr.except_TOC       ...1549", 
      "# ### (ALIAS) CurrentSourceEditorContext.str_subset.lines4heading.add_TABLE_OF_CONTENTS      ...1556", 
      "# ⸿ source()                                                               ...2308", 
      "# ## @ .FileName.source.r = \"internal.f_path0.list_path_hierarchy\" |> paste0(\".source.r\")       ...2394", 
      "# \\% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )       ...2431", 
      "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
    )

input_vec_chr = c(input_vec_chr.SECTION_extracted, input_vec_chr.SECTION_removed)
input_vec_chr %>% str
# > input_vec_chr %>% str
#  chr [1:21] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) dev -----  
## env0 = env1 ----
env0 = env1



#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## § .RelativeSubPath, .FileName.source.r ======  
#### env1$path$.RelativeSubPath_FileName.source.r ----  
# .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .RelativeSubPath = env1$path$LastSourceEditorContext.path_FileNameExt |> dirname() |> env1$f$f_path.relative()  ;    ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO()    }
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "default.template" |> paste0(".source.r")
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .SourceName_root = env1$path$LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),"")  ;    ".SourceName_root" |> env1$f$f_ObjectName.get.dput.ECHO()    }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$env.internal$showCodeText2open.FileName.source.r(.RelativeSubPath, .FileName.source.r)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) ) ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})






#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function by GPT -----  

#@ https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658de1-d780-800e-ab6e-ca18fc2fa627
#' Separate SECTION_extracted and non-SECTION_extracted Lines
#'
#' This function takes a vector of lines (e.g., from a file), along with 
#' start and end patterns for a Table of Contents (SECTION_extracted). It returns a list 
#' with two elements:
#' \itemize{
#'   \item \code{SECTION_extracted}   - lines belonging to the SECTION_extracted SECTION_extracted
#'   \item \code{SECTION_removed} - lines outside of the SECTION_extracted SECTION_extracted
#' }
#'
#' @param input_vec_chr A character vector of lines (e.g., from \code{\link{readLines}}).
#' @param RegEx4SECTION_start A regular expression pattern indicating the start of SECTION_extracted.
#' @param RegEx4SECTION_end A regular expression pattern indicating the end of SECTION_extracted.
#'
#' @return A named list with two elements: \code{SECTION_extracted} and \code{SECTION_removed}.
#' @importFrom stringr str_detect
#' @references 
#'   \href{https://cran.r-project.org/web/packages/stringr/stringr.pdf}{stringr Package Reference}
#'   \href{https://stat.ethz.ch/R-manual/R-devel/library/base/html/readLines.html}{Base R \code{readLines} Documentation}
#' @examples
#' \dontrun{
#' input_vec_chr_from_file <- readLines("path_to_your_file.txt")
#' start_ptn <- "^##H+ BEGINNING OF TABLE OF CONTENTS H+## *$"
#' end_ptn   <- "^##H+ THE END OF TABLE OF CONTENTS H+## *$"
#' result <- f_vec_chr.list_SECTION_nonSECTION(input_vec_chr_from_file, start_ptn, end_ptn)
#' }


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in f_df.t.tribble_construct.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_vec_chr.list_SECTION_nonSECTION =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.list_SECTION_nonSECTION.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.list_SECTION_nonSECTION"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, RegEx4SECTION_start = "^##H+ BEGINNING OF TABLE OF CONTENTS H+## *$", RegEx4SECTION_end = "^##H+ THE END OF TABLE OF CONTENTS H+## *$") {
    # Validate input
    if (!is.character(input_vec_chr) || length(input_vec_chr) == 0) {
        stop("Input 'input_vec_chr' must be a non-empty character vector.")
    }
    
    # Reference: https://cran.r-project.org/web/packages/stringr/stringr.pdf
    library(stringr)
    
    # Locate all start and end markers
    vec_indices.SECTION_start <- which(str_detect(input_vec_chr, RegEx4SECTION_start))
    vec_indices.SECTION_end   <- which(str_detect(input_vec_chr, RegEx4SECTION_end))
    
    if (length(vec_indices.SECTION_start) == 0 || length(vec_indices.SECTION_end) == 0) {
        # No existing SECTION_extracted markers found
        warning("No existing SECTION_extracted markers found. The entire content will be considered non-SECTION_extracted.")
        return(list(
            SECTION = character(0),
            nonSECTION = input_vec_chr
        ))
    } else {
        # Create a range from the first start marker to the last end marker
        SECTION_range <- min(vec_indices.SECTION_start):max(vec_indices.SECTION_end)
        # Extract lines belonging to the SECTION_extracted
        input_vec_chr.SECTION_extracted <- input_vec_chr[SECTION_range]
        # All other lines are non-SECTION_extracted
        input_vec_chr.SECTION_removed <- input_vec_chr[-SECTION_range]
        
        return(list(
            SECTION    = input_vec_chr.SECTION_extracted,
            nonSECTION = input_vec_chr.SECTION_removed
        ))
    }
}


env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(input_vec_chr) %>% str
# > env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(input_vec_chr) %>% str
# List of 2
#  $ SECTION   : chr [1:13] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " "#| ------------------------- < To be covered at .Rprofile >                 ...128" "#| ------------------------- < If .Rprofile not available >                 ...131" ...
#  $ nonSECTION: chr [1:8] "blueberry" "coconut" "" "" ...


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
# ⸿ END -----  
env1$f$showCodeText2openSourceInGitHub()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


