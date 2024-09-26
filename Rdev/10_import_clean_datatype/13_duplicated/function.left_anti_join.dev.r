# function.left_anti_join.dev.r





# @ tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list ====  
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list = list()
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$full_join = 
    tblGADM_kor_level2.join_level1.SIDO_SGG %>% 
    mutate(SIDO_NM = SIDO_full, SGG_NM = SGG) %>% arrange(SIDO_NM, SGG_NM) |> rownames_to_column() %>% 
    full_join(tblSIDO_SGG_CD %>% arrange(SIDO_NM, SGG_NM) %>% rownames_to_column("rownum_tblSIDO_SGG_CD"))
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$inner_join = 
    tblGADM_kor_level2.join_level1.SIDO_SGG %>% 
    mutate(SIDO_NM = SIDO_full, SGG_NM = SGG) %>% arrange(SIDO_NM, SGG_NM) |> rownames_to_column() %>% 
    inner_join(tblSIDO_SGG_CD %>% arrange(SIDO_NM, SGG_NM) %>% rownames_to_column("rownum_tblSIDO_SGG_CD"))
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$left_anti_join = 
    tblGADM_kor_level2.join_level1.SIDO_SGG %>% 
    mutate(SIDO_NM = SIDO_full, SGG_NM = SGG) %>% arrange(SIDO_NM, SGG_NM) |> rownames_to_column() %>% 
    anti_join(tblSIDO_SGG_CD %>% arrange(SIDO_NM, SGG_NM) %>% rownames_to_column("rownum_tblSIDO_SGG_CD"))
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$right_anti_join = 
    tblGADM_kor_level2.join_level1.SIDO_SGG %>% 
    mutate(SIDO_NM = SIDO_full, SGG_NM = SGG) %>% arrange(SIDO_NM, SGG_NM) |> rownames_to_column() %>% 
    {anti_join(tblSIDO_SGG_CD %>% arrange(SIDO_NM, SGG_NM) %>% rownames_to_column("rownum_tblSIDO_SGG_CD"), .)}


tblGADM_kor_level2.join_level1 %>% nrow #----
tblGADM_kor_level2.join_level1.SIDO_SGG %>% nrow #----
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$full_join %>% nrow #----
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$inner_join %>% nrow #----
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$left_anti_join %>% nrow #----
tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$right_anti_join %>% nrow #----
# > tblGADM_kor_level2.join_level1 %>% nrow #----  
# [1] 229
# > tblGADM_kor_level2.join_level1.SIDO_SGG %>% nrow #----  
# [1] 229
# > tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$full_join %>% nrow #----  
# [1] 274
# > tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$inner_join %>% nrow #----  
# [1] 210
# > tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$left_anti_join %>% nrow #----  
# [1] 19
# > tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list$right_anti_join %>% nrow #----  
# [1] 45


getwd()
.path4write = env1$path$.path4write
objectname = "tblGADM_kor_level2.join_level1.SIDO_SGG_CD.mismatch_list"
# write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")), compress="gz", compression=9 )
openxlsx2::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE)
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))

# ?read_excel

library(readxl)
assign(objectname, read_excel(paste0(objectname, " -manual.xlsx"), sheet = "manual"))
str(get(objectname), max.level = 1) #----
# > str(get(objectname), max.level = 1) #----  
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	229 obs. of  37 variables:
#  $ OBJECTID_level2: num  1 2 3 4 5 6 7 8 9 10 ...
#  $ ID_0           : num  213 213 213 213 213 213 213 213 213 213 ...
#  $ ISO            : chr  "KOR" "KOR" "KOR" "KOR" ...
#  $ NAME_0         : chr  "South Korea" "South Korea" "South Korea" "South Korea" ...
#  $ ID_1           : num  1 1 1 1 1 1 1 1 1 1 ...
#  $ NAME_1         : chr  "Busan" "Busan" "Busan" "Busan" ...
#  $ ID_2           : num  1 2 3 4 5 6 7 8 9 10 ...
#  $ NAME_2         : chr  "Buk" "Busanjin" "Dong" "Dongnae" ...
#  $ HASC_2         : logi  NA NA NA NA NA NA ...
#  $ CCN_2          : logi  NA NA NA NA NA NA ...
#  $ CCA_2          : logi  NA NA NA NA NA NA ...
#  $ TYPE_2         : chr  "Gu" "Gu" "Gu" "Gu" ...
#  $ ENGTYPE_2      : chr  "District" "District" "District" "District" ...
#  $ NL_NAME_2      : chr  "북구| 北區" "부산진구| 釜山鎭區" "동구| 東區" "동래구| 東萊區" ...
#  $ VARNAME_2      : chr  NA NA NA NA ...
#  $ OBJECTID_level1: num  1 1 1 1 1 1 1 1 1 1 ...
#  $ HASC_1         : chr  "KR.PU" "KR.PU" "KR.PU" "KR.PU" ...
#  $ CCN_1          : logi  NA NA NA NA NA NA ...
#  $ CCA_1          : logi  NA NA NA NA NA NA ...
#  $ TYPE_1         : chr  "Gwangyeoksi" "Gwangyeoksi" "Gwangyeoksi" "Gwangyeoksi" ...
#  $ ENGTYPE_1      : chr  "Metropolitan City" "Metropolitan City" "Metropolitan City" "Metropolitan City" ...
#  $ NL_NAME_1      : chr  "부산광역시 | 釜山廣域市" "부산광역시 | 釜山廣域市" "부산광역시 | 釜山廣域市" "부산광역시 | 釜山廣域市" ...
#  $ VARNAME_1      : chr  "Pusan|Busan Gwang'yeogsi|Pusan-gwangyoksi|Fusan" "Pusan|Busan Gwang'yeogsi|Pusan-gwangyoksi|Fusan" "Pusan|Busan Gwang'yeogsi|Pusan-gwangyoksi|Fusan" "Pusan|Busan Gwang'yeogsi|Pusan-gwangyoksi|Fusan" ...
#  $ NL_NAME_1Korean: chr  "부산광역시" "부산광역시" "부산광역시" "부산광역시" ...
#  $ SIDO_full      : chr  "부산광역시" "부산광역시" "부산광역시" "부산광역시" ...
#  $ SIDO_simple    : chr  "부산" "부산" "부산" "부산" ...
#  $ NL_NAME_2Korean: chr  "북구" "부산진구" "동구" "동래구" ...
#  $ SGG            : chr  "북구" "부산진구" "동구" "동래구" ...
#  $ SIDO_NM        : chr  "부산광역시" "부산광역시" "부산광역시" "부산광역시" ...
#  $ SGG_NM         : chr  "북구" "부산진구" "동구" "동래구" ...
#  $ SIDO_CD        : chr  "21" "21" "21" "21" ...
#  $ SGG_CD         : chr  "21080" "21050" "21030" "21060" ...
#  $ SGG_Population : chr  "306974" "387378" "94565" "275971" ...
#  $ SGG_nEMD       : chr  "13" "23" "14" "13" ...
#  $ SIDO_Population: num  3519401 3519401 3519401 3519401 3519401 ...
#  $ SIDO_nSGG      : num  16 16 16 16 16 16 16 16 16 16 ...
#  $ SIDO_nEMD      : num  210 210 210 210 210 210 210 210 210 210 ...










# @ end -----  
