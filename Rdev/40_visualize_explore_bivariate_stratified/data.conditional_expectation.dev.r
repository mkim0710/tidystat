# data.conditional_expectation.dev.r 
# data.conditional_distribution.dev.r 
# data.joint_distribution.dev.r

# cf) https://github.com/mkim0710/tidystat/blob/master/R/function.weighted_join_FIPS_HANES.dev.r



#@ public_v2_112917.levels123 ======
public_v2_112917.levels123 %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# > public_v2_112917.levels123 %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 12 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171  913173.661
#  2 1: Non-Hispanic White             TRUE   341 1284678.187
#  3 1: Non-Hispanic White               NA     1    3815.433
#  4 2: Non-Hispanic Black            FALSE   271 1125421.441
#  5 2: Non-Hispanic Black             TRUE    69  211164.247
#  6           3: Hispanic            FALSE   313 1459116.225
#  7           3: Hispanic             TRUE    76  241975.873
#  8           3: Hispanic               NA     1    2872.296
#  9              4: Asian            FALSE    98  488004.581
# 10              4: Asian             TRUE   106  391562.356
# 11              5: Other            FALSE    44  102144.581
# 12              5: Other             TRUE    36   61819.938
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 10 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171   913173.66
#  2 1: Non-Hispanic White             TRUE   341  1284678.19
#  3 2: Non-Hispanic Black            FALSE   271  1125421.44
#  4 2: Non-Hispanic Black             TRUE    69   211164.25
#  5           3: Hispanic            FALSE   313  1459116.23
#  6           3: Hispanic             TRUE    76   241975.87
#  7              4: Asian            FALSE    98   488004.58
#  8              4: Asian             TRUE   106   391562.36
#  9              5: Other            FALSE    44   102144.58
# 10              5: Other             TRUE    36    61819.94

#@ -----
df_RACE_isCollege_MS_PhD = outer(levels(public_v2_112917.levels123$RACE), c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isCollege_MS_PhD"), sep = "\\|") %>% map_df(as.factor) %>% 
    mutate(isCollege_MS_PhD = as.logical(isCollege_MS_PhD))
df_RACE_isCollege_MS_PhD
# > df_RACE_isCollege_MS_PhD
# # A tibble: 10 x 2
#                     RACE isCollege_MS_PhD
#                   <fctr>            <lgl>
#  1 1: Non-Hispanic White            FALSE
#  2 2: Non-Hispanic Black            FALSE
#  3           3: Hispanic            FALSE
#  4              4: Asian            FALSE
#  5              5: Other            FALSE
#  6 1: Non-Hispanic White             TRUE
#  7 2: Non-Hispanic Black             TRUE
#  8           3: Hispanic             TRUE
#  9              4: Asian             TRUE
# 10              5: Other             TRUE


for (i in 1:nrow(df_RACE_isCollege_MS_PhD)) {
    public_v2_112917.levels123 %>% dplyr::filter(
        RACE == df_RACE_isCollege_MS_PhD$RACE[i]
        , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
    ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
}
1:nrow(df_RACE_isCollege_MS_PhD) %>% map(function(i) {
    public_v2_112917.levels123 %>% dplyr::filter(
        RACE == df_RACE_isCollege_MS_PhD$RACE[i]
        , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
    ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
}) %>% bind_rows
1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
    public_v2_112917.levels123 %>% dplyr::filter(
        RACE == df_RACE_isCollege_MS_PhD$RACE[i]
        , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
    ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
})
bind_cols(
    df_RACE_isCollege_MS_PhD
    , 1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
        public_v2_112917.levels123 %>% dplyr::filter(
            RACE == df_RACE_isCollege_MS_PhD$RACE[i]
            , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
        ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
    })
)
# > for (i in 1:nrow(df_RACE_isCollege_MS_PhD)) {
# +     public_v2_112917.levels123 %>% dplyr::filter(
# +         RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +         , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +     ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# + }
# > 1:nrow(df_RACE_isCollege_MS_PhD) %>% map(function(i) {
# +     public_v2_112917.levels123 %>% dplyr::filter(
# +         RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +         , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +     ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# + }) %>% bind_rows
#      N CAPI_WT.sum
# 1  171   913173.66
# 2  271  1125421.44
# 3  313  1459116.23
# 4   98   488004.58
# 5   44   102144.58
# 6  341  1284678.19
# 7   69   211164.25
# 8   76   241975.87
# 9  106   391562.36
# 10  36    61819.94
# > 1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
# +     public_v2_112917.levels123 %>% dplyr::filter(
# +         RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +         , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +     ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# + })
#      N CAPI_WT.sum
# 1  171   913173.66
# 2  271  1125421.44
# 3  313  1459116.23
# 4   98   488004.58
# 5   44   102144.58
# 6  341  1284678.19
# 7   69   211164.25
# 8   76   241975.87
# 9  106   391562.36
# 10  36    61819.94
# > bind_cols(
# +     df_RACE_isCollege_MS_PhD
# +     , 1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
# +         public_v2_112917.levels123 %>% dplyr::filter(
# +             RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +             , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +         ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# +     })
# + )
# # A tibble: 10 x 4
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171   913173.66
#  2 2: Non-Hispanic Black            FALSE   271  1125421.44
#  3           3: Hispanic            FALSE   313  1459116.23
#  4              4: Asian            FALSE    98   488004.58
#  5              5: Other            FALSE    44   102144.58
#  6 1: Non-Hispanic White             TRUE   341  1284678.19
#  7 2: Non-Hispanic Black             TRUE    69   211164.25
#  8           3: Hispanic             TRUE    76   241975.87
#  9              4: Asian             TRUE   106   391562.36
# 10              5: Other             TRUE    36    61819.94

public_v2_112917.levels123 %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# > public_v2_112917.levels123 %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 12 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171  913173.661
#  2 1: Non-Hispanic White             TRUE   341 1284678.187
#  3 1: Non-Hispanic White               NA     1    3815.433
#  4 2: Non-Hispanic Black            FALSE   271 1125421.441
#  5 2: Non-Hispanic Black             TRUE    69  211164.247
#  6           3: Hispanic            FALSE   313 1459116.225
#  7           3: Hispanic             TRUE    76  241975.873
#  8           3: Hispanic               NA     1    2872.296
#  9              4: Asian            FALSE    98  488004.581
# 10              4: Asian             TRUE   106  391562.356
# 11              5: Other            FALSE    44  102144.581
# 12              5: Other             TRUE    36   61819.938
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 10 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171   913173.66
#  2 1: Non-Hispanic White             TRUE   341  1284678.19
#  3 2: Non-Hispanic Black            FALSE   271  1125421.44
#  4 2: Non-Hispanic Black             TRUE    69   211164.25
#  5           3: Hispanic            FALSE   313  1459116.23
#  6           3: Hispanic             TRUE    76   241975.87
#  7              4: Asian            FALSE    98   488004.58
#  8              4: Asian             TRUE   106   391562.36
#  9              5: Other            FALSE    44   102144.58
# 10              5: Other             TRUE    36    61819.94
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 10 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   172   916989.09
#  2 1: Non-Hispanic White             TRUE   341  1284678.19
#  3 2: Non-Hispanic Black            FALSE   271  1125421.44
#  4 2: Non-Hispanic Black             TRUE    69   211164.25
#  5           3: Hispanic            FALSE   314  1461988.52
#  6           3: Hispanic             TRUE    76   241975.87
#  7              4: Asian            FALSE    98   488004.58
#  8              4: Asian             TRUE   106   391562.36
#  9              5: Other            FALSE    44   102144.58
# 10              5: Other             TRUE    36    61819.94



public_v2_112917.levels123 %>% nrow
public_v2_112917.levels123$CAPI_WT %>% sum
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% nrow
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% select(CAPI_WT) %>% sum
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% nrow
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% select(CAPI_WT) %>% sum
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
# > public_v2_112917.levels123 %>% nrow
# [1] 1527
# > public_v2_112917.levels123$CAPI_WT %>% sum
# [1] 6285749
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% nrow
# [1] 1525
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% select(CAPI_WT) %>% sum
# [1] 6279061
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
#           N CAPI_WT.sum 
#        1525     6279061 
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% nrow
# [1] 1527
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% select(CAPI_WT) %>% sum
# [1] 6285749
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
#           N CAPI_WT.sum 
#        1527     6285749 




#@@@@ Joint probability distribution P(X^dm, X^SDH) table for each possible value set of {X^dm, X^SDH} ======
#@@@ joint_distribution P(X^RACE, X^SDH) ====
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N_by_RACE_SDH = n(), CAPI_WT.sum_by_RACE_SDH = sum(CAPI_WT)) %>% 
    ungroup %>% mutate(`P(X^RACE, X^SDH)` = CAPI_WT.sum_by_RACE_SDH/sum(CAPI_WT.sum_by_RACE_SDH))
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N_by_RACE_SDH = n(), CAPI_WT.sum_by_RACE_SDH = sum(CAPI_WT)) %>% 
    ungroup %>% mutate(`P(X^RACE, X^SDH)` = CAPI_WT.sum_by_RACE_SDH/sum(CAPI_WT.sum_by_RACE_SDH)) %>% select(`P(X^RACE, X^SDH)`) %>% sum
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N_by_RACE_SDH = n(), CAPI_WT.sum_by_RACE_SDH = sum(CAPI_WT)) %>% 
# +     ungroup %>% mutate(`P(X^RACE, X^SDH)` = CAPI_WT.sum_by_RACE_SDH/sum(CAPI_WT.sum_by_RACE_SDH))
# # A tibble: 10 x 5
#                     RACE isCollege_MS_PhD N_by_RACE_SDH CAPI_WT.sum_by_RACE_SDH `P(X^RACE, X^SDH)`
#                   <fctr>            <lgl>         <int>                   <dbl>              <dbl>
#  1 1: Non-Hispanic White            FALSE           172               916989.09        0.145883827
#  2 1: Non-Hispanic White             TRUE           341              1284678.19        0.204379498
#  3 2: Non-Hispanic Black            FALSE           271              1125421.44        0.179043337
#  4 2: Non-Hispanic Black             TRUE            69               211164.25        0.033594127
#  5           3: Hispanic            FALSE           314              1461988.52        0.232587805
#  6           3: Hispanic             TRUE            76               241975.87        0.038495950
#  7              4: Asian            FALSE            98               488004.58        0.077636666
#  8              4: Asian             TRUE           106               391562.36        0.062293669
#  9              5: Other            FALSE            44               102144.58        0.016250185
# 10              5: Other             TRUE            36                61819.94        0.009834936
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N_by_RACE_SDH = n(), CAPI_WT.sum_by_RACE_SDH = sum(CAPI_WT)) %>% 
# +     ungroup %>% mutate(`P(X^RACE, X^SDH)` = CAPI_WT.sum_by_RACE_SDH/sum(CAPI_WT.sum_by_RACE_SDH)) %>% select(`P(X^RACE, X^SDH)`) %>% sum
# [1] 1




#@@@@ Conditional probability distribution P(X^SDH | X^dm) table in which conditional random variable X^dm is presented as row index and the random variable for probability estimation X^SDH is presented as column index. Therefore, for each row represent a row vector of conditional probability distribution of X^SDH given X^dm, and the row sum is 1. ======
#@@@@ Conditional expectation E(X^SDH | X^dm = x^dm) for given value of conditional random variable X^dm. ======
#@@@ conditional_distribution P(X^SDH=1|X^RACE) conditional_expectation E(X^SDH|X^RACE) ====
public_v2_112917.levels123 %>% 
    group_by(RACE) %>% summarise(N_by_RACE = n(), CAPI_WT.sum_by_RACE = sum(CAPI_WT)) %>% 
    ungroup %>% mutate(`P(X^RACE)` = CAPI_WT.sum_by_RACE/sum(CAPI_WT.sum_by_RACE))
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% 
    group_by(RACE, isCollege_MS_PhD) %>% summarize(N_by_RACE_SDH = n(), CAPI_WT.sum_by_RACE_SDH = sum(CAPI_WT)) %>% 
    group_by(RACE) %>% summarise(
        N_by_RACE = sum(N_by_RACE_SDH)
        , CAPI_WT.sum_by_RACE = sum(CAPI_WT.sum_by_RACE_SDH)
        , `P(X^RACE)` = NA
        , `P(X^SDH=0|X^RACE)` = sum((isCollege_MS_PhD==0) * CAPI_WT.sum_by_RACE_SDH)/sum(CAPI_WT.sum_by_RACE_SDH)
        , `P(X^SDH=1|X^RACE)` = sum((isCollege_MS_PhD==1) * CAPI_WT.sum_by_RACE_SDH)/sum(CAPI_WT.sum_by_RACE_SDH)
        , `E(X^SDH|X^RACE)` = sum(isCollege_MS_PhD * CAPI_WT.sum_by_RACE_SDH)/sum(CAPI_WT.sum_by_RACE_SDH)
    ) %>% 
    ungroup %>% mutate(`P(X^RACE)` = CAPI_WT.sum_by_RACE/sum(CAPI_WT.sum_by_RACE))
# > public_v2_112917.levels123 %>% group_by(RACE) %>% summarise(N_by_RACE = n(), CAPI_WT.sum_by_RACE = sum(CAPI_WT)) %>% 
# +     ungroup %>% mutate(`P(X^RACE)` = CAPI_WT.sum_by_RACE/sum(CAPI_WT.sum_by_RACE))
# # A tibble: 5 x 4
#                    RACE N_by_RACE CAPI_WT.sum_by_RACE `P(X^RACE)`
#                  <fctr>     <int>               <dbl>       <dbl>
# 1 1: Non-Hispanic White       513           2201667.3  0.35026332
# 2 2: Non-Hispanic Black       340           1336585.7  0.21263746
# 3           3: Hispanic       390           1703964.4  0.27108376
# 4              4: Asian       204            879566.9  0.13993033
# 5              5: Other        80            163964.5  0.02608512
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N_by_RACE_SDH = n(), CAPI_WT.sum_by_RACE_SDH = sum(CAPI_WT)) %>% 
# +     group_by(RACE) %>% summarise(
# +         N_by_RACE = sum(N_by_RACE_SDH)
# +         , CAPI_WT.sum_by_RACE = sum(CAPI_WT.sum_by_RACE_SDH)
# +         , `P(X^RACE)` = NA
# +         , `P(X^SDH=0|X^RACE)` = sum((isCollege_MS_PhD==0) * CAPI_WT.sum_by_RACE_SDH)/sum(CAPI_WT.sum_by_RACE_SDH)
# +         , `P(X^SDH=1|X^RACE)` = sum((isCollege_MS_PhD==1) * CAPI_WT.sum_by_RACE_SDH)/sum(CAPI_WT.sum_by_RACE_SDH)
# +         , `E(X^SDH|X^RACE)` = sum(isCollege_MS_PhD * CAPI_WT.sum_by_RACE_SDH)/sum(CAPI_WT.sum_by_RACE_SDH)
# +     ) %>% 
# +     ungroup %>% mutate(`P(X^RACE)` = CAPI_WT.sum_by_RACE/sum(CAPI_WT.sum_by_RACE))
# # A tibble: 5 x 7
#                    RACE N_by_RACE CAPI_WT.sum_by_RACE `P(X^RACE)` `P(X^SDH=0|X^RACE)` `P(X^SDH=1|X^RACE)` `E(X^SDH|X^RACE)`
#                  <fctr>     <int>               <dbl>       <dbl>               <dbl>               <dbl>             <dbl>
# 1 1: Non-Hispanic White       513           2201667.3  0.35026332           0.4164976           0.5835024         0.5835024
# 2 2: Non-Hispanic Black       340           1336585.7  0.21263746           0.8420122           0.1579878         0.1579878
# 3           3: Hispanic       390           1703964.4  0.27108376           0.8579924           0.1420076         0.1420076
# 4              4: Asian       204            879566.9  0.13993033           0.5548237           0.4451763         0.4451763
# 5              5: Other        80            163964.5  0.02608512           0.6229676           0.3770324         0.3770324





#@ end -----
