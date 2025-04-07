# function.list_df2xlsx.dev.r

function.list_df2xlsx = function(list_df, as_table=TRUE, overwrite2annotate = F, xl_open.FileName = " - annotated.xlsx") {
  library(openxlsx2)
  .objectname = deparse(substitute(list_df))
  openxlsx2::write_xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), as_table = as_table)
  file.copy(from = paste0(.objectname,".xlsx"), to = paste0(.objectname, " - annotated.xlsx"), overwrite = overwrite2annotate)
  # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(file=paste0(.objectname,".xlsx"))
  if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(file=paste0(.objectname, xl_open.FileName))
}



  
  
# __________|------  
# @@ END----  
getwd()
.path4write = "../data/data.ID_DATE_DX.distinct"
.path4write = env1$path$path4write
.objectname = "d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.DDD"
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress="gz", compression=9 )
.path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")  ;  openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  ;  if (Sys.info()["sysname"] == "Linux") browseURL(.path_FileName.xlsx) else openxlsx2::xl_open(.path_FileName.xlsx)

