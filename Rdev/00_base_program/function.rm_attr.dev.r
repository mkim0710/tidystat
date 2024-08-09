# function.rm_attr.dev.r


list.sas7bdat = list.sas7bdat %>% map(function(ob) {attr(ob, "label") = NULL ; ob})



list.sas7bdat |> str(max.level = 1) #----
list.sas7bdat$temp1 |> str(max.level = 1) #----
list.sas7bdat$temp1$HCHK_YEAR |> str(max.level = 1) #----
# > list.sas7bdat |> str(max.level = 1) #----  
# List of 9
#  $ temp1: tibble [264,777 x 75] (S3: tbl_df/tbl/data.frame)
#  $ temp2: tibble [264,777 x 76] (S3: tbl_df/tbl/data.frame)
#  $ temp3: tibble [264,777 x 77] (S3: tbl_df/tbl/data.frame)
#  $ temp4: tibble [264,777 x 88] (S3: tbl_df/tbl/data.frame)
#  $ temp5: tibble [264,777 x 92] (S3: tbl_df/tbl/data.frame)
#  $ temp6: tibble [53,122 x 93] (S3: tbl_df/tbl/data.frame)
#  $ temp7: tibble [40,562 x 93] (S3: tbl_df/tbl/data.frame)
#  $ temp8: tibble [38,113 x 93] (S3: tbl_df/tbl/data.frame)
#  $ temp9: tibble [38,113 x 96] (S3: tbl_df/tbl/data.frame)
# > list.sas7bdat$temp1 |> str(max.level = 1) #----  
# tibble [264,777 x 75] (S3: tbl_df/tbl/data.frame)
# > list.sas7bdat$temp1$HCHK_YEAR |> str(max.level = 1) #----  
#  chr [1:264777] "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2002" "2003" "2003" "2003" ...
#  - attr(*, "label")= chr "EXMD_BZ_YYYY"
#  - attr(*, "format.sas")= chr "$"



list.sas7bdat %>% attributes |> str() #-----
list.sas7bdat$temp1 %>% attributes |> str() #-----
list.sas7bdat$temp1$HCHK_YEAR %>% attributes |> str() #-----
list.sas7bdat$temp1$dth_dt %>% attributes |> str() #-----
# > list.sas7bdat %>% attributes |> str() #-----  
# List of 1
#  $ names: chr [1:9] "temp1" "temp2" "temp3" "temp4" ...
# > list.sas7bdat$temp1 %>% attributes |> str()
# List of 3
#  $ names    : chr [1:75] "HCHK_YEAR" "PERSON_ID" "YKIHO_GUBUN_CD" "hme_dt1" ...
#  $ row.names: int [1:264777] 1 2 3 4 5 6 7 8 9 10 ...
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
# > list.sas7bdat$temp1$HCHK_YEAR %>% attributes |> str() #-----  
# List of 2
#  $ label     : chr "EXMD_BZ_YYYY"
#  $ format.sas: chr "$"
# > list.sas7bdat$temp1$dth_dt %>% attributes |> str() #-----  
# List of 2
#  $ class     : chr "Date"
#  $ format.sas: chr "YYMMDDN"

list.sas7bdat$temp1 %>% attributes |> names() |> dput() #----
# > list.sas7bdat$temp1 %>% attributes |> names() |> dput() #----  
# c("names", "row.names", "class")

list.sas7bdat %>% attributes %>% {.[c("names", "row.names", "class")]} |> str() #----
list.sas7bdat$temp1 %>% attributes %>% {.[c("names", "row.names", "class")]} |> str() #----
list.sas7bdat$temp1$HCHK_YEAR %>% attributes %>% {.[c("names", "row.names", "class")]} |> str() #----
# > list.sas7bdat %>% attributes %>% {.[c("names", "row.names", "class")]} |> str() #----  
# List of 3
#  $ names: chr [1:9] "temp1" "temp2" "temp3" "temp4" ...
#  $ NA   : NULL
#  $ NA   : NULL
# > list.sas7bdat$temp1 %>% attributes %>% {.[c("names", "row.names", "class")]} |> str() #----  
# List of 3
#  $ names    : chr [1:75] "HCHK_YEAR" "PERSON_ID" "YKIHO_GUBUN_CD" "hme_dt1" ...
#  $ row.names: int [1:264777] 1 2 3 4 5 6 7 8 9 10 ...
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
# > list.sas7bdat$temp1$HCHK_YEAR %>% attributes %>% {.[c("names", "row.names", "class")]} |> str() #----  
# List of 3
#  $ NA: NULL
#  $ NA: NULL
#  $ NA: NULL


list.sas7bdat %>% attributes %>% {.[c("names", "row.names", "class")]} %>% compact |> str() #----
list.sas7bdat$temp1 %>% attributes %>% {.[c("names", "row.names", "class")]} %>% compact |> str() #----
list.sas7bdat$temp1$HCHK_YEAR %>% attributes %>% {.[c("names", "row.names", "class")]} %>% compact |> str() #----
# > list.sas7bdat %>% attributes %>% {.[c("names", "row.names", "class")]} %>% compact |> str() #----  
# List of 1
#  $ names: chr [1:9] "temp1" "temp2" "temp3" "temp4" ...
# > list.sas7bdat$temp1 %>% attributes %>% {.[c("names", "row.names", "class")]} %>% compact |> str() #----  
# List of 3
#  $ names    : chr [1:75] "HCHK_YEAR" "PERSON_ID" "YKIHO_GUBUN_CD" "hme_dt1" ...
#  $ row.names: int [1:264777] 1 2 3 4 5 6 7 8 9 10 ...
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
# > list.sas7bdat$temp1$HCHK_YEAR %>% attributes %>% {.[c("names", "row.names", "class")]} %>% compact |> str() #----  
#  Named list()




list.sas7bdat[1:2] %>% map(function(df) df[1:3,1:2]) |> dput() #----
list.sas7bdat$temp1[1:10,1:2] |> dput() #----
list.sas7bdat$temp1[1:10,]$HCHK_YEAR |> dput() #----
# > list.sas7bdat[1:2] %>% map(function(df) df[1:3,1:2]) |> dput() #----  
# list(temp1 = structure(list(HCHK_YEAR = structure(c("2003", "2003", 
# "2003"), label = "EXMD_BZ_YYYY", format.sas = "$"), PERSON_ID = c("10000084", 
# "10001637", "10004213")), row.names = c(NA, -3L), class = c("tbl_df", 
# "tbl", "data.frame")), temp2 = structure(list(HCHK_YEAR = structure(c("2003", 
# "2003", "2003"), label = "EXMD_BZ_YYYY", format.sas = "$"), PERSON_ID = structure(c("10000084", 
# "10001637", "10004213"), label = "PERSON_ID", format.sas = "$")), row.names = c(NA, 
# -3L), class = c("tbl_df", "tbl", "data.frame")))
# > list.sas7bdat$temp1[1:10,1:2] |> dput() #----  
# structure(list(HCHK_YEAR = structure(c("2003", "2003", "2003", 
# "2003", "2003", "2003", "2003", "2003", "2003", "2003"), label = "EXMD_BZ_YYYY", format.sas = "$"), 
#     PERSON_ID = c("10000084", "10001637", "10004213", "10006065", 
#     "10007191", "10007371", "10008958", "10009574", "10010906", 
#     "10011773")), row.names = c(NA, -10L), class = c("tbl_df", 
# "tbl", "data.frame"))
# > list.sas7bdat$temp1[1:10,]$HCHK_YEAR |> dput() #----  
# structure(c("2003", "2003", "2003", "2003", "2003", "2003", "2003", 
# "2003", "2003", "2003"), label = "EXMD_BZ_YYYY", format.sas = "$")


list.sas7bdat2 = list.sas7bdat %>% map(function(df) {
    attributes(df) = attributes(df) %>% {.[c("names", "row.names", "class")]} %>% compact
    
    if(is.data.frame(df)) {
        out = df %>% map_df(function(vec) {
            attributes(vec) = attributes(vec) %>% {.[c("names", "row.names", "class")]} %>% compact
            vec
        })
    } else {
        out = df
    }

    out
})

list.sas7bdat2 |> str(max.level = 1) #----
list.sas7bdat2$temp1 |> str(max.level = 1) #----
list.sas7bdat2$temp1$HCHK_YEAR |> str(max.level = 1) #----
# > list.sas7bdat2 |> str(max.level = 1) #----  
# List of 9
#  $ temp1: tibble [264,777 x 75] (S3: tbl_df/tbl/data.frame)
#  $ temp2: tibble [264,777 x 76] (S3: tbl_df/tbl/data.frame)
#  $ temp3: tibble [264,777 x 77] (S3: tbl_df/tbl/data.frame)
#  $ temp4: tibble [264,777 x 88] (S3: tbl_df/tbl/data.frame)
#  $ temp5: tibble [264,777 x 92] (S3: tbl_df/tbl/data.frame)
#  $ temp6: tibble [53,122 x 93] (S3: tbl_df/tbl/data.frame)
#  $ temp7: tibble [40,562 x 93] (S3: tbl_df/tbl/data.frame)
#  $ temp8: tibble [38,113 x 93] (S3: tbl_df/tbl/data.frame)
#  $ temp9: tibble [38,113 x 96] (S3: tbl_df/tbl/data.frame)
# > list.sas7bdat2$temp1 |> str(max.level = 1) #----  
# tibble [264,777 x 75] (S3: tbl_df/tbl/data.frame)
# > list.sas7bdat2$temp1$HCHK_YEAR |> str(max.level = 1) #----  
#  chr [1:264777] "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2003" "2002" "2003" "2003" "2003" ...

list.sas7bdat2[1:2] %>% map(function(df) df[1:3,1:2]) |> dput() #----
list.sas7bdat2$temp1[1:10,1:2] |> dput() #----
list.sas7bdat2$temp1[1:10,]$HCHK_YEAR |> dput() #----
# > list.sas7bdat2[1:2] %>% map(function(df) df[1:3,1:2]) |> dput() #----  
# list(temp1 = structure(list(HCHK_YEAR = c("2003", "2003", "2003"
# ), PERSON_ID = c("10000084", "10001637", "10004213")), row.names = c(NA, 
# -3L), class = c("tbl_df", "tbl", "data.frame")), temp2 = structure(list(
#     HCHK_YEAR = c("2003", "2003", "2003"), PERSON_ID = c("10000084", 
#     "10001637", "10004213")), row.names = c(NA, -3L), class = c("tbl_df", 
# "tbl", "data.frame")))
# > list.sas7bdat2$temp1[1:10,1:2] |> dput() #----  
# structure(list(HCHK_YEAR = c("2003", "2003", "2003", "2003", 
# "2003", "2003", "2003", "2003", "2003", "2003"), PERSON_ID = c("10000084", 
# "10001637", "10004213", "10006065", "10007191", "10007371", "10008958", 
# "10009574", "10010906", "10011773")), row.names = c(NA, -10L), class = c("tbl_df", 
# "tbl", "data.frame"))
# > list.sas7bdat2$temp1[1:10,]$HCHK_YEAR |> dput() #----  
# c("2003", "2003", "2003", "2003", "2003", "2003", "2003", "2003", 
# "2003", "2003")

list.sas7bdat = list.sas7bdat2

# @ end ----  
objectname = "list.sas7bdat"
.path4write = getwd()
system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="xz", compression=9 ))



# @ end ----------  
