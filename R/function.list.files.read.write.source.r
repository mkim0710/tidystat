# function.list.files.read.write.source.r

# list.files(path4read) read_sas() write_rds().r


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
    print("i")
    print(i)
    t0 = Sys.time()
    print("t0")
    print(t0)
    assign(
        i
        , read_sas(paste0(path4read, i))
    )
    # save(list = i, file = paste0(path4write, i, ".rda"), compress = F)
    # write_rds(!!rlang::sym(i), path = paste0(path4write, i, ".rds"), compress = "none")
    write_rds(eval(parse(text = i)), path = paste0(path4write, i, ".rds"), compress = "none")
    rm(i)
    gc()
    print("Sys.time() - t0")
    print(Sys.time() - t0)
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
# +     write_rds(i, path = paste0(path4write, i))
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
    print("i")
    print(i)
    t0 = Sys.time()
    print("t0")
    print(t0)
    assign(
        i
        , read_sas(paste0(path4read, i))
    )
    # save(list = i, file = paste0(path4write, i, ".rda"), compress = F)
    # write_rds(!!rlang::sym(i), path = paste0(path4write, i, ".rds"), compress = "none")
    write_rds(eval(parse(text = i)), path = paste0(path4write, i, ".rds"), compress = "none")
    rm(i)
    gc()
    print("Sys.time() - t0")
    print(Sys.time() - t0)
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
# +     # save(list = i, file = paste0(path4write, i, ".rda"), compress = F)
# +     # write_rds(!!rlang::sym(i), path = paste0(path4write, i, ".rds"), compress = "none")
# +     write_rds(eval(parse(text = i)), path = paste0(path4write, i, ".rds"), compress = "none")
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











#@ end -----
