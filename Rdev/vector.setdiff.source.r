# function.setdiff.source.r

vector.setdiff = function(vec1, vec2) {
    out = list()
    out$vec1 = vec1 = as.character(vec1)
    out$vec2 = vec2 = as.character(vec2)
    out$union = union(vec1, vec2)
    out$intersect = intersect(vec1, vec2)
    out$setdiff_1_2 = setdiff(vec1, vec2)
    out$setdiff_2_1 = setdiff(vec2, vec1)
    out$identical = identical(vec1, vec2)
    out
}
vector.setdiff(
    NHID_JK_GJ_0213.bind_rows.integer.by.PERSON_ID.min.HCHK_YEAR %>% filter(AGE_GROUP %in% 5:17) %>% {.$PERSON_ID}
    , 
    NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin %>% {.$PERSON_ID}
) %>% str
# > function.setdiff(
# +     NHID_JK_GJ_0213.bind_rows.integer.by.PERSON_ID.min.HCHK_YEAR %>% filter(AGE_GROUP %in% 5:17) %>% {.$PERSON_ID}
# +     , 
# +     NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin %>% {.$PERSON_ID}
# + ) %>% str
# List of 6
#  $ x          : chr [1:590743] "10000453" "10001179" "10001439" "10001704" ...
#  $ y          : chr [1:408215] "10000201" "10000453" "10001439" "10003179" ...
#  $ union      : chr [1:652295] "10000453" "10001179" "10001439" "10001704" ...
#  $ intersect  : chr [1:346663] "10000453" "10001179" "10001439" "10003179" ...
#  $ setdiff_x_y: chr [1:244080] "10001704" "10002168" "10006351" "10023710" ...
#  $ setdiff_y_x: chr [1:61552] "10000201" "10003661" "10005260" "10006177" ...


590743 + 408215 - 346663
# > 590743 + 408215 - 346663
# [1] 652295
346663 + 244080
346663 + 61552
# > 346663 + 244080
# [1] 590743
# > 346663 + 61552
# [1] 408215














#@ list.sas7bdat.setdiff =====
list.sas7bdat_PERSON_ID.setdiff = list()
for (i in 2:length(list.sas7bdat)) {
    list.sas7bdat_PERSON_ID.setdiff[[names(list.sas7bdat)[i]]] = 
        vector.setdiff(list.sas7bdat[[i-1]]$PERSON_ID, list.sas7bdat[[i]]$PERSON_ID)
}


list.sas7bdat_PERSON_ID.setdiff %>% str #----
# > list.sas7bdat_PERSON_ID.setdiff %>% str #----
# List of 8
#  $ temp2:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp3:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp4:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp5:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp6:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:211655] "30761968" "30826346" "31100750" "31269616" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp7:List of 7
#   ..$ vec1       : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:12560] "10008958" "10012253" "10018712" "10018767" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp8:List of 7
#   ..$ vec1       : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:2449] "10011773" "10032231" "10033962" "10041103" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp9:List of 7
#   ..$ vec1       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE


#@ end ----
objectname = "list.sas7bdat_PERSON_ID.setdiff"
path4write = getwd()
write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )

