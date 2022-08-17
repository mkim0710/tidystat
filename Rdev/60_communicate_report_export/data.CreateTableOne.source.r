# data.CreateTableOne.source.r

library(tidyverse)
library(tableone)

# #@ DataSet.CreateTableOne -----
# # DataSet.TableOne = DataSet %>% select(-rowname, -PERSON_ID) %>% as.data.frame %>% 
# #     CreateTableOne(data = ., test = T, includeNA = T, addOverall = T)
# DataSet.TableOne = DataSet %>% 
#     {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 19) )]} %>% as.data.frame %>%  # debug181115 not to remove numeric 
#     CreateTableOne(data = ., test = T, includeNA = T, addOverall = T)
# DataSet.is.na.TableOne = DataSet %>% 
#     map_df(is.na) %>% setNames(paste0(names(.), ".is.na")) %>% 
#     as.data.frame %>%  # debug181115 not to remove numeric 
#     CreateTableOne(data = ., test = T, includeNA = T, addOverall = T)

# vars4IQR = names(DataSet)[DataSet %>% map_lgl(is.numeric)]

# sink("DataSet.TableOne.txt", append = FALSE)
# DataSet.TableOne %>% print(showAllLevels = F, smd = T) #----
# sink()
# sink("DataSet.TableOne.IQR.txt", append = FALSE)
# DataSet.TableOne %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR) #----
# sink()


# # =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ----
# DataSet.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
#     write.csv("DataSet.TableOne -clean.csv")
# DataSet.is.na.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
#     write.csv("DataSet.is.na.TableOne -clean.csv")
# # openxlsx::openXL("DataSet.TableOne -clean.csv")

# list(
#     TableOne = DataSet.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column
#     , TableOne.IQR = DataSet.TableOne %>% print(showAllLevels = F, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column
#     , is.na.TableOne = DataSet.is.na.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column
# ) %>% openxlsx::write.xlsx("DataSet.TableOne.xlsx")
# # openxlsx::openXL("DataSet.TableOne.xlsx")



               
               
               
               
               
#@ DataSet.TableOne.byExposure -----
DataSet %>% summarise_all(function(x) sum(is.na(x))) %>% t #-----
DataSet.select = DataSet %>% as.data.frame %>% select(-rowname, -PERSON_ID) %>% 
    # mutate(Intervention = ifelse(Intervention.ge1 == T, "Intervention", "Control") %>% as.factor)
    # mutate(Intervention = ifelse(Intervention.ge1 == T, "Intervention >= 1", "Intervention == 0") %>% as.factor)
    mutate(InterventionGroup = ifelse(Intervention.ge1 == T, "Group 1", "Group 0") %>% as.factor)
DataSet.select %>% summarise_all(function(x) sum(is.na(x))) %>% t #-----
# DataSet.select %>% mutate_if(is.numeric, replace_na, 0)
                          
Varnames4Exposure =  c("InterventionGroup")
# DataSet.TableOne_byExposure = DataSet.select %>% as.data.frame %>% 
#     CreateTableOne(strata = Varnames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
DataSet.TableOne_byExposure = DataSet.select %>% 
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>% as.data.frame %>%  # debug181115 not to remove numeric 
    CreateTableOne(strata = Varnames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
DataSet.select.is.na.TableOne_byExposure = DataSet.select %>%
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>%
    map_df(is.na) %>% setNames(paste0(names(.), ".is.na") %>% str_replace_all("\\`", "")) %>%  # debug) Error in parse(text = x, keep.source = FALSE)
    # mutate( !!rlang::sym(Varnames4Exposure) := DataSet.select[[Varnames4Exposure]]) %>%
    cbind(DataSet.select[Varnames4Exposure]) %>%
    as.data.frame %>%
    CreateTableOne(strata = Varnames4Exposure, data = ., test = T, includeNA = T, addOverall = T)

vars4IQR = names(DataSet.select)[DataSet.select %>% map_lgl(is.numeric)]

sink("DataSet.TableOne_byExposure.txt", append = FALSE)
DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T) #----
sink()
sink("DataSet.TableOne_byExposure.IQR.txt", append = FALSE)
DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR) #----
sink()


# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ----
DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("DataSet.TableOne_byExposure -clean.csv")
# openxlsx::openXL("DataSet.TableOne_byExposure -clean.csv")
DataSet.TableOne_byExposure %>% print(showAllLevels = T, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("DataSet.TableOne_byExposure.AllLevels -clean.csv")
# openxlsx::openXL("DataSet.TableOne_byExposure.AllLevels -clean.csv")
DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
    write.csv("DataSet.TableOne_byExposure.IQR -clean.csv")
# openxlsx::openXL("DataSet.TableOne_byExposure.IQR -clean.csv")

list(
    `byExposure -add column` = DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% # {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
        select(rowname, Overall, `Group 0`, `Group 1`, SMD, p, test) %>% 
        mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) %>%  # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
        add_column(Label = "", .before = "Overall") %>% {add_column(., `#` = 1:nrow(.), `#2` = "", Class = "", .before = 1)} %>%
        as.tibble
    , byExposure = DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% # {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
        mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
    , byExposure.AllLevels = DataSet.TableOne_byExposure %>% print(showAllLevels = T, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% # {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
        mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
    , byExposure.IQR = DataSet.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column
    , is.na.byExposure = DataSet.select.is.na.TableOne_byExposure %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column
) %>% openxlsx::write.xlsx("DataSet.TableOne_byExposure.xlsx")
openxlsx::openXL("DataSet.TableOne_byExposure.xlsx")




















# DataSet = n1_2016_withlabels_EPI522_merge_n2_recode1026.factor.mutate %>% filter(!is.na(Cigar)) %>% filter(!n1ah0287 %in% c(1, 3, 9)) %>% select(-seqnum:-`_merge`, -matches("^count"))
DataSet = n1_2016_withlabels_EPI522_merge_n2_recode1026.factor.mutate %>% select(-seqnum:-`_merge`, -matches("^count"))
DataSet = DataSet %>% mutate(
    Male.lgl = Male %>% as.logical
    , RaceWhite.lgl = RaceWhite %>% as.logical
    , HighSchoolLastYear.lgl = HighSchoolLastYear %>% as.logical
    , College1Year.lgl = College1Year %>% as.logical
    , CollegeGraduate.lgl = CollegeGraduate %>% as.logical
    , FamilyIncome_ge7000.lgl = FamilyIncome_ge7000 %>% as.logical
    , FamilyIncome_ge8000.lgl = FamilyIncome_ge8000 %>% as.logical
    , PMHx_diabetes.lgl = PMHx_diabetes %>% as.logical
    , PMHx_highBP.lgl = PMHx_highBP %>% as.logical
)

DataSet %>% select(N1GM0392_recode, N1GM0394_recode, Cigar) %>% summary #----
# > DataSet %>% select(N1GM0392_recode, N1GM0394_recode, Cigar) %>% summary #----
#  N1GM0392_recode  N1GM0394_recode      Cigar        
#  Min.   : 0.000   Min.   : 0.000   Min.   :  24.99  
#  1st Qu.: 0.214   1st Qu.: 0.000   1st Qu.:  24.99  
#  Median : 0.643   Median : 0.500   Median :  24.99  
#  Mean   : 2.030   Mean   : 5.121   Mean   :  34.07  
#  3rd Qu.: 2.500   3rd Qu.: 7.000   3rd Qu.:  24.99  
#  Max.   :20.000   Max.   :50.000   Max.   :3910.71  
#  NA's   :13960    NA's   :13857    NA's   :7502 

DataSet = DataSet %>% mutate(
    MissingPattern = is.na(Cigar) * 100 + is.na(N1GM0392_recode) * 10 + is.na(N1GM0394_recode)
    , MissingPattern = as.factor(MissingPattern)
)


#@ DataSet.CreateTableOne.by_MissingPattern -----
Varnames4MissingPattern =  c("MissingPattern")
# DataSet.TableOne_by_MissingPattern = DataSet %>% select(-rowname, -PERSON_ID) %>% as.data.frame %>% 
#     CreateTableOne(strata = Varnames4MissingPattern, data = ., test = T, includeNA = T, addOverall = T)
DataSet.TableOne_by_MissingPattern = DataSet %>% 
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>% as.data.frame %>%  # debug181115 not to remove numeric 
    CreateTableOne(strata = Varnames4MissingPattern, data = ., test = T, includeNA = T, addOverall = T)
vars4IQR = names(DataSet)[DataSet %>% map_lgl(is.numeric)]

sink("DataSet.TableOne_by_MissingPattern.txt", append = FALSE)
DataSet.TableOne_by_MissingPattern %>% print(showAllLevels = F, smd = T) #----
sink("DataSet.TableOne_by_MissingPattern.IQR.txt", append = FALSE)
DataSet.TableOne_by_MissingPattern %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR) #----
sink()


# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ----
DataSet.TableOne_by_MissingPattern %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("DataSet.TableOne_by_MissingPattern -clean.csv")
openxlsx::openXL("DataSet.TableOne_by_MissingPattern -clean.csv")
# DataSet.TableOne_by_MissingPattern %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>%
#     openxlsx::write.xlsx("DataSet.TableOne_by_MissingPattern -clean.xlsx")
# openxlsx::openXL("DataSet.TableOne_by_MissingPattern -clean.xlsx")
DataSet.TableOne_by_MissingPattern %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
    mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) %>%  # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
    openxlsx::write.xlsx("DataSet.TableOne_by_MissingPattern.xlsx")
# openxlsx::openXL("DataSet.TableOne_by_MissingPattern.xlsx")
DataSet.TableOne_by_MissingPattern %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("DataSet.TableOne_by_MissingPattern.IQR.xlsx")
# openxlsx::openXL("DataSet.TableOne_by_MissingPattern.IQR.xlsx")













               
               
               
               
               
               
               
               
               

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


DataSet.svydesign = DataSet %>% svydesign(id = ~PrimarySamplingUnit, strata = ~SamplingStrata, weights = ~SamplingWeight, nest = TRUE, data = . , pps="brewer")
# DataSet.svydesign = DataSet %>% svydesign(id = ~PSUNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")



#@ DataSet.svydesign.svyCreateTableOne -----
DataSet.svydesign.TableOne = DataSet.svydesign %>% select(-rowname, -PERSON_ID) %>%
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>% as.data.frame %>%  # debug181115 not to remove numeric 
    svyCreateTableOne(data = ., test = T, includeNA = T, addOverall = T)
vars4IQR = names(DataSet.svydesign)[DataSet.svydesign %>% map_lgl(is.numeric)]

sink("DataSet.svydesign.TableOne.txt"), append = FALSE)
DataSet.svydesign.TableOne %>% print(showAllLevels = F, smd = T) #----
sink("DataSet.svydesign.TableOne.IQR.txt", append = FALSE)
DataSet.svydesign.TableOne %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR) #----
sink()

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
DataSet.svydesign.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
    write.csv("DataSet.svydesign.TableOne -clean.csv")
openxlsx::openXL("DataSet.svydesign.TableOne -clean.csv")
# DataSet.svydesign.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
#     openxlsx::write.xlsx("DataSet.svydesign.TableOne -clean.xlsx")
# openxlsx::openXL("DataSet.svydesign.TableOne -clean.xlsx")
DataSet.svydesign.TableOne %>% print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% 
    openxlsx::write.xlsx("DataSet.svydesign.TableOne.xlsx")
openxlsx::openXL("DataSet.svydesign.TableOne.xlsx")
DataSet.svydesign.TableOne %>% print(showAllLevels = F, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("DataSet.svydesign.TableOne.IQR.xlsx")
openxlsx::openXL("DataSet.svydesign.TableOne.IQR.xlsx")


#@ DataSet.svydesign.svyCreateTableOne.byExposure -----
Varnames4Exposure =  c("treatment")
# DataSet.svydesign.TableOne_byExposure = DataSet.svydesign %>% select(-rowname, -PERSON_ID) %>%
#     svyCreateTableOne(strata = Varnames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
# # Error in dimnames(x) <- dn : 
# #   length of 'dimnames' [2] not equal to array extent
DataSet.svydesign.TableOne_byExposure = DataSet.svydesign %>% select(-rowname, -PERSON_ID) %>%
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>% as.data.frame %>%  # debug181115 not to remove numeric 
    svyCreateTableOne(strata = Varnames4Exposure, data = ., test = T)
vars4IQR = names(DataSet.svydesign)[DataSet.svydesign %>% map_lgl(is.numeric)]

sink("DataSet.svydesign.TableOne_byExposure.txt", append = FALSE)
DataSet.svydesign.TableOne_byExposure %>% print(showAllLevels = F, smd = T) #----
sink("DataSet.svydesign.TableOne_byExposure.IQR.txt", append = FALSE)
DataSet.svydesign.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR) #----
sink()
               

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
DataSet.svydesign.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("DataSet.svydesign.TableOne_byExposure -clean.csv")
openxlsx::openXL("DataSet.svydesign.TableOne_byExposure -clean.csv")
# DataSet.svydesign.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>%
#     openxlsx::write.xlsx("DataSet.svydesign.TableOne_byExposure -clean.xlsx")
# openxlsx::openXL("DataSet.svydesign.TableOne_byExposure -clean.xlsx")
DataSet.svydesign.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) %>% rownames_to_column %>% {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
    mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) %>%  # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
    openxlsx::write.xlsx("DataSet.svydesign.TableOne_byExposure.xlsx")
openxlsx::openXL("DataSet.svydesign.TableOne_byExposure.xlsx")
DataSet.svydesign.TableOne_byExposure %>% print(showAllLevels = F, smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("DataSet.svydesign.TableOne_byExposure.IQR.xlsx")
openxlsx::openXL("DataSet.svydesign.TableOne_byExposure.IQR.xlsx")



#@ ------
df = JK02.2079.CCW.MIN_Date.ge365_EndTime.is.Case.confirm.365.Match.TimeFrame1$LookBackWindow.gt.1y %>% 
  filter(MatchingCtrlNum %in% c(0, 1)) %>%
  select(AcquiredHypothyroidism: VisualImpairment, EndTime.is.Case.confirm.365)
df
df %>% 
  CreateTableOne(strata = treatment, data = ., test=FALSE) %>% 
  print(showAllLevels = F, smd = T)



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
