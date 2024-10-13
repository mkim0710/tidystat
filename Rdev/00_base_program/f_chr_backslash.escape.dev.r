# https://chatgpt.com/c/670b4a25-1400-800e-80ea-d81cedfee1fa



#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  

## single_backslash <- "\\" ----
single_backslash <- "\\"
single_backslash %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > single_backslash %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "\\"
# \ 
# [1] 1
# [1] "\\"


## two_backslashes <- "\\\\" ----
two_backslashes <- strrep("\\", 2)
two_backslashes %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > two_backslashes %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "\\\\"
# \\ 
# [1] 2
# [1] "\\" "\\"



## four_backslashes <- ""\\\\\\\\" ----
four_backslashes <- strrep("\\", 4)
four_backslashes %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > four_backslashes %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "\\\\\\\\"
# \\\\ 
# [1] 4
# [1] "\\" "\\" "\\" "\\"







#@ START) Simulate reading the string with backslashes ----
## my.regex <- "my\\.regex[0-9]" ----
my.regex <- "my\\.regex[0-9]"
my.regex %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\.regex[0-9]"
# my\.regex[0-9] 
# [1] 14
#  [1] "m"  "y"  "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 


pattern <- "\\\\"
replacement <- "\\\\\\\\"

?gsub

## my.regex.gsub2to4 <- gsub(pattern = two_backslashes, replacement = four_backslashes, my.regex) ----
my.regex.gsub2to4 <- gsub(pattern = two_backslashes, replacement = four_backslashes, my.regex)
my.regex.gsub2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex.gsub2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\\\.regex[0-9]"
# my\\.regex[0-9] 
# [1] 15
#  [1] "m"  "y"  "\\" "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 




## my.regex.gsub_fixed2to4 <- gsub(pattern = two_backslashes, replacement = four_backslashes, my.regex, fixed = TRUE) ----
my.regex.gsub_fixed2to4 <- gsub(pattern = two_backslashes, replacement = four_backslashes, my.regex, fixed = TRUE)
my.regex.gsub_fixed2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex.gsub_fixed2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\.regex[0-9]"
# my\.regex[0-9] 
# [1] 14
#  [1] "m"  "y"  "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 


## my.regex.gsub_fixed1to2 <- gsub(pattern = single_backslash, replacement = two_backslashes, my.regex, fixed = TRUE) ----
my.regex.gsub_fixed1to2 <- gsub(pattern = single_backslash, replacement = two_backslashes, my.regex, fixed = TRUE)
my.regex.gsub_fixed1to2 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex.gsub_fixed1to2 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\\\.regex[0-9]"
# my\\.regex[0-9] 
# [1] 15
#  [1] "m"  "y"  "\\" "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 




## my.regex.str_replace_all2to4 <- my.regex |> str_replace_all(pattern = two_backslashes, replacement = four_backslashes) ----
my.regex.str_replace_all2to4 <- my.regex |> str_replace_all(pattern = two_backslashes, replacement = four_backslashes)
my.regex.str_replace_all2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex.str_replace_all2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\\\.regex[0-9]"
# my\\.regex[0-9] 
# [1] 15
#  [1] "m"  "y"  "\\" "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 




## my.regex.fixed.str_replace_all2to4 <- my.regex |> str_replace_all(fixed(two_backslashes), four_backslashes) ----
my.regex.fixed.str_replace_all2to4 <- my.regex |> str_replace_all(fixed(two_backslashes), four_backslashes)
my.regex.fixed.str_replace_all2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex.fixed.str_replace_all2to4 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\.regex[0-9]"
# my\.regex[0-9] 
# [1] 14
#  [1] "m"  "y"  "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 


## my.regex.fixed.str_replace_all1to2 <- my.regex |> str_replace_all(fixed(single_backslash), two_backslashes) ----
my.regex.fixed.str_replace_all1to2 <- my.regex |> str_replace_all(fixed(single_backslash), two_backslashes)
my.regex.fixed.str_replace_all1to2 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# > my.regex.fixed.str_replace_all1to2 %>% {print(.); cat(.,"\n"); print(nchar(.)); unlist(strsplit(.,""))}
# [1] "my\\\\.regex[0-9]"
# my\\.regex[0-9] 
# [1] 15
#  [1] "m"  "y"  "\\" "\\" "."  "r"  "e"  "g"  "e"  "x"  "["  "0"  "-"  "9"  "]" 







