
dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
dput(l10n_info()) #----
dput(.Platform) #----
dput(Sys.info()) #----
# > dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
# c("LC_COLLATE=Korean_Korea.949", "LC_CTYPE=Korean_Korea.949", 
# "LC_MONETARY=Korean_Korea.949", "LC_NUMERIC=C", "LC_TIME=Korean_Korea.949"
# )
# > dput(l10n_info()) #----
# list(MBCS = TRUE, `UTF-8` = FALSE, `Latin-1` = FALSE, codepage = 949L)
# > dput(.Platform) #----
# list(OS.type = "windows", file.sep = "/", dynlib.ext = ".dll", 
#     GUI = "RStudio", endian = "little", pkgType = "win.binary", 
#     path.sep = ";", r_arch = "x64")
# > dput(Sys.info()) #----
# c(sysname = "Windows", release = ">= 8 x64", version = "build 9200", 
# nodename = "ID92", machine = "x86-64", login = "MH", user = "MH", 
# effective_user = "MH")




korpopmap1 %>% str(max.level = 1) #----
korpopmap1 %>% str(max.level = 2) #----
korpopmap1@data %>% str #----
# > korpopmap1 %>% str(max.level = 1) #----
# Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
# > korpopmap1 %>% str(max.level = 2) #----
# Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#   ..@ data       :'data.frame':	16 obs. of  42 variables:
#   ..@ polygons   :List of 16
#   ..@ plotOrder  : int [1:16] 14 9 13 15 8 11 12 10 16 4 ...
#   ..@ bbox       : num [1:2, 1:2] 124.6 33.2 130.9 38.6
#   .. ..- attr(*, "dimnames")=List of 2
#   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
# > korpopmap1@data %>% str #----
# 'data.frame':	16 obs. of  42 variables:
# Error in nchar(x, type = "w", allowNA = TRUE) : 
#   invalid multibyte string, element 18


korpopmap1@data %>% colnames
korpopmap1@data %>% colnames %>% dput
# > korpopmap1@data %>% colnames %>% dput
# c("SP_ID", "FID", "code", "code1", "long", "lat", "order", "hole", 
# "piece", "group", "id", "FID.data", "code.data", "code.1", "name", 
# "name_eng", "base_year", "C\xed뻾\xec젙援ъ뿭蹂\x84_\xec쓭硫대룞", 
# "\xed뻾\xec젙援ъ뿭蹂\x84_\xec쓭硫대룞", "\xec떆\xec젏", "珥앹씤援\xac_紐\x85", 
# "\xeb궓\xec옄_紐\x85", "\xec뿬\xec옄_紐\x85", "\xeb궡援\xad\xec씤_怨\x84_紐\x85", 
# "\xeb궡援\xad\xec씤_\xeb궓\xec옄_紐\x85", "\xeb궡援\xad\xec씤_\xec뿬\xec옄_紐\x85", 
# "\xec쇅援\xad\xec씤_怨\x84_紐\x85", "\xec쇅援\xad\xec씤_\xeb궓\xec옄_紐\x85", 
# "\xec쇅援\xad\xec씤_\xec뿬\xec옄_紐\x85", "媛\u0080援\xac_怨\x84_媛\u0080援\xac", 
# "\xec씪諛섍\xb0\u0080援\xac_媛\u0080援\xac", "吏묐떒媛\u0080援\xac_媛\u0080援\xac", 
# "\xec쇅援\xad\xec씤媛\u0080援\xac_媛\u0080援\xac", "二쇳깮_怨\x84_\xed샇", 
# "\xeb떒\xeb룆二쇳깮_\xed샇", "\xec븘\xed뙆\xed듃_\xed샇", "\xec뿰由쎌＜\xed깮_\xed샇", 
# "\xeb떎\xec꽭\xeb\x8c\u0080二쇳깮_\xed샇", "鍮꾧굅二쇱슜_嫄대Ъ\xeb궡_二쇳깮_\xed샇", 
# "二쇳깮\xec씠\xec쇅\xec쓽_嫄곗쿂_\xed샇", "region", "code1.data"
# )










Sys.setlocale("LC_COLLATE", "ko_KR.UTF-8") #----
# > Sys.setlocale("LC_COLLATE", "ko_KR.UTF-8") #----
# [1] ""
# Warning message:
# In Sys.setlocale("LC_COLLATE", "ko_KR.UTF-8") :
#   OS reports request to set locale to "ko_KR.UTF-8" cannot be honored

Sys.setlocale("LC_CTYPE", "ko_KR.UTF-8"); #----
# > Sys.setlocale("LC_CTYPE", "ko_KR.UTF-8"); #----
# [1] ""
# Warning message:
# In Sys.setlocale("LC_CTYPE", "ko_KR.UTF-8") :
#   OS reports request to set locale to "ko_KR.UTF-8" cannot be honored

# # https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_files/read.csv(Population-UTF-8.CSV).r
# # https://hashcode.co.kr/questions/3654/r%EC%97%90%EC%84%9C-%ED%95%9C%EA%B8%80-%EC%9D%B8%EC%BD%94%EB%94%A9-%EC%98%A4%EB%A5%98
Sys.setlocale("LC_ALL", "korean") #----
# > Sys.setlocale("LC_ALL", "korean") #----
# [1] "LC_COLLATE=Korean_Korea.949;LC_CTYPE=Korean_Korea.949;LC_MONETARY=Korean_Korea.949;LC_NUMERIC=C;LC_TIME=Korean_Korea.949"


# korpopmap1 %>% str(max.level = 1) #----
korpopmap1 %>% str(max.level = 2) #----
korpopmap1@data %>% str #----
# > korpopmap1 %>% str(max.level = 2) #----
# Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#   ..@ data       :'data.frame':	16 obs. of  42 variables:
#   ..@ polygons   :List of 16
#   ..@ plotOrder  : int [1:16] 14 9 13 15 8 11 12 10 16 4 ...
#   ..@ bbox       : num [1:2, 1:2] 124.6 33.2 130.9 38.6
#   .. ..- attr(*, "dimnames")=List of 2
#   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
# > korpopmap1@data %>% str #----
# 'data.frame':	16 obs. of  42 variables:
# Error in nchar(x, type = "w", allowNA = TRUE) : 
#   invalid multibyte string, element 18







#@ Encoding(names(korpopmap1.UTF8@data)) = "UTF-8" =====
korpopmap1.UTF8 = korpopmap1
Encoding(names(korpopmap1.UTF8@data)) = "UTF-8"
korpopmap1.UTF8@data = korpopmap1.UTF8@data %>% map_df(function(vec) {if(is.character(vec)) Encoding(vec) = "UTF-8"; vec})
saveRDS(korpopmap1.UTF8, "korpopmap1.UTF8.rds")









# http://blog.naver.com/PostView.nhn?blogId=n2ll_&logNo=221427614530&categoryNo=7&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=search
library(tidyverse)
korpopmap1@data %>% names %>% iconv(from = "EUC-KR", to = "UTF-8") %>% dput
korpopmap1@data %>% names %>% iconv(from = "UTF-8", to = "CP949") %>% dput
korpopmap1@data %>% names %>% iconv(from = "UTF-8", to = "EUC-KR") %>% dput
# > korpopmap1@data %>% names %>% iconv(from = "EUC-KR", to = "UTF-8") %>% dput
# c("SP_ID", "FID", "code", "code1", "long", "lat", "order", "hole", 
# "piece", "group", "id", "FID.data", "code.data", "code.1", "name", 
# "name_eng", "base_year", NA, NA, NA, NA, NA, NA, NA, NA, NA, 
# NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "region", 
# "code1.data")
# > korpopmap1@data %>% names %>% iconv(from = "UTF-8", to = "CP949") %>% dput
# c("SP_ID", "FID", "code", "code1", "long", "lat", "order", "hole", 
# "piece", "group", "id", "FID.data", "code.data", "code.1", "name", 
# "name_eng", "base_year", "C행정구역별_읍면동", "행정구역별_읍면동", 
# "시점", "총인구_명", "남자_명", "여자_명", "내국인_계_명", "내국인_남자_명", 
# "내국인_여자_명", "외국인_계_명", "외국인_남자_명", "외국인_여자_명", 
# "가구_계_가구", "일반가구_가구", "집단가구_가구", "외국인가구_가구", 
# "주택_계_호", "단독주택_호", "아파트_호", "연립주택_호", "다세대주택_호", 
# "비거주용_건물내_주택_호", "주택이외의_거처_호", "region", "code1.data"
# )
# > korpopmap1@data %>% names %>% iconv(from = "UTF-8", to = "EUC-KR") %>% dput
# c("SP_ID", "FID", "code", "code1", "long", "lat", "order", "hole", 
# "piece", "group", "id", "FID.data", "code.data", "code.1", "name", 
# "name_eng", "base_year", "C행정구역별_읍면동", "행정구역별_읍면동", 
# "시점", "총인구_명", "남자_명", "여자_명", "내국인_계_명", "내국인_남자_명", 
# "내국인_여자_명", "외국인_계_명", "외국인_남자_명", "외국인_여자_명", 
# "가구_계_가구", "일반가구_가구", "집단가구_가구", "외국인가구_가구", 
# "주택_계_호", "단독주택_호", "아파트_호", "연립주택_호", "다세대주택_호", 
# "비거주용_건물내_주택_호", "주택이외의_거처_호", "region", "code1.data"
# )






#@ names(korpopmap1.CP949@data) = names(korpopmap1.CP949@data) %>% iconv(from = "UTF-8", to = "CP949") ====
korpopmap1.CP949 = korpopmap1
korpopmap1.CP949@data = korpopmap1.CP949@data %>% map_df(iconv, from = "UTF-8", to = "CP949")
names(korpopmap1.CP949@data) = names(korpopmap1.CP949@data) %>% iconv(from = "UTF-8", to = "CP949")

korpopmap1.CP949@data %>% str #----
# > korpopmap1.CP949@data %>% str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	16 obs. of  42 variables:
#  $ SP_ID                  : chr  "15" "14" "13" "12" ...
#  $ FID                    : chr  "15" "14" "13" "12" ...
#  $ code                   : chr  "11" "21" "22" "23" ...
#  $ code1                  : chr  "11" "21" "22" "23" ...
#  $ long                   : chr  "201656.260138225" "400871.465925807" "352753.771468898" "173977.363098145" ...
#  $ lat                    : chr  "466516.880345624" "211233.087122413" "280873.672326075" "456201.267883301" ...
#  $ order                  : chr  "1" "1" "1" "1" ...
#  $ hole                   : chr  "FALSE" "FALSE" "FALSE" "FALSE" ...
#  $ piece                  : chr  "1" "1" "1" "1" ...
#  $ group                  : chr  "15.1" "14.1" "13.1" "12.1" ...
#  $ id                     : chr  "15" "14" "13" "12" ...
#  $ FID.data               : chr  "15" "14" "13" "12" ...
#  $ code.data              : chr  "11" "21" "22" "23" ...
#  $ code.1                 : chr  "11" "21" "22" "23" ...
#  $ name                   : chr  "서울특별시" "부산광역시" "대구광역시" "인천광역시" ...
#  $ name_eng               : chr  "Seoul" "Busan" "Daegu" "Incheon" ...
#  $ base_year              : chr  "2010" "2010" "2010" "2010" ...
#  $ C행정구역별_읍면동     : chr  "11" "21" "22" "23" ...
#  $ 행정구역별_읍면동      : chr  "서울특별시" "부산광역시" "대구광역시" "인천광역시" ...
#  $ 시점                   : chr  "2010" "2010" "2010" "2010" ...
#  $ 총인구_명              : chr  "9794304" "3414950" "2446418" "2662509" ...
#  $ 남자_명                : chr  "4803373" "1676689" "1212584" "1334576" ...
#  $ 여자_명                : chr  "4990931" "1738261" "1233834" "1327933" ...
#  $ 내국인_계_명           : chr  "9631482" "3393191" "2431774" "2632035" ...
#  $ 내국인_남자_명         : chr  "4726028" "1664678" "1204428" "1315562" ...
#  $ 내국인_여자_명         : chr  "4905454" "1728513" "1227346" "1316473" ...
#  $ 외국인_계_명           : chr  "162822" "21759" "14644" "30474" ...
#  $ 외국인_남자_명         : chr  "77345" "12011" "8156" "19014" ...
#  $ 외국인_여자_명         : chr  "85477" "9748" "6488" "11460" ...
#  $ 가구_계_가구           : chr  "3577497" "1251756" "873934" "929489" ...
#  $ 일반가구_가구          : chr  "3504297" "1243880" "868327" "918850" ...
#  $ 집단가구_가구          : chr  "2836" "785" "553" "972" ...
#  $ 외국인가구_가구        : chr  "70364" "7091" "5054" "9667" ...
#  $ 주택_계_호             : chr  "2525210" "1031331" "691702" "822552" ...
#  $ 단독주택_호            : chr  "405575" "244570" "166307" "108315" ...
#  $ 아파트_호              : chr  "1485869" "640944" "464960" "483847" ...
#  $ 연립주택_호            : chr  "145914" "36013" "5084" "24923" ...
#  $ 다세대주택_호          : chr  "463417" "97308" "47099" "197957" ...
#  $ 비거주용_건물내_주택_호: chr  "24435" "12496" "8252" "7510" ...
#  $ 주택이외의_거처_호     : chr  "97389" "22763" "2555" "21076" ...
#  $ region                 : chr  "11" "21" "22" "23" ...
#  $ code1.data             : chr  "11" "21" "22" "23" ...




Encoding(names(korpopmap1@data)) %>% dput
Encoding(names(korpopmap1.UTF8@data)) %>% dput
Encoding(names(korpopmap1.CP949@data)) %>% dput
# > Encoding(names(korpopmap1@data)) %>% dput
# c("unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown"
# )
# > Encoding(names(korpopmap1.UTF8@data)) %>% dput
# c("unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "UTF-8", 
# "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", 
# "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", 
# "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", "UTF-8", 
# "UTF-8", "unknown", "unknown")
# > Encoding(names(korpopmap1.CP949@data)) %>% dput
# c("unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", 
# "unknown", "unknown", "unknown", "unknown", "unknown", "unknown"
# )









# http://rpubs.com/cardiomoon/222145


packagename = "devtools"
if(!require(packagename, character.only = T)) {install.packages(packagename); require(packagename, character.only = T)}
packagename = "kormaps2014"
if(!require(packagename, character.only = T)) {devtools::install_github("cardiomoon/kormaps2014"); require(packagename, character.only = T)}



kormaps2014_kormap1 = kormap1 %>% rename(name.UTF8 = name, name.CP949 = name1)
kormaps2014_kormap2 = kormap2 %>% rename(name.UTF8 = name, name.CP949 = name1)
kormaps2014_kormap3 = kormap3 %>% rename(name.UTF8 = name, name.CP949 = name1)

saveRDS(kormaps2014_kormap1, "kormaps2014_kormap1.rds")
saveRDS(kormaps2014_kormap2, "kormaps2014_kormap2.rds")
saveRDS(kormaps2014_kormap3, "kormaps2014_kormap3.rds")


kormaps2014_kormap1 %>% str #----
kormaps2014_kormap2 %>% str #----
kormaps2014_kormap3 %>% str #----
# > kormaps2014_kormap1 %>% str #----
# 'data.frame':	8831 obs. of  15 variables:
#  $ id        : chr  "0" "0" "0" "0" ...
#  $ long      : num  138 138 138 138 138 ...
#  $ lat       : num  50.7 50.7 50.7 50.7 50.7 ...
#  $ order     : int  1 2 3 4 5 6 7 8 9 10 ...
#  $ hole      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ piece     : Factor w/ 113 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ group     : Factor w/ 205 levels "0.1","1.1","1.2",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ SP_ID     : Factor w/ 17 levels "0","1","10","11",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ SIDO_CD   : Factor w/ 17 levels "11","21","22",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ SIDO_NM   : Factor w/ 17 levels "강원도","경기도",..: 9 9 9 9 9 9 9 9 9 9 ...
#  $ BASE_YEAR : Factor w/ 1 level "2014": 1 1 1 1 1 1 1 1 1 1 ...
#  $ name.UTF8 : Factor w/ 17 levels "媛뺤썝\xeb룄",..: 9 9 9 9 9 9 9 9 9 9 ...
#  $ name.CP949: Factor w/ 17 levels "강원도","경기도",..: 9 9 9 9 9 9 9 9 9 9 ...
#  $ region    : Factor w/ 17 levels "11","21","22",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ code      : Factor w/ 17 levels "11","21","22",..: 1 1 1 1 1 1 1 1 1 1 ...
# > kormaps2014_kormap2 %>% str #----
# 'data.frame':	20397 obs. of  15 variables:
#  $ id        : chr  "0" "0" "0" "0" ...
#  $ long      : num  138 138 138 138 138 ...
#  $ lat       : num  50.6 50.6 50.6 50.6 50.6 ...
#  $ order     : int  1 2 3 4 5 6 7 8 9 10 ...
#  $ hole      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ piece     : Factor w/ 39 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ group     : Factor w/ 414 levels "0.1","1.1","2.1",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ SP_ID     : Factor w/ 252 levels "0","1","10","100",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ base_year : Factor w/ 1 level "2014": 1 1 1 1 1 1 1 1 1 1 ...
#  $ sigungu_cd: Factor w/ 252 levels "11010","11020",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ sigungu_nm: Factor w/ 229 levels "가평군","강남구",..: 182 182 182 182 182 182 182 182 182 182 ...
#  $ name.UTF8 : Factor w/ 229 levels "媛\u0080\xed룊援\xb0",..: 180 180 180 180 180 180 180 180 180 180 ...
#  $ name.CP949: Factor w/ 229 levels "가평군","강남구",..: 182 182 182 182 182 182 182 182 182 182 ...
#  $ region    : Factor w/ 252 levels "11010","11020",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ code      : Factor w/ 252 levels "11010","11020",..: 1 1 1 1 1 1 1 1 1 1 ...
# > kormaps2014_kormap3 %>% str #----
# 'data.frame':	73474 obs. of  15 variables:
#  $ id        : chr  "0" "0" "0" "0" ...
#  $ long      : num  138 138 138 138 138 ...
#  $ lat       : num  50.6 50.6 50.6 50.6 50.6 ...
#  $ order     : int  1 2 3 4 5 6 7 8 9 1 ...
#  $ hole      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ piece     : Factor w/ 10 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ group     : Factor w/ 3621 levels "0.1","1.1","2.1",..: 1 1 1 1 1 1 1 1 1 2 ...
#  $ SP_ID     : Factor w/ 3488 levels "0","1","10","100",..: 1 1 1 1 1 1 1 1 1 2 ...
#  $ base_year : Factor w/ 1 level "2014": 1 1 1 1 1 1 1 1 1 1 ...
#  $ adm_dr_cd : Factor w/ 3488 levels "1101053","1101054",..: 1 1 1 1 1 1 1 1 1 2 ...
#  $ adm_dr_nm : Factor w/ 3128 levels "첨단1동","첨단2동",..: 1259 1259 1259 1259 1259 1259 1259 1259 1259 1320 ...
#  $ name.UTF8 : Factor w/ 3128 levels "媛\u0080寃쎈룞",..: 1266 1266 1266 1266 1266 1266 1266 1266 1266 1338 ...
#  $ name.CP949: Factor w/ 3128 levels "첨단1동","첨단2동",..: 1259 1259 1259 1259 1259 1259 1259 1259 1259 1320 ...
#  $ region    : Factor w/ 3488 levels "1101053","1101054",..: 1 1 1 1 1 1 1 1 1 2 ...
#  $ code      : Factor w/ 3488 levels "1101053","1101054",..: 1 1 1 1 1 1 1 1 1 2 ...







saveRDS(korpop1, "kormaps2014_korpop1.UTF8.rds")
saveRDS(korpop2, "kormaps2014_korpop2.UTF8.rds")
saveRDS(korpop3, "kormaps2014_korpop3.UTF8.rds")



kormaps2014_korpop1.CP949 = korpop1
names(kormaps2014_korpop1.CP949) = names(kormaps2014_korpop1.CP949) %>% iconv(from = "UTF-8", to = "CP949")
kormaps2014_korpop1.CP949 = kormaps2014_korpop1.CP949 %>% map_df(function(vec) {if(is.factor(vec)) vec = as.character(vec); if(is.character(vec)) vec = vec %>% iconv(from = "UTF-8", to = "CP949"); vec})
saveRDS(kormaps2014_korpop1.CP949, "kormaps2014_korpop1.CP949.rds")

kormaps2014_korpop2.CP949 = korpop2
names(kormaps2014_korpop2.CP949) = names(kormaps2014_korpop2.CP949) %>% iconv(from = "UTF-8", to = "CP949")
kormaps2014_korpop2.CP949 = kormaps2014_korpop2.CP949 %>% map_df(function(vec) {if(is.factor(vec)) vec = as.character(vec); if(is.character(vec)) vec = vec %>% iconv(from = "UTF-8", to = "CP949"); vec})
saveRDS(kormaps2014_korpop2.CP949, "kormaps2014_korpop2.CP949.rds")

kormaps2014_korpop3.CP949 = korpop3
names(kormaps2014_korpop3.CP949) = names(kormaps2014_korpop3.CP949) %>% iconv(from = "UTF-8", to = "CP949")
kormaps2014_korpop3.CP949 = kormaps2014_korpop3.CP949 %>% map_df(function(vec) {if(is.factor(vec)) vec = as.character(vec); if(is.character(vec)) vec = vec %>% iconv(from = "UTF-8", to = "CP949"); vec})
saveRDS(kormaps2014_korpop3.CP949, "kormaps2014_korpop3.CP949.rds")

kormaps2014_korpop3.CP949 %>% str #----
# > kormaps2014_korpop3.CP949 %>% str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	3492 obs. of  25 variables:
#  $ C행정구역별_읍면동     : chr  "'1101053" "'1101054" "'1101055" "'1101056" ...
#  $ 행정구역별_읍면동      : chr  "  사직동" "  삼청동" "  부암동" "  평창동" ...
#  $ 시점                   : int  2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 ...
#  $ 총인구_명              : int  9379 2808 11012 18594 8106 4620 4917 7598 5792 9519 ...
#  $ 남자_명                : int  4325 1340 5327 8794 3829 2234 2417 4130 3128 4505 ...
#  $ 여자_명                : int  5054 1468 5685 9800 4277 2386 2500 3468 2664 5014 ...
#  $ 내국인_계_명           : int  8571 2601 10157 17789 7981 4441 4616 6679 5169 8618 ...
#  $ 내국인_남자_명         : int  3934 1222 4921 8393 3785 2133 2267 3699 2837 4022 ...
#  $ 내국인_여자_명         : int  4637 1379 5236 9396 4196 2308 2349 2980 2332 4596 ...
#  $ 외국인_계_명           : chr  "808" "207" "855" "805" ...
#  $ 외국인_남자_명         : chr  "391" "118" "406" "401" ...
#  $ 외국인_여자_명         : chr  "417" "89" "449" "404" ...
#  $ 가구_계_가구           : int  3897 1168 4096 6645 2871 1947 1964 4122 2683 4383 ...
#  $ 일반가구_가구          : int  3562 1092 3841 6310 2823 1888 1843 3733 2376 3981 ...
#  $ 집단가구_가구          : chr  "7" "X" "6" "16" ...
#  $ 외국인가구_가구        : chr  "328" "75" "249" "319" ...
#  $ 주택_계_호             : int  2771 799 2957 5754 2870 1527 1646 1613 1116 2725 ...
#  $ 단독주택_호            : chr  "729" "714" "1092" "1533" ...
#  $ 아파트_호              : chr  "1532" "X" "121" "936" ...
#  $ 연립주택_호            : chr  "78" "19" "902" "2180" ...
#  $ 다세대주택_호          : chr  "386" "41" "806" "1044" ...
#  $ 비거주용_건물내_주택_호: chr  "46" "25" "36" "61" ...
#  $ 주택이외의_거처_호     : chr  "633" "35" "197" "130" ...
#  $ C행정구역별            : chr  "1101053" "1101054" "1101055" "1101056" ...
#  $ code                   : chr  "1101053" "1101054" "1101055" "1101056" ...

