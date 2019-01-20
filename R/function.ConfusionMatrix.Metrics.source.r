# function.ConfusionMatrix.Metrics.source.r

library(tidyverse)
# InputMatrix <- read_delim("InputMatrix.csv", "\t", escape_double = FALSE, trim_ws = TRUE)

InputMatrix = 
    structure(list(
        X1 = c("1a", "1b", "2a", "2b", "3a", "3b", "4")
        , `1` = c(45, 17, 3, 3, 3, 0, 1)
        , `2` = c(2, 3, 6, 2, 5, 0, 3)
        , `3` = c(1, 1, 1, 1, 7, 0, 1)
        , `4` = c(0, 0, 0, 1, 4, 5, 39)
    ), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA,-7L))


function.ConfusionMatrix.Metrics = function(InputMatrix) {
    out = list()
    out$InputMatrix = InputMatrix
    out$InputMatrix.gather.mutate = InputMatrix %>% gather(key = "X2", value = "value", -X1) %>% mutate(
        X1is1 = X1 %>% str_detect("^1")
        , X2is1 = X2 == 1
        , X1is2 = X1 %>% str_detect("^2")
        , X2is2 = X2 == 2
        , X1is3 = X1 %>% str_detect("^3")
        , X2is3 = X2 == 3
        , X1is4 = X1 %>% str_detect("^4")
        , X2is4 = X2 == 4
    )
    # out$is1.ConfusionLongFormat = InputMatrix.gather.mutate %>% mutate(Predicted = X1is1, Actual = X2is1) %>% 
    # group_by(Predicted, Actual) %>% summarise(value = sum(value)) %>% 
    # mutate(binary = Predicted * 10 + Actual, 
    #        label = binary %>% recode(
    #            `0` = "TN"
    #            , `1` = "FN"
    #            , `10` = "FP"
    #            , `11` = "TP"
    #        )
    # ) %>% select(-value, everything())
	for (i in 1:4) {
		out[[paste0("ConfusionLongFormat", i)]] = 
			out$InputMatrix.gather.mutate %>% mutate(
				Predicted = !!rlang::sym(paste0("X1is", i))
				, Actual = !!rlang::sym(paste0("X2is", i))
			) %>% group_by(Predicted, Actual) %>% summarise(value = sum(value)) %>%
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
	out$Metrics = 1:4 %>% map(function(i) {
		# label_value = InputMatrix.gather.mutate %>% mutate(
		# 	Predicted = !!rlang::sym(paste0("X1is", i))
		# 	, Actual = !!rlang::sym(paste0("X2is", i))
		# ) %>% group_by(Predicted, Actual) %>% summarise(value = sum(value)) %>% 
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
		label_value$varname4Predicted = paste0("X1is", i)
		label_value$varname4Actual = paste0("X2is", i)
		# label_value = label_value %>% select(matches("^varname"), everything())
		label_value = label_value %>% select(matches("^varname"), TN, FN, FP, TP)
		TN = label_value$TN
		FN = label_value$FN
		FP = label_value$FP
		TP = label_value$TP
		Sensitivity = TP/(TP+FN)
		# Specificity = TN/(TN+FP)
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
		# ?chisq.test
		# label_value$Chi_squared = 		
		# label_value$p_chi_squared = 		
		# label_value$p_phi = 		
		# label_value$R_squared = 		
		label_value
	}) %>% bind_rows %>% rownames_to_column
	
	out$Metrics = out$Metrics %>% column_to_rownames %>% t %>% as.data.frame %>% rownames_to_column %>% 
	    add_column(equation = 	"", .after = "rowname")
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
	    ) 
	out
}


InputMatrix.ConfusionMatrix.Metrics = function.ConfusionMatrix.Metrics(InputMatrix)
InputMatrix.ConfusionMatrix.Metrics
# > InputMatrix.ConfusionMatrix.Metrics
# $`InputMatrix`
# # A tibble: 7 x 5
#   X1    `1` `2` `3` `4`
#   <chr>     <dbl>     <dbl>     <dbl>     <dbl>
# 1 1a           45         2         1         0
# 2 1b           17         3         1         0
# 3 2a            3         6         1         0
# 4 2b            3         2         1         1
# 5 3a            3         5         7         4
# 6 3b            0         0         0         5
# 7 4             1         3         1        39
# 
# $InputMatrix.gather.mutate
# # A tibble: 28 x 11
#    X1    X2    value X1is1 X2is1 X1is2 X2is2 X1is3 X2is3 X1is4 X2is4
#    <chr> <chr> <dbl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl>
#  1 1a    1        45 TRUE  TRUE  FALSE FALSE FALSE FALSE FALSE FALSE
#  2 1b    1        17 TRUE  TRUE  FALSE FALSE FALSE FALSE FALSE FALSE
#  3 2a    1         3 FALSE TRUE  TRUE  FALSE FALSE FALSE FALSE FALSE
#  4 2b    1         3 FALSE TRUE  TRUE  FALSE FALSE FALSE FALSE FALSE
#  5 3a    1         3 FALSE TRUE  FALSE FALSE TRUE  FALSE FALSE FALSE
#  6 3b    1         0 FALSE TRUE  FALSE FALSE TRUE  FALSE FALSE FALSE
#  7 4     1         1 FALSE TRUE  FALSE FALSE FALSE FALSE TRUE  FALSE
#  8 1a    2         2 TRUE  FALSE FALSE TRUE  FALSE FALSE FALSE FALSE
#  9 1b    2         3 TRUE  FALSE FALSE TRUE  FALSE FALSE FALSE FALSE
# 10 2a    2         6 FALSE FALSE TRUE  TRUE  FALSE FALSE FALSE FALSE
# # ... with 18 more rows
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
# 
# $Metrics
#              rowname                                                                  equation          1          2          3          4
# 1  varname4Predicted                                                                      <NA>      X1is1      X1is2      X1is3      X1is4
# 2     varname4Actual                                                                      <NA>      X2is1      X2is2      X2is3      X2is4
# 3                 TN                  True Negative = (Predicted == FALSE) & (Actual == FALSE)         75        124        125        100
# 4                 FN                  False Negative = (Predicted == FALSE) & (Actual == TRUE)         10         13          5         10
# 5                 FP                  False Positive = (Predicted == TRUE) & (Actual == FALSE)          7          9         17          5
# 6                 TP                    True Positive = (Predicted == TRUE) & (Actual == TRUE)         62          8          7         39
# 7        Sensitivity                                                  Sensitivity = TP/(TP+FN)  0.8611111  0.3809524  0.5833333  0.7959184
# 8        Specificity                                                  Specificity = TN/(TN+FP)  0.9146341  0.9323308  0.8802817  0.9523810
# 9                PPV                                                          PPV = TP/(TP+FP)  0.8985507  0.4705882  0.2916667  0.8863636
# 10               NPV                                                          NPV = TN/(TN+FN)  0.8823529  0.9051095  0.9615385  0.9090909
# 11           F1score                                         F1score = 2/(1/Sensitivity+1/PPV)  0.8794326  0.4210526  0.3888889  0.8387097
# 12           F2score                                 F2score = (2^2+1)/(2^2/Sensitivity+1/PPV)  0.8683473  0.3960396  0.4861111  0.8125000
# 13          F.5score                              F.5score = (.5^2+1)/(.5^2/Sensitivity+1/PPV)  0.8908046  0.4494382  0.3240741  0.8666667
# 14                OR                                                    OR = TN * TP / FN / FP  66.428571   8.478632  10.294118  78.000000
# 15               LRp                                             LRp = TP/(TP+FN) / FP*(FP+TN)  10.087302   5.629630   4.872549  16.714286
# 16               LRn                                             LRn = FN/(TP+FN) / TN*(FP+TN)  0.1518519  0.6639785  0.4733333  0.2142857
# 17               phi             phi = (TP*TN - FN*FP) / {(FN+TP)*(TN+FP)*(TN+FN)*(FP+TP)} ^.5  0.7783202  0.3430740  0.3426218  0.7715167
# 18   SimpleAgreement                                   SimpleAgreement = (TN+TP)/(TN+FN+FP+TP)  0.8896104  0.8571429  0.8571429  0.9025974
# 19   ChanceAgreement               ChanceAgreement = (TN_expected + TN_expected)/(TN+FN+FP+TP) 0.01048091 0.01095924 0.01099253 0.01124417
# 20       Cohen_kappa Cohen_kappa = (SimpleAgreement - ChanceAgreement) / (1 - ChanceAgreement)  0.8884412  0.8555599  0.8555550  0.9014897



#@ end ----
# saveRDS(InputMatrix.ConfusionMatrix.Metrics, file = "InputMatrix.ConfusionMatrix.Metrics.rds")
# openxlsx::write.xlsx(InputMatrix.ConfusionMatrix.Metrics, "InputMatrix.ConfusionMatrix.Metrics.xlsx", asTable = T)
