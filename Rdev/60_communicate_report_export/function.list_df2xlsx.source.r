# function.list_df2xlsx.source.r

function.list_df2xlsx = function(list_df, asTable = T, withFilter = T, overwrite2annotate = F, openXL.filename = " - annotated.xlsx") {
  library(openxlsx)
  objectname = deparse(substitute(list_df))
  openxlsx::write.xlsx(eval(parse(text = objectname)), file = paste0(objectname, ".xlsx"), asTable = asTable, withFilter = withFilter)
  file.copy(from = paste0(objectname, ".xlsx"), to = paste0(objectname, " - annotated.xlsx"), overwrite = overwrite2annotate)
  # openxlsx::openXL(file = paste0(objectname, ".xlsx"))
  openxlsx::openXL(file = paste0(objectname, openXL.filename))
}


#@ end -----
