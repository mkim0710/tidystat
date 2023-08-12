# fun.path_files_size.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/fun.path_files_size.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/env.custom.fun.t.tribble_construct.source.r


library(tidyverse)
getwd() %>% dput #----

path4read = getwd()
path4write = getwd()
path4read %>% dput
path4write %>% dput

# filenames = list.files(path = path4read) %>% {grep("\\.(rdata|rda|rds)$", .,  ignore.case = T, value = T)}
# filenames %>% dput #----


# fun.path_files_size = function(path4read = getwd(), regex4filename = "\\.(rdata|rda|rds)$") {
#     filenames = list.files(path = path4read) %>% {grep(regex4filename, .,  ignore.case = T, value = T)}
#     out = filenames %>% {file.info(file.path(path4read,.))} %>%
#         rownames_to_column("filename") %>% select(filename, size) %>%
#         mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2))
#     out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
#     out
# }

# fun.path_files_size = function(path4read = getwd(), regex4filename = "\\.(rdata|rda|rds)$") {
#     filenames = list.files(path = path4read) %>% {grep(regex4filename, .,  ignore.case = T, value = T)}
#     out = filenames %>% {file.info(file.path(path4read,.))} %>%
#         rownames_to_column("filename") %>% select(filename, size) %>%
#         mutate(bytes = format(size, digits = 3, big.mark=","), 
#                KB = format(size/2^10, digits = 3, big.mark=","), 
#                MB = format(size/2^20, digits = 3, big.mark=","), 
#                GB = format(size/2^30, digits = 3, big.mark=","))
#     out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
#     out
# }

load(url("https://github.com/mkim0710/tidystat/raw/master/Rdev/env.custom.fun.t.tribble_construct.RData"))

fun.path_files_size = function(path4read = getwd(), regex4filename = "\\.(rdata|rda|rds)$") {
    filenames = list.files(path = path4read) %>% {grep(regex4filename, .,  ignore.case = T, value = T)}
    out = filenames %>% {file.info(file.path(path4read,.))} %>%
        rownames_to_column("filename") %>% select(filename, size) %>%
        mutate(bytes = format(size, digits = 3, big.mark=","), 
               KB = format(size/2^10, digits = 3, big.mark=","), 
               MB = format(size/2^20, digits = 3, big.mark=","), 
               GB = format(size/2^30, digits = 3, big.mark=","))
    out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
    env.custom$fun.tribble_construct(out)
}



#@ end -----

library(tidyverse)
fun.path_files_size() #-----
fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data") #-----
fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data", "\\.(rds)$") #-----
# > fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data", "\\.(rds)$") #-----
# tibble::tribble(
#                                         ~filename,    ~size,       ~bytes,         ~KB,        ~MB,        ~GB,
#                              "ATC_RxNorm_NDC.rds", 79768376, "79,768,376", "77,898.80", "76.07305", "7.43e-02",
#                                "fhs.index100.rds",   342010, "   342,010", "   333.99", " 0.32617", "3.19e-04",
#                        "fhs.index100ge11le20.rds",    35515, "    35,515", "    34.68", " 0.03387", "3.31e-05",
#                            "fhs.index100le10.rds",    35747, "    35,747", "    34.91", " 0.03409", "3.33e-05",
#                   "Holdings_VT_URTH_VWO.list.rds",   387992, "   387,992", "   378.90", " 0.37002", "3.61e-04",
#                                 "icd10cm2019.rds",  1432851, " 1,432,851", " 1,399.27", " 1.36647", "1.33e-03",
#               "ICD9_3char_sub_chapter.tibble.rds",     8459, "     8,459", "     8.26", " 0.00807", "7.88e-06",
#       "icd9_chapters.expand_range.ICD9_3char.rds",     2919, "     2,919", "     2.85", " 0.00278", "2.72e-06",
#                  "icd9_chapters.expand_range.rds",    42833, "    42,833", "    41.83", " 0.04085", "3.99e-05",
#   "icd9_sub_chapters.expand_range.ICD9_3char.rds",     5776, "     5,776", "     5.64", " 0.00551", "5.38e-06",
#              "icd9_sub_chapters.expand_range.rds",    46898, "    46,898", "    45.80", " 0.04473", "4.37e-05",
#                 "RDataMining-Tweets-20160212.rds",   282733, "   282,733", "   276.11", " 0.26964", "2.63e-04"
#   )
