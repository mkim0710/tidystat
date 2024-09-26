# function.list_df2xlsx.dev.r

function.list_df2xlsx = function(list_df, asTable=TRUE, overwrite2annotate = F, xl_open.filename = " - annotated.xlsx") {
  library(openxlsx2)
  .objectname = deparse(substitute(list_df))
  openxlsx2::write_xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), asTable = asTable, withFilter = withFilter)
  file.copy(from = paste0(.objectname,".xlsx"), to = paste0(.objectname, " - annotated.xlsx"), overwrite = overwrite2annotate)
  # if (.Platform$OS.type == "windows") openxlsx2::xl_open(file=paste0(.objectname,".xlsx"))
  if (.Platform$OS.type == "windows") openxlsx2::xl_open(file=paste0(.objectname, xl_open.filename))
}





# @ end ----  
getwd()
.path4write = "../data/data.ID_DATE_DX.distinct"
.path4write = env1$path$.path4write
.objectname = "d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.DDD"
# write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")))
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress="gz", compression=9 )
openxlsx2::write_xlsx(get(.objectname), file=paste0(.objectname,".xlsx"), asTable=TRUE)
if (.Platform$OS.type == "windows") openxlsx2::xl_open(file=paste0(.objectname,".xlsx"))

