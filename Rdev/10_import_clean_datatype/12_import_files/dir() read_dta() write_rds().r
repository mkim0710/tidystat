# dir() read_dta() write_rds().r

# https://www.marsja.se/how-to-read-and-write-stata-dta-files-in-r-with-haven/
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/objectname.write_rds.source.r

library(tidyverse)
library(haven)
?read_dta


getwd() %>% dput #----
path4read = getwd()
path4write = getwd()
path4read %>% dput
path4write %>% dput

# tribble_paste = datapasta::tribble_paste
# https://github.com/mkim0710/tidystat/blob/master/Rdev/env.custom.fun.t.tribble_construct.source.r
load(url("https://github.com/mkim0710/tidystat/raw/master/Rdev/env.custom.fun.t.tribble_construct.RData"))
# attach(env.custom)

regex4filename = "\\.dta$"
env.custom$fun.path_files_size(path4read = path4read, regex4filename = regex4filename)
filenames = list.files(path4read) %>% grep(regex4filename, ., value = T) 




dir() %>% str #----
dir() %>% str_subset(".dta$") %>% dput #----
dir() %>% str_subset(".dta$") %>% str_replace(".dta$", "") %>% dput #----
# > dir() %>% str #----
#  chr [1:5] "AS1_MASTER_C.dta" "CT1_MASTER_C.dta" "FM Cleaning pheno" "NC1_MASTER_C.dta" "Rproject_KOGES.Rproj"
# > dir() %>% str_subset(".dta") %>% dput #----
# c("AS1_MASTER_C.dta", "CT1_MASTER_C.dta", "NC1_MASTER_C.dta")
# > dir() %>% str_subset(".dta$") %>% str_replace(".dta$", "") %>% dput #----
# c("AS1_MASTER_C", "CT1_MASTER_C", "NC1_MASTER_C")


# function.dta.rm_attr = function(dta) {
#     dta %>% map_df(function(col) {
#         attr(col, "format.stata") = NULL
#         # Codes to insert inside in the beginning annonymous function for map
#         parent.x = get(".x", envir = parent.frame())
#         # i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, input_object_name_of_map_function_to_investigate) } ))
#         i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, col) } ))
# 
#         # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
#         # print(Sys.time())
#         #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
#         cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))
#         if(!is.null(attr(col, "label"))) {
#             if (names(parent.x)[i] == attr(col, "label")) {
#                 attr(col, "label") = NULL
#             }
#         }
#         col
#     })
# }
# AS1_MASTER_C %>% function.dta.rm_attr #----
function.dta.rm_attr = function(dta) {
    for (i in names(dta)) {
        
        attr(dta[[i]], "format.stata") = NULL
        if(!is.null(attr(dta[[i]], "label"))) {
            if (i == attr(dta[[i]], "label")) {
                attr(dta[[i]], "label") = NULL
            }
        }
    }
    dta
}

AS1_MASTER_C.dta %>% function.dta.rm_attr %>% str #----
# > AS1_MASTER_C %>% function.dta.rm_attr %>% str #----
# tibble[,511] [5,493 x 511] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID            : chr [1:5493] "NIH20D3000109" "NIH20D3000141" "NIH20D3000264" "NIH20D3000671" ...
#  $ AS1_AREA           : num [1:5493] 2 2 2 1 1 1 1 1 2 1 ...
#  $ AS1_EDATE1         : num [1:5493] 2e+05 2e+05 2e+05 2e+05 2e+05 ...
#  $ AS1_SEX            : num [1:5493] 2 2 1 2 1 2 1 2 2 1 ...
#  $ AS1_AGE            : num [1:5493] 42 43 55 47 44 41 52 45 67 58 ...
#  $ AS1_PDHT           : num [1:5493] 1 1 1 1 1 1 1 1 1 1 ...
#  $ AS1_PDHTAG         : num [1:5493] NA NA NA NA NA NA NA NA NA NA ...
#  $ AS1_PDDM           : num [1:5493] 1 1 1 1 2 1 1 1 1 1 ...
#  $ AS1_PDDMAG         : num [1:5493] NA NA NA NA 33 NA NA NA NA NA ...



#@ objectname =======
objectname = "AS1_MASTER_C"
filename = paste0(objectname, ".dta")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
assign(filename, read_dta(file.path(path4read, filename))    )
get(filename) %>% str #----
path4write = getwd()
write_rds( get(filename), file.path(path4write, paste0(filename, ".rds", "")), compress = "xz", compression = 9 )

assign(objectname, get(filename) %>% function.dta.rm_attr   )
get(objectname) %>% str #----
write_rds( get(objectname), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                         filename    size       KB       MB          GB
# 1 D:/OneDrive - SNU/[][Rproject]/Rproject_KOGES/AS1_MASTER_C.dta 8083711 7894.249 7.709228 0.007528543
# > get(objectname) %>% str #----
# tibble[,511] [5,493 x 511] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID            : chr [1:5493] "NIH20D3000109" "NIH20D3000141" "NIH20D3000264" "NIH20D3000671" ...
#   ..- attr(*, "label")= chr "DIST_ID"
#   ..- attr(*, "format.stata")= chr "%13s"
#  $ AS1_AREA           : num [1:5493] 2 2 2 1 1 1 1 1 2 1 ...
#   ..- attr(*, "label")= chr "AS1_AREA"
#   ..- attr(*, "format.stata")= chr "%10.0g"
#  $ AS1_EDATE1         : num [1:5493] 2e+05 2e+05 2e+05 2e+05 2e+05 ...
#   ..- attr(*, "label")= chr "AS1_EDATE1"
#   ..- attr(*, "format.stata")= chr "%10.0g"
#  $ AS1_SEX            : num [1:5493] 2 2 1 2 1 2 1 2 2 1 ...
#   ..- attr(*, "label")= chr "AS1_SEX"
#   ..- attr(*, "format.stata")= chr "%10.0g"
#  $ AS1_AGE            : num [1:5493] 42 43 55 47 44 41 52 45 67 58 ...
#   ..- attr(*, "label")= chr "AS1_AGE"
#   ..- attr(*, "format.stata")= chr "%10.0g"
#  $ AS1_PDHT           : num [1:5493] 1 1 1 1 1 1 1 1 1 1 ...
#   ..- attr(*, "label")= chr "AS1_PDHT"
#   ..- attr(*, "format.stata")= chr "%10.0g"
# > get(objectname) %>% str #----
# tibble[,511] [5,493 x 511] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID            : chr [1:5493] "NIH20D3000109" "NIH20D3000141" "NIH20D3000264" "NIH20D3000671" ...
#  $ AS1_AREA           : num [1:5493] 2 2 2 1 1 1 1 1 2 1 ...
#  $ AS1_EDATE1         : num [1:5493] 2e+05 2e+05 2e+05 2e+05 2e+05 ...
#  $ AS1_SEX            : num [1:5493] 2 2 1 2 1 2 1 2 2 1 ...
#  $ AS1_AGE            : num [1:5493] 42 43 55 47 44 41 52 45 67 58 ...
#  $ AS1_PDHT           : num [1:5493] 1 1 1 1 1 1 1 1 1 1 ...
#  $ AS1_PDHTAG         : num [1:5493] NA NA NA NA NA NA NA NA NA NA ...


#@ objectname =======
objectname = "CT1_MASTER_C"
filename = paste0(objectname, ".dta")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
assign(filename, read_dta(file.path(path4read, filename))    )
get(filename) %>% str #----
path4write = getwd()
write_rds( get(filename), file.path(path4write, paste0(filename, ".rds", "")), compress = "xz", compression = 9 )

assign(objectname, get(filename) %>% function.dta.rm_attr   )
get(objectname) %>% str #----
write_rds( get(objectname), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                         filename     size       KB       MB         GB
# 1 D:/OneDrive - SNU/[][Rproject]/Rproject_KOGES/CT1_MASTER_C.dta 56938475 55603.98 54.30076 0.05302809
# > assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
# > get(objectname) %>% str #----
# tibble[,333] [58,600 x 333] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID         : chr [1:58600] "NIH20D4000001" "NIH20D4000005" "NIH20D4000014" "NIH20D4000025" ...
#   ..- attr(*, "label")= chr "DIST_ID"
#   ..- attr(*, "format.stata")= chr "%13s"
#  $ CT1_DATA_CLASS  : chr [1:58600] "Q11" "Q11" "Q09" "Q11" ...
#   ..- attr(*, "label")= chr "CT1_DATA_CLASS"
#   ..- attr(*, "format.stata")= chr "%9s"
#  $ CT1_SITE        : chr [1:58600] "S28" "S29" "S29" "S06" ...
#   ..- attr(*, "label")= chr "CT1_SITE"
#   ..- attr(*, "format.stata")= chr "%9s"
#  $ CT1_EDATE       : num [1:58600] 201011 201011 200804 201007 201006 ...
#   ..- attr(*, "label")= chr "CT1_EDATE"
#   ..- attr(*, "format.stata")= chr "%10.0g"
# > get(objectname) %>% str #----
# tibble[,333] [58,600 x 333] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID         : chr [1:58600] "NIH20D4000001" "NIH20D4000005" "NIH20D4000014" "NIH20D4000025" ...
#  $ CT1_DATA_CLASS  : chr [1:58600] "Q11" "Q11" "Q09" "Q11" ...
#  $ CT1_SITE        : chr [1:58600] "S28" "S29" "S29" "S06" ...
#  $ CT1_EDATE       : num [1:58600] 201011 201011 200804 201007 201006 ...
#  $ CT1_SIDOCD      : num [1:58600] 11 26 26 28 44 28 42 27 26 11 ...
#  $ CT1_SIDONM      : chr [1:58600] "서울특별시" "부산광역시" "부산광역시" "인천광역시" ...
#  $ CT1_SEX         : num [1:58600] 2 2 2 2 2 2 2 2 2 1 ...
#  $ CT1_AGE         : num [1:58600] 53 51 42 41 55 53 54 58 55 53 ...
#  $ CT1_HTN         : num [1:58600] 1 1 1 1 1 1 1 1 1 1 ...
#  $ CT1_HTNAG       : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...
#  $ CT1_HTNCU       : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...
#  $ CT1_HTNCU1      : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...
#  $ CT1_HTNCUTY     : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...
#  $ CT1_HTNCUTRPM   : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...
#  $ CT1_HTNCUTRDI   : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...
#  $ CT1_HTNCUTREX   : num [1:58600] NA NA NA NA NA NA NA NA NA NA ...


#@ objectname =======
objectname = "NC1_MASTER_C"
filename = paste0(objectname, ".dta")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
assign(filename, read_dta(file.path(path4read, filename))    )
get(filename) %>% str #----
path4write = getwd()
write_rds( get(filename), file.path(path4write, paste0(filename, ".rds", "")), compress = "xz", compression = 9 )

assign(objectname, get(filename) %>% function.dta.rm_attr   )
get(objectname) %>% str #----
write_rds( get(objectname), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                         filename    size       KB       MB          GB
# 1 D:/OneDrive - SNU/[][Rproject]/Rproject_KOGES/NC1_MASTER_C.dta 6998195 6834.175 6.673999 0.006517577
# > assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
# > get(objectname) %>% str #----
# tibble[,296] [8,105 x 296] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID         : chr [1:8105] "NIH20D2000086" "NIH20D2000284" "NIH20D2000329" "NIH20D2000621" ...
#   ..- attr(*, "label")= chr "DIST_ID"
#   ..- attr(*, "format.stata")= chr "%13s"
#  $ NC1_DATA_CLASS  : chr [1:8105] "Q14" "Q02" "Q03" "Q17" ...
#   ..- attr(*, "label")= chr "NC1_DATA_CLASS"
#   ..- attr(*, "format.stata")= chr "%9s"
#  $ NC1_SITE        : num [1:8105] 9 3 1 9 4 4 9 3 2 4 ...
#   ..- attr(*, "label")= chr "NC1_SITE"
#   ..- attr(*, "format.stata")= chr "%10.0g"
#  $ NC1_EDATE       : num [1:8105] 200608 200602 200608 201008 200711 ...
#   ..- attr(*, "label")= chr "NC1_EDATE"
#   ..- attr(*, "format.stata")= chr "%10.0g"
#  $ NC1_SEX         : num [1:8105] 1 1 2 1 2 2 1 2 2 2 ...
#   ..- attr(*, "label")= chr "NC1_SEX"
#   ..- attr(*, "format.stata")= chr "%10.0g"
# > get(objectname) %>% str #----
# tibble[,296] [8,105 x 296] (S3: tbl_df/tbl/data.frame)
#  $ DIST_ID         : chr [1:8105] "NIH20D2000086" "NIH20D2000284" "NIH20D2000329" "NIH20D2000621" ...
#  $ NC1_DATA_CLASS  : chr [1:8105] "Q14" "Q02" "Q03" "Q17" ...
#  $ NC1_SITE        : num [1:8105] 9 3 1 9 4 4 9 3 2 4 ...
#  $ NC1_EDATE       : num [1:8105] 200608 200602 200608 201008 200711 ...
#  $ NC1_SEX         : num [1:8105] 1 1 2 1 2 2 1 2 2 2 ...
#  $ NC1_AGE         : num [1:8105] 46 72 72 64 47 47 56 72 49 54 ...
#  $ NC1_HTN         : num [1:8105] 1 1 2 2 1 1 1 1 1 1 ...
#  $ NC1_HTNAG       : num [1:8105] NA NA 50 54 NA NA NA NA NA NA ...
#  $ NC1_HTNCU       : num [1:8105] NA NA 2 2 NA NA NA NA NA NA ...
#  $ NC1_HTNCUTRPM   : num [1:8105] NA NA NA 2 NA NA NA NA NA NA ...
#  $ NC1_HTNCUTRDI   : num [1:8105] NA NA NA 1 NA NA NA NA NA NA ...
#  $ NC1_HTNCUTREX   : num [1:8105] NA NA NA 1 NA NA NA NA NA NA ...
#  $ NC1_HTN_CA1_1   : num [1:8105] NA NA 1 NA NA NA NA NA NA NA ...
#  $ NC1_HTN_CA2_1   : num [1:8105] NA NA 1 NA NA NA NA NA NA NA ...
#  $ NC1_HTN_CA3_1   : num [1:8105] NA NA 1 NA NA NA NA NA NA NA ...
#  $ NC1_HTN_CA4_1   : num [1:8105] NA NA 2 NA NA NA NA NA NA NA ...
#  $ NC1_HTN_ME2     : num [1:8105] NA NA 2 NA NA NA NA NA NA NA ...




#@ end -----
# > dir() %>% str_subset(".dta$") %>% str_replace(".dta$", "") %>% dput #----
# c("AS1_MASTER_C", "CT1_MASTER_C", "NC1_MASTER_C")

#@ list_MASTER_C =========
list_MASTER_C = list()
list_MASTER_C$AS1_MASTER_C = AS1_MASTER_C
list_MASTER_C$CT1_MASTER_C = CT1_MASTER_C
list_MASTER_C$NC1_MASTER_C = NC1_MASTER_C

objectname = "list_MASTER_C"
path4write = getwd()
write_rds( get(objectname), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )

