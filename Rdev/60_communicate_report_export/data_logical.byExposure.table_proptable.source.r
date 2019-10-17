# data_logical.byExposure.table_proptable.source.r
# data.ByExposure_sum_prop.source.r



ID_Eligible_Exposure.TargetTrial2v2.159vs266.Outcome.Covariates %>% 
    select(Intervention, Control, Nothing, matches("^PrimaryOutcome[0-9]+"), matches("^SecondaryOutcome[0-9]+"), SecondaryOutcomeP1456fhkl) %>% 
    str #----
# > ID_Eligible_Exposure.TargetTrial2v2.159vs266.Outcome.Covariates %>% 
# +     select(Intervention, Control, Nothing, matches("^PrimaryOutcome[0-9]+"), matches("^SecondaryOutcome[0-9]+"), SecondaryOutcomeP1456fhkl) %>% 
# +     str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	425 obs. of  56 variables:
#  $ Intervention                 : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
#  $ Control                      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Nothing                      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.i.1          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.i.1.minDate  : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome1.i.2          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.i.2.minDate  : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome1.ii.1         : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.ii.1.minDate : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome1.ii.2         : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.ii.2.minDate : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome1.iii          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.iii.minDate  : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome3              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome3.minDate      : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome4              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome4.minDate      : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome5              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome5.minDate      : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome6              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome6.minDate      : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome1              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome2              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome123456         : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PrimaryOutcome1.minDate      : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome2.minDate      : Date, format: NA NA NA NA ...
#  $ PrimaryOutcome123456.minDate : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome1            : logi  FALSE FALSE FALSE FALSE TRUE FALSE ...
#  $ SecondaryOutcome1.minDate    : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome4            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome4.minDate    : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome5            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome5.minDate    : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome6            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome6.minDate    : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome7            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome7.minDate    : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome10           : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome10.minDate   : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome13           : logi  FALSE FALSE TRUE FALSE FALSE TRUE ...
#  $ SecondaryOutcome13.minDate   : Date, format: NA NA "2011-11-11" NA ...
#  $ SecondaryOutcome14           : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome14.minDate   : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome15           : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome15.minDate   : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome15.i         : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome15.i.minDate : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome15.ii        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome15.ii.minDate: Date, format: NA NA NA NA ...
#  $ SecondaryOutcome17           : logi  FALSE FALSE FALSE TRUE FALSE TRUE ...
#  $ SecondaryOutcome17.minDate   : Date, format: NA NA NA "2011-10-25" ...
#  $ SecondaryOutcome20           : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome20.minDate   : Date, format: NA NA NA NA ...
#  $ SecondaryOutcome21           : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SecondaryOutcome21.minDate   : Date, format: NA NA NA NA ...
#  $ SecondaryOutcomeP1456fhkl    : logi  FALSE FALSE FALSE TRUE TRUE TRUE ...


# ID_Eligible_Exposure.TargetTrial2v2.159vs266.Outcome.Covariates %>% 
#     group_by(Intervention, Control, Nothing) %>% 
#     select(matches("^PrimaryOutcome[0-9]+"), matches("^SecondaryOutcome[0-9]+"), SecondaryOutcomeP1456fhkl) %>% 
#     add_column(Ntotal = T, .before = 1) %>% select_if(is.logical) %>% summarize_all(sum, na.rm = T) %>% tribble_paste
df = tibble::tribble(
    ~Intervention, ~Control, ~Nothing, ~Ntotal, ~PrimaryOutcome1.i.1, ~PrimaryOutcome1.i.2, ~PrimaryOutcome1.ii.1, ~PrimaryOutcome1.ii.2, ~PrimaryOutcome1.iii, ~PrimaryOutcome3, ~PrimaryOutcome4, ~PrimaryOutcome5, ~PrimaryOutcome6, ~PrimaryOutcome1, ~PrimaryOutcome2, ~PrimaryOutcome123456, ~SecondaryOutcome1, ~SecondaryOutcome4, ~SecondaryOutcome5, ~SecondaryOutcome6, ~SecondaryOutcome7, ~SecondaryOutcome10, ~SecondaryOutcome13, ~SecondaryOutcome14, ~SecondaryOutcome15, ~SecondaryOutcome15.i, ~SecondaryOutcome15.ii, ~SecondaryOutcome17, ~SecondaryOutcome20, ~SecondaryOutcome21, ~SecondaryOutcomeP1456fhkl,
            FALSE,     TRUE,    FALSE,    266L,                   9L,                   7L,                    2L,                    0L,                   0L,               1L,               0L,               0L,               1L,               8L,              66L,                   74L,                59L,                 0L,                 0L,                 1L,                 0L,                  7L,                121L,                  0L,                  0L,                    6L,                     0L,                 93L,                  1L,                  7L,                       174L,
             TRUE,    FALSE,    FALSE,    159L,                   2L,                   1L,                    4L,                    0L,                   0L,               0L,               1L,               0L,               3L,               5L,              39L,                   44L,                21L,                 1L,                 0L,                 3L,                 0L,                  5L,                 89L,                  0L,                  0L,                    2L,                     1L,                 56L,                  0L,                  0L,                        94L
    )


df %>% t %>% addmargins(margin = 2) #----
df %>% ungroup %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>% round(3) #----
df %>% as.matrix %>% addmargins(margin = 1) %>% as.data.frame %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>% round(3) #----
# > df %>% t %>% addmargins(margin = 2) #----
#                                   Sum
# Intervention                0   1   1
# Control                     1   0   1
# Nothing                     0   0   0
# Ntotal                    266 159 425
# PrimaryOutcome1.i.1         9   2  11
# PrimaryOutcome1.i.2         7   1   8
# PrimaryOutcome1.ii.1        2   4   6
# PrimaryOutcome1.ii.2        0   0   0
# PrimaryOutcome1.iii         0   0   0
# PrimaryOutcome3             1   0   1
# PrimaryOutcome4             0   1   1
# PrimaryOutcome5             0   0   0
# PrimaryOutcome6             1   3   4
# PrimaryOutcome1             8   5  13
# PrimaryOutcome2            66  39 105
# PrimaryOutcome123456       74  44 118
# SecondaryOutcome1          59  21  80
# SecondaryOutcome4           0   1   1
# SecondaryOutcome5           0   0   0
# SecondaryOutcome6           1   3   4
# SecondaryOutcome7           0   0   0
# SecondaryOutcome10          7   5  12
# SecondaryOutcome13        121  89 210
# SecondaryOutcome14          0   0   0
# SecondaryOutcome15          0   0   0
# SecondaryOutcome15.i        6   2   8
# SecondaryOutcome15.ii       0   1   1
# SecondaryOutcome17         93  56 149
# SecondaryOutcome20          1   0   1
# SecondaryOutcome21          7   0   7
# SecondaryOutcomeP1456fhkl 174  94 268
# > df %>% ungroup %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>% round(3) #----
#                            [,1]  [,2]
# Intervention              0.000 1.000
# Control                   1.000 0.000
# Nothing                   0.000 0.000
# Ntotal                    1.000 1.000
# PrimaryOutcome1.i.1       0.034 0.013
# PrimaryOutcome1.i.2       0.026 0.006
# PrimaryOutcome1.ii.1      0.008 0.025
# PrimaryOutcome1.ii.2      0.000 0.000
# PrimaryOutcome1.iii       0.000 0.000
# PrimaryOutcome3           0.004 0.000
# PrimaryOutcome4           0.000 0.006
# PrimaryOutcome5           0.000 0.000
# PrimaryOutcome6           0.004 0.019
# PrimaryOutcome1           0.030 0.031
# PrimaryOutcome2           0.248 0.245
# PrimaryOutcome123456      0.278 0.277
# SecondaryOutcome1         0.222 0.132
# SecondaryOutcome4         0.000 0.006
# SecondaryOutcome5         0.000 0.000
# SecondaryOutcome6         0.004 0.019
# SecondaryOutcome7         0.000 0.000
# SecondaryOutcome10        0.026 0.031
# SecondaryOutcome13        0.455 0.560
# SecondaryOutcome14        0.000 0.000
# SecondaryOutcome15        0.000 0.000
# SecondaryOutcome15.i      0.023 0.013
# SecondaryOutcome15.ii     0.000 0.006
# SecondaryOutcome17        0.350 0.352
# SecondaryOutcome20        0.004 0.000
# SecondaryOutcome21        0.026 0.000
# SecondaryOutcomeP1456fhkl 0.654 0.591
# > df %>% as.matrix %>% addmargins(margin = 1) %>% as.data.frame %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>% round(3) #----
#                            [,1]  [,2]  [,3]
# Intervention              0.000 0.006 0.002
# Control                   0.004 0.000 0.002
# Nothing                   0.000 0.000 0.000
# Ntotal                    1.000 1.000 1.000
# PrimaryOutcome1.i.1       0.034 0.013 0.026
# PrimaryOutcome1.i.2       0.026 0.006 0.019
# PrimaryOutcome1.ii.1      0.008 0.025 0.014
# PrimaryOutcome1.ii.2      0.000 0.000 0.000
# PrimaryOutcome1.iii       0.000 0.000 0.000
# PrimaryOutcome3           0.004 0.000 0.002
# PrimaryOutcome4           0.000 0.006 0.002
# PrimaryOutcome5           0.000 0.000 0.000
# PrimaryOutcome6           0.004 0.019 0.009
# PrimaryOutcome1           0.030 0.031 0.031
# PrimaryOutcome2           0.248 0.245 0.247
# PrimaryOutcome123456      0.278 0.277 0.278
# SecondaryOutcome1         0.222 0.132 0.188
# SecondaryOutcome4         0.000 0.006 0.002
# SecondaryOutcome5         0.000 0.000 0.000
# SecondaryOutcome6         0.004 0.019 0.009
# SecondaryOutcome7         0.000 0.000 0.000
# SecondaryOutcome10        0.026 0.031 0.028
# SecondaryOutcome13        0.455 0.560 0.494
# SecondaryOutcome14        0.000 0.000 0.000
# SecondaryOutcome15        0.000 0.000 0.000
# SecondaryOutcome15.i      0.023 0.013 0.019
# SecondaryOutcome15.ii     0.000 0.006 0.002
# SecondaryOutcome17        0.350 0.352 0.351
# SecondaryOutcome20        0.004 0.000 0.002
# SecondaryOutcome21        0.026 0.000 0.016
# SecondaryOutcomeP1456fhkl 0.654 0.591 0.631




cbind(
    df %>% t %>% addmargins(margin = 2) #----
    , 
    df %>% as.matrix %>% addmargins(margin = 1) %>% as.data.frame %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>% round(3) #----
    , 
    df %>% as.matrix %>% addmargins(margin = 1) %>% as.data.frame %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>%  {. * 100} %>% round(2) #----
)
# > cbind(
# +     df %>% t %>% addmargins(margin = 2) #----
# +     , 
# +     df %>% as.matrix %>% addmargins(margin = 1) %>% as.data.frame %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>% round(3) #----
# +     , 
# +     df %>% as.matrix %>% addmargins(margin = 1) %>% as.data.frame %>% mutate_if(is.numeric, function(vec) vec / .$Ntotal ) %>% t %>%  {. * 100} %>% round(2) #----
# + )
#                                   Sum                                       
# Intervention                0   1   1 0.000 0.006 0.002   0.00   0.63   0.24
# Control                     1   0   1 0.004 0.000 0.002   0.38   0.00   0.24
# Nothing                     0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# Ntotal                    266 159 425 1.000 1.000 1.000 100.00 100.00 100.00
# PrimaryOutcome1.i.1         9   2  11 0.034 0.013 0.026   3.38   1.26   2.59
# PrimaryOutcome1.i.2         7   1   8 0.026 0.006 0.019   2.63   0.63   1.88
# PrimaryOutcome1.ii.1        2   4   6 0.008 0.025 0.014   0.75   2.52   1.41
# PrimaryOutcome1.ii.2        0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# PrimaryOutcome1.iii         0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# PrimaryOutcome3             1   0   1 0.004 0.000 0.002   0.38   0.00   0.24
# PrimaryOutcome4             0   1   1 0.000 0.006 0.002   0.00   0.63   0.24
# PrimaryOutcome5             0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# PrimaryOutcome6             1   3   4 0.004 0.019 0.009   0.38   1.89   0.94
# PrimaryOutcome1             8   5  13 0.030 0.031 0.031   3.01   3.14   3.06
# PrimaryOutcome2            66  39 105 0.248 0.245 0.247  24.81  24.53  24.71
# PrimaryOutcome123456       74  44 118 0.278 0.277 0.278  27.82  27.67  27.76
# SecondaryOutcome1          59  21  80 0.222 0.132 0.188  22.18  13.21  18.82
# SecondaryOutcome4           0   1   1 0.000 0.006 0.002   0.00   0.63   0.24
# SecondaryOutcome5           0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# SecondaryOutcome6           1   3   4 0.004 0.019 0.009   0.38   1.89   0.94
# SecondaryOutcome7           0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# SecondaryOutcome10          7   5  12 0.026 0.031 0.028   2.63   3.14   2.82
# SecondaryOutcome13        121  89 210 0.455 0.560 0.494  45.49  55.97  49.41
# SecondaryOutcome14          0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# SecondaryOutcome15          0   0   0 0.000 0.000 0.000   0.00   0.00   0.00
# SecondaryOutcome15.i        6   2   8 0.023 0.013 0.019   2.26   1.26   1.88
# SecondaryOutcome15.ii       0   1   1 0.000 0.006 0.002   0.00   0.63   0.24
# SecondaryOutcome17         93  56 149 0.350 0.352 0.351  34.96  35.22  35.06
# SecondaryOutcome20          1   0   1 0.004 0.000 0.002   0.38   0.00   0.24
# SecondaryOutcome21          7   0   7 0.026 0.000 0.016   2.63   0.00   1.65
# SecondaryOutcomeP1456fhkl 174  94 268 0.654 0.591 0.631  65.41  59.12  63.06







#@ end -----

