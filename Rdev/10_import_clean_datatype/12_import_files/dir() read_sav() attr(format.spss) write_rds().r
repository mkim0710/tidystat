

#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  ----  
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
cat("> .tmp |> str(max.level = 1, give.attr = FALSE)", "  \n", sep="") 
.tmp |> str(max.level = 1, give.attr = FALSE)
cat("> env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)", "  \n", sep="") 
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ RUN ALL ABOVE: CTRL+ALT+B -----  
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ CODEBOOK ----  
# \$ .GlobalEnv$CODEBOOK = list() ====  
if(!exists("CODEBOOK", envir=.GlobalEnv)) { assign("CODEBOOK", list(), envir=.GlobalEnv) }  
.parentname = "CODEBOOK"
for (.sublistname in c("MetaData", "DataSetNames", "VarNames", "VarNames.select", "VarNames.filter", "VarNames.recode", "ModelList")) {
    if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) data read_csv() -----\
# F021_bySIDO <- read_csv("국민건강보험공단_특정기호 F021 난임진료의 시도별 연령별 진료인원 및 건수_20221231.UTF8BOM.csv")
# saveRDS(F021_bySIDO, "F021_bySIDO.rds")
# library(haven)
# NationalFamilyAndFertiltySurvey2021_230314 <- read_sav("(최종)2021년도 가족과 출산 조사 데이터_수정230314.sav")
.objectname = "NationalFamilyAndFertiltySurvey2021_230314"
# system.time(saveRDS( get(.objectname), paste0(.objectname,".rds") ))
# system.time(openxlsx::write.xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(.objectname, ".xlsx"))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) data -----
# \$ assign( DataSetName, read_rds(paste0(.path4read,"/",DataSetName,".rds")) ) ====
# .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
.subpath = r"()"|>str_replace_all("\\\\","/")
DataSetName = "NationalFamilyAndFertiltySurvey2021_230314"
# .subpath.filename.ext = DataSetName |> paste0(".rds") %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# .path.filename.ext = ifelse( file.exists(.subpath.filename.ext), .subpath.filename.ext, paste0(env1$path$source_base_github,"/data/",DataSetName,".rds") )
# cat(".path.filename.ext = ", .path.filename.ext, "  \n", sep = "")
# assign( DataSetName, read_rds(.path.filename.ext) )
DataSetName |> paste0(".rds") %>% paste0(.subpath,ifelse(.subpath=="","","/"),.) |> read_rds() %>% assign(DataSetName, value = ., envir = .GlobalEnv)
.variable.attributes = get(DataSetName) %>% map(function(vec) vec %>% attributes() %>% names()) %>% unlist %>% unname %>% unique %>% sort 
.variable.attributes %>% dput
.variable.attributes.format.values = get(DataSetName) %>% map(function(vec) attributes(vec)[names(attributes(vec)) %in% str_subset(.variable.attributes, "format")] ) %>% unlist %>% unname %>% unique %>% sort %>% dput
c("A255", "A257", "A259", "A260", "A261", "A262", "A263", "A264", 
"A265", "A267", "A268", "A274", "A275", "A284", "A303", "F1.0", 
"F3.0", "F4.0", "F8.0", "F8.2")

get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F1.0") %>% str
get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F3.0") %>% str
get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F4.0") %>% str
get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F8.0") %>% str
# > get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F1.0") %>% str
# tibble [14,538 × 19] (S3: tbl_df/tbl/data.frame)
#  $ a0101: num [1:14538] 1 1 1 1 1 2 2 1 1 2 ...
#   ..- attr(*, "label")= chr "1-1. 함께 살지 않는 부모님 존재 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a02  : num [1:14538] 2 2 2 3 2 NA NA 3 2 NA ...
#   ..- attr(*, "label")= chr "2. 비동거 부모와의 연락 빈도"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a03  : num [1:14538] 2 1 2 1 2 NA NA 2 1 NA ...
#   ..- attr(*, "label")= chr "3. 부모에게 정기적 현금, 현물 지원 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a04  : num [1:14538] 2 1 1 2 1 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "4. 부모에게 비정기적 현금, 현물 지원 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a05  : num [1:14538] 2 1 1 2 1 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "5. 부모에게 가사일, 병간호 등 도움 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a0501: num [1:14538] NA 1 2 NA 2 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5-1. 연간/월간"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a06  : num [1:14538] 1 2 2 2 2 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "6. 부모로부터 정기적인 현금, 현물 지원 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a07  : num [1:14538] 1 2 2 2 1 NA NA 1 2 NA ...
#   ..- attr(*, "label")= chr "7. 부모로부터 비정기적인 현금, 현물 지원 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a08  : num [1:14538] 2 2 2 2 2 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "8. 부모로부터 가사일, 병간호 등 도움받은 경험 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ a0801: num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 연간/월간"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c07  : num [1:14538] NA 3 2 NA 2 NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "7. 총 임신 횟수"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0801: num [1:14538] NA 2 2 NA 2 NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "8. 총 출생아수(전체)"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0802: num [1:14538] NA 2 2 NA 0 NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "8. 총 출생아수(아들)"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0803: num [1:14538] NA 0 0 NA 2 NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "8. 총 출생아수(딸)"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0901: num [1:14538] NA 2 2 NA 2 NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "9. 사망자녀 여부"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0902: num [1:14538] NA NA NA NA NA NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "9. 총 사망자녀 수(전체)"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0903: num [1:14538] NA NA NA NA NA NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "9. 총 사망자녀 수(아들)"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ c0904: num [1:14538] NA NA NA NA NA NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "9. 총 사망자녀 수(딸)"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  $ d00  : num [1:14538] NA 2 2 NA 2 NA NA NA 2 NA ...
#   ..- attr(*, "label")= chr "0. 2018년 9월 2일 이후 출산 경험 유무"
#   ..- attr(*, "format.spss")= chr "F1.0"
#  - attr(*, "n_distinct")=List of 4
#   ..$ nrow: int 14538
#   ..$ hpid: int 14538
#   ..$ pid : int 7
#   ..$ hid : int 9999
# > get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F3.0") %>% str
# tibble [14,538 × 2] (S3: tbl_df/tbl/data.frame)
#  $ a0502: num [1:14538] NA 2 5 NA 50 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5-1. 연간/월간 일 수"
#   ..- attr(*, "format.spss")= chr "F3.0"
#  $ a0802: num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 연간/월간 도움받은 일 수"
#   ..- attr(*, "format.spss")= chr "F3.0"
#  - attr(*, "n_distinct")=List of 4
#   ..$ nrow: int 14538
#   ..$ hpid: int 14538
#   ..$ pid : int 7
#   ..$ hid : int 9999
# > get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F4.0") %>% str
# tibble [14,538 × 8] (S3: tbl_df/tbl/data.frame)
#  $ a0301: num [1:14538] NA 720 NA 100 NA NA NA NA 240 NA ...
#   ..- attr(*, "label")= chr "3-1. 정기적 현금 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0302: num [1:14538] NA 60 NA 0 NA NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "3-1. 정기적 현물 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0401: num [1:14538] NA 0 50 NA 50 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4-1. 비정기적 현금 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0402: num [1:14538] NA 150 10 NA 0 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4-1. 비정기적 현물 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0601: num [1:14538] 720 NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "6-1. 정기적 현금 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0602: num [1:14538] 0 NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "6-1. 정기적 현물 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0701: num [1:14538] 50 NA NA NA 0 NA NA 0 NA NA ...
#   ..- attr(*, "label")= chr "7-1. 비정기적 현금 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  $ a0702: num [1:14538] 50 NA NA NA 50 NA NA 150 NA NA ...
#   ..- attr(*, "label")= chr "7-1. 비정기적 현물 지원(연간/만원)"
#   ..- attr(*, "format.spss")= chr "F4.0"
#  - attr(*, "n_distinct")=List of 4
#   ..$ nrow: int 14538
#   ..$ hpid: int 14538
#   ..$ pid : int 7
#   ..$ hid : int 9999
# > get(DataSetName) %>% select_if(function(vec) attr(vec, "format.spss") == "F8.0") %>% str
# tibble [14,538 × 1,156] (S3: tbl_df/tbl/data.frame)
#  $ hpid       : num [1:14538] 1e+06 1e+06 1e+06 1e+06 1e+06 ...
#   ..- attr(*, "label")= chr "가구ID+가구원번호"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ hid        : num [1:14538] 10001 10002 10003 10004 10004 ...
#   ..- attr(*, "label")= chr "가구ID(고유번호)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ pid        : num [1:14538] 3 2 2 1 2 3 4 1 1 3 ...
#   ..- attr(*, "label")= chr "가구원번호"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ area1      : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "지역(동부/읍면부)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#   ..- attr(*, "display_width")= int 10
#  $ area2      : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "지역(대도시/중소도시/농어촌)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#   ..- attr(*, "display_width")= int 11
#  $ age        : num [1:14538] 22 43 42 41 41 32 31 36 40 30 ...
#   ..- attr(*, "label")= chr "나이"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ res        : num [1:14538] 112 20 20 10 20 11 12 10 10 11 ...
#   ..- attr(*, "label")= chr "가구주와의 관계"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ sex        : hvn_lbll [1:14538] 1, 2, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2...
#    ..@ label      : chr "성별"
#    ..@ format.spss: chr "F8.0"
#    ..@ labels     : Named num [1:2] 1 2
#    .. ..- attr(*, "names")= chr [1:2] "남자" "여자"
#  $ birthy     : num [1:14538] 1999 1977 1978 1980 1980 ...
#   ..- attr(*, "label")= chr "생년(양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ birthm     : num [1:14538] 3 11 9 7 5 12 8 10 1 3 ...
#   ..- attr(*, "label")= chr "생월(양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ birthd     : num [1:14538] 11 5 28 4 30 21 29 23 7 25 ...
#   ..- attr(*, "label")= chr "생일(양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ edu1       : hvn_lbll [1:14538] 6, 4, 6, 6, 6, 6, 6, 6, 4, 5, 6, 6, 4, 6, 4, 4, 6, 4, 4, 4, 4, 6, 6, 5, 5, 4, 5, 6, 4, 5, 4, 4, 5, 5, 4, 5, 5, 6, 4, 6, 6, 5, 5, 4, 4, 6...
#    ..@ label      : chr "교육정도"
#    ..@ format.spss: chr "F8.0"
#    ..@ labels     : Named num [1:9] 0 1 2 3 4 5 6 7 8
#    .. ..- attr(*, "names")= chr [1:9] "미취학" "무학" "초등학교" "중학교" ...
#  $ edu2       : hvn_lbll [1:14538] 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 1, 3, 1, 1, 1, 1, 1, 1...
#    ..@ label      : chr "교육상태"
#    ..@ format.spss: chr "F8.0"
#    ..@ labels     : Named num [1:6] 1 2 3 4 5 99
#    .. ..- attr(*, "names")= chr [1:6] "졸업" "수료" "중퇴" "재학" ...
#  $ marr       : hvn_lbll [1:14538] 1, 2, 2, 2, 2, 1, 1, 1, 3, 1, 1, 2, 2, 1, 2, 2, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 3, 2, 2, 2, 2, 2, 2, 1...
#    ..@ label      : chr "혼인 상태"
#    ..@ format.spss: chr "F8.0"
#    ..@ labels     : Named num [1:5] 1 2 3 4 5
#    .. ..- attr(*, "names")= chr [1:5] "미혼" "유배우자" "이혼" "별거" ...
#  $ job        : num [1:14538] 3 2 3 1 3 1 1 1 1 3 ...
#   ..- attr(*, "label")= chr "경제활동 상태"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ reg        : num [1:14538] 3 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "종교"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ na1        : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "국적"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ na2        : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "외국국적"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h07        : num [1:14538] 3 4 4 4 4 4 4 1 1 4 ...
#   ..- attr(*, "label")= chr "가구 일반특성 문항에 적용되는 가구원수"
#   ..- attr(*, "format.spss")= chr "F8.0"
#   ..- attr(*, "display_width")= int 11
#  $ h08        : num [1:14538] 3 4 4 4 4 4 4 1 1 4 ...
#   ..- attr(*, "label")= chr "동거 가구원 수"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h09        : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "비동거 자녀 수"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h10        : num [1:14538] 3 2 2 2 2 4 4 1 1 4 ...
#   ..- attr(*, "label")= chr "대표응답자 가구원 번호"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h01        : num [1:14538] 2 2 2 2 2 2 2 2 6 2 ...
#   ..- attr(*, "label")= chr "1. 현 주택 유형"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h02        : num [1:14538] 1 1 1 1 1 1 1 1 3 1 ...
#   ..- attr(*, "label")= chr "2. 현 주택 점유형태"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h02own     : num [1:14538] 40000 38000 40000 38000 38000 34000 34000 38000 NA 38000 ...
#   ..- attr(*, "label")= chr "2. 자가주택 시가(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h02dep     : num [1:14538] NA NA NA NA NA NA NA NA 2000 NA ...
#   ..- attr(*, "label")= chr "2. 전세 또는 월세 보증금(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h02rent    : num [1:14538] NA NA NA NA NA NA NA NA 40 NA ...
#   ..- attr(*, "label")= chr "2. 월세 또는 사글세(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0201      : num [1:14538] NA NA NA NA NA NA NA NA 2 NA ...
#   ..- attr(*, "label")= chr "2-1. 임대주택 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0202      : num [1:14538] 2 1 1 1 1 2 2 1 2 2 ...
#   ..- attr(*, "label")= chr "2-2. 대출 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h02021     : num [1:14538] NA 18000 17000 5000 5000 NA NA 17000 NA NA ...
#   ..- attr(*, "label")= chr "2-2. 대출 금액(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h03        : num [1:14538] 2 1 1 1 1 2 2 2 2 1 ...
#   ..- attr(*, "label")= chr "3. 거주 주택 이외의 주택 소유 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0401      : num [1:14538] 250 350 460 420 420 725 725 500 200 890 ...
#   ..- attr(*, "label")= chr "4-1. 근로소득(세금 공제 전) 및 사업,부업소득(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0402      : num [1:14538] 20 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "4-2. 재산, 금융, 개인연금소득(월평균)(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0403      : num [1:14538] 48 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "4-3. 공적이전소득(월평균)(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0404      : num [1:14538] 68 0 0 4 4 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "4-4. 기타소득(사적이전소득 등)(월평균)(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0405      : num [1:14538] 386 350 460 424 424 725 725 500 200 890 ...
#   ..- attr(*, "label")= chr "4. 합계소득(월평균)(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0406      : num [1:14538] 350 600 400 350 350 650 650 400 185 850 ...
#   ..- attr(*, "label")= chr "5. 월평균 가구지출(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0407      : num [1:14538] 55000 59000 71500 49500 49500 55000 55000 44000 2500 72000 ...
#   ..- attr(*, "label")= chr "6. 재산(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ h0408      : num [1:14538] 5000 26000 29000 5000 5000 1600 1600 17000 0 12000 ...
#   ..- attr(*, "label")= chr "7. 부채(만원)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a01        : num [1:14538] 4 4 4 4 4 4 4 4 2 4 ...
#   ..- attr(*, "label")= chr "1. 부모 생존 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a09        : num [1:14538] 2 1 4 3 3 2 2 4 2 2 ...
#   ..- attr(*, "label")= chr "9. 부모의 현재 경제적 상황"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d1     : num [1:14538] 0 1 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(없음)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d2     : num [1:14538] 0 0 1 1 1 0 0 1 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(애인)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d3     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(아버지)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d4     : num [1:14538] 0 0 0 0 1 1 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(어머니)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d5     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(자녀)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d6     : num [1:14538] 0 0 0 0 0 1 0 0 1 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(형제자매)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d7     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(친인척)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d8     : num [1:14538] 1 0 1 0 0 1 1 0 0 1 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(친구)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d9     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(직장동료)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a10_d10    : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(기타)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1101f     : num [1:14538] 1 1 1 1 1 1 1 1 2 1 ...
#   ..- attr(*, "label")= chr "11-1. 아버지 생존여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1102f     : num [1:14538] 2 2 2 2 2 1 1 2 NA 1 ...
#   ..- attr(*, "label")= chr "11-2. 아버지와 동거 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a11021f    : num [1:14538] NA NA NA NA NA 1 1 NA NA 1 ...
#   ..- attr(*, "label")= chr "11-2. 아버지 가구원 번호"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1103f     : num [1:14538] 1 1 1 1 1 1 1 1 8 1 ...
#   ..- attr(*, "label")= chr "11-3. 아버지 출생시점 인지여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a11031f    : num [1:14538] 1966 1948 1950 1953 1954 ...
#   ..- attr(*, "label")= chr "11-3. 아버지 출생시점 (년, 양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a11032f    : num [1:14538] 10 2 3 2 8 8 8 12 NA 12 ...
#   ..- attr(*, "label")= chr "11-3. 아버지 출생시점 (월, 양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1104f     : num [1:14538] 4 2 6 4 4 4 4 4 98 6 ...
#   ..- attr(*, "label")= chr "11-4. 아버지 최종학력"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1105f     : num [1:14538] 1 2 2 2 2 1 1 1 NA 1 ...
#   ..- attr(*, "label")= chr "11-5. 아버지의 현재 취업여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1106f     : num [1:14538] 7 NA NA NA NA 4 4 7 NA 3 ...
#   ..- attr(*, "label")= chr "11-6. 아버지의 현재 직업"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1107f     : num [1:14538] 7 9 1 3 3 4 4 7 98 3 ...
#   ..- attr(*, "label")= chr "11-7. 아버지의 과거 주 직업"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1101m     : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "11-1. 어머니 생존여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1102m     : num [1:14538] 2 2 2 2 2 1 1 2 2 1 ...
#   ..- attr(*, "label")= chr "11-2. 어머니와 동거 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a11021m    : num [1:14538] NA NA NA NA NA 2 2 NA NA 2 ...
#   ..- attr(*, "label")= chr "11-2. 어머니 가구원 번호"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1103fm    : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "11-3. 어머니 출생시점 인지여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a11031m    : num [1:14538] 1966 1955 1949 1955 1956 ...
#   ..- attr(*, "label")= chr "11-3. 어머니 출생시점 (년, 양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a11032m    : num [1:14538] 11 7 1 8 2 2 2 8 10 10 ...
#   ..- attr(*, "label")= chr "11-3. 어머니 출생시점 (월, 양력기준)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1104m     : num [1:14538] 4 2 4 4 4 4 4 4 4 4 ...
#   ..- attr(*, "label")= chr "11-4. 어머니 최종학력"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1105m     : num [1:14538] 1 2 2 2 2 2 2 2 2 1 ...
#   ..- attr(*, "label")= chr "11-5. 어머니의 현재 취업여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1106m     : num [1:14538] 9 NA NA NA NA NA NA NA NA 5 ...
#   ..- attr(*, "label")= chr "11-6. 어머니의 현재 직업"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ a1107m     : num [1:14538] 9 12 11 11 11 11 11 11 4 5 ...
#   ..- attr(*, "label")= chr "11-7. 어머니의 과거 주 직업"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b01        : num [1:14538] 2 1 1 1 1 2 2 2 2 2 ...
#   ..- attr(*, "label")= chr "1. 현재 배우자, 애인, 파트너 유무"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b01no      : num [1:14538] NA 1 1 2 1 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "1. 현재 배우자, 애인, 파트너 가구원 번호"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0101      : num [1:14538] NA 1 1 1 1 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "1-1. 현 배우자와 혼인신고 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0101y     : num [1:14538] NA 2006 2011 2010 2010 ...
#   ..- attr(*, "label")= chr "1-1. 현 배우자와 혼인신고 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0101m     : num [1:14538] NA 11 3 11 11 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "1-1. 현 배우자와 혼인신고 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0102      : num [1:14538] 1 NA NA NA NA 1 1 1 2 1 ...
#   ..- attr(*, "label")= chr "1-2. 혼인상태"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b02y       : num [1:14538] NA 2006 2011 2010 2010 ...
#   ..- attr(*, "label")= chr "2. 현 배우자와  동거 시작 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b02m       : num [1:14538] NA 6 3 11 11 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "2. 현 배우자와  동거 시작 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b03        : num [1:14538] NA 1 1 1 1 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "3. 현 배우자와 결혼식 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b03y       : num [1:14538] NA 2006 2011 2010 2010 ...
#   ..- attr(*, "label")= chr "3. 현 배우자와 결혼식 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b03m       : num [1:14538] NA 6 3 11 11 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "3. 현 배우자와 결혼식 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b04        : num [1:14538] NA 2 3 2 2 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4. 현 배우자와 결혼생활 시작 시점에 대한 의견"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b04y       : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4. 생각하는 시점 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b04m       : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4. 생각하는 시점 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0501      : num [1:14538] NA 3 3 3 3 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5. 현 배우자와 결혼 생활에 대한 기대 1: 1) 경제적으로 안정된 생활"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0502      : num [1:14538] NA 3 3 3 3 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5. 현 배우자와 결혼 생활에 대한 기대 2: 2) 심리·정서적으로 안정된 생활"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0503      : num [1:14538] NA 4 3 3 4 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5. 현 배우자와 결혼 생활에 대한 기대 3: 3) 자녀를 가질 수 있는 것"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0504      : num [1:14538] NA 3 3 3 3 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5. 현 배우자와 결혼 생활에 대한 기대 4: 4) 성적으로 친밀한 관계"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b06y       : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "6. 현 동거인과  동거 시작 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b06m       : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "6. 현 동거인과 동거 시작 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b07        : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "7. 현 동거인과 결혼식 여부"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b07y       : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "7. 현 동거인과 결혼식 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b07m       : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "7. 현 동거인과 결혼식 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b08        : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8. 현 동거인과의 관계에 대한 의견"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0801      : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 현 동거인과 결혼생활 시작 시점에 대한 의견"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0801y     : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 현 동거인과 결혼생활 시점 (연도)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0801m     : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 현 동거인과 결혼생활 시점 (월)"
#   ..- attr(*, "format.spss")= chr "F8.0"
#  $ b0802      : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-2. 현 동거인과의 관계가 혼인관계라고 생각하지 않은 이유"
#   ..- attr(*, "format.spss")= chr "F8.0"
#   [list output truncated]
#  - attr(*, "n_distinct")=List of 4
#   ..$ nrow: int 14538
#   ..$ hpid: int 14538
#   ..$ pid : int 7
#   ..$ hid : int 9999


DataSet2 = get(DataSetName)
for (i in names(DataSet2)) {
    i.attributes = attributes(DataSet2[[i]])
    if (!is.null(i.attributes$format.spss)) {
        i.attributes.format.spss = i.attributes$format.spss
        if (i.attributes.format.spss %in% c("F1.0")) {
            DataSet2[[i]] = DataSet2[[i]] |> as.integer()
            i.attributes$format.spss = NULL
            attributes(DataSet2[[i]]) = i.attributes
        }
        if (i.attributes.format.spss %in% c("F3.0", "F4.0", "F8.0", "F8.2")) {
            if(is.numeric(DataSet2[[i]])) attributes(DataSet2[[i]])$format.spss = NULL
            # DataSet2[[i]] = DataSet2[[i]] |> as.numeric()
            # i.attributes$format.spss = NULL
            # attributes(DataSet2[[i]]) = i.attributes
        }
    }
}
DataSet2 %>% select_if(is.integer) %>% str
DataSet2 %>% select_if(function(vec) if(!is.null(attr(vec, "format.spss"))) attr(vec, "format.spss") == "F1.0" else FALSE) %>% str
DataSet2 %>% select_if(function(vec) if(!is.null(attr(vec, "format.spss"))) attr(vec, "format.spss") == "F3.0" else FALSE) %>% str
DataSet2 %>% select_if(function(vec) if(!is.null(attr(vec, "format.spss"))) attr(vec, "format.spss") == "F4.0" else FALSE) %>% str
DataSet2 %>% select_if(function(vec) if(!is.null(attr(vec, "format.spss"))) attr(vec, "format.spss") == "F8.0" else FALSE) %>% str


dim(DataSet2) == dim(get(DataSetName))
all(names(DataSet2) == names(get(DataSetName)))
all.equal(DataSet2, get(DataSetName))


DataSet2 %>% str
# > DataSet2 %>% str
# tibble [14,538 × 1,309] (S3: tbl_df/tbl/data.frame)
#  $ hpid       : num [1:14538] 1e+06 1e+06 1e+06 1e+06 1e+06 ...
#   ..- attr(*, "label")= chr "가구ID+가구원번호"
#  $ hid        : num [1:14538] 10001 10002 10003 10004 10004 ...
#   ..- attr(*, "label")= chr "가구ID(고유번호)"
#  $ pid        : num [1:14538] 3 2 2 1 2 3 4 1 1 3 ...
#   ..- attr(*, "label")= chr "가구원번호"
#  $ area1      : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "지역(동부/읍면부)"
#   ..- attr(*, "display_width")= int 10
#  $ area2      : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "지역(대도시/중소도시/농어촌)"
#   ..- attr(*, "display_width")= int 11
#  $ age        : num [1:14538] 22 43 42 41 41 32 31 36 40 30 ...
#   ..- attr(*, "label")= chr "나이"
#  $ res        : num [1:14538] 112 20 20 10 20 11 12 10 10 11 ...
#   ..- attr(*, "label")= chr "가구주와의 관계"
#  $ sex        : hvn_lbll [1:14538] 1, 2, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2...
#    ..@ label : chr "성별"
#    ..@ labels: Named num [1:2] 1 2
#    .. ..- attr(*, "names")= chr [1:2] "남자" "여자"
#  $ birthy     : num [1:14538] 1999 1977 1978 1980 1980 ...
#   ..- attr(*, "label")= chr "생년(양력기준)"
#  $ birthm     : num [1:14538] 3 11 9 7 5 12 8 10 1 3 ...
#   ..- attr(*, "label")= chr "생월(양력기준)"
#  $ birthd     : num [1:14538] 11 5 28 4 30 21 29 23 7 25 ...
#   ..- attr(*, "label")= chr "생일(양력기준)"
#  $ edu1       : hvn_lbll [1:14538] 6, 4, 6, 6, 6, 6, 6, 6, 4, 5, 6, 6, 4, 6, 4, 4, 6, 4, 4, 4, 4, 6, 6, 5, 5, 4, 5, 6, 4, 5, 4, 4, 5, 5, 4, 5, 5, 6, 4, 6, 6, 5, 5, 4, 4, 6...
#    ..@ label : chr "교육정도"
#    ..@ labels: Named num [1:9] 0 1 2 3 4 5 6 7 8
#    .. ..- attr(*, "names")= chr [1:9] "미취학" "무학" "초등학교" "중학교" ...
#  $ edu2       : hvn_lbll [1:14538] 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 1, 3, 1, 1, 1, 1, 1, 1...
#    ..@ label : chr "교육상태"
#    ..@ labels: Named num [1:6] 1 2 3 4 5 99
#    .. ..- attr(*, "names")= chr [1:6] "졸업" "수료" "중퇴" "재학" ...
#  $ marr       : hvn_lbll [1:14538] 1, 2, 2, 2, 2, 1, 1, 1, 3, 1, 1, 2, 2, 1, 2, 2, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 3, 2, 2, 2, 2, 2, 2, 1...
#    ..@ label : chr "혼인 상태"
#    ..@ labels: Named num [1:5] 1 2 3 4 5
#    .. ..- attr(*, "names")= chr [1:5] "미혼" "유배우자" "이혼" "별거" ...
#  $ job        : num [1:14538] 3 2 3 1 3 1 1 1 1 3 ...
#   ..- attr(*, "label")= chr "경제활동 상태"
#  $ reg        : num [1:14538] 3 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "종교"
#  $ na1        : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "국적"
#  $ na2        : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "외국국적"
#  $ na3        : chr [1:14538] "" "" "" "" ...
#   ..- attr(*, "label")= chr "외국국적(기타)"
#   ..- attr(*, "format.spss")= chr "A260"
#   ..- attr(*, "display_width")= int 32
#  $ h07        : num [1:14538] 3 4 4 4 4 4 4 1 1 4 ...
#   ..- attr(*, "label")= chr "가구 일반특성 문항에 적용되는 가구원수"
#   ..- attr(*, "display_width")= int 11
#  $ h08        : num [1:14538] 3 4 4 4 4 4 4 1 1 4 ...
#   ..- attr(*, "label")= chr "동거 가구원 수"
#  $ h09        : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "비동거 자녀 수"
#  $ h10        : num [1:14538] 3 2 2 2 2 4 4 1 1 4 ...
#   ..- attr(*, "label")= chr "대표응답자 가구원 번호"
#  $ h01        : num [1:14538] 2 2 2 2 2 2 2 2 6 2 ...
#   ..- attr(*, "label")= chr "1. 현 주택 유형"
#  $ h01txt     : chr [1:14538] "" "" "" "" ...
#   ..- attr(*, "label")= chr "1. 현 주택 유형 (기타)"
#   ..- attr(*, "format.spss")= chr "A259"
#   ..- attr(*, "display_width")= int 32
#  $ h02        : num [1:14538] 1 1 1 1 1 1 1 1 3 1 ...
#   ..- attr(*, "label")= chr "2. 현 주택 점유형태"
#  $ h02own     : num [1:14538] 40000 38000 40000 38000 38000 34000 34000 38000 NA 38000 ...
#   ..- attr(*, "label")= chr "2. 자가주택 시가(만원)"
#  $ h02dep     : num [1:14538] NA NA NA NA NA NA NA NA 2000 NA ...
#   ..- attr(*, "label")= chr "2. 전세 또는 월세 보증금(만원)"
#  $ h02rent    : num [1:14538] NA NA NA NA NA NA NA NA 40 NA ...
#   ..- attr(*, "label")= chr "2. 월세 또는 사글세(만원)"
#  $ h0201      : num [1:14538] NA NA NA NA NA NA NA NA 2 NA ...
#   ..- attr(*, "label")= chr "2-1. 임대주택 여부"
#  $ h0202      : num [1:14538] 2 1 1 1 1 2 2 1 2 2 ...
#   ..- attr(*, "label")= chr "2-2. 대출 여부"
#  $ h02021     : num [1:14538] NA 18000 17000 5000 5000 NA NA 17000 NA NA ...
#   ..- attr(*, "label")= chr "2-2. 대출 금액(만원)"
#  $ h03        : num [1:14538] 2 1 1 1 1 2 2 2 2 1 ...
#   ..- attr(*, "label")= chr "3. 거주 주택 이외의 주택 소유 여부"
#  $ h0401      : num [1:14538] 250 350 460 420 420 725 725 500 200 890 ...
#   ..- attr(*, "label")= chr "4-1. 근로소득(세금 공제 전) 및 사업,부업소득(만원)"
#  $ h0402      : num [1:14538] 20 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "4-2. 재산, 금융, 개인연금소득(월평균)(만원)"
#  $ h0403      : num [1:14538] 48 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "4-3. 공적이전소득(월평균)(만원)"
#  $ h0404      : num [1:14538] 68 0 0 4 4 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "4-4. 기타소득(사적이전소득 등)(월평균)(만원)"
#  $ h0405      : num [1:14538] 386 350 460 424 424 725 725 500 200 890 ...
#   ..- attr(*, "label")= chr "4. 합계소득(월평균)(만원)"
#  $ h0406      : num [1:14538] 350 600 400 350 350 650 650 400 185 850 ...
#   ..- attr(*, "label")= chr "5. 월평균 가구지출(만원)"
#  $ h0407      : num [1:14538] 55000 59000 71500 49500 49500 55000 55000 44000 2500 72000 ...
#   ..- attr(*, "label")= chr "6. 재산(만원)"
#  $ h0408      : num [1:14538] 5000 26000 29000 5000 5000 1600 1600 17000 0 12000 ...
#   ..- attr(*, "label")= chr "7. 부채(만원)"
#  $ a01        : num [1:14538] 4 4 4 4 4 4 4 4 2 4 ...
#   ..- attr(*, "label")= chr "1. 부모 생존 여부"
#  $ a0101      : int [1:14538] 1 1 1 1 1 2 2 1 1 2 ...
#   ..- attr(*, "label")= chr "1-1. 함께 살지 않는 부모님 존재 여부"
#  $ a02        : int [1:14538] 2 2 2 3 2 NA NA 3 2 NA ...
#   ..- attr(*, "label")= chr "2. 비동거 부모와의 연락 빈도"
#  $ a03        : int [1:14538] 2 1 2 1 2 NA NA 2 1 NA ...
#   ..- attr(*, "label")= chr "3. 부모에게 정기적 현금, 현물 지원 여부"
#  $ a0301      : num [1:14538] NA 720 NA 100 NA NA NA NA 240 NA ...
#   ..- attr(*, "label")= chr "3-1. 정기적 현금 지원(연간/만원)"
#  $ a0302      : num [1:14538] NA 60 NA 0 NA NA NA NA 0 NA ...
#   ..- attr(*, "label")= chr "3-1. 정기적 현물 지원(연간/만원)"
#  $ a04        : int [1:14538] 2 1 1 2 1 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "4. 부모에게 비정기적 현금, 현물 지원 여부"
#  $ a0401      : num [1:14538] NA 0 50 NA 50 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4-1. 비정기적 현금 지원(연간/만원)"
#  $ a0402      : num [1:14538] NA 150 10 NA 0 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "4-1. 비정기적 현물 지원(연간/만원)"
#  $ a05        : int [1:14538] 2 1 1 2 1 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "5. 부모에게 가사일, 병간호 등 도움 여부"
#  $ a0501      : int [1:14538] NA 1 2 NA 2 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5-1. 연간/월간"
#  $ a0502      : num [1:14538] NA 2 5 NA 50 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "5-1. 연간/월간 일 수"
#  $ a06        : int [1:14538] 1 2 2 2 2 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "6. 부모로부터 정기적인 현금, 현물 지원 여부"
#  $ a0601      : num [1:14538] 720 NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "6-1. 정기적 현금 지원(연간/만원)"
#  $ a0602      : num [1:14538] 0 NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "6-1. 정기적 현물 지원(연간/만원)"
#  $ a07        : int [1:14538] 1 2 2 2 1 NA NA 1 2 NA ...
#   ..- attr(*, "label")= chr "7. 부모로부터 비정기적인 현금, 현물 지원 여부"
#  $ a0701      : num [1:14538] 50 NA NA NA 0 NA NA 0 NA NA ...
#   ..- attr(*, "label")= chr "7-1. 비정기적 현금 지원(연간/만원)"
#  $ a0702      : num [1:14538] 50 NA NA NA 50 NA NA 150 NA NA ...
#   ..- attr(*, "label")= chr "7-1. 비정기적 현물 지원(연간/만원)"
#  $ a08        : int [1:14538] 2 2 2 2 2 NA NA 2 2 NA ...
#   ..- attr(*, "label")= chr "8. 부모로부터 가사일, 병간호 등 도움받은 경험 여부"
#  $ a0801      : int [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 연간/월간"
#  $ a0802      : num [1:14538] NA NA NA NA NA NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "8-1. 연간/월간 도움받은 일 수"
#  $ a09        : num [1:14538] 2 1 4 3 3 2 2 4 2 2 ...
#   ..- attr(*, "label")= chr "9. 부모의 현재 경제적 상황"
#  $ a10        : chr [1:14538] "8" "1" "2,8" "2" ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상"
#   ..- attr(*, "format.spss")= chr "A255"
#   ..- attr(*, "display_width")= int 32
#  $ a10_d1     : num [1:14538] 0 1 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(없음)"
#  $ a10_d2     : num [1:14538] 0 0 1 1 1 0 0 1 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(애인)"
#  $ a10_d3     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(아버지)"
#  $ a10_d4     : num [1:14538] 0 0 0 0 1 1 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(어머니)"
#  $ a10_d5     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(자녀)"
#  $ a10_d6     : num [1:14538] 0 0 0 0 0 1 0 0 1 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(형제자매)"
#  $ a10_d7     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(친인척)"
#  $ a10_d8     : num [1:14538] 1 0 1 0 0 1 1 0 0 1 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(친구)"
#  $ a10_d9     : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(직장동료)"
#  $ a10_d10    : num [1:14538] 0 0 0 0 0 0 0 0 0 0 ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상(기타)"
#  $ a1001      : chr [1:14538] "" "" "" "" ...
#   ..- attr(*, "label")= chr "10. 일상적인 대화를 나누는 대상 (기타응답)"
#   ..- attr(*, "format.spss")= chr "A261"
#   ..- attr(*, "display_width")= int 32
#  $ a1101f     : num [1:14538] 1 1 1 1 1 1 1 1 2 1 ...
#   ..- attr(*, "label")= chr "11-1. 아버지 생존여부"
#  $ a1102f     : num [1:14538] 2 2 2 2 2 1 1 2 NA 1 ...
#   ..- attr(*, "label")= chr "11-2. 아버지와 동거 여부"
#  $ a11021f    : num [1:14538] NA NA NA NA NA 1 1 NA NA 1 ...
#   ..- attr(*, "label")= chr "11-2. 아버지 가구원 번호"
#  $ a1103f     : num [1:14538] 1 1 1 1 1 1 1 1 8 1 ...
#   ..- attr(*, "label")= chr "11-3. 아버지 출생시점 인지여부"
#  $ a11031f    : num [1:14538] 1966 1948 1950 1953 1954 ...
#   ..- attr(*, "label")= chr "11-3. 아버지 출생시점 (년, 양력기준)"
#  $ a11032f    : num [1:14538] 10 2 3 2 8 8 8 12 NA 12 ...
#   ..- attr(*, "label")= chr "11-3. 아버지 출생시점 (월, 양력기준)"
#  $ a1104f     : num [1:14538] 4 2 6 4 4 4 4 4 98 6 ...
#   ..- attr(*, "label")= chr "11-4. 아버지 최종학력"
#  $ a1105f     : num [1:14538] 1 2 2 2 2 1 1 1 NA 1 ...
#   ..- attr(*, "label")= chr "11-5. 아버지의 현재 취업여부"
#  $ a1106f     : num [1:14538] 7 NA NA NA NA 4 4 7 NA 3 ...
#   ..- attr(*, "label")= chr "11-6. 아버지의 현재 직업"
#  $ a1107f     : num [1:14538] 7 9 1 3 3 4 4 7 98 3 ...
#   ..- attr(*, "label")= chr "11-7. 아버지의 과거 주 직업"
#  $ a1101m     : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "11-1. 어머니 생존여부"
#  $ a1102m     : num [1:14538] 2 2 2 2 2 1 1 2 2 1 ...
#   ..- attr(*, "label")= chr "11-2. 어머니와 동거 여부"
#  $ a11021m    : num [1:14538] NA NA NA NA NA 2 2 NA NA 2 ...
#   ..- attr(*, "label")= chr "11-2. 어머니 가구원 번호"
#  $ a1103fm    : num [1:14538] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "11-3. 어머니 출생시점 인지여부"
#  $ a11031m    : num [1:14538] 1966 1955 1949 1955 1956 ...
#   ..- attr(*, "label")= chr "11-3. 어머니 출생시점 (년, 양력기준)"
#  $ a11032m    : num [1:14538] 11 7 1 8 2 2 2 8 10 10 ...
#   ..- attr(*, "label")= chr "11-3. 어머니 출생시점 (월, 양력기준)"
#  $ a1104m     : num [1:14538] 4 2 4 4 4 4 4 4 4 4 ...
#   ..- attr(*, "label")= chr "11-4. 어머니 최종학력"
#  $ a1105m     : num [1:14538] 1 2 2 2 2 2 2 2 2 1 ...
#   ..- attr(*, "label")= chr "11-5. 어머니의 현재 취업여부"
#  $ a1106m     : num [1:14538] 9 NA NA NA NA NA NA NA NA 5 ...
#   ..- attr(*, "label")= chr "11-6. 어머니의 현재 직업"
#  $ a1107m     : num [1:14538] 9 12 11 11 11 11 11 11 4 5 ...
#   ..- attr(*, "label")= chr "11-7. 어머니의 과거 주 직업"
#  $ b01        : num [1:14538] 2 1 1 1 1 2 2 2 2 2 ...
#   ..- attr(*, "label")= chr "1. 현재 배우자, 애인, 파트너 유무"
#  $ b01no      : num [1:14538] NA 1 1 2 1 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "1. 현재 배우자, 애인, 파트너 가구원 번호"
#  $ b0101      : num [1:14538] NA 1 1 1 1 NA NA NA NA NA ...
#   ..- attr(*, "label")= chr "1-1. 현 배우자와 혼인신고 여부"
#  $ b0101y     : num [1:14538] NA 2006 2011 2010 2010 ...
#   ..- attr(*, "label")= chr "1-1. 현 배우자와 혼인신고 (연도)"
#   [list output truncated]
#  - attr(*, "n_distinct")=List of 4
#   ..$ nrow: int 14538
#   ..$ hpid: int 14538
#   ..$ pid : int 7
#   ..$ hid : int 9999

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ save_rds() -----\
assign(DataSetName, DataSet2)
.objectname = "NationalFamilyAndFertiltySurvey2021_230314"
system.time(saveRDS( get(.objectname), paste0(.objectname,".rds") ))
# system.time(openxlsx::write.xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
# if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(.objectname, ".xlsx"))

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


