# fun.df.transpose.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/fun.df.transpose.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/env.custom.fun.t.tribble_construct.dev.r


library(tidyverse)

# https://github.com/jinseob2kim/lecture-snuhlab
# https://blog.zarathu.com/posts/2020-02-16-rdatamanagement-basic/
# https://github.com/jinseob2kim/lecture-snuhlab/raw/master/data/2교시 테이블 세부 레이아웃 소개(최신자료).pdf
# https://github.com/jinseob2kim/lecture-snuhlab/raw/master/data/2%EA%B5%90%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%84%B8%EB%B6%80%20%EB%A0%88%EC%9D%B4%EC%95%84%EC%9B%83%20%EC%86%8C%EA%B0%9C(%EC%B5%9C%EC%8B%A0%EC%9E%90%EB%A3%8C).pdf
# example_g1e <- read_csv("https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv")
# example_g1e <- read.csv("https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv")
# example_g1e = example_g1e %>% as.tibble
# saveRDS(example_g1e, "jinseob2kim_lecture-snuhlab_master_data_example_g1e.rds")
example_g1e = readRDS(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/jinseob2kim_lecture-snuhlab_master_data_example_g1e.rds"))
example_g1e
example_g1e %>% attributes %>% str #----
# > example_g1e
# # A tibble: 1,644 × 32
#    EXMD_BZ_YYYY RN_INDI HME_YYYYMM Q_PHX_DX_STK Q_PHX_DX_HTDZ Q_PHX_DX_HTN Q_PHX_DX_DM Q_PHX_DX_DLD Q_PHX_DX_PTB Q_HBV_AG Q_SMK_YN Q_DRK_FRQ_V09N  HGHT  WGHT  WSTC   BMI VA_LT VA_RT BP_SYS BP_DIA URN_PROT   HGB   FBS TOT_CHOL    TG   HDL   LDL  CRTN  SGOT  SGPT   GGT   GFR
#           <int>   <int>      <int>        <int>         <int>        <int>       <int>        <int>        <int>    <int>    <int>          <int> <int> <int> <int> <dbl> <dbl> <dbl>  <int>  <int>    <int> <dbl> <int>    <int> <int> <int> <int> <dbl> <int> <int> <int> <int>
#  1         2009  562083     200909            0             0            1           0            0           NA        3        1              0   144    61    90  29.4   0.7   0.8    120     80        1  12.6   117      264   128    60   179   0.9    25    20    25    59
#  2         2009  334536     200911            0             0            0           0            0           NA        2        1              0   162    51    63  19.4   0.8   1      120     80        1  13.8    96      169    92    70    80   0.9    18    15    28    74
#  3         2009  911867     200903            0             0            0           0            0           NA        3        1              0   163    65    82  24.5   0.7   0.6    130     80        1  15     118      216   132    55   134   0.8    26    30    30    79
#  4         2009  183321     200908           NA            NA           NA          NA           NA           NA        3        1              0   152    51    70  22.1   0.8   0.9    101     62        1  13.1    90      199   100    65   114   0.9    18    14    11    61
#  5         2009  942671     200909           NA            NA           NA          NA           NA           NA        3        1              0   159    50    73  19.8   0.7   0.8    132     78        1  13      92      162    58    40   111   0.9    24    23    15    49
#  6         2009  979358     200912           NA            NA           NA          NA           NA           NA        2        1              0   157    55    73  22.3   1.5   1.5    110     70        1  11.9   100      192   109    53   117   0.7    15    12    14    83
#  7         2009  554112     200911           NA            NA           NA          NA           NA           NA        2        1              0   160    56    67  21.9   1.5   1.5    119     78        1  11.2    84      152    38    43   101   0.8     8     6    10    97
#  8         2009  487160     200908           NA            NA           NA          NA           NA           NA        3        1              0   159    54    66  21.4   1.2   1.5    111     60        1  12.2    88      166    42    58    99   1      16    11    12    65
#  9         2009  793017     200906           NA            NA           NA          NA           NA           NA        3        1              0   156    53    67  21.8   1.2   1      138     72        1  11      74      155    86    52    85   0.6    15    13    13    96
# 10         2009  219397     200912            0             0            1           0            0           NA        3        1              0   146    48    78  22.5   1.5   1.5    138     84        1  12.8   107      178    87    35   125   0.7    21    21    23    70
# # ℹ 1,634 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > example_g1e %>% attributes %>% str #----
# List of 3
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
#  $ row.names: int [1:1644] 1 2 3 4 5 6 7 8 9 10 ...
#  $ names    : chr [1:32] "EXMD_BZ_YYYY" "RN_INDI" "HME_YYYYMM" "Q_PHX_DX_STK" ...


# example_bnc <- read.csv("https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_bnc.csv")
# example_bnc = example_bnc %>% as.tibble
# saveRDS(example_bnc, "jinseob2kim_lecture-snuhlab_master_data_example_bnc.rds")
example_bnc = readRDS(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/jinseob2kim_lecture-snuhlab_master_data_example_bnc.rds"))
example_bnc
example_bnc %>% attributes %>% str #----
# > example_bnc
# # A tibble: 13,073 × 10
#    RN_INDI STD_YYYY   SEX   SGG GAIBJA_TYPE CTRB_Q10 DSB_SVRT_CD DSB_TYPE_CD G1E_OBJ_YN SMPL_TYPE_CD
#      <int>    <int> <int> <int>       <int>    <int>       <int>       <int> <chr>             <int>
#  1    2270     2002     2 42110           2        8          NA          NA ""                    1
#  2    2270     2003     2 41281           1        5          NA          NA ""                    1
#  3    2270     2004     2 45111           1        4          NA          NA ""                    1
#  4    2270     2005     2 45111           1        6          NA          NA ""                    1
#  5    2270     2006     2 45111           1        4          NA          NA ""                    1
#  6    2270     2007     2 45111           1        5          NA          NA ""                    1
#  7    2270     2008     2 45111           1        7          NA          NA "Y"                   1
#  8    2270     2009     2 45111           1        9          NA          NA ""                    1
#  9    2270     2010     2 45111           1        9          NA          NA "Y"                   1
# 10    2270     2011     2 45111           1        9          NA          NA ""                    1
# # ℹ 13,063 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > example_bnc %>% attributes %>% str #----
# List of 3
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
#  $ row.names: int [1:13073] 1 2 3 4 5 6 7 8 9 10 ...
#  $ names    : chr [1:10] "RN_INDI" "STD_YYYY" "SEX" "SGG" ...


# https://jinseob2kim.github.io/PopGene.html
# fstexample <- read_table("https://raw.githubusercontent.com/jinseob2kim/jinseob2kim.github.io/master/fstexample.txt")
# fstexample <- read.csv("https://raw.githubusercontent.com/jinseob2kim/jinseob2kim.github.io/master/fstexample.txt", sep="")
# fstexample = read.csv("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/jinseob2kim_jinseob2kim.github.io_master_fstexample.txt", sep="")
# fstexample = fstexample %>% as.tibble
# saveRDS(fstexample, "jinseob2kim_jinseob2kim.github.io_master_fstexample.rds")
fstexample = readRDS(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/jinseob2kim_jinseob2kim.github.io_master_fstexample.rds"))
fstexample
fstexample %>% attributes %>% str #----
# > fstexample
# # A tibble: 1,042 × 290
#    pop   rs2001142 rs1894654 rs2071924 rs17350193 rs6662782 rs11120896 rs9660884 rs12410983 rs10489142 rs17346094 rs7530939 rs12128469 rs12402763 rs12063396
#    <chr>     <int>     <int>     <int>      <int>     <int>      <int>     <int>      <int>      <int>      <int>     <int>      <int>      <int>      <int>
#  1 SASIA        22        44        33         24        11         33        33         11         11         11        44         22         33         33
#  2 SASIA        44        24        33         44        13         13        13         11         13         11        44         24         33         33
#  3 SASIA        44        22        33         44        11         11        33         11         11         11        24         44         13         33
#  4 SASIA        44        22        33         44        11         33        33         11         11         11        22         44         33         11
#  5 SASIA        44        22        13         44        13         13        33         11         11         13        44         44         13         33
#  6 SASIA        24        44        33         44        13         33        13         11         13         11        44         22         33         33
#  7 SASIA        44        22        13         44        13         33        11         13         13         11        44         24         33         33
#  8 SASIA        24        24        33         44        11         33        NA         13         11         11        24         44         13         33
#  9 SASIA        24        24        33         44        11         13        33         11         11         11        44         44         13         33
# 10 SASIA        44        24        13         44        33         33        11         11         33         11        44         24         13         33
# # ℹ 1,032 more rows
# # ℹ 275 more variables: rs7543711 <int>, rs12563394 <int>, rs6688693 <int>, rs2301461 <int>, rs2301462 <int>, rs1029322 <int>, rs845246 <int>,
# #   rs845245 <int>, rs845242 <int>, rs763173 <int>, rs845238 <int>, rs845237 <int>, rs845265 <int>, rs11802840 <int>, rs12095637 <int>, rs3752543 <int>,
# #   rs845217 <int>, rs845214 <int>, rs4908629 <int>, rs845232 <int>, rs7524314 <int>, rs2097518 <int>, rs845202 <int>, rs763161 <int>, rs10864301 <int>,
# #   rs4908635 <int>, rs763165 <int>, rs11120917 <int>, rs6677745 <int>, rs6677945 <int>, rs11120919 <int>, rs845252 <int>, rs845251 <int>, rs11120921 <int>,
# #   rs12088178 <int>, rs11120923 <int>, rs9661064 <int>, rs1193220 <int>, rs1193221 <int>, rs9988557 <int>, rs7529341 <int>, rs17030865 <int>,
# #   rs1193227 <int>, rs11804955 <int>, rs12119558 <int>, rs2796477 <int>, rs6577445 <int>, rs17030898 <int>, rs1725236 <int>, rs17030902 <int>, …
# # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
# > fstexample %>% attributes %>% str #----
# List of 3
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
#  $ row.names: int [1:1042] 1 2 3 4 5 6 7 8 9 10 ...
#  $ names    : chr [1:290] "pop" "rs2001142" "rs1894654" "rs2071924" ...


fun.df.transpose = function(df, varname4rowname = "varname") {
    if(varname4rowname %in% colnames(df)) df = df %>% column_to_rownames(var = varname4rowname)
    out = df %>% t %>% as.data.frame %>% rownames_to_column(varname4rowname) %>% as_tibble
    out
}



example_g1e %>% fun.df.transpose #-----
fstexample %>% fun.df.transpose #-----
# > example_g1e %>% fun.df.transpose #-----
# # A tibble: 32 × 1,645
#    varname     V1     V2     V3     V4     V5     V6     V7     V8     V9    V10    V11    V12    V13    V14    V15    V16    V17    V18    V19    V20    V21
#    <chr>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#  1 EXMD_B…   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009   2009
#  2 RN_INDI 562083 334536 911867 183321 942671 979358 554112 487160 793017 219397 831349 480569 559370 318669 395781 122776 663811 668438 627341 559420 560878
#  3 HME_YY… 200909 200911 200903 200908 200909 200912 200911 200908 200906 200912 200912 200901 200912 200904 200907 200909 200908 200904 200912 200909 200903
#  4 Q_PHX_…      0      0      0     NA     NA     NA     NA     NA     NA      0      0      0     NA     NA     NA     NA     NA     NA      0     NA     NA
#  5 Q_PHX_…      0      0      0     NA     NA     NA     NA     NA     NA      0      0      1     NA     NA     NA     NA     NA     NA      0     NA     NA
#  6 Q_PHX_…      1      0      0     NA     NA     NA     NA     NA     NA      1      0      1     NA     NA     NA     NA     NA     NA      0     NA     NA
#  7 Q_PHX_…      0      0      0     NA     NA     NA     NA     NA     NA      0      0      0     NA     NA     NA     NA     NA     NA      0     NA     NA
#  8 Q_PHX_…      0      0      0     NA     NA     NA     NA     NA     NA      0      0      0     NA     NA     NA     NA     NA     NA      0     NA     NA
#  9 Q_PHX_…     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
# 10 Q_HBV_…      3      2      3      3      3      2      2      3      3      3      2      3      3      2      3      3      3      3      2      2      2
# # ℹ 22 more rows
# # ℹ 1,623 more variables: V22 <dbl>, V23 <dbl>, V24 <dbl>, V25 <dbl>, V26 <dbl>, V27 <dbl>, V28 <dbl>, V29 <dbl>, V30 <dbl>, V31 <dbl>, V32 <dbl>,
# #   V33 <dbl>, V34 <dbl>, V35 <dbl>, V36 <dbl>, V37 <dbl>, V38 <dbl>, V39 <dbl>, V40 <dbl>, V41 <dbl>, V42 <dbl>, V43 <dbl>, V44 <dbl>, V45 <dbl>,
# #   V46 <dbl>, V47 <dbl>, V48 <dbl>, V49 <dbl>, V50 <dbl>, V51 <dbl>, V52 <dbl>, V53 <dbl>, V54 <dbl>, V55 <dbl>, V56 <dbl>, V57 <dbl>, V58 <dbl>,
# #   V59 <dbl>, V60 <dbl>, V61 <dbl>, V62 <dbl>, V63 <dbl>, V64 <dbl>, V65 <dbl>, V66 <dbl>, V67 <dbl>, V68 <dbl>, V69 <dbl>, V70 <dbl>, V71 <dbl>,
# #   V72 <dbl>, V73 <dbl>, V74 <dbl>, V75 <dbl>, V76 <dbl>, V77 <dbl>, V78 <dbl>, V79 <dbl>, V80 <dbl>, V81 <dbl>, V82 <dbl>, V83 <dbl>, V84 <dbl>,
# #   V85 <dbl>, V86 <dbl>, V87 <dbl>, V88 <dbl>, V89 <dbl>, V90 <dbl>, V91 <dbl>, V92 <dbl>, V93 <dbl>, V94 <dbl>, V95 <dbl>, V96 <dbl>, V97 <dbl>, …
# # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
# > fstexample %>% fun.df.transpose #-----
# # A tibble: 290 × 1,043
#    varname    V1    V2    V3    V4    V5    V6    V7    V8    V9    V10   V11   V12   V13   V14   V15   V16   V17   V18   V19   V20   V21   V22   V23   V24  
#    <chr>      <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#  1 pop        SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA SASIA
#  2 rs2001142  22    44    44    44    44    24    44    24    24    44    24    44    24    44    44    24    24    44    44    44    44    NA    44    44   
#  3 rs1894654  44    24    22    22    22    44    22    24    24    24    24    22    24    22    22    24    24    22    24    24    22    24    44    22   
#  4 rs2071924  33    33    33    33    13    33    13    33    33    13    33    13    13    11    33    33    33    33    33    13    13    33    33    11   
#  5 rs17350193 24    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44    44   
#  6 rs6662782  11    13    11    11    13    13    13    11    11    33    11    13    13    33    11    11    11    11    13    33    13    11    33    33   
#  7 rs11120896 33    13    11    33    13    33    33    33    13    33    13    33    33    33    11    13    33    33    13    33    13    13    33    33   
#  8 rs9660884  33    13    33    33    33    13    11    NA    33    11    33    11    13    11    33    33    13    11    13    11    33    33    11    11   
#  9 rs12410983 11    11    11    11    11    11    13    13    11    11    11    13    11    11    11    11    13    33    11    11    11    11    11    11   
# 10 rs10489142 11    13    11    11    11    13    13    11    11    33    11    13    13    11    11    11    11    11    13    13    11    11    33    33   
# # ℹ 280 more rows
# # ℹ 1,018 more variables: V25 <chr>, V26 <chr>, V27 <chr>, V28 <chr>, V29 <chr>, V30 <chr>, V31 <chr>, V32 <chr>, V33 <chr>, V34 <chr>, V35 <chr>,
# #   V36 <chr>, V37 <chr>, V38 <chr>, V39 <chr>, V40 <chr>, V41 <chr>, V42 <chr>, V43 <chr>, V44 <chr>, V45 <chr>, V46 <chr>, V47 <chr>, V48 <chr>,
# #   V49 <chr>, V50 <chr>, V51 <chr>, V52 <chr>, V53 <chr>, V54 <chr>, V55 <chr>, V56 <chr>, V57 <chr>, V58 <chr>, V59 <chr>, V60 <chr>, V61 <chr>,
# #   V62 <chr>, V63 <chr>, V64 <chr>, V65 <chr>, V66 <chr>, V67 <chr>, V68 <chr>, V69 <chr>, V70 <chr>, V71 <chr>, V72 <chr>, V73 <chr>, V74 <chr>,
# #   V75 <chr>, V76 <chr>, V77 <chr>, V78 <chr>, V79 <chr>, V80 <chr>, V81 <chr>, V82 <chr>, V83 <chr>, V84 <chr>, V85 <chr>, V86 <chr>, V87 <chr>,
# #   V88 <chr>, V89 <chr>, V90 <chr>, V91 <chr>, V92 <chr>, V93 <chr>, V94 <chr>, V95 <chr>, V96 <chr>, V97 <chr>, V98 <chr>, V99 <chr>, V100 <chr>, …
# # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names




#@ end -----

library(tidyverse)
df =
tibble::tribble(
             ~varname,        ~V1,        ~V2,
             "STND_Y",     "2014",     "2014",
          "PERSON_ID", "67877095", "67877095",
                "SEX",        "1",        "1",
                "AGE",       "59",       "59",
            "DTH_MDY", "20141001", "20141001",
          "DTH_CODE1",      "I21",      "I21",
          "DTH_CODE2",         NA,         NA,
               "SIDO",       "41",       "41",
       "IPSN_TYPE_CD",        "6",        "6",
    "CTRB_PT_TYPE_CD",        "8",        "8",
        "DFAB_GRD_CD",        "0",        "0",
        "DFAB_PTN_CD",        "0",        "0",
        "DFAB_REG_YM",         NA,         NA
    )
df
df %>% fun.df.transpose #----
# > df %>% fun.df.transpose #----
# # A tibble: 2 × 14
#   varname STND_Y PERSON_ID SEX   AGE   DTH_MDY  DTH_CODE1 DTH_CODE2 SIDO  IPSN_TYPE_CD CTRB_PT_TYPE_CD DFAB_GRD_CD DFAB_PTN_CD DFAB_REG_YM
#   <chr>   <chr>  <chr>     <chr> <chr> <chr>    <chr>     <chr>     <chr> <chr>        <chr>           <chr>       <chr>       <chr>      
# 1 V1      2014   67877095  1     59    20141001 I21       NA        41    6            8               0           0           NA         
# 2 V2      2014   67877095  1     59    20141001 I21       NA        41    6            8               0           0           NA  

