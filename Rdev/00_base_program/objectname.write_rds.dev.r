




# @ end -----  

getwd()
.path4write = env1$path$.path4write
objectname = "AnalyticDataset200621"
system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="xz", compression=9 ))
# system.time(openxlsx2::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
# if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))



# @ end -----  
objectname = "NHID_GY20_0213.bind_rows"
.path4write = env1$path$.path4write
.t0 = Sys.time()
save( list = objectname, file = file.path(.path4write, paste0(objectname,".rda", "")), compress="xz", compression_level=9 )
print(Sys.time() - .t0)


# @ end -----  

getwd()
.path4write = env1$path$.path4write
objectname = "AnalyticDataset200621"
# saveRDS( get(objectname), xzfile(file.path(.path4write, paste0(objectname,".rds","")), compression=9) )
# write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")))
# R.utils::gzip(file.path(.path4write, paste0(objectname,".rds")), overwrite=T, remove=F, compression=9)
# system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="gz", compression=9 ))
system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="xz", compression=9 ))
# system.time(openxlsx2::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
# if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))



# @ end -----  
getwd()
.path4write = env1$path$.path4write
objectname = "tblGADM_kor_level1_NL_NAME_1.SIDO_CD"
# system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="gz", compression=9 ))
system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="xz", compression=9 ))
system.time(openxlsx2::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))





# @ -----  
library(tidyverse)
getwd()
.path4read = env1$path$.path4read 
objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
filename = paste0(objectname,".rds")
filename %>% {file.info(file.path(.path4read, .))} %>% rownames_to_column("filename") %>% select(filename, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) |> print() #----

assign(objectname, read_rds(file.path(.path4read, paste0(objectname,".rds")))    )



# @ -----  
library(tidyverse)
getwd()
.path4read = env1$path$.path4read 
objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
filename = paste0(objectname,".rds")
objectname = filename %>% gsub("\\.rds", "", .)
print(objectname)
.t0 = Sys.time()
assign(objectname
       , readRDS(file.path(.path4read, filename)) %>% 
           as_tibble
)
Sys.time() - .t0



# @ -----  
library(tidyverse)
getwd()
.path4write = env1$path$.path4write
objectname = "data_list.AgeSexAdjusted"
.t0 = Sys.time()
load(paste0(objectname,".rda"))
Sys.time() - .t0
write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")) )
Sys.time() - .t0

objectname = ""
.t0 = Sys.time()
load(paste0(objectname,".rda"))
Sys.time() - .t0
write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")) )
Sys.time() - .t0

