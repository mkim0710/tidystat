# function.list.files.read.sqlite.source.r

# KNHIS.02ID.2089.SICK_SYM_3char.sqlite from .r =====


#@ https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html -----
#@ http://db.rstudio.com/databases/sqlite/ ----
#@ http://www.datacarpentry.org/R-ecology-lesson/05-r-and-databases.html#creating_a_new_sqlite_database -----


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
mydb <- dbConnect(RSQLite::SQLite(), paste0(path4write, "KNHIS.02ID.2089.SICK_SYM_3char.sqlite"))



#@ mydb %>% dbWriteTable("NHID_JK0213.bind_rows", ( ------
t0 = Sys.time()
load("D:/[[[[Rproject]]]]/Rproject_KNHIS/NHID_JK0213.bind_rows.rda")
Sys.time() - t0
# > t0 = Sys.time()
# > load("D:/[[[[Rproject]]]]/Rproject_KNHIS/NHID_JK0213.bind_rows.rda")
# > Sys.time() - t0
# Time difference of 11.94763 secs

t0 = Sys.time()
mydb %>% dbWriteTable("NHID_JK0213.bind_rows", (
    NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID) %>% 
        left_join(NHID_JK0213.bind_rows)
), overwrite = F)
Sys.time() - t0
# > t0 = Sys.time()
# > mydb %>% dbWriteTable("NHID_JK0213.bind_rows", (
# +     NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID) %>% 
# +         left_join(NHID_JK0213.bind_rows)
# + ))
# Joining, by = "PERSON_ID"
# > Sys.time() - t0
# Time difference of 22.6602 secs



#@ mydb %>% dbWriteTable("NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char", ( -----
t0 = Sys.time()
load("NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char(incl SICK_SYM).rda")
Sys.time() - t0
# > t0 = Sys.time()
# > load("NHID_GY20_0213.bind_rows.12478.ICDclean.rda")
# > Sys.time() - t0
# Time difference of 5.272487 mins

t0 = Sys.time()
mydb %>% dbWriteTable("NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char", (
    NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID) %>% mutate(PERSON_ID = as.character(PERSON_ID)) %>% 
        left_join(NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char %>% mutate(PERSON_ID = as.character(PERSON_ID)))
))
Sys.time() - t0
mydb %>% dbListTables
# > t0 = Sys.time()
# > mydb %>% dbWriteTable("NHID_GY20_0213.bind_rows.12478.ICDclean", (
# +     NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID) %>% mutate(PERSON_ID = as.character(PERSON_ID)) %>% 
# +         left_join(NHID_GY20_0213.bind_rows.12478.ICDclean)
# + ))
# Joining, by = "PERSON_ID"
# > Sys.time() - t0
# Time difference of 2.539899 mins


# KEY_SEQ.02ID.2089 =
#     NHID_GY20_0213.bind_rows.12478.ICDclean %>%
#         right_join(
#             NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID)
#         ) %>% select(KEY_SEQ) %>% distinct
# KEY_SEQ.02ID.2089 %>% as.tibble
# # > KEY_SEQ.02ID.2089 =
# # +     NHID_GY20_0213.bind_rows.12478.ICDclean %>%
# # +         right_join(
# # +             NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID)
# # +         ) %>% select(KEY_SEQ) %>% distinct
# # Joining, by = "PERSON_ID"
# # Warning message:
# # Column `PERSON_ID` joining factors with different levels, coercing to character vector 
# # > KEY_SEQ.02ID.2089 %>% as.tibble
# # # A tibble: 87,978,631 x 1
# #    KEY_SEQ     
# #    <fct>       
# #  1 NA          
# #  2 200202328622
# #  3 200200835792
# #  4 200204218898
# #  5 200207958868
# #  6 200302388276
# #  7 200302388275
# #  8 200309659990
# #  9 200309659989
# # 10 200609657258
# # # ... with 87,978,621 more rows
# save(KEY_SEQ.02ID.2089, file = "KEY_SEQ.02ID.2089.rda")  # 7.4 GB RAM -> 0.6 GB file
# KEY_SEQ.02ID.2089 = KEY_SEQ.02ID.2089 %>% mutate(
#     KEY_SEQ = as.character(KEY_SEQ)
# )
# save(KEY_SEQ.02ID.2089, file = "KEY_SEQ.02ID.2089.rda")  # 5.2 GB RAM -> 0.4 GB file
load("KEY_SEQ.02ID.2089.rda")

rm(NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char)




#@ mydb %>% dbWriteTable("NHID_GY60_0213.bind_rows.GNL_NM_CD4", ( ------

t0 = Sys.time()
load("NHID_GY60_0213.bind_rows.GNL_NM_CD4.rda")
Sys.time() - t0
# > t0 = Sys.time()
# > load("NHID_GY60_0213.bind_rows(16789).rda")
# > Sys.time() - t0
# Time difference of 4.532779 mins

KEY_SEQ.02ID.2089 %>% str
# > KEY_SEQ.02ID.2089 %>% str
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	87978631 obs. of  1 variable:
#  $ KEY_SEQ: Factor w/ 119362188 levels "200200000001",..: NA 1024407 376164 1873519 3606711 7046463 7046462 10201978 10201977 28751683 ...

NHID_GY60_0213.bind_rows.GNL_NM_CD4$KEY_SEQ %>% str
# > NHID_GY60_0213.bind_rows$KEY_SEQ %>% str
#  num [1:396777916] 2e+11 2e+11 2e+11 2e+11 2e+11 ...
NHID_GY60_0213.bind_rows.GNL_NM_CD4$KEY_SEQ %>% unique %>% str
# > NHID_GY60_0213.bind_rows$KEY_SEQ %>% unique %>% str
#  num [1:88178104] 2e+11 2e+11 2e+11 2e+11 2e+11 ...



#@ mydb %>% dbWriteTable("NHID_GY60_0213.bind_rows.GNL_NM_CD4", ( ------
memory.limit(size=40*1000)
t0 = Sys.time()
mydb %>% dbWriteTable("NHID_GY60_0213.bind_rows.GNL_NM_CD4", (
    KEY_SEQ.02ID.2089 %>% 
        left_join(
            NHID_GY60_0213.bind_rows.GNL_NM_CD4 %>% 
                mutate(KEY_SEQ = as.character(KEY_SEQ)) %>% 
                select(KEY_SEQ, GNL_NM_CD4, DD_MQTY_FREQ, DD_EXEC_FREQ, MDCN_EXEC_FREQ)
        )
), overwrite = F)
Sys.time() - t0
mydb %>% dbListTables
# > memory.limit(size=40*1000)
# [1] 40000
# > t0 = Sys.time()
# > mydb %>% dbWriteTable("NHID_GY60_0213.bind_rows", (
# +     KEY_SEQ.02ID.2089 %>% 
# +         left_join(NHID_GY60_0213.bind_rows %>% mutate(KEY_SEQ = as.character(KEY_SEQ)))
# + ))
# Joining, by = "KEY_SEQ"
# > Sys.time() - t0
# Time difference of 27.68924 mins
# > mydb %>% dbListTables
# [1] "NHID_GY20_0213.bind_rows.12478.ICDclean" "NHID_GY60_0213.bind_rows"                     "NHID_JK0213.bind_rows"                  

rm(NHID_GY60_0213.bind_rows.GNL_NM_CD4)

?dbSendQuery


#@ mydb %>% dbWriteTable("NHID_GJ_0213.bind_rows", ( ------
load("NHID_GJ_0213.bind_rows.integer.rda")
t0 = Sys.time()
mydb %>% dbWriteTable("NHID_GJ_0213.bind_rows.integer", (
    NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID) %>% mutate(PERSON_ID = as.character(PERSON_ID)) %>% 
        left_join(NHID_GJ_0213.bind_rows.integer %>% mutate(PERSON_ID = as.character(PERSON_ID)))
), overwrite = F)
Sys.time() - t0
mydb %>% dbListTables
# > t0 = Sys.time()
# > mydb %>% dbWriteTable("NHID_GJ_0213.bind_rows.integer", (
# +     NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID) %>% mutate(PERSON_ID = as.character(PERSON_ID)) %>% 
# +         left_join(NHID_GJ_0213.bind_rows.integer %>% mutate(PERSON_ID = as.character(PERSON_ID)))
# + ), overwrite = T)
# Joining, by = "PERSON_ID"
# > Sys.time() - t0
# Time difference of 19.74414 secs
# > mydb %>% dbListTables
# [1] "NHID_GJ_0213.bind_rows.integer"          "NHID_GY20_0213.bind_rows.12478.ICDclean"
# [3] "NHID_GY60_0213.bind_rows"                "NHID_JK0213.bind_rows"              

rm(NHID_GJ_0213.bind_rows.integer)





#@ end -----
getwd() %>% dput
# > getwd() %>% dput
# "X:/mkim/Rproject"
# path4read = "//DON/marketscan_users/smacdonald/"
# path4write = "//DON/marketscan_users/mkim/"
# path4read = "/proj/marketscan_users/marketscan/mkim/"
# path4write = "/proj/marketscan_users/marketscan/mkim/"
path4read = "../"
path4write = "../"
mydb <- DBI::dbConnect(RSQLite::SQLite(), paste0(path4write, "KNHIS.02ID.2089.SICK_SYM_3char.sqlite"))


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
c("NHID_GJ_0213.bind_rows.integer", "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char", 
"NHID_GY60_0213.bind_rows.GNL_NM_CD4", "NHID_JK0213.bind_rows"
)
# > t0 = Sys.time()
# > mydb %>% {DBI::dbListTables(.)} %>% map_dbl(function(chr) {
# +     mydb %>% {DBI::dbGetQuery(., paste0('
# +     select count(*) from "', chr, '"'))} %>% unlist
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% as.data.frame %>% setNames("count(*)") %>% dput #----
structure(list(`count(*)` = c(2294874, 227954977, 291467211,
8335791)), .Names = "count(*)", row.names = c("NHID_GJ_0213.bind_rows.integer", 
"NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char", "NHID_GY60_0213.bind_rows.GNL_NM_CD4", 
"NHID_JK0213.bind_rows"), class = "data.frame")
# > Sys.time() - t0
# Time difference of 59.01476 secs
# > mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
# +     mydb %>% dbListFields(chr)
# + }) %>% setNames(mydb %>% {DBI::dbListTables(.)}) %>% dput #----
structure(list(NHID_GJ_0213.bind_rows.integer = c("PERSON_ID", 
"HCHK_YEAR", "YKIHO_GUBUN_CD", "HEIGHT", "WEIGHT", "BP_HIGH", 
"BP_LWST", "BLDS", "TOT_CHOLE", "HMG", "GLY_CD", "OLIG_OCCU_CD", 
"OLIG_PH", "OLIG_PROTE_CD", "SGOT_AST", "SGPT_ALT", "GAMMA_GTP", 
"HCHK_PMH_CD1", "HCHK_PMH_CD2", "HCHK_PMH_CD3", "FMLY_LIVER_DISE_PATIEN_YN", 
"FMLY_HPRTS_PATIEN_YN", "FMLY_APOP_PATIEN_YN", "FMLY_HDISE_PATIEN_YN", 
"FMLY_DIABML_PATIEN_YN", "FMLY_CANCER_PATIEN_YN", "SMK_STAT_TYPE_RSPS_CD", 
"SMK_TERM_RSPS_CD", "DSQTY_RSPS_CD", "DRNK_HABIT_RSPS_CD", "TM1_DRKQTY_RSPS_CD", 
"EXERCI_FREQ_RSPS_CD", "WAIST", "TRIGLYCERIDE", "HDL_CHOLE", 
"LDL_CHOLE", "CREATININE", "HCHK_APOP_PMH_YN", "HCHK_HDISE_PMH_YN", 
"HCHK_HPRTS_PMH_YN", "HCHK_DIABML_PMH_YN", "HCHK_HPLPDM_PMH_YN", 
"HCHK_ETCDSE_PMH_YN", "PAST_SMK_TERM_RSPS_CD", "PAST_DSQTY_RSPS_CD", 
"CUR_SMK_TERM_RSPS_CD", "CUR_DSQTY_RSPS_CD", "MOV20_WEK_FREQ_ID", 
"MOV30_WEK_FREQ_ID", "WLK30_WEK_FREQ_ID", "HCHK_PHSS_PMH_YN"), 
    NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char = c("PERSON_ID", 
    "KEY_SEQ", "RECU_FR_DT", "SICK_SYM", "SICK_SYM_3char"), NHID_GY60_0213.bind_rows.GNL_NM_CD4 = c("KEY_SEQ", 
    "GNL_NM_CD4", "DD_MQTY_FREQ", "DD_EXEC_FREQ", "MDCN_EXEC_FREQ"
    ), NHID_JK0213.bind_rows = c("PERSON_ID", "STND_Y", "SEX", 
    "AGE_GROUP", "DTH_YM", "DTH_CODE1", "DTH_CODE2", "SIDO", 
    "SGG", "IPSN_TYPE_CD", "CTRB_PT_TYPE_CD", "DFAB_GRD_CD", 
    "DFAB_PTN_CD", "DFAB_REG_YM")), .Names = c("NHID_GJ_0213.bind_rows.integer", 
"NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char", "NHID_GY60_0213.bind_rows.GNL_NM_CD4", 
"NHID_JK0213.bind_rows"))
# $NHID_GJ_0213.bind_rows.integer
#  [1] "PERSON_ID"                 "HCHK_YEAR"                 "YKIHO_GUBUN_CD"            "HEIGHT"                    "WEIGHT"                   
#  [6] "BP_HIGH"                   "BP_LWST"                   "BLDS"                      "TOT_CHOLE"                 "HMG"                      
# [11] "GLY_CD"                    "OLIG_OCCU_CD"              "OLIG_PH"                   "OLIG_PROTE_CD"             "SGOT_AST"                 
# [16] "SGPT_ALT"                  "GAMMA_GTP"                 "HCHK_PMH_CD1"              "HCHK_PMH_CD2"              "HCHK_PMH_CD3"             
# [21] "FMLY_LIVER_DISE_PATIEN_YN" "FMLY_HPRTS_PATIEN_YN"      "FMLY_APOP_PATIEN_YN"       "FMLY_HDISE_PATIEN_YN"      "FMLY_DIABML_PATIEN_YN"    
# [26] "FMLY_CANCER_PATIEN_YN"     "SMK_STAT_TYPE_RSPS_CD"     "SMK_TERM_RSPS_CD"          "DSQTY_RSPS_CD"             "DRNK_HABIT_RSPS_CD"       
# [31] "TM1_DRKQTY_RSPS_CD"        "EXERCI_FREQ_RSPS_CD"       "WAIST"                     "TRIGLYCERIDE"              "HDL_CHOLE"                
# [36] "LDL_CHOLE"                 "CREATININE"                "HCHK_APOP_PMH_YN"          "HCHK_HDISE_PMH_YN"         "HCHK_HPRTS_PMH_YN"        
# [41] "HCHK_DIABML_PMH_YN"        "HCHK_HPLPDM_PMH_YN"        "HCHK_ETCDSE_PMH_YN"        "PAST_SMK_TERM_RSPS_CD"     "PAST_DSQTY_RSPS_CD"       
# [46] "CUR_SMK_TERM_RSPS_CD"      "CUR_DSQTY_RSPS_CD"         "MOV20_WEK_FREQ_ID"         "MOV30_WEK_FREQ_ID"         "WLK30_WEK_FREQ_ID"        
# [51] "HCHK_PHSS_PMH_YN"         
# 
# $NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char
# [1] "PERSON_ID"      "KEY_SEQ"        "RECU_FR_DT"     "SICK_SYM"       "SICK_SYM_3char"
# 
# $NHID_GY60_0213.bind_rows.GNL_NM_CD4
# [1] "KEY_SEQ"        "GNL_NM_CD4"     "DD_MQTY_FREQ"   "DD_EXEC_FREQ"   "MDCN_EXEC_FREQ"
# 
# $NHID_JK0213.bind_rows
#  [1] "PERSON_ID"       "STND_Y"          "SEX"             "AGE_GROUP"       "DTH_YM"          "DTH_CODE1"       "DTH_CODE2"       "SIDO"           
#  [9] "SGG"             "IPSN_TYPE_CD"    "CTRB_PT_TYPE_CD" "DFAB_GRD_CD"     "DFAB_PTN_CD"     "DFAB_REG_YM"   




#@ https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html -----
# mydb <- dbConnect(RSQLite::SQLite(), "KNHIS.02ID.2089.SICK_SYM_3char.sqlite")
dbDisconnect(mydb)
# unlink("KNHIS.02ID.2089.SICK_SYM_3char.sqlite")


















#@@@ mydb.dbListTables.dbListFields.ifelse.bindcols from .r =====
#@ mydb.dbListTables.dbListFields ======
mydb.dbListTables.dbListFields = 
    mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
        mydb %>% dbListFields(chr)
    }) %>% setNames(mydb %>% {DBI::dbListTables(.)})


mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %>% str
# > mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %>% str
#  chr [1:149] "enrolid" "EFAMID" "NDCNUM" "SVCDATE" "DOBYR" "YEAR" "AGE" "DAYSUPP" "GENERID" "METQTY" "MHSACOVG" "PDDATE" "PHARMID" "QTY" "REFILL" "THERCLS" ...


# mydb.dbListTables.dbListFields %>% map(function(vec) {
#     if_else(vec %in% (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), T, F)
# }) %>% str
# # > mydb.dbListTables.dbListFields %>% map(function(vec) {
# # +     if_else(vec %in% (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), T, F)
# # + }) %>% str
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
    if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
}) %>% str
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
# + }) %>% str
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
    if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
}) %>% bind_cols
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
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
    if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
}) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), .before = 1)
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
# + }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), .before = 1)
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
    if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
}) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), .before = 1) %>% arrange(varname)
# > mydb.dbListTables.dbListFields %>% map(function(vec) {
# +     if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
# + }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), .before = 1) %>% arrange(varname)
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
        if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
    }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), .before = 1) %>% arrange(varname)
    , "mydb.dbListTables.dbListFields.ifelse.bindcols.xlsx"
    , asTable = T
)
openxlsx::openXL(
    "mydb.dbListTables.dbListFields.ifelse.bindcols.xlsx"
)
# > openxlsx::openXL(
# +     "mydb.dbListTables.dbListFields.ifelse.bindcols.xlsx"
# + )
# Error in chooseExcelApp() : No applications (detected) available.
# Set options('openxlsx.excelApp'), instead.




#@ mydb.dbListTables.dbListFields %>% unlist %>% unname %>% toupper %>% unique ------
?unique
mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %>% str
mydb.dbListTables.dbListFields %>% unlist %>% unname %>% toupper %>% unique %>% str
# > mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %>% str
#  chr [1:149] "enrolid" "EFAMID" "NDCNUM" "SVCDATE" "DOBYR" "YEAR" "AGE" "DAYSUPP" "GENERID" "METQTY" "MHSACOVG" "PDDATE" "PHARMID" "QTY" "REFILL" "THERCLS" ...
# > mydb.dbListTables.dbListFields %>% unlist %>% unname %>% toupper %>% unique %>% str
#  chr [1:146] "ENROLID" "EFAMID" "NDCNUM" "SVCDATE" "DOBYR" "YEAR" "AGE" "DAYSUPP" "GENERID" "METQTY" "MHSACOVG" "PDDATE" "PHARMID" "QTY" "REFILL" "THERCLS" ...



mydb.dbListTables.dbListFields.ifelse.bindcols =
    mydb.dbListTables.dbListFields %>% map(function(vec) {
        if_else((mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique %in% vec), T, F)
    }) %>% bind_cols %>% add_column(varname = (mydb.dbListTables.dbListFields %>% unlist %>% unname %>% unique), .before = 1) %>% arrange(varname)






#@ end -----
save(mydb.dbListTables.dbListFields, file = "mydb.dbListTables.dbListFields.rda")
save(mydb.dbListTables.dbListFields.ifelse.bindcols, file = "mydb.dbListTables.dbListFields.ifelse.bindcols.rda")























#@@@ KNHIS.02ID.2089.sqlite.tbl from .r =====
#@ KNHIS.02ID.2089.sqlite.tbl ====
KNHIS.02ID.2089.sqlite.tbl = mydb %>% {DBI::dbListTables(.)} %>% map(function(chr) {
    mydb %>% tbl(chr)
}) %>% setNames(mydb %>% {DBI::dbListTables(.)})
KNHIS.02ID.2089.sqlite.tbl %>% str
# > KNHIS.02ID.2089.sqlite.tbl %>% str
# List of 4
#  $ NHID_GJ_0213.bind_rows.integer         :List of 2
#   ..$ src:List of 2
#   .. ..$ con  :Formal class 'SQLiteConnection' [package "RSQLite"] with 7 slots
#   .. .. .. ..@ ptr                :<externalptr> 
#   .. .. .. ..@ dbname             : chr "E:\\\[[[[Rproject]]]]\\Rproject_KNHIS\\KNHIS.02ID.2089.sqlite"
#   .. .. .. ..@ loadable.extensions: logi TRUE
#   .. .. .. ..@ flags              : int 70
#   .. .. .. ..@ vfs                : chr ""
#   .. .. .. ..@ ref                :<environment: 0x000000001d6db9a0> 
#   .. .. .. ..@ bigint             : chr "integer64"
#   .. ..$ disco: NULL
#   .. ..- attr(*, "class")= chr [1:3] "src_dbi" "src_sql" "src"
#   ..$ ops:List of 2
#   .. ..$ x   : 'ident' chr "NHID_GJ_0213.bind_rows.integer"
#   .. ..$ vars: chr [1:51] "PERSON_ID" "HCHK_YEAR" "YKIHO_GUBUN_CD" "HEIGHT" ...
#   .. ..- attr(*, "class")= chr [1:3] "op_base_remote" "op_base" "op"
#   ..- attr(*, "class")= chr [1:4] "tbl_dbi" "tbl_sql" "tbl_lazy" "tbl"
#  $ NHID_GY20_0213.bind_rows.12478.ICDclean:List of 2
#   ..$ src:List of 2
#   .. ..$ con  :Formal class 'SQLiteConnection' [package "RSQLite"] with 7 slots
#   .. .. .. ..@ ptr                :<externalptr> 
#   .. .. .. ..@ dbname             : chr "E:\\\[[[[Rproject]]]]\\Rproject_KNHIS\\KNHIS.02ID.2089.sqlite"
#   .. .. .. ..@ loadable.extensions: logi TRUE
#   .. .. .. ..@ flags              : int 70
#   .. .. .. ..@ vfs                : chr ""
#   .. .. .. ..@ ref                :<environment: 0x000000001d6db9a0> 
#   .. .. .. ..@ bigint             : chr "integer64"
#   .. ..$ disco: NULL
#   .. ..- attr(*, "class")= chr [1:3] "src_dbi" "src_sql" "src"
#   ..$ ops:List of 2
#   .. ..$ x   : 'ident' chr "NHID_GY20_0213.bind_rows.12478.ICDclean"
#   .. ..$ vars: chr [1:5] "PERSON_ID" "KEY_SEQ" "RECU_FR_DT" "MAIN_SICK" ...
#   .. ..- attr(*, "class")= chr [1:3] "op_base_remote" "op_base" "op"
#   ..- attr(*, "class")= chr [1:4] "tbl_dbi" "tbl_sql" "tbl_lazy" "tbl"
#  $ NHID_GY60_0213.bind_rows               :List of 2
#   ..$ src:List of 2
#   .. ..$ con  :Formal class 'SQLiteConnection' [package "RSQLite"] with 7 slots
#   .. .. .. ..@ ptr                :<externalptr> 
#   .. .. .. ..@ dbname             : chr "E:\\\[[[[Rproject]]]]\\Rproject_KNHIS\\KNHIS.02ID.2089.sqlite"
#   .. .. .. ..@ loadable.extensions: logi TRUE
#   .. .. .. ..@ flags              : int 70
#   .. .. .. ..@ vfs                : chr ""
#   .. .. .. ..@ ref                :<environment: 0x000000001d6db9a0> 
#   .. .. .. ..@ bigint             : chr "integer64"
#   .. ..$ disco: NULL
#   .. ..- attr(*, "class")= chr [1:3] "src_dbi" "src_sql" "src"
#   ..$ ops:List of 2
#   .. ..$ x   : 'ident' chr "NHID_GY60_0213.bind_rows"
#   .. ..$ vars: chr [1:5] "KEY_SEQ" "GNL_NM_CD" "DD_MQTY_FREQ" "DD_EXEC_FREQ" ...
#   .. ..- attr(*, "class")= chr [1:3] "op_base_remote" "op_base" "op"
#   ..- attr(*, "class")= chr [1:4] "tbl_dbi" "tbl_sql" "tbl_lazy" "tbl"
#  $ NHID_JK0213.bind_rows                  :List of 2
#   ..$ src:List of 2
#   .. ..$ con  :Formal class 'SQLiteConnection' [package "RSQLite"] with 7 slots
#   .. .. .. ..@ ptr                :<externalptr> 
#   .. .. .. ..@ dbname             : chr "E:\\\[[[[Rproject]]]]\\Rproject_KNHIS\\KNHIS.02ID.2089.sqlite"
#   .. .. .. ..@ loadable.extensions: logi TRUE
#   .. .. .. ..@ flags              : int 70
#   .. .. .. ..@ vfs                : chr ""
#   .. .. .. ..@ ref                :<environment: 0x000000001d6db9a0> 
#   .. .. .. ..@ bigint             : chr "integer64"
#   .. ..$ disco: NULL
#   .. ..- attr(*, "class")= chr [1:3] "src_dbi" "src_sql" "src"
#   ..$ ops:List of 2
#   .. ..$ x   : 'ident' chr "NHID_JK0213.bind_rows"
#   .. ..$ vars: chr [1:14] "PERSON_ID" "STND_Y" "SEX" "AGE_GROUP" ...
#   .. ..- attr(*, "class")= chr [1:3] "op_base_remote" "op_base" "op"
#   ..- attr(*, "class")= chr [1:4] "tbl_dbi" "tbl_sql" "tbl_lazy" "tbl"






#@     ob %>% show_query -------
KNHIS.02ID.2089.sqlite.tbl %>% map(function(ob) {
    ob %>% show_query
    "ok"
})
# > KNHIS.02ID.2089.sqlite.tbl %>% map(function(ob) {
# +     ob %>% show_query
# +     "ok"
# + })
# <SQL>
# SELECT *
# FROM `NHID_GJ_0213.bind_rows.integer`
# <SQL>
# SELECT *
# FROM `NHID_GY20_0213.bind_rows.12478.ICDclean`
# <SQL>
# SELECT *
# FROM `NHID_GY60_0213.bind_rows`
# <SQL>
# SELECT *
# FROM `NHID_JK0213.bind_rows`
# $`NHID_GJ_0213.bind_rows.integer`
# [1] "ok"
# 
# $NHID_GY20_0213.bind_rows.12478.ICDclean
# [1] "ok"
# 
# $NHID_GY60_0213.bind_rows
# [1] "ok"
# 
# $NHID_JK0213.bind_rows
# [1] "ok"








#@     ob %>% explain -------
KNHIS.02ID.2089.sqlite.tbl %>% map(function(ob) {
    ob %>% explain
    "ok"
})
# > KNHIS.02ID.2089.sqlite.tbl %>% map(function(ob) {
# +     ob %>% explain
# +     "ok"
# + })
# <SQL>
# SELECT *
# FROM `NHID_GJ_0213.bind_rows.integer`
# 
# 
# <PLAN>
#    addr       opcode p1      p2 p3 p4 p5 comment
# 1     0         Init  0      64  0    00      NA
# 2     1     OpenRead  0 3664386  0 51 00      NA
# 3     2       Rewind  0      63  0    00      NA
# 4     3       Column  0       0  1    00      NA
# 5     4       Column  0       1  2    00      NA
# 6     5       Column  0       2  3    00      NA
# 7     6       Column  0       3  4    00      NA
# 8     7       Column  0       4  5    00      NA
# 9     8       Column  0       5  6    00      NA
# 10    9       Column  0       6  7    00      NA
# 11   10       Column  0       7  8    00      NA
# 12   11       Column  0       8  9    00      NA
# 13   12       Column  0       9 10    00      NA
# 14   13 RealAffinity 10       0  0    00      NA
# 15   14       Column  0      10 11    00      NA
# 16   15       Column  0      11 12    00      NA
# 17   16       Column  0      12 13    00      NA
# 18   17 RealAffinity 13       0  0    00      NA
# 19   18       Column  0      13 14    00      NA
# 20   19       Column  0      14 15    00      NA
# 21   20       Column  0      15 16    00      NA
# 22   21       Column  0      16 17    00      NA
# 23   22       Column  0      17 18    00      NA
# 24   23       Column  0      18 19    00      NA
# 25   24       Column  0      19 20    00      NA
# 26   25       Column  0      20 21    00      NA
# 27   26       Column  0      21 22    00      NA
# 28   27       Column  0      22 23    00      NA
# 29   28       Column  0      23 24    00      NA
# 30   29       Column  0      24 25    00      NA
# 31   30       Column  0      25 26    00      NA
# 32   31       Column  0      26 27    00      NA
# 33   32       Column  0      27 28    00      NA
# 34   33       Column  0      28 29    00      NA
# 35   34       Column  0      29 30    00      NA
# 36   35       Column  0      30 31    00      NA
# 37   36 RealAffinity 31       0  0    00      NA
# 38   37       Column  0      31 32    00      NA
# 39   38       Column  0      32 33    00      NA
# 40   39       Column  0      33 34    00      NA
# 41   40       Column  0      34 35    00      NA
# 42   41 RealAffinity 35       0  0    00      NA
# 43   42       Column  0      35 36    00      NA
# 44   43 RealAffinity 36       0  0    00      NA
# 45   44       Column  0      36 37    00      NA
# 46   45 RealAffinity 37       0  0    00      NA
# 47   46       Column  0      37 38    00      NA
# 48   47       Column  0      38 39    00      NA
# 49   48       Column  0      39 40    00      NA
# 50   49       Column  0      40 41    00      NA
# 51   50       Column  0      41 42    00      NA
# 52   51       Column  0      42 43    00      NA
# 53   52       Column  0      43 44    00      NA
# 54   53       Column  0      44 45    00      NA
# 55   54       Column  0      45 46    00      NA
# 56   55       Column  0      46 47    00      NA
# 57   56 RealAffinity 47       0  0    00      NA
# 58   57       Column  0      47 48    00      NA
# 59   58       Column  0      48 49    00      NA
# 60   59       Column  0      49 50    00      NA
# 61   60       Column  0      50 51    00      NA
# 62   61    ResultRow  1      51  0    00      NA
# 63   62         Next  0       3  0    01      NA
# 64   63         Halt  0       0  0    00      NA
# 65   64  Transaction  0       0  7  0 01      NA
# 66   65         Goto  0       1  0    00      NA
# <SQL>
# SELECT *
# FROM `NHID_GY20_0213.bind_rows.12478.ICDclean`
# 
# 
# <PLAN>
#    addr      opcode p1      p2 p3 p4 p5 comment
# 1     0        Init  0      11  0    00      NA
# 2     1    OpenRead  0 2628837  0  5 00      NA
# 3     2      Rewind  0      10  0    00      NA
# 4     3      Column  0       0  1    00      NA
# 5     4      Column  0       1  2    00      NA
# 6     5      Column  0       2  3    00      NA
# 7     6      Column  0       3  4    00      NA
# 8     7      Column  0       4  5    00      NA
# 9     8   ResultRow  1       5  0    00      NA
# 10    9        Next  0       3  0    01      NA
# 11   10        Halt  0       0  0    00      NA
# 12   11 Transaction  0       0  7  0 01      NA
# 13   12        Goto  0       1  0    00      NA
# <SQL>
# SELECT *
# FROM `NHID_GY60_0213.bind_rows`
# 
# 
# <PLAN>
#    addr       opcode p1    p2 p3 p4 p5 comment
# 1     0         Init  0    12  0    00      NA
# 2     1     OpenRead  0 71805  0  5 00      NA
# 3     2       Rewind  0    11  0    00      NA
# 4     3       Column  0     0  1    00      NA
# 5     4       Column  0     1  2    00      NA
# 6     5       Column  0     2  3    00      NA
# 7     6 RealAffinity  3     0  0    00      NA
# 8     7       Column  0     3  4    00      NA
# 9     8       Column  0     4  5    00      NA
# 10    9    ResultRow  1     5  0    00      NA
# 11   10         Next  0     3  0    01      NA
# 12   11         Halt  0     0  0    00      NA
# 13   12  Transaction  0     0  7  0 01      NA
# 14   13         Goto  0     1  0    00      NA
# <SQL>
# SELECT *
# FROM `NHID_JK0213.bind_rows`
# 
# 
# <PLAN>
#    addr       opcode p1 p2 p3 p4 p5 comment
# 1     0         Init  0 30  0    00      NA
# 2     1     OpenRead  0  2  0 14 00      NA
# 3     2       Rewind  0 29  0    00      NA
# 4     3       Column  0  0  1    00      NA
# 5     4 RealAffinity  1  0  0    00      NA
# 6     5       Column  0  1  2    00      NA
# 7     6 RealAffinity  2  0  0    00      NA
# 8     7       Column  0  2  3    00      NA
# 9     8 RealAffinity  3  0  0    00      NA
# 10    9       Column  0  3  4    00      NA
# 11   10 RealAffinity  4  0  0    00      NA
# 12   11       Column  0  4  5    00      NA
# 13   12       Column  0  5  6    00      NA
# 14   13       Column  0  6  7    00      NA
# 15   14       Column  0  7  8    00      NA
# 16   15 RealAffinity  8  0  0    00      NA
# 17   16       Column  0  8  9    00      NA
# 18   17 RealAffinity  9  0  0    00      NA
# 19   18       Column  0  9 10    00      NA
# 20   19 RealAffinity 10  0  0    00      NA
# 21   20       Column  0 10 11    00      NA
# 22   21 RealAffinity 11  0  0    00      NA
# 23   22       Column  0 11 12    00      NA
# 24   23 RealAffinity 12  0  0    00      NA
# 25   24       Column  0 12 13    00      NA
# 26   25 RealAffinity 13  0  0    00      NA
# 27   26       Column  0 13 14    00      NA
# 28   27    ResultRow  1 14  0    00      NA
# 29   28         Next  0  3  0    01      NA
# 30   29         Halt  0  0  0    00      NA
# 31   30  Transaction  0  0  7  0 01      NA
# 32   31         Goto  0  1  0    00      NA
# $`NHID_GJ_0213.bind_rows.integer`
# [1] "ok"
# 
# $NHID_GY20_0213.bind_rows.12478.ICDclean
# [1] "ok"
# 
# $NHID_GY60_0213.bind_rows
# [1] "ok"
# 
# $NHID_JK0213.bind_rows
# [1] "ok"










#@ KNHIS.02ID.2089.sqlite.tbl -----
KNHIS.02ID.2089.sqlite.tbl
# > KNHIS.02ID.2089.sqlite.tbl
# $`NHID_GJ_0213.bind_rows.integer`
# # Source:   table<NHID_GJ_0213.bind_rows.integer> [?? x 51]
# # Database: sqlite 3.22.0 [E:\[[[[Rproject]]]]\Rproject_KNHIS\KNHIS.02ID.2089.sqlite]
#    PERSON_ID HCHK_YEAR YKIHO_GUBUN_CD HEIGHT WEIGHT BP_HIGH BP_LWST  BLDS TOT_CHOLE   HMG GLY_CD OLIG_OCCU_CD OLIG_PH OLIG_PROTE_CD SGOT_AST SGPT_ALT GAMMA_GTP HCHK_PMH_CD1
#    <chr>         <int>          <int>  <int>  <int>   <int>   <int> <int>     <int> <dbl>  <int>        <int>   <dbl>         <int>    <int>    <int>     <int>        <int>
#  1 94058955         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
#  2 30945258         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
#  3 48167065       2004             10    140     51     130      60    86       242  13.1      1            3   0.600             1       18       12        23           NA
#  4 48167065       2008             20    138     45     139      85    83       195  11.1      1            1   0.700             1        9        5        24            9
#  5 14399813         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
#  6 84121017       2004             30    140     36     110      70   101       166  13        1            1   0.600             1       21       12        18            9
#  7 87592338         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
#  8 10006657         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
#  9 13302593         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
# 10 48112529         NA             NA     NA     NA      NA      NA    NA        NA  NA       NA           NA  NA                NA       NA       NA        NA           NA
# # ... with more rows, and 33 more variables: HCHK_PMH_CD2 <int>, HCHK_PMH_CD3 <int>, FMLY_LIVER_DISE_PATIEN_YN <int>, FMLY_HPRTS_PATIEN_YN <int>, FMLY_APOP_PATIEN_YN <int>,
# #   FMLY_HDISE_PATIEN_YN <int>, FMLY_DIABML_PATIEN_YN <int>, FMLY_CANCER_PATIEN_YN <int>, SMK_STAT_TYPE_RSPS_CD <int>, SMK_TERM_RSPS_CD <int>, DSQTY_RSPS_CD <int>,
# #   DRNK_HABIT_RSPS_CD <int>, TM1_DRKQTY_RSPS_CD <dbl>, EXERCI_FREQ_RSPS_CD <int>, WAIST <int>, TRIGLYCERIDE <int>, HDL_CHOLE <dbl>, LDL_CHOLE <dbl>, CREATININE <dbl>,
# #   HCHK_APOP_PMH_YN <int>, HCHK_HDISE_PMH_YN <int>, HCHK_HPRTS_PMH_YN <int>, HCHK_DIABML_PMH_YN <int>, HCHK_HPLPDM_PMH_YN <int>, HCHK_ETCDSE_PMH_YN <int>,
# #   PAST_SMK_TERM_RSPS_CD <int>, PAST_DSQTY_RSPS_CD <int>, CUR_SMK_TERM_RSPS_CD <int>, CUR_DSQTY_RSPS_CD <dbl>, MOV20_WEK_FREQ_ID <int>, MOV30_WEK_FREQ_ID <int>,
# #   WLK30_WEK_FREQ_ID <int>, HCHK_PHSS_PMH_YN <int>
# 
# $NHID_GY20_0213.bind_rows.12478.ICDclean
# # Source:   table<NHID_GY20_0213.bind_rows.12478.ICDclean> [?? x 5]
# # Database: sqlite 3.22.0 [E:\[[[[Rproject]]]]\Rproject_KNHIS\KNHIS.02ID.2089.sqlite]
#    PERSON_ID KEY_SEQ      RECU_FR_DT MAIN_SICK SUB_SICK
#    <chr>     <chr>        <chr>      <chr>     <chr>   
#  1 94058955  NA           NA         NA        NA      
#  2 30945258  200202328622 20020301   L309      NA      
#  3 30945258  200200835792 20020118   J20       L29     
#  4 30945258  200204218898 20020521   L309      L29     
#  5 30945258  200207958868 20020805   L309      L29     
#  6 30945258  200302388276 20030805   M480      M170    
#  7 30945258  200302388275 20030802   M480      M170    
#  8 30945258  200309659990 20030915   M480      M170    
#  9 30945258  200309659989 20030905   M480      M170    
# 10 30945258  200609657258 20060704   M792      NA      
# # ... with more rows
# 
# $NHID_GY60_0213.bind_rows
# # Source:   table<NHID_GY60_0213.bind_rows> [?? x 5]
# # Database: sqlite 3.22.0 [E:\[[[[Rproject]]]]\Rproject_KNHIS\KNHIS.02ID.2089.sqlite]
#    KEY_SEQ      GNL_NM_CD DD_MQTY_FREQ DD_EXEC_FREQ MDCN_EXEC_FREQ
#    <chr>        <chr>            <dbl>        <int>          <int>
#  1 NA           NA                NA             NA             NA
#  2 200202328622 217001ATB          0.5            3             10
#  3 200202328622 133301ATB          1              3             20
#  4 200202328622 213301ATB          1              3             20
#  5 200202328622 226801ATB          1              3             20
#  6 200200835792 171301CCM          5              2              3
#  7 200200835792 267400ATB          1              3              5
#  8 200200835792 101405ATR          1              3              5
#  9 200200835792 217001ATB          0.5            3              5
# 10 200200835792 133301ATB          1              3              5
# # ... with more rows
# 
# $NHID_JK0213.bind_rows
# # Source:   table<NHID_JK0213.bind_rows> [?? x 14]
# # Database: sqlite 3.22.0 [E:\[[[[Rproject]]]]\Rproject_KNHIS\KNHIS.02ID.2089.sqlite]
#    PERSON_ID STND_Y   SEX AGE_GROUP DTH_YM DTH_CODE1 DTH_CODE2  SIDO   SGG IPSN_TYPE_CD CTRB_PT_TYPE_CD DFAB_GRD_CD DFAB_PTN_CD DFAB_REG_YM
#        <dbl>  <dbl> <dbl>     <dbl> <chr>  <chr>     <chr>     <dbl> <dbl>        <dbl>           <dbl>       <dbl>       <dbl> <chr>      
#  1  94058955   2002     2        18 NA     NA        NA           44 44130            8               0           0           0 NA         
#  2  94058955   2003     2        18 200305 R54       NA           44 44130            8               0           0           0 NA         
#  3  30945258   2002     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
#  4  30945258   2003     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
#  5  30945258   2004     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
#  6  30945258   2005     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
#  7  30945258   2006     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
#  8  30945258   2007     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
#  9  30945258   2008     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
# 10  30945258   2009     2        18 NA     NA        NA           46 46790            1               1           0           0 NA         
# # ... with more rows









#@ end ----
save(KNHIS.02ID.2089.sqlite.tbl, file = "KNHIS.02ID.2089.sqlite.tbl.rda")

