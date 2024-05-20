# dir() read_rds(filenames2read).r

library(tidyverse)
path4read = getwd()
path4write = getwd()
path4read |> dput() #----
path4write |> dput() #----


filenames2read = dir() |> str_subset("\\.sas7bdat\\.rds(\\.xz)?$")
filenames2read |> dput() #----
# > filenames2read |> dput() #----
# c("temp1.sas7bdat.rds.xz", "temp10.sas7bdat.rds.xz", "temp11.sas7bdat.rds.xz",
# "temp2.sas7bdat.rds.xz", "temp3.sas7bdat.rds.xz", "temp4.sas7bdat.rds.xz",
# "temp5.sas7bdat.rds.xz", "temp6.sas7bdat.rds.xz", "temp7.sas7bdat.rds.xz",
# "temp8.sas7bdat.rds.xz", "temp9.sas7bdat.rds.xz")


library(tidyverse)
getwd() |> dput() #----

path4read = getwd()
path4write = getwd()
path4read |> dput()
path4write |> dput()

# tribble_paste = datapasta::tribble_paste
# https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.dev.r
load(url("https://github.com/mkim0710/tidystat/raw/master/f_df.t.tribble_construct.RData"))
# attach(env.custom)

# regex4filename = "sas7bdat(.xz)?$"
regex4filename = "sas7bdat.rds(.xz)?$"
env.custom$f_path.size_files(path4read = path4read, regex4filename = regex4filename)
filenames = list.files(path4read) %>% grep(regex4filename, ., value = T) 




# for (i1 in filenames2read) {
#     t0 = Sys.time()
#     i2 = i1 |> str_replace_all("\\.xz$", "") |> str_replace_all("\\.rds$", "")
#     print(paste0("i2", " = ", i2))
#     assign(
#         i2
#         , read_rds(file.path(path4read, i1))
#     )
#     print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
# }
# # [1] "i2 = temp1.sas7bdat"
# # [1] "Sys.time() - t0 = 3.67798209190369"
# # [1] "i2 = temp10.sas7bdat"
# # [1] "Sys.time() - t0 = 0.610733985900879"
# # [1] "i2 = temp2.sas7bdat"
# # [1] "Sys.time() - t0 = 3.6048948764801"
# # [1] "i2 = temp3.sas7bdat"
# # [1] "Sys.time() - t0 = 4.00316715240479"
# # [1] "i2 = temp4.sas7bdat"
# # [1] "Sys.time() - t0 = 4.07581996917725"
# # [1] "i2 = temp5.sas7bdat"
# # [1] "Sys.time() - t0 = 4.23600006103516"
# # [1] "i2 = temp6.sas7bdat"
# # [1] "Sys.time() - t0 = 0.867064952850342"
# # [1] "i2 = temp7.sas7bdat"
# # [1] "Sys.time() - t0 = 0.628432989120483"
# # [1] "i2 = temp8.sas7bdat"
# # [1] "Sys.time() - t0 = 0.702861070632935"
# # [1] "i2 = temp9.sas7bdat"
# # [1] "Sys.time() - t0 = 0.713214874267578"


for (i1 in filenames2read) {
    i2 = i1 |> str_replace_all("\\.xz$", "") |> str_replace_all("\\.rds$", "")
    print(paste0("i2", " = ", i2))
    rm(list = i2, envir=.GlobalEnv)
}


#@ list.sas7bdat =====
list.sas7bdat = list()
for (i1 in filenames2read) {
    t0 = Sys.time()
    i2 = i1 |> str_replace_all("\\.xz$", "") |> str_replace_all("\\.rds$", "") |> str_replace_all("\\.sas7bdat$", "")
    print(paste0("i2", " = ", i2))
    list.sas7bdat[[i2]] = read_rds(file.path(path4read, i1))
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
}


list.sas7bdat |> str(max.level = 1) #----
# > list.sas7bdat |> str(max.level = 1) #----
# List of 10
#  $ temp1 : tibble [264,777 x 75] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp10: tibble [38,113 x 103] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp2 : tibble [264,777 x 76] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp3 : tibble [264,777 x 77] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp4 : tibble [264,777 x 88] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp5 : tibble [264,777 x 92] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp6 : tibble [53,122 x 93] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp7 : tibble [40,562 x 93] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp8 : tibble [38,113 x 93] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "                                "
#  $ temp9 : tibble [38,113 x 96] (S3: tbl_df/tbl/data.frame)
#   ..- attr(*, "label")= chr "      



#@ end ----
objectname = "list.sas7bdat"
path4write = getwd()
write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds","")), compress="xz", compression=9 )
