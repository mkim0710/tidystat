# function.list.files.file.info.dev.r

library(tidyverse)
getwd() |> dput()
# > getwd() |> dput()
# "../../[[[[SASproject]]]]/SAS_NHIS_HEALS"
path4read = getwd()
path4write = getwd()
path4read |> dput()
path4write |> dput()

# tribble_paste = datapasta::tribble_paste
# https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.dev.r
load(url("https://github.com/mkim0710/tidystat/raw/master/f_df.t.tribble_construct.RData"))
# attach(env1)

regex4filename = "\\.sas7bdat\\.rds(\\.xz)?$"
env1$f_path.size_files(path4read = path4read, regex4filename = regex4filename)
filenames = list.files(path4read) %>% grep(regex4filename, ., value = T) 







nchar(path4read)
substr(path4read, nchar(path4read), nchar(path4read))
substr(path4read, nchar(path4read), nchar(path4read)) == "/"
ifelse(substr(path4read, nchar(path4read), nchar(path4read)) == "/", path4read, paste0(path4read, "/"))
# > ifelse(substr(path4read, nchar(path4read), nchar(path4read)) == "/", path4read, paste0(path4read, "/"))
# [1] "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/"
path4read %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
# > path4read %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
# [1] "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/"


# path4read = "../data/"
# path4write = "../data/"
path4read = "../../[[[[SASproject]]]]/SAS_NHIS_HEALS"
path4write = "../../[[[[Rproject]]]]/Rproject_NHIS_HEALS"
path4read = path4read %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
path4write = path4write %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
path4read |> dput()
path4write |> dput()
# > path4read |> dput()
# "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/"
# > path4write |> dput()
# "../../[[[[Rproject]]]]/Rproject_NHIS_HEALS/"


#@ filenames = c( ======
filenames = c(
    list.files(path4read) %>% grep(".sas7bdat$",. , value = T)
    ,  list.files(path4read) %>% grep(".sas7bdat.rds$|.sas7bdat.rda$",. , value = T)
)
filenames |> dput() #----

tribble_paste = datapasta::tribble_paste
filenames %>% {file.info(file.path(path4read,.))} %>% tribble_paste #----
filenames %>% {file.info(file.path(path4read,.))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
# > filenames |> dput() #----
# c("nhis_heals_gjperson_id.sas7bdat", "nhis_heals_gy20_t1person_id.sas7bdat", 
# "nhis_heals_gy30_t3person_id_hira.sas7bdat", "nhis_heals_gy40_t1person_id.sas7bdat", 
# "nhis_heals_jk.sas7bdat")
# > filenames %>% {file.info(paste0(path4read, .))} |> dput() #----
# structure(list(size = c(491192320, 12380667904, 29939400704, 
# 18363383808, 306774016), isdir = c(FALSE, FALSE, FALSE, FALSE, 
# FALSE), mode = structure(c(438L, 438L, 438L, 438L, 438L), class = "octmode"), 
#     mtime = structure(c(1526446766, 1525406488, 1527674570, 1524721098, 
#     1524550040), class = c("POSIXct", "POSIXt")), ctime = structure(c(1539710080.44891, 
#     1539709400.85437, 1539709540.79125, 1539709873.93852, 1539710077.04334
#     ), class = c("POSIXct", "POSIXt")), atime = structure(c(1539710080.44891, 
#     1539709400.85437, 1539709540.79125, 1539709873.93852, 1539710077.04334
#     ), class = c("POSIXct", "POSIXt")), exe = c("no", "no", "no", 
#     "no", "no")), class = "data.frame", row.names = c("../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gjperson_id.sas7bdat", 
# "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gy20_t1person_id.sas7bdat", 
# "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gy30_t3person_id_hira.sas7bdat", 
# "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gy40_t1person_id.sas7bdat", 
# "../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_jk.sas7bdat"
# ))
# > filenames %>% {file.info(paste0(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) #----
#                                                                            filename        size       KB         MB         GB
# 1           ../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gjperson_id.sas7bdat   491192320   479680   468.4375  0.4574585
# 2      ../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gy20_t1person_id.sas7bdat 12380667904 12090496 11807.1250 11.5303955
# 3 ../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gy30_t3person_id_hira.sas7bdat 29939400704 29237696 28552.4375 27.8832397
# 4      ../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_gy40_t1person_id.sas7bdat 18363383808 17932992 17512.6875 17.1022339
# 5                    ../../[[[[SASproject]]]]/SAS_NHIS_HEALS/nhis_heals_jk.sas7bdat   306774016   299584   292.5625  0.2857056




#@ end ----

