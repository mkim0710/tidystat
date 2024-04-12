# function.list.files.read.sqlite.dev.r

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
# KEY_SEQ.02ID.2089 %>% as_tibble
# # > KEY_SEQ.02ID.2089 =
# # +     NHID_GY20_0213.bind_rows.12478.ICDclean %>%
# # +         right_join(
# # +             NHID_JK0213.bind_rows %>% filter(STND_Y == 2002) %>% filter(AGE_GROUP %in% 5:18) %>% select(PERSON_ID)
# # +         ) %>% select(KEY_SEQ) %>% distinct
# # Joining, by = "PERSON_ID"
# # Warning message:
# # Column `PERSON_ID` joining factors with different levels, coercing to character vector 
# # > KEY_SEQ.02ID.2089 %>% as_tibble
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




























