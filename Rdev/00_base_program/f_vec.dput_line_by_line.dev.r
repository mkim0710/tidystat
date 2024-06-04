# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
# https://chatgpt.com/c/8f4ff95d-9466-453e-8f07-5bba159d0c86
# https://github.com/MilesMcBain/datapasta/blob/master/R/vector_paste.R
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#$ vec ====
vec = c("C059", "D050000L", "NimbusMonoPS", "NimbusRoman", "NimbusSans", "NimbusSansNarrow", "P052", "Roboto", "RobotoCondensed")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
}
NULL |> f_vec.paste_collapse()
vec |> f_vec.paste_collapse()
vec |> f_vec.paste_collapse() |> cat()
# > NULL |> f_vec.paste_collapse()
# [1] "\"\""
# > vec |> f_vec.paste_collapse()
# [1] "\"C059\",\n\"D050000L\",\n\"NimbusMonoPS\",\n\"NimbusRoman\",\n\"NimbusSans\",\n\"NimbusSansNarrow\",\n\"P052\",\n\"Roboto\",\n\"RobotoCondensed\""
# > vec |> f_vec.paste_collapse() |> cat()
# "C059",
# "D050000L",
# "NimbusMonoPS",
# "NimbusRoman",
# "NimbusSans",
# "NimbusSansNarrow",
# "P052",
# "Roboto",
# "RobotoCondensed"
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') %>% paste0('c("',.,'")\n') |> cat()
}
NULL |> f_vec.dput_line_by_line()
vec |> f_vec.dput_line_by_line()
# > NULL |> f_vec.dput_line_by_line()
# c("")
# > vec |> f_vec.dput_line_by_line()
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
f_vec.dput_line_by_line <- function(vec) {
    vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat()
}
NULL |> f_vec.dput_line_by_line()
vec |> f_vec.dput_line_by_line()
# > NULL |> f_vec.dput_line_by_line()
# c("")
# > vec |> f_vec.dput_line_by_line()
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% f_vec.dput_line_by_line <- function(vec, indent_spaces=2L) { -----
# f_vec.dput_line_by_line <- function(vec, indent_spaces=2L) {
#     # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat()
#     vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse=paste0('",\n',strrep(" ",indent_spaces),'"')),'")\n')} |> cat()
# }#
# vec |> f_vec.dput_line_by_line()
# vec |> f_vec.dput_line_by_line(indent_spaces=4)
# # > vec |> f_vec.dput_line_by_line()
# # c("C059",
# #   "D050000L",
# #   "NimbusMonoPS",
# #   "NimbusRoman",
# #   "NimbusSans",
# #   "NimbusSansNarrow",
# #   "P052",
# #   "Roboto",
# #   "RobotoCondensed")
# # > vec |> f_vec.dput_line_by_line(indent_spaces=4)
# # c("C059",
# #     "D050000L",
# #     "NimbusMonoPS",
# #     "NimbusRoman",
# #     "NimbusSans",
# #     "NimbusSansNarrow",
# #     "P052",
# #     "Roboto",
# #     "RobotoCondensed")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# \% f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ") { -----
f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat()
    if (is.null(vec)) {
        return("NULL")
    } else {
        vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c(',ifelse(sep_parentheses,space_between_vec_elements,""),'"',paste0(., collapse=paste0('",',space_between_vec_elements,'"')),'"',ifelse(sep_parentheses,str_extract(space_between_vec_elements,"\n"),""),')',end_of_text)}
    }
}
f_vec.dput_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    f_vec.format_line_by_line(vec, space_between_vec_elements, sep_parentheses, end_of_text) |> cat()
}

vec |> f_vec.dput_line_by_line("") 
vec |> f_vec.format_line_by_line("") 
vec |> f_vec.format_line_by_line("") |> cat()
vec |> f_vec.format_line_by_line() 
vec |> f_vec.format_line_by_line() |> cat()
vec |> f_vec.format_line_by_line("\n\t")
vec |> f_vec.format_line_by_line("\n\t") |> cat()
vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE)
vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE) |> cat()
# > vec |> f_vec.dput_line_by_line("") 
# c("C059","D050000L","NimbusMonoPS","NimbusRoman","NimbusSans","NimbusSansNarrow","P052","Roboto","RobotoCondensed")
# > vec |> f_vec.format_line_by_line("") 
# [1] "c(\"C059\",\"D050000L\",\"NimbusMonoPS\",\"NimbusRoman\",\"NimbusSans\",\"NimbusSansNarrow\",\"P052\",\"Roboto\",\"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line("") |> cat()
# c("C059","D050000L","NimbusMonoPS","NimbusRoman","NimbusSans","NimbusSansNarrow","P052","Roboto","RobotoCondensed")
# > vec |> f_vec.format_line_by_line() 
# [1] "c(\"C059\",\n  \"D050000L\",\n  \"NimbusMonoPS\",\n  \"NimbusRoman\",\n  \"NimbusSans\",\n  \"NimbusSansNarrow\",\n  \"P052\",\n  \"Roboto\",\n  \"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line() |> cat()
# c("C059",
#   "D050000L",
#   "NimbusMonoPS",
#   "NimbusRoman",
#   "NimbusSans",
#   "NimbusSansNarrow",
#   "P052",
#   "Roboto",
#   "RobotoCondensed")
# > vec |> f_vec.format_line_by_line("\n\t")
# [1] "c(\"C059\",\n\t\"D050000L\",\n\t\"NimbusMonoPS\",\n\t\"NimbusRoman\",\n\t\"NimbusSans\",\n\t\"NimbusSansNarrow\",\n\t\"P052\",\n\t\"Roboto\",\n\t\"RobotoCondensed\")\n"
# > vec |> f_vec.format_line_by_line("\n\t") |> cat()
# c("C059",
# 	"D050000L",
# 	"NimbusMonoPS",
# 	"NimbusRoman",
# 	"NimbusSans",
# 	"NimbusSansNarrow",
# 	"P052",
# 	"Roboto",
# 	"RobotoCondensed")
# > vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE)
# [1] "c(\n\t\"C059\",\n\t\"D050000L\",\n\t\"NimbusMonoPS\",\n\t\"NimbusRoman\",\n\t\"NimbusSans\",\n\t\"NimbusSansNarrow\",\n\t\"P052\",\n\t\"Roboto\",\n\t\"RobotoCondensed\"\n)\n"
# > vec |> f_vec.format_line_by_line("\n\t", sep_parentheses=TRUE) |> cat()
# c(
# 	"C059",
# 	"D050000L",
# 	"NimbusMonoPS",
# 	"NimbusRoman",
# 	"NimbusSans",
# 	"NimbusSansNarrow",
# 	"P052",
# 	"Roboto",
# 	"RobotoCondensed"
# )

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

