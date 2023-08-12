# fun.path_files_size.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/env.custom.fun.t.tribble_construct.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/fun.path_files_size.source.r


library(tidyverse)
getwd() %>% dput #----

path4read = getwd()
path4write = getwd()
path4read %>% dput
path4write %>% dput

# filenames = list.files(path = path4read) %>% {grep("\\.(rdata|rda|rds)$", .,  ignore.case = T, value = T)}
# filenames %>% dput #----


fun.path_files_size = function(path4read = getwd(), regex4filename = "\\.(rdata|rda|rds)$") {
    filenames = list.files(path = path4read) %>% {grep(regex4filename, .,  ignore.case = T, value = T)}
    out = filenames %>% {file.info(file.path(path4read,.))} %>% 
        rownames_to_column("filename") %>% select(filename, size) %>% 
        mutate(KB = round(size/2^10, 2), MB = round(KB/2^10, 2), GB = round(MB/2^10, 2))
    out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
    out
}

#@ end -----

library(tidyverse)
fun.path_files_size() #-----
fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data") #-----
fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data", "\\.(rdata)$") #-----
# > fun.path_files_size("D:/OneDrive - SNU/[][Rproject]/github_tidystat/data", "\\.(rdata)$") #-----
#                            filename   size     KB   MB GB
# 1 RDataMining-Tweets-20160203.rdata 282199 275.58 0.27  0
# 2            rdmTweets-201306.RData 196993 192.38 0.19  0
# 3                   rdmTweets.RData 102523 100.12 0.10  0
# 4               termDocMatrix.rdata   1352   1.32 0.00  0
# 5                 titanic.raw.rdata    452   0.44 0.00  0

