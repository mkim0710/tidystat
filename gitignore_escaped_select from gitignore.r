# gitignore_escaped_select from gitignore.r
# f_vec.extract_non_alphanumeric_list.source.r


library(tidyverse)
f_vec.extract_non_alphanumeric_list <- function(input_vec) {
  f_str.extract_non_alphanumeric_vec <- function(input_string) {
    positions <- gregexpr("[^[:alnum:]]", input_string)  # Match any non-alphanumeric character
    non_alnum_chars <- regmatches(input_string, positions)
    unlist(non_alnum_chars)  # Unlist to get a vector of non-alphanumeric characters
  }
  
  # Use map to apply f_str.extract_non_alphanumeric_vec to each element and maintain list structure
  result_list <- map(input_vec, f_str.extract_non_alphanumeric_vec)
  
  # Set the names of the list elements to match the input vector
  names(result_list) <- input_vec
  
  result_list
}

# # Example usage of the function
# input_vec <- c("Hello, World!", "R4 & Python?", "123% Ready!", "12345")
# result <- f_vec.extract_non_alphanumeric_list(input_vec)
# result %>% dput
# list(`Hello, World!` = c(",", " ", "!"), `R4 & Python?` = c(" ", "&", " ", "?"), `123% Ready!` = c("%", " ", "!"), `12345` = character(0))







#@ gitignore = read_lines(".gitignore") =====
gitignore = read_lines(".gitignore")
gitignore %>% dput
c(".Rproj.user", ".Rhistory", ".RData", ".Ruserdata", "", "*.zip", 
"*.gz", "*.xz", "*.7z", "", "*.Rproj", ".gitignore", "", "MH)*.r", 
"*.lnk", "*alias", "", "*.ppt", "*.pptx", "*.xls", "*.xlsx", 
"*.doc", "*.docx", "", "*- void*.*", "*-void*.*", "*- info.*", 
"*-info.*", "*-dev*.*", "*debug*.*", "-tmp", "*- tmp*.*", "*-tmp*.*", 
"", "*-log*.*", "", "*.rtf", "")

gitignore %>% f_vec.extract_non_alphanumeric_list %>% unlist %>% unique %>% dput
c(".", "*", ")", "-", " ")



#@ gitignore_escaped =====
gitignore_escaped = gitignore[gitignore != ""] %>% 
    str_replace_all("\\.", "\\\\.") %>% # Caution: dot should be handled before asterisk~!
    str_replace_all("\\*", "\\.\\*") %>%
    str_replace_all("\\)", "\\\\)") %>% 
    str_replace_all("\\-", "\\\\-") %>% 
    # str_replace_all("\\ ", "\\\\ ") %>%  # spaces  are generally treated as literal spaces in regular expressions 
    unique 
gitignore_escaped %>% dput
c("\\.Rproj\\.user", "\\.Rhistory", "\\.RData", "\\.Ruserdata", 
".*\\.zip", ".*\\.gz", ".*\\.xz", ".*\\.7z", ".*\\.Rproj", "\\.gitignore", 
"MH\\).*\\.r", ".*\\.lnk", ".*alias", ".*\\.ppt", ".*\\.pptx", 
".*\\.xls", ".*\\.xlsx", ".*\\.doc", ".*\\.docx", ".*\\- void.*\\..*", 
".*\\-void.*\\..*", ".*\\- info\\..*", ".*\\-info\\..*", ".*\\-dev.*\\..*", 
".*debug.*\\..*", "\\-tmp", ".*\\- tmp.*\\..*", ".*\\-tmp.*\\..*", 
".*\\-log.*\\..*", ".*\\.rtf")


#@ gitignore_escaped_select =====
gitignore_escaped %>% str_which("doc|xls|ppt")
gitignore_escaped_select = gitignore_escaped %>% {.[-str_which(., "doc|xls|ppt")]}
gitignore_escaped_select %>% dput #----
c("\\.Rproj\\.user", "\\.Rhistory", "\\.RData", "\\.Ruserdata", 
".*\\.zip", ".*\\.gz", ".*\\.xz", ".*\\.7z", ".*\\.Rproj", "\\.gitignore", 
"MH\\).*\\.r", ".*\\.lnk", ".*alias", ".*\\- void.*\\..*", ".*\\-void.*\\..*", 
".*\\- info\\..*", ".*\\-info\\..*", ".*\\-dev.*\\..*", ".*debug.*\\..*", 
"\\-tmp", ".*\\- tmp.*\\..*", ".*\\-tmp.*\\..*", ".*\\-log.*\\..*", 
".*\\.rtf")
# for (i_regex in unique(gitignore_escaped_select)) {
#     df <- df_dir1 %>% filter(!str_detect(path.basename, i_regex))
# }

gitignore_escaped_select %>% paste(collapse = "|") %>% dput #----
"\\.Rproj\\.user|\\.Rhistory|\\.RData|\\.Ruserdata|.*\\.zip|.*\\.gz|.*\\.xz|.*\\.7z|.*\\.Rproj|\\.gitignore|MH\\).*\\.r|.*\\.lnk|.*alias|.*\\- void.*\\..*|.*\\-void.*\\..*|.*\\- info\\..*|.*\\-info\\..*|.*\\-dev.*\\..*|.*debug.*\\..*|\\-tmp|.*\\- tmp.*\\..*|.*\\-tmp.*\\..*|.*\\-log.*\\..*|.*\\.rtf"



#@ gitignore_escaped_select.UC =====
gitignore_escaped_select.UC = gitignore_escaped_select %>% toupper %>% unique
gitignore_escaped_select.UC %>% dput #----
c("\\.RPROJ\\.USER", "\\.RHISTORY", "\\.RDATA", "\\.RUSERDATA", 
".*\\.ZIP", ".*\\.GZ", ".*\\.XZ", ".*\\.7Z", ".*\\.RPROJ", "\\.GITIGNORE", 
"MH\\).*\\.R", ".*\\.LNK", ".*ALIAS", ".*\\- VOID.*\\..*", ".*\\-VOID.*\\..*", 
".*\\- INFO\\..*", ".*\\-INFO\\..*", ".*\\-DEV.*\\..*", ".*DEBUG.*\\..*", 
"\\-TMP", ".*\\- TMP.*\\..*", ".*\\-TMP.*\\..*", ".*\\-LOG.*\\..*", 
".*\\.RTF")

gitignore_escaped_select.UC %>% paste(collapse = "|") %>% dput #----
"\\.RPROJ\\.USER|\\.RHISTORY|\\.RDATA|\\.RUSERDATA|.*\\.ZIP|.*\\.GZ|.*\\.XZ|.*\\.7Z|.*\\.RPROJ|\\.GITIGNORE|MH\\).*\\.R|.*\\.LNK|.*ALIAS|.*\\- VOID.*\\..*|.*\\-VOID.*\\..*|.*\\- INFO\\..*|.*\\-INFO\\..*|.*\\-DEV.*\\..*|.*DEBUG.*\\..*|\\-TMP|.*\\- TMP.*\\..*|.*\\-TMP.*\\..*|.*\\-LOG.*\\..*|.*\\.RTF"



#@ end ----
