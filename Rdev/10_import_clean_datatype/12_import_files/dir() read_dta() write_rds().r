# dir() read_dta() write_rds().r

# https://www.marsja.se/how-to-read-and-write-stata-dta-files-in-r-with-haven/
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/objectname.write_rds.source.r

library(tidyverse)
library(haven)
?read_dta


getwd()
path4read = getwd()
?dir
dir() %>% str #----
dir() %>% str_subset(".dta") %>% dput #----
dir() %>% str_subset(".dta") %>% str_replace(".dta$", "") %>% dput #----
# > dir() %>% str #----
#  chr [1:5] "AS1_MASTER_C.dta" "CT1_MASTER_C.dta" "FM Cleaning pheno" "NC1_MASTER_C.dta" "Rproject_KOGES.Rproj"
# > dir() %>% str_subset(".dta") %>% dput #----
# c("AS1_MASTER_C.dta", "CT1_MASTER_C.dta", "NC1_MASTER_C.dta")
# > dir() %>% str_subset(".dta") %>% str_replace(".dta$", "") %>% dput #----
# c("AS1_MASTER_C", "CT1_MASTER_C", "NC1_MASTER_C")


#@ objectname =======
objectname = "AS1_MASTER_C"
filename = paste0(objectname, ".dta")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
eval(parse(text = objectname)) %>% str #----
path4write = getwd()
write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                         filename    size       KB       MB          GB
# 1 D:/OneDrive - SNU/[][Rproject]/Rproject_KOGES/AS1_MASTER_C.dta 8083711 7894.249 7.709228 0.007528543
# > eval(parse(text = objectname)) %>% str #----
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


#@ objectname =======
objectname = "CT1_MASTER_C"
filename = paste0(objectname, ".dta")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
eval(parse(text = objectname)) %>% str #----
path4write = getwd()
write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                         filename     size       KB       MB         GB
# 1 D:/OneDrive - SNU/[][Rproject]/Rproject_KOGES/CT1_MASTER_C.dta 56938475 55603.98 54.30076 0.05302809
# > assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
# > eval(parse(text = objectname)) %>% str #----
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



#@ objectname =======
objectname = "NC1_MASTER_C"
filename = paste0(objectname, ".dta")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
eval(parse(text = objectname)) %>% str #----
path4write = getwd()
write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )
# > filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
#                                                         filename    size       KB       MB          GB
# 1 D:/OneDrive - SNU/[][Rproject]/Rproject_KOGES/NC1_MASTER_C.dta 6998195 6834.175 6.673999 0.006517577
# > assign(objectname, read_dta(file.path(path4read, paste0(objectname, ".dta")))    )
# > eval(parse(text = objectname)) %>% str #----
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




#@ end -----

