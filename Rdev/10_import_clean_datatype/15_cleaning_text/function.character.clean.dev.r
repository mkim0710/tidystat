# function.character.clean.dev.r



function.character.clean = function(vec, pattern_to_clean = "[^A-z0-9[:punct:][:space:]]") {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.character.clean")
    
    index_to_clean = grep(pattern_to_clean, vec, value = F)
    # warnings(
    #     paste0("Cleaning Characters: ", "\"", paste0(grep(pattern_to_clean, vec, value = T), collapse = "\", \""), "\"" )
    # )
    # cat(
    #     paste0("Cleaning Characters: ", "\"", paste0(vec[index_to_clean], collapse = "\", \""), "\"" )
    # )
    # cat("  \n", sep="")
    
    out = gsub(pattern_to_clean, "", vec)
    # cat(
    #     paste0("Cleaned Characters: ", "\"", paste0(out[index_to_clean], collapse = "\", \""), "\"" )
    # )
    # cat("  \n", sep="")
    tmp_df = data.frame(Before = vec[index_to_clean], After = out[index_to_clean])
    rownames(tmp_df) = index_to_clean
    print(t(tmp_df))
    out
}



# #@ test) function.character.clean() -----
# vec = c("", " ", ".", "Y", "Period.", "K1", "1G", "m1", "1n", "1", "FF00FF", "ff2343", "a\\n b", "Now is the time      ", "\tMillard Fillmore")
# function.character.clean(vec, pattern_to_clean = "[^A-z0-9]")
# function.character.clean(vec, pattern_to_clean = "[^A-z0-9[:punct:]]")
# function.character.clean(vec, pattern_to_clean = "[^A-z0-9[:space:]]")
# # > function.character.clean(vec, pattern_to_clean = "[^A-z0-9]")
# #        2   3   5         13       14                      15                  
# # Before " " "." "Period." "a\\n b" "Now is the time      " "\tMillard Fillmore"
# # After  ""  ""  "Period"  "a\\nb"  "Nowisthetime"          "MillardFillmore"   
# #  [1] ""                ""                ""                "Y"               "Period"         
# #  [6] "K1"              "1G"              "m1"              "1n"              "1"              
# # [11] "FF00FF"          "ff2343"          "a\\nb"           "Nowisthetime"    "MillardFillmore"
# # > function.character.clean(vec, pattern_to_clean = "[^A-z0-9[:punct:]]")
# #        2   13       14                      15                  
# # Before " " "a\\n b" "Now is the time      " "\tMillard Fillmore"
# # After  ""  "a\\nb"  "Nowisthetime"          "MillardFillmore"   
# #  [1] ""                ""                "."               "Y"               "Period."        
# #  [6] "K1"              "1G"              "m1"              "1n"              "1"              
# # [11] "FF00FF"          "ff2343"          "a\\nb"           "Nowisthetime"    "MillardFillmore"
# # > function.character.clean(vec, pattern_to_clean = "[^A-z0-9[:space:]]")
# #        3   5        
# # Before "." "Period."
# # After  ""  "Period" 
# #  [1] ""                      " "                     ""                      "Y"                    
# #  [5] "Period"                "K1"                    "1G"                    "m1"                   
# #  [9] "1n"                    "1"                     "FF00FF"                "ff2343"               
# # [13] "a\\n b"                "Now is the time      " "\tMillard Fillmore"   

