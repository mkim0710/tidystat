# https://chatgpt.com/c/8f4ff95d-9466-453e-8f07-5bba159d0c86
# https://github.com/MilesMcBain/datapasta/blob/master/R/vector_paste.R

f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') %>% paste0('c("',.,'")\n') |> cat()
}
c("C059", "D050000L", "NimbusMonoPS", "NimbusRoman", "NimbusSans", 
"NimbusSansNarrow", "P052", "Roboto", "RobotoCondensed", "StandardSymbolsPS", 
"texgyreadventor", "texgyrebonum", "texgyrechorus", "texgyrecursor", 
"texgyredejavu", "texgyreheros", "texgyreheroscn", "texgyrepagella", 
"texgyreschola", "texgyretermes", "URWBookman", "URWGothic", 
"Z003") |> dput_line_by_line()
# > fc_list_family.font_file_names.supertypes() |> dput_line_by_line()
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed",
#   "StandardSymbolsPS",
#   "texgyreadventor",
#   "texgyrebonum",
#   "texgyrechorus",
#   "texgyrecursor",
#   "texgyredejavu",
#   "texgyreheros",
#   "texgyreheroscn",
#   "texgyrepagella",
#   "texgyreschola",
#   "texgyretermes",
#   "URWBookman",
#   "URWGothic",
#   "Z003")



