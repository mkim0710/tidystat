# @@ Now included in env1$env.internal.source.r ----

# Rdev/00_base_program/007_base_expression/f_ObjectName.get.dput.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.parse.eval.dput.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.substitute.echo.dev.r -> incorporated in f_CodeText.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_expression.substitute.echo.dev-pending.Rmd
# Rdev/00_base_program/007_base_expression/f_TerminalFromRCodeText.ECHO.dev.r
# Rdev/00_base_terminal/f_file.git_lfs_track_add_f.dev.r
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

# https://chatgpt.com/c/670a8ab2-8eb0-800e-81b1-c15d45654643
# https://gemini.google.com/app/efcecda0973ba3f4  
  
# __________|------  
# @@ START) example -----  
## \$ analyticDF_time2event =  ----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# suppressPackageStartupMessages(library(survival))
# ?survival::lung
.objectname = DataSetName = "analyticDF_time2event"
assign(
    DataSetName, 
    survival::lung |> as_tibble() |> mutate(event = as.logical(status-1), Group = c("Male", "Female")[sex] |> as.factor(), StudyPopulation = time >= 30) |>
        # dplyr::select(-status, -sex)
        dplyr::select(-status)
)
analyticDF_time2event %>% {cat(" > ",deparse(substitute(.))," |> as_tibble() |> print(n=9)","  \n", sep=""); print(as_tibble(.),n=9)}
analyticDF_time2event %>% {cat(" > ",deparse(substitute(.))," |> rownames_to_column() |> tail() |> as_tibble()","  \n", sep=""); print(as_tibble(tail(rownames_to_column(.))))}
# survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) %>% {cat("> ",deparse(substitute(.))," |> str()","  \n", sep=""); str(.)}
# survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) |> table(useNA="always") |> addmargins()
# # > survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) %>% {cat("> ",deparse(substitute(.))," |> str()","  \n", sep=""); str(.)}
# # 'data.frame':	228 obs. of  2 variables:
# #  $ sex  : num  1 1 1 1 1 1 2 2 1 1 ...
# #  $ Group: Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
# # > survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) |> table(useNA="always") |> addmargins()
# #    Group
# # sex Female Male
# #   1      0  138
# #   2     90    0
# 
# cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
# analyticDF_time2event |> dplyr::select(time, event, Group, StudyPopulation) %>% by(.$StudyPopulation, summary)
# # > analyticDF_time2event |> dplyr::select(time, event, Group, StudyPopulation) %>% by(.$StudyPopulation, summary)
# # .$StudyPopulation: FALSE
# #       time     event            Group   StudyPopulation
# #  Min.   : 5   Mode:logical   Female:1   Mode :logical  
# #  1st Qu.:11   TRUE:9         Male  :8   FALSE:9        
# #  Median :12                                            
# #  Mean   :13                                            
# #  3rd Qu.:13                                            
# #  Max.   :26                                            
# # ----  
# # .$StudyPopulation: TRUE
# #       time          event            Group     StudyPopulation
# #  Min.   :  30.0   Mode :logical   Female: 89   Mode:logical   
# #  1st Qu.: 176.5   FALSE:63        Male  :130   TRUE:219       
# #  Median : 269.0   TRUE :156                                   
# #  Mean   : 317.2                                               
# #  3rd Qu.: 419.5                                               
# #  Max.   :1022.0   
  

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "dim(get(.objectname))" ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname))"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
.CodeText = "dim(get(.objectname))"; cat(.CodeText);cat(" = ");dput(eval(parse(text=.CodeText)))
cat("dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="")
# > .CodeText = "dim(get(.objectname))"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
# dim(get(.objectname))  
# [1] 228  12
# > .CodeText = "dim(get(.objectname))"; cat(.CodeText);cat(" = ");dput(eval(parse(text=.CodeText)))
# dim(get(.objectname)) = c(228L, 12L)
# > cat("dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="")
# dim(analyticDF_time2event.NA.rmAllNA) == c(228L, 12L) 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "str(get(.objectname), max.level = 2, give.attr = F)" ----
.objectname = "analyticDF_time2event"
.CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
cat("> ",.objectname," |> str(max.level=2, give.attr=FALSE)","  \n", sep=""); str(get(.objectname), max.level=2, give.attr=FALSE)
# > .CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
# str(get(.objectname), max.level = 2, give.attr = F)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : chr  "Male" "Male" "Male" "Male" ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# > cat("> ",.objectname," |> str(max.level=2, give.attr=FALSE)","  \n", sep=""); str(get(.objectname), max.level=2, give.attr=FALSE)
# > analyticDF_time2event.NA.rmAllNA |> str(max.level=2, give.attr=FALSE)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : chr  "Male" "Male" "Male" "Male" ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "as_tibble(get(.objectname))" ----
.objectname = "analyticDF_time2event"
.CodeText = "as_tibble(get(.objectname))"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
cat("> ",.objectname," |> as_tibble() |> print(n=99)","  \n", sep=""); print(as_tibble(get(.objectname)),n=99)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "as_tibble(tail(rownames_to_column(get(.objectname))))" ----
.objectname = "analyticDF_time2event"
.CodeText = "as_tibble(tail(rownames_to_column(get(.objectname))))"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
cat("> ",.objectname," |> rownames_to_column() |> tail() |> as_tibble()","  \n", sep=""); print(as_tibble(tail(rownames_to_column(get(.objectname)))))
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = paste0("n_distinct(get(.objectname)$", varname, ")") ----
.objectname = "analyticDF_time2event"
varname = "NIHID"
.CodeText = paste0("n_distinct(get(.objectname)$", varname, ")"); cat(.CodeText);cat(" == ");dput(eval(parse(text=.CodeText)))
cat("> ",.objectname,"$",varname," |> n_distinct()"," == ",n_distinct(get(.objectname)[[varname]]), sep="")
# > .CodeText = paste0("n_distinct(get(.objectname)$", varname, ")"); cat(.CodeText);cat(" == ");dput(eval(parse(text=.CodeText)))
# n_distinct(get(.objectname)$NIHID) == 0L
# > cat("> ",.objectname,"$",varname," |> n_distinct()"," == ",n_distinct(get(.objectname)[[varname]]), sep="")
# > analyticDF_time2event.NA.rmAllNA$NIHID |> n_distinct() == 0
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = 'ls(all.names = TRUE) |> deparse(width.cutoff = 500) |> cat("  \n", sep="")' ----
.CodeText = 'ls(all.names = TRUE) |> deparse(width.cutoff = 500) |> cat("  \n", sep="")'; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
# > .CodeText = 'ls(all.names = TRUE) |> deparse(width.cutoff = 500) |> cat("  \n", sep="")'; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
# ls(all.names = TRUE) |> deparse(width.cutoff = 500) |> cat("  
# ", sep="")  
# c(".CodeText", ".dependancy", ".envname", ".First", ".GlobalEnv", ".Last", ".listname", ".max_hierarchy", ".objectname", ".packagename", ".parentname", ".path4read", ".path4write", ".filename.source.r", ".sourcename_root", ".subenvname", ".sublistname", ".subpath", ".subpath_filename.source.r", ".t0", ".tmp", "analyticDF_time2event", "DataSetName", "env0", "env1", "f_CodeText.ECHO", "MetaData", "object", "params") 


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.CodeText = "dim(get(.objectname))"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
.CodeText = "dim(get(.objectname))"; cat(.CodeText);cat(" = ");dput(eval(parse(text=.CodeText)))
cat("dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="")
# > .CodeText = "dim(get(.objectname))"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
# dim(get(.objectname))  
# [1] 228  12
# > .CodeText = "dim(get(.objectname))"; cat(.CodeText);cat(" = ");dput(eval(parse(text=.CodeText)))
# dim(get(.objectname)) = c(228L, 12L)
# > cat("dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="")
# dim(analyticDF_time2event.NA.rmAllNA) == c(228L, 12L) 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
cat("> ",.objectname," |> str(max.level=2, give.attr=FALSE)","  \n", sep=""); str(get(.objectname), max.level=2, give.attr=FALSE)
# > .CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"; cat(.CodeText);cat("  \n", sep="");eval(parse(text=.CodeText))
# str(get(.objectname), max.level = 2, give.attr = F)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : chr  "Male" "Male" "Male" "Male" ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# > cat("> ",.objectname," |> str(max.level=2, give.attr=FALSE)","  \n", sep=""); str(get(.objectname), max.level=2, give.attr=FALSE)
# > analyticDF_time2event.NA.rmAllNA |> str(max.level=2, give.attr=FALSE)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : chr  "Male" "Male" "Male" "Male" ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# f_CodeText.ECHO = function(.CodeText, EXECUTE = FALSE, deparse_cat = TRUE) {
#     .CodeText |> cat("  \n", sep="")
#     if(EXECUTE) {
#         if(deparse_cat) {
#             eval(parse(text = .CodeText)) |> deparse() |> cat("  \n", sep="")
#         } else {
#             # eval(parse(text = .CodeText)) |> capture.output() |> cat(sep="\n"); cat("\n")
#             eval(parse(text = .CodeText))
#         }
#     }
# }


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
env1$f$f_CodeText.ECHO = function(
        .CodeText,
        EXECUTE = FALSE,
        deparse_cat = TRUE,
        LinePrefix4CodeText = "\t",
        LinePrefix4Output = "\t## ",
        substitute_ObjectNames = TRUE,
        ObjectNames4substitute = NULL,
        CodeEqualsOutput = TRUE,
        VERBOSE = isTRUE(getOption("verbose"))) {
    if(is.null(VERBOSE)) VERBOSE = FALSE
    out = NULL
    
    if(substitute_ObjectNames) {
        # Get all objects defined in the parent frame
        parent_env <- parent.frame()
        if(is.null(ObjectNames4substitute)) {
            ObjectNames4substitute <- ls(all.names = TRUE, envir = .GlobalEnv) %>% 
                set_names() %>% map(get) %>% 
                keep(is.character) %>% 
                keep(function(vec) {length(vec) == 1}) %>% 
                names()
        }
        
        # Sort .object names by length in descending order
        ObjectNames4substitute <- ObjectNames4substitute[order(-nchar(ObjectNames4substitute))]
        if(VERBOSE) cat("<VERBOSE> ObjectNames4substitute == ", deparse(ObjectNames4substitute), "  \n", sep="") 
        
        # Substitute each .object name
        for (ObjectName in ObjectNames4substitute) {
            # escaped_ObjectName <- gsub("([.|()\\^{}+$*?]|\\[|\\])", "\\\\\\1", ObjectName)
            .CodeText <- gsub(paste0("get(", ObjectName, ")"), get(ObjectName), .CodeText, fixed = TRUE)
            .CodeText <- gsub(ObjectName, paste0("\"", get(ObjectName), "\""), .CodeText, fixed = TRUE)
        }
        if(VERBOSE) cat("<VERBOSE> .CodeText == ", deparse(.CodeText), "  \n", sep="") 
    }
    
    if(.CodeText |> str_detect("[\n;]") && EXECUTE) {
        # warning('The newline character(s) will be substituted by "; "')
        # .CodeText = .CodeText |> str_replace_all('\n', "; ")
        # 'The newline character(s) is not allowed' |> stop(call. = FALSE) |> tryCatch(error = function(e) {message("stop: ", e); return(invisible())})
        'EXECUTE not fully implemented for line feed (\\n) or semicolon (;)' |> warning("  \n", call. = FALSE, immediate. = TRUE)
        # return(invisible())
    }

    # Split .CodeText by newline character, considering semicolons within curly brackets
    # .CodeText.split_LF = .CodeText |> strsplit("\n") |> unlist() |> trimws()
    .CodeText.split_LF <- .CodeText |> strsplit("\n(?=[^{}]*(?:{|$))", perl = TRUE) |> unlist() |> trimws()
    if(VERBOSE) cat("<VERBOSE> .CodeText.split_LF == ", deparse(.CodeText.split_LF), "  \n", sep="") 
    # PatternToMatch(?=PositiveLookahead)
    # \n(?=[^{}]*(?:{|$)) 
    # - \n: splits the code by newline characters (\n) 
    # - (?=PositiveLookahead): only if they are followed by a sequence of characters that
    # - [^{}]*: does not contain any curly braces ([^{}]*) 
    # - (?:{|$): and then either an opening curly brace ({) or the end of the string ($). 
    # This ensures that newline characters within curly braces are ignored.
    
    # Split .CodeText by semicolon outside of curly brackets
    # .CodeText.split_LF.split_semicolon = .CodeText.split_LF |> strsplit(";") |> unlist() |> trimws()
    .CodeText.split_LF.split_semicolon <- .CodeText.split_LF |> strsplit(";(?![^{]*})", perl = TRUE) |> unlist() |> trimws()
    if(VERBOSE) cat("<VERBOSE> .CodeText.split_LF.split_semicolon == ", deparse(.CodeText.split_LF.split_semicolon), "  \n", sep="") 
    # PatternToMatch(?!NegativeLookahead)
    # ;(?![^{}]*}) 
    # ;: splits the code by semicolons (;) 
    # (?!NegativeLookahead): only if they are not followed by 
    # }: a closing curly brace (}) 
    # [^{]*: that is preceded by a sequence of characters without any opening curly braces ([^{]*). This ensures that semicolons within curly braces are ignored.

    # .CodeText.split_LF.addPrefix = paste0(LinePrefix4CodeText, .CodeText.split_LF)
    .CodeText.split_LF.addPrefix = .CodeText.split_LF %>% str_replace_all("^", LinePrefix4CodeText)
    if(VERBOSE) cat("<VERBOSE> .CodeText.split_LF.addPrefix == ", deparse(.CodeText.split_LF.addPrefix), "  \n", sep="") 

    for (i in 1:length(.CodeText.split_LF.split_semicolon)) {
        if(VERBOSE) cat("<VERBOSE> i == ", deparse(i), "  \n", sep="") 
        # cat(.CodeText.split_LF.addPrefix[i], "  \n", sep="")
        # if (i <= length(.CodeText.split_LF.addPrefix)) cat(.CodeText.split_LF.addPrefix[i], "  \n", sep="")
        if (i <= length(.CodeText.split_LF.addPrefix)) cat(.CodeText.split_LF.addPrefix[i], sep="")
        
        if(EXECUTE) {
            if(deparse_cat) {
                # .CodeText.split_LF.split_semicolon.i.parse.eval.deparse = eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> deparse()
                # if(CodeEqualsOutput && .CodeText.split_LF.split_semicolon.i.parse.eval.deparse != "NULL") {
                if(CodeEqualsOutput && identical(.CodeText.split_LF, .CodeText.split_LF.split_semicolon) && ! .CodeText.split_LF.split_semicolon[i] |> str_detect(r"((^|[^\w_.])str($|[^\w_.]))")) {
                    cat(" == ")
                    out = eval(parse(text = .CodeText.split_LF.split_semicolon[i])) 
                    out |> deparse() %>% cat(sep="")
                    # .CodeText.split_LF.split_semicolon.i.parse.eval.deparse %>% cat(., "  \n", sep="")
                } else {
                    cat("  \n")
                    # eval(parse(text = .CodeText.split_LF.split_semicolon[i])) |> deparse() %>% cat(LinePrefix4Output, ., "  \n", sep="")
                    # .CodeText.split_LF.split_semicolon.i.parse.eval.deparse %>% cat(LinePrefix4Output, ., "  \n", sep="")
                    out = eval(parse(text = .CodeText.split_LF.split_semicolon[i]))
                    out |> deparse() %>% cat(LinePrefix4Output, ., sep="")
                }
            } else {
                # eval(parse(text = .CodeText.split_LF[i]))
                cat("  \n")
                out = eval(parse(text = .CodeText.split_LF.split_semicolon[i])) 
                out |> capture.output() %>% paste0(LinePrefix4Output, .) |> cat(sep="\n") 
            }
        } 
        # cat("  \n")
        if(deparse_cat) cat("  \n")
    }
    invisible(out)
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "dim(get(.objectname))" ----
options(verbose = TRUE);  # getOption("verbose");  
options(verbose = FALSE);  # getOption("verbose");  
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname))"
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	dim(get(.objectname))  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	dim(analyticDF_time2event)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	dim(analyticDF_time2event) == c(228L, 12L)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	dim(analyticDF_time2event)  
# 	## [1] 228  12
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "str(get(.objectname), max.level = 2, give.attr = F)" ----
.objectname = "analyticDF_time2event"
.CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	str(get(.objectname), max.level = 2, give.attr = F)  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# 	## NULL  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# 	## 'data.frame':	228 obs. of  12 variables:
# 	##  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
# 	##  $ time           : num  306 455 1010 210 883 ...
# 	##  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
# 	##  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
# 	##  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
# 	##  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
# 	##  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
# 	##  $ meal.cal       : num  1175 1225 NA 1150 NA ...
# 	##  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
# 	##  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
# 	##  $ Group          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
# 	##  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## Multi-statement .CodeText  ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname)); nrow(get(.objectname))" 
.CodeText |> env1$f$f_CodeText.ECHO()
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO()
# 	dim(analyticDF_time2event); nrow(analyticDF_time2event)  
#   
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	dim(analyticDF_time2event); nrow(analyticDF_time2event)  
#   
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	dim(analyticDF_time2event); nrow(analyticDF_time2event)  
# 	## c(228L, 12L)  
#   
# 	## 228L  
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	dim(analyticDF_time2event); nrow(analyticDF_time2event)  
# 	## [1] 228  12
#   
# 	## [1] 228
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE, deparse_cat = FALSE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## Multi-line .CodeText  ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname))
nrow(get(.objectname))" 
.CodeText |> env1$f$f_CodeText.ECHO()
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO()
# 	dim(analyticDF_time2event)  
# 	nrow(analyticDF_time2event)  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	dim(analyticDF_time2event)  
# 	nrow(analyticDF_time2event)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	dim(analyticDF_time2event) == c(228L, 12L)  
# 	nrow(analyticDF_time2event) == 228L  
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	dim(analyticDF_time2event)  
# 	## [1] 228  12
# 	nrow(analyticDF_time2event)  
# 	## [1] 228
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE, deparse_cat = FALSE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "summary(get(.objectname))" ----
.objectname = "analyticDF_time2event"
.CodeText = "get(.objectname) |> select_if(is.logical) |> summary()"
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	get(.objectname) |> select_if(is.logical) |> summary()  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	analyticDF_time2event |> select_if(is.logical) |> summary()  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	analyticDF_time2event |> select_if(is.logical) |> summary() == structure(c("Mode :logical  ", "FALSE:63       ", "TRUE :165      ", "Mode :logical  ", "FALSE:9        ", "TRUE :219      "), dim = 3:2, dimnames = list(    c("", "", ""), c("  event", "StudyPopulation")), class = "table")  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	analyticDF_time2event |> select_if(is.logical) |> summary()  
# 	##    event         StudyPopulation
# 	##  Mode :logical   Mode :logical  
# 	##  FALSE:63        FALSE:9        
# 	##  TRUE :165       TRUE :219  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "summary(get(.objectname))" ----
DataSetName2 = "analyticDF_time2event"
.CodeText = '.vec_nlevel_lt20.value_number.unique = get(DataSetName2) %>% map(function (vec) {vec.unique = unique(vec); if(length(vec.unique) < 20) return(vec.unique) else return(NULL) }) %>% unlist %>% unique %>% str_subset("^[0-9]+$") %>% sort'
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	.vec_nlevel_lt20.value_number.unique = get(DataSetName2) %>% map(function (vec) {vec.unique = unique(vec); if(length(vec.unique) < 20) return(vec.unique) else return(NULL) }) %>% unlist %>% unique %>% str_subset("^[0-9]+$") %>% sort  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	.vec_nlevel_lt20.value_number.unique = analyticDF_time2event %>% map(function (vec) {vec.unique = unique(vec); if(length(vec.unique) < 20) return(vec.unique) else return(NULL) }) %>% unlist %>% unique %>% str_subset("^[0-9]+$") %>% sort  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	.vec_nlevel_lt20.value_number.unique = analyticDF_time2event %>% map(function (vec) {vec.unique = unique(vec); if(length(vec.unique) < 20) return(vec.unique) else return(NULL) }) %>% unlist %>% unique %>% str_subset("^[0-9]+$") %>% sort == c("0", "1", "10", "100", "11", "12", "13", "15", "16", "2", "21", "22", "26", "3", "30", "32", "33", "4", "40", "5", "50", "6", "60", "7", "70", "80", "90")  
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	.vec_nlevel_lt20.value_number.unique = analyticDF_time2event %>% map(function (vec) {vec.unique = unique(vec); if(length(vec.unique) < 20) return(vec.unique) else return(NULL) }) %>% unlist %>% unique %>% str_subset("^[0-9]+$") %>% sort  
# 	## 
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE, deparse_cat = FALSE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)








#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function v2 (expression) -----  
# https://chatgpt.com/c/670a8ab2-8eb0-800e-81b1-c15d45654643?model=o1-preview
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# env1$f$f_CodeText.ECHO <- function(
#     .CodeText,
#     EXECUTE = FALSE,
#     deparse_cat = TRUE,
#     LinePrefix4CodeText = "\t",
#     LinePrefix4Output = "\t## ",
#     substitute_ObjectNames = TRUE,
#     ObjectNames4substitute = NULL,
#     CodeEqualsOutput = TRUE,
#     VERBOSE = FALSE
# ) {
#     # Load necessary packages
#     library(rlang)
#     library(purrr)
#     library(stringr)
#     
#     # Get parent environment
#     parent_env <- parent.frame()
#     
#     # Substitute object names if needed
#     if (substitute_ObjectNames) {
#         if (is.null(ObjectNames4substitute)) {
#             # Get all character variables of length 1 from parent frame
#             ObjectNames4substitute <- ls(all.names = TRUE, envir = .GlobalEnv) %>% 
#                 set_names() %>% map(get, envir = parent_env) %>% 
#                 keep(is.character) %>% 
#                 keep(~ length(.x) == 1) %>% 
#                 names()
#         }
#         
#         if (VERBOSE) print(ObjectNames4substitute)
#     }
#     
#     # Parse the code into expressions
#     expr_list <- parse(text = .CodeText)
#     
#     # Function to substitute object names in an expression
#     substitute_object_names <- function(expr) {
#         if (substitute_ObjectNames) {
#             # Substitute get(ObjectName) with the actual object
#             expr <- expr_apply(expr, function(e) {
#                 if (is.call(e) && identical(e[[1]], as.name("get")) && length(e) == 2) {
#                     arg <- e[[2]]
#                     if (is.symbol(arg)) {
#                         var_name <- as.character(arg)
#                         if (var_name %in% ObjectNames4substitute) {
#                             # Replace get(ObjectName) with actual object name
#                             return(as.name(get(var_name, envir = parent_env)))
#                         }
#                     }
#                 } else if (is.symbol(e)) {
#                     var_name <- as.character(e)
#                     if (var_name %in% ObjectNames4substitute) {
#                         # Replace ObjectName with its value in quotes
#                         return(get(var_name, envir = parent_env))
#                     }
#                 }
#                 return(e)
#             })
#         }
#         return(expr)
#     }
#     
#     # Iterate over each expression
#     for (expr in expr_list) {
#         # Substitute object names in the expression for display
#         expr_display <- substitute_object_names(expr)
#         
#         # Deparse the expression for display
#         code_line <- deparse(expr_display) %>% paste(collapse = "\n")
#         # Add line prefix
#         cat(LinePrefix4CodeText, code_line, sep = "")
#         
#         if (EXECUTE) {
#             # Try to evaluate the original expression
#             tryCatch({
#                 result <- eval(expr, envir = parent_env)
#                 if (deparse_cat) {
#                     if (CodeEqualsOutput && !grepl("\\bstr\\b", deparse(expr))) {
#                         # For functions other than str(), print code == result
#                         cat(" == ")
#                         if (!is.null(result)) {
#                             deparse(result) %>% paste(collapse = "\n") %>% cat(., "  \n", sep = "")
#                         } else {
#                             cat("NULL  \n")
#                         }
#                     } else {
#                         # For str() and others, print output prefixed
#                         cat("  \n")
#                         output <- capture.output(result)
#                         if (length(output) > 0) {
#                             output %>% paste0(LinePrefix4Output, .) %>% cat(sep = "\n")
#                             cat("\n")
#                         }
#                     }
#                 } else {
#                     # Capture and print output directly
#                     cat("  \n")
#                     output <- capture.output(result)
#                     if (length(output) > 0) {
#                         output %>% paste0(LinePrefix4Output, .) %>% cat(sep = "\n")
#                         cat("\n")
#                     }
#                 }
#             }, error = function(e) {
#                 # Handle errors gracefully
#                 cat("\n", LinePrefix4Output, "Error: ", e$message, "\n", sep = "")
#             })
#         } else {
#             cat("  \n")
#         }
#     }
# }


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "dim(get(.objectname))" ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname))"
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	dim(get(.objectname))  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	dim(analyticDF_time2event)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	dim(analyticDF_time2event) == c(228L, 12L)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	dim(analyticDF_time2event)  
# 	## [1] 228  12
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "str(get(.objectname), max.level = 2, give.attr = F)" ----
.objectname = "analyticDF_time2event"
.CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	str(get(.objectname), max.level = 2, give.attr = F)  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# 	## NULL  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# 	## 'data.frame':	228 obs. of  12 variables:
# 	##  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
# 	##  $ time           : num  306 455 1010 210 883 ...
# 	##  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
# 	##  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
# 	##  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
# 	##  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
# 	##  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
# 	##  $ meal.cal       : num  1175 1225 NA 1150 NA ...
# 	##  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
# 	##  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
# 	##  $ Group          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
# 	##  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## Multi-statement .CodeText  ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname)); nrow(get(.objectname))" 
.CodeText |> env1$f$f_CodeText.ECHO()
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	str(get(.objectname), max.level = 2, give.attr = F)  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# 'data.frame':	228 obs. of  12 variables:
#  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
#  $ time           : num  306 455 1010 210 883 ...
#  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
#  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
#  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
#  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
#  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
#  $ meal.cal       : num  1175 1225 NA 1150 NA ...
#  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
#  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
#  $ Group          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
#  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# 	## NULL  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	str(analyticDF_time2event, max.level = 2, give.attr = F)  
# 	## 'data.frame':	228 obs. of  12 variables:
# 	##  $ inst           : num  3 3 3 5 1 12 7 11 1 7 ...
# 	##  $ time           : num  306 455 1010 210 883 ...
# 	##  $ age            : num  74 68 56 57 60 74 68 71 53 61 ...
# 	##  $ sex            : num  1 1 1 1 1 1 2 2 1 1 ...
# 	##  $ ph.ecog        : num  1 0 0 1 0 1 2 2 1 2 ...
# 	##  $ ph.karno       : num  90 90 90 90 100 50 70 60 70 70 ...
# 	##  $ pat.karno      : num  100 90 90 60 90 80 60 80 80 70 ...
# 	##  $ meal.cal       : num  1175 1225 NA 1150 NA ...
# 	##  $ wt.loss        : num  NA 15 15 11 0 0 10 1 16 34 ...
# 	##  $ event          : logi  TRUE TRUE FALSE TRUE TRUE FALSE ...
# 	##  $ Group          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
# 	##  $ StudyPopulation: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## Multi-line .CodeText  ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname))
nrow(get(.objectname))" 
.CodeText |> env1$f$f_CodeText.ECHO()
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO()
# 	dim(analyticDF_time2event)  
# 	nrow(analyticDF_time2event)  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	dim(analyticDF_time2event)  
# 	nrow(analyticDF_time2event)  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	dim(analyticDF_time2event) == c(228L, 12L)  
# 	nrow(analyticDF_time2event) == 228L  
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	dim(analyticDF_time2event)  
# 	## [1] 228  12
# 	nrow(analyticDF_time2event)  
# 	## [1] 228
# Warning message:
# In env1$f$f_CodeText.ECHO(.CodeText, EXECUTE = TRUE, deparse_cat = FALSE) :
#   EXECUTE not fully implemented for line feed (\n) or semicolon (;)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "summary(get(.objectname))" ----
.objectname = "analyticDF_time2event"
.CodeText = "get(.objectname) |> select_if(is.logical) |> summary()"
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	get(.objectname) |> select_if(is.logical) |> summary()  
# > .CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
# 	analyticDF_time2event |> select_if(is.logical) |> summary()  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	analyticDF_time2event |> select_if(is.logical) |> summary() == structure(c("Mode :logical  ", "FALSE:63       ", "TRUE :165      ", "Mode :logical  ", "FALSE:9        ", "TRUE :219      "), dim = 3:2, dimnames = list(    c("", "", ""), c("  event", "StudyPopulation")), class = "table")  
# > .CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)
# 	analyticDF_time2event |> select_if(is.logical) |> summary()  
# 	##    event         StudyPopulation
# 	##  Mode :logical   Mode :logical  
# 	##  FALSE:63        FALSE:9        
# 	##  TRUE :165       TRUE :219  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "summary(get(.objectname))" ----
DataSetName2 = "analyticDF_time2event"
.CodeText = '.vec_nlevel_lt20.value_number.unique = get(DataSetName2) %>% map(function (vec) {vec.unique = unique(vec); if(length(vec.unique) < 20) return(vec.unique) else return(NULL) }) %>% unlist %>% unique %>% str_subset("^[0-9]+$") %>% sort'
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
.CodeText |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
.CodeText |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE)



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
# @@ START) function v3 (.objectname) -----  

'get(".objectname")' |> env1$f$f_CodeText.ECHO()
'get(".objectname")' |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# > 'get(".objectname")' |> env1$f$f_CodeText.ECHO()
# 	get(""analyticDF_time2event"")  
# > 'get(".objectname")' |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	get(""analyticDF_time2event"") == 
# Error in parse(text = .CodeText.split_LF.split_semicolon[i]) : 
#   <text>:1:7: unexpected symbol
# 1: get(""analyticDF_time2event
#           ^

'get(".objectname")' |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
'get(".objectname")' |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# > 'get(".objectname")' |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	get(".objectname")  
# > 'get(".objectname")' |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# 	get(".objectname") == "analyticDF_time2event"  


".objectname" |> env1$f$f_CodeText.ECHO()
".objectname" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# > ".objectname" |> env1$f$f_CodeText.ECHO()
# 	"analyticDF_time2event"  
# > ".objectname" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	"analyticDF_time2event" == "analyticDF_time2event"  
# > ".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	.objectname  
# > ".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# 	.objectname == "analyticDF_time2event" 



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
