##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# ⸿ REFERENCES)                                                            #L159
# ⸿ DATA) example                                                          #L165
# ⸿ START) dev                                                             #L181
# ⸿ SOURCE)                                                                #L188
# ⸿ START) function                                                        #L222
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L273
# ⸿ MetaData                                                               #L278
# ⸿ DATA) Read & Check                                                     #L287
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# ⸿ REFERENCES)                                                            # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L159
# ⸿ DATA) example                                                          # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L165
# ⸿ START) dev                                                             # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L181
# ⸿ SOURCE)                                                                # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L188
# ⸿ START) function                                                        # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L222
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L273
# ⸿ MetaData                                                               # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L278
# ⸿ DATA) Read & Check                                                     # https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R#L287
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
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
# env1$f$showProjectPathsAtTidyStat()
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
env1$f$showCodeText2open.FileName.source.r(.RelativeSubPath, .FileName.source.r)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) ) ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
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
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ MetaData ----  
## .GlobalEnv$MetaData = list() ====  
if(!exists("MetaData", envir=.GlobalEnv)) { assign("MetaData", list(), envir=.GlobalEnv) }  
.parentname = "MetaData"
for (.sublistname in c("tblVarName", "DSnames", "VarNames", "VarNames.select", "VarNames.filter", "VarNames.recode", "ModelList")) {
    if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
}
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ DATA) Read & Check-----
## \$ DSN |> paste0(".rds") %>% paste0(.path4read.RelativeSubPath,ifelse(.path4read.RelativeSubPath=="","","/"),.) |> read_rds() %>% assign(DSN, value = ., envir = .GlobalEnv) ====
.path4read.RelativeSubPath = r"(data)"|>str_replace_all("\\\\","/")
DSN = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # .path4read.RelativeSubPath_FileNameExt = DSN |> paste0(".rds") %>% paste0(.path4read.RelativeSubPath,ifelse(.path4read.RelativeSubPath=="","","/"),.)
# # .path_FileNameExt = ifelse( file.exists(.path4read.RelativeSubPath_FileNameExt), .path4read.RelativeSubPath_FileNameExt, paste0(env1$path$source_base_github,"/data/",DSN,".rds") )
# # cat(".path_FileNameExt = ", .path_FileNameExt, "  \n", sep = "")
# DSN |> paste0(".rds") %>% paste0(.path4read.RelativeSubPath,ifelse(.path4read.RelativeSubPath=="","","/"),.) |> read_rds() %>% assign(DSN, value = ., envir = .GlobalEnv)
if(!exists("DSN0")) {DSN0 = DSN; cat('  Setting DSN0 = "',DSN0,'"  \n', sep="")}
MetaData$DSnames[[DSN]] = env1$f$f_DSname.Search.read.checkEntity(DSN=DSN,ext="rds", .path4read=.path4read|>paste0(ifelse(.path4read.RelativeSubPath=="","","/"),.path4read.RelativeSubPath), return.output = TRUE)



###### \% |> () ----  



###### \% |> () ----  



###### \% |> () ----  








# __________|------  
## § write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") ----
if (Sys.getenv("PARENT_RENDERING") != "YES") {    
    .path4write = .path4write %>% str_replace(fixed(env1$path$path1), "") %>% str_replace("^/", "")  # [][Rproject] makes an error in git bash
    if(exists("MetaData") && !is.null(unlist(MetaData))) {
        # MetaData$DSnames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
        cat("    ________________________________________________________________________    \n")
        for (DSname in names(MetaData$DSnames)) {    
            if(exists(DSname)) {
                assign(DSname, structure(get(DSname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                if(is.null(attributes(.GlobalEnv[[DSname]])$DSname)) attributes(.GlobalEnv[[DSname]])$DSname = DSname
                if(attributes(.GlobalEnv[[DSname]])$DSname != DSname) attributes(.GlobalEnv[[DSname]])$DSname = DSname
                if (!is.null(attributes(attributes(.GlobalEnv[[DSname]])$DSname)$.path_file)) {
                    message( "attributes(attributes(",DSname,")$DSname)$.path_file == ",deparse(attributes(attributes(get(DSname))$DSname)$.path_file) )
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSname, .path_file = attributes(attributes(.GlobalEnv[[DSname]])$DSname)$.path_file, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                } else {
                    env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = DSname, .path4write = .path4write, createBACKUP = FALSE, EXECUTE = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE)
                }
            } else {  message("!exists(",deparse(DSname),")")  }
            cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
        }
    }
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    .objectname |> write_rds.ECHO.CodeText(EXECUTE_write_rds = FALSE, EXECUTE_write_rds_xz = FALSE)
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx") |> str_replace("^D:/D_Repositories", "D:/OneDrive/[][Rproject]")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)    
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.UTF8BOM.csv = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8BOM.csv") |> str_replace("^D:/D_Repositories", "D:/OneDrive/[][Rproject]")
    # if (Sys.info()["sysname"] == "Windows") {
    #     readr::write_excel_csv(get(.objectname), file = .path_FileName.UTF8BOM.csv) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    #     openxlsx2::xl_open(.path_FileName.UTF8BOM.csv)
    # } else {
    #     readr::write_excel_csv(get(.objectname), file = .path_FileName.UTF8BOM.csv|>paste0(".xz")) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
    # }
    # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # .path_FileName.UTF8.csv.xz = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8.csv.xz")
    # readr::write_csv(get(.objectname), file = .path_FileName.UTF8.csv.xz) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
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
# ⸿ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


