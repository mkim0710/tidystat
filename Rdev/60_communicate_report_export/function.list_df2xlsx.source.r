# function.list_df2xlsx.source.r

function.list_df2xlsx = function(list_df, asTable = T, withFilter = T, overwrite2annotate = F, openXL.filename = " - annotated.xlsx") {
  library(openxlsx)
  objectname = deparse(substitute(list_df))
  openxlsx::write.xlsx(eval(parse(text = objectname)), file = paste0(objectname, ".xlsx"), asTable = asTable, withFilter = withFilter)
  file.copy(from = paste0(objectname, ".xlsx"), to = paste0(objectname, " - annotated.xlsx"), overwrite = overwrite2annotate)
  # openxlsx::openXL(file = paste0(objectname, ".xlsx"))
  openxlsx::openXL(file = paste0(objectname, openXL.filename))
}





#@ end ----
getwd()
path4write = "../data/data.ID_DATE_DX.distinct"
path4write = getwd()
objectname = "d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.DDD"
# write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds")))
write_rds( eval(parse(text = objectname)), file.path(path4write, paste0(objectname, ".rds")), compress = "gz", compression = 9 )
openxlsx::write.xlsx(eval(parse(text = objectname)), file = paste0(objectname, ".xlsx"), asTable = T, withFilter = T)
openxlsx::openXL(file = paste0(objectname, ".xlsx"))

