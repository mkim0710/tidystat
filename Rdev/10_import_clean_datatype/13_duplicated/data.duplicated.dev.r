# data.duplicated.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_duplicated/data.duplicated.dev.r
library(tidyverse)



nhis_heals_gj0215.0213[
    c("HCHK_YEAR", "PERSON_ID", "YKIHO_GUBUN_CD", "HME_DT", "BMI",
      "BP_HIGH", "BP_LWST", "BLDS", "TOT_CHOLE", "HMG", "GLY_CD", "OLIG_OCCU_CD",
      "OLIG_PH", "OLIG_PROTE_CD", "SGOT_AST", "SGPT_ALT", "GAMMA_GTP",
      "HCHK_PMH_CD1", "HCHK_PMH_CD2", "HCHK_PMH_CD3", "FMLY_LIVER_DISE_PATIEN_YN",
      "FMLY_HPRTS_PATIEN_YN", "FMLY_APOP_PATIEN_YN", "FMLY_HDISE_PATIEN_YN",
      "FMLY_DIABML_PATIEN_YN", "FMLY_CANCER_PATIEN_YN", "SMK_STAT_TYPE_RSPS_CD",
      "SMK_TERM_RSPS_CD", "DSQTY_RSPS_CD", "DRNK_HABIT_RSPS_CD", "EXERCI_FREQ_RSPS_CD",
      "WAIST", "TM1_DRKQTY_RSPS_CD", "TRIGLYCERIDE", "HDL_CHOLE", "LDL_CHOLE",
      "CREATININE", "HCHK_APOP_PMH_YN", "HCHK_HDISE_PMH_YN", "HCHK_HPRTS_PMH_YN",
      "HCHK_DIABML_PMH_YN", "HCHK_HPLPDM_PMH_YN", "HCHK_ETCDSE_PMH_YN",
      "PAST_SMK_TERM_RSPS_CD", "PAST_DSQTY_RSPS_CD", "CUR_SMK_TERM_RSPS_CD",
      "CUR_DSQTY_RSPS_CD", "MOV20_WEK_FREQ_ID", "MOV30_WEK_FREQ_ID",
      "WLK30_WEK_FREQ_ID", "KDSQ_C_1", "KDSQ_C_2", "KDSQ_C_3", "KDSQ_C_4",
      "KDSQ_C_5", "KDSQ_C", "HCHK_PHSS_PMH_YN")] %>% 
    group_by_at(vars(-PERSON_ID)) %>% dplyr::filter(n()>1) 
# # A tibble: 2 × 57
# # Groups:   HCHK_YEAR, YKIHO_GUBUN_CD, HME_DT, BMI, BP_HIGH, BP_LWST, BLDS, TOT_CHOLE, HMG, GLY_CD, OLIG_OCCU_CD, OLIG_PH, OLIG_PROTE_CD,
# #   SGOT_AST, SGPT_ALT, GAMMA_GTP, HCHK_PMH_CD1, HCHK_PMH_CD2, HCHK_PMH_CD3, FMLY_LIVER_DISE_PATIEN_YN, FMLY_HPRTS_PATIEN_YN,
# #   FMLY_APOP_PATIEN_YN, FMLY_HDISE_PATIEN_YN, FMLY_DIABML_PATIEN_YN, FMLY_CANCER_PATIEN_YN, SMK_STAT_TYPE_RSPS_CD, SMK_TERM_RSPS_CD,
# #   DSQTY_RSPS_CD, DRNK_HABIT_RSPS_CD, EXERCI_FREQ_RSPS_CD, WAIST, TM1_DRKQTY_RSPS_CD, TRIGLYCERIDE, HDL_CHOLE, LDL_CHOLE, CREATININE,
# #   HCHK_APOP_PMH_YN, HCHK_HDISE_PMH_YN, HCHK_HPRTS_PMH_YN, HCHK_DIABML_PMH_YN, HCHK_HPLPDM_PMH_YN, HCHK_ETCDSE_PMH_YN, PAST_SMK_TERM_RSPS_CD,
# #   PAST_DSQTY_RSPS_CD, CUR_SMK_TERM_RSPS_CD, CUR_DSQTY_RSPS_CD, MOV20_WEK_FREQ_ID, MOV30_WEK_FREQ_ID, WLK30_WEK_FREQ_ID, KDSQ_C_1, KDSQ_C_2,
# #   KDSQ_C_3, KDSQ_C_4, KDSQ_C_5, KDSQ_C, HCHK_PHSS_PMH_YN [1]
#   HCHK_YEAR PERSON_ID YKIHO_GUBUN_CD HME_DT     BMI BP_HIGH BP_LWST  BLDS TOT_CHOLE   HMG GLY_CD OLIG_OCCU_CD OLIG_PH OLIG_PROTE_CD SGOT_AST
#   <chr>     <chr>     <chr>          <chr>    <dbl>   <dbl>   <dbl> <dbl>     <dbl> <dbl>  <dbl> <chr>          <dbl> <chr>            <dbl>
# 1 2003      35131128  10             20030521  24.1     120      75    84       220    12      1 1                  6 1                   14
# 2 2003      54934071  10             20030521  24.1     120      75    84       220    12      1 1                  6 1                   14
# # ℹ 42 more variables: SGPT_ALT <dbl>, GAMMA_GTP <dbl>, HCHK_PMH_CD1 <chr>, HCHK_PMH_CD2 <chr>, HCHK_PMH_CD3 <chr>,
# #   FMLY_LIVER_DISE_PATIEN_YN <chr>, FMLY_HPRTS_PATIEN_YN <chr>, FMLY_APOP_PATIEN_YN <chr>, FMLY_HDISE_PATIEN_YN <chr>,
# #   FMLY_DIABML_PATIEN_YN <chr>, FMLY_CANCER_PATIEN_YN <chr>, SMK_STAT_TYPE_RSPS_CD <chr>, SMK_TERM_RSPS_CD <chr>, DSQTY_RSPS_CD <chr>,
# #   DRNK_HABIT_RSPS_CD <chr>, EXERCI_FREQ_RSPS_CD <chr>, WAIST <dbl>, TM1_DRKQTY_RSPS_CD <dbl>, TRIGLYCERIDE <dbl>, HDL_CHOLE <dbl>,
# #   LDL_CHOLE <dbl>, CREATININE <dbl>, HCHK_APOP_PMH_YN <chr>, HCHK_HDISE_PMH_YN <chr>, HCHK_HPRTS_PMH_YN <chr>, HCHK_DIABML_PMH_YN <chr>,
# #   HCHK_HPLPDM_PMH_YN <chr>, HCHK_ETCDSE_PMH_YN <chr>, PAST_SMK_TERM_RSPS_CD <dbl>, PAST_DSQTY_RSPS_CD <dbl>, CUR_SMK_TERM_RSPS_CD <dbl>,
# #   CUR_DSQTY_RSPS_CD <dbl>, MOV20_WEK_FREQ_ID <chr>, MOV30_WEK_FREQ_ID <chr>, WLK30_WEK_FREQ_ID <chr>, KDSQ_C_1 <chr>, KDSQ_C_2 <chr>, …




# https://stackoverflow.com/questions/22959635/remove-duplicated-rows-using-dplyr
library(tidyverse)
set.seed(1234)
df.example = data.frame(x=sample(0:1,10,replace=T),y=sample(0:1,10,replace=T)) |> rownames_to_column()
# df.example |> tribble_paste() #----  
tibble::tribble(
    ~rowname, ~x, ~y,
         "1", 0L, 1L,
         "2", 1L, 1L,
         "3", 1L, 0L,
         "4", 1L, 1L,
         "5", 1L, 0L,
         "6", 1L, 1L,
         "7", 0L, 0L,
         "8", 0L, 0L,
         "9", 1L, 0L,
        "10", 1L, 0L
    )


df.example %>% group_by(x,y) %>% summarize(n())
# > df.example %>% group_by(x,y) %>% summarize(n())
# # A tibble: 4 x 3
# # Groups:   x [2]
#       x     y `n()`
#   <int> <int> <int>
# 1     0     0     2
# 2     0     1     1
# 3     1     0     4
# 4     1     1     3


df.example %>% 
    (function(df) {
        df %>% group_by(x,y) %>% summarize(n()) %>% 
            left_join(df)
    })
# > df.example %>% 
# +     (function(df) {
# +         df %>% group_by(x,y) %>% summarize(n()) %>% 
# +             left_join(df)
# +     })
# Joining, by = c("x", "y")
# # A tibble: 10 x 4
# # Groups:   x [2]
#        x     y `n()` rowname
#    <int> <int> <int> <chr>  
#  1     0     0     2 7      
#  2     0     0     2 8      
#  3     0     1     1 1      
#  4     1     0     4 3      
#  5     1     0     4 5      
#  6     1     0     4 9      
#  7     1     0     4 10     
#  8     1     1     3 2      
#  9     1     1     3 4      
# 10     1     1     3 6  




df.example %>% 
    (function(df.example) {
        df.example %>% group_by(x,y) %>% summarize(n()) %>% 
            left_join(df.example)
    }) %>% group_by(x, y, `n()`) %>% nest
# > df.example %>% 
# +     (function(df.example) {
# +         df.example %>% group_by(x,y) %>% summarize(n()) %>% 
# +             left_join(df.example)
# +     }) %>% group_by(x, y, `n()`) %>% nest
# Joining, by = c("x", "y")
# # A tibble: 4 x 4
#       x     y `n()` data            
#   <int> <int> <int> <list>          
# 1     0     0     2 <tibble [2 x 1]>
# 2     0     1     1 <tibble [1 x 1]>
# 3     1     0     4 <tibble [4 x 1]>
# 4     1     1     3 <tibble [3 x 1]>


df.example %>% group_by(x, y) %>% nest %>% 
    mutate(nrow = data %>% map_dbl(nrow))
df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
    mutate(nrow = data %>% map_dbl(nrow))
# > df.example %>% group_by(x, y) %>% nest %>% 
# +     mutate(nrow = data %>% map_dbl(nrow))
# # A tibble: 4 x 4
#       x     y data              nrow
#   <int> <int> <list>           <dbl>
# 1     0     1 <tibble [1 x 1]>     1
# 2     1     1 <tibble [3 x 1]>     3
# 3     1     0 <tibble [4 x 1]>     4
# 4     0     0 <tibble [2 x 1]>     2
# > df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
# +     mutate(nrow = data %>% map_dbl(nrow))
# # A tibble: 4 x 4
#       x     y data              nrow
#   <int> <int> <list>           <dbl>
# 1     0     0 <tibble [2 x 1]>     2
# 2     0     1 <tibble [1 x 1]>     1
# 3     1     0 <tibble [4 x 1]>     4
# 4     1     1 <tibble [3 x 1]>     3


df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
    mutate(data = data %>% map_chr(paste0, collapse = "|"))
# > df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
# +     mutate(data = data %>% map_chr(paste0, collapse = "|"))
# # A tibble: 4 x 3
#       x     y data                            
#   <int> <int> <chr>                           
# 1     0     0 "c(\"7\", \"8\")"               
# 2     0     1 1                               
# 3     1     0 "c(\"3\", \"5\", \"9\", \"10\")"
# 4     1     1 "c(\"2\", \"4\", \"6\")" 





# https://stackoverflow.com/questions/22959635/remove-duplicated-rows-using-dplyr
set.seed(1234)
df.example = data.frame(x=sample(0:1,10,replace=T),y=sample(0:1,10,replace=T)) |> rownames_to_column()
# df.example |> tribble_paste() #----  
tibble::tribble(
    ~rowname, ~x, ~y,
         "1", 0L, 1L,
         "2", 1L, 1L,
         "3", 1L, 0L,
         "4", 1L, 1L,
         "5", 1L, 0L,
         "6", 1L, 1L,
         "7", 0L, 0L,
         "8", 0L, 0L,
         "9", 1L, 0L,
        "10", 1L, 0L
    )



df.example[!duplicated(df.example[,c("x", "y")]),]
df.example %>% group_by(x, y) %>% dplyr::filter(row_number(rowname) == 1)
df.example %>% group_by(x, y) %>% slice(1)
df.example %>% group_by(x, y) %>% do(head(.,1))
df.example %>% distinct(x, y)
df.example %>% distinct(x, y, .keep_all = TRUE)
df.example %>% group_by(x) %>% filter (! duplicated(y))
# > df.example[!duplicated(df.example[,c("x", "y")]),]
#   rowname x y
# 1       1 0 1
# 2       2 1 1
# 3       3 1 0
# 7       7 0 0
# > df.example %>% group_by(x, y) %>% dplyr::filter(row_number(rowname) == 1)
# # A tibble: 4 x 3
# # Groups:   x, y [4]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 1           0     1
# 2 2           1     1
# 3 7           0     0
# 4 10          1     0
# > df.example %>% group_by(x, y) %>% slice(1)
# # A tibble: 4 x 3
# # Groups:   x, y [4]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 7           0     0
# 2 1           0     1
# 3 3           1     0
# 4 2           1     1
# > df.example %>% group_by(x, y) %>% do(head(.,1))
# # A tibble: 4 x 3
# # Groups:   x, y [4]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 7           0     0
# 2 1           0     1
# 3 3           1     0
# 4 2           1     1
# > df.example %>% distinct(x, y)
#   x y
# 1 0 1
# 2 1 1
# 3 1 0
# 4 0 0
# > df.example %>% distinct(x, y, .keep_all = TRUE)
#   rowname x y
# 1       1 0 1
# 2       2 1 1
# 3       3 1 0
# 4       7 0 0
# > df.example %>% group_by(x) %>% filter (! duplicated(y))
# # A tibble: 4 x 3
# # Groups:   x [2]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 1           0     1
# 2 2           1     1
# 3 3           1     0
# 4 7           0     0





#@ end -----  


