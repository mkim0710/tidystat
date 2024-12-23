# f_Metadata_CodeToCreateDS.parse_eval.dev.r

## \$ analyticDF_time2event =  ----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# suppressPackageStartupMessages(library(survival))
for(.packagename in c("survminer")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
# ?survival::lung
# .objectname = DSN = "analyticDF_time2event"
# assign(
#     DSN, 
#     survival::lung |> as_tibble() |> mutate(event = as.logical(status-1), Group = c("Male", "Female")[sex] |> as.factor(), StudyPopulation = time >= 30) |>
#         # dplyr::select(-status, -sex)
#         dplyr::select(-status)
# )
# analyticDF_time2event %>% {cat(" > ",deparse(substitute(.))," |> as_tibble() |> print(n=9)","  \n", sep=""); print(as_tibble(.),n=9)}
# analyticDF_time2event %>% {cat(" > ",deparse(substitute(.))," |> rownames_to_column() |> tail() |> as_tibble()","  \n", sep=""); print(as_tibble(tail(rownames_to_column(.))))}
# # survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) %>% {cat("> ",deparse(substitute(.))," |> str()","  \n", sep=""); str(.)}
# # survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) |> table(useNA="always") |> addmargins()
# # # > survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) %>% {cat("> ",deparse(substitute(.))," |> str()","  \n", sep=""); str(.)}
# # # 'data.frame':	228 obs. of  2 variables:
# # #  $ sex  : num  1 1 1 1 1 1 2 2 1 1 ...
# # #  $ Group: Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 1 2 2 ...
# # # > survival::lung |> dplyr::select(sex) %>% mutate(Group = c("Male", "Female")[.$sex] |> as.factor()) |> table(useNA="always") |> addmargins()
# # #    Group
# # # sex Female Male
# # #   1      0  138
# # #   2     90    0
# # 
# # cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
# # analyticDF_time2event |> dplyr::select(time, event, Group, StudyPopulation) %>% by(.$StudyPopulation, summary)
# # # > analyticDF_time2event |> dplyr::select(time, event, Group, StudyPopulation) %>% by(.$StudyPopulation, summary)
# # # .$StudyPopulation: FALSE
# # #       time     event            Group   StudyPopulation
# # #  Min.   : 5   Mode:logical   Female:1   Mode :logical  
# # #  1st Qu.:11   TRUE:9         Male  :8   FALSE:9        
# # #  Median :12                                            
# # #  Mean   :13                                            
# # #  3rd Qu.:13                                            
# # #  Max.   :26                                            
# # # ----  
# # # .$StudyPopulation: TRUE
# # #       time          event            Group     StudyPopulation
# # #  Min.   :  30.0   Mode :logical   Female: 89   Mode:logical   
# # #  1st Qu.: 176.5   FALSE:63        Male  :130   TRUE:219       
# # #  Median : 269.0   TRUE :156                                   
# # #  Mean   : 317.2                                               
# # #  3rd Qu.: 419.5                                               
# # #  Max.   :1022.0   
  



# MetaData$DSs$OriginalDS$DSN.na.omit = MetaData$DSs$OriginalDS$DSN |> paste0(".na.omit"); MetaData$DSs[[MetaData$DSs$OriginalDS$DSN.na.omit]] = list(DSN = MetaData$DSs$OriginalDS$DSN.na.omit)
# assign( MetaData$DSs$OriginalDS$DSN.na.omit, get(MetaData$DSs$OriginalDS$DSN) |> mutate_if(is.factor, as.character) ); 


# 


# I am trying to create a MetaData list object, which has list elements for each dataset I create. 
# Each element will contain a list of the DSN, CodeToCreateDS, and other metadata. I want to make the routine as a function, which takes inputs of `DSNShortcut.old`, `DSNShortcut.new.suffix` and `CodeToCreateDS` for the new dataset. 
# Can you improve the code?
    
rm(MetaData)
if(!exists("MetaData", envir=.GlobalEnv)) { assign("MetaData", list(), envir=.GlobalEnv) }  
if(!"CodeBook" %in% names(MetaData)) { MetaData$CodeBook = list() }
if(file.exists("CodeBook.xlsx")) { MetaData$CodeBook = readxl::read_xlsx("CodeBook.xlsx") }
if(!"DSs" %in% names(MetaData)) { MetaData$DSs = list() }


DSN0 = "analyticDF_time2event"
DSNShortcut = "DS" |> paste0("0")

MetaData$DSs[[DSNShortcut]] = list()
MetaData$DSs[[DSNShortcut]]$DSN = DSN0
MetaData$DSs[[DSNShortcut]]$CodeToCreateDS = 'survival::lung |> as_tibble() |> mutate(event = as.logical(status-1), Group = c("Male", "Female")[sex] |> as.factor(), StudyPopulation = time >= 30) |> dplyr::select(-status)'
assign(MetaData$DSs[[DSNShortcut]]$DSN, eval(parse(text = MetaData$DSs[[DSNShortcut]]$CodeToCreateDS)))

MetaData$DSs[[DSNShortcut]]$VarNames = names(get(MetaData$DSs[[DSNShortcut]]$DSN))
MetaData$DSs[[DSNShortcut]]$dim = dim(get(MetaData$DSs[[DSNShortcut]]$DSN))
MetaData |> str(max.level = 2, give.attr = TRUE)
# > MetaData |> str(max.level = 2, give.attr = TRUE)
# List of 2
#  $ CodeBook: list()
#  $ DSs:List of 1
#   ..$ DS0:List of 2
#   .. ..$ DSN: chr "analyticDF_time2event"
#   .. ..$ VarNames   : chr [1:12] "inst" "time" "age" "sex" ...
get(MetaData$DSs[[DSNShortcut]]$DSN) |> str(max.level = 2, give.attr = TRUE)
# > get(MetaData$DSs[[DSNShortcut]]$DSN) |> str(max.level = 2, give.attr = TRUE)
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

DSNShortcut.old = DSNShortcut
DSNShortcut.new.suffix = ".na.omit"
DSNShortcut.new = DSNShortcut.old |> paste0(DSNShortcut.new.suffix)
DSNShortcut.new
# > DSNShortcut.new
# [1] "DS0.na.omit


MetaData$DSs[[DSNShortcut.new]] = list()
MetaData$DSs[[DSNShortcut.new]]$DSN = MetaData$DSs[[DSNShortcut.old]]$DSN |> paste0(DSNShortcut.new.suffix)
MetaData$DSs[[DSNShortcut.new]]$CodeToCreateDS = "get(MetaData$DSs[[DSNShortcut.old]]$DSN) |> na.omit()"

MetaData |> str(max.level = 2, give.attr = TRUE)
assign(MetaData$DSs[[DSNShortcut.new]]$DSN, eval(parse(text = MetaData$DSs[[DSNShortcut.new]]$CodeToCreateDS)))
MetaData$DSs[[DSNShortcut.new]]$VarNames = names(get(MetaData$DSs[[DSNShortcut.new]]$DSN))
MetaData$DSs[[DSNShortcut.new]]$dim = dim(get(MetaData$DSs[[DSNShortcut.new]]$DSN))
MetaData |> str(max.level = 2, give.attr = TRUE)
# > MetaData |> str(max.level = 2, give.attr = TRUE)
# List of 2
#  $ CodeBook: list()
#  $ DSs:List of 2
#   ..$ DS0        :List of 4
#   .. ..$ DSN        : chr "analyticDF_time2event"
#   .. ..$ CodeToCreateDS: chr "survival::lung |> as_tibble() |> mutate(event = as.logical(status-1), Group = c(\"Male\", \"Female\")[sex] |> a"| __truncated__
#   .. ..$ VarNames           : chr [1:12] "inst" "time" "age" "sex" ...
#   .. ..$ dim                : int [1:2] 228 12
#   ..$ DS0.na.omit:List of 4
#   .. ..$ DSN        : chr "analyticDF_time2event.na.omit"
#   .. ..$ CodeToCreateDS: chr "get(MetaData$DSs[[DSNShortcut.old]]$DSN) |> na.omit()"
#   .. ..$ VarNames           : chr [1:12] "inst" "time" "age" "sex" ...
#   .. ..$ dim                : int [1:2] 167 12


