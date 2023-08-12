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
fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data", "\\.(rdata)$") #-----
# > fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data", "\\.(rdata)$") #-----
# tibble::tribble(
#                             ~filename,  ~size,    ~bytes,       ~KB,        ~MB,        ~GB,
#   "RDataMining-Tweets-20160203.rdata", 282199, "282,199", "275.585", "0.269126", "2.63e-04",
#              "rdmTweets-201306.RData", 196993, "196,993", "192.376", "0.187867", "1.83e-04",
#                     "rdmTweets.RData", 102523, "102,523", "100.120", "0.097774", "9.55e-05",
#                 "termDocMatrix.rdata",   1352, "  1,352", "  1.320", "0.001289", "1.26e-06",
#                   "titanic.raw.rdata",    452, "    452", "  0.441", "0.000431", "4.21e-07"
#   )

