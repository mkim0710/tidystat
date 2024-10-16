# dir() read_sas() write_rds().r
# function.list.files.read.write.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/12_import_files/dir()%20read_sas()%20write_rds().r

library(tidyverse)
getwd() |> dput() #----

if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
env1$getwd = getwd()
# env1$path0 = "../../[][Rproject]"
env1$path0db = "D:/OneDrive - SNU/[][SASproject]"
env1$data_base = "KNHIS_HEALS0215"
env1$data_suffix = "_01"
env1$path1db = paste0(env1$path0db, "/", env1$data_base, env1$data_suffix)

env1$path0 = "D:/OneDrive - SNU/[][Rproject]"
env1$project_base = "Rproject_HEALS0215"
# env1$project_suffix = "GJ3"
env1$path1 = paste0(env1$path0, "/", env1$project_base, env1$data_suffix)
# env1$path2 = paste0(env1$path1, "/", env1$project_base, env1$data_suffix, env1$project_suffix)

path4read = env1$path1db
path4write = env1$path1
path4read |> dput() #----
path4write |> dput() #----

# tribble_paste = datapasta::tribble_paste
# https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.dev.r
load(url("https://github.com/mkim0710/tidystat/raw/master/f_df.t.tribble_construct.RData"))
# attach(env1)

# regex4filename = "\\.sas7bdat(\\.xz)?$"
regex4filename = "\\.sas7bdat\\.xz$"
list.files(path4read) %>% grep(regex4filename, ., value = T) |> dput() #----
env1$f_path.size_files(path4read = path4read, regex4filename = regex4filename)

regex4filename = "\\.sas7bdat$"
list.files(path4read) %>% grep(regex4filename, ., value = T) |> dput() #----
env1$f_path.size_files(path4read = path4read, regex4filename = regex4filename)













library(tidyverse)
getwd() |> dput() #----
path4read = "../github_tidystat/data"
path4write = getwd()

# tribble_paste = datapasta::tribble_paste
# https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.dev.r
load(url("https://github.com/mkim0710/tidystat/raw/master/f_df.t.tribble_construct.RData"))
# attach(env1)

# regex4filename = "\\.(rdata|rda|rds)$"
# regex4filename = "\\.rds$"
# regex4filename = "\\.sas7bdat(\\.xz)?$"
regex4filename = "\\.sas7bdat$"
env1$f_path.size_files(path4read = path4read, regex4filename = regex4filename)
filenames = list.files(path4read) %>% grep(regex4filename, ., value = T) 
filenames |> dput() #----




# nhis_heals_jk_d.sas7bdat |> str() #----
# # > nhis_heals_jk_d.sas7bdat |> str() #----
# # tibble [6,933,649 × 13] (S3: tbl_df/tbl/data.frame)
# #  $ STND_Y         : chr [1:6933649] "2002" "2002" "2002" "2002" ...
# #  $ PERSON_ID      : chr [1:6933649] "10000084" "10000158" "10000205" "10000355" ...
# #  $ SEX            : chr [1:6933649] "1" "1" "1" "1" ...
# #   ..- attr(*, "label")= chr "GENDER_CD"
# #   ..- attr(*, "format.sas")= chr "$"
# #  $ AGE            : num [1:6933649] 79 79 79 79 79 79 79 79 79 79 ...
# #   ..- attr(*, "label")= chr "AGE_ID"
# #  $ DTH_MDY        : chr [1:6933649] "" "" "" "" ...
# #   ..- attr(*, "label")= chr "DTH_MDY"
# #   ..- attr(*, "format.sas")= chr "$"
# #  $ DTH_CODE1      : chr [1:6933649] "" "" "" "" ...
# #  $ DTH_CODE2      : chr [1:6933649] "" "" "" "" ...
# #  $ SIDO           : chr [1:6933649] "11" "43" "45" "27" ...
# #  $ IPSN_TYPE_CD   : chr [1:6933649] "1" "6" "5" "1" ...
# #  $ CTRB_PT_TYPE_CD: chr [1:6933649] "8" "9" "3" "10" ...
# #  $ DFAB_GRD_CD    : chr [1:6933649] "0" "0" "0" "0" ...
# #  $ DFAB_PTN_CD    : chr [1:6933649] "0" "0" "0" "0" ...
# #  $ DFAB_REG_YM    : chr [1:6933649] "" "" "" "" ...
# 
# tmp.df = nhis_heals_jk_d.sas7bdat
# for (ii in names(tmp.df)) {
#     attr(tmp.df[[ii]], "format.sas") = NULL
#     if (!is.null(attributes(tmp.df[[ii]])$label)) {
#         if (attributes(tmp.df[[ii]])$label == ii) attributes(tmp.df[[ii]])$label = NULL
#     }
# }
# tmp.df |> str() #----
# # > tmp.df |> str() #----
# # tibble [6,933,649 × 13] (S3: tbl_df/tbl/data.frame)
# #  $ STND_Y         : chr [1:6933649] "2002" "2002" "2002" "2002" ...
# #  $ PERSON_ID      : chr [1:6933649] "10000084" "10000158" "10000205" "10000355" ...
# #  $ SEX            : chr [1:6933649] "1" "1" "1" "1" ...
# #   ..- attr(*, "label")= chr "GENDER_CD"
# #  $ AGE            : num [1:6933649] 79 79 79 79 79 79 79 79 79 79 ...
# #   ..- attr(*, "label")= chr "AGE_ID"
# #  $ DTH_MDY        : chr [1:6933649] "" "" "" "" ...
# #  $ DTH_CODE1      : chr [1:6933649] "" "" "" "" ...
# #  $ DTH_CODE2      : chr [1:6933649] "" "" "" "" ...
# #  $ SIDO           : chr [1:6933649] "11" "43" "45" "27" ...
# #  $ IPSN_TYPE_CD   : chr [1:6933649] "1" "6" "5" "1" ...
# #  $ CTRB_PT_TYPE_CD: chr [1:6933649] "8" "9" "3" "10" ...
# #  $ DFAB_GRD_CD    : chr [1:6933649] "0" "0" "0" "0" ...
# #  $ DFAB_PTN_CD    : chr [1:6933649] "0" "0" "0" "0" ...
# #  $ DFAB_REG_YM    : chr [1:6933649] "" "" "" "" ...









# If the datasets are small : import all into a list ======
fun.read_sas_files2list = function(filenames, path4read) {
    library(tidyverse)
    library(haven)
    list.Sys.time = list()
    list.sas7bdat = list()
    
    for (i in filenames) {
        print(paste0("i", " = ", i))
        t0 = Sys.time()
        #    print(paste0("t0", " = ", t0))
        tmp.df = read_sas(file.path(path4read, i))
        for (ii in names(tmp.df)) {
            attr(tmp.df[[ii]], "format.sas") = NULL
            if (!is.null(attributes(tmp.df[[ii]])$label)) {
                if (attributes(tmp.df[[ii]])$label == ii) attributes(tmp.df[[ii]])$label = NULL
            }
        }
        output_name = i |> str_replace_all("\\.xz$", "") %>% paste0(".rds")
        output_name_simple = i |> str_replace_all("\\.xz$", "") |> str_replace_all("\\.sas7bdat", "")
        # write_rds(tmp.df, path = file.path(path4write, output_name), compress = "none")
        list.sas7bdat[[output_name_simple]] = tmp.df
        rm(tmp.df)
        # gc()
        list.Sys.time[[i]] = Sys.time() - t0
        print(list.Sys.time[[i]])
    }
    # attributes(list.sas7bdat)$list.Sys.time = list.Sys.time
    list.Sys.time |> dput()
    return(list.sas7bdat)
}


list.khj.sas7bdat = 
    c("ad.sas7bdat", "dem.sas7bdat", "dem_med.sas7bdat", "dementia.sas7bdat", 
      "diabetes.sas7bdat", "dm.sas7bdat", "dm_med.sas7bdat", "dth1.sas7bdat", 
      "gj.sas7bdat", "jk1.sas7bdat", "vd.sas7bdat") %>% 
    fun.read_sas_files2list(path4read)
list.khj.sas7bdat |> str(max.level = 1) #----
# > list.khj.sas7bdat |> str(max.level = 1) #----
# List of 11
#  $ ad.sas7bdat.rds      : tibble [25,527 × 3] (S3: tbl_df/tbl/data.frame)
#  $ dem.sas7bdat.rds     : tibble [483,705 × 5] (S3: tbl_df/tbl/data.frame)
#  $ dem_med.sas7bdat.rds : tibble [241,478 × 2] (S3: tbl_df/tbl/data.frame)
#  $ dementia.sas7bdat.rds: tibble [483,705 × 4] (S3: tbl_df/tbl/data.frame)
#  $ diabetes.sas7bdat.rds: tibble [7,354,775 × 4] (S3: tbl_df/tbl/data.frame)
#  $ dm.sas7bdat.rds      : tibble [7,354,775 × 5] (S3: tbl_df/tbl/data.frame)
#  $ dm_med.sas7bdat.rds  : tibble [5,705,947 × 2] (S3: tbl_df/tbl/data.frame)
#  $ dth1.sas7bdat.rds    : tibble [47,518 × 3] (S3: tbl_df/tbl/data.frame)
#  $ gj.sas7bdat.rds      : tibble [264,777 × 69] (S3: tbl_df/tbl/data.frame)
#  $ jk1.sas7bdat.rds     : tibble [128,047 × 5] (S3: tbl_df/tbl/data.frame)
#  $ vd.sas7bdat.rds      : tibble [8,852 × 3] (S3: tbl_df/tbl/data.frame)
#  - attr(*, "list.Sys.time")=List of 11

# If the datasets are very big : import & write_rds & rm one-by-one   ======
fun.read_sas_write_rds1by1 = function(filenames, path4read) {
    library(tidyverse)
    library(haven)
    list.Sys.time = list()
    for (i in filenames) {
        print(paste0("i", " = ", i))
        t0 = Sys.time()
        #    print(paste0("t0", " = ", t0))
        tmp.df = read_sas(file.path(path4read, i))
        for (ii in names(tmp.df)) {
            attr(tmp.df[[ii]], "format.sas") = NULL
            if (!is.null(attributes(tmp.df[[ii]])$label)) {
                if (attributes(tmp.df[[ii]])$label == ii) attributes(tmp.df[[ii]])$label = NULL
            }
        }
        output_name = i |> str_replace_all(".xz$", "") %>% paste0(".rds")
        write_rds(tmp.df, path = file.path(path4write, output_name), compress = "none")
        # rm(tmp.df)
        # gc()
        list.Sys.time[[i]] = Sys.time() - t0
        print(list.Sys.time[[i]])
    }
    return(list.Sys.time)
}
list.Sys.time =
    c("gy20_0207.sas7bdat") %>% 
    fun.read_sas_write_rds1by1(path4read)
list.Sys.time |> str(max.level = 1) #----










# If the datasets are small : import all into a list ======
library(tidyverse)
library(haven)
list.Sys.time = list()
list.sas7bdat = list()
filenames = c("ad.sas7bdat", "dem.sas7bdat", "dem_med.sas7bdat", "dementia.sas7bdat", 
"diabetes.sas7bdat", "dm.sas7bdat", "dm_med.sas7bdat", "dth1.sas7bdat", 
"gj.sas7bdat", "jk1.sas7bdat", "vd.sas7bdat")
for (i in filenames) {
    print(paste0("i", " = ", i))
    t0 = Sys.time()
#    print(paste0("t0", " = ", t0))
    tmp.df = read_sas(file.path(path4read, i))
    for (ii in names(tmp.df)) {
        attr(tmp.df[[ii]], "format.sas") = NULL
        if (!is.null(attributes(tmp.df[[ii]])$label)) {
            if (attributes(tmp.df[[ii]])$label == ii) attributes(tmp.df[[ii]])$label = NULL
        }
    }
    output_name = i |> str_replace_all(".xz$", "") %>% paste0(".rds")
    # write_rds(tmp.df, path = file.path(path4write, output_name), compress = "none")
    list.sas7bdat[[output_name]] = tmp.df
    # rm(tmp.df)
    # gc()
    list.Sys.time[[i]] = Sys.time() - t0
    print(list.Sys.time[[i]])
}
list.Sys.time |> dput() #----
list.sas7bdat |> str(max.level = 1) #----



# If the datasets are very big : import & write_rds & rm one-by-one   ======
library(tidyverse)
library(haven)
list.Sys.time = list()
filenames = c("nhis_heals_gj_d.sas7bdat", "nhis_heals_jk_d.sas7bdat")
for (i in filenames) {
    print(paste0("i", " = ", i))
    t0 = Sys.time()
#    print(paste0("t0", " = ", t0))
    tmp.df = read_sas(file.path(path4read, i))
    for (ii in names(tmp.df)) {
        attr(tmp.df[[ii]], "format.sas") = NULL
        if (!is.null(attributes(tmp.df[[ii]])$label)) {
            if (attributes(tmp.df[[ii]])$label == ii) attributes(tmp.df[[ii]])$label = NULL
        }
    }
    output_name = i |> str_replace_all(".xz$", "") %>% paste0(".rds")
    write_rds(tmp.df, path = file.path(path4write, output_name), compress = "none")
    # rm(tmp.df)
    # gc()
    list.Sys.time[[i]] = Sys.time() - t0
    print(list.Sys.time[[i]])
}
list.Sys.time |> dput() #----





#@ filenames =========== -old
library(tidyverse)
filenames = c("nhis_heals_gj_d.sas7bdat", "nhis_heals_jk_d.sas7bdat")
library(haven)
out.list = filenames %>% map(function(i) {
    print(paste0("i", " = ", i))
    t0 = Sys.time()
#    print(paste0("t0", " = ", t0))
    tmp.df = read_sas(file.path(path4read, i))
    for (ii in names(tmp.df)) {
        attr(tmp.df[[ii]], "format.sas") = NULL
        if (!is.null(attributes(tmp.df[[ii]])$label)) {
            if (attributes(tmp.df[[ii]])$label == ii) attributes(tmp.df[[ii]])$label = NULL
        }
    }
    output_name = i |> str_replace_all(".xz$", "") %>% paste0(".rds")
    write_rds(tmp.df, path = file.path(path4write, output_name), compress = "none")
    rm(tmp.df)
    gc()
    print(Sys.time() - t0)
    Sys.time() - t0
}) %>% set_names(filenames)
out.list |> dput() #----
# [1] "i = nhis_heals_gj_d.sas7bdat"
# [1] "Sys.time() - t0 = 1.54136161406835"
# [1] "i = nhis_heals_jk_d.sas7bdat"
# [1] "Sys.time() - t0 = 45.4658980369568"
# > out.list |> dput() #----
# list(nhis_heals_gj_d.sas7bdat = structure(1.54137681325277, class = "difftime", units = "mins"), 
#     nhis_heals_jk_d.sas7bdat = structure(45.4666619300842, class = "difftime", units = "secs"))









# list.files(path4read) read_sas() write_rds().r =====
library(haven)
?read_sas
path4read = getwd()
path4write = getwd()

filenames = list.files(path4read) %>% grep(".sas7bdat$",. , value = T) 
filenames |> dput() #----

out.list = filenames %>% map(function(i) {
    print(paste0("i", " = ", i))
    t0 = Sys.time()
    # print(paste0("t0", " = ", t0))
    assign(
        i
        , read_sas(file.path(path4read, i))
        , envir = globalenv()
    )
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)

out.list2 = filenames %>% map(function(i) {
    print("i")
    print(i)
    t0 = Sys.time()
    # print(paste0("t0", " = ", t0))
    # write_rds(get(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    write_rds(get(i), path = paste0(path4write, "/", i, ".rds"), compress="gz")
    rm(i)
    gc()
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)














# _r4.sas7bdat _r4_mod.sas7bdat file.info().r =====

library(tidyverse)
getwd() |> dput()
# > getwd() |> dput()
# "X:/mkim/Rproject"
path4read = "//DON/marketscan_users/smacdonald/"
path4write = "//DON/marketscan_users/mkim/"
path4read = path4read %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
path4write = path4write %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
path4read |> dput()
path4write |> dput()


# list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} |> dput() #----
# list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% file.info |> dput() #----
list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% file.info %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
# > list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} |> dput() #----
structure(list(size = c(646184960, 361234432, 9943646208, 5766774784, 
51642368, 3356622848, 1608515584, 1072300032, 4191027200, 719060992, 
26229080064, 15912534016, 2723807232, 7011303424, 2264006656, 
2666528768), isdir = c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
FALSE), mode = structure(c(438L, 438L, 438L, 438L, 438L, 438L, 
438L, 438L, 438L, 438L, 438L, 438L, 438L, 438L, 438L, 438L), class = "octmode"), 
    mtime = structure(c(1520783983.68567, 1520784006.24773, 1520782942.34198, 
    1520784810.99279, 1520878923.72514, 1520781196.50145, 1520784910.14905, 
    1523543812.84618, 1520780970.99686, 1520781010.20596, 1520779815.46885, 
    1520784437.77383, 1520878822.08688, 1520777875.2548, 1520784648.09537, 
    1523543311.46089), class = c("POSIXct", "POSIXt")), ctime = structure(c(1520783983.68567, 
    1520784006.24773, 1520782942.34198, 1520784810.99279, 1520878923.72514, 
    1520781196.50145, 1520784910.14905, 1523543812.84618, 1520780970.99686, 
    1520781010.20596, 1520779815.46885, 1520784437.77383, 1520878822.08688, 
    1520777875.2548, 1520784648.09537, 1523543311.46089), class = c("POSIXct", 
    "POSIXt")), atime = structure(c(1535850186.219, 1535848181.41113, 
    1535851520.16691, 1535850309.49436, 1535849388.78667, 1535855011.82013, 
    1535855276.48891, 1535855218.38574, 1535855036.5062, 1535855031.72319, 
    1535855053.13725, 1535855336.61909, 1535855267.33788, 1535855188.49865, 
    1535855317.06203, 1535855231.93078), class = c("POSIXct", 
    "POSIXt")), exe = c("no", "no", "no", "no", "no", "no", "no", 
    "no", "no", "no", "no", "no", "no", "no", "no", "no")), class = "data.frame", row.names = c("//DON/marketscan_users/smacdonald/infant_pregcohort_d_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_i_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_o_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_o_r4_mod.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_r_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_s_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_s_r4_mod.sas7bdat", 
"//DON/marketscan_users/smacdonald/infant_pregcohort_t_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_d_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_i_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_o_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_o_r4_mod.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_r_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_s_r4.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_s_r4_mod.sas7bdat", 
"//DON/marketscan_users/smacdonald/women_pregcohort_t_r4.sas7bdat"
))
# > list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) #----
#                                                                 filename        size       KB        MB         GB
# 1      //DON/marketscan_users/smacdonald/infant_pregcohort_d_r4.sas7bdat   646184960   631040   616.250  0.6018066
# 2      //DON/marketscan_users/smacdonald/infant_pregcohort_i_r4.sas7bdat   361234432   352768   344.500  0.3364258
# 3      //DON/marketscan_users/smacdonald/infant_pregcohort_o_r4.sas7bdat  9943646208  9710592  9483.000  9.2607422
# 4  //DON/marketscan_users/smacdonald/infant_pregcohort_o_r4_mod.sas7bdat  5766774784  5631616  5499.625  5.3707275
# 5      //DON/marketscan_users/smacdonald/infant_pregcohort_r_r4.sas7bdat    51642368    50432    49.250  0.0480957
# 6      //DON/marketscan_users/smacdonald/infant_pregcohort_s_r4.sas7bdat  3356622848  3277952  3201.125  3.1260986
# 7  //DON/marketscan_users/smacdonald/infant_pregcohort_s_r4_mod.sas7bdat  1608515584  1570816  1534.000  1.4980469
# 8      //DON/marketscan_users/smacdonald/infant_pregcohort_t_r4.sas7bdat  1072300032  1047168  1022.625  0.9986572
# 9       //DON/marketscan_users/smacdonald/women_pregcohort_d_r4.sas7bdat  4191027200  4092800  3996.875  3.9031982
# 10      //DON/marketscan_users/smacdonald/women_pregcohort_i_r4.sas7bdat   719060992   702208   685.750  0.6696777
# 11      //DON/marketscan_users/smacdonald/women_pregcohort_o_r4.sas7bdat 26229080064 25614336 25014.000 24.4277344
# 12  //DON/marketscan_users/smacdonald/women_pregcohort_o_r4_mod.sas7bdat 15912534016 15539584 15175.375 14.8197021
# 13      //DON/marketscan_users/smacdonald/women_pregcohort_r_r4.sas7bdat  2723807232  2659968  2597.625  2.5367432
# 14      //DON/marketscan_users/smacdonald/women_pregcohort_s_r4.sas7bdat  7011303424  6846976  6686.500  6.5297852
# 15  //DON/marketscan_users/smacdonald/women_pregcohort_s_r4_mod.sas7bdat  2264006656  2210944  2159.125  2.1085205
# 16      //DON/marketscan_users/smacdonald/women_pregcohort_t_r4.sas7bdat  2666528768  2604032  2543.000  2.4833984




# list.files(path4read) read_sas() write_rds().r =====

library(haven)
?read_sas
path4read = "/proj/marketscan_users/marketscan/smacdonald/"
path4write = "/proj/marketscan_users/marketscan/mkim/"


filenames = list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T)
filenames |> dput()
# > filenames |> dput()
c("infant_pregcohort_d_r4.sas7bdat", "infant_pregcohort_i_r4.sas7bdat", 
  "infant_pregcohort_o_r4_mod.sas7bdat", "infant_pregcohort_o_r4.sas7bdat", 
  "infant_pregcohort_r_r4.sas7bdat", "infant_pregcohort_s_r4_mod.sas7bdat", 
  "infant_pregcohort_s_r4.sas7bdat", "infant_pregcohort_t_r4.sas7bdat", 
  "women_pregcohort_d_r4.sas7bdat", "women_pregcohort_i_r4.sas7bdat", 
  "women_pregcohort_o_r4_mod.sas7bdat", "women_pregcohort_o_r4.sas7bdat", 
  "women_pregcohort_r_r4.sas7bdat", "women_pregcohort_s_r4_mod.sas7bdat", 
  "women_pregcohort_s_r4.sas7bdat", "women_pregcohort_t_r4.sas7bdat"
)
?write_rds

filenames = "infant_pregcohort_r_r4.sas7bdat"
out.list = filenames %>% map(function(i) {
    print(paste0("i", " = ", i))
    t0 = Sys.time()
#    print(paste0("t0", " = ", t0))
    i2 = i |> str_replace_all(".xz$", "")
    assign(
        i2
        , read_sas(file.path(path4read, i))
    )
    # save(list = i, file = file.path(path4write, i, ".rda"), compress = F)
    # write_rds(!!rlang::sym(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    write_rds(get(i2), path = file.path(path4write, paste0(i2, ".rds")), compress = "none")
    # write_rds(get(i2), path = file.path(path4write, paste0(i2, ".rds")), compress = "none")
    rm(i2)
    gc()
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)
out.list |> dput() #----
# > out.list = filenames %>% map(function(i) {
# +     print("i")
# +     print(i)
# +     t0 = Sys.time()
# +     print("t0")
# +     print(t0)
# +     assign(
# +         i
# +         , read_sas(paste0(path4read, i))
# +     )
# +     write_rds(i, path = file.path(path4write, i))
# +     rm(i)
# +     gc()
# +     print("Sys.time() - t0")
# +     print(Sys.time() - t0)
# +     Sys.time() - t0
# + }) %>% set_names(filenames)
# [1] "i"
# [1] "infant_pregcohort_r_r4.sas7bdat"
# [1] "t0"
# [1] "2018-09-01 20:51:13 EDT"
# [1] "Sys.time() - t0"
# Time difference of 3.642375 secs
# > out.list |> dput()
structure(list(infant_pregcohort_r_r4.sas7bdat = structure(3.64281630516052, units = "secs", class = "difftime")), .Names = "infant_pregcohort_r_r4.sas7bdat")


filenames = list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T)
filenames |> dput()
# > filenames |> dput()
# c("infant_pregcohort_d_r4.sas7bdat", "infant_pregcohort_i_r4.sas7bdat", 
# "infant_pregcohort_o_r4_mod.sas7bdat", "infant_pregcohort_o_r4.sas7bdat", 
# "infant_pregcohort_r_r4.sas7bdat", "infant_pregcohort_s_r4_mod.sas7bdat", 
# "infant_pregcohort_s_r4.sas7bdat", "infant_pregcohort_t_r4.sas7bdat", 
# "women_pregcohort_d_r4.sas7bdat", "women_pregcohort_i_r4.sas7bdat", 
# "women_pregcohort_o_r4_mod.sas7bdat", "women_pregcohort_o_r4.sas7bdat", 
# "women_pregcohort_r_r4.sas7bdat", "women_pregcohort_s_r4_mod.sas7bdat", 
# "women_pregcohort_s_r4.sas7bdat", "women_pregcohort_t_r4.sas7bdat"
# )

out.list = filenames %>% map(function(i) {
    print(paste0("i", " = ", i))
    t0 = Sys.time()
#    print(paste0("t0", " = ", t0))
    i2 = i |> str_replace_all(".xz$", "")
    assign(
        i2
        , read_sas(file.path(path4read, i))
    )
    # save(list = i, file = file.path(path4write, i, ".rda"), compress = F)
    # write_rds(!!rlang::sym(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    write_rds(get(i2), path = file.path(path4write, paste0(i2, ".rds")), compress = "none")
    # write_rds(get(i2), path = file.path(path4write, paste0(i2, ".rds")), compress = "none")
    rm(i2)
    gc()
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)
out.list |> dput() #----
# > filenames |> dput()
# c("infant_pregcohort_d_r4.sas7bdat", "infant_pregcohort_i_r4.sas7bdat", 
# "infant_pregcohort_o_r4_mod.sas7bdat", "infant_pregcohort_o_r4.sas7bdat", 
# "infant_pregcohort_r_r4.sas7bdat", "infant_pregcohort_s_r4_mod.sas7bdat", 
# "infant_pregcohort_s_r4.sas7bdat", "infant_pregcohort_t_r4.sas7bdat", 
# "women_pregcohort_d_r4.sas7bdat", "women_pregcohort_i_r4.sas7bdat", 
# "women_pregcohort_o_r4_mod.sas7bdat", "women_pregcohort_o_r4.sas7bdat", 
# "women_pregcohort_r_r4.sas7bdat", "women_pregcohort_s_r4_mod.sas7bdat", 
# "women_pregcohort_s_r4.sas7bdat", "women_pregcohort_t_r4.sas7bdat"
# )
# > out.list = filenames %>% map(function(i) {
# +     print("i")
# +     print(i)
# +     t0 = Sys.time()
# +     print("t0")
# +     print(t0)
# +     assign(
# +         i
# +         , read_sas(paste0(path4read, i))
# +     )
# +     # save(list = i, file = file.path(path4write, i, ".rda"), compress = F)
# +     # write_rds(!!rlang::sym(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
# +     write_rds(get(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
# +     rm(i)
# +     gc()
# +     print("Sys.time() - t0")
# +     print(Sys.time() - t0)
# +     Sys.time() - t0
# + }) %>% set_names(filenames)
# [1] "i"
# [1] "infant_pregcohort_d_r4.sas7bdat"
# [1] "t0"
# [1] "2018-09-01 21:03:06 EDT"





#@ filename = paste0("mscan_pregcohort_r4.sas7bdat", "", ".rds") ====
filename = paste0("mscan_pregcohort_r4.sas7bdat", "", ".rds")
filename %>% {file.info(paste0(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) #----
t0 = Sys.time()
assign(
    gsub(".rds$", "", filename)
    , readRDS(paste0(path4read, filename))
)
Sys.time() - t0
gsub(".rds$", "", filename) %>% {object.size(get(.))} %>% {c(`bytes` = as.numeric(.), `KB` = as.numeric(.)/2^10, `MB` = as.numeric(.)/2^20, `GB` = as.numeric(.)/2^30)} %>% round(3) %>% format(scientific = FALSE) #----
# > filename = paste0("mscan_pregcohort_r4.sas7bdat", "", ".rds")
# > filename %>% {file.info(paste0(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) #----
#                                                            filename     size       KB       MB         GB
# 1 ../data/data.ID_DATE_DX.distinct/mscan_pregcohort_r4.sas7bdat.rds 72027014 70338.88 68.69031 0.06708038
# > t0 = Sys.time()
# > assign(
# +     gsub(".rds$", "", filename)
# +     , readRDS(paste0(path4read, filename))
# + )
# > Sys.time() - t0
# Time difference of 4.942991 secs
# > gsub(".rds$", "", filename) %>% {object.size(get(.))} %>% {c(`bytes` = as.numeric(.), `KB` = as.numeric(.)/2^10, `MB` = as.numeric(.)/2^20, `GB` = as.numeric(.)/2^30)} %>% round(3) %>% format(scientific = FALSE) #----
#           bytes              KB              MB              GB 
# "964065520.000" "   941470.234" "      919.405" "        0.898" 




data.frame(objectname = gsub(".rds$", "", filename)) %>% mutate(
    tmp = objectname %>% map_dbl(function(txt) object.size(get(i, envir=.GlobalEnv) )
)
# > data.frame(objectname = gsub(".rds$", "", filename)) %>% mutate(
# +     tmp = objectname %>% map_dbl(function(txt) object.size(get(i, envir=.GlobalEnv) )
# + )
#                     objectname tmp
# 1 mscan_pregcohort_r4.sas7bdat  56





#@ end -----
