# function.list_df2xlsx.source.r

function.list_df2xlsx = function(list_df, asTable = T, withFilter = T, overwrite2annotate = F, openXL.filename = " - annotated.xlsx") {
  library(openxlsx)
  filename = deparse(substitute(list_df))
  openxlsx::write.xlsx(eval(parse(text = filename)), file = paste0(filename, ".xlsx"), asTable = asTable, withFilter = withFilter)
  file.copy(from = paste0(filename, ".xlsx"), to = paste0(filename, " - annotated.xlsx"), overwrite = overwrite2annotate)
  # openxlsx::openXL(file = paste0(filename, ".xlsx"))
  openxlsx::openXL(file = paste0(filename, openXL.filename))
}


#@ end -----
