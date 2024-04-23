# function.ConfusionMatrix.Metrics.dev.r

library(tidyverse)
# InputSquareMatrix1.tbl <- read_delim("InputSquareMatrix.tbl.csv", "\t", escape_double = FALSE, trim_ws = TRUE)
tribble_paste = datapasta::tribble_paste
tibble::tribble(
      ~Actual.old, ~Actual,
             "Ia",     "I",
             "Ib",     "I",
            "IIa",    "II",
            "IIb",    "II",
           "IIIa",   "III",
           "IIIb",   "III",
             "IV",    "IV"
      ) %>% bind_cols(read.table(file = "clipboard", sep = "\t", header=F)) %>%
    set_names(c("Actual.old", "Actual", "I", "II", "III", "IV")) %>% 
    tribble_paste #----
InputMatrix1.tbl = tibble::tribble(
    ~Actual.old, ~Actual, ~X1, ~X2, ~X3, ~X4,
           "Ia",     "I",  45,   2,   1,   0,
           "Ib",     "I",  17,   3,   1,   0,
          "IIa",    "II",   3,   6,   1,   0,
          "IIb",    "II",   3,   2,   1,   1,
         "IIIa",   "III",   3,   5,   7,   4,
         "IIIb",   "III",   0,   0,   0,   5,
           "IV",    "IV",   1,   3,   1,  39
    )


InputSquareMatrix1.tbl = InputMatrix1.tbl %>% select(-matches(".old$")) %>% 
        group_by(Actual) %>% summarise_all(sum) %>% 
        as_tibble
InputSquareMatrix1.tbl %>% tribble_paste
InputSquareMatrix1.tbl = tibble::tribble(
    ~Actual, ~X1, ~X2, ~X3, ~X4,
        "I",  62,   5,   2,   0,
       "II",   6,   8,   2,   1,
      "III",   3,   5,   7,   9,
       "IV",   1,   3,   1,  39
    )


function.ConfusionMatrix.Metrics = function(InputSquareMatrix.tbl) {
    out = list()
    out$InputSquareMatrix.tbl = InputSquareMatrix.tbl
    
    InputSquareMatrix.tbl.gather = InputSquareMatrix.tbl %>% gather(key = "Predicted", value = "value", -Actual)
    InputSquareMatrix.tbl.gather = InputSquareMatrix.tbl.gather %>% mutate(Actual = Actual %>% as.character)
    if(!all.equal(sort(unique(InputSquareMatrix.tbl.gather$Actual)), sort(unique(InputSquareMatrix.tbl.gather$Predicted)))) {
        stop('!all.equal(sort(unique(Actual)), sort(unique(Predicted)))')
    }
    for (i in sort(unique(InputSquareMatrix.tbl.gather$Actual))) {
        InputSquareMatrix.tbl.gather[[paste0("Actual_", i)]] = InputSquareMatrix.tbl.gather$Actual == i
        InputSquareMatrix.tbl.gather[[paste0("Predicted_", i)]] = InputSquareMatrix.tbl.gather$Predicted == i
    }
    # > InputSquareMatrix.tbl.gather
    # # A tibble: 16 x 11
    #    Actual    Predicted    value Actual_1 Predicted_1 Actual_2 Predicted_2 Actual_3 Predicted_3 Actual_4 Predicted_4
    #    <chr> <chr> <dbl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl>
    #  1 1     1        62 TRUE  TRUE  FALSE FALSE FALSE FALSE FALSE FALSE
    #  2 2     1         6 FALSE TRUE  TRUE  FALSE FALSE FALSE FALSE FALSE
    #  3 3     1         3 FALSE TRUE  FALSE FALSE TRUE  FALSE FALSE FALSE
    #  4 4     1         1 FALSE TRUE  FALSE FALSE FALSE FALSE TRUE  FALSE
    #  5 1     2         5 TRUE  FALSE FALSE TRUE  FALSE FALSE FALSE FALSE
    #  6 2     2         8 FALSE FALSE TRUE  TRUE  FALSE FALSE FALSE FALSE
    #  7 3     2         5 FALSE FALSE FALSE TRUE  TRUE  FALSE FALSE FALSE
    #  8 4     2         3 FALSE FALSE FALSE TRUE  FALSE FALSE TRUE  FALSE
    #  9 1     3         2 TRUE  FALSE FALSE FALSE FALSE TRUE  FALSE FALSE
    # 10 2     3         2 FALSE FALSE TRUE  FALSE FALSE TRUE  FALSE FALSE
    # 11 3     3         7 FALSE FALSE FALSE FALSE TRUE  TRUE  FALSE FALSE
    # 12 4     3         1 FALSE FALSE FALSE FALSE FALSE TRUE  TRUE  FALSE
    # 13 1     4         0 TRUE  FALSE FALSE FALSE FALSE FALSE FALSE TRUE 
    # 14 2     4         1 FALSE FALSE TRUE  FALSE FALSE FALSE FALSE TRUE 
    # 15 3     4         9 FALSE FALSE FALSE FALSE TRUE  FALSE FALSE TRUE 
    # 16 4     4        39 FALSE FALSE FALSE FALSE FALSE FALSE TRUE  TRUE 
    
    out$InputSquareMatrix.tbl.gather = InputSquareMatrix.tbl.gather
    
    for (i in sort(unique(InputSquareMatrix.tbl.gather$Actual))) {
        out[[paste0("ConfusionLongFormat", i)]] = 
            InputSquareMatrix.tbl.gather %>% mutate(
                Actual = !!rlang::sym(paste0("Actual_", i))
                , Predicted = !!rlang::sym(paste0("Predicted_", i))
            ) %>% group_by(Actual, Predicted) %>% summarise(value = sum(value)) %>%
            mutate(
                binary = Predicted * 10 + Actual,
                label = binary %>% recode(
                    `0` = "TN"
                    , `1` = "FN"
                    , `10` = "FP"
                    , `11` = "TP"
                )
            ) %>% select(-value, everything())
    }
    # > out
    # $`InputSquareMatrix.tbl`
    # # A tibble: 4 x 5
    #   Actual    `1` `2` `3` `4`
    #   <chr>     <dbl>     <dbl>     <dbl>     <dbl>
    # 1 1            62         5         2         0
    # 2 2             6         8         2         1
    # 3 3             3         5         7         9
    # 4 4             1         3         1        39
    # 
    # $ConfusionLongFormat1
    # # A tibble: 4 x 5
    # # Groups:   Predicted [2]
    #   Predicted Actual binary label value
    #   <lgl>     <lgl>   <dbl> <chr> <dbl>
    # 1 FALSE     FALSE       0 TN       75
    # 2 FALSE     TRUE        1 FN       10
    # 3 TRUE      FALSE      10 FP        7
    # 4 TRUE      TRUE       11 TP       62
    # 
    # $ConfusionLongFormat2
    # # A tibble: 4 x 5
    # # Groups:   Predicted [2]
    #   Predicted Actual binary label value
    #   <lgl>     <lgl>   <dbl> <chr> <dbl>
    # 1 FALSE     FALSE       0 TN      124
    # 2 FALSE     TRUE        1 FN       13
    # 3 TRUE      FALSE      10 FP        9
    # 4 TRUE      TRUE       11 TP        8
    # 
    # $ConfusionLongFormat3
    # # A tibble: 4 x 5
    # # Groups:   Predicted [2]
    #   Predicted Actual binary label value
    #   <lgl>     <lgl>   <dbl> <chr> <dbl>
    # 1 FALSE     FALSE       0 TN      125
    # 2 FALSE     TRUE        1 FN        5
    # 3 TRUE      FALSE      10 FP       17
    # 4 TRUE      TRUE       11 TP        7
    # 
    # $ConfusionLongFormat4
    # # A tibble: 4 x 5
    # # Groups:   Predicted [2]
    #   Predicted Actual binary label value
    #   <lgl>     <lgl>   <dbl> <chr> <dbl>
    # 1 FALSE     FALSE       0 TN      100
    # 2 FALSE     TRUE        1 FN       10
    # 3 TRUE      FALSE      10 FP        5
    # 4 TRUE      TRUE       11 TP       39
    
    
    out$Metrics = sort(unique(InputSquareMatrix.tbl.gather$Actual)) %>% map(function(i) {
        # label_value = InputSquareMatrix.tbl.gather.mutate %>% mutate(
        # 	Actual = !!rlang::sym(paste0("Actual_", i))
        # 	, Predicted = !!rlang::sym(paste0("Predicted_", i))
        # ) %>% group_by(Actual, Predicted) %>% summarise(value = sum(value)) %>% 
        # 	mutate(
        # 		binary = Predicted * 10 + Actual, 
        # 		label = binary %>% recode(
        # 			`0` = "TN"
        # 			, `1` = "FN"
        # 			, `10` = "FP"
        # 			, `11` = "TP"
        # 		)
        # 	) %>% select(-value, everything()) %>% 
        label_value = out[[paste0("ConfusionLongFormat", i)]] %>% 
            ungroup %>% select(label, value) %>% spread(key = label, value = value)
        label_value$varname4Actual = paste0("Actual_", i)
        label_value$varname4Predicted = paste0("Predicted_", i)
        # label_value = label_value %>% select(matches("^varname"), everything())
        label_value = label_value %>% select(matches("^varname"), TN, FN, FP, TP)
        TN = label_value$TN
        FN = label_value$FN
        FP = label_value$FP
        TP = label_value$TP
        Sensitivity = TP/(TP+FN)
        Specificity = TN/(TN+FP)
        PPV = TP/(TP+FP)
        # NPV = TN/(TN+FN)
        # LRp = TP/(TP+FN) / FP*(FP+TN)
        # LRn = FN/(TP+FN) / TN*(FP+TN)
        label_value$Sensitivity = TP/(TP+FN)
        label_value$Specificity = TN/(TN+FP)
        label_value$PPV = TP/(TP+FP)
        label_value$NPV = TN/(TN+FN)
        # https://en.wikipedia.org/wiki/F1_score
        label_value$F1score = 2/(1/Sensitivity+1/PPV)
        label_value$F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)
        label_value$F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)
        label_value$OR = TN * TP / FN / FP
        label_value$LRp = TP/(TP+FN) / FP*(FP+TN)
        label_value$LRn = FN/(TP+FN) / TN*(FP+TN)
        label_value$phi = (TP*TN - FN*FP) / {as.numeric(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5
        SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)
        TN_expected = TN/(TN+FP)*TN/(TN+FN)
        # FN_expected = 
        # FP_expected = 
        TP_expected = TP/(TP+FP)*TP/(TP+FN)
        ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)
        # ChanceAgreement = TN/(TN+FP)*TN/(TN+FN) + TP/(TP+FP)*TP/(TP+FN)
        label_value$SimpleAgreement = SimpleAgreement
        label_value$ChanceAgreement = ChanceAgreement
        label_value$Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement) 
        label_value$c = (Sensitivity + Specificity)/2
        # ?chisq.test
        # label_value$Chi_squared = 		
        # label_value$p_chi_squared = 		
        # label_value$p_phi = 		
        # label_value$R_squared = 		
        label_value
    }) %>% bind_rows # %>% rownames_to_column
    
    # out$Metrics = out$Metrics %>% column_to_rownames %>% t %>% as.data.frame %>% rownames_to_column %>% 
    out$Metrics = out$Metrics %>% t %>% as.data.frame 
    
    # out$Metrics %>% dput
    # out$Metrics %>% map_df(as.numeric) %>% dput
    # out$Metrics %>% map_df(as.character) %>% map_df(as.numeric) %>% rowMeans %>% dput
    
    out$Metrics$MacroAverage = out$Metrics %>% map_df(as.character) %>% map_df(as.numeric) %>% rowMeans
    
    out$Metrics = out$Metrics %>% rownames_to_column %>% add_column(equation = 	"", .after = "rowname")
    out$Metrics$equation = 
        c(
            rep(NA, 2)
            , "True Negative = (Predicted == FALSE) & (Actual == FALSE)"
            , "False Negative = (Predicted == FALSE) & (Actual == TRUE)"
            , "False Positive = (Predicted == TRUE) & (Actual == FALSE)"
            , "True Positive = (Predicted == TRUE) & (Actual == TRUE)"
            , "Sensitivity = TP/(TP+FN)"
            , "Specificity = TN/(TN+FP)"
            , "PPV = TP/(TP+FP)"
            , "NPV = TN/(TN+FN)"
            , "F1score = 2/(1/Sensitivity+1/PPV)"
            , "F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)"
            , "F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)"
            , "OR = TN * TP / FN / FP"
            , "LRp = TP/(TP+FN) / FP*(FP+TN)"
            , "LRn = FN/(TP+FN) / TN*(FP+TN)"
            , "phi = (TP*TN - FN*FP) / {(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5"
            , "SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)"
            , "ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)"
            , "Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement)"
            , "c = (Sensitivity + Specificity)/2"
        ) 
    out
}




# (mat = as.matrix(read.table(text="  setosa versicolor virginica
#  setosa         29          0         0
#  versicolor      0         20         2
#  virginica       0          3        21", header=T)))
# 
# 
# 
# mat.ConfusionMatrix.Metrics = function.ConfusionMatrix.Metrics(mat)
# mat.ConfusionMatrix.Metrics = function.ConfusionMatrix.Metrics(as_tibble(mat))

InputSquareMatrix.tbl.ConfusionMatrix1.Metrics = function.ConfusionMatrix.Metrics(InputSquareMatrix1.tbl)
InputSquareMatrix.tbl.ConfusionMatrix1.Metrics
# > InputSquareMatrix.tbl.ConfusionMatrix1.Metrics = function.ConfusionMatrix.Metrics(InputSquareMatrix.tbl)
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) : NAs introduced by coercion
# 3: In .f(.x[[i]], ...) : NAs introduced by coercion
# 4: In .f(.x[[i]], ...) : NAs introduced by coercion
# > InputSquareMatrix.tbl.ConfusionMatrix.Metrics
# $`InputSquareMatrix.tbl`
# # A tibble: 4 x 5
#   Actual `1` `2` `3` `4`
#   <chr>      <dbl>     <dbl>     <dbl>     <dbl>
# 1 1             62         5         2         0
# 2 2              6         8         2         1
# 3 3              3         5         7         9
# 4 4              1         3         1        39
# 
# $ConfusionLongFormat1
# # A tibble: 4 x 5
# # Groups:   Actual [2]
#   Actual Predicted binary label value
#   <lgl>  <lgl>      <dbl> <chr> <dbl>
# 1 FALSE  FALSE          0 TN       75
# 2 FALSE  TRUE          10 FP       10
# 3 TRUE   FALSE          1 FN        7
# 4 TRUE   TRUE          11 TP       62
# 
# $ConfusionLongFormat2
# # A tibble: 4 x 5
# # Groups:   Actual [2]
#   Actual Predicted binary label value
#   <lgl>  <lgl>      <dbl> <chr> <dbl>
# 1 FALSE  FALSE          0 TN      124
# 2 FALSE  TRUE          10 FP       13
# 3 TRUE   FALSE          1 FN        9
# 4 TRUE   TRUE          11 TP        8
# 
# $ConfusionLongFormat3
# # A tibble: 4 x 5
# # Groups:   Actual [2]
#   Actual Predicted binary label value
#   <lgl>  <lgl>      <dbl> <chr> <dbl>
# 1 FALSE  FALSE          0 TN      125
# 2 FALSE  TRUE          10 FP        5
# 3 TRUE   FALSE          1 FN       17
# 4 TRUE   TRUE          11 TP        7
# 
# $ConfusionLongFormat4
# # A tibble: 4 x 5
# # Groups:   Actual [2]
#   Actual Predicted binary label value
#   <lgl>  <lgl>      <dbl> <chr> <dbl>
# 1 FALSE  FALSE          0 TN      100
# 2 FALSE  TRUE          10 FP       10
# 3 TRUE   FALSE          1 FN        5
# 4 TRUE   TRUE          11 TP       39
# 
# $Metrics
#              rowname                                                                  equation          V1          V2          V3          V4 MacroAverage
# 1  varname4Predicted                                                                      <NA>    Actual_1    Actual_2    Actual_3    Actual_4           NA
# 2     varname4Actual                                                                      <NA> Predicted_1 Predicted_2 Predicted_3 Predicted_4           NA
# 3                 TN                  True Negative = (Predicted == FALSE) & (Actual == FALSE)          75         124         125         100 106.00000000
# 4                 FN                  False Negative = (Predicted == FALSE) & (Actual == TRUE)           7           9          17           5   9.50000000
# 5                 FP                  False Positive = (Predicted == TRUE) & (Actual == FALSE)          10          13           5          10   9.50000000
# 6                 TP                    True Positive = (Predicted == TRUE) & (Actual == TRUE)          62           8           7          39  29.00000000
# 7        Sensitivity                                                  Sensitivity = TP/(TP+FN)   0.8985507   0.4705882   0.2916667   0.8863636   0.63679230
# 8        Specificity                                                  Specificity = TN/(TN+FP)   0.8823529   0.9051095   0.9615385   0.9090909   0.91452295
# 9                PPV                                                          PPV = TP/(TP+FP)   0.8611111   0.3809524   0.5833333   0.7959184   0.65532880
# 10               NPV                                                          NPV = TN/(TN+FN)   0.9146341   0.9323308   0.8802817   0.9523810   0.91990690
# 11           F1score                                         F1score = 2/(1/Sensitivity+1/PPV)   0.8794326   0.4210526   0.3888889   0.8387097   0.63202095
# 12           F2score                                 F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)   0.8908046   0.4494382   0.3240741   0.8666667   0.63274590
# 13          F.5score                              F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)   0.8683473   0.3960396   0.4861111   0.8125000   0.64074950
# 14                OR                                                    OR = TN * TP / FN / FP   66.428571    8.478632   10.294118   78.000000  40.80033025
# 15               LRp                                             LRp = TP/(TP+FN) / FP*(FP+TN)    7.637681    4.959276    7.583333    9.750000   7.48257250
# 16               LRn                                             LRn = FN/(TP+FN) / TN*(FP+TN)   0.1149758   0.5849146   0.7366667   0.1250000   0.39038927
# 17               phi             phi = (TP*TN - FN*FP) / {(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5   0.7783202   0.3430740   0.3426218   0.7715167   0.55888318
# 18   SimpleAgreement                                   SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)   0.8896104   0.8571429   0.8571429   0.9025974   0.87662340
# 19   ChanceAgreement               ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)  0.01048091  0.01095924  0.01099253  0.01124417   0.01091921
# 20       Cohen_kappa Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement)   0.8884412   0.8555599   0.8555550   0.9014897   0.87526145
# 21                 c                                         c = (Sensitivity + Specificity)/2   0.8904518   0.6878489   0.6266026   0.8977273   0.77565765






InputSquareMatrix1.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} #-----
InputSquareMatrix1.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} %>% filter(rowname == "Sensitivity") %>% select(MacroAverage) %>% unlist %>% unname #-----
InputSquareMatrix1.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} %>% filter(rowname == "Specificity") %>% select(MacroAverage) %>% unlist %>% unname #-----
InputSquareMatrix1.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} %>% filter(rowname == "c") %>% select(MacroAverage) %>% unlist %>% unname #-----
# > InputSquareMatrix.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} #-----
#              rowname                                                                  equation          V1          V2          V3          V4 MacroAverage
# 1     varname4Actual                                                                      <NA>    Actual_1    Actual_2    Actual_3    Actual_4           NA
# 2  varname4Predicted                                                                      <NA> Predicted_1 Predicted_2 Predicted_3 Predicted_4           NA
# 3                 TN                  True Negative = (Predicted == FALSE) & (Actual == FALSE)          75         124         125         100 106.00000000
# 4                 FN                  False Negative = (Predicted == FALSE) & (Actual == TRUE)           7           9          17           5   9.50000000
# 5                 FP                  False Positive = (Predicted == TRUE) & (Actual == FALSE)          10          13           5          10   9.50000000
# 6                 TP                    True Positive = (Predicted == TRUE) & (Actual == TRUE)          62           8           7          39  29.00000000
# 7        Sensitivity                                                  Sensitivity = TP/(TP+FN)   0.8985507   0.4705882   0.2916667   0.8863636   0.63679230
# 8        Specificity                                                  Specificity = TN/(TN+FP)   0.8823529   0.9051095   0.9615385   0.9090909   0.91452295
# 9                PPV                                                          PPV = TP/(TP+FP)   0.8611111   0.3809524   0.5833333   0.7959184   0.65532880
# 10               NPV                                                          NPV = TN/(TN+FN)   0.9146341   0.9323308   0.8802817   0.9523810   0.91990690
# 11           F1score                                         F1score = 2/(1/Sensitivity+1/PPV)   0.8794326   0.4210526   0.3888889   0.8387097   0.63202095
# 12           F2score                                 F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)   0.8908046   0.4494382   0.3240741   0.8666667   0.63274590
# 13          F.5score                              F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)   0.8683473   0.3960396   0.4861111   0.8125000   0.64074950
# 14                OR                                                    OR = TN * TP / FN / FP   66.428571    8.478632   10.294118   78.000000  40.80033025
# 15               LRp                                             LRp = TP/(TP+FN) / FP*(FP+TN)    7.637681    4.959276    7.583333    9.750000   7.48257250
# 16               LRn                                             LRn = FN/(TP+FN) / TN*(FP+TN)   0.1149758   0.5849146   0.7366667   0.1250000   0.39038927
# 17               phi             phi = (TP*TN - FN*FP) / {(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5   0.7783202   0.3430740   0.3426218   0.7715167   0.55888318
# 18   SimpleAgreement                                   SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)   0.8896104   0.8571429   0.8571429   0.9025974   0.87662340
# 19   ChanceAgreement               ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)  0.01048091  0.01095924  0.01099253  0.01124417   0.01091921
# 20       Cohen_kappa Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement)   0.8884412   0.8555599   0.8555550   0.9014897   0.87526145
# 21                 c                                         c = (Sensitivity + Specificity)/2   0.8904518   0.6878489   0.6266026   0.8977273   0.77565765
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) : NAs introduced by coercion
# 3: In .f(.x[[i]], ...) : NAs introduced by coercion
# 4: In .f(.x[[i]], ...) : NAs introduced by coercion
# > InputSquareMatrix.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} %>% filter(rowname == "Sensitivity") %>% select(MacroAverage) %>% unlist %>% unname #-----
# [1] 0.6367923
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) : NAs introduced by coercion
# 3: In .f(.x[[i]], ...) : NAs introduced by coercion
# 4: In .f(.x[[i]], ...) : NAs introduced by coercion
# > InputSquareMatrix.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} %>% filter(rowname == "Specificity") %>% select(MacroAverage) %>% unlist %>% unname #-----
# [1] 0.914523
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) : NAs introduced by coercion
# 3: In .f(.x[[i]], ...) : NAs introduced by coercion
# 4: In .f(.x[[i]], ...) : NAs introduced by coercion
# > InputSquareMatrix.tbl %>% function.ConfusionMatrix.Metrics %>% {.$Metrics} %>% filter(rowname == "c") %>% select(MacroAverage) %>% unlist %>% unname #-----
# [1] 0.7756576
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) : NAs introduced by coercion
# 3: In .f(.x[[i]], ...) : NAs introduced by coercion
# 4: In .f(.x[[i]], ...) : NAs introduced by coercion






#@ =====
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {sum(diag(.))/sum(.)} # Simple Accuracy ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == T) ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {sum(diag(.))/sum(.)} # Simple Accuracy ----
# [1] 0.7532468
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == T) ----
# [1] 0.6367923
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
# [1] 0.914523
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
# [1] 0.7890248
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# [1] 0.9001339
# Warning message:
# Setting row names on a tibble is deprecated. 





#@ =====
mat = InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix
mat %>% dput
# > mat %>% dput
mat = structure(c(62, 6, 3, 1, 5, 8, 5, 3, 2, 2, 7, 1, 0, 1, 9, 39), .Dim = c(4L,
4L), .Dimnames = list(c("1", "2", "3", "4"), c("1", "2", "3",
"4")))
mat
# > mat
#    1 2 3  4
# 1 62 5 2  0
# 2  6 8 2  1
# 3  3 5 7  9
# 4  1 3 1 39


mat %>% {sum(.)} #----
mat %>% {sum(diag(.))} #----
mat %>% {sum(diag(.))/sum(.)} #----
# > mat %>% {sum(.)} #----
# [1] 154
# > mat %>% {sum(diag(.))} #----
# [1] 116
# > mat %>% {sum(diag(.))/sum(.)} #----
# [1] 0.7532468


# Sensitivity = TP/(Actual == TRUE) =====
# Sensitivity = TP/(TP+FN) =====
mat %>% addmargins #----
mat %>% {diag(.)} # True Positive = (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == T) ----
mat %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == T) ----
# > mat %>% addmargins #----
#      1  2  3  4 Sum
# 1   62  5  2  0  69
# 2    6  8  2  1  17
# 3    3  5  7  9  24
# 4    1  3  1 39  44
# Sum 72 21 12 49 154
# > mat %>% {diag(.)} # TP ----
#  1  2  3  4 
# 62  8  7 39 
# > mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
#  1  2  3  4 
# 69 17 24 44 
# > mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == TRUE) ----
#         1         2         3         4 
# 0.8985507 0.4705882 0.2916667 0.8863636 
# > mat %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == TRUE) ----
# [1] 0.6367923



mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == TRUE) ----
mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
# mat %>% {colSums(.)/sum(.)} %>% sum # proportion of (Predicted == TRUE) ----
mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
# > mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == TRUE) ----
#         1         2         3         4 
# 0.8985507 0.4705882 0.2916667 0.8863636 
# > mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
#          1          2          3          4 
# 0.46753247 0.13636364 0.07792208 0.31818182 
# > # mat %>% {colSums(.)/sum(.)} %>% sum # proportion of (Predicted == TRUE) ----
# > mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
#          1          2          3          4 
# 0.42010164 0.06417112 0.02272727 0.28202479 
# > mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
# [1] 0.7890248




# Specificity = TN/(Actual == FALSE) =====
# Specificity = TN/(TN+FP) =====
mat %>% addmargins #----
mat %>% {diag(.)} # True Positive = (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {colSums(.) - diag(.)} # False Positive = (Predicted == TRUE) & (Actual == FALSE) = (Predicted == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {rowSums(.) - diag(.)} # False Negative = (Predicted == FALSE) & (Actual == TRUE) = (Actual == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {sum(.) - diag(.) - (rowSums(.) - diag(.)) - (colSums(.) - diag(.))} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
mat %>% {sum(.) + diag(.) - rowSums(.) - colSums(.)} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
mat %>% {sum(.) - rowSums(.)} # count of (Actual == FALSE) ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
# > mat %>% addmargins #----
#      1  2  3  4 Sum
# 1   62  5  2  0  69
# 2    6  8  2  1  17
# 3    3  5  7  9  24
# 4    1  3  1 39  44
# Sum 72 21 12 49 154
# > mat %>% {diag(.)} # True Positive = (Predicted == TRUE) & (Actual == TRUE) ----
#  1  2  3  4 
# 62  8  7 39 
# > mat %>% {colSums(.) - diag(.)} # False Positive = (Predicted == TRUE) & (Actual == FALSE) = (Predicted == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
#  1  2  3  4 
# 10 13  5 10 
# > mat %>% {rowSums(.) - diag(.)} # False Negative = (Predicted == FALSE) & (Actual == TRUE) = (Actual == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
#  1  2  3  4 
#  7  9 17  5 
# > mat %>% {sum(.) - diag(.) - (rowSums(.) - diag(.)) - (colSums(.) - diag(.))} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
#   1   2   3   4 
#  75 124 125 100 
# > mat %>% {sum(.) + diag(.) - rowSums(.) - colSums(.)} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
#   1   2   3   4 
#  75 124 125 100 
# > mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
#  1  2  3  4 
# 69 17 24 44 
# > mat %>% {sum(.) - rowSums(.)} # count of (Actual == FALSE) ----
#   1   2   3   4 
#  85 137 130 110 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
#         1         2         3         4 
# 0.8823529 0.9051095 0.9615385 0.9090909 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
# [1] 0.914523



mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
#         1         2         3         4 
# 0.8823529 0.9051095 0.9615385 0.9090909 
# > mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
#          1          2          3          4 
# 0.46753247 0.13636364 0.07792208 0.31818182 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
#          1          2          3          4 
# 0.41252865 0.12342402 0.07492507 0.28925620 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# [1] 0.9001339

#@ =====
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {sum(diag(.))/sum(.)} # Simple Accuracy ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == T) ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {sum(diag(.))/sum(.)} # Simple Accuracy ----
# [1] 0.7532468
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == T) ----
# [1] 0.6367923
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
# [1] 0.914523
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
# [1] 0.7890248
# Warning message:
# Setting row names on a tibble is deprecated. 
# > InputSquareMatrix.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# [1] 0.9001339
# Warning message:
# Setting row names on a tibble is deprecated. 







#@ =====
mat = InputSquareMatrix1.tbl %>% map_df(replace_na, 0) %>% column_to_rownames("Actual") %>% as.matrix
mat %>% dput
# > mat %>% dput
mat = structure(c(62, 6, 3, 1, 5, 8, 5, 3, 2, 2, 7, 1, 0, 1, 9, 39), .Dim = c(4L,
4L), .Dimnames = list(c("1", "2", "3", "4"), c("1", "2", "3",
"4")))
mat
# > mat
#    1 2 3  4
# 1 62 5 2  0
# 2  6 8 2  1
# 3  3 5 7  9
# 4  1 3 1 39


mat %>% {sum(.)} #----
mat %>% {sum(diag(.))} #----
mat %>% {sum(diag(.))/sum(.)} #----
# > mat %>% {sum(.)} #----
# [1] 154
# > mat %>% {sum(diag(.))} #----
# [1] 116
# > mat %>% {sum(diag(.))/sum(.)} #----
# [1] 0.7532468


# Sensitivity = TP/(Actual == TRUE) =====
# Sensitivity = TP/(TP+FN) =====
mat %>% addmargins #----
mat %>% {diag(.)} # True Positive = (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == T) ----
mat %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == T) ----
# > mat %>% addmargins #----
#      1  2  3  4 Sum
# 1   62  5  2  0  69
# 2    6  8  2  1  17
# 3    3  5  7  9  24
# 4    1  3  1 39  44
# Sum 72 21 12 49 154
# > mat %>% {diag(.)} # TP ----
#  1  2  3  4 
# 62  8  7 39 
# > mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
#  1  2  3  4 
# 69 17 24 44 
# > mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == TRUE) ----
#         1         2         3         4 
# 0.8985507 0.4705882 0.2916667 0.8863636 
# > mat %>% {diag(.)/rowSums(.)} %>% mean # simple mean of Sensitivity = TP/(Actual == TRUE) ----
# [1] 0.6367923



mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == TRUE) ----
mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
# mat %>% {colSums(.)/sum(.)} %>% sum # proportion of (Predicted == TRUE) ----
mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
# > mat %>% {diag(.)/rowSums(.)} # Sensitivity = TP/(Actual == TRUE) ----
#         1         2         3         4 
# 0.8985507 0.4705882 0.2916667 0.8863636 
# > mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
#          1          2          3          4 
# 0.46753247 0.13636364 0.07792208 0.31818182 
# > # mat %>% {colSums(.)/sum(.)} %>% sum # proportion of (Predicted == TRUE) ----
# > mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
#          1          2          3          4 
# 0.42010164 0.06417112 0.02272727 0.28202479 
# > mat %>% {diag(.)/rowSums(.) * colSums(.)/sum(.)} %>% sum # weighted mean of Sensitivity = TP/(Actual == TRUE), weighted by proportion of Predicted lables ----
# [1] 0.7890248




# Specificity = TN/(Actual == FALSE) =====
# Specificity = TN/(TN+FP) =====
mat %>% addmargins #----
mat %>% {diag(.)} # True Positive = (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {colSums(.) - diag(.)} # False Positive = (Predicted == TRUE) & (Actual == FALSE) = (Predicted == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {rowSums(.) - diag(.)} # False Negative = (Predicted == FALSE) & (Actual == TRUE) = (Actual == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
mat %>% {sum(.) - diag(.) - (rowSums(.) - diag(.)) - (colSums(.) - diag(.))} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
mat %>% {sum(.) + diag(.) - rowSums(.) - colSums(.)} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
mat %>% {sum(.) - rowSums(.)} # count of (Actual == FALSE) ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
# > mat %>% addmargins #----
#      1  2  3  4 Sum
# 1   62  5  2  0  69
# 2    6  8  2  1  17
# 3    3  5  7  9  24
# 4    1  3  1 39  44
# Sum 72 21 12 49 154
# > mat %>% {diag(.)} # True Positive = (Predicted == TRUE) & (Actual == TRUE) ----
#  1  2  3  4 
# 62  8  7 39 
# > mat %>% {colSums(.) - diag(.)} # False Positive = (Predicted == TRUE) & (Actual == FALSE) = (Predicted == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
#  1  2  3  4 
# 10 13  5 10 
# > mat %>% {rowSums(.) - diag(.)} # False Negative = (Predicted == FALSE) & (Actual == TRUE) = (Actual == TRUE) - (Predicted == TRUE) & (Actual == TRUE) ----
#  1  2  3  4 
#  7  9 17  5 
# > mat %>% {sum(.) - diag(.) - (rowSums(.) - diag(.)) - (colSums(.) - diag(.))} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
#   1   2   3   4 
#  75 124 125 100 
# > mat %>% {sum(.) + diag(.) - rowSums(.) - colSums(.)} # True Negative = (Predicted == FALSE) & (Actual == FALSE) ----
#   1   2   3   4 
#  75 124 125 100 
# > mat %>% {rowSums(.)} # count of (Actual == TRUE) ----
#  1  2  3  4 
# 69 17 24 44 
# > mat %>% {sum(.) - rowSums(.)} # count of (Actual == FALSE) ----
#   1   2   3   4 
#  85 137 130 110 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
#         1         2         3         4 
# 0.8823529 0.9051095 0.9615385 0.9090909 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} %>% mean # simple mean of Specificity = TN/(Actual == FALSE) ----
# [1] 0.914523



mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.))} # Specificity = TN/(Actual == FALSE) ----
#         1         2         3         4 
# 0.8823529 0.9051095 0.9615385 0.9090909 
# > mat %>% {colSums(.)/sum(.)} # proportion of (Predicted == TRUE) ----
#          1          2          3          4 
# 0.46753247 0.13636364 0.07792208 0.31818182 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
#          1          2          3          4 
# 0.41252865 0.12342402 0.07492507 0.28925620 
# > mat %>% {(sum(.) + diag(.) - rowSums(.) - colSums(.)) / (sum(.) - rowSums(.)) * colSums(.)/sum(.)} %>% sum # weighted mean of Specificity = TN/(Actual == FALSE), weighted by proportion of Predicted lables ----
# [1] 0.9001339



#@ REFERENCES =====


# https://en.wikipedia.org/wiki/Receiver_operating_characteristic
# The extension of ROC curves for classification problems with more than two classes has always been cumbersome, as the degrees of freedom increase quadratically with the number of classes, and the ROC space has c(c-1) dimensions, where c is the number of classes.[45] Some approaches have been made for the particular case with three classes (three-way ROC).[46] The calculation of the volume under the ROC surface (VUS) has been analyzed and studied as a performance metric for multi-class problems.[47] However, because of the complexity of approximating the true VUS, some other approaches [48] based on an extension of AUC are more popular as an evaluation metric.
# 45. Srinivasan, A. (1999). "Note on the Location of Optimal Classifiers in N-dimensional ROC Space". Technical Report PRG-TR-2-99, Oxford University Computing Laboratory, Wolfson Building, Parks Road, Oxford.
# 46. Mossman, D. (1999). "Three-way ROCs". Medical Decision Making. 19 (1): 78–89. doi:10.1177/0272989x9901900110. PMID 9917023.
# 47. Ferri, C.; Hernandez-Orallo, J.; Salido, M.A. (2003). "Volume under the ROC Surface for Multi-class Problems". Machine Learning: ECML 2003. pp. 108–120.
# 48. Till, D.J.; Hand, R.J. (2001). "A Simple Generalisation of the Area Under the ROC Curve for Multiple Class Classification Problems". Machine Learning. 45 (2): 171–186. doi:10.1023/A:1010920819831.


# https://stats.stackexchange.com/questions/21551/how-to-compute-precision-recall-for-multiclass-multilabel-classification
# https://github.com/fcharte/mldr/blob/master/R/evaluate.R
# https://github.com/fcharte/mldr/blob/master/R/evmetrics_av.R
# Macro averaged 1/q ∑_{j=1}^{q} B(TPj,FPj,TNj,FNj)
# Micro averaged B(∑_{j=1}^{q} TPj, ∑_{j=1}^{q} FPj, ∑_{j=1}^{q} TNj, ∑_{j=1}^{q} FNj)

# https://www.rdocumentation.org/packages/pROC/versions/1.13.0/topics/multiclass.roc



# Fawcett T. An introduction to ROC analysis. Pattern recognition letters. 2006 Jun 1;27(8):861-74.
# https://www.math.ucdavis.edu/~saito/data/roc/fawcett-roc.pdf

# 9.2. Multi-class AUC
# One approach to calculating multi-class AUCs was
# taken by Provost and Domingos (2001) in their work on
# probability estimation trees. They calculated AUCs for
# multi-class problems by generating each class reference
# ROC curve in turn, measuring the area under the curve,
# then summing the AUCs weighted by the reference class's
# prevalence in the data.
# More precisely, they define
# AUCtotal = ∑_{ci ∈ C} AUC(ci) * p(ci)
# where AUC(ci) is the area under the class reference ROC
# curve for ci, as in Eq. (3). This definition requires only jCj
# AUC calculations, so its overall complexity is O(jCjnlogn).
# The advantage of Provost and Domingos's AUC formulation
# is that AUCtotal is generated directly from class reference
# ROC curves, and these curves can be generated and
# visualized easily. The disadvantage is that the class reference
# ROC is sensitive to class distributions and error costs,
# so this formulation of AUCtotal is as well.

# Hand and Till (2001) take a different approach in their
# derivation of a multi-class generalization of the AUC. They
# desired a measure that is insensitive to class distribution
# and error costs. The derivation is too detailed to summarize
# here, but it is based upon the fact that the AUC is
# equivalent to the probability that the classifier will rank a
# randomly chosen positive instance higher than a randomly
# chosen negative instance. From this probabilistic form,
# they derive a formulation that measures the unweighted
# pairwise discriminability of classes. Their measure, which
# they call M, is equivalent to:
# AUCtotal = 1/{|C|(|C|-1)} ∑_{{ci,cj} ∈ C} AUC(ci,cj)
# where n is the number of classes and AUC(ci, cj) is the area
# under the two-class ROC curve involving classes ci and cj.
# The summation is calculated over all pairs of distinct
# classes, irrespective of order. There are |C|(|C|-1)/2
# such pairs, so the time complexity of their measure is
# O(|C|^2 n log n). While Hand and Till's formulation is well
# justified and is insensitive to changes in class distribution,
# there is no easy way to visualize the surface whose area is
# being calculated.












#@ TO DO LIST =====
# InputMatrix.tbl = InputMatrix %>% as.data.frame %>% rownames_to_column("Actual")
# 
# ConfusionMatriActual; ConfusionMatrix4
# 
# function(TN, FN, FP, TP) {out = list(); out$TN = TN; out$Sensitivity = Sensitivity; out %>% as_tibble(); out %>% unlist() }
# 
# $Metrics
# rowname_equation %>% left_join(Metrics)
#
# Micro average
# weighted average, weighted by (predicted) proportion of each class
# 
# |C|(|C|-1)/2 pairs



#@ end ----
# saveRDS(InputSquareMatrix.tbl.ConfusionMatrix.Metrics, file = "InputSquareMatrix.tbl.ConfusionMatrix.Metrics.rds")
# openxlsx::write.xlsx(InputSquareMatrix.tbl.ConfusionMatrix.Metrics, "InputSquareMatrix.tbl.ConfusionMatrix.Metrics.xlsx", asTable=TRUE)


