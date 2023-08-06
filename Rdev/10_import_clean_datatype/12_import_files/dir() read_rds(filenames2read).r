# dir() read_rds(filenames2read).r

library(tidyverse)
path4read = getwd()
path4write = getwd()
path4read %>% dput #----
path4write %>% dput #----


filenames2read = dir() %>% str_subset("sas7bdat.rds(.xz)?$")
filenames2read %>% dput #----
# > filenames2read %>% dput #----
# c("temp1.sas7bdat.rds.xz", "temp10.sas7bdat.rds.xz", "temp11.sas7bdat.rds.xz",
# "temp2.sas7bdat.rds.xz", "temp3.sas7bdat.rds.xz", "temp4.sas7bdat.rds.xz",
# "temp5.sas7bdat.rds.xz", "temp6.sas7bdat.rds.xz", "temp7.sas7bdat.rds.xz",
# "temp8.sas7bdat.rds.xz", "temp9.sas7bdat.rds.xz")


tribble_paste = datapasta::tribble_paste
filenames2read %>% {file.info(file.path(path4read,.))} %>% tribble_paste #----
filenames2read %>% {file.info(file.path(path4read,.))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
# > filenames2read %>% {file.info(file.path(path4read,.))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
#                                                                                  filename    size      KB   MB   GB
# 1   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp1.sas7bdat.rds.xz 5354000 5228.52 5.11 0.00
# 2  D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp10.sas7bdat.rds.xz 1188128 1160.28 1.13 0.00
# 3  D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp11.sas7bdat.rds.xz 1254748 1225.34 1.20 0.00
# 4   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp2.sas7bdat.rds.xz 5451568 5323.80 5.20 0.01
# 5   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp3.sas7bdat.rds.xz 5509304 5380.18 5.25 0.01
# 6   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp4.sas7bdat.rds.xz 6369804 6220.51 6.07 0.01
# 7   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp5.sas7bdat.rds.xz 6415260 6264.90 6.12 0.01
# 8   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp6.sas7bdat.rds.xz 1501596 1466.40 1.43 0.00
# 9   D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp7.sas7bdat.rds.xz 1099408 1073.64 1.05 0.00
# 10  D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp8.sas7bdat.rds.xz 1027420 1003.34 0.98 0.00
# 11  D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215_KHJ/temp9.sas7bdat.rds.xz 1061384 1036.51 1.01 0.00


for (i1 in filenames2read) {
    t0 = Sys.time()
    i2 = i1 %>% str_replace_all("\\.xz$", "") %>% str_replace_all("\\.rds$", "")
    print(paste0("i2", " = ", i2))
    assign(
        i2
        , read_rds(file.path(path4read, i1))
    )
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
}
# [1] "i2 = temp1.sas7bdat"
# [1] "Sys.time() - t0 = 3.67798209190369"
# [1] "i2 = temp10.sas7bdat"
# [1] "Sys.time() - t0 = 0.610733985900879"
# [1] "i2 = temp2.sas7bdat"
# [1] "Sys.time() - t0 = 3.6048948764801"
# [1] "i2 = temp3.sas7bdat"
# [1] "Sys.time() - t0 = 4.00316715240479"
# [1] "i2 = temp4.sas7bdat"
# [1] "Sys.time() - t0 = 4.07581996917725"
# [1] "i2 = temp5.sas7bdat"
# [1] "Sys.time() - t0 = 4.23600006103516"
# [1] "i2 = temp6.sas7bdat"
# [1] "Sys.time() - t0 = 0.867064952850342"
# [1] "i2 = temp7.sas7bdat"
# [1] "Sys.time() - t0 = 0.628432989120483"
# [1] "i2 = temp8.sas7bdat"
# [1] "Sys.time() - t0 = 0.702861070632935"
# [1] "i2 = temp9.sas7bdat"
# [1] "Sys.time() - t0 = 0.713214874267578"



#@ end ----
