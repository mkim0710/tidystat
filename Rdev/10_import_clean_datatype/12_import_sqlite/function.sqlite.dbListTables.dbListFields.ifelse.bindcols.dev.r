# function.sqlite.dbListTables.dbListFields.ifelse.bindcols.dev.r



library(tidyverse)
getwd() |> dput()
# > getwd() |> dput()
# "X:/mkim/Rproject"
# path4read = "//DON/marketscan_users/smacdonald/"
# path4write = "//DON/marketscan_users/mkim/"
# path4read = "/proj/marketscan_users/marketscan/mkim/"
# path4write = "/proj/marketscan_users/marketscan/mkim/"
path4read = "../data/"
path4write = "../data/"


library(DBI)
mydb <- dbConnect(RSQLite::SQLite(), paste0(path4write, "r4.sas7bdat.sqlite"))


mydb %>% {DBI::dbListTables(.)} |> dput() #----
t0 = Sys.time()
mydb %>% {DBI::dbListTables(.)} %>% map_dbl(function(chr) {
    mydb %>% {DBI::dbGetQuery(., paste0('
    select count(*) from "', chr, '"'))} |> unlist()
}) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") |> dput() #----
Sys.time() - t0
mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
    mydb %>% dbListFields(chr)
}) %>% setNames(mydb %>% {DBI::dbListTables(.)}) |> dput() #----
# > mydb %>% {DBI::dbListTables(.)} |> dput() #----
# c("infant_pregcohort_d_r4.sas7bdat", "infant_pregcohort_i_r4.sas7bdat", 
# "infant_pregcohort_o_r4.sas7bdat", "infant_pregcohort_o_r4_mod.sas7bdat", 
# "infant_pregcohort_r_r4.sas7bdat", "infant_pregcohort_s_r4.sas7bdat", 
# "infant_pregcohort_s_r4_mod.sas7bdat", "infant_pregcohort_t_r4.sas7bdat", 
# "mscan_delivrange_os_r4.sas7bdat", "mscan_pregcohort_r4.sas7bdat", 
# "women_pregcohort_d_r4.sas7bdat", "women_pregcohort_i_r4.sas7bdat", 
# "women_pregcohort_o_r4.sas7bdat", "women_pregcohort_o_r4_mod.sas7bdat", 
# "women_pregcohort_r_r4.sas7bdat", "women_pregcohort_s_r4.sas7bdat", 
# "women_pregcohort_s_r4_mod.sas7bdat", "women_pregcohort_t_r4.sas7bdat"
# )
# > t0 = Sys.time()
# > mydb %>% {DBI::dbListTables(.)} %>% map_dbl(function(chr) {
# +     mydb %>% {DBI::dbGetQuery(., paste0('
# +     select count(*) from "', chr, '"'))} |> unlist()
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") |> dput() #----
# structure(list(`count(*)` = c(6717955, 1184201, 82689932, 119756995, 
# 321397, 22047659, 25068708, 26707411, 40401516, 2738787, 45466555, 
# 2358125, 233728576, 330453652, 17434069, 47285165, 35285704, 
# 73781917)), .Names = "count(*)", row.names = c("infant_pregcohort_d_r4.sas7bdat", 
# "infant_pregcohort_i_r4.sas7bdat", "infant_pregcohort_o_r4.sas7bdat", 
# "infant_pregcohort_o_r4_mod.sas7bdat", "infant_pregcohort_r_r4.sas7bdat", 
# "infant_pregcohort_s_r4.sas7bdat", "infant_pregcohort_s_r4_mod.sas7bdat", 
# "infant_pregcohort_t_r4.sas7bdat", "mscan_delivrange_os_r4.sas7bdat", 
# "mscan_pregcohort_r4.sas7bdat", "women_pregcohort_d_r4.sas7bdat", 
# "women_pregcohort_i_r4.sas7bdat", "women_pregcohort_o_r4.sas7bdat", 
# "women_pregcohort_o_r4_mod.sas7bdat", "women_pregcohort_r_r4.sas7bdat", 
# "women_pregcohort_s_r4.sas7bdat", "women_pregcohort_s_r4_mod.sas7bdat", 
# "women_pregcohort_t_r4.sas7bdat"), class = "data.frame")
# > Sys.time() - t0
# Time difference of 23.4821 secs
# > mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
# +     mydb %>% dbListFields(chr)
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) |> dput() #----
# structure(list(infant_pregcohort_d_r4.sas7bdat = c("enrolid", 
# "EFAMID", "NDCNUM", "SVCDATE", "DOBYR", "YEAR", "AGE", "DAYSUPP", 
# "GENERID", "METQTY", "MHSACOVG", "PDDATE", "PHARMID", "QTY", 
# "REFILL", "THERCLS", "DAWIND", "DEACLAS", "GENIND", "MAINTIN", 
# "THERGRP", "REGION", "MSA", "EECLASS", "EESTATU", "EGEOLOC", 
# "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", "SEX", "HLTHPLAN", 
# "INDSTRY"), infant_pregcohort_i_r4.sas7bdat = c("PDX", "DX1", 
# "DX2", "DX3", "DX4", "DX5", "DX6", "DX7", "DX8", "DX9", "DX10", 
# "DX11", "DX12", "DX13", "DX14", "DX15", "PPROC", "PROC1", "PROC2", 
# "PROC3", "PROC4", "PROC5", "PROC6", "PROC7", "PROC8", "PROC9", 
# "PROC10", "PROC11", "PROC12", "PROC13", "PROC14", "PROC15", "DXVER", 
# "enrolid", "EFAMID", "DOBYR", "YEAR", "ADMDATE", "AGE", "CASEID", 
# "DAYS", "DISDATE", "DRG", "MHSACOVG", "PHYSID", "PLANTYP", "ADMTYP", 
# "MDC", "DSTATUS", "REGION", "MSA", "AGEGRP", "EECLASS", "EESTATU", 
# "EGEOLOC", "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", 
# "STATE", "HLTHPLAN", "INDSTRY"), infant_pregcohort_o_r4.sas7bdat = c("DX1", 
# "DX2", "DX3", "DX4", "PROC1", "DXVER", "enrolid", "PROCTYP", 
# "EFAMID", "SVCDATE", "DOBYR", "YEAR", "AGE", "MHSACOVG", "PDDATE", 
# "PLANTYP", "PROVID", "SVCSCAT", "TSVCDAT", "MDC", "REGION", "MSA", 
# "STDPLAC", "STDPROV", "AGEGRP", "EECLASS", "EESTATU", "EGEOLOC", 
# "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", "HLTHPLAN", 
# "INDSTRY"), infant_pregcohort_o_r4_mod.sas7bdat = c("DXVER", 
# "enrolid", "EFAMID", "SVCDATE", "YEAR", "sourcedata", "codedp", 
# "dtype", "princ", "code_num"), infant_pregcohort_r_r4.sas7bdat = c("DX1", 
# "PROC1", "DXVER", "enrolid", "DATATYP", "EFAMID", "DOBYR", "YEAR", 
# "ABNORMAL", "AGE", "LOINCCD", "MHSACOVG", "ORDERID", "PDDATE", 
# "PLANTYP", "PROCTYP", "PROVID", "REFHIGH", "REFLOW", "RESLTCAT", 
# "RESULT", "RESUNIT", "SVCDATE", "TESTCNT", "MDC", "REGION", "MSA", 
# "STDPLAC", "STDPROV", "AGEGRP", "EECLASS", "EESTATU", "EGEOLOC", 
# "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", "HLTHPLAN", 
# "INDSTRY"), infant_pregcohort_s_r4.sas7bdat = c("PDX", "DX1", 
# "DX2", "DX3", "DX4", "PPROC", "PROC1", "DXVER", "enrolid", "PROCTYP", 
# "DOBYR", "YEAR", "ADMDATE", "AGE", "CASEID", "DISDATE", "DRG", 
# "MHSACOVG", "PDDATE", "PROVID", "SVCDATE", "SVCSCAT", "TSVCDAT", 
# "ADMTYP", "MDC", "DSTATUS", "STDPLAC", "STDPROV", "EFAMID", "PLANTYP", 
# "REGION", "MSA", "AGEGRP", "EECLASS", "EESTATU", "EGEOLOC", "EIDFLAG", 
# "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", "HLTHPLAN", "INDSTRY"
# ), infant_pregcohort_s_r4_mod.sas7bdat = c("DXVER", "enrolid", 
# "YEAR", "ADMDATE", "CASEID", "DISDATE", "SVCDATE", "EFAMID", 
# "sourcedata", "codedp", "dtype", "princ", "code_num"), infant_pregcohort_t_r4.sas7bdat = c("enrolid", 
# "EFAMID", "DTEND", "DTSTART", "MEMDAYS", "MHSACOVG", "YEAR", 
# "AGE", "REGION", "RX", "SEX"), mscan_delivrange_os_r4.sas7bdat = c("enddate", 
# "delivrange_start", "delivrange_end", "pregID", "ENROLID", "YEAR", 
# "CASEID", "DXVER", "ADMDATE", "DISDATE", "SVCDATE", "EFAMID", 
# "sourcedata", "codedp", "dtype", "princ", "code_num"), mscan_pregcohort_r4.sas7bdat = c("pregid", 
# "enrolid_mom", "efamid", "final_type", "final_type_def", "enddate", 
# "gestage", "lmp", "totalpreg", "linked_inf", "delivrange_start", 
# "delivrange_end", "enrolid_inf1", "enrolid_inf2", "enrolid_inf3", 
# "enrolid_inf4", "dobyr1", "dobyr2", "dobyr3", "dobyr4", "first_visit_date1", 
# "first_visit_date2", "first_visit_date3", "first_visit_date4", 
# "source_firstdate1", "source_firstdate2", "source_firstdate3", 
# "source_firstdate4", "deliv_caseid1", "deliv_caseid2", "deliv_caseid3", 
# "deliv_caseid4", "deliv_caseid5", "deliv_caseid6", "deliv_caseid7", 
# "deliv_caseid8", "deliv_year1", "deliv_year2", "deliv_year3", 
# "deliv_year4", "deliv_year5", "deliv_year6", "deliv_year7", "deliv_year8"
# ), women_pregcohort_d_r4.sas7bdat = c("ENROLID", "EFAMID", "NDCNUM", 
# "SVCDATE", "DOBYR", "YEAR", "AGE", "DAYSUPP", "GENERID", "METQTY", 
# "MHSACOVG", "PDDATE", "PHARMID", "QTY", "REFILL", "THERCLS", 
# "DAWIND", "DEACLAS", "GENIND", "MAINTIN", "THERGRP", "REGION", 
# "MSA", "EECLASS", "EESTATU", "EGEOLOC", "EIDFLAG", "EMPREL", 
# "ENRFLAG", "PHYFLAG", "SEX", "HLTHPLAN", "INDSTRY"), women_pregcohort_i_r4.sas7bdat = c("PDX", 
# "DX1", "DX2", "DX3", "DX4", "DX5", "DX6", "DX7", "DX8", "DX9", 
# "DX10", "DX11", "DX12", "DX13", "DX14", "DX15", "PPROC", "PROC1", 
# "PROC2", "PROC3", "PROC4", "PROC5", "PROC6", "PROC7", "PROC8", 
# "PROC9", "PROC10", "PROC11", "PROC12", "PROC13", "PROC14", "PROC15", 
# "DXVER", "ENROLID", "EFAMID", "DOBYR", "YEAR", "ADMDATE", "AGE", 
# "CASEID", "DAYS", "DISDATE", "DRG", "MHSACOVG", "PHYSID", "PLANTYP", 
# "ADMTYP", "MDC", "DSTATUS", "REGION", "MSA", "AGEGRP", "EECLASS", 
# "EESTATU", "EGEOLOC", "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", 
# "RX", "SEX", "STATE", "HLTHPLAN", "INDSTRY"), women_pregcohort_o_r4.sas7bdat = c("DX1", 
# "DX2", "DX3", "DX4", "PROC1", "DXVER", "ENROLID", "PROCTYP", 
# "EFAMID", "SVCDATE", "DOBYR", "YEAR", "AGE", "MHSACOVG", "PDDATE", 
# "PLANTYP", "PROVID", "SVCSCAT", "TSVCDAT", "MDC", "REGION", "MSA", 
# "STDPLAC", "STDPROV", "AGEGRP", "EECLASS", "EESTATU", "EGEOLOC", 
# "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", "HLTHPLAN", 
# "INDSTRY"), women_pregcohort_o_r4_mod.sas7bdat = c("DXVER", "ENROLID", 
# "EFAMID", "SVCDATE", "YEAR", "sourcedata", "codedp", "dtype", 
# "princ", "code_num"), women_pregcohort_r_r4.sas7bdat = c("DX1", 
# "PROC1", "DXVER", "ENROLID", "DATATYP", "EFAMID", "DOBYR", "YEAR", 
# "ABNORMAL", "AGE", "LOINCCD", "MHSACOVG", "ORDERID", "PDDATE", 
# "PLANTYP", "PROCTYP", "PROVID", "REFHIGH", "REFLOW", "RESLTCAT", 
# "RESULT", "RESUNIT", "SVCDATE", "TESTCNT", "MDC", "REGION", "MSA", 
# "STDPLAC", "STDPROV", "AGEGRP", "EECLASS", "EESTATU", "EGEOLOC", 
# "EIDFLAG", "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", "HLTHPLAN", 
# "INDSTRY"), women_pregcohort_s_r4.sas7bdat = c("PDX", "DX1", 
# "DX2", "DX3", "DX4", "PPROC", "PROC1", "DXVER", "ENROLID", "PROCTYP", 
# "DOBYR", "YEAR", "ADMDATE", "AGE", "CASEID", "DISDATE", "DRG", 
# "MHSACOVG", "PDDATE", "PROVID", "SVCDATE", "SVCSCAT", "TSVCDAT", 
# "ADMTYP", "MDC", "DSTATUS", "STDPLAC", "STDPROV", "EFAMID", "PLANTYP", 
# "REGION", "MSA", "AGEGRP", "EECLASS", "EESTATU", "EGEOLOC", "EIDFLAG", 
# "EMPREL", "ENRFLAG", "PHYFLAG", "RX", "SEX", "HLTHPLAN", "INDSTRY"
# ), women_pregcohort_s_r4_mod.sas7bdat = c("DXVER", "ENROLID", 
# "YEAR", "ADMDATE", "CASEID", "DISDATE", "SVCDATE", "EFAMID", 
# "sourcedata", "codedp", "dtype", "princ", "code_num"), women_pregcohort_t_r4.sas7bdat = c("ENROLID", 
# "EFAMID", "DTEND", "DTSTART", "MEMDAYS", "MHSACOVG", "YEAR", 
# "AGE", "REGION", "RX", "SEX")), .Names = c("infant_pregcohort_d_r4.sas7bdat", 
# "infant_pregcohort_i_r4.sas7bdat", "infant_pregcohort_o_r4.sas7bdat", 
# "infant_pregcohort_o_r4_mod.sas7bdat", "infant_pregcohort_r_r4.sas7bdat", 
# "infant_pregcohort_s_r4.sas7bdat", "infant_pregcohort_s_r4_mod.sas7bdat", 
# "infant_pregcohort_t_r4.sas7bdat", "mscan_delivrange_os_r4.sas7bdat", 
# "mscan_pregcohort_r4.sas7bdat", "women_pregcohort_d_r4.sas7bdat", 
# "women_pregcohort_i_r4.sas7bdat", "women_pregcohort_o_r4.sas7bdat", 
# "women_pregcohort_o_r4_mod.sas7bdat", "women_pregcohort_r_r4.sas7bdat", 
# "women_pregcohort_s_r4.sas7bdat", "women_pregcohort_s_r4_mod.sas7bdat", 
# "women_pregcohort_t_r4.sas7bdat")






#@@@ mydb.dbListTables.dbListFields.ifelse.bindcols from .r =====
#@ mydb.dbListTables.dbListFields ======
mydb.dbListTables.dbListFields = 
    mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
        mydb %>% dbListFields(chr)
    }) %>% setNames(mydb %>% {DBI::dbListTables(.)})


mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique |> str()
# > mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique |> str()
#  chr [1:149] "enrolid" "EFAMID" "NDCNUM" "SVCDATE" "DOBYR" "YEAR" "AGE" "DAYSUPP" "GENERID" "METQTY" "MHSACOVG" "PDDATE" "PHARMID" "QTY" "REFILL" "THERCLS" ...


# mydb.dbListTables.dbListFields %>% map(function(vec) {
#     if_else(vec %in% (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), T, F)
# }) |> str()
# # > mydb.dbListTables.dbListFields %>% map(function(vec) {
# # +     if_else(vec %in% (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), T, F)
# # + }) |> str()
# # List of 18
# #  $ infant_pregcohort_d_r4.sas7bdat    : logi [1:33] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_i_r4.sas7bdat    : logi [1:64] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_o_r4.sas7bdat    : logi [1:36] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_o_r4_mod.sas7bdat: logi [1:10] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_r_r4.sas7bdat    : logi [1:41] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_s_r4.sas7bdat    : logi [1:44] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_s_r4_mod.sas7bdat: logi [1:13] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ infant_pregcohort_t_r4.sas7bdat    : logi [1:11] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ mscan_delivrange_os_r4.sas7bdat    : logi [1:17] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ mscan_pregcohort_r4.sas7bdat       : logi [1:44] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_d_r4.sas7bdat     : logi [1:33] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_i_r4.sas7bdat     : logi [1:64] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_o_r4.sas7bdat     : logi [1:36] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_o_r4_mod.sas7bdat : logi [1:10] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_r_r4.sas7bdat     : logi [1:41] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_s_r4.sas7bdat     : logi [1:44] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_s_r4_mod.sas7bdat : logi [1:13] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ women_pregcohort_t_r4.sas7bdat     : logi [1:11] TRUE TRUE TRUE TRUE TRUE TRUE ...


mydb.dbListTables.dbListFields %>% map(function(vec) {
    if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
}) |> str()
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
# + }) |> str()
# List of 18
#  $ infant_pregcohort_d_r4.sas7bdat    : logi [1:149] TRUE TRUE TRUE TRUE TRUE TRUE ...
#  $ infant_pregcohort_i_r4.sas7bdat    : logi [1:149] TRUE TRUE FALSE FALSE TRUE TRUE ...
#  $ infant_pregcohort_o_r4.sas7bdat    : logi [1:149] TRUE TRUE FALSE TRUE TRUE TRUE ...
#  $ infant_pregcohort_o_r4_mod.sas7bdat: logi [1:149] TRUE TRUE FALSE TRUE FALSE TRUE ...
#  $ infant_pregcohort_r_r4.sas7bdat    : logi [1:149] TRUE TRUE FALSE TRUE TRUE TRUE ...
#  $ infant_pregcohort_s_r4.sas7bdat    : logi [1:149] TRUE TRUE FALSE TRUE TRUE TRUE ...
#  $ infant_pregcohort_s_r4_mod.sas7bdat: logi [1:149] TRUE TRUE FALSE TRUE FALSE TRUE ...
#  $ infant_pregcohort_t_r4.sas7bdat    : logi [1:149] TRUE TRUE FALSE FALSE FALSE TRUE ...
#  $ mscan_delivrange_os_r4.sas7bdat    : logi [1:149] FALSE TRUE FALSE TRUE FALSE TRUE ...
#  $ mscan_pregcohort_r4.sas7bdat       : logi [1:149] FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ women_pregcohort_d_r4.sas7bdat     : logi [1:149] FALSE TRUE TRUE TRUE TRUE TRUE ...
#  $ women_pregcohort_i_r4.sas7bdat     : logi [1:149] FALSE TRUE FALSE FALSE TRUE TRUE ...
#  $ women_pregcohort_o_r4.sas7bdat     : logi [1:149] FALSE TRUE FALSE TRUE TRUE TRUE ...
#  $ women_pregcohort_o_r4_mod.sas7bdat : logi [1:149] FALSE TRUE FALSE TRUE FALSE TRUE ...
#  $ women_pregcohort_r_r4.sas7bdat     : logi [1:149] FALSE TRUE FALSE TRUE TRUE TRUE ...
#  $ women_pregcohort_s_r4.sas7bdat     : logi [1:149] FALSE TRUE FALSE TRUE TRUE TRUE ...
#  $ women_pregcohort_s_r4_mod.sas7bdat : logi [1:149] FALSE TRUE FALSE TRUE FALSE TRUE ...
#  $ women_pregcohort_t_r4.sas7bdat     : logi [1:149] FALSE TRUE FALSE FALSE FALSE TRUE ...


mydb.dbListTables.dbListFields %>% map(function(vec) {
    if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
}) %>% bind_cols
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
# + }) %>% bind_cols
# # A tibble: 149 x 18
#    infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… mscan_delivrang…
#    <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>           
#  1 TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             FALSE           
#  2 TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE            
#  3 TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
#  4 TRUE             FALSE            TRUE             TRUE             TRUE             TRUE             TRUE             FALSE            TRUE            
#  5 TRUE             TRUE             TRUE             FALSE            TRUE             TRUE             FALSE            FALSE            FALSE           
#  6 TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE            
#  7 TRUE             TRUE             TRUE             FALSE            TRUE             TRUE             FALSE            TRUE             FALSE           
#  8 TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
#  9 TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
# 10 TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
# # ... with 139 more rows, and 9 more variables: mscan_pregcohort_r4.sas7bdat <lgl>, women_pregcohort_d_r4.sas7bdat <lgl>, women_pregcohort_i_r4.sas7bdat <lgl>,
# #   women_pregcohort_o_r4.sas7bdat <lgl>, women_pregcohort_o_r4_mod.sas7bdat <lgl>, women_pregcohort_r_r4.sas7bdat <lgl>, women_pregcohort_s_r4.sas7bdat <lgl>,
# #   women_pregcohort_s_r4_mod.sas7bdat <lgl>, women_pregcohort_t_r4.sas7bdat <lgl>



mydb.dbListTables.dbListFields %>% map(function(vec) {
    if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
}) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), .before = 1)
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
# + }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), .before = 1)
# # A tibble: 149 x 19
#    varname infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho…
#    <chr>   <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>           
#  1 enrolid TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE            
#  2 EFAMID  TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE            
#  3 NDCNUM  TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
#  4 SVCDATE TRUE             FALSE            TRUE             TRUE             TRUE             TRUE             TRUE             FALSE           
#  5 DOBYR   TRUE             TRUE             TRUE             FALSE            TRUE             TRUE             FALSE            FALSE           
#  6 YEAR    TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE             TRUE            
#  7 AGE     TRUE             TRUE             TRUE             FALSE            TRUE             TRUE             FALSE            TRUE            
#  8 DAYSUPP TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
#  9 GENERID TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
# 10 METQTY  TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
# # ... with 139 more rows, and 10 more variables: mscan_delivrange_os_r4.sas7bdat <lgl>, mscan_pregcohort_r4.sas7bdat <lgl>, women_pregcohort_d_r4.sas7bdat <lgl>,
# #   women_pregcohort_i_r4.sas7bdat <lgl>, women_pregcohort_o_r4.sas7bdat <lgl>, women_pregcohort_o_r4_mod.sas7bdat <lgl>, women_pregcohort_r_r4.sas7bdat <lgl>,
# #   women_pregcohort_s_r4.sas7bdat <lgl>, women_pregcohort_s_r4_mod.sas7bdat <lgl>, women_pregcohort_t_r4.sas7bdat <lgl>



mydb.dbListTables.dbListFields %>% map(function(vec) {
    if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
}) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), .before = 1) %>% arrange(varname)
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
# + }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), .before = 1) %>% arrange(varname)
# # A tibble: 149 x 19
#    varname infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho… infant_pregcoho…
#    <chr>   <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>            <lgl>           
#  1 ABNORM… FALSE            FALSE            FALSE            FALSE            TRUE             FALSE            FALSE            FALSE           
#  2 ADMDATE FALSE            TRUE             FALSE            FALSE            FALSE            TRUE             TRUE             FALSE           
#  3 ADMTYP  FALSE            TRUE             FALSE            FALSE            FALSE            TRUE             FALSE            FALSE           
#  4 AGE     TRUE             TRUE             TRUE             FALSE            TRUE             TRUE             FALSE            TRUE            
#  5 AGEGRP  FALSE            TRUE             TRUE             FALSE            TRUE             TRUE             FALSE            FALSE           
#  6 CASEID  FALSE            TRUE             FALSE            FALSE            FALSE            TRUE             TRUE             FALSE           
#  7 code_n… FALSE            FALSE            FALSE            TRUE             FALSE            FALSE            TRUE             FALSE           
#  8 codedp  FALSE            FALSE            FALSE            TRUE             FALSE            FALSE            TRUE             FALSE           
#  9 DATATYP FALSE            FALSE            FALSE            FALSE            TRUE             FALSE            FALSE            FALSE           
# 10 DAWIND  TRUE             FALSE            FALSE            FALSE            FALSE            FALSE            FALSE            FALSE           
# # ... with 139 more rows, and 10 more variables: mscan_delivrange_os_r4.sas7bdat <lgl>, mscan_pregcohort_r4.sas7bdat <lgl>,
# #   women_pregcohort_d_r4.sas7bdat <lgl>, women_pregcohort_i_r4.sas7bdat <lgl>, women_pregcohort_o_r4.sas7bdat <lgl>, women_pregcohort_o_r4_mod.sas7bdat <lgl>,
# #   women_pregcohort_r_r4.sas7bdat <lgl>, women_pregcohort_s_r4.sas7bdat <lgl>, women_pregcohort_s_r4_mod.sas7bdat <lgl>, women_pregcohort_t_r4.sas7bdat <lgl>

openxlsx::write.xlsx(
    mydb.dbListTables.dbListFields %>% map(function(vec) {
        if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
    }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), .before = 1) %>% arrange(varname)
    , "mydb.dbListTables.dbListFields.ifelse.bindcols.xlsx"
    , asTable=TRUE
)
if (.Platform$OS.type == "windows") openxlsx::openXL(
    "mydb.dbListTables.dbListFields.ifelse.bindcols.xlsx"
)
# > if (.Platform$OS.type == "windows") openxlsx::openXL(
# +     "mydb.dbListTables.dbListFields.ifelse.bindcols.xlsx"
# + )
# Error in chooseExcelApp() : No applications (detected) available.
# Set options('openxlsx.excelApp'), instead.




#@ mydb.dbListTables.dbListFields |> unlist() %>% unname %>% toupper |> unique ------
?unique
mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique |> str()
mydb.dbListTables.dbListFields |> unlist() %>% unname %>% toupper |> unique |> str()
# > mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique |> str()
#  chr [1:149] "enrolid" "EFAMID" "NDCNUM" "SVCDATE" "DOBYR" "YEAR" "AGE" "DAYSUPP" "GENERID" "METQTY" "MHSACOVG" "PDDATE" "PHARMID" "QTY" "REFILL" "THERCLS" ...
# > mydb.dbListTables.dbListFields |> unlist() %>% unname %>% toupper |> unique |> str()
#  chr [1:146] "ENROLID" "EFAMID" "NDCNUM" "SVCDATE" "DOBYR" "YEAR" "AGE" "DAYSUPP" "GENERID" "METQTY" "MHSACOVG" "PDDATE" "PHARMID" "QTY" "REFILL" "THERCLS" ...



mydb.dbListTables.dbListFields.ifelse.bindcols =
    mydb.dbListTables.dbListFields %>% map(function(vec) {
        if_else((mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique %in% vec), T, F)
    }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields |> unlist() %>% unname |> unique), .before = 1) %>% arrange(varname)






#@ end -----
save(mydb.dbListTables.dbListFields, file = "mydb.dbListTables.dbListFields.rda")
save(mydb.dbListTables.dbListFields.ifelse.bindcols, file = "mydb.dbListTables.dbListFields.ifelse.bindcols.rda")






