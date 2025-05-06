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
# 〚〛 REFERENCES) ----  
##  ----  
## 
## 
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 〚〛 DATA) example ----  
## \% input_vec_chr = fruit[1:8*10] ----
input_vec_chr = fruit[1:8*10]
input_vec_chr[3:7] = ""
input_vec_chr %>% dput
# > input_vec_chr %>% dput
# c("blueberry", "coconut", "", "", "", "", "", "watermelon")

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 〚〛 START) dev -----  
## env0 = env1 ----
env0 = env1


## % paste0(strrep(" ",pmax())) -----
paste0(
    input_vec_chr, 
    strrep(" ",pmax(4, width.cutoff - nchar(input_vec_chr))),
    "...", 
    1:length(input_vec_chr)
)
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] "                                                                            ...3"
# [4] "                                                                            ...4"
# [5] "                                                                            ...5"
# [6] "                                                                            ...6"
# [7] "                                                                            ...7"
# [8] "watermelon                                                                  ...8"


##@ %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))} ----
input_vec_chr %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))}
# > input_vec_chr %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))}
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] "                                                                            ...3"
# [4] "                                                                            ...4"
# [5] "                                                                            ...5"
# [6] "                                                                            ...6"
# [7] "                                                                            ...7"
# [8] "watermelon                                                                  ...8"





## % ifelse() -----
width.cutoff = 80L - 4L
ifelse(
    is.na(input_vec_chr) | input_vec_chr == "", input_vec_chr, 
    paste0(
        input_vec_chr, 
        strrep(" ",pmax(4, width.cutoff - nchar(input_vec_chr))),
        "...", 
        1:length(input_vec_chr)
    )
)
# > ifelse(
# +     is.na(input_vec_chr) | input_vec_chr == "", input_vec_chr, 
# +     paste0(
# +         input_vec_chr, 
# +         strrep(" ",pmax(4, width.cutoff - nchar(input_vec_chr))),
# +         "...", 
# +         1:length(input_vec_chr)
# +     )
# + )
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] ""                                                                                
# [4] ""                                                                                
# [5] ""                                                                                
# [6] ""                                                                                
# [7] ""                                                                                
# [8] "watermelon                                                                  ...8"





##@ input_vec_chr %>% na_if("") %>% discard(is.na) ----
input_vec_chr %>% na_if("") %>% discard(is.na)
input_vec_chr %>% na_if("") %>% discard(is.na) %>% str
# > input_vec_chr %>% na_if("") %>% discard(is.na)
# [1] "blueberry"  "coconut"    "watermelon"
# > input_vec_chr %>% na_if("") %>% discard(is.na) %>% str
#  chr [1:3] "blueberry" "coconut" "watermelon"


##@ input_vec_chr %>% na_if("") %>% na.omit() ----
input_vec_chr %>% na_if("")
input_vec_chr %>% na_if("") %>% na.omit()
input_vec_chr %>% na_if("") %>% na.omit() %>% str
# > input_vec_chr %>% na_if("")
# [1] "blueberry"  "coconut"    NA           NA           NA           NA           NA           "watermelon"
# > input_vec_chr %>% na_if("") %>% na.omit()
# [1] "blueberry"  "coconut"    "watermelon"
# attr(,"na.action")
# [1] 3 4 5 6 7
# attr(,"class")
# [1] "omit"
# > input_vec_chr %>% na_if("") %>% na.omit() %>% str
#  chr [1:3] "blueberry" "coconut" "watermelon"
#  - attr(*, "na.action")= 'omit' int [1:5] 3 4 5 6 7


##@ %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))} ----
input_vec_chr %>% na_if("") %>% na.omit() %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))}
# > input_vec_chr %>% na_if("") %>% na.omit() %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))}
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] "watermelon                                                                  ...3"

##@ %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))} ----
input_vec_chr %>% na_if("") %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))}
# > input_vec_chr %>% na_if("") %>% {paste0(., strrep(" ",pmax(4, width.cutoff - nchar(.))),"...", 1:length(.))}
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] "NANA...3"                                                                        
# [4] "NANA...4"                                                                        
# [5] "NANA...5"                                                                        
# [6] "NANA...6"                                                                        
# [7] "NANA...7"                                                                        
# [8] "watermelon                                                                  ...8"




#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 〚〛 SOURCE) -----  
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
# 〚〛 START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in f_df.t.tribble_construct.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_vec_chr.add_line_numbers =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.add_line_numbers.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.add_line_numbers"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, width.cutoff = 80L-4L, URL4line_numbers = FALSE, prefix4line_numbers = ifelse(!URL4line_numbers, "#L",  paste0("# https://github.com/mkim0710/tidystat/blob/master/", env1$f$f_path.relative(rstudioapi::getSourceEditorContext()$path), "#L"))) {
    input_vec_chr = 
        ifelse(
            is.na(input_vec_chr) | input_vec_chr == "", input_vec_chr, 
            paste0(
                input_vec_chr, 
                strrep(" ",pmax(4, width.cutoff - nchar(input_vec_chr))),
                prefix4line_numbers, 
                1:length(input_vec_chr)
            )
        )
    input_vec_chr
}

env1$env.internal$f_vec_chr.add_line_numbers(input_vec_chr)
# > env1$env.internal$f_vec_chr.add_line_numbers(input_vec_chr)
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] ""                                                                                
# [4] ""                                                                                
# [5] ""                                                                                
# [6] ""                                                                                
# [7] ""                                                                                
# [8] "watermelon                                                                  ...8"


input_vec_chr %>% na_if("") %>% env1$env.internal$f_vec_chr.add_line_numbers()
input_vec_chr %>% na_if("") %>% env1$env.internal$f_vec_chr.add_line_numbers() %>% replace_na("")
# > input_vec_chr %>% na_if("") %>% env1$env.internal$f_vec_chr.add_line_numbers()
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] NA                                                                                
# [4] NA                                                                                
# [5] NA                                                                                
# [6] NA                                                                                
# [7] NA                                                                                
# [8] "watermelon                                                                  ...8"
# > input_vec_chr %>% na_if("") %>% env1$env.internal$f_vec_chr.add_line_numbers() %>% replace_na("")
# [1] "blueberry                                                                   ...1"
# [2] "coconut                                                                     ...2"
# [3] ""                                                                                
# [4] ""                                                                                
# [5] ""                                                                                
# [6] ""                                                                                
# [7] ""                                                                                
# [8] "watermelon                                                                  ...8"

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_vec_chr.add_line_numbers.paste_collapse_LF_cat =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.add_line_numbers.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.add_line_numbers.paste_collapse_LF_cat"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, width.cutoff = 80L-4L) {
    out = env1$env.internal$f_vec_chr.add_line_numbers(input_vec_chr, width.cutoff)
    out %>% paste(collapse = "\n") %>% cat("\n", sep="")
    invisible(out)
}
env1$env.internal$f_vec_chr.add_line_numbers.paste_collapse_LF_cat(input_vec_chr)
# > env1$env.internal$f_vec_chr.add_line_numbers.paste_collapse_LF_cat(input_vec_chr)
# blueberry                                                                   ...1
# coconut                                                                     ...2
# 
# 
# 
# 
# 
# watermelon                                                                  ...8


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
# 〚〛 END -----  
env1$f$showCodeText2openSourceInGitHub()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


