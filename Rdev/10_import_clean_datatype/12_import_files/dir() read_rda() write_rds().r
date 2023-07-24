# dir() read_rda() write_rds().r

# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/objectname.write_rds.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.write_rds.xz.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_files/dir()%20read_dta()%20write_rds().r

library(tidyverse)


getwd()
path4read = getwd()
path4write = getwd()
?dir
dir() %>% str #----
dir() %>% str_subset(".rda$") %>% dput #----
dir() %>% str_subset(".rda$") %>% str_replace(".rda$", "") %>% dput #----
# > dir() %>% str #----
#  chr [1:224] "-PC189378.Rhistory" "[Codes] Rproject_KNHIS - Shortcut.lnk" "02ID" ...
# > dir() %>% str_subset(".rda$") %>% dput #----
# c("KEY_SEQ.JK_GJ596284.rda", "KNHIS_feature.list.rda", "KNHIS_PERSON_ID.list.rda", 
# "NHID_GJ_0213.bind_rows.factor.rda", "NHID_GJ_0213.bind_rows.integer.rda", 
# "NHID_GJ_0213.bind_rows.rda", "NHID_GJ_0213.list.rda", "NHID_GY20_0213.bind_rows(except.billing).rda", 

# objectNames = dir() %>% str_subset(".rda$") %>% str_replace(".rda$", "")
# objectNames %>% dput #----
# # > objectNames %>% dput #----
# # > objectNames %>% dput #----
# c("KEY_SEQ.JK_GJ596284", "KNHIS_feature.list", "KNHIS_PERSON_ID.list", 
# "NHID_GJ_0213.bind_rows.factor", "NHID_GJ_0213.bind_rows.integer", 
# "NHID_GJ_0213.bind_rows", "NHID_GJ_0213.list", "NHID_GY20_0213.bind_rows(except.billing)", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_sub_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.DM", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_sub_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG.FastingGlucose", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.GNL_NM_CD4.JK_GJ", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.GNL_NM_CD4", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK.sub_chapter -void(icd10cm2016)", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.Date", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.factor", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean", "NHID_GY20_0213.bind_rows.12478", 
# "NHID_GY20_0213.bind_rows.factor(except.billing)", "NHID_GY20_0213.bind_rows.factor.12478", 
# "NHID_GY20_0213.bind_rows.FORM_CD02.factor(except.billing)", 
# "NHID_GY20_0213.bind_rows.FORM_CD02.ICDclean.Date.by.PERSON_ID.FORM02.ICD_MAINSUB.I21I22.I200", 
# "NHID_GY20_0213.bind_rows.FORM_CD02.ICDclean.Date", "NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ", 
# "NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ.RECU_FR_DT", "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char(incl SICK_SYM)", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin.2084", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG", 
# "NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows(16789)", 
# "NHID_GY60_0213.bind_rows.GNL_NM_CD4(incl GNL_NM_CD)", "NHID_GY60_0213.bind_rows.GNL_NM_CD4.Metformin", 
# "NHID_GY60_0213.bind_rows.GNL_NM_CD4", "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT(16789)", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4(incl Dose)", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4(incl Dose, KEY_SEQ)", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4(incl Dose, KEY_SEQ, GNL_NM_CD)", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin.by.PERSON_ID", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4")



objectNames = dir() %>% str_subset("[A-z]+.rda$") %>% str_replace(".rda$", "")
objectNames %>% dput #----
# > objectNames %>% dput #----
# c("NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_sub_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.DM", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_sub_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG.FastingGlucose", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.GNL_NM_CD4.JK_GJ", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.Date", "NHID_GY20_0213.bind_rows.12478.ICDclean.factor", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.Date", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.factor", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter", 
# "NHID_GY20_0213.bind_rows.12478.ICDclean", "NHID_GY20_0213.bind_rows.FORM_CD02.ICDclean.Date", 
# "NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ", "NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ.RECU_FR_DT", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose", 
# "NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG", 
# "NHID_GY40_0213.bind_rows.factor", "NHID_GY60_0213.bind_rows.GNL_NM_CD4.Metformin", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin.by.PERSON_ID", 
# "NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin"
# )

# objectNames = c("KEY_SEQ.JK_GJ596284", "KNHIS_feature.list", "KNHIS_PERSON_ID.list")
# for (objectname in objectNames) {
#     t0 = Sys.time()
#     load(paste0(objectname, ".rda"))
#     print(Sys.time() - t0)
#     write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds")) )
#     print(Sys.time() - t0)
#     system(paste0('xz --keep -9 --threads=10 "', objectname, '.rds', '"'))
#     print(Sys.time() - t0)
#     rm(objectname)
#     # gc()
# }
# gc()
# # Time difference of 20.31215 secs
# # Time difference of 29.5762 secs
# # Time difference of 3.052661 mins
# # Time difference of 0.006704092 secs
# # Time difference of 0.01102901 secs
# # Time difference of 0.1338661 secs
# # Time difference of 0.471457 secs
# # Time difference of 0.6017461 secs
# # Time difference of 52.2024 secs
# # > gc()
# #              used    (Mb) gc trigger    (Mb)   max used    (Mb)
# # Ncells   76471660  4084.1  168667425  9007.9   76712295  4096.9
# # Vcells 2494704893 19033.1 3947392883 30116.3 2938604823 22419.8



# [1] "NHID_GJ_0213.bind_rows.factor"
# Time difference of 2.133658 secs
# Time difference of 2.856897 secs
# /usr/bin/xz: NHID_GJ_0213.bind_rows.factor.rds.xz: File exists
# Time difference of 2.971729 secs
# [1] "NHID_GJ_0213.bind_rows.integer"
# Time difference of 1.430483 secs
# Time difference of 2.083498 secs
# Time difference of 1.254124 mins
# [1] "NHID_GJ_0213.bind_rows"
# Time difference of 14.01131 secs
# Time difference of 23.55678 secs
# Time difference of 2.038508 mins
# [1] "NHID_GJ_0213.list"
# Time difference of 11.20584 secs
# Time difference of 19.22565 secs
# Time difference of 1.308582 mins
# [1] "NHID_GY20_0213.bind_rows(except.billing)"
# Time difference of 6.813748 mins
# Error in NHID_GY20_0213.bind_rows(except.billing) : 
#   could not find function "NHID_GY20_0213.bind_rows"


# load("D:/OneDrive - SNU/[][Rproject]/Rproject_KNHIS.bind_rows/NHID_GY20_0213.bind_rows(except.billing).rda")


objectname = "NHID_GY20_0213.bind_rows"
path4write = getwd()
t0 = Sys.time()
save( list = objectname, file = file.path(path4write, paste0(objectname, ".rda", "")), compress = "xz", compression_level = 9 )
print(Sys.time() - t0)
# > objectname = "NHID_GY20_0213.bind_rows"
# > path4write = getwd()
# > t0 = Sys.time()
# > save( list = objectname, file = file.path(path4write, paste0(objectname, ".rda", "")), compress = "xz", compression_level = 9 )
# > print(Sys.time() - t0)
# Time difference of 1.84348 hours


objectNames = dir() %>% str_subset("[A-z]+.rda$") %>% str_replace(".rda$", "")
for (objectname in objectNames) {
    # print(objectname)
    # objectname %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
    objectname %>% {file.info(paste0(., ".rda"))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
    t0 = Sys.time()
    load(paste0(objectname, ".rda"))
    print(Sys.time() - t0)
    write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds")) )
    print(Sys.time() - t0)
    system(paste0('xz --keep -9 --threads=10 "', objectname, '.rds', '"'))
    print(Sys.time() - t0)
    objectname %>% {file.info(paste0(., ".rds.xz"))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----
    rm(objectname)
    gc()
}
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_chapter.rda 116257880 113533.1 110.8722 0.1082736
# Time difference of 2.832696 secs
# Time difference of 3.882869 secs
# Time difference of 2.32989 mins
#                                                                                    filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_chapter.rds.xz 64398992 62889.64 61.41566 0.05997624
#                                                                                     filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_sub_chapter.rda 222049379 216845.1 211.7628 0.2067996
# Time difference of 4.160479 secs
# Time difference of 7.060436 secs
# Time difference of 3.006798 mins
#                                                                                        filename      size     KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK.ICD10_range_sub_chapter.rds.xz 120245280 117427 114.6748 0.1119871
#                                                                      filename    size       KB       MB          GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.DM.rda 4422638 4318.982 4.217756 0.004118903
# Time difference of 0.6378438 secs
# Time difference of 0.8115439 secs
# Time difference of 6.194962 secs
#                                                                         filename    size       KB       MB          GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.DM.rds.xz 1981004 1934.574 1.889233 0.001844954
#                                                                                                        filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_chapter.rda 67504259 65922.13 64.37708 0.06286824
# Time difference of 2.545825 secs
# Time difference of 3.722437 secs
# Time difference of 1.262128 mins
#                                                                                                           filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_chapter.rds.xz 37731764 36847.43 35.98381 0.03514044
#                                                                                                            filename      size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_sub_chapter.rda 102170957 99776.33 97.43782 0.09515412
# Time difference of 3.346 secs
# Time difference of 4.98306 secs
# Time difference of 2.199379 mins
#                                                                                                               filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.ge2.by.PERSON_ID.ICD10_range_sub_chapter.rds.xz 57724596 56371.68 55.05046 0.05376022
#                                                                                         filename    size       KB       MB          GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG.FastingGlucose.rda 3211707 3136.433 3.062922 0.002991135
# Time difference of 0.2429481 secs
# Time difference of 0.3248169 secs
# Time difference of 6.928708 secs
#                                                                                            filename    size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG.FastingGlucose.rds.xz 1710632 1670.539 1.631386 0.00159315
#                                                                          filename    size       KB       MB          GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG.rda 4647108 4538.191 4.431828 0.004327957
# Time difference of 0.6331911 secs
# Time difference of 0.8213511 secs
# Time difference of 6.560578 secs
#                                                                             filename    size       KB       MB          GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.hyperG.rds.xz 2096880 2047.734 1.999741 0.001952872
#                                                                   filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.rda 305666887 298502.8 291.5067 0.2846745
# Time difference of 4.53937 secs
# Time difference of 6.868153 secs
# Time difference of 3.708741 mins
#                                                                      filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.by.PERSON_ID.MAIN_SICK_3char.rds.xz 165368520 161492.7 157.7077 0.1540114
#                                                                                                            filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.GNL_NM_CD4.JK_GJ.rda 54609050 53329.15 52.07925 0.05085864
# Time difference of 1.487566 secs
# Time difference of 2.48191 secs
# Time difference of 1.020816 mins
#                                                                                                               filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.GNL_NM_CD4.JK_GJ.rds.xz 31858112 31111.44 30.38226 0.02967018
#                                                                                           filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.rda 12526611 12233.02 11.94631 0.01166632
# Time difference of 0.9229429 secs
# Time difference of 1.263076 secs
# Time difference of 24.03098 secs
#                                                                                              filename    size       KB       MB          GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.Date.by.PERSON_ID.Exclusion.ICD_MAINSUB.R73.SICK_SYM.rds.xz 6046124 5904.418 5.766033 0.005630892
#                                           filename       size      KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.Date.rda 1174094967 1146577 1119.704 1.093461
# Time difference of 48.73438 secs
# Time difference of 1.320729 mins
# Time difference of 7.889601 mins
#                                              filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.Date.rds.xz 565815496 552554.2 539.6037 0.5269567
#                                             filename       size      KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.factor.rda 1161757610 1134529 1107.938 1.081971
# Time difference of 45.09208 secs
# Time difference of 1.166729 mins
# Time difference of 7.214737 mins
#                                                filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.factor.rds.xz 562639060 549452.2 536.5744 0.5239985
#                                                                           filename       size      KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.Date.rda 1696073553 1656322 1617.502 1.579592
# Time difference of 55.42304 secs
# Time difference of 1.472817 mins
# Time difference of 12.59593 mins
#                                                                              filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.Date.rds.xz 922899756 901269.3 880.1458 0.8595174
#                                                                             filename       size      KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.factor.rda 1683759138 1644296 1605.758 1.568123
# Time difference of 52.34154 secs
# Time difference of 1.373749 mins
# Time difference of 12.74245 mins
#                                                                                filename      size       KB       MB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.factor.rds.xz 919781604 898224.2 877.1721
#          GB
# 1 0.8566134
#                                                                      filename       size      KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.rda 1789776527 1747829 1706.864 1.666859
# Time difference of 3.615827 mins
# Time difference of 5.966324 mins
# Time difference of 23.07327 mins
#                                                                         filename       size      KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.MAIN_SUB_SICK_3char.sub_chapter.rds.xz 1135509028 1108896 1082.906 1.057525
#                                      filename       size      KB       MB      GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.rda 1145027527 1118191 1091.983 1.06639
# Time difference of 2.069918 mins
# Time difference of 3.169826 mins
# Time difference of 14.84639 mins
#                                         filename      size     KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.12478.ICDclean.rds.xz 629639200 614882 600.4707 0.5863972
#                                               filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.FORM_CD02.ICDclean.Date.rda 34759003 33944.34 33.14877 0.03237184
# Time difference of 1.515527 secs
# Time difference of 2.065643 secs
# Time difference of 49.64241 secs
#                                                  filename     size       KB       MB         GB
# 1 NHID_GY20_0213.bind_rows.FORM_CD02.ICDclean.Date.rds.xz 20513004 20032.23 19.56273 0.01910422
#                                         filename      size     KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ.rda 751403982 733793 716.5947 0.6997995
# Time difference of 36.28071 secs
# Time difference of 55.53007 secs
# Time difference of 4.15979 mins
#                                            filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ.rds.xz 296661920 289708.9 282.9189 0.2762879
#                                                    filename      size       KB       MB        GB
# 1 NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ.RECU_FR_DT.rda 921990600 900381.4 879.2788 0.8586707
# Time difference of 39.05803 secs
# Time difference of 59.94792 secs
# Time difference of 6.01172 mins
#                                                       filename      size       KB       MB       GB
# 1 NHID_GY20_0213.bind_rows.PERSON_ID.KEY_SEQ.RECU_FR_DT.rds.xz 390328796 381180.5 372.2465 0.363522
#                                                                                                    filename    size
# 1 NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin.rda 6271827
#         KB      MB          GB
# 1 6124.831 5.98128 0.005841094
# Time difference of 0.3772979 secs
# Time difference of 0.49529 secs
# Time difference of 14.02652 secs
#                                                                                                       filename    size
# 1 NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.Metformin.rds.xz 3553092
#         KB       MB          GB
# 1 3469.816 3.388493 0.003309075
#                                                                                          filename    size       KB       MB
# 1 NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.rda 5032983 4915.022 4.799827
#            GB
# 1 0.004687331
# Time difference of 0.4528189 secs
# Time difference of 0.6461108 secs
# Time difference of 11.53339 secs
#                                                                                             filename    size      KB
# 1 NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.FastingGlucose.rds.xz 2746624 2682.25
#         MB          GB
# 1 2.619385 0.002557993
#                                                                           filename    size       KB       MB          GB
# 1 NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.rda 6336632 6188.117 6.043083 0.005901448
# Time difference of 0.6977921 secs
# Time difference of 0.8730671 secs
# Time difference of 9.637238 secs
#                                                                              filename    size       KB       MB          GB
# 1 NHID_GY40_0213.bind_rows.factor.PERSON_ID.SICK_SYM_3char.by.PERSON_ID.hyperG.rds.xz 2952652 2883.449 2.815868 0.002749871
#                              filename       size      KB       MB       GB
# 1 NHID_GY40_0213.bind_rows.factor.rda 1094107250 1068464 1043.422 1.018967
# Time difference of 46.05166 secs
# Time difference of 1.244146 mins
# Time difference of 7.300154 mins
#                                 filename      size       KB       MB        GB
# 1 NHID_GY40_0213.bind_rows.factor.rds.xz 436227408 426003.3 416.0189 0.4062684
#                                            filename    size       KB       MB         GB
# 1 NHID_GY60_0213.bind_rows.GNL_NM_CD4.Metformin.rda 9521696 9298.531 9.080597 0.00886777
# Time difference of 0.388473 secs
# Time difference of 0.669426 secs
# Time difference of 12.51483 secs
#                                               filename    size       KB      MB          GB
# 1 NHID_GY60_0213.bind_rows.GNL_NM_CD4.Metformin.rds.xz 4814872 4702.023 4.59182 0.004484199
#                                                                              filename    size       KB       MB          GB
# 1 NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin.by.PERSON_ID.rda 4088950 3993.115 3.899527 0.003808131
# Time difference of 0.704529 secs
# Time difference of 0.8706911 secs
# Time difference of 6.483361 secs
#                                                                                 filename    size       KB      MB
# 1 NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin.by.PERSON_ID.rds.xz 1811688 1769.227 1.72776
#            GB
# 1 0.001687266
#                                                                 filename     size       KB      MB         GB
# 1 NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin.rda 21925934 21412.04 20.9102 0.02042012
# Time difference of 2.622178 secs
# Time difference of 3.81331 secs
# Time difference of 49.38688 secs
#                                                                    filename     size       KB       MB         GB
# 1 NHID_GY60_0213.bind_rows.PERSON_ID.RECU_FR_DT.GNL_NM_CD4.Metformin.rds.xz 12736792 12438.27 12.14675 0.01186206


#@ end -----

# objectname = ""
# path4write = getwd()
# write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds", "")), compress = "xz", compression = 9 )

