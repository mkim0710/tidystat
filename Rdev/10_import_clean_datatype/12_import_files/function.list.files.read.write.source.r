# function.list.files.read.write.source.r



library(tidyverse)
getwd() %>% dput #----

path4read = getwd()
path4write = getwd()
path4read %>% dput
path4write %>% dput


list.files(path4read) %>% grep("sas7bdat$",. , value = T) %>% file.info %>% dput #----
list.files(path4read) %>% grep("sas7bdat$",. , value = T) %>% file.info %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----


# list.files(path4read) read_sas() write_rds().r =====
library(haven)
?read_sas
path4read = getwd()
path4write = getwd()

filenames = list.files(path4read) %>% grep(".sas7bdat$",. , value = T) 
filenames %>% dput #----

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
    # write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "gz")
    rm(i)
    gc()
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)














# _r4.sas7bdat _r4_mod.sas7bdat file.info().r =====

library(tidyverse)
getwd() %>% dput
# > getwd() %>% dput
# "X:/mkim/Rproject"
path4read = "//DON/marketscan_users/smacdonald/"
path4write = "//DON/marketscan_users/mkim/"
path4read = path4read %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
path4write = path4write %>% {ifelse(substr(., nchar(.), nchar(.)) == "/", ., paste0(., "/"))}
path4read %>% dput
path4write %>% dput


# list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} %>% dput #----
# list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% file.info %>% dput #----
list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% file.info %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2)) #----
# > list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T) %>% {file.info(paste0(path4read, .))} %>% dput #----
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
filenames %>% dput
# > filenames %>% dput
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
    assign(
        i
        , read_sas(paste0(path4read, i))
    )
    # save(list = i, file = file.path(path4write, i, ".rda"), compress = F)
    # write_rds(!!rlang::sym(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    # write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "gz")
    rm(i)
    gc()
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)
out.list %>% dput
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
# > out.list %>% dput
structure(list(infant_pregcohort_r_r4.sas7bdat = structure(3.64281630516052, units = "secs", class = "difftime")), .Names = "infant_pregcohort_r_r4.sas7bdat")


filenames = list.files(path4read) %>% grep("_r4.sas7bdat$|_r4_mod.sas7bdat$",. , value = T) %>% grep("^(infant_pregcohort)|(women_pregcohort)",. , value = T)
filenames %>% dput
# > filenames %>% dput
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
    assign(
        i
        , read_sas(paste0(path4read, i))
    )
    # save(list = i, file = file.path(path4write, i, ".rda"), compress = F)
    # write_rds(!!rlang::sym(i), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "none")
    # write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "gz")
    rm(i)
    gc()
    print(paste0("Sys.time() - t0", " = ", Sys.time() - t0))
    Sys.time() - t0
}) %>% set_names(filenames)
out.list %>% dput
# > filenames %>% dput
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
# +     write_rds(eval(parse(text = i)), path = paste0(path4write, "/", i, ".rds"), compress = "none")
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
gsub(".rds$", "", filename) %>% {object.size(eval(parse(text = .)))} %>% {c(`bytes` = as.numeric(.), `KB` = as.numeric(.)/2^10, `MB` = as.numeric(.)/2^20, `GB` = as.numeric(.)/2^30)} %>% round(3) %>% format(scientific = FALSE) #----
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
# > gsub(".rds$", "", filename) %>% {object.size(eval(parse(text = .)))} %>% {c(`bytes` = as.numeric(.), `KB` = as.numeric(.)/2^10, `MB` = as.numeric(.)/2^20, `GB` = as.numeric(.)/2^30)} %>% round(3) %>% format(scientific = FALSE) #----
#           bytes              KB              MB              GB 
# "964065520.000" "   941470.234" "      919.405" "        0.898" 




data.frame(objectname = gsub(".rds$", "", filename)) %>% mutate(
    tmp = objectname %>% map_dbl(function(txt) object.size(eval(parse(text = txt), envir = .GlobalEnv)) )
)
# > data.frame(objectname = gsub(".rds$", "", filename)) %>% mutate(
# +     tmp = objectname %>% map_dbl(function(txt) object.size(eval(parse(text = txt), envir = .GlobalEnv)) )
# + )
#                     objectname tmp
# 1 mscan_pregcohort_r4.sas7bdat  56





#@ end -----
