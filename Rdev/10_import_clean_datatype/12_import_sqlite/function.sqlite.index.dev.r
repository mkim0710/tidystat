# function.sqlite.index.dev.r


library(tidyverse)
getwd() %>% dput
# > getwd() %>% dput
# "X:/mkim/Rproject"
# path4read = "//DON/marketscan_users/smacdonald/"
# path4write = "//DON/marketscan_users/mkim/"
# path4read = "/proj/marketscan_users/marketscan/mkim/"
# path4write = "/proj/marketscan_users/marketscan/mkim/"
path4read = "../data/"
path4write = "../data/"


library(DBI)
mydb <- dbConnect(RSQLite::SQLite(), paste0(path4write, "r4.sas7bdat.sqlite"))


mydb %>% {DBI::dbListTables(.)} %>% dput #----
t0 = Sys.time()
mydb %>% {DBI::dbListTables(.)} %>% map_dbl(function(chr) {
    mydb %>% {DBI::dbGetQuery(., paste0('
    select count(*) from "', chr, '"'))} %>% unlist
}) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") %>% dput #----
Sys.time() - t0
mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
    mydb %>% dbListFields(chr)
}) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% dput #----
# > mydb %>% {DBI::dbListTables(.)} %>% dput #----
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
# +     select count(*) from "', chr, '"'))} %>% unlist
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") %>% dput #----
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
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% dput #----
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




#@@@ KNHIS.JK_GJ596284.SICK_SYM.INDEX.sqlite from KNHIS.JK_GJ596284.SICK_SYM.sqlite .r ====


library(tidyverse)
mydb <- DBI::dbConnect(RSQLite::SQLite(), "KNHIS.JK_GJ596284.SICK_SYM.INDEX.sqlite")

mydb %>% {DBI::dbListTables(.)} %>% dput
t0 = Sys.time()
mydb %>% {DBI::dbListTables(.)} %>% map_dbl(function(chr) {
    mydb %>% {DBI::dbGetQuery(., paste0("
    select count(*) from '", chr, "'"))} %>% unlist
}) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") %>% dput
Sys.time() - t0
mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
    mydb %>% DBI::dbListFields(chr)
}) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% dput
# > mydb %>% {DBI::dbListTables(.)} %>% dput
c("NHID_GJ_0213.bind_rows.integer", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", 
"NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4", 
"NHID_JK0213.bind_rows")
# > t0 = Sys.time()
# > mydb %>% {DBI::dbListTables(.)} %>% map_dbl(function(chr) {
# +     mydb %>% {DBI::dbGetQuery(., paste0('
# +     select count(*) from "', chr, '"'))} %>% unlist
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") %>% dput
structure(list(`count(*)` = c(2210067, 74606011, 190462550, 246770921, 
6879688)), row.names = c("NHID_GJ_0213.bind_rows.integer", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", 
"NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4", 
"NHID_JK0213.bind_rows"), class = "data.frame")
# > Sys.time() - t0
# Time difference of 41.92452 secs
# > mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
# +     mydb %>% DBI::dbListFields(chr)
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% dput
list(NHID_GJ_0213.bind_rows.integer = c("HCHK_YEAR", "PERSON_ID", 
"YKIHO_GUBUN_CD", "HEIGHT", "WEIGHT", "BP_HIGH", "BP_LWST", "BLDS", 
"TOT_CHOLE", "HMG", "GLY_CD", "OLIG_OCCU_CD", "OLIG_PH", "OLIG_PROTE_CD", 
"SGOT_AST", "SGPT_ALT", "GAMMA_GTP", "HCHK_PMH_CD1", "HCHK_PMH_CD2", 
"HCHK_PMH_CD3", "FMLY_LIVER_DISE_PATIEN_YN", "FMLY_HPRTS_PATIEN_YN", 
"FMLY_APOP_PATIEN_YN", "FMLY_HDISE_PATIEN_YN", "FMLY_DIABML_PATIEN_YN", 
"FMLY_CANCER_PATIEN_YN", "SMK_STAT_TYPE_RSPS_CD", "SMK_TERM_RSPS_CD", 
"DSQTY_RSPS_CD", "DRNK_HABIT_RSPS_CD", "TM1_DRKQTY_RSPS_CD", 
"EXERCI_FREQ_RSPS_CD", "WAIST", "TRIGLYCERIDE", "HDL_CHOLE", 
"LDL_CHOLE", "CREATININE", "HCHK_APOP_PMH_YN", "HCHK_HDISE_PMH_YN", 
"HCHK_HPRTS_PMH_YN", "HCHK_DIABML_PMH_YN", "HCHK_HPLPDM_PMH_YN", 
"HCHK_ETCDSE_PMH_YN", "PAST_SMK_TERM_RSPS_CD", "PAST_DSQTY_RSPS_CD", 
"CUR_SMK_TERM_RSPS_CD", "CUR_DSQTY_RSPS_CD", "MOV20_WEK_FREQ_ID", 
"MOV30_WEK_FREQ_ID", "WLK30_WEK_FREQ_ID", "HCHK_PHSS_PMH_YN"), 
    NHID_GY20_0213.bind_rows.12478.ICDclean.factor = c("PERSON_ID", 
    "KEY_SEQ", "RECU_FR_DT", "MAIN_SICK", "SUB_SICK"), NHID_GY40_0213.bind_rows.factor = c("KEY_SEQ", 
    "DSBJT_CD", "SICK_SYM"), NHID_GY60_0213.bind_rows.GNL_NM_CD4 = c("KEY_SEQ", 
    "GNL_NM_CD4", "DD_MQTY_FREQ", "DD_EXEC_FREQ", "MDCN_EXEC_FREQ"
    ), NHID_JK0213.bind_rows = c("STND_Y", "PERSON_ID", "SEX", 
    "AGE_GROUP", "DTH_YM", "DTH_CODE1", "DTH_CODE2", "SIDO", 
    "SGG", "IPSN_TYPE_CD", "CTRB_PT_TYPE_CD", "DFAB_GRD_CD", 
    "DFAB_PTN_CD", "DFAB_REG_YM"))



structure(list(`count(*)` = c(2210067, 74606011, 190462550, 246770921, 
6879688)), row.names = c("NHID_GJ_0213.bind_rows.integer", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", 
"NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4", 
"NHID_JK0213.bind_rows"), class = "data.frame")
# > structure(list(`count(*)` = c(2210067, 74606011, 190462550, 246770921, 
# + 6879688)), row.names = c("NHID_GJ_0213.bind_rows.integer", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", 
# + "NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4", 
# + "NHID_JK0213.bind_rows"), class = "data.frame")
#                                                 count(*)
# NHID_GJ_0213.bind_rows.integer                   2210067
# NHID_GY20_0213.bind_rows.12478.ICDclean.factor  74606011
# NHID_GY40_0213.bind_rows.factor                190462550
# NHID_GY60_0213.bind_rows.GNL_NM_CD4            246770921
# NHID_JK0213.bind_rows                            6879688
2210067 / 2210067
74606011 / 119362188
190462550 / 
246770921 / 396777916
6879688 / 12132633
# > 2210067 / 2210067
# [1] 1
# > 74606011 / 119362188
# [1] 0.6250389
# > 246770921 / 396777916
# [1] 0.6219371
# > 6879688 / 12132633
# [1] 0.56704




#@ sqlite_master =====
t0 = Sys.time()
mydb %>% {DBI::dbGetQuery(
    ., paste0("
SELECT *
FROM sqlite_master
              ")
)}
Sys.time() - t0
# > t0 = Sys.time()
# > mydb %>% {DBI::dbGetQuery(
# +     ., paste0("
# + SELECT *
# + FROM sqlite_master
# +               ")
# + )}
#    type                                           name                                       tbl_name rootpage
# 1 table                          NHID_JK0213.bind_rows                          NHID_JK0213.bind_rows        2
# 2 table NHID_GY20_0213.bind_rows.12478.ICDclean.factor NHID_GY20_0213.bind_rows.12478.ICDclean.factor    59070
# 3 table            NHID_GY60_0213.bind_rows.GNL_NM_CD4            NHID_GY60_0213.bind_rows.GNL_NM_CD4   937029
# 4 table                 NHID_GJ_0213.bind_rows.integer                 NHID_GJ_0213.bind_rows.integer  2820130
# 5 table                NHID_GY40_0213.bind_rows.factor                NHID_GY40_0213.bind_rows.factor  2873168
#                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 sql
# 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CREATE TABLE `NHID_JK0213.bind_rows` (\n  `STND_Y` REAL,\n  `PERSON_ID` REAL,\n  `SEX` REAL,\n  `AGE_GROUP` REAL,\n  `DTH_YM` TEXT,\n  `DTH_CODE1` TEXT,\n  `DTH_CODE2` TEXT,\n  `SIDO` REAL,\n  `SGG` REAL,\n  `IPSN_TYPE_CD` REAL,\n  `CTRB_PT_TYPE_CD` REAL,\n  `DFAB_GRD_CD` REAL,\n  `DFAB_PTN_CD` REAL,\n  `DFAB_REG_YM` TEXT\n)
# 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          CREATE TABLE `NHID_GY20_0213.bind_rows.12478.ICDclean.factor` (\n  `PERSON_ID` TEXT,\n  `KEY_SEQ` TEXT,\n  `RECU_FR_DT` TEXT,\n  `MAIN_SICK` TEXT,\n  `SUB_SICK` TEXT\n)
# 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CREATE TABLE `NHID_GY60_0213.bind_rows.GNL_NM_CD4` (\n  `KEY_SEQ` TEXT,\n  `GNL_NM_CD4` TEXT,\n  `DD_MQTY_FREQ` REAL,\n  `DD_EXEC_FREQ` INTEGER,\n  `MDCN_EXEC_FREQ` INTEGER\n)
# 4 CREATE TABLE `NHID_GJ_0213.bind_rows.integer` (\n  `HCHK_YEAR` INTEGER,\n  `PERSON_ID` INTEGER,\n  `YKIHO_GUBUN_CD` INTEGER,\n  `HEIGHT` INTEGER,\n  `WEIGHT` INTEGER,\n  `BP_HIGH` INTEGER,\n  `BP_LWST` INTEGER,\n  `BLDS` INTEGER,\n  `TOT_CHOLE` INTEGER,\n  `HMG` REAL,\n  `GLY_CD` INTEGER,\n  `OLIG_OCCU_CD` INTEGER,\n  `OLIG_PH` REAL,\n  `OLIG_PROTE_CD` INTEGER,\n  `SGOT_AST` INTEGER,\n  `SGPT_ALT` INTEGER,\n  `GAMMA_GTP` INTEGER,\n  `HCHK_PMH_CD1` INTEGER,\n  `HCHK_PMH_CD2` INTEGER,\n  `HCHK_PMH_CD3` INTEGER,\n  `FMLY_LIVER_DISE_PATIEN_YN` INTEGER,\n  `FMLY_HPRTS_PATIEN_YN` INTEGER,\n  `FMLY_APOP_PATIEN_YN` INTEGER,\n  `FMLY_HDISE_PATIEN_YN` INTEGER,\n  `FMLY_DIABML_PATIEN_YN` INTEGER,\n  `FMLY_CANCER_PATIEN_YN` INTEGER,\n  `SMK_STAT_TYPE_RSPS_CD` INTEGER,\n  `SMK_TERM_RSPS_CD` INTEGER,\n  `DSQTY_RSPS_CD` INTEGER,\n  `DRNK_HABIT_RSPS_CD` INTEGER,\n  `TM1_DRKQTY_RSPS_CD` REAL,\n  `EXERCI_FREQ_RSPS_CD` INTEGER,\n  `WAIST` INTEGER,\n  `TRIGLYCERIDE` INTEGER,\n  `HDL_CHOLE` REAL,\n  `LDL_CHOLE` REAL,\n  `CREATININE` REAL,\n  `HCHK_APOP_PMH_YN` INTEGER,\n  `HCHK_HDISE_PMH_YN` INTEGER,\n  `HCHK_HPRTS_PMH_YN` INTEGER,\n  `HCHK_DIABML_PMH_YN` INTEGER,\n  `HCHK_HPLPDM_PMH_YN` INTEGER,\n  `HCHK_ETCDSE_PMH_YN` INTEGER,\n  `PAST_SMK_TERM_RSPS_CD` INTEGER,\n  `PAST_DSQTY_RSPS_CD` INTEGER,\n  `CUR_SMK_TERM_RSPS_CD` INTEGER,\n  `CUR_DSQTY_RSPS_CD` REAL,\n  `MOV20_WEK_FREQ_ID` INTEGER,\n  `MOV30_WEK_FREQ_ID` INTEGER,\n  `WLK30_WEK_FREQ_ID` INTEGER,\n  `HCHK_PHSS_PMH_YN` INTEGER\n)
# 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     CREATE TABLE `NHID_GY40_0213.bind_rows.factor` (\n  `KEY_SEQ` TEXT,\n  `DSBJT_CD` TEXT,\n  `SICK_SYM` TEXT\n)
# > Sys.time() - t0
# Time difference of 0.07588816 secs



t0 = Sys.time()
mydb %>% {DBI::dbGetQuery(
    ., paste0("
SELECT type, name, tbl_name, rootpage
FROM sqlite_master
              ")
)}
Sys.time() - t0
# > t0 = Sys.time()
# > mydb %>% {DBI::dbGetQuery(
# +     ., paste0("
# + SELECT type, name, tbl_name, rootpage
# + FROM sqlite_master
# +               ")
# + )}
#     type                                                      name                                       tbl_name rootpage
# 1  table                       NHID_GY60_0213.bind_rows.GNL_NM_CD4            NHID_GY60_0213.bind_rows.GNL_NM_CD4   937029
# 2  table                           NHID_GY40_0213.bind_rows.factor                NHID_GY40_0213.bind_rows.factor  2873168
# 3  table                                     NHID_JK0213.bind_rows                          NHID_JK0213.bind_rows        2
# 4  table            NHID_GY20_0213.bind_rows.12478.ICDclean.factor NHID_GY20_0213.bind_rows.12478.ICDclean.factor    59070
# 5  table                            NHID_GJ_0213.bind_rows.integer                 NHID_GJ_0213.bind_rows.integer  2820130
# 6  index                           NHID_JK0213.bind_rows_PERSON_ID                          NHID_JK0213.bind_rows  2870098
# 7  index  NHID_GY20_0213.bind_rows.12478.ICDclean.factor_PERSON_ID NHID_GY20_0213.bind_rows.12478.ICDclean.factor   113504
# 8  index                  NHID_GJ_0213.bind_rows.integer_PERSON_ID                 NHID_GJ_0213.bind_rows.integer  4434188
# 9  index    NHID_GY20_0213.bind_rows.12478.ICDclean.factor_KEY_SEQ NHID_GY20_0213.bind_rows.12478.ICDclean.factor  4441227
# 10 index                   NHID_GY40_0213.bind_rows.factor_KEY_SEQ                NHID_GY40_0213.bind_rows.factor  4842751
# 11 index               NHID_GY60_0213.bind_rows.GNL_NM_CD4_KEY_SEQ            NHID_GY60_0213.bind_rows.GNL_NM_CD4  5871111
# 12 index NHID_GY20_0213.bind_rows.12478.ICDclean.factor_RECU_FR_DT NHID_GY20_0213.bind_rows.12478.ICDclean.factor  7204113
# 13 index                  NHID_GY40_0213.bind_rows.factor_SICK_SYM                NHID_GY40_0213.bind_rows.factor  7531094
# 14 index  NHID_GY20_0213.bind_rows.12478.ICDclean.factor_MAIN_SICK NHID_GY20_0213.bind_rows.12478.ICDclean.factor  8182327
# 15 index            NHID_GY60_0213.bind_rows.GNL_NM_CD4_GNL_NM_CD4            NHID_GY60_0213.bind_rows.GNL_NM_CD4  8436440
# 16 index   NHID_GY20_0213.bind_rows.12478.ICDclean.factor_SUB_SICK NHID_GY20_0213.bind_rows.12478.ICDclean.factor  9259210
# > Sys.time() - t0
# Time difference of 0.05455995 secs





#@ PRAGMA TABLE_INFO(TABLE_NAME) ====
t0 = Sys.time()
mydb %>% {DBI::dbGetQuery(
    ., paste0("
PRAGMA TABLE_INFO('NHID_JK0213.bind_rows')
              ")
)}
Sys.time() - t0
# > mydb %>% {DBI::dbGetQuery(
# +     ., paste0("
# + PRAGMA TABLE_INFO('NHID_JK0213.bind_rows')
# +               ")
# + )}
#    cid            name type notnull dflt_value pk
# 1    0          STND_Y REAL       0         NA  0
# 2    1       PERSON_ID REAL       0         NA  0
# 3    2             SEX REAL       0         NA  0
# 4    3       AGE_GROUP REAL       0         NA  0
# 5    4          DTH_YM TEXT       0         NA  0
# 6    5       DTH_CODE1 TEXT       0         NA  0
# 7    6       DTH_CODE2 TEXT       0         NA  0
# 8    7            SIDO REAL       0         NA  0
# 9    8             SGG REAL       0         NA  0
# 10   9    IPSN_TYPE_CD REAL       0         NA  0
# 11  10 CTRB_PT_TYPE_CD REAL       0         NA  0
# 12  11     DFAB_GRD_CD REAL       0         NA  0
# 13  12     DFAB_PTN_CD REAL       0         NA  0
# 14  13     DFAB_REG_YM TEXT       0         NA  0
# > Sys.time() - t0
# Time difference of 0.08084798 secs




t0 = Sys.time()
mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
    mydb %>% {DBI::dbGetQuery(., paste0("
    PRAGMA TABLE_INFO('", chr, "')"))}
}) %>% setNames(mydb %>% {DBI::dbListTables(.)})
Sys.time() - t0
# > t0 = Sys.time()
# > mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
# +     mydb %>% {DBI::dbGetQuery(., paste0("
# +     PRAGMA TABLE_INFO('", chr, "')"))}
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)})
# $`NHID_GJ_0213.bind_rows.integer`
#    cid                      name    type notnull dflt_value pk
# 1    0                 HCHK_YEAR INTEGER       0         NA  0
# 2    1                 PERSON_ID INTEGER       0         NA  0
# 3    2            YKIHO_GUBUN_CD INTEGER       0         NA  0
# 4    3                    HEIGHT INTEGER       0         NA  0
# 5    4                    WEIGHT INTEGER       0         NA  0
# 6    5                   BP_HIGH INTEGER       0         NA  0
# 7    6                   BP_LWST INTEGER       0         NA  0
# 8    7                      BLDS INTEGER       0         NA  0
# 9    8                 TOT_CHOLE INTEGER       0         NA  0
# 10   9                       HMG    REAL       0         NA  0
# 11  10                    GLY_CD INTEGER       0         NA  0
# 12  11              OLIG_OCCU_CD INTEGER       0         NA  0
# 13  12                   OLIG_PH    REAL       0         NA  0
# 14  13             OLIG_PROTE_CD INTEGER       0         NA  0
# 15  14                  SGOT_AST INTEGER       0         NA  0
# 16  15                  SGPT_ALT INTEGER       0         NA  0
# 17  16                 GAMMA_GTP INTEGER       0         NA  0
# 18  17              HCHK_PMH_CD1 INTEGER       0         NA  0
# 19  18              HCHK_PMH_CD2 INTEGER       0         NA  0
# 20  19              HCHK_PMH_CD3 INTEGER       0         NA  0
# 21  20 FMLY_LIVER_DISE_PATIEN_YN INTEGER       0         NA  0
# 22  21      FMLY_HPRTS_PATIEN_YN INTEGER       0         NA  0
# 23  22       FMLY_APOP_PATIEN_YN INTEGER       0         NA  0
# 24  23      FMLY_HDISE_PATIEN_YN INTEGER       0         NA  0
# 25  24     FMLY_DIABML_PATIEN_YN INTEGER       0         NA  0
# 26  25     FMLY_CANCER_PATIEN_YN INTEGER       0         NA  0
# 27  26     SMK_STAT_TYPE_RSPS_CD INTEGER       0         NA  0
# 28  27          SMK_TERM_RSPS_CD INTEGER       0         NA  0
# 29  28             DSQTY_RSPS_CD INTEGER       0         NA  0
# 30  29        DRNK_HABIT_RSPS_CD INTEGER       0         NA  0
# 31  30        TM1_DRKQTY_RSPS_CD    REAL       0         NA  0
# 32  31       EXERCI_FREQ_RSPS_CD INTEGER       0         NA  0
# 33  32                     WAIST INTEGER       0         NA  0
# 34  33              TRIGLYCERIDE INTEGER       0         NA  0
# 35  34                 HDL_CHOLE    REAL       0         NA  0
# 36  35                 LDL_CHOLE    REAL       0         NA  0
# 37  36                CREATININE    REAL       0         NA  0
# 38  37          HCHK_APOP_PMH_YN INTEGER       0         NA  0
# 39  38         HCHK_HDISE_PMH_YN INTEGER       0         NA  0
# 40  39         HCHK_HPRTS_PMH_YN INTEGER       0         NA  0
# 41  40        HCHK_DIABML_PMH_YN INTEGER       0         NA  0
# 42  41        HCHK_HPLPDM_PMH_YN INTEGER       0         NA  0
# 43  42        HCHK_ETCDSE_PMH_YN INTEGER       0         NA  0
# 44  43     PAST_SMK_TERM_RSPS_CD INTEGER       0         NA  0
# 45  44        PAST_DSQTY_RSPS_CD INTEGER       0         NA  0
# 46  45      CUR_SMK_TERM_RSPS_CD INTEGER       0         NA  0
# 47  46         CUR_DSQTY_RSPS_CD    REAL       0         NA  0
# 48  47         MOV20_WEK_FREQ_ID INTEGER       0         NA  0
# 49  48         MOV30_WEK_FREQ_ID INTEGER       0         NA  0
# 50  49         WLK30_WEK_FREQ_ID INTEGER       0         NA  0
# 51  50          HCHK_PHSS_PMH_YN INTEGER       0         NA  0
# 
# $NHID_GY20_0213.bind_rows.12478.ICDclean.factor
#   cid       name type notnull dflt_value pk
# 1   0  PERSON_ID TEXT       0         NA  0
# 2   1    KEY_SEQ TEXT       0         NA  0
# 3   2 RECU_FR_DT TEXT       0         NA  0
# 4   3  MAIN_SICK TEXT       0         NA  0
# 5   4   SUB_SICK TEXT       0         NA  0
# 
# $NHID_GY40_0213.bind_rows.factor
#   cid     name type notnull dflt_value pk
# 1   0  KEY_SEQ TEXT       0         NA  0
# 2   1 DSBJT_CD TEXT       0         NA  0
# 3   2 SICK_SYM TEXT       0         NA  0
# 
# $NHID_GY60_0213.bind_rows.GNL_NM_CD4
#   cid           name    type notnull dflt_value pk
# 1   0        KEY_SEQ    TEXT       0         NA  0
# 2   1     GNL_NM_CD4    TEXT       0         NA  0
# 3   2   DD_MQTY_FREQ    REAL       0         NA  0
# 4   3   DD_EXEC_FREQ INTEGER       0         NA  0
# 5   4 MDCN_EXEC_FREQ INTEGER       0         NA  0
# 
# $NHID_JK0213.bind_rows
#    cid            name type notnull dflt_value pk
# 1    0          STND_Y REAL       0         NA  0
# 2    1       PERSON_ID REAL       0         NA  0
# 3    2             SEX REAL       0         NA  0
# 4    3       AGE_GROUP REAL       0         NA  0
# 5    4          DTH_YM TEXT       0         NA  0
# 6    5       DTH_CODE1 TEXT       0         NA  0
# 7    6       DTH_CODE2 TEXT       0         NA  0
# 8    7            SIDO REAL       0         NA  0
# 9    8             SGG REAL       0         NA  0
# 10   9    IPSN_TYPE_CD REAL       0         NA  0
# 11  10 CTRB_PT_TYPE_CD REAL       0         NA  0
# 12  11     DFAB_GRD_CD REAL       0         NA  0
# 13  12     DFAB_PTN_CD REAL       0         NA  0
# 14  13     DFAB_REG_YM TEXT       0         NA  0
# 
# > Sys.time() - t0
# Time difference of 0.2574241 secs






#@ CREATE INDEX  =====

mydb %>% {DBI::dbGetQuery(
    ., paste0("
SELECT *
FROM sqlite_master
              ")
)} %>% {.$tbl_name} %>% dput
# > mydb %>% {DBI::dbGetQuery(
# +     ., paste0("
# + SELECT *
# + FROM sqlite_master
# +               ")
# + )} %>% {.$tbl_name} %>% dput
c("NHID_JK0213.bind_rows", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor",
"NHID_GY60_0213.bind_rows.GNL_NM_CD4", "NHID_GJ_0213.bind_rows.integer",
"NHID_GY40_0213.bind_rows.factor")


t0 = Sys.time()
indexed_column_name = "PERSON_ID"
for (tbl_name in c("NHID_JK0213.bind_rows", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", "NHID_GJ_0213.bind_rows.integer")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX 
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )} 
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "PERSON_ID"
# > for (tbl_name in c("NHID_JK0213.bind_rows", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", "NHID_GJ_0213.bind_rows.integer")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX 
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )} 
# + }
# Warning messages:
# 1: In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# 2: In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# 3: In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 1.253474 mins


t0 = Sys.time()
indexed_column_name = "KEY_SEQ"
for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor", "NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX 
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )} 
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "KEY_SEQ"
# > for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor", "NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX 
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )} 
# + }
# Warning messages:
# 1: In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# 2: In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# 3: In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 7.184301 mins



t0 = Sys.time()
indexed_column_name = "RECU_FR_DT"
for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )}
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "RECU_FR_DT"
# > for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )}
# + }
# Warning message:
# In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 1.669177 mins

t0 = Sys.time()
indexed_column_name = "SICK_SYM"
for (tbl_name in c("NHID_GY40_0213.bind_rows.factor")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )}
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "SICK_SYM"
# > for (tbl_name in c("NHID_GY40_0213.bind_rows.factor")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )}
# + }
# Warning message:
# In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 5.964187 mins


t0 = Sys.time()
indexed_column_name = "MAIN_SICK"
for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )}
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "MAIN_SICK"
# > for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )}
# + }
# Warning message:
# In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 2.051633 mins

t0 = Sys.time()
indexed_column_name = "SUB_SICK"
for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )}
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "SUB_SICK"
# > for (tbl_name in c("NHID_GY20_0213.bind_rows.12478.ICDclean.factor")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )}
# + }
# Warning message:
# In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 1.979978 mins


t0 = Sys.time()
indexed_column_name = "GNL_NM_CD4"
for (tbl_name in c("NHID_GY60_0213.bind_rows.GNL_NM_CD4")) {
    sql.txt = mydb %>% {DBI::dbGetQuery(
        ., paste0("
CREATE INDEX
              ", "'", tbl_name, "_", indexed_column_name, "'", "
ON
                  ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
    )}
}
Sys.time() - t0
# > t0 = Sys.time()
# > indexed_column_name = "GNL_NM_CD4"
# > for (tbl_name in c("NHID_GY60_0213.bind_rows.GNL_NM_CD4")) {
# +     sql.txt = mydb %>% {DBI::dbGetQuery(
# +         ., paste0("
# + CREATE INDEX
# +               ", "'", tbl_name, "_", indexed_column_name, "'", "
# + ON
# +                   ", "'", tbl_name, "'", "(", "'", indexed_column_name, "'", ");")
# +     )}
# + }
# Warning message:
# In result_fetch(res@ptr, n = n) :
#   Don't need to call dbFetch() for statements, only for queries
# > Sys.time() - t0
# Time difference of 7.207938 mins



#@ https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html -----
# mydb <- dbConnect(RSQLite::SQLite(), "KNHIS.JK_GJ596284.sqlite")
dbDisconnect(mydb)
# unlink("KNHIS.JK_GJ596284.sqlite")


