


  
  
# __________|------  
# @@ END-----  

getwd()
.path4write = env1$path$.path4write
.objectname = "ADS200621"
system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="xz", compression=9 ))
# .path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)

  
  
# __________|------  
# @@ END-----  
.objectname = "NHID_GY20_0213.bind_rows"
.path4write = env1$path$.path4write
.t0 = Sys.time()
save( list = .objectname, file = file.path(.path4write, paste0(.objectname,".rda", "")), compress="xz", compression_level=9 )
print(Sys.time() - .t0)
  
  
# __________|------  
# @@ END-----  

getwd()
.path4write = env1$path$.path4write
.objectname = "ADS200621"
# saveRDS( get(.objectname), xzfile(file.path(.path4write, paste0(.objectname,".rds","")), compression=9) )
# R.utils::gzip(file.path(.path4write, paste0(.objectname,".rds")), overwrite=T, remove=F, compression=9)
# system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 ))
system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="xz", compression=9 ))
# .path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)

  
  
# __________|------  
# @@ END-----  
getwd()
.path4write = env1$path$.path4write
.objectname = "tblGADM_kor_level1_NL_NAME_1.SIDO_CD"
# system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="gz", compression=9 ))
system.time(write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds","")), compress="xz", compression=9 ))
.path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)





## @ -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
getwd()
.path4read = env1$path$.path4read 
.objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
FileName = paste0(.objectname,".rds")
FileName %>% {file.info(file.path(.path4read, .))} %>% rownames_to_column("FileName") %>% select(FileName, size) %>% mutate(KB = size/2^10, MB = KB/2^10, GB = MB/2^10) |> print() #----

assign(.objectname, read_rds(file.path(.path4read, paste0(.objectname,".rds")))    )



## @ -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
getwd()
.path4read = env1$path$.path4read 
.objectname = "d.NDCNUM_concept_name.join_redbook2019.STRNGTH_Manual"
FileName = paste0(.objectname,".rds")
.objectname = FileName %>% gsub("\\.rds", "", .)
print(.objectname)
.t0 = Sys.time()
assign$1.objectname$2
       , readRDS(file.path(.path4read, FileName)) %>% 
           as_tibble
)
Sys.time() - .t0



## @ -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
getwd()
.path4write = env1$path$.path4write
.objectname = "data_list.AgeSexAdjusted"
.t0 = Sys.time()
load(paste0(.objectname,".rda"))
Sys.time() - .t0
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")) )
Sys.time() - .t0

.objectname = ""
.t0 = Sys.time()
load(paste0(.objectname,".rda"))
Sys.time() - .t0
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")) )
Sys.time() - .t0

