# function.setdiff.source.r

function.setdiff = function(x, y) {
    out = list()
    out$x = x = as.character(x)
    out$y = y = as.character(y)
    out$union = union(x, y)
    out$intersect = intersect(x, y)
    out$setdiff_x_y = setdiff(x, y)
    out$setdiff_y_x = setdiff(y, x)
    out
}
function.setdiff(
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



#@ end ----