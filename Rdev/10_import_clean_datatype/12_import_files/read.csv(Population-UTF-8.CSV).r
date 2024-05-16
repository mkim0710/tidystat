# read.csv(Population-UTF-8.CSV).r


dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
dput(l10n_info()) #----
dput(.Platform) #----
dput(Sys.info()) #----
# > dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
# c("LC_COLLATE=English_United States.1252", "LC_CTYPE=English_United States.1252", 
# "LC_MONETARY=English_United States.1252", "LC_NUMERIC=C", "LC_TIME=English_United States.1252"
# )
# > dput(l10n_info()) #----
# list(MBCS = FALSE, `UTF-8` = FALSE, `Latin-1` = TRUE, codepage = 1252L)
# > dput(.Platform) #----
# list(OS.type = "windows", file.sep = "/", dynlib.ext = ".dll", 
#     GUI = "RStudio", endian = "little", pkgType = "win.binary", 
#     path.sep = ";", r_arch = "x64")
# > dput(Sys.info()) #----
# c(sysname = "Windows", release = ">= 8 x64", version = "build 9200", 
# nodename = "NUC6I7KYK", machine = "x86-64", login = "mkim0", 
# user = "mkim0", effective_user = "mkim0")



# https://m.blog.naver.com/carrotcarrot/220662217154
# http://r-bong.blogspot.com/2016/03/rstudio_26.html
# http://rfriend.tistory.com/10
# https://sigmafelix.wordpress.com/2017/01/31/r%EA%B3%BC-%EC%9D%B8%EC%BD%94%EB%94%A9-%EC%A7%A7%EC%9D%80-%EC%86%8C%EA%B0%9C/
# https://statkclee.github.io/ds-authoring/regex-encoding.html
# Population <- read.csv("Population.csv", header = TRUE, encoding="CP949")
# Population <- read.csv("Population.csv", header = TRUE, encoding="UTF-16")
# Population <- read.csv("Population.csv", header = TRUE, fileEncoding = "UTF-16")
# Population <- read.csv("Population.csv", header = TRUE, encoding="UTF-8")
# Population <- read.csv("Population.csv", header = TRUE, encoding="EUC")

readr::guess_encoding("Population.csv") #----
# > readr::guess_encoding("Population.csv") #----
# # A tibble: 2 x 2
#   encoding confidence
#   <chr>         <dbl>
# 1 EUC-KR         1   
# 2 GB18030        0.64

Population <- read.csv("Population.csv", header = TRUE) #----
Population |> str()
# > Population |> str()
# 'data.frame':	163 obs. of  3 variables:
#  $ Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name: Factor w/ 162 levels "´ã¾ç±º","´çÁø½Ã",..: 67 160 3 133 34 4 24 70 72 73 ...
#  $ Pop : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...

Population <- read.csv("Population.csv", header = TRUE, encoding="EUC-KR") #----
Population |> str()
# > Population <- read.csv("Population.csv", header = TRUE, encoding="EUC-KR") #----
# > Population |> str()
# 'data.frame':	163 obs. of  3 variables:
#  $ Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name: Factor w/ 162 levels "´ã¾ç±º","´çÁø½Ã",..: 67 160 3 133 34 4 24 70 72 73 ...
#  $ Pop : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...



Population <- read.csv("Population-UTF-8.CSV", header = TRUE) #----
Population |> str()
# > Population <- read.csv("Population-UTF-8.CSV", header = TRUE) #----
# > Population |> str()
# 'data.frame':	163 obs. of  3 variables:
#  $ ï..Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name   : Factor w/ 162 levels "ê´´ì‚°êµ°","ê´‘ëª…ì‹œ",..: 96 31 56 124 4 57 149 90 71 91 ...
#  $ Pop    : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...

Population <- read.csv("Population-UTF-8.CSV", header = TRUE, encoding="UTF-8") #----
Population |> str()
# > Population <- read.csv("Population-UTF-8.CSV", header = TRUE, encoding="UTF-8") #----
# > Population |> str()
# 'data.frame':	163 obs. of  3 variables:
#  $ X.U.FEFF.Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name         : Factor w/ 162 levels "가평군","강릉시",..: 64 54 41 115 19 42 104 68 70 66 ...
#  $ Pop          : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...


Population <- read.csv("Population-UTF-8.CSV", header = TRUE, encoding="UTF-8") %>% {set_names(., gsub("^X\\.U\\.FEFF\\.", "", names(.)))} #----
Population |> str()
# > Population <- read.csv("Population-UTF-8.CSV", header = TRUE, encoding="UTF-8") %>% {set_names(., gsub("^X\\.U\\.FEFF\\.", "", names(.)))} #----
# > Population |> str()
# 'data.frame':	163 obs. of  3 variables:
#  $ Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name: Factor w/ 162 levels "가평군","강릉시",..: 64 54 41 115 19 42 104 68 70 66 ...
#  $ Pop : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...



#@ end -----





#@ ?read_csv =====
?read_csv
Population <- read_csv("Population-UTF-8.CSV", col_names = TRUE) #----
Population |> str()
# > Population <- read_csv("Population-UTF-8.CSV", col_names = TRUE) #----
# Parsed with column specification:
# cols(
#   Code = col_integer(),
#   Name = col_character(),
#   Pop = col_integer()
# )
# > Population |> str()
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	163 obs. of  3 variables:
#  $ Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name: chr  "<U+C11C><U+C6B8>" "<U+BD80><U+C0B0>" "<U+B300><U+AD6C>" "<U+C778><U+CC9C>" ...
#  $ Pop : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...
#  - attr(*, "spec")=List of 2
#   ..$ cols   :List of 3
#   .. ..$ Code: list()
#   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#   .. ..$ Name: list()
#   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
#   .. ..$ Pop : list()
#   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#   ..$ default: list()
#   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
#   ..- attr(*, "class")= chr "col_spec"


Population <- read_csv("Population-UTF-8.CSV", col_names = TRUE, locale = locale(encoding = "UTF-8")) #----
Population |> str()
# > Population <- read_csv("Population-UTF-8.CSV", col_names = TRUE, locale = locale(encoding = "UTF-8")) #----
# Parsed with column specification:
# cols(
#   Code = col_integer(),
#   Name = col_character(),
#   Pop = col_integer()
# )
# > Population |> str()
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	163 obs. of  3 variables:
#  $ Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name: chr  "<U+C11C><U+C6B8>" "<U+BD80><U+C0B0>" "<U+B300><U+AD6C>" "<U+C778><U+CC9C>" ...
#  $ Pop : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...
#  - attr(*, "spec")=List of 2
#   ..$ cols   :List of 3
#   .. ..$ Code: list()
#   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#   .. ..$ Name: list()
#   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
#   .. ..$ Pop : list()
#   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#   ..$ default: list()
#   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
#   ..- attr(*, "class")= chr "col_spec"


Population <- read_csv("Population-UTF-8.CSV", col_names = TRUE, locale = locale(encoding = "UTF-8", asciify = TRUE)) #----
Population |> str()
# > Population <- read_csv("Population-UTF-8.CSV", col_names = TRUE, locale = locale(encoding = "UTF-8", asciify = TRUE)) #----
# Parsed with column specification:
# cols(
#   Code = col_integer(),
#   Name = col_character(),
#   Pop = col_integer()
# )
# > Population |> str()
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	163 obs. of  3 variables:
#  $ Code: int  11010 21010 22010 23010 24010 25010 26010 29010 31011 31021 ...
#  $ Name: chr  "<U+C11C><U+C6B8>" "<U+BD80><U+C0B0>" "<U+B300><U+AD6C>" "<U+C778><U+CC9C>" ...
#  $ Pop : int  9992758 3613809 2459573 2770503 1401447 1467564 1082720 129322 1050602 937702 ...
#  - attr(*, "spec")=List of 2
#   ..$ cols   :List of 3
#   .. ..$ Code: list()
#   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#   .. ..$ Name: list()
#   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
#   .. ..$ Pop : list()
#   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#   ..$ default: list()
#   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
#   ..- attr(*, "class")= chr "col_spec"



#@ ----


Sys.setlocale("LC_COLLATE", "ko_KR.UTF-8") #----
# > Sys.setlocale("LC_COLLATE", "ko_KR.UTF-8") #----
# [1] ""
# Warning message:
# In Sys.setlocale("LC_COLLATE", "ko_KR.UTF-8") :
#   OS reports request to set locale to "ko_KR.UTF-8" cannot be honored


# https://hashcode.co.kr/questions/3654/r%EC%97%90%EC%84%9C-%ED%95%9C%EA%B8%80-%EC%9D%B8%EC%BD%94%EB%94%A9-%EC%98%A4%EB%A5%98
Sys.setlocale("LC_ALL", "korean") #----
# > Sys.setlocale("LC_ALL", "korean") #----
# [1] "LC_COLLATE=Korean_Korea.949;LC_CTYPE=Korean_Korea.949;LC_MONETARY=Korean_Korea.949;LC_NUMERIC=C;LC_TIME=Korean_Korea.949"




# https://github.com/tidyverse/readr/issues/834 ====
path4read = "BLS_추출파일/"
subpath = "기저질환/"
dir(paste0(path4read, subpath)) |> dput() #----
# > dir(paste0(path4read, subpath)) |> dput() #----
# c("1.COPD.xlsx", "2.Asthma.xlsx", "3.TB1.xlsx", "4.TB2.xlsx", 
# "5.ILD.xlsx", "6.Bronchiectasis.xlsx", "7.Pneumonia1.xlsx", "8.Pneumonia2.xlsx", 
# "9.Pneumonia3.xlsx")

path4read = "BLS_추출파일/"
subpath = "기저질환/"
list190220[[subpath]] = list()
for (ii in dir(paste0(path4read, subpath)) |> str_subset(".xls")) {
    # print(ii)
    tmp.xlsx <- tempfile(fileext = ".xlsx")
    file.copy(paste0(path4read, subpath, ii), tmp.xlsx)
    list190220[[subpath]][[ii]] = read_excel(tmp.xlsx)
}


#@ end ----
