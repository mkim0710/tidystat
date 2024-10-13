##@ now included in env1$env.internal.source.r ----

# Rdev/00_base_program/f_CodeText.echo.dev.r
# Rdev/00_base_program/f_CodeText.substitute.echo.dev.r -> incorporated in f_CodeText.echo.dev.r
# Rdev/00_base_program/f_expression.substitute.echo.dev-pending.Rmd
# Rdev/00_base_program/f_TerminalFromRCodeText.echo.dev.r
# Rdev/00_base_program/f_file.git_lfs_track_add_f.dev.r
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

# https://chatgpt.com/c/670a8ab2-8eb0-800e-81b1-c15d45654643
# https://gemini.google.com/app/efcecda0973ba3f4

# @@ START) example -----  
## \$ analyticDF_time2event =  ----  
suppressPackageStartupMessages(library(tidyverse))
# suppressPackageStartupMessages(library(survival))
# ?survival::lung
.objectname = DataSetName = "analyticDF_time2event"
assign(
    DataSetName, 
    survival::lung |> mutate(event = as.logical(status-1), Group = c("Male", "Female")[sex] |> as.factor(), StudyPopulation = time >= 30) |>
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
  

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
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
.CodeText = paste0("n_distinct(get(.objectname)$", varname, ")"); cat(.CodeText);cat(" == ");dput(eval(parse(text=.CodeText)))
cat("> ",.objectname,"$",varname," |> n_distinct()"," == ",n_distinct(get(.objectname)[[varname]]), sep="")
# > .CodeText = paste0("n_distinct(get(.objectname)$", varname, ")"); cat(.CodeText);cat(" == ");dput(eval(parse(text=.CodeText)))
# n_distinct(get(.objectname)$NIHID) == 0L
# > cat("> ",.objectname,"$",varname," |> n_distinct()"," == ",n_distinct(get(.objectname)[[varname]]), sep="")
# > analyticDF_time2event.NA.rmAllNA$NIHID |> n_distinct() == 0





#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
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

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# f_CodeText.echo = function(.CodeText, execute_code = FALSE, output.deparse_cat = TRUE) {
#     .CodeText |> cat("  \n", sep="")
#     if(execute_code) {
#         if(output.deparse_cat) {
#             eval(parse(text = .CodeText)) |> deparse() |> cat("  \n", sep="")
#         } else {
#             # eval(parse(text = .CodeText)) |> capture.output() |> cat(sep="\n"); cat("\n")
#             eval(parse(text = .CodeText))
#         }
#     }
# }


f_CodeText.echo = function(
        .CodeText,
        execute_code = FALSE,
        output.deparse_cat = TRUE,
        LinePrefix4CodeText = "    ",
        LinePrefix4Output = "    ## ",
        substitute_ObjectNames = FALSE,
        ObjectNames4substitute = NULL,
        print.intermediate = FALSE) {
    
    if(.CodeText |> str_detect('\n')) {
        # warning('The newline character(s) will be substituted by "; "')
        # .CodeText = .CodeText |> str_replace_all('\n', "; ")
        stop('The newline character(s) is not allowed')
    }
    if(.CodeText |> str_detect(';')) {
        stop('The semicolon character is not allowed')
    }
    
    if(substitute_ObjectNames) {
        # Get all objects defined in the parent frame
        parent_env <- parent.frame()
        if(is.null(ObjectNames4substitute)) {
            ObjectNames4substitute <- ls(envir = parent_env, all.names = TRUE) %>% 
                set_names() %>% map(get) %>% 
                keep(is.character) %>% 
                keep(function(vec) {length(vec) == 1}) %>% 
                names()
        }
        
        # Sort object names by length in descending order
        ObjectNames4substitute <- ObjectNames4substitute[order(-nchar(ObjectNames4substitute))]
        if(print.intermediate) print(ObjectNames4substitute)
        
        # Substitute each object name
        for (ObjectName in ObjectNames4substitute) {
            # escaped_ObjectName <- gsub("([.|()\\^{}+$*?]|\\[|\\])", "\\\\\\1", ObjectName)
            if(print.intermediate) print(ObjectName)
            .CodeText <- gsub(paste0("get(", ObjectName, ")"), get(ObjectName), .CodeText, fixed = TRUE)
            .CodeText <- gsub(ObjectName, paste0("\"", get(ObjectName), "\""), .CodeText, fixed = TRUE)
            if(print.intermediate) print(.CodeText)
        }
    }
    
    # .CodeText.addPrefix = .CodeText |> strsplit("\n") |> unlist() |> paste(LinePrefix4CodeText, ., sep="")
    .CodeText |> cat("  \n", sep="")
    if(execute_code) {
        if(output.deparse_cat) {
            eval(parse(text = .CodeText)) |> deparse() |> cat("  \n", sep="")
        } else {
            # eval(parse(text = .CodeText)) |> capture.output() |> cat(sep="\n"); cat("\n")
            eval(parse(text = .CodeText))
        }
    }
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "dim(get(.objectname))" ----
.objectname = "analyticDF_time2event"
.CodeText = "dim(get(.objectname)); nrow(get(.objectname))" 
.CodeText = "dim(get(.objectname))
nrow(get(.objectname))" 
.CodeText |> f_CodeText.echo()
.CodeText |> f_CodeText.echo(substitute_ObjectNames = TRUE)
.CodeText |> f_CodeText.echo(execute_code = TRUE)
.CodeText |> f_CodeText.echo(execute_code = TRUE, output.deparse_cat = FALSE)
# > .CodeText = "dim(get(.objectname))" 
# > .CodeText |> f_CodeText.echo()
# dim(get(.objectname))  
# > .CodeText |> f_CodeText.echo(substitute_ObjectNames = TRUE)
# dim(analyticDF_time2event)  
# > .CodeText |> f_CodeText.echo(execute_code = TRUE)
# dim(get(.objectname))  
# c(228L, 12L)  
# > .CodeText |> f_CodeText.echo(execute_code = TRUE, output.deparse_cat = FALSE)
# dim(get(.objectname))  
# [1] 228  12
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## .CodeText = "str(get(.objectname), max.level = 2, give.attr = F)" ----
.objectname = "analyticDF_time2event"
.CodeText = "str(get(.objectname), max.level = 2, give.attr = F)"
.CodeText |> f_CodeText.echo()
.CodeText |> f_CodeText.echo(substitute_ObjectNames = TRUE)
.CodeText |> f_CodeText.echo(execute_code = TRUE)
.CodeText |> f_CodeText.echo(execute_code = TRUE, output.deparse_cat = FALSE)
# > .CodeText |> f_CodeText.echo()
# str(get(.objectname), max.level = 2, give.attr = F)  
# > .CodeText |> f_CodeText.echo(substitute_ObjectNames = TRUE)
# str(analyticDF_time2event, max.level = 2, give.attr = F)  
# > .CodeText |> f_CodeText.echo(execute_code = TRUE)
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
# NULL  
# > .CodeText |> f_CodeText.echo(execute_code = TRUE, output.deparse_cat = FALSE)
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












#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
