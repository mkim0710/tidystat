# function.weighted_join_FIPS_HANES.dev.r

# cf) https://github.com/mkim0710/tidystat/blob/master/R/f_df.conditional_expectation.dev.r

#@@@@@@@@@@@ Under Research ====  

#@@@@@@@@@@@ deprecated - please use function.learn_wt.list() =======  
# https://github.com/mkim0710/tidystat/blob/master/R/function.learn_wt.list.dev.r


# # public_v2_112917.levels.FACET, FACETS_data_2017.NA.NonLatino left_join().r
# 
# FACETS_data_2017.NA.NonLatino = FACETS_data_2017.NA %>% mutate(
#     P_Other4 = P_AI + P_NH + P_OR + P_2R
#     , P_WH_NonLatino = P_WH*(P_WH+P_AA+P_AS+P_Other4-P_Latino)/(P_WH+P_AA+P_AS+P_Other4)
#     , P_AA_NonLatino = P_AA*(P_WH+P_AA+P_AS+P_Other4-P_Latino)/(P_WH+P_AA+P_AS+P_Other4)
#     , P_AS_NonLatino = P_AS*(P_WH+P_AA+P_AS+P_Other4-P_Latino)/(P_WH+P_AA+P_AS+P_Other4)
#     , P_Other4_NonLatino = P_Other4*(P_WH+P_AA+P_AS+P_Other4-P_Latino)/(P_WH+P_AA+P_AS+P_Other4)
#     ) %>% select(FIPS, P_WH_NonLatino, P_AA_NonLatino, P_Latino, P_AS_NonLatino, P_Other4_NonLatino)
# FACETS_data_2017.NA.NonLatino |> as_tibble()
# # > FACETS_data_2017.NA.NonLatino |> as_tibble()
# # # A tibble: 2,167 x 6
# #          FIPS P_WH_NonLatino P_AA_NonLatino P_Latino P_AS_NonLatino P_Other4_NonLatino
# #         <dbl>          <dbl>          <dbl>    <dbl>          <dbl>              <dbl>
# #  1 3.6005e+10     0.07005988     0.44137725     0.30    0.014011976         0.17655090
# #  2 3.6005e+10     0.10385230     0.05071856     0.76    0.009660679         0.07776846
# #  3 3.6005e+10     0.12994012     0.13365269     0.63    0.003712575         0.10469461
# #  4 3.6005e+10     0.13393939     0.12707071     0.65    0.000000000         0.07898990
# #  5 3.6005e+10     0.08550000     0.15300000     0.55    0.009000000         0.20250000
# #  6 3.6005e+10     0.12071071     0.15964965     0.61    0.011681682         0.09695796
# #  7 3.6005e+10     0.06840000     0.15580000     0.62    0.000000000         0.15580000
# #  8 3.6005e+10     0.52000000     0.48000000     0.00    0.000000000         0.00000000
# #  9 3.6005e+10     0.05520000     0.05280000     0.76    0.009600000         0.12240000
# # 10 3.6005e+10     0.05554455     0.12415842     0.68    0.000000000         0.15029703
# # # ... with 2,157 more rows
# 
# # > FACETS_data_2017.NA.NonLatino[1,-1]
# #   P_WH_NonLatino P_AA_NonLatino P_Latino P_AS_NonLatino P_Other4_NonLatino
# # 1     0.07005988      0.4413772      0.3     0.01401198          0.1765509
# 
# 
# public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt))
# # > public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt))
# # # A tibble: 5 x 4
# #                    RACE     N       NWt      NWt.p
# #                  <fctr> <int>     <dbl>      <dbl>
# # 1 1: Non-Hispanic White   513 2201667.3 0.35026332
# # 2 2: Non-Hispanic Black   340 1336585.7 0.21263746
# # 3           3: Hispanic   390 1703964.4 0.27108376
# # 4              4: Asian   204  879566.9 0.13993033
# # 5              5: Other    80  163964.5 0.02608512
# 
# 
# FACETS_data_2017.NA.NonLatino[1,-1]
# as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # > FACETS_data_2017.NA.NonLatino[1,-1]
# #   P_WH_NonLatino P_AA_NonLatino P_Latino P_AS_NonLatino P_Other4_NonLatino
# # 1     0.07005988      0.4413772      0.3     0.01401198          0.1765509
# # > as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# #     P_WH_NonLatino     P_AA_NonLatino           P_Latino     P_AS_NonLatino P_Other4_NonLatino 
# #         0.07005988         0.44137725         0.30000000         0.01401198         0.17655090 
# 
# public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#     mutate(
#         FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#         , FIPS1WtFactor = FIPS1/NWt.p
#         , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#         , FIPS2WtFactor = FIPS2/NWt.p
#     )
# # > public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +     mutate(
# # +         FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +         , FIPS1WtFactor = FIPS1/NWt.p
# # +         , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +         , FIPS2WtFactor = FIPS2/NWt.p
# # +     )
# # # A tibble: 5 x 8
# #                    RACE     N       NWt      NWt.p      FIPS1 FIPS1WtFactor       FIPS2 FIPS2WtFactor
# #                  <fctr> <int>     <dbl>      <dbl>      <dbl>         <dbl>       <dbl>         <dbl>
# # 1 1: Non-Hispanic White   513 2201667.3 0.35026332 0.07005988     0.2000206 0.103852295     0.2964978
# # 2 2: Non-Hispanic Black   340 1336585.7 0.21263746 0.44137725     2.0757266 0.050718563     0.2385213
# # 3           3: Hispanic   390 1703964.4 0.27108376 0.30000000     1.1066690 0.760000000     2.8035616
# # 4              4: Asian   204  879566.9 0.13993033 0.01401198     0.1001354 0.009660679     0.0690392
# # 5              5: Other    80  163964.5 0.02608512 0.17655090     6.7682606 0.077768463     2.9813342
# 
# 
# 
# left_join(
#     {
#         public_v2_112917.levels.FACET
#     }
#     , 
#     {
#         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#             mutate(
#                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#                 , FIPS1WtFactor = FIPS1/NWt.p
#                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#                 , FIPS2WtFactor = FIPS2/NWt.p
#             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
#     }
# ) %>% select(GENDER, AGEGRP5C, RACE, CAPI_WT, FIPS1WtFactor, FIPS2WtFactor)
# # > left_join(
# # +     {
# # +         public_v2_112917.levels.FACET
# # +     }
# # +     , 
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +             mutate(
# # +                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +                 , FIPS1WtFactor = FIPS1/NWt.p
# # +                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +                 , FIPS2WtFactor = FIPS2/NWt.p
# # +             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
# # +     }
# # + ) %>% select(GENDER, AGEGRP5C, RACE, CAPI_WT, FIPS1WtFactor, FIPS2WtFactor)
# # Joining, by = "RACE"
# #         GENDER       AGEGRP5C                  RACE   CAPI_WT FIPS1WtFactor FIPS2WtFactor
# # 1    2: Female       1: 20-29 2: Non-Hispanic Black  5333.623     2.0757266     0.2385213
# # 2      1: Male       3: 40-49 2: Non-Hispanic Black 12711.343     2.0757266     0.2385213
# # 3    2: Female       2: 30-39              5: Other  2027.806     6.7682606     2.9813342
# # 4      1: Male       4: 50-59           3: Hispanic  4276.795     1.1066690     2.8035616
# # 5    2: Female       3: 40-49              4: Asian  3965.313     0.1001354     0.0690392
# # 6      1: Male       2: 30-39 2: Non-Hispanic Black  6722.246     2.0757266     0.2385213
# # 7      1: Male       1: 20-29 2: Non-Hispanic Black  7937.495     2.0757266     0.2385213
# # 8    2: Female       3: 40-49           3: Hispanic  5087.933     1.1066690     2.8035616
# # 9    2: Female 5: 60 and over              4: Asian  6973.812     0.1001354     0.0690392
# # 10   2: Female 5: 60 and over              4: Asian  4065.773     0.1001354     0.0690392
# # 11     1: Male 5: 60 and over              4: Asian  4891.126     0.1001354     0.0690392
# # 12   2: Female       2: 30-39 2: Non-Hispanic Black  3080.126     2.0757266     0.2385213
# # 13   2: Female 5: 60 and over           3: Hispanic  5100.668     1.1066690     2.8035616
# # 14   2: Female       2: 30-39 1: Non-Hispanic White  3940.401     0.2000206     0.2964978
# # 15     1: Male       3: 40-49 1: Non-Hispanic White  4740.314     0.2000206     0.2964978
# # 16     1: Male       2: 30-39              4: Asian  4006.132     0.1001354     0.0690392
# # 17   2: Female       1: 20-29              4: Asian  4158.929     0.1001354     0.0690392
# # 18   2: Female       1: 20-29 1: Non-Hispanic White  4732.270     0.2000206     0.2964978
# # 19     1: Male       3: 40-49 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 20     1: Male       4: 50-59 1: Non-Hispanic White  4271.830     0.2000206     0.2964978
# # 21   2: Female       4: 50-59 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 22   2: Female       3: 40-49 1: Non-Hispanic White  3789.194     0.2000206     0.2964978
# # 23     1: Male       3: 40-49 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 24   2: Female       3: 40-49 1: Non-Hispanic White  3789.194     0.2000206     0.2964978
# # 25     1: Male 5: 60 and over 2: Non-Hispanic Black  3927.929     2.0757266     0.2385213
# # 26   2: Female       1: 20-29           3: Hispanic  2683.493     1.1066690     2.8035616
# # 27   2: Female       1: 20-29           3: Hispanic  2683.493     1.1066690     2.8035616
# # 28     1: Male       1: 20-29 1: Non-Hispanic White  7124.351     0.2000206     0.2964978
# # 29   2: Female       1: 20-29 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 30   2: Female 5: 60 and over              4: Asian  3803.580     0.1001354     0.0690392
# # 31   2: Female       1: 20-29 1: Non-Hispanic White  3861.479     0.2000206     0.2964978
# # 32     1: Male       1: 20-29 1: Non-Hispanic White  3946.733     0.2000206     0.2964978
# # 33   2: Female       4: 50-59              4: Asian  7905.106     0.1001354     0.0690392
# # 34   2: Female       1: 20-29              4: Asian  4158.929     0.1001354     0.0690392
# # 35   2: Female       2: 30-39              5: Other  1656.733     6.7682606     2.9813342
# # 36     1: Male       2: 30-39 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 37     1: Male       1: 20-29              4: Asian  6123.821     0.1001354     0.0690392
# # 38     1: Male       2: 30-39              4: Asian  3468.564     0.1001354     0.0690392
# # 39   2: Female 5: 60 and over 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 40   2: Female 5: 60 and over 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 41     1: Male 5: 60 and over 1: Non-Hispanic White  3996.345     0.2000206     0.2964978
# # 42   2: Female       3: 40-49              5: Other  1656.733     6.7682606     2.9813342
# # 43     1: Male       1: 20-29 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 44     1: Male       1: 20-29 1: Non-Hispanic White  3946.733     0.2000206     0.2964978
# # 45   2: Female       1: 20-29 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 46   2: Female       1: 20-29           3: Hispanic  4844.047     1.1066690     2.8035616
# # 47   2: Female 5: 60 and over 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 48   2: Female       3: 40-49              4: Asian  3330.112     0.1001354     0.0690392
# # 49     1: Male       3: 40-49           3: Hispanic  3877.355     1.1066690     2.8035616
# # 50     1: Male       3: 40-49 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 51   2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 52   2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 53     1: Male       1: 20-29 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 54   2: Female       2: 30-39           3: Hispanic  3944.990     1.1066690     2.8035616
# # 55     1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 56   2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 57     1: Male       3: 40-49              4: Asian  4165.991     0.1001354     0.0690392
# # 58   2: Female 5: 60 and over 1: Non-Hispanic White  8692.680     0.2000206     0.2964978
# # 59     1: Male       4: 50-59 1: Non-Hispanic White  4271.830     0.2000206     0.2964978
# # 60   2: Female       4: 50-59 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 61     1: Male 5: 60 and over 1: Non-Hispanic White  5028.008     0.2000206     0.2964978
# # 62   2: Female       1: 20-29              4: Asian  2772.616     0.1001354     0.0690392
# # 63     1: Male       2: 30-39 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 64     1: Male       3: 40-49 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 65   2: Female       3: 40-49              4: Asian  3330.112     0.1001354     0.0690392
# # 66     1: Male       4: 50-59 1: Non-Hispanic White  3996.345     0.2000206     0.2964978
# # 67     1: Male       4: 50-59           3: Hispanic  3677.245     1.1066690     2.8035616
# # 68   2: Female       4: 50-59           3: Hispanic  2904.533     1.1066690     2.8035616
# # 69   2: Female       1: 20-29 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 70     1: Male       1: 20-29 1: Non-Hispanic White  3946.733     0.2000206     0.2964978
# # 71   2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 72     1: Male 5: 60 and over 1: Non-Hispanic White  5085.380     0.2000206     0.2964978
# # 73     1: Male 5: 60 and over 1: Non-Hispanic White  4107.899     0.2000206     0.2964978
# # 74   2: Female 5: 60 and over 1: Non-Hispanic White  3414.717     0.2000206     0.2964978
# # 75     1: Male       3: 40-49 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 76   2: Female 5: 60 and over 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 77   2: Female       3: 40-49 1: Non-Hispanic White  7234.486     0.2000206     0.2964978
# # 78   2: Female       3: 40-49 1: Non-Hispanic White  3940.401     0.2000206     0.2964978
# # 79     1: Male       3: 40-49              5: Other  2536.804     6.7682606     2.9813342
# # 80     1: Male 5: 60 and over 1: Non-Hispanic White  6224.423     0.2000206     0.2964978
# # 81   2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 82   2: Female       2: 30-39 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 83     1: Male       2: 30-39 1: Non-Hispanic White  4740.314     0.2000206     0.2964978
# # 84     1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 85     1: Male 5: 60 and over 1: Non-Hispanic White  5085.380     0.2000206     0.2964978
# # 86   2: Female 5: 60 and over 1: Non-Hispanic White  5174.078     0.2000206     0.2964978
# # 87   2: Female       4: 50-59 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 88     1: Male       4: 50-59 1: Non-Hispanic White  4495.668     0.2000206     0.2964978
# # 89     1: Male 5: 60 and over 1: Non-Hispanic White  5288.307     0.2000206     0.2964978
# # 90     1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 91     1: Male       2: 30-39           3: Hispanic  3357.071     1.1066690     2.8035616
# # 92   2: Female       2: 30-39           3: Hispanic  2790.579     1.1066690     2.8035616
# # 93   2: Female       4: 50-59 1: Non-Hispanic White  3414.717     0.2000206     0.2964978
# # 94     1: Male 5: 60 and over           3: Hispanic  4498.211     1.1066690     2.8035616
# # 95   2: Female       3: 40-49              5: Other  1722.839     6.7682606     2.9813342
# # 96   2: Female       2: 30-39              4: Asian  3330.112     0.1001354     0.0690392
# # 97     1: Male 5: 60 and over 1: Non-Hispanic White  6472.808     0.2000206     0.2964978
# # 98   2: Female       2: 30-39 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 99   2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 100    1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 101    1: Male       2: 30-39           3: Hispanic  3228.243     1.1066690     2.8035616
# # 102  2: Female       3: 40-49 1: Non-Hispanic White  3789.194     0.2000206     0.2964978
# # 103    1: Male 5: 60 and over              4: Asian  4575.704     0.1001354     0.0690392
# # 104  2: Female 5: 60 and over 1: Non-Hispanic White  5996.594     0.2000206     0.2964978
# # 105  2: Female       2: 30-39 2: Non-Hispanic Black  2436.789     2.0757266     0.2385213
# # 106  2: Female       2: 30-39           3: Hispanic  3391.952     1.1066690     2.8035616
# # 107    1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 108  2: Female       4: 50-59              5: Other  1827.402     6.7682606     2.9813342
# # 109  2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 110    1: Male       2: 30-39 1: Non-Hispanic White  4558.410     0.2000206     0.2964978
# # 111  2: Female       1: 20-29 1: Non-Hispanic White  4732.270     0.2000206     0.2964978
# # 112  2: Female       1: 20-29 1: Non-Hispanic White  4732.270     0.2000206     0.2964978
# # 113  2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 114  2: Female       2: 30-39           3: Hispanic  3223.066     1.1066690     2.8035616
# # 115    1: Male 5: 60 and over 1: Non-Hispanic White  4947.273     0.2000206     0.2964978
# # 116    1: Male       1: 20-29 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 117  2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 118  2: Female       4: 50-59              4: Asian  3120.752     0.1001354     0.0690392
# # 119    1: Male       4: 50-59              4: Asian  3754.272     0.1001354     0.0690392
# # 120  2: Female       4: 50-59 1: Non-Hispanic White  4346.335     0.2000206     0.2964978
# # 121    1: Male 5: 60 and over 1: Non-Hispanic White  9546.065     0.2000206     0.2964978
# # 122  2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 123    1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 124  2: Female       1: 20-29 1: Non-Hispanic White  4732.270     0.2000206     0.2964978
# # 125    1: Male       2: 30-39 1: Non-Hispanic White  3795.282     0.2000206     0.2964978
# # 126  2: Female       2: 30-39              4: Asian  2772.616     0.1001354     0.0690392
# # 127  2: Female       3: 40-49 1: Non-Hispanic White  3789.194     0.2000206     0.2964978
# # 128  2: Female       1: 20-29 1: Non-Hispanic White  4015.574     0.2000206     0.2964978
# # 129    1: Male       2: 30-39           3: Hispanic  4935.207     1.1066690     2.8035616
# # 130  2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 131    1: Male       4: 50-59 1: Non-Hispanic White  3996.345     0.2000206     0.2964978
# # 132  2: Female       4: 50-59 1: Non-Hispanic White  3414.717     0.2000206     0.2964978
# # 133    1: Male       4: 50-59              5: Other  1747.295     6.7682606     2.9813342
# # 134    1: Male       3: 40-49 1: Non-Hispanic White  4434.617     0.2000206     0.2964978
# # 135  2: Female 5: 60 and over 1: Non-Hispanic White  5033.570     0.2000206     0.2964978
# # 136    1: Male       2: 30-39 1: Non-Hispanic White  4434.617     0.2000206     0.2964978
# # 137  2: Female       4: 50-59 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 138    1: Male       3: 40-49 1: Non-Hispanic White  4740.314     0.2000206     0.2964978
# # 139  2: Female       3: 40-49           3: Hispanic  3135.543     1.1066690     2.8035616
# # 140  2: Female 5: 60 and over 1: Non-Hispanic White  4112.448     0.2000206     0.2964978
# # 141  2: Female 5: 60 and over 1: Non-Hispanic White  5326.471     0.2000206     0.2964978
# # 142  2: Female       1: 20-29 1: Non-Hispanic White  5792.219     0.2000206     0.2964978
# # 143    1: Male       2: 30-39 1: Non-Hispanic White  3946.733     0.2000206     0.2964978
# # 144  2: Female       2: 30-39 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 145  2: Female       4: 50-59 1: Non-Hispanic White  3414.717     0.2000206     0.2964978
# # 146  2: Female       2: 30-39 1: Non-Hispanic White  3069.164     0.2000206     0.2964978
# # 147  2: Female 5: 60 and over 1: Non-Hispanic White  4395.927     0.2000206     0.2964978
# # 148    1: Male 5: 60 and over 1: Non-Hispanic White  5288.307     0.2000206     0.2964978
# # 149  2: Female       3: 40-49 1: Non-Hispanic White  3789.194     0.2000206     0.2964978
# # 150  2: Female       4: 50-59 1: Non-Hispanic White  3414.717     0.2000206     0.2964978
# # 151  2: Female       1: 20-29 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 152  2: Female 5: 60 and over 1: Non-Hispanic White  4227.243     0.2000206     0.2964978
# # 153  2: Female 5: 60 and over           3: Hispanic  4281.526     1.1066690     2.8035616
# # 154  2: Female       2: 30-39 1: Non-Hispanic White  3154.843     0.2000206     0.2964978
# # 155  2: Female 5: 60 and over 1: Non-Hispanic White  4395.927     0.2000206     0.2964978
# # 156    1: Male 5: 60 and over 1: Non-Hispanic White  5288.307     0.2000206     0.2964978
# # 157    1: Male       2: 30-39 1: Non-Hispanic White  4740.314     0.2000206     0.2964978
# # 158  2: Female       2: 30-39 1: Non-Hispanic White  3280.743     0.2000206     0.2964978
# # 159    1: Male       2: 30-39              4: Asian  3468.564     0.1001354     0.0690392
# # 160  2: Female       4: 50-59 1: Non-Hispanic White  3550.980     0.2000206     0.2964978
# # 161  2: Female 5: 60 and over 1: Non-Hispanic White  4112.448     0.2000206     0.2964978
# # 162    1: Male 5: 60 and over 1: Non-Hispanic White  8543.661     0.2000206     0.2964978
# # 163  2: Female 5: 60 and over 1: Non-Hispanic White  4112.448     0.2000206     0.2964978
# # 164  2: Female       1: 20-29              5: Other  1379.373     6.7682606     2.9813342
# # 165  2: Female 5: 60 and over 1: Non-Hispanic White  4112.448     0.2000206     0.2964978
# # 166    1: Male 5: 60 and over 1: Non-Hispanic White  5288.307     0.2000206     0.2964978
# #  [ reached getOption("max.print") -- omitted 1361 rows ]
# 
# 
# 
# 
# 
# left_join(
#     {
#         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
#     }
#     , 
#     {
#         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#             mutate(
#                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#                 , FIPS1WtFactor = FIPS1/NWt.p
#                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#                 , FIPS2WtFactor = FIPS2/NWt.p
#             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
#     }
# )
# # > left_join(
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
# # +     }
# # +     , 
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +             mutate(
# # +                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +                 , FIPS1WtFactor = FIPS1/NWt.p
# # +                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +                 , FIPS2WtFactor = FIPS2/NWt.p
# # +             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
# # +     }
# # + )
# # Joining, by = "RACE"
# # # A tibble: 50 x 8
# #     GENDER AGEGRP5C                  RACE     N       NWt       Wt FIPS1WtFactor FIPS2WtFactor
# #     <fctr>   <fctr>                <fctr> <int>     <dbl>    <dbl>         <dbl>         <dbl>
# #  1 1: Male 1: 20-29 1: Non-Hispanic White    46 195666.10 4253.611     0.2000206     0.2964978
# #  2 1: Male 1: 20-29 2: Non-Hispanic Black    24  98341.78 4097.574     2.0757266     0.2385213
# #  3 1: Male 1: 20-29           3: Hispanic    44 218410.08 4963.865     1.1066690     2.8035616
# #  4 1: Male 1: 20-29              4: Asian    23 113851.81 4950.079     0.1001354     0.0690392
# #  5 1: Male 1: 20-29              5: Other     6  15240.29 2540.048     6.7682606     2.9813342
# #  6 1: Male 2: 30-39 1: Non-Hispanic White    66 266063.01 4031.258     0.2000206     0.2964978
# #  7 1: Male 2: 30-39 2: Non-Hispanic Black    30 114961.93 3832.064     2.0757266     0.2385213
# #  8 1: Male 2: 30-39           3: Hispanic    26 113471.04 4364.271     1.1066690     2.8035616
# #  9 1: Male 2: 30-39              4: Asian    24 111825.85 4659.410     0.1001354     0.0690392
# # 10 1: Male 2: 30-39              5: Other     7  14366.93 2052.419     6.7682606     2.9813342
# # # ... with 40 more rows
# 
# left_join(
#     {
#         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
#     }
#     , 
#     {
#         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#             mutate(
#                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#                 , FIPS1WtFactor = FIPS1/NWt.p
#                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#                 , FIPS2WtFactor = FIPS2/NWt.p
#             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
#     }
# ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS1WtFactor, FIPS2WtFactor) %>% arrange(AGEGRP5C)
# # > left_join(
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
# # +     }
# # +     , 
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +             mutate(
# # +                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +                 , FIPS1WtFactor = FIPS1/NWt.p
# # +                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +                 , FIPS2WtFactor = FIPS2/NWt.p
# # +             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
# # +     }
# # + ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS1WtFactor, FIPS2WtFactor) %>% arrange(AGEGRP5C)
# # Joining, by = "RACE"
# # # A tibble: 50 x 6
# #    AGEGRP5C    GENDER                  RACE       Wt FIPS1WtFactor FIPS2WtFactor
# #      <fctr>    <fctr>                <fctr>    <dbl>         <dbl>         <dbl>
# #  1 1: 20-29   1: Male 1: Non-Hispanic White 4253.611     0.2000206     0.2964978
# #  2 1: 20-29   1: Male 2: Non-Hispanic Black 4097.574     2.0757266     0.2385213
# #  3 1: 20-29   1: Male           3: Hispanic 4963.865     1.1066690     2.8035616
# #  4 1: 20-29   1: Male              4: Asian 4950.079     0.1001354     0.0690392
# #  5 1: 20-29   1: Male              5: Other 2540.048     6.7682606     2.9813342
# #  6 1: 20-29 2: Female 1: Non-Hispanic White 3790.169     0.2000206     0.2964978
# #  7 1: 20-29 2: Female 2: Non-Hispanic Black 3386.611     2.0757266     0.2385213
# #  8 1: 20-29 2: Female           3: Hispanic 3765.695     1.1066690     2.8035616
# #  9 1: 20-29 2: Female              4: Asian 3897.457     0.1001354     0.0690392
# # 10 1: 20-29 2: Female              5: Other 1639.404     6.7682606     2.9813342
# # # ... with 40 more rows
# 
# 
# 
# 
# left_join(
#     {
#         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
#     }
#     , 
#     {
#         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#             mutate(
#                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#                 , FIPS1WtFactor = FIPS1/NWt.p
#                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#                 , FIPS2WtFactor = FIPS2/NWt.p
#             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
#     }
# ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS1WtFactor) %>% mutate(Wt.FIPS1WtFactor = Wt * FIPS1WtFactor)
# # > left_join(
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
# # +     }
# # +     , 
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +             mutate(
# # +                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +                 , FIPS1WtFactor = FIPS1/NWt.p
# # +                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +                 , FIPS2WtFactor = FIPS2/NWt.p
# # +             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
# # +     }
# # + ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS1WtFactor) %>% mutate(Wt.FIPS1WtFactor = Wt * FIPS1WtFactor)
# # Joining, by = "RACE"
# # # A tibble: 50 x 6
# #    AGEGRP5C  GENDER                  RACE       Wt FIPS1WtFactor Wt.FIPS1WtFactor
# #      <fctr>  <fctr>                <fctr>    <dbl>         <dbl>            <dbl>
# #  1 1: 20-29 1: Male 1: Non-Hispanic White 4253.611     0.2000206         850.8098
# #  2 1: 20-29 1: Male 2: Non-Hispanic Black 4097.574     2.0757266        8505.4439
# #  3 1: 20-29 1: Male           3: Hispanic 4963.865     1.1066690        5493.3562
# #  4 1: 20-29 1: Male              4: Asian 4950.079     0.1001354         495.6780
# #  5 1: 20-29 1: Male              5: Other 2540.048     6.7682606       17191.7042
# #  6 2: 30-39 1: Male 1: Non-Hispanic White 4031.258     0.2000206         806.3346
# #  7 2: 30-39 1: Male 2: Non-Hispanic Black 3832.064     2.0757266        7954.3177
# #  8 2: 30-39 1: Male           3: Hispanic 4364.271     1.1066690        4829.8034
# #  9 2: 30-39 1: Male              4: Asian 4659.410     0.1001354         466.5718
# # 10 2: 30-39 1: Male              5: Other 2052.419     6.7682606       13891.3055
# # # ... with 40 more rows
# 
# 
# 
# 
# left_join(
#     {
#         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
#     }
#     , 
#     {
#         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#             mutate(
#                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#                 , FIPS1WtFactor = FIPS1/NWt.p
#                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#                 , FIPS2WtFactor = FIPS2/NWt.p
#             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
#     }
# ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS1WtFactor) %>% mutate(Wt.FIPS1WtFactor = Wt * FIPS1WtFactor) %>% select(AGEGRP5C, GENDER, RACE, Wt.FIPS1WtFactor) %>% spread(key = RACE, value = Wt.FIPS1WtFactor)
# left_join(
#     {
#         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
#     }
#     , 
#     {
#         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
#             mutate(
#                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
#                 , FIPS1WtFactor = FIPS1/NWt.p
#                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
#                 , FIPS2WtFactor = FIPS2/NWt.p
#             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
#     }
# ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS2WtFactor) %>% mutate(Wt.FIPS2WtFactor = Wt * FIPS2WtFactor) %>% select(AGEGRP5C, GENDER, RACE, Wt.FIPS2WtFactor) %>% spread(key = RACE, value = Wt.FIPS2WtFactor)
# # > left_join(
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
# # +     }
# # +     , 
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +             mutate(
# # +                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +                 , FIPS1WtFactor = FIPS1/NWt.p
# # +                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +                 , FIPS2WtFactor = FIPS2/NWt.p
# # +             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
# # +     }
# # + ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS1WtFactor) %>% mutate(Wt.FIPS1WtFactor = Wt * FIPS1WtFactor) %>% select(AGEGRP5C, GENDER, RACE, Wt.FIPS1WtFactor) %>% spread(key = RACE, value = Wt.FIPS1WtFactor)
# # Joining, by = "RACE"
# # # A tibble: 10 x 7
# #          AGEGRP5C    GENDER `1: Non-Hispanic White` `2: Non-Hispanic Black` `3: Hispanic` `4: Asian` `5: Other`
# #  *         <fctr>    <fctr>                   <dbl>                   <dbl>         <dbl>      <dbl>      <dbl>
# #  1       1: 20-29   1: Male                850.8098                8505.444      5493.356   495.6780   17191.70
# #  2       1: 20-29 2: Female                758.1119                7029.679      4167.378   390.2733   11095.92
# #  3       2: 30-39   1: Male                806.3346                7954.318      4829.803   466.5718   13891.31
# #  4       2: 30-39 2: Female                670.8756                6353.855      3789.408   358.7866   11354.66
# #  5       3: 40-49   1: Male                926.9400               10695.094      5675.134   451.8888   14102.71
# #  6       3: 40-49 2: Female                899.3389                8834.598      5075.200   377.8917   11436.91
# #  7       4: 50-59   1: Male                968.1721                8858.976      5401.204   516.7508   15118.14
# #  8       4: 50-59 2: Female                753.9645                7545.508      4200.056   471.1567   14408.75
# #  9 5: 60 and over   1: Male               1127.1809                9468.666      5733.201   548.3482   20549.21
# # 10 5: 60 and over 2: Female                888.6843                8334.113      4842.535   399.7983   12804.08
# # > left_join(
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(GENDER, AGEGRP5C, RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT), Wt = mean(CAPI_WT)) %>% ungroup
# # +     }
# # +     , 
# # +     {
# # +         public_v2_112917.levels.FACET %>% group_by(RACE) %>% summarize(N = n(), NWt = sum(CAPI_WT)) %>% ungroup %>% mutate(NWt.p = NWt/sum(NWt)) %>% 
# # +             mutate(
# # +                 FIPS1 = as.matrix(FACETS_data_2017.NA.NonLatino)[1,-1]
# # +                 , FIPS1WtFactor = FIPS1/NWt.p
# # +                 , FIPS2 = as.matrix(FACETS_data_2017.NA.NonLatino)[2,-1]
# # +                 , FIPS2WtFactor = FIPS2/NWt.p
# # +             ) %>% select(RACE, FIPS1WtFactor, FIPS2WtFactor)
# # +     }
# # + ) %>% select(AGEGRP5C, GENDER, RACE, Wt, FIPS2WtFactor) %>% mutate(Wt.FIPS2WtFactor = Wt * FIPS2WtFactor) %>% select(AGEGRP5C, GENDER, RACE, Wt.FIPS2WtFactor) %>% spread(key = RACE, value = Wt.FIPS2WtFactor)
# # Joining, by = "RACE"
# # # A tibble: 10 x 7
# #          AGEGRP5C    GENDER `1: Non-Hispanic White` `2: Non-Hispanic Black` `3: Hispanic` `4: Asian` `5: Other`
# #  *         <fctr>    <fctr>                   <dbl>                   <dbl>         <dbl>      <dbl>      <dbl>
# #  1       1: 20-29   1: Male               1261.1862                977.3587     13916.502   341.7495   7572.731
# #  2       1: 20-29 2: Female               1123.7767                807.7789     10557.358   269.0773   4887.612
# #  3       2: 30-39   1: Male               1195.2589                914.0289     12235.502   321.6820   6118.946
# #  4       2: 30-39 2: Female                994.4631                730.1201      9599.833   247.3686   5001.587
# #  5       3: 40-49   1: Male               1374.0367               1228.9710     14377.007   311.5587   6212.068
# #  6       3: 40-49 2: Female               1333.1226               1015.1817     12857.174   260.5407   5037.817
# #  7       4: 50-59   1: Male               1435.1565               1017.9830     13683.050   356.2783   6659.351
# #  8       4: 50-59 2: Female               1117.6289                867.0527     10640.143   324.8431   6346.873
# #  9 5: 60 and over   1: Male               1670.8610               1088.0423     14524.110   378.0634   9051.672
# # 10 5: 60 and over 2: Female               1317.3289                957.6711     12267.755   275.6444   5640.037






#@ end ------  
