## ->> Now included in f_df.t.tribble_construct.source.r ----
# function.setdiff.dev.r


##@ f_vec1_vec2.setdiff_list =====
f_vec1_vec2.setdiff_list = function(vec1, vec2) {
    out = list()
    out$vec1.character = vec1 = as.character(vec1)
    out$vec2.character = vec2 = as.character(vec2)
    out$union = union(vec1, vec2)
    out$intersect = intersect(vec1, vec2)
    out$setdiff_1_2 = setdiff(vec1, vec2)
    out$setdiff_2_1 = setdiff(vec2, vec1)
    out$identical = all.equal(vec1, vec2)
    out
}

## https://chatgpt.com/c/67780ea5-dfb8-800e-a3c9-0d73059a1dd4
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec1_vec2.setdiff_list =  ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_vec1_vec2.setdiff_list.dev.r
.tmp$objectname = "f_vec1_vec2.setdiff_list"
.tmp$object = function(vec1, vec2, print_str = TRUE, output_as_data_frame = FALSE) {
    vec1 = as.character(vec1)
    vec2 = as.character(vec2)
    output_list = list(
        vec1.character = vec1, 
        vec2.character = vec2, 
        union = union(vec1, vec2), 
        intersect = intersect(vec1, vec2), 
        setdiff_1_2 = setdiff(vec1, vec2), 
        setdiff_2_1 = setdiff(vec2, vec1), 
        identical = all.equal(vec1, vec2)
    )
    if (output_as_data_frame) {
        output_df = data.frame(
            union         = output_list$union,
            vec1          = output_list$union %in% output_list$vec1.character,
            vec2          = output_list$union %in% output_list$vec2.character,
            intersect     = output_list$union %in% output_list$intersect,
            setdiff_1_2   = output_list$union %in% output_list$setdiff_1_2,
            setdiff_2_1   = output_list$union %in% output_list$setdiff_2_1
        )
        if (print_str) {str(output_df); print(summary(output_df))}
        return(output_df)
    }
    if (print_str) str(output_list)
    invisible(output_list)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) setdiff_list.vec1_vec2  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "setdiff_list.vec1_vec2")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_vec1_vec2.setdiff_df  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_vec1_vec2.setdiff_df"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(vec1, vec2, print_str = TRUE) {
    env1$f$f_vec1_vec2.setdiff_list(vec1 = vec1, vec2 = vec2, print_str = print_str, output_as_data_frame = TRUE)
} 
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) setdiff_df.vec1_vec2  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "setdiff_df.vec1_vec2")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vec1 = 1:5
vec2 = 1:3 * 2
f_vec1_vec2.setdiff_list(vec1, vec2)
f_vec1_vec2.setdiff_list(vec1, vec2, output_as_data_frame = TRUE)
# > f_vec1_vec2.setdiff_list(vec1, vec2)
# List of 7
#  $ vec1.character: chr [1:5] "1" "2" "3" "4" ...
#  $ vec2.character: chr [1:3] "2" "4" "6"
#  $ union         : chr [1:6] "1" "2" "3" "4" ...
#  $ intersect     : chr [1:2] "2" "4"
#  $ setdiff_1_2   : chr [1:3] "1" "3" "5"
#  $ setdiff_2_1   : chr "6"
#  $ identical     : chr [1:2] "Lengths (5, 3) differ (string compare on first 3)" "3 string mismatches"
# > f_vec1_vec2.setdiff_list(vec1, vec2, output_as_data_frame = TRUE)
# 'data.frame':	6 obs. of  6 variables:
#  $ union      : chr  "1" "2" "3" "4" ...
#  $ vec1       : logi  TRUE TRUE TRUE TRUE TRUE FALSE
#  $ vec2       : logi  FALSE TRUE FALSE TRUE FALSE TRUE
#  $ intersect  : logi  FALSE TRUE FALSE TRUE FALSE FALSE
#  $ setdiff_1_2: logi  TRUE FALSE TRUE FALSE TRUE FALSE
#  $ setdiff_2_1: logi  FALSE FALSE FALSE FALSE FALSE TRUE
#     union              vec1            vec2         intersect       setdiff_1_2     setdiff_2_1    
#  Length:6           Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical  
#  Class :character   FALSE:1         FALSE:3         FALSE:4         FALSE:3         FALSE:5        
#  Mode  :character   TRUE :5         TRUE :3         TRUE :2         TRUE :3         TRUE :1        
#   union  vec1  vec2 intersect setdiff_1_2 setdiff_2_1
# 1     1  TRUE FALSE     FALSE        TRUE       FALSE
# 2     2  TRUE  TRUE      TRUE       FALSE       FALSE
# 3     3  TRUE FALSE     FALSE        TRUE       FALSE
# 4     4  TRUE  TRUE      TRUE       FALSE       FALSE
# 5     5  TRUE FALSE     FALSE        TRUE       FALSE
# 6     6 FALSE  TRUE     FALSE       FALSE        TRUE

f_vec1_vec2.setdiff_list(
    NHID_JK_GJ_0213.bind_rows.integer.by.PERSON_ID.min.HCHK_YEAR %>% dplyr::filter(AGE_GROUP %in% 5:17) %>% {.$PERSON_ID}
    , 
    NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin %>% {.$PERSON_ID}
) |> str(max.level = 2, give.attr = TRUE)
# > function.setdiff(
# +     NHID_JK_GJ_0213.bind_rows.integer.by.PERSON_ID.min.HCHK_YEAR %>% dplyr::filter(AGE_GROUP %in% 5:17) %>% {.$PERSON_ID}
# +     , 
# +     NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin %>% {.$PERSON_ID}
# + ) |> str(max.level = 2, give.attr = TRUE)
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






##@ f_vec1_vec2.setdiff_df =====








## @ list.sas7bdat.setdiff =====  
list.sas7bdat_PERSON_ID.setdiff = list()
for (i in 2:length(list.sas7bdat)) {
    list.sas7bdat_PERSON_ID.setdiff[[names(list.sas7bdat)[i]]] = 
        vector.setdiff(list.sas7bdat[[i-1]]$PERSON_ID, list.sas7bdat[[i]]$PERSON_ID)
}


list.sas7bdat_PERSON_ID.setdiff |> str() #----
# > list.sas7bdat_PERSON_ID.setdiff |> str() #----  
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
  
  
# __________|------  
# @@ END----  
.objectname = "list.sas7bdat_PERSON_ID.setdiff"
.path4write = env1$path$path4write
system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="xz", compression=9 ))

