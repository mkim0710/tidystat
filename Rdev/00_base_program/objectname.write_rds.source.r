


#@ end -----

getwd()
path4write = getwd()
objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds")), compress = "gz", compression = 9 )



#@ -----
library(tidyverse)
getwd()
path4read = getwd()
objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
filename = paste0(objectname, ".rds")
filename %>% {file.info(file.path(path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) %>% print #----

assign(objectname, read_rds(file.path(path4read, paste0(objectname, ".rds")))    )



#@ -----
library(tidyverse)
getwd()
path4read = getwd()
objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
filename = paste0(objectname, ".rds")
objectname = filename %>% gsub("\\.rds", "", .)
print(objectname)
t0 = Sys.time()
assign(objectname
       , readRDS(file.path(path4read, filename)) %>% 
           as.tibble
)
Sys.time() - t0
