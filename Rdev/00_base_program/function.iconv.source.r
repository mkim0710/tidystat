
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

