# function.ConfusionMatrix.Metrics.bootstrapCI.source.r
# function.ConfusionMatrix.Metrics.source.r

library(tidyverse)
# InputSquareMatrix.tbl <- read_delim("InputSquareMatrix.tbl.csv", "\t", escape_double = FALSE, trim_ws = TRUE)
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
        as.tibble
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
# mat.ConfusionMatrix.Metrics = function.ConfusionMatrix.Metrics(as.tibble(mat))

InputSquareMatrix1.tbl.ConfusionMatrix.Metrics = function.ConfusionMatrix.Metrics(InputSquareMatrix1.tbl)
InputSquareMatrix1.tbl.ConfusionMatrix.Metrics
# > InputSquareMatrix1.tbl.ConfusionMatrix.Metrics = function.ConfusionMatrix.Metrics(InputSquareMatrix1.tbl)
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) : NAs introduced by coercion
# 3: In .f(.x[[i]], ...) : NAs introduced by coercion
# 4: In .f(.x[[i]], ...) : NAs introduced by coercion
# > InputSquareMatrix1.tbl.ConfusionMatrix.Metrics
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



#@ list_bootstrap.InputSquareMatrix1.tbl =====
df_Actual_Predicted = InputSquareMatrix1.tbl %>% 
    gather(-Actual, key = "Predicted", value = "value") %>% 
    {slice(., unlist( map2(1:nrow(.), .$value, function(x, y) rep(x, y)) ) )} %>% select(Actual, Predicted)
df_Actual_Predicted


set.seed(1); list_bootstrap.InputSquareMatrix1.tbl = 1:1000 %>% map(function(i) {
    out = df_Actual_Predicted[sample(nrow(df_Actual_Predicted), replace = T), ] %>% 
        group_by(Actual, Predicted) %>% summarize(value = n()) %>% spread(key = "Predicted", value = "value") %>% 
        map_df(replace_na, 0) %>% ungroup
}) 
list_bootstrap.InputSquareMatrix1.tbl %>% str #----
# > list_bootstrap.InputSquareMatrix1.tbl %>% str #----
# List of 1000
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..$ Actual: chr [1:4] "1" "2" "3" "4"
#   ..$ 1     : num [1:4] 56 6 6 0
#   ..$ 2     : num [1:4] 10 5 5 5
#   ..$ 3     : num [1:4] 2 1 11 0
#   ..$ 4     : num [1:4] 0 2 10 35
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..$ Actual: chr [1:4] "1" "2" "3" "4"
#   ..$ 1     : num [1:4] 73 5 3 1
#   ..$ 2     : num [1:4] 5 11 3 2
#   ..$ 3     : num [1:4] 1 1 5 1
#   ..$ 4     : num [1:4] 0 0 8 35
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..$ Actual: chr [1:4] "1" "2" "3" "4"
#   ..$ 1     : num [1:4] 63 8 2 1
#   ..$ 2     : num [1:4] 9 5 4 2
#   ..$ 3     : num [1:4] 1 1 6 1
#   ..$ 4     : num [1:4] 0 0 8 43






#@ list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics ====
t0 = Sys.time()
list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics =
    list_bootstrap.InputSquareMatrix1.tbl %>% map(function.ConfusionMatrix.Metrics)
attributes(list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics)$InputSquareMatrix.tbl = InputSquareMatrix1.tbl
attributes(list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics)$InputSquareMatrix.tbl.ConfusionMatrix.Metrics = InputSquareMatrix1.tbl %>% function.ConfusionMatrix.Metrics
Sys.time() - t0
# > t0 = Sys.time()
# > list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics =
# +     list_bootstrap.InputSquareMatrix1.tbl %>% map(function.ConfusionMatrix.Metrics)
# There were 50 or more warnings (use warnings() to see the first 50)
# > attributes(list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics)$InputSquareMatrix.tbl = InputSquareMatrix1.tbl
# > attributes(list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics)$InputSquareMatrix.tbl.ConfusionMatrix.Metrics = InputSquareMatrix1.tbl %>% function.ConfusionMatrix.Metrics
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .Primitive("as.double")(x, ...) : NAs introduced by coercion
# 3: In .Primitive("as.double")(x, ...) : NAs introduced by coercion
# 4: In .Primitive("as.double")(x, ...) : NAs introduced by coercion
# > Sys.time() - t0
# Time difference of 31.64239 secs




list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics %>% str(max.level = 1) #----
list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]] %>% str(max.level = 1) #----
list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]]$Metrics %>% str(max.level = 1) #----
list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]]$Metrics %>% column_to_rownames %>% select(V1, V2, V3, V4, MacroAverage) %>% as.matrix %>% str #-----
list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]]$Metrics %>% column_to_rownames %>% select(V1, V2, V3, V4, MacroAverage) %>% as.matrix #-----
# > list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics %>% str(max.level = 1) #----
# List of 1000
#  $ :List of 6
#  $ :List of 6
#  $ :List of 6
#  $ :List of 6
#   [list output truncated]
#  - attr(*, "InputSquareMatrix.tbl")=Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#  - attr(*, "InputSquareMatrix.tbl.ConfusionMatrix.Metrics")=List of 6
# > list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]] %>% str(max.level = 1) #----
# List of 6
#  $ InputSquareMatrix.tbl:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#  $ ConfusionLongFormat1 :Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..- attr(*, "groups")=Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  2 variables:
#   .. ..- attr(*, ".drop")= logi TRUE
#  $ ConfusionLongFormat2 :Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..- attr(*, "groups")=Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  2 variables:
#   .. ..- attr(*, ".drop")= logi TRUE
#  $ ConfusionLongFormat3 :Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..- attr(*, "groups")=Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  2 variables:
#   .. ..- attr(*, ".drop")= logi TRUE
#  $ ConfusionLongFormat4 :Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	4 obs. of  5 variables:
#   ..- attr(*, "groups")=Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  2 variables:
#   .. ..- attr(*, ".drop")= logi TRUE
#  $ Metrics              :'data.frame':	21 obs. of  7 variables:
# > list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]]$Metrics %>% str(max.level = 1) #----
# 'data.frame':	21 obs. of  7 variables:
#  $ rowname     : chr  "varname4Actual" "varname4Predicted" "TN" "FN" ...
#  $ equation    : chr  NA NA "True Negative = (Predicted == FALSE) & (Actual == FALSE)" "False Negative = (Predicted == FALSE) & (Actual == TRUE)" ...
#  $ V1          : Factor w/ 15 levels " 5.901961"," 74",..: 14 15 2 11 11 13 6 10 6 10 ...
#   ..- attr(*, "names")= chr  "varname4Actual" "varname4Predicted" "TN" "FN" ...
#  $ V2          : Factor w/ 21 levels " 2.500000"," 3.333333",..: 20 21 18 4 19 3 11 16 7 17 ...
#   ..- attr(*, "names")= chr  "varname4Actual" "varname4Predicted" "TN" "FN" ...
#  $ V3          : Factor w/ 21 levels " 3","0.010767511",..: 20 21 16 19 1 15 3 14 10 13 ...
#   ..- attr(*, "names")= chr  "varname4Actual" "varname4Predicted" "TN" "FN" ...
#  $ V4          : Factor w/ 21 levels " 5"," 8.312500",..: 20 21 16 1 17 18 10 14 6 15 ...
#   ..- attr(*, "names")= chr  "varname4Actual" "varname4Predicted" "TN" "FN" ...
#  $ MacroAverage: num  NA NA 103.8 11.8 11.8 ...
# > list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]]$Metrics %>% column_to_rownames %>% select(V1, V2, V3, V4, MacroAverage) %>% as.matrix %>% str #-----
#  chr [1:21, 1:5] "Actual_1" "Predicted_1" " 74" "12" "12" "56" "0.8235294" "0.8604651" "0.8235294" "0.8604651" "0.8235294" ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:21] "varname4Actual" "varname4Predicted" "TN" "FN" ...
#   ..$ : chr [1:5] "V1" "V2" "V3" "V4" ...
# > list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics[[1]]$Metrics %>% column_to_rownames %>% select(V1, V2, V3, V4, MacroAverage) %>% as.matrix #-----
#                   V1            V2            V3            V4            MacroAverage  
# varname4Actual    "Actual_1"    "Actual_2"    "Actual_3"    "Actual_4"    NA            
# varname4Predicted "Predicted_1" "Predicted_2" "Predicted_3" "Predicted_4" NA            
# TN                " 74"         "120"         "119"         "102"         "103.75000000"
# FN                "12"          " 9"          "21"          " 5"          " 11.75000000"
# FP                "12"          "20"          " 3"          "12"          " 11.75000000"
# TP                "56"          " 5"          "11"          "35"          " 26.75000000"
# Sensitivity       "0.8235294"   "0.3571429"   "0.3437500"   "0.8750000"   "  0.59985557"
# Specificity       "0.8604651"   "0.8571429"   "0.9754098"   "0.8947368"   "  0.89693865"
# PPV               "0.8235294"   "0.2000000"   "0.7857143"   "0.7446809"   "  0.63848115"
# NPV               "0.8604651"   "0.9302326"   "0.8500000"   "0.9532710"   "  0.89849218"
# F1score           "0.8235294"   "0.2564103"   "0.4782609"   "0.8045977"   "  0.59069957"
# F2score           "0.8235294"   "0.3086420"   "0.3873239"   "0.8454106"   "  0.59122648"
# F.5score          "0.8235294"   "0.2192982"   "0.6250000"   "0.7675439"   "  0.60884288"
# OR                "28.777778"   " 3.333333"   "20.777778"   "59.500000"   " 28.09722225"
# LRp               " 5.901961"   " 2.500000"   "13.979167"   " 8.312500"   "  7.67340700"
# LRn               "0.2050874"   "0.7500000"   "0.6727941"   "0.1397059"   "  0.44189685"
# phi               "0.6839945"   "0.1670538"   "0.4504381"   "0.7329661"   "  0.50861312"
# SimpleAgreement   "0.8441558"   "0.8116883"   "0.8441558"   "0.8896104"   "  0.84740258"
# ChanceAgreement   "0.009615587" "0.010355093" "0.010767511" "0.011076970" "  0.01045379"
# Cohen_kappa       "0.8426428"   "0.8097179"   "0.8424595"   "0.8883739"   "  0.84579852"
# c                 "0.8419973"   "0.6071429"   "0.6595799"   "0.8848684"   "  0.74839712"




#@ InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI =====
InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI = 
    InputSquareMatrix1.tbl.ConfusionMatrix.Metrics
InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI$MetricsCI =
    InputSquareMatrix1.tbl.ConfusionMatrix.Metrics$Metrics
InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI$MetricsCI %>% names %>% dput
# > InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI$MetricsCI %>% names %>% dput
# c("rowname", "equation", "V1", "V2", "V3", "V4", "MacroAverage")
for (i in c("V1", "V2", "V3", "V4", "MacroAverage")) {
    InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI$MetricsCI[[i]] =
        cbind(
            InputSquareMatrix1.tbl.ConfusionMatrix.Metrics$Metrics[[i]] %>% as.character %>% as.numeric
            , list_bootstrap.InputSquareMatrix1.tbl.ConfusionMatrix.Metrics %>% map(function(ls) {
                ls$Metrics
            }) %>% transpose %>% {.[[i]]} %>% {set_names(., 1:length(.))} %>% as.tibble %>% map_df(as.character) %>% map_df(as.numeric) %>% 
                apply(MARGIN = 1, FUN = quantile, probs = c(0.025, 0.975), na.rm = T) %>% t
        ) %>% as.tibble %>% 
        mutate(`estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(V1,2)), " (", sprintf("%.2f",round(`2.5%`,2)), ", ", sprintf("%.2f",round(`97.5%`,2)), ")")) %>% 
        {.$`estimate (95% CI) %.2f`}
}
InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI$MetricsCI #----
# > InputSquareMatrix1.tbl.ConfusionMatrix.Metrics.bootstrapCI$MetricsCI #----
#              rowname                                                                  equation                    V1                      V2                      V3                     V4            MacroAverage
# 1     varname4Actual                                                                      <NA>           NA (NA, NA)             NA (NA, NA)             NA (NA, NA)            NA (NA, NA)             NA (NA, NA)
# 2  varname4Predicted                                                                      <NA>           NA (NA, NA)             NA (NA, NA)             NA (NA, NA)            NA (NA, NA)             NA (NA, NA)
# 3                 TN                  True Negative = (Predicted == FALSE) & (Actual == FALSE)  75.00 (64.00, 86.00) 124.00 (114.00, 133.00) 125.00 (115.00, 134.00) 100.00 (89.00, 111.00) 106.00 (103.00, 108.51)
# 4                 FN                  False Negative = (Predicted == FALSE) & (Actual == TRUE)    7.00 (3.00, 12.00)      9.00 (4.00, 15.02)    17.00 (10.00, 25.00)     5.00 (1.00, 10.00)      9.50 (6.99, 12.50)
# 5                 FP                  False Positive = (Predicted == TRUE) & (Actual == FALSE)   10.00 (4.00, 16.00)     13.00 (7.00, 20.00)      5.00 (1.00, 10.00)    10.00 (5.00, 17.00)      9.50 (6.99, 12.50)
# 6                 TP                    True Positive = (Predicted == TRUE) & (Actual == TRUE)  62.00 (51.00, 73.00)      8.00 (3.00, 14.00)      7.00 (2.00, 12.00)   39.00 (29.00, 49.00)    29.00 (26.00, 31.51)
# 7        Sensitivity                                                  Sensitivity = TP/(TP+FN)     0.90 (0.83, 0.96)       0.47 (0.21, 0.71)       0.29 (0.10, 0.48)      0.89 (0.78, 0.97)       0.64 (0.54, 0.72)
# 8        Specificity                                                  Specificity = TN/(TN+FP)     0.88 (0.81, 0.95)       0.91 (0.85, 0.95)       0.96 (0.93, 0.99)      0.91 (0.85, 0.96)       0.91 (0.89, 0.94)
# 9                PPV                                                          PPV = TP/(TP+FP)     0.86 (0.78, 0.94)       0.38 (0.17, 0.59)       0.58 (0.25, 0.86)      0.80 (0.67, 0.90)       0.66 (0.54, 0.75)
# 10               NPV                                                          NPV = TN/(TN+FN)     0.91 (0.85, 0.97)       0.93 (0.88, 0.97)       0.88 (0.82, 0.93)      0.95 (0.91, 0.99)       0.92 (0.89, 0.94)
# 11           F1score                                         F1score = 2/(1/Sensitivity+1/PPV)     0.88 (0.82, 0.93)       0.42 (0.19, 0.61)       0.39 (0.15, 0.57)      0.84 (0.75, 0.91)       0.63 (0.53, 0.72)
# 12           F2score                                 F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)     0.89 (0.83, 0.94)       0.45 (0.20, 0.65)       0.32 (0.12, 0.51)      0.87 (0.77, 0.94)       0.63 (0.54, 0.72)
# 13          F.5score                              F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)     0.87 (0.79, 0.93)       0.40 (0.17, 0.60)       0.49 (0.22, 0.67)      0.81 (0.70, 0.90)       0.64 (0.54, 0.73)
# 14                OR                                                    OR = TN * TP / FN / FP 66.43 (28.59, 250.27)      8.48 (2.32, 30.75)     10.29 (2.37, 46.64)  78.00 (29.20, 407.18)   40.80 (22.41, 190.19)
# 15               LRp                                             LRp = TP/(TP+FN) / FP*(FP+TN)    7.64 (4.70, 16.98)      4.96 (2.06, 10.80)      7.58 (2.18, 28.38)     9.75 (5.79, 21.67)      7.48 (5.02, 16.04)
# 16               LRn                                             LRn = FN/(TP+FN) / TN*(FP+TN)     0.11 (0.04, 0.20)       0.58 (0.32, 0.88)       0.74 (0.54, 0.94)      0.12 (0.03, 0.24)       0.39 (0.30, 0.50)
# 17               phi             phi = (TP*TN - FN*FP) / {(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5     0.78 (0.68, 0.87)       0.34 (0.10, 0.56)       0.34 (0.09, 0.53)      0.77 (0.65, 0.88)       0.56 (0.44, 0.66)
# 18   SimpleAgreement                                   SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)     0.89 (0.84, 0.94)       0.86 (0.79, 0.91)       0.86 (0.80, 0.91)      0.90 (0.85, 0.95)       0.88 (0.84, 0.91)
# 19   ChanceAgreement               ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP)     0.01 (0.01, 0.01)       0.01 (0.01, 0.01)       0.01 (0.01, 0.01)      0.01 (0.01, 0.01)       0.01 (0.01, 0.01)
# 20       Cohen_kappa Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement)     0.89 (0.84, 0.93)       0.86 (0.79, 0.91)       0.86 (0.80, 0.91)      0.90 (0.85, 0.95)       0.88 (0.84, 0.91)
# 21                 c                                         c = (Sensitivity + Specificity)/2     0.89 (0.84, 0.94)       0.69 (0.55, 0.81)       0.63 (0.53, 0.72)      0.90 (0.84, 0.95)       0.78 (0.72, 0.83)




#@ end ----

