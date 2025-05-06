# function.Data_Exposure_Outcome_shuffle.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/20_tidy_group_by_match/27_match/function.MatchingPairID_Exposed_Unexposed_shuffle.dev.r


# In each line, texts after the sharp ("#") character are comments (not interpreted by the computer). ----  
# install.packages("tidyvserse")  # Only need to install once. ----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# install.packages("openxlsx2")  # Only need to install once. ----  
.packagename = "openxlsx2"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

getwd()                                            # See the current working directory. ----
ffqtot = readRDS("ffqtot.rds")                     # No need to write the path, if the file is in the current working directory.
ffqtot                                             # If you enter the .object name, it will print the .object into the Console in the default method.
write_xlsx(ffqtot, "ffqtot.xlsx", as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2)  # If you want to look into the dataset via spreadsheet, I'd recommend exporting into a MS Excel file.
xl_open("ffqtot.xlsx")                              # If the package is properly installed, this commmand will open the file via MS Excel.
# > ffqtot ----  
# # A tibble: 2,143 x 43
#    `_rowstate_`   pid   AGE   SEX  RACE YOUREDUC WEIGHTBS HEIGHT BMIBS bmicat bmi25 bmi30 EXERCBS SMOKEBS currsm pastsm   TRT
#           <dbl> <dbl> <dbl> <dbl> <int>    <dbl>    <dbl>  <dbl> <dbl>  <dbl> <dbl> <dbl>   <dbl>   <dbl>  <dbl>  <dbl> <dbl>
#  1            0  1001    53     2     2        5      141     64  24.2      0     0     0       7       3      1      0     1
#  2            0  1003    30     1     1        3      186     73  24.5      0     0     0       3       2      0      1     1
#  3            0  1004    49     1     1        3      269     72  36.5      2     1     1       0       2      0      1    NA
#  4            0  1005    36     1     1        5      241     69  35.6      2     1     1       2       1      0      0    NA
#  5            0  1006    34     1     1        4      198     72  26.9      1     1     0       1       1      0      0     1
#  6            0  1007    49     1     1        7      141     68  21.4      0     0     0       6       2      0      1    NA
#  7            0  1008    39     1     1        2      166     68  25.2      1     1     0       5       1      0      0    NA
#  8            0  1009    53     1     2        3      182     69  26.9      1     1     0       0       2      0      1     2
#  9            0  1010    38     1     1        5      160     74  20.5      0     0     0       4       1      0      0     2
# 10            0  1011    39     1     1        2      249     73  32.9      2     1     1       0       1      0      0     2
# # ... with 2,133 more rows, and 26 more variables: fkcal <dbl>, atotfat <dbl>, asat <dbl>, aoleic <dbl>, alinolc <dbl>,
# #   achol <dbl>, acarb <dbl>, aprot <dbl>, afiber <dbl>, adca <dbl>, adiron <dbl>, adphos <dbl>, adk <dbl>, adna <dbl>,
# #   advaiu <dbl>, advare <dbl>, adthiam <dbl>, adribo <dbl>, adniac <dbl>, advc <dbl>, atca <dbl>, atiron <dbl>, atvaiu <dbl>,
# #   atthiri <dbl>, atvc <dbl>, asuptoc <dbl>

dput(names(ffqtot))                                # Print the variable names for coding (wrapped with quotation marks) ----
c("_rowstate_", "pid", "AGE", "SEX", "RACE", "YOUREDUC", "WEIGHTBS", "HEIGHT", "BMIBS", "bmicat", "bmi25", "bmi30", "EXERCBS", "SMOKEBS", "currsm", "pastsm", "TRT", "fkcal", "atotfat", "asat", "aoleic", "alinolc", "achol", "acarb", "aprot", "afiber", "adca", "adiron", "adphos", "adk", "adna", "advaiu", "advare", "adthiam", "adribo", "adniac", "advc", "atca", "atiron", "atvaiu", "atthiri", "atvc", "asuptoc")
paste(names(ffqtot), collapse = ", ")              # Print the variable names for coding (not wrapped with quotation marks) ----
"_rowstate_, pid, AGE, SEX, RACE, YOUREDUC, WEIGHTBS, HEIGHT, BMIBS, bmicat, bmi25, bmi30, EXERCBS, SMOKEBS, currsm, pastsm, TRT, fkcal, atotfat, asat, aoleic, alinolc, achol, acarb, aprot, afiber, adca, adiron, adphos, adk, adna, advaiu, advare, adthiam, adribo, adniac, advc, atca, atiron, atvaiu, atthiri, atvc, asuptoc"













ffqtot %>% select(currsm, fkcal)
# > ffqtot %>% select(currsm, fkcal)
# # A tibble: 2,143 x 2
#    currsm fkcal
#     <dbl> <dbl>
#  1      1 1395.
#  2      0 3377.
#  3      0 1472.
#  4      0 3036 
#  5      0 2577.
#  6      0 2057.
#  7      0 2498.
#  8      0 2581.
#  9      0 1780.
# 10      0 2130.
# # ... with 2,133 more rows

ffqtot$currsm |> str(max.level = 2, give.attr = TRUE)
set.seed(1)
ffqtot$currsm %>% sample |> str(max.level = 2, give.attr = TRUE)
ffqtot$currsm %>% sample |> str(max.level = 2, give.attr = TRUE)
ffqtot$currsm %>% sample |> str(max.level = 2, give.attr = TRUE)
# > ffqtot$currsm |> str(max.level = 2, give.attr = TRUE)
#  num [1:2143] 1 0 0 0 0 0 0 0 0 0 ...
#  - attr(*, "label")= chr "currsm"
# > set.seed(1)
# > ffqtot$currsm %>% sample |> str(max.level = 2, give.attr = TRUE)
#  num [1:2143] 1 0 0 0 0 0 0 0 1 0 ...
# > ffqtot$currsm %>% sample |> str(max.level = 2, give.attr = TRUE)
#  num [1:2143] 0 0 0 0 0 0 0 0 0 1 ...
# > ffqtot$currsm %>% sample |> str(max.level = 2, give.attr = TRUE)
#  num [1:2143] 1 0 0 0 1 0 0 0 0 0 ...


function.Data_Exposure_Outcome_shuffle = function(Data_Exposure_Outcome, varname4Outcome = "Outcome", seed = NULL) {
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

    # if(!is.null(seed)) {
    #     set.seed(seed)
    # }

    out = Data_Exposure_Outcome
    out[[varname4Outcome]] = sample(out[[varname4Outcome]])
    out
}
ffqtot %>% select(currsm, fkcal)
set.seed(1)
ffqtot %>% select(currsm, fkcal) %>% function.Data_Exposure_Outcome_shuffle(varname4Outcome = "currsm")
ffqtot %>% select(currsm, fkcal) %>% function.Data_Exposure_Outcome_shuffle(varname4Outcome = "currsm")
ffqtot %>% select(currsm, fkcal) %>% function.Data_Exposure_Outcome_shuffle(varname4Outcome = "currsm")
# > ffqtot %>% select(currsm, fkcal)
# # A tibble: 2,143 x 2
#    currsm fkcal
#     <dbl> <dbl>
#  1      1 1395.
#  2      0 3377.
#  3      0 1472.
#  4      0 3036 
#  5      0 2577.
#  6      0 2057.
#  7      0 2498.
#  8      0 2581.
#  9      0 1780.
# 10      0 2130.
# # ... with 2,133 more rows
# > set.seed(1)
# > ffqtot %>% select(currsm, fkcal) %>% function.Data_Exposure_Outcome_shuffle(varname4Outcome = "currsm")
# # A tibble: 2,143 x 2
#    currsm fkcal
#     <dbl> <dbl>
#  1      1 1395.
#  2      0 3377.
#  3      0 1472.
#  4      0 3036 
#  5      0 2577.
#  6      0 2057.
#  7      0 2498.
#  8      0 2581.
#  9      1 1780.
# 10      0 2130.
# # ... with 2,133 more rows
# > ffqtot %>% select(currsm, fkcal) %>% function.Data_Exposure_Outcome_shuffle(varname4Outcome = "currsm")
# # A tibble: 2,143 x 2
#    currsm fkcal
#     <dbl> <dbl>
#  1      0 1395.
#  2      0 3377.
#  3      0 1472.
#  4      0 3036 
#  5      0 2577.
#  6      0 2057.
#  7      0 2498.
#  8      0 2581.
#  9      0 1780.
# 10      1 2130.
# # ... with 2,133 more rows
# > ffqtot %>% select(currsm, fkcal) %>% function.Data_Exposure_Outcome_shuffle(varname4Outcome = "currsm")
# # A tibble: 2,143 x 2
#    currsm fkcal
#     <dbl> <dbl>
#  1      1 1395.
#  2      0 3377.
#  3      0 1472.
#  4      0 3036 
#  5      1 2577.
#  6      0 2057.
#  7      0 2498.
#  8      0 2581.
#  9      0 1780.
# 10      0 2130.
# # ... with 2,133 more rows







## @ ffqtot.select ====  
ffqtot.select = ffqtot %>% 
    select(currsm, fkcal, atotfat, asat, aoleic, alinolc, achol, acarb, aprot, afiber, adca, adiron, adphos, adk, adna, advaiu, advare, adthiam, adribo, adniac, advc, atca, atiron, atvaiu, atthiri, atvc, asuptoc)
ffqtot.select
# > ffqtot.select
# # A tibble: 2,143 x 27
#    currsm fkcal atotfat  asat aoleic alinolc achol acarb aprot afiber  adca adiron adphos   adk  adna advaiu advare adthiam adribo adniac  advc  atca atiron atvaiu atthiri  atvc  asuptoc
#     <dbl> <dbl>   <dbl> <dbl>  <dbl>   <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl> <dbl>    <dbl>
#  1      1 1395.   107.   37.3   40.2   16.2   276.  233.  83.2  11.9   850.   13.5  1266. 3027. 3174. 10690.  1556.    1.07   1.70   18.6 185.   834.   12.8 10334.    2.63 176.   0.00722
#  2      0 3377.    80.2  31.3   29.8    7.33  573.  244. 120.   17.2   998.   18.5  1809. 3631. 3290. 10748.  1822.    1.78   2.70   19.4 250.  1016.   19.4 11080.    4.70 261.   0      
#  3      0 1472.   102.   35.4   37.9   12.2   398.  198. 107.   12.3   593.   16.8  1423. 2685. 3919. 11366.  1904.    1.16   1.76   25.5  74.6  582.   16.0 11030.    2.79  70.8  0.00638
#  4      0 3036     86.5  32.2   31.8   14.0   344.  267.  98.4  15.3  1085.   15.2  1595. 2529. 3552. 24689.  3677.    1.28   2.46   22.1 142.  1100.   15.7 25257.    3.88 147.   0      
#  5      0 2577.   102.   38.3   37.7   12.5   476.  224.  96.2  13.3   675.   16.5  1383. 2874. 4134. 13899.  2104.    1.40   1.83   23.1 103.   680.   16.8 14049.    3.28 105.   0      
#  6      0 2057.   109.   45.0   42.1   10.5   538.  148. 103.    8.30  968.   16.9  1568. 2744. 3242. 17850.  4185.    1.07   2.80   23.8  79.1  965.   16.7 17750.    3.83  78.1  0.00120
#  7      0 2498.    94.3  32.0   38.3   14.3   333.  235.  94.2  16.5   774.   15.8  1500. 3097. 2933. 16520.  2100.    1.35   1.97   24.7 153.   778.   32.4 21189.    4.73 211.  29.9    
#  8      0 2581.    94.0  35.0   37.7   11.7   511.  249.  85.4  13.2   674.   14.7  1249. 2711. 2823. 18747.  2541.    1.05   1.83   19.6 242.   678.   15.0 18953.    2.92 246.   0      
#  9      0 1780.    66.5  19.7   17.6    9.78  261.  265.  69.7  18.5  1103.   17.6  1507. 3151. 3356. 11222.  1926.    1.71   2.71   22.7 199.  1093.   17.2 11043.    4.31 194.   0.00343
# 10      0 2130.    92.9  34.6   34.5   14.1   418.  241. 103.   19.2   653.   19.3  1562. 3071. 4105. 13243.  2112.    1.45   2.08   28.7  85.9  652.   37.9 18387.    5.07 659.  30.0    
# # ... with 2,133 more rows




## @ ffqtot.select.permutation_list =====  
ffqtot.select = ffqtot %>% 
    select(currsm, fkcal, atotfat, asat, aoleic, alinolc, achol, acarb, aprot, afiber, adca, adiron, adphos, adk, adna, advaiu, advare, adthiam, adribo, adniac, advc, atca, atiron, atvaiu, atthiri, atvc, asuptoc)
ffqtot.select.permutation_list = list()
set.seed(1)
for (i in 1:500) {
    ffqtot.select.permutation_list[[i]] = ffqtot.select
    ffqtot.select.permutation_list[[i]]$currsm = sample(ffqtot.select$currsm)
}
ffqtot.select.permutation_list |> str(max.level = 1, give.attr = TRUE) #----
# > ffqtot.select.permutation_list |> str(max.level = 1, give.attr = TRUE) #----  
# List of 500
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2143 obs. of  27 variables:
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2143 obs. of  27 variables:
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2143 obs. of  27 variables:
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2143 obs. of  27 variables:
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2143 obs. of  27 variables:

ffqtot.select.permutation_list[[1]]
ffqtot.select.permutation_list[[2]]
ffqtot.select.permutation_list[[3]]
# > ffqtot.select.permutation_list[[1]]
# # A tibble: 2,143 x 27
#    currsm fkcal atotfat  asat aoleic alinolc achol acarb aprot afiber  adca adiron adphos   adk  adna advaiu advare adthiam adribo adniac  advc  atca atiron atvaiu atthiri  atvc  asuptoc
#     <dbl> <dbl>   <dbl> <dbl>  <dbl>   <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl> <dbl>    <dbl>
#  1      1 1395.   107.   37.3   40.2   16.2   276.  233.  83.2  11.9   850.   13.5  1266. 3027. 3174. 10690.  1556.    1.07   1.70   18.6 185.   834.   12.8 10334.    2.63 176.   0.00722
#  2      0 3377.    80.2  31.3   29.8    7.33  573.  244. 120.   17.2   998.   18.5  1809. 3631. 3290. 10748.  1822.    1.78   2.70   19.4 250.  1016.   19.4 11080.    4.70 261.   0      
#  3      0 1472.   102.   35.4   37.9   12.2   398.  198. 107.   12.3   593.   16.8  1423. 2685. 3919. 11366.  1904.    1.16   1.76   25.5  74.6  582.   16.0 11030.    2.79  70.8  0.00638
#  4      0 3036     86.5  32.2   31.8   14.0   344.  267.  98.4  15.3  1085.   15.2  1595. 2529. 3552. 24689.  3677.    1.28   2.46   22.1 142.  1100.   15.7 25257.    3.88 147.   0      
#  5      0 2577.   102.   38.3   37.7   12.5   476.  224.  96.2  13.3   675.   16.5  1383. 2874. 4134. 13899.  2104.    1.40   1.83   23.1 103.   680.   16.8 14049.    3.28 105.   0      
#  6      0 2057.   109.   45.0   42.1   10.5   538.  148. 103.    8.30  968.   16.9  1568. 2744. 3242. 17850.  4185.    1.07   2.80   23.8  79.1  965.   16.7 17750.    3.83  78.1  0.00120
#  7      0 2498.    94.3  32.0   38.3   14.3   333.  235.  94.2  16.5   774.   15.8  1500. 3097. 2933. 16520.  2100.    1.35   1.97   24.7 153.   778.   32.4 21189.    4.73 211.  29.9    
#  8      0 2581.    94.0  35.0   37.7   11.7   511.  249.  85.4  13.2   674.   14.7  1249. 2711. 2823. 18747.  2541.    1.05   1.83   19.6 242.   678.   15.0 18953.    2.92 246.   0      
#  9      1 1780.    66.5  19.7   17.6    9.78  261.  265.  69.7  18.5  1103.   17.6  1507. 3151. 3356. 11222.  1926.    1.71   2.71   22.7 199.  1093.   17.2 11043.    4.31 194.   0.00343
# 10      0 2130.    92.9  34.6   34.5   14.1   418.  241. 103.   19.2   653.   19.3  1562. 3071. 4105. 13243.  2112.    1.45   2.08   28.7  85.9  652.   37.9 18387.    5.07 659.  30.0    
# # ... with 2,133 more rows
# > ffqtot.select.permutation_list[[2]]
# # A tibble: 2,143 x 27
#    currsm fkcal atotfat  asat aoleic alinolc achol acarb aprot afiber  adca adiron adphos   adk  adna advaiu advare adthiam adribo adniac  advc  atca atiron atvaiu atthiri  atvc  asuptoc
#     <dbl> <dbl>   <dbl> <dbl>  <dbl>   <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl> <dbl>    <dbl>
#  1      0 1395.   107.   37.3   40.2   16.2   276.  233.  83.2  11.9   850.   13.5  1266. 3027. 3174. 10690.  1556.    1.07   1.70   18.6 185.   834.   12.8 10334.    2.63 176.   0.00722
#  2      0 3377.    80.2  31.3   29.8    7.33  573.  244. 120.   17.2   998.   18.5  1809. 3631. 3290. 10748.  1822.    1.78   2.70   19.4 250.  1016.   19.4 11080.    4.70 261.   0      
#  3      0 1472.   102.   35.4   37.9   12.2   398.  198. 107.   12.3   593.   16.8  1423. 2685. 3919. 11366.  1904.    1.16   1.76   25.5  74.6  582.   16.0 11030.    2.79  70.8  0.00638
#  4      0 3036     86.5  32.2   31.8   14.0   344.  267.  98.4  15.3  1085.   15.2  1595. 2529. 3552. 24689.  3677.    1.28   2.46   22.1 142.  1100.   15.7 25257.    3.88 147.   0      
#  5      0 2577.   102.   38.3   37.7   12.5   476.  224.  96.2  13.3   675.   16.5  1383. 2874. 4134. 13899.  2104.    1.40   1.83   23.1 103.   680.   16.8 14049.    3.28 105.   0      
#  6      0 2057.   109.   45.0   42.1   10.5   538.  148. 103.    8.30  968.   16.9  1568. 2744. 3242. 17850.  4185.    1.07   2.80   23.8  79.1  965.   16.7 17750.    3.83  78.1  0.00120
#  7      0 2498.    94.3  32.0   38.3   14.3   333.  235.  94.2  16.5   774.   15.8  1500. 3097. 2933. 16520.  2100.    1.35   1.97   24.7 153.   778.   32.4 21189.    4.73 211.  29.9    
#  8      0 2581.    94.0  35.0   37.7   11.7   511.  249.  85.4  13.2   674.   14.7  1249. 2711. 2823. 18747.  2541.    1.05   1.83   19.6 242.   678.   15.0 18953.    2.92 246.   0      
#  9      0 1780.    66.5  19.7   17.6    9.78  261.  265.  69.7  18.5  1103.   17.6  1507. 3151. 3356. 11222.  1926.    1.71   2.71   22.7 199.  1093.   17.2 11043.    4.31 194.   0.00343
# 10      1 2130.    92.9  34.6   34.5   14.1   418.  241. 103.   19.2   653.   19.3  1562. 3071. 4105. 13243.  2112.    1.45   2.08   28.7  85.9  652.   37.9 18387.    5.07 659.  30.0    
# # ... with 2,133 more rows
# > ffqtot.select.permutation_list[[3]]
# # A tibble: 2,143 x 27
#    currsm fkcal atotfat  asat aoleic alinolc achol acarb aprot afiber  adca adiron adphos   adk  adna advaiu advare adthiam adribo adniac  advc  atca atiron atvaiu atthiri  atvc  asuptoc
#     <dbl> <dbl>   <dbl> <dbl>  <dbl>   <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl> <dbl>    <dbl>
#  1      1 1395.   107.   37.3   40.2   16.2   276.  233.  83.2  11.9   850.   13.5  1266. 3027. 3174. 10690.  1556.    1.07   1.70   18.6 185.   834.   12.8 10334.    2.63 176.   0.00722
#  2      0 3377.    80.2  31.3   29.8    7.33  573.  244. 120.   17.2   998.   18.5  1809. 3631. 3290. 10748.  1822.    1.78   2.70   19.4 250.  1016.   19.4 11080.    4.70 261.   0      
#  3      0 1472.   102.   35.4   37.9   12.2   398.  198. 107.   12.3   593.   16.8  1423. 2685. 3919. 11366.  1904.    1.16   1.76   25.5  74.6  582.   16.0 11030.    2.79  70.8  0.00638
#  4      0 3036     86.5  32.2   31.8   14.0   344.  267.  98.4  15.3  1085.   15.2  1595. 2529. 3552. 24689.  3677.    1.28   2.46   22.1 142.  1100.   15.7 25257.    3.88 147.   0      
#  5      1 2577.   102.   38.3   37.7   12.5   476.  224.  96.2  13.3   675.   16.5  1383. 2874. 4134. 13899.  2104.    1.40   1.83   23.1 103.   680.   16.8 14049.    3.28 105.   0      
#  6      0 2057.   109.   45.0   42.1   10.5   538.  148. 103.    8.30  968.   16.9  1568. 2744. 3242. 17850.  4185.    1.07   2.80   23.8  79.1  965.   16.7 17750.    3.83  78.1  0.00120
#  7      0 2498.    94.3  32.0   38.3   14.3   333.  235.  94.2  16.5   774.   15.8  1500. 3097. 2933. 16520.  2100.    1.35   1.97   24.7 153.   778.   32.4 21189.    4.73 211.  29.9    
#  8      0 2581.    94.0  35.0   37.7   11.7   511.  249.  85.4  13.2   674.   14.7  1249. 2711. 2823. 18747.  2541.    1.05   1.83   19.6 242.   678.   15.0 18953.    2.92 246.   0      
#  9      0 1780.    66.5  19.7   17.6    9.78  261.  265.  69.7  18.5  1103.   17.6  1507. 3151. 3356. 11222.  1926.    1.71   2.71   22.7 199.  1093.   17.2 11043.    4.31 194.   0.00343
# 10      0 2130.    92.9  34.6   34.5   14.1   418.  241. 103.   19.2   653.   19.3  1562. 3071. 4105. 13243.  2112.    1.45   2.08   28.7  85.9  652.   37.9 18387.    5.07 659.  30.0    
# # ... with 2,133 more rows








## @ Calculation of mean difference between the groups ----  
ffqtot.select %>% group_by(currsm) %>% summarise(mean(fkcal))
# > ffqtot.select %>% group_by(currsm) %>% summarise(mean(fkcal))
# # A tibble: 2 x 2
#   currsm `mean(fkcal)`
#    <dbl>         <dbl>
# 1      0         2417.
# 2      1         2439.


mean(ffqtot.select[ffqtot.select$currsm==1,]$fkcal) - mean(ffqtot.select[ffqtot.select$currsm==0,]$fkcal)
# > mean(ffqtot.select[ffqtot.select$currsm==1,]$fkcal) - mean(ffqtot.select[ffqtot.select$currsm==0,]$fkcal)
# [1] 22.86106


ffqtot.select %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----
ffqtot.select.permutation_list[[1]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----
ffqtot.select.permutation_list[[2]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----
ffqtot.select.permutation_list[[3]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----
# > ffqtot.select %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]}
#   mean(fkcal)
# 1    22.86106
# > ffqtot.select.permutation_list[[1]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----  
#   mean(fkcal)
# 1   -56.78954
# > ffqtot.select.permutation_list[[2]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----  
#   mean(fkcal)
# 1   -138.1856
# > ffqtot.select.permutation_list[[3]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} #----  
#   mean(fkcal)
# 1   -41.23212



## @ permutation_results_single -----  
permutation_results_single = list()
for (i in 1:length(ffqtot.select.permutation_list)) {
    permutation_results_single[[i]] = ffqtot.select.permutation_list[[i]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]}
}
permutation_results_single = unlist(permutation_results_single)
permutation_results_single |> str() #----
# > permutation_results_single |> str() #----  
#  Named num [1:500] -56.8 -138.2 -41.2 -39.7 -55.9 ...
#  - attr(*, "names")= chr [1:500] "mean(fkcal)" "mean(fkcal)" "mean(fkcal)" "mean(fkcal)" ...




permutation_results_single = list()
for (i in 1:length(ffqtot.select.permutation_list)) {
    permutation_results_single[[i]] = ffqtot.select.permutation_list[[i]] %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]}
}
permutation_results_single = unlist(permutation_results_single)
permutation_results_single |> str() #----




## @ permutation_results_multiple =====  
permutation_results_multiple = matrix(nrow = length(ffqtot.select.permutation_list), ncol = ncol(ffqtot.select) - 1) 
for (j in 1:ncol(ffqtot.select)) {
    if (names(ffqtot.select)[j] != "currsm") {
        
    }
}



## @ permutation_results =====  
permutation_results_multiple = list()
for (j in c("fkcal", "atotfat", "asat")) {
# for (j in c("fkcal", "atotfat", "asat", "aoleic", "alinolc", "achol", "acarb", "aprot", "afiber", "adca", "adiron", "adphos", "adk", "adna", "advaiu", "advare", "adthiam", "adribo", "adniac", "advc", "atca", "atiron", "atvaiu", "atthiri", "atvc", "asuptoc")) {
    permutation_results_single = list()
    for (i in 1:length(ffqtot.select.permutation_list)) {
        permutation_results_single[[i]] = ffqtot.select.permutation_list[[i]] %>% group_by(currsm) %>% summarise(mean(!!j)) %>% {.[2,2] - .[1,2]}
    }
    permutation_results_multiple[[j]] = unlist(permutation_results_single)
}
permutation_results_multiple = permutation_results_multiple |> as_data_frame()
permutation_results_multiple
warnings()
# > permutation_results_multiple
# # A tibble: 500 x 3
#     asat fkcal atotfat
#    <dbl> <dbl>   <dbl>
#  1    NA    NA      NA
#  2    NA    NA      NA
#  3    NA    NA      NA
#  4    NA    NA      NA
#  5    NA    NA      NA
#  6    NA    NA      NA
#  7    NA    NA      NA
#  8    NA    NA      NA
#  9    NA    NA      NA
# 10    NA    NA      NA
# # ... with 490 more rows
# > warnings()
# Warning messages:
# 1: In mean.default("fkcal") : argument is not numeric or logical: returning NA
# 2: In mean.default("fkcal") : argument is not numeric or logical: returning NA
# 3: In mean.default("fkcal") : argument is not numeric or logical: returning NA
# 4: In mean.default("fkcal") : argument is not numeric or logical: returning NA





## @ permutation_results =====  
permutation_results_multiple = list()
# for (j in c("fkcal", "atotfat", "asat")) {
for (j in c("fkcal", "atotfat", "asat", "aoleic", "alinolc", "achol", "acarb", "aprot", "afiber", "adca", "adiron", "adphos", "adk", "adna", "advaiu", "advare", "adthiam", "adribo", "adniac", "advc", "atca", "atiron", "atvaiu", "atthiri", "atvc", "asuptoc")) {
    permutation_results_single = list()
    for (i in 1:length(ffqtot.select.permutation_list)) {
        permutation_results_single[[i]] = ffqtot.select.permutation_list[[i]] %>% group_by(currsm) %>% summarise(mean(eval(parse(text = j)))) %>% {.[2,2] - .[1,2]}
    }
    permutation_results_multiple[[j]] = unlist(permutation_results_single)
}
permutation_results_multiple = permutation_results_multiple |> as_data_frame()
permutation_results_multiple #----
# > permutation_results_multiple #----  
# # A tibble: 500 x 26
#     fkcal atotfat    asat  aoleic alinolc  achol  acarb   aprot  afiber   adca   adiron  adphos    adk     adna  advaiu advare   adthiam   adribo  adniac    advc    atca atiron atvaiu atthiri   atvc asuptoc
#     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>  <dbl>  <dbl>   <dbl>   <dbl>  <dbl>    <dbl>   <dbl>  <dbl>    <dbl>   <dbl>  <dbl>     <dbl>    <dbl>   <dbl>   <dbl>   <dbl>  <dbl>  <dbl>   <dbl>  <dbl>   <dbl>
#  1  -56.8  -0.994 -0.814  -0.284  -0.0447 -15.1   1.29  -0.0642  0.302  -12.5   0.271    -2.84   71.2     0.314 -422.    -27.0  0.0310    0.00487  0.545    1.28   -1.28  -0.275 -743.  -0.127   33.0     7.79
#  2 -138.    1.01   0.487   0.367   0.225   10.1  -0.850  0.481  -0.323  -25.3   0.432   -19.4   -10.8    92.6     76.6    30.1  0.00775  -0.00688  0.574   -1.58  -25.5   -0.699 -585.  -0.288  -37.2     6.96
#  3  -41.2   0.683  0.484  -0.110   0.284    1.93 -1.93  -0.958  -0.355    5.83 -0.288    -6.79  -45.7    -7.21  -385.    -41.7 -0.0266   -0.0526  -0.572    2.55  -23.7   -0.701 -530.   0.0306 -30.5     3.43
#  4  -39.7  -0.959 -0.0695 -0.168  -0.294    8.25  2.78  -0.146  -0.0520  -7.94 -0.00705  -8.75  -55.4    22.6      7.87   85.4  0.000860  0.0195  -0.210    4.03   27.3   -0.487 -361.   0.0409  47.9     4.45
#  5  -55.9   1.36   0.0835  0.451   0.666    3.69 -2.38   1.19   -0.0565 -43.1   0.0826  -24.4   -33.4    62.5     22.1   -27.2 -0.000797 -0.0570   0.343   -0.818 -27.2    1.39   270.  -0.0740  29.1    12.2 
#  6  102.   -2.23  -0.586  -1.05   -0.340   -2.65  4.70   1.01    0.235   15.6   0.125    22.6    76.1     8.50     3.20  -30.3  0.00942  -0.00904  0.218    1.43   29.9   -0.422 -401.  -0.0301 -46.5    -8.19
#  7   16.5  -2.38  -0.713  -0.753  -0.603    5.12  6.96  -0.503   0.544    7.76  0.0612    4.53   40.8    45.5    378.     63.1  0.0199    0.0264  -0.0538  10.6    -0.985 -0.559  -32.2 -0.142  -25.7    -1.56
#  8   83.6   0.230  0.191   0.0172 -0.0849  -1.95 -3.78  -0.477  -0.407  -18.1  -0.157   -20.2     2.43  -86.4   -505.    -17.8 -0.0330   -0.0523  -0.0335  -2.79  -15.9    0.751 -154.   0.0545   2.71   12.4 
#  9  -45.9  -1.43  -0.200  -0.586  -0.696   -8.29  3.05   0.248   0.0967  -9.85  0.159     0.118  22.0   -25.6     29.1   -29.8  0.00831  -0.0209   0.329    6.50  -33.3    0.632   77.1  0.273   23.2   -10.1 
# 10   38.6  -1.74  -0.259  -0.923  -0.467    9.55  4.67   1.14    0.600   33.1   0.253    31.6    66.7   102.    -482.    -29.1  0.0297    0.0476   0.101    9.40   39.0    0.445 -129.   0.114   23.7    13.8 
# # ... with 490 more rows


# > permutation_results_single |> str() #----  
#  Named num [1:500] -56.8 -138.2 -41.2 -39.7 -55.9 ...
#  - attr(*, "names")= chr [1:500] "mean(fkcal)" "mean(fkcal)" "mean(fkcal)" "mean(fkcal)" ...



EmpiricalDistributionOfStatisticValue = permutation_results_multiple$fkcal
ObservedStatisticValue = ffqtot.select %>% group_by(currsm) %>% summarise(mean(fkcal)) %>% {.[2,2] - .[1,2]} |> unlist()

hist(EmpiricalDistributionOfStatisticValue, col = "gray", breaks = 100)
abline(v = ObservedStatisticValue, col = "blue", lwd = 2)
sum(abs(EmpiricalDistributionOfStatisticValue) > abs(ObservedStatisticValue) ) / length(EmpiricalDistributionOfStatisticValue)  # two-tailed test
# > sum(abs(EmpiricalDistributionOfStatisticValue) > abs(ObservedStatisticValue) ) / length(EmpiricalDistributionOfStatisticValue)  # two-tailed test
# [1] 0.746


## @ t.test -----  
# ?t.test  # Open the help documentation for the t.test() function. ----  
t.test(formula = fkcal ~ currsm, data = ffqtot)       # Print the default output. Formula is in "y ~ x" format.
str(t.test(formula = fkcal ~ currsm, data = ffqtot))  # Print the "structure" of the default output.
t.test(formula = fkcal ~ currsm, data = ffqtot)$p.value # Print the "structure" of the default output.
# > t.test(formula = fkcal ~ currsm, data = ffqtot)       # Print the default output. Formula is in "y ~ x" format.
# 
# 	Welch Two Sample t-test
# 
# data:  fkcal by currsm
# t = -0.31722, df = 308.35, p-value = 0.7513
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -164.6674  118.9453
# sample estimates:
# mean in group 0 mean in group 1 
#        2416.602        2439.463 
# 
# > str(t.test(formula = fkcal ~ currsm, data = ffqtot))  # Print the "structure" of the default output.
# List of 9
#  $ statistic  : Named num -0.317
#   ..- attr(*, "names")= chr "t"
#  $ parameter  : Named num 308
#   ..- attr(*, "names")= chr "df"
#  $ p.value    : num 0.751
#  $ conf.int   : num [1:2] -165 119
#   ..- attr(*, "conf.level")= num 0.95
#  $ estimate   : Named num [1:2] 2417 2439
#   ..- attr(*, "names")= chr [1:2] "mean in group 0" "mean in group 1"
#  $ null.value : Named num 0
#   ..- attr(*, "names")= chr "difference in means"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Welch Two Sample t-test"
#  $ data.name  : chr "fkcal by currsm"
#  - attr(*, "class")= chr "htest"
# > t.test(formula = fkcal ~ currsm, data = ffqtot)$p.value # Print the "structure" of the default output.
# [1] 0.7512936





## @ permutationP_multiple =====  
permutationP_multiple = list()
for (i in c("fkcal", "atotfat", "asat", "aoleic", "alinolc", "achol", "acarb", "aprot", "afiber", "adca", "adiron", "adphos", "adk", "adna", "advaiu", "advare", "adthiam", "adribo", "adniac", "advc", "atca", "atiron", "atvaiu", "atthiri", "atvc", "asuptoc") ) {
    EmpiricalDistributionOfStatisticValue = permutation_results_multiple[[i]]
    ObservedStatisticValue = ffqtot.select %>% group_by(currsm) %>% summarise(mean(eval(parse(text = i)))) %>% {.[2,2] - .[1,2]} |> unlist()
    
    permutationP_multiple[[i]] = sum(abs(EmpiricalDistributionOfStatisticValue) > abs(ObservedStatisticValue) ) / length(EmpiricalDistributionOfStatisticValue)  # two-tailed test
    
}
permutationP_multiple = permutationP_multiple |> unlist()
permutationP_multiple |> str(max.level = 1, give.attr = TRUE) #-----
# > permutationP_multiple |> str(max.level = 1, give.attr = TRUE) #-----  
#  Named num [1:26] 0.746 0 0 0 0.752 0 0 0.086 0 0.088 ...
#  - attr(*, "names")= chr [1:26] "fkcal" "atotfat" "asat" "aoleic" ...





## @ Advanced Topic: Vectorized Function ----  
# ffqtot.select.permutation_list %>% map(function(Data) {
#     Data
# })  
  
# __________|------  
# 〚〛 END----  

