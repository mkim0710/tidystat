# data.CreateTableOne.source.r

library(tidyverse)
library(tableone)

#@ dataset.CreateTableOne -----
# dataset.tableone = dataset %>% select(-rowname, -PERSON_ID) %>% as.data.frame %>% 
#     CreateTableOne(data = ., test = T, includeNA = T)
dataset.tableone = dataset %>% 
    {.[map_lgl(., function(vec) n_distinct(vec) <= 10)]} %>% as.data.frame %>% 
    CreateTableOne(data = ., test = T, includeNA = T)
vars4IQR = names(dataset)[dataset %>% map_lgl(is.numeric)]
dataset.tableone %>% print(smd = T) #----
dataset.tableone %>% print(smd = T, nonnormal = vars4IQR) #----

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
dataset.tableone %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
    write.csv("dataset.tableone -clean.csv")
openxlsx::openXL("dataset.tableone -clean.csv")
# dataset.tableone %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
#     openxlsx::write.xlsx("dataset.tableone -clean.xlsx")
# openxlsx::openXL("dataset.tableone -clean.xlsx")
dataset.tableone %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
    openxlsx::write.xlsx("dataset.tableone.xlsx")
openxlsx::openXL("dataset.tableone.xlsx")
dataset.tableone %>% print(nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
    openxlsx::write.xlsx("dataset.tableone.IQR.xlsx")
openxlsx::openXL("dataset.tableone.IQR.xlsx")


#@ dataset.CreateTableOne.by_exposure -----
varnames4exposure =  c("treatment")
# dataset.tableone_by_exposure = dataset %>% select(-rowname, -PERSON_ID) %>% as.data.frame %>% 
#     CreateTableOne(strata = varnames4exposure, data = ., test = T, includeNA = T)
dataset.tableone_by_exposure = dataset %>% 
    {.[map_lgl(., function(vec) n_distinct(vec) <= 10)]} %>% as.data.frame %>% 
    CreateTableOne(strata = varnames4exposure, data = ., test = T, includeNA = T)
vars4IQR = names(dataset)[dataset %>% map_lgl(is.numeric)]
dataset.tableone_by_exposure %>% print(smd = T) #----
dataset.tableone_by_exposure %>% print(smd = T, nonnormal = vars4IQR) #----

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
dataset.tableone_by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("dataset.tableone_by_exposure -clean.csv")
openxlsx::openXL("dataset.tableone_by_exposure -clean.csv")
# dataset.tableone_by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>%
#     openxlsx::write.xlsx("dataset.tableone_by_exposure -clean.xlsx")
# openxlsx::openXL("dataset.tableone_by_exposure -clean.xlsx")
dataset.tableone_by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% {.[1, 5]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
    mutate(Group1 = {.[[2]]}, Group2 = {.[[3]]}) %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group2, into = paste0("Group2", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group1larger = ifelse(Group1mean>Group2mean, 1, 0), Group2larger = ifelse(Group1mean<Group2mean, 1, 0)) %>% 
    openxlsx::write.xlsx("dataset.tableone_by_exposure.xlsx")
openxlsx::openXL("dataset.tableone_by_exposure.xlsx")
dataset.tableone_by_exposure %>% print(smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("dataset.tableone_by_exposure.IQR.xlsx")
openxlsx::openXL("dataset.tableone_by_exposure.IQR.xlsx")




#@ library(survey) =====
library(survey)
?svydesign
#   data(api)
# # stratified sample
# dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
# # one-stage cluster sample
# dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
# # two-stage cluster sample: weights computed from population sizes.
# dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)
# 
# ## multistage sampling has no effect when fpc is not given, so
# ## these are equivalent.
# dclus2wr<-svydesign(id=~dnum+snum, weights=weights(dclus2), data=apiclus2)
# dclus2wr2<-svydesign(id=~dnum, weights=weights(dclus2), data=apiclus2)
# 
# ## syntax for stratified cluster sample
# ##(though the data weren't really sampled this way)
# svydesign(id=~dnum, strata=~stype, weights=~pw, data=apistrat,
# nest=TRUE)
# 
# ## PPS sampling without replacement
# data(election)
# dpps<- svydesign(id=~1, fpc=~p, data=election_pps, pps="brewer")
# 
# ##database example: requires RSQLite
# ## Not run: 
# library(RSQLite)
# dbclus1<-svydesign(id=~dnum, weights=~pw, fpc=~fpc,
# data="apiclus1",dbtype="SQLite", dbname=system.file("api.db",package="survey"))
# 
# ## End(Not run)


dataset.svydesign = dataset %>% svydesign(id = ~PrimarySamplingUnit, strata = ~SamplingStrata, weights = ~SamplingWeight, nest = TRUE, data = . , pps="brewer")
# dataset.svydesign = dataset %>% svydesign(id = ~PSUNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")



#@ dataset.svydesign.svyCreateTableOne -----
dataset.svydesign.tableone = dataset.svydesign %>% select(-rowname, -PERSON_ID) %>%
    svyCreateTableOne(data = ., test = T, includeNA = T)
vars4IQR = names(dataset.svydesign)[dataset.svydesign %>% map_lgl(is.numeric)]
dataset.svydesign.tableone %>% print(smd = T)
dataset.svydesign.tableone %>% print(smd = T, nonnormal = vars4IQR)

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
dataset.svydesign.tableone %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
    write.csv("dataset.svydesign.tableone -clean.csv")
openxlsx::openXL("dataset.svydesign.tableone -clean.csv")
# dataset.svydesign.tableone %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
#     openxlsx::write.xlsx("dataset.svydesign.tableone -clean.xlsx")
# openxlsx::openXL("dataset.svydesign.tableone -clean.xlsx")
dataset.svydesign.tableone %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
    openxlsx::write.xlsx("dataset.svydesign.tableone.xlsx")
openxlsx::openXL("dataset.svydesign.tableone.xlsx")
dataset.svydesign.tableone %>% print(nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("dataset.svydesign.tableone.IQR.xlsx")
openxlsx::openXL("dataset.svydesign.tableone.IQR.xlsx")


#@ dataset.svydesign.svyCreateTableOne.by_exposure -----
varnames4exposure =  c("treatment")
# dataset.svydesign.tableone_by_exposure = dataset.svydesign %>% select(-rowname, -PERSON_ID) %>%
#     svyCreateTableOne(strata = varnames4exposure, data = ., test = T, includeNA = T)
# # Error in dimnames(x) <- dn : 
# #   length of 'dimnames' [2] not equal to array extent
dataset.svydesign.tableone_by_exposure = dataset.svydesign %>% select(-rowname, -PERSON_ID) %>%
    svyCreateTableOne(strata = varnames4exposure, data = ., test = T)
vars4IQR = names(dataset.svydesign)[dataset.svydesign %>% map_lgl(is.numeric)]
dataset.svydesign.tableone_by_exposure %>% print(smd = T)
dataset.svydesign.tableone_by_exposure %>% print(smd = T, nonnormal = vars4IQR)

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
dataset.svydesign.tableone_by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("dataset.svydesign.tableone_by_exposure -clean.csv")
openxlsx::openXL("dataset.svydesign.tableone_by_exposure -clean.csv")
# dataset.svydesign.tableone_by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>%
#     openxlsx::write.xlsx("dataset.svydesign.tableone_by_exposure -clean.xlsx")
# openxlsx::openXL("dataset.svydesign.tableone_by_exposure -clean.xlsx")
dataset.svydesign.tableone_by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% {.[1, 5]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
    mutate(Group1 = {.[[2]]}, Group2 = {.[[3]]}) %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group2, into = paste0("Group2", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group1larger = ifelse(Group1mean>Group2mean, 1, 0), Group2larger = ifelse(Group1mean<Group2mean, 1, 0)) %>% 
    openxlsx::write.xlsx("dataset.svydesign.tableone_by_exposure.xlsx")
openxlsx::openXL("dataset.svydesign.tableone_by_exposure.xlsx")
dataset.svydesign.tableone_by_exposure %>% print(smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("dataset.svydesign.tableone_by_exposure.IQR.xlsx")
openxlsx::openXL("dataset.svydesign.tableone_by_exposure.IQR.xlsx")



#@ ------
df = JK02.2079.CCW.MIN_Date.ge365_EndTime.is.Case.confirm.365.Match.TimeFrame1$LookBackWindow.gt.1y %>% 
  filter(MatchingCtrlNum %in% c(0, 1)) %>%
  select(AcquiredHypothyroidism: VisualImpairment, EndTime.is.Case.confirm.365)
df
df %>% 
  CreateTableOne(strata = treatment, data = ., test=FALSE) %>% 
  print(smd = T)



#@ Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne -----
<<<<<<< HEAD

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% str(max.level = 1)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% str(max.level = 1)
# List of 5
#  $ _3yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _4yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _5yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _6yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _7yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% str
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% filter(level == "DTH_MDY")
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is
#       n miss p.miss          level  freq   percent cum.percent
# 1 53377    0      0     2013-12-31  1163  2.178841    2.178841
# 2 53377    0      0        DTH_MDY  4920  9.217453   11.396294
# 3 53377    0      0   RECU_FR_DT_C 40873 76.574180   87.970474
# 4 53377    0      0 RECU_FR_DT_C16  6421 12.029526  100.000000
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% str
# 'data.frame':	4 obs. of  7 variables:
#  $ n          : int  53377 53377 53377 53377
#  $ miss       : int  0 0 0 0
#  $ p.miss     : num  0 0 0 0
#  $ level      : Factor w/ 4 levels "2013-12-31","DTH_MDY",..: 1 2 3 4
#  $ freq       : 'table' int [1:4(1d)] 1163 4920 40873 6421
#   ..- attr(*, "dimnames")=List of 1
#   .. ..$ x: chr  "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#  $ percent    : table [1:4(1d)] 2.18 9.22 76.57 12.03
#   ..- attr(*, "dimnames")=List of 1
#   .. ..$ x: chr  "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#  $ cum.percent: num  2.18 11.4 87.97 100
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% filter(level == "DTH_MDY")
#       n miss p.miss   level freq  percent cum.percent
# 1 53377    0      0 DTH_MDY 4920 9.217453    11.39629

attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is
attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% str
attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% sum
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is
#                 is.dropped_5yr
# enddate.is        FALSE   TRUE
#   2013-12-31     385578   1163
#   DTH_MDY         12341   4920
#   RECU_FR_DT_C    56833  40873
#   RECU_FR_DT_C16   6737   6421
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% str
#  'xtabs' int [1:4, 1:2] 385578 12341 56833 6737 1163 4920 40873 6421
#  - attr(*, "dimnames")=List of 2
#   ..$ enddate.is    : chr [1:4] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#   ..$ is.dropped_5yr: chr [1:2] "FALSE" "TRUE"
#  - attr(*, "call")= language xtabs(formula = formula, data = dat)
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% sum
# [1] 514866


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
    ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
})
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
# +     ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
# + })
# $`_3yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 33330    0      0        DTH_MDY 2090  6.270627    9.177918
# 2 33330    0      0 RECU_FR_DT_C16 4317 12.952295  100.000000
# 
# $`_4yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 43643    0      0        DTH_MDY 3471  7.953165    10.41862
# 2 43643    0      0 RECU_FR_DT_C16 5430 12.441858   100.00000
# 
# $`_5yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 53377    0      0        DTH_MDY 4920  9.217453    11.39629
# 2 53377    0      0 RECU_FR_DT_C16 6421 12.029526   100.00000
# 
# $`_6yr`
#       n miss p.miss          level freq  percent cum.percent
# 1 63438    0      0        DTH_MDY 6552 10.32819    12.36325
# 2 63438    0      0 RECU_FR_DT_C16 7333 11.55932   100.00000
# 
# $`_7yr`
#       n miss p.miss          level freq  percent cum.percent
# 1 74397    0      0        DTH_MDY 8120 10.91442    12.76127
# 2 74397    0      0 RECU_FR_DT_C16 8312 11.17249   100.00000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
    # print(Sys.time())
    #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))

    out = ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
    out = out %>% rownames_to_column
    names(out)[1] = "parent"
    out$parent = names(parent.x)[i]
    out
}) %>% reduce(rbind)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
# +     # Codes to insert inside in the beginning annonymous function for map
# +     parent.x = get(".x", envir = parent.frame())
# +     i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))
# + 
# +     # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
# +     # print(Sys.time())
# +     #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
# +     cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))
# + 
# +     out = ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
# +     out = out %>% rownames_to_column
# +     names(out)[1] = "parent"
# +     out$parent = names(parent.x)[i]
# +     out
# + }) %>% reduce(rbind)
# Beginning .f() map from list element [[1]] named: _3yr  #---- 
# Beginning .f() map from list element [[2]] named: _4yr  #---- 
# Beginning .f() map from list element [[3]] named: _5yr  #---- 
# Beginning .f() map from list element [[4]] named: _6yr  #---- 
# Beginning .f() map from list element [[5]] named: _7yr  #---- 
#    parent     n miss p.miss          level freq   percent cum.percent
# 1    _3yr 33330    0      0        DTH_MDY 2090  6.270627    9.177918
# 2    _3yr 33330    0      0 RECU_FR_DT_C16 4317 12.952295  100.000000
# 3    _4yr 43643    0      0        DTH_MDY 3471  7.953165   10.418624
# 4    _4yr 43643    0      0 RECU_FR_DT_C16 5430 12.441858  100.000000
# 5    _5yr 53377    0      0        DTH_MDY 4920  9.217453   11.396294
# 6    _5yr 53377    0      0 RECU_FR_DT_C16 6421 12.029526  100.000000
# 7    _6yr 63438    0      0        DTH_MDY 6552 10.328194   12.363252
# 8    _6yr 63438    0      0 RECU_FR_DT_C16 7333 11.559318  100.000000
# 9    _7yr 74397    0      0        DTH_MDY 8120 10.914419   12.761267
# 10   _7yr 74397    0      0 RECU_FR_DT_C16 8312 11.172494  100.000000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is = Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
    # print(Sys.time())
    #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))

    # out = ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
    out = ob$CatTable$`TRUE`$enddate.is
    out = out %>% rownames_to_column
    names(out)[1] = "parent"
    out$parent = names(parent.x)[i]
    out
}) %>% reduce(rbind)
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is
#    parent     n miss p.miss          level  freq   percent cum.percent
# 1    _3yr 33330    0      0     2013-12-31   969  2.907291    2.907291
# 2    _3yr 33330    0      0        DTH_MDY  2090  6.270627    9.177918
# 3    _3yr 33330    0      0   RECU_FR_DT_C 25954 77.869787   87.047705
# 4    _3yr 33330    0      0 RECU_FR_DT_C16  4317 12.952295  100.000000
# 5    _4yr 43643    0      0     2013-12-31  1076  2.465458    2.465458
# 6    _4yr 43643    0      0        DTH_MDY  3471  7.953165   10.418624
# 7    _4yr 43643    0      0   RECU_FR_DT_C 33666 77.139518   87.558142
# 8    _4yr 43643    0      0 RECU_FR_DT_C16  5430 12.441858  100.000000
# 9    _5yr 53377    0      0     2013-12-31  1163  2.178841    2.178841
# 10   _5yr 53377    0      0        DTH_MDY  4920  9.217453   11.396294
# 11   _5yr 53377    0      0   RECU_FR_DT_C 40873 76.574180   87.970474
# 12   _5yr 53377    0      0 RECU_FR_DT_C16  6421 12.029526  100.000000
# 13   _6yr 63438    0      0     2013-12-31  1291  2.035058    2.035058
# 14   _6yr 63438    0      0        DTH_MDY  6552 10.328194   12.363252
# 15   _6yr 63438    0      0   RECU_FR_DT_C 48262 76.077430   88.440682
# 16   _6yr 63438    0      0 RECU_FR_DT_C16  7333 11.559318  100.000000
# 17   _7yr 74397    0      0     2013-12-31  1374  1.846849    1.846849
# 18   _7yr 74397    0      0        DTH_MDY  8120 10.914419   12.761267
# 19   _7yr 74397    0      0   RECU_FR_DT_C 56591 76.066239   88.827506
# 20   _7yr 74397    0      0 RECU_FR_DT_C16  8312 11.172494  100.000000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "DTH_MDY") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq), cancer.increased = n.increased - freq.increased)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "DTH_MDY") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq), cancer.increased = n.increased - freq.increased)
#   parent     n miss p.miss   level freq   percent cum.percent n.increased freq.increased cancer.increased
# 1   _3yr 33330    0      0 DTH_MDY 2090  6.270627    9.177918          NA             NA               NA
# 2   _4yr 43643    0      0 DTH_MDY 3471  7.953165   10.418624       10313           1381             8932
# 3   _5yr 53377    0      0 DTH_MDY 4920  9.217453   11.396294        9734           1449             8285
# 4   _6yr 63438    0      0 DTH_MDY 6552 10.328194   12.363252       10061           1632             8429
# 5   _7yr 74397    0      0 DTH_MDY 8120 10.914419   12.761267       10959           1568             9391

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "RECU_FR_DT_C16") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq))
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "RECU_FR_DT_C16") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq))
#   parent     n miss p.miss          level freq  percent cum.percent n.increased freq.increased
# 1   _3yr 33330    0      0 RECU_FR_DT_C16 4317 12.95230         100          NA             NA
# 2   _4yr 43643    0      0 RECU_FR_DT_C16 5430 12.44186         100       10313           1113
# 3   _5yr 53377    0      0 RECU_FR_DT_C16 6421 12.02953         100        9734            991
# 4   _6yr 63438    0      0 RECU_FR_DT_C16 7333 11.55932         100       10061            912
# 5   _7yr 74397    0      0 RECU_FR_DT_C16 8312 11.17249         100       10959            979

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% str
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% str
# 'data.frame':	20 obs. of  8 variables:
#  $ parent     : chr  "_3yr" "_3yr" "_3yr" "_3yr" ...
#  $ n          : int  33330 33330 33330 33330 43643 43643 43643 43643 53377 53377 ...
#  $ miss       : int  0 0 0 0 0 0 0 0 0 0 ...
#  $ p.miss     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ level      : Factor w/ 4 levels "2013-12-31","DTH_MDY",..: 1 2 3 4 1 2 3 4 1 2 ...
#  $ freq       :Class 'table'  Named int [1:20] 969 2090 25954 4317 1076 3471 33666 5430 1163 4920 ...
#   .. ..- attr(*, "names")= chr [1:20] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16" ...
#  $ percent    :Class 'table'  Named num [1:20] 2.91 6.27 77.87 12.95 2.47 ...
#   .. ..- attr(*, "names")= chr [1:20] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16" ...
#  $ cum.percent: num  2.91 9.18 87.05 100 2.47 ...


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = parent, y = freq, color = level)) + geom_point()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = as.factor(parent), y = freq, color = level)) + geom_point()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = as.numeric(as.factor(parent)), y = freq, color = level)) + geom_point()
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
# +     ggplot(aes(x = parent, y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
# +     ggplot(aes(x = as.factor(parent), y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
# +     ggplot(aes(x = as.numeric(as.factor(parent)), y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = parent, y = as.numeric(freq), group = level, color = level)) + geom_point() + geom_smooth(method = lm)


#@ end ------
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list = list()
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list$by.evnttrth_C16_r =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.by.evnttrth_C16_r
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list$by.total_ddd_yr_ASPIRIN.dyd.gt0 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.by.total_ddd_yr_ASPIRIN.dyd.gt0
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list$by.total_ddd_yr_ASPIRIN.bin30 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.by.total_ddd_yr_ASPIRIN.bin30
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list$by.total_ddd_yr_ASPIRIN.dyd.gt1 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.by.total_ddd_yr_ASPIRIN.dyd.gt1
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list$by.total_ddd_yr_ASPIRIN.dyd.gt4 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.by.total_ddd_yr_ASPIRIN.dyd.gt4
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list$by.total_ddd_yr_ASPIRIN.cut365 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.by.total_ddd_yr_ASPIRIN.cut365
save(analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list, file = "analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list.rda")

analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list %>% map(function(ob) {
    ob %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column
}) %>% openxlsx::write.xlsx("analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_vars23.CreateTableOne.list.xlsx")
=======

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% str(max.level = 1)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% str(max.level = 1)
# List of 5
#  $ _3yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _4yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _5yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _6yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ _7yr:List of 3
#   ..- attr(*, "class")= chr "TableOne"

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% str
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% filter(level == "DTH_MDY")
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is
#       n miss p.miss          level  freq   percent cum.percent
# 1 53377    0      0     2013-12-31  1163  2.178841    2.178841
# 2 53377    0      0        DTH_MDY  4920  9.217453   11.396294
# 3 53377    0      0   RECU_FR_DT_C 40873 76.574180   87.970474
# 4 53377    0      0 RECU_FR_DT_C16  6421 12.029526  100.000000
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% str
# 'data.frame':	4 obs. of  7 variables:
#  $ n          : int  53377 53377 53377 53377
#  $ miss       : int  0 0 0 0
#  $ p.miss     : num  0 0 0 0
#  $ level      : Factor w/ 4 levels "2013-12-31","DTH_MDY",..: 1 2 3 4
#  $ freq       : 'table' int [1:4(1d)] 1163 4920 40873 6421
#   ..- attr(*, "dimnames")=List of 1
#   .. ..$ x: chr  "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#  $ percent    : table [1:4(1d)] 2.18 9.22 76.57 12.03
#   ..- attr(*, "dimnames")=List of 1
#   .. ..$ x: chr  "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#  $ cum.percent: num  2.18 11.4 87.97 100
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable$`TRUE`$enddate.is %>% filter(level == "DTH_MDY")
#       n miss p.miss   level freq  percent cum.percent
# 1 53377    0      0 DTH_MDY 4920 9.217453    11.39629

attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is
attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% str
attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% sum
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is
#                 is.dropped_5yr
# enddate.is        FALSE   TRUE
#   2013-12-31     385578   1163
#   DTH_MDY         12341   4920
#   RECU_FR_DT_C    56833  40873
#   RECU_FR_DT_C16   6737   6421
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% str
#  'xtabs' int [1:4, 1:2] 385578 12341 56833 6737 1163 4920 40873 6421
#  - attr(*, "dimnames")=List of 2
#   ..$ enddate.is    : chr [1:4] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#   ..$ is.dropped_5yr: chr [1:2] "FALSE" "TRUE"
#  - attr(*, "call")= language xtabs(formula = formula, data = dat)
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne$`_5yr`$CatTable,"xtabs")$enddate.is %>% sum
# [1] 514866


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
    ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
})
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
# +     ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
# + })
# $`_3yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 33330    0      0        DTH_MDY 2090  6.270627    9.177918
# 2 33330    0      0 RECU_FR_DT_C16 4317 12.952295  100.000000
# 
# $`_4yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 43643    0      0        DTH_MDY 3471  7.953165    10.41862
# 2 43643    0      0 RECU_FR_DT_C16 5430 12.441858   100.00000
# 
# $`_5yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 53377    0      0        DTH_MDY 4920  9.217453    11.39629
# 2 53377    0      0 RECU_FR_DT_C16 6421 12.029526   100.00000
# 
# $`_6yr`
#       n miss p.miss          level freq  percent cum.percent
# 1 63438    0      0        DTH_MDY 6552 10.32819    12.36325
# 2 63438    0      0 RECU_FR_DT_C16 7333 11.55932   100.00000
# 
# $`_7yr`
#       n miss p.miss          level freq  percent cum.percent
# 1 74397    0      0        DTH_MDY 8120 10.91442    12.76127
# 2 74397    0      0 RECU_FR_DT_C16 8312 11.17249   100.00000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
    # print(Sys.time())
    #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))

    out = ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
    out = out %>% rownames_to_column
    names(out)[1] = "parent"
    out$parent = names(parent.x)[i]
    out
}) %>% reduce(rbind)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
# +     # Codes to insert inside in the beginning annonymous function for map
# +     parent.x = get(".x", envir = parent.frame())
# +     i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))
# + 
# +     # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
# +     # print(Sys.time())
# +     #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
# +     cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))
# + 
# +     out = ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
# +     out = out %>% rownames_to_column
# +     names(out)[1] = "parent"
# +     out$parent = names(parent.x)[i]
# +     out
# + }) %>% reduce(rbind)
# Beginning .f() map from list element [[1]] named: _3yr  #---- 
# Beginning .f() map from list element [[2]] named: _4yr  #---- 
# Beginning .f() map from list element [[3]] named: _5yr  #---- 
# Beginning .f() map from list element [[4]] named: _6yr  #---- 
# Beginning .f() map from list element [[5]] named: _7yr  #---- 
#    parent     n miss p.miss          level freq   percent cum.percent
# 1    _3yr 33330    0      0        DTH_MDY 2090  6.270627    9.177918
# 2    _3yr 33330    0      0 RECU_FR_DT_C16 4317 12.952295  100.000000
# 3    _4yr 43643    0      0        DTH_MDY 3471  7.953165   10.418624
# 4    _4yr 43643    0      0 RECU_FR_DT_C16 5430 12.441858  100.000000
# 5    _5yr 53377    0      0        DTH_MDY 4920  9.217453   11.396294
# 6    _5yr 53377    0      0 RECU_FR_DT_C16 6421 12.029526  100.000000
# 7    _6yr 63438    0      0        DTH_MDY 6552 10.328194   12.363252
# 8    _6yr 63438    0      0 RECU_FR_DT_C16 7333 11.559318  100.000000
# 9    _7yr 74397    0      0        DTH_MDY 8120 10.914419   12.761267
# 10   _7yr 74397    0      0 RECU_FR_DT_C16 8312 11.172494  100.000000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is = Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
    # print(Sys.time())
    #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))

    # out = ob$CatTable$`TRUE`$enddate.is %>% filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
    out = ob$CatTable$`TRUE`$enddate.is
    out = out %>% rownames_to_column
    names(out)[1] = "parent"
    out$parent = names(parent.x)[i]
    out
}) %>% reduce(rbind)
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is
#    parent     n miss p.miss          level  freq   percent cum.percent
# 1    _3yr 33330    0      0     2013-12-31   969  2.907291    2.907291
# 2    _3yr 33330    0      0        DTH_MDY  2090  6.270627    9.177918
# 3    _3yr 33330    0      0   RECU_FR_DT_C 25954 77.869787   87.047705
# 4    _3yr 33330    0      0 RECU_FR_DT_C16  4317 12.952295  100.000000
# 5    _4yr 43643    0      0     2013-12-31  1076  2.465458    2.465458
# 6    _4yr 43643    0      0        DTH_MDY  3471  7.953165   10.418624
# 7    _4yr 43643    0      0   RECU_FR_DT_C 33666 77.139518   87.558142
# 8    _4yr 43643    0      0 RECU_FR_DT_C16  5430 12.441858  100.000000
# 9    _5yr 53377    0      0     2013-12-31  1163  2.178841    2.178841
# 10   _5yr 53377    0      0        DTH_MDY  4920  9.217453   11.396294
# 11   _5yr 53377    0      0   RECU_FR_DT_C 40873 76.574180   87.970474
# 12   _5yr 53377    0      0 RECU_FR_DT_C16  6421 12.029526  100.000000
# 13   _6yr 63438    0      0     2013-12-31  1291  2.035058    2.035058
# 14   _6yr 63438    0      0        DTH_MDY  6552 10.328194   12.363252
# 15   _6yr 63438    0      0   RECU_FR_DT_C 48262 76.077430   88.440682
# 16   _6yr 63438    0      0 RECU_FR_DT_C16  7333 11.559318  100.000000
# 17   _7yr 74397    0      0     2013-12-31  1374  1.846849    1.846849
# 18   _7yr 74397    0      0        DTH_MDY  8120 10.914419   12.761267
# 19   _7yr 74397    0      0   RECU_FR_DT_C 56591 76.066239   88.827506
# 20   _7yr 74397    0      0 RECU_FR_DT_C16  8312 11.172494  100.000000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "DTH_MDY") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq), cancer.increased = n.increased - freq.increased)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "DTH_MDY") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq), cancer.increased = n.increased - freq.increased)
#   parent     n miss p.miss   level freq   percent cum.percent n.increased freq.increased cancer.increased
# 1   _3yr 33330    0      0 DTH_MDY 2090  6.270627    9.177918          NA             NA               NA
# 2   _4yr 43643    0      0 DTH_MDY 3471  7.953165   10.418624       10313           1381             8932
# 3   _5yr 53377    0      0 DTH_MDY 4920  9.217453   11.396294        9734           1449             8285
# 4   _6yr 63438    0      0 DTH_MDY 6552 10.328194   12.363252       10061           1632             8429
# 5   _7yr 74397    0      0 DTH_MDY 8120 10.914419   12.761267       10959           1568             9391

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "RECU_FR_DT_C16") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq))
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% filter(level == "RECU_FR_DT_C16") %>% mutate(n.increased = n - lag(n), freq.increased = freq - lag(freq))
#   parent     n miss p.miss          level freq  percent cum.percent n.increased freq.increased
# 1   _3yr 33330    0      0 RECU_FR_DT_C16 4317 12.95230         100          NA             NA
# 2   _4yr 43643    0      0 RECU_FR_DT_C16 5430 12.44186         100       10313           1113
# 3   _5yr 53377    0      0 RECU_FR_DT_C16 6421 12.02953         100        9734            991
# 4   _6yr 63438    0      0 RECU_FR_DT_C16 7333 11.55932         100       10061            912
# 5   _7yr 74397    0      0 RECU_FR_DT_C16 8312 11.17249         100       10959            979

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% str
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% str
# 'data.frame':	20 obs. of  8 variables:
#  $ parent     : chr  "_3yr" "_3yr" "_3yr" "_3yr" ...
#  $ n          : int  33330 33330 33330 33330 43643 43643 43643 43643 53377 53377 ...
#  $ miss       : int  0 0 0 0 0 0 0 0 0 0 ...
#  $ p.miss     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ level      : Factor w/ 4 levels "2013-12-31","DTH_MDY",..: 1 2 3 4 1 2 3 4 1 2 ...
#  $ freq       :Class 'table'  Named int [1:20] 969 2090 25954 4317 1076 3471 33666 5430 1163 4920 ...
#   .. ..- attr(*, "names")= chr [1:20] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16" ...
#  $ percent    :Class 'table'  Named num [1:20] 2.91 6.27 77.87 12.95 2.47 ...
#   .. ..- attr(*, "names")= chr [1:20] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16" ...
#  $ cum.percent: num  2.91 9.18 87.05 100 2.47 ...


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = parent, y = freq, color = level)) + geom_point()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = as.factor(parent), y = freq, color = level)) + geom_point()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = as.numeric(as.factor(parent)), y = freq, color = level)) + geom_point()
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
# +     ggplot(aes(x = parent, y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
# +     ggplot(aes(x = as.factor(parent), y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
# +     ggplot(aes(x = as.numeric(as.factor(parent)), y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.CreateTableOne.TRUE_enddate.is %>% 
    ggplot(aes(x = parent, y = as.numeric(freq), group = level, color = level)) + geom_point() + geom_smooth(method = lm)


#@ end -----
>>>>>>> db6e06ea321af01b11113949dac8faecaa97aad5
