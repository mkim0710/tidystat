function.MatchingPairID_Case_Ctrl_shuffle = function(MatchingPairID_Case_Ctrl, var_MatchingPairID = "MatchingPairID", var_Case = "Case", var_Ctrl = "Ctrl", seed = NULL) {
    library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Case_Ctrl_shuffle.source.r")
    if( !identical(colnames(MatchingPairID_Case_Ctrl), c(var_MatchingPairID, var_Case, var_Ctrl)) ) {
        stop("!identical(colnames(MatchingPairID_Case_Ctrl), c(var_MatchingPairID, var_Case, var_Ctrl))")
    }
    out = MatchingPairID_Case_Ctrl[order(MatchingPairID_Case_Ctrl$MatchingPairID), c(var_MatchingPairID, var_Case, var_Ctrl)]
    
    MatchingPairID_isCase_PERSON_ID = out %>% gather(!!var_Case, !!var_Ctrl, key = "CaseCtrl", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_isCase_PERSON_ID = MatchingPairID_isCase_PERSON_ID[order(MatchingPairID_isCase_PERSON_ID$MatchingPairID), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isCase_PERSON_ID)/2, replace = T)
    index4Case = ( 1 : (nrow(MatchingPairID_isCase_PERSON_ID)/2) ) * 2 - sample.vec
    
    out$Case_shuffle = MatchingPairID_isCase_PERSON_ID$PERSON_ID[index4Case]
    out$Ctrl_shuffle = MatchingPairID_isCase_PERSON_ID$PERSON_ID[-index4Case]
    out

}

# #@ test) function.MatchingPairID_Case_Ctrl_shuffle() ---------
# load(url("https://github.com/mkim0710/tidystat/raw/master/library(CrossScreening) nhanes.fish.match.rda"))
# nhanes.fish.match.rename = nhanes.fish.match[,c("treated", "control")] %>% rownames_to_column %>% as.tibble
# names(nhanes.fish.match.rename) = c("MatchingPairID", "Case", "Ctrl")
# nhanes.fish.match.rename
# # > nhanes.fish.match.rename
# # # A tibble: 234 x 3
# #    MatchingPairID  Case  Ctrl
# #             <chr> <int> <int>
# #  1              1  1003   433
# #  2              2  1045   851
# #  3              3   445   142
# #  4              4   454   783
# #  5              5   460   692
# #  6              6   464    40
# #  7              7   465    92
# #  8              8   473   292
# #  9              9   482   596
# # 10             10   489   309
# # # ... with 224 more rows
# 
# set.seed(1)
# function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# # > function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# # # A tibble: 234 x 5
# #    MatchingPairID  Case  Ctrl Case_shuffle Ctrl_shuffle
# #             <chr> <int> <int>        <int>        <int>
# #  1              1  1003   433          433         1003
# #  2             10   489   309          309          489
# #  3            100   820   785          820          785
# #  4            101   111   166          111          166
# #  5            102   827    45           45          827
# #  6            103   828   281          828          281
# #  7            104   829   661          829          661
# #  8            105    83   900           83          900
# #  9            106   831  1030          831         1030
# # 10            107    84   859          859           84
# # # ... with 224 more rows
# # > function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# # # A tibble: 234 x 5
# #    MatchingPairID  Case  Ctrl Case_shuffle Ctrl_shuffle
# #             <chr> <int> <int>        <int>        <int>
# #  1              1  1003   433          433         1003
# #  2             10   489   309          489          309
# #  3            100   820   785          820          785
# #  4            101   111   166          111          166
# #  5            102   827    45           45          827
# #  6            103   828   281          281          828
# #  7            104   829   661          661          829
# #  8            105    83   900           83          900
# #  9            106   831  1030          831         1030
# # 10            107    84   859          859           84
# # # ... with 224 more rows






function.MatchingPairID_Case_Ctrl_shuffle_vec = function(MatchingPairID_Case_Ctrl, var_MatchingPairID = "MatchingPairID", var_Case = "Case", var_Ctrl = "Ctrl", seed = NULL) {
    library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Case_Ctrl_shuffle.source.r")
    MatchingPairID_isCase_PERSON_ID = 
        MatchingPairID_Case_Ctrl[order(MatchingPairID_Case_Ctrl$MatchingPairID), c(var_MatchingPairID, var_Case, var_Ctrl)] %>% 
        gather(!!var_Case, !!var_Ctrl, key = "CaseCtrl", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_isCase_PERSON_ID = MatchingPairID_isCase_PERSON_ID[order(MatchingPairID_isCase_PERSON_ID$MatchingPairID), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isCase_PERSON_ID)/2, replace = T)
    index4Case = ( 1 : (nrow(MatchingPairID_isCase_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isCase_PERSON_ID$PERSON_ID[index4Case]
    out
}


# #@ test) function.MatchingPairID_Case_Ctrl_shuffle_vec() ---------
# set.seed(1)
# function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% str
# function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% str
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% str
# #  int [1:234] 1003 489 785 111 827 828 661 83 831 859 ...
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% str
# #  int [1:234] 1003 309 820 111 45 281 661 900 831 84 ...
# function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     1.0   300.2   528.5   546.9   821.5  1106.0 
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     1.0   280.2   558.5   545.4   813.0  1106.0 
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     8.0   330.0   591.0   569.0   809.2  1106.0 
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     1.0   266.0   528.0   534.2   815.2  1106.0 
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #    10.0   306.8   552.5   554.1   807.5  1106.0 
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     8.0   331.5   579.5   566.0   825.2  1106.0 
# # > function.MatchingPairID_Case_Ctrl_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     1.0   307.5   562.0   563.5   818.8  1097.0 



function.MatchingPairID_isCase_PERSON_ID_shuffle = function(MatchingPairID_isCase_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    MatchingPairID_isCase_PERSON_ID = MatchingPairID_isCase_PERSON_ID[order(MatchingPairID_isCase_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isCase_PERSON_ID)/2, replace = T)
    index4Case = ( 1 : (nrow(MatchingPairID_isCase_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isCase_PERSON_ID
    out$isCase_shuffle = F
    out$isCase_shuffle[index4Case] = T
    out
}

# #@ test) function.MatchingPairID_isCase_PERSON_ID_shuffle() ---------
# load(url("https://github.com/mkim0710/tidystat/raw/master/library(CrossScreening) nhanes.fish.match.rda"))
# nhanes.fish.match.rename = nhanes.fish.match[,c("treated", "control")] %>% rownames_to_column %>% as.tibble
# names(nhanes.fish.match.rename) = c("MatchingPairID", "Case", "Ctrl")
# nhanes.fish.match.rename
# # > nhanes.fish.match.rename
# # # A tibble: 234 x 3
# #    MatchingPairID  Case  Ctrl
# #             <chr> <int> <int>
# #  1              1  1003   433
# #  2              2  1045   851
# #  3              3   445   142
# #  4              4   454   783
# #  5              5   460   692
# #  6              6   464    40
# #  7              7   465    92
# #  8              8   473   292
# #  9              9   482   596
# # 10             10   489   309
# # # ... with 224 more rows
# 
# library(tidyverse)
# MatchingPairID_isCase_PERSON_ID = nhanes.fish.match.rename %>% gather(Case, Ctrl, key = "CaseCtrl", value = "PERSON_ID") %>% arrange(MatchingPairID)
# MatchingPairID_isCase_PERSON_ID
# # > MatchingPairID_isCase_PERSON_ID
# # # A tibble: 468 x 3
# #    MatchingPairID CaseCtrl PERSON_ID
# #             <chr>    <chr>     <int>
# #  1              1     Case      1003
# #  2              1     Ctrl       433
# #  3             10     Case       489
# #  4             10     Ctrl       309
# #  5            100     Case       820
# #  6            100     Ctrl       785
# #  7            101     Case       111
# #  8            101     Ctrl       166
# #  9            102     Case       827
# # 10            102     Ctrl        45
# # # ... with 458 more rows
# 
# set.seed(1)
# function.MatchingPairID_isCase_PERSON_ID_shuffle(MatchingPairID_isCase_PERSON_ID)
# # > function.MatchingPairID_isCase_PERSON_ID_shuffle(MatchingPairID_isCase_PERSON_ID)
# # # A tibble: 468 x 4
# #    MatchingPairID CaseCtrl PERSON_ID isCase_shuffle
# #             <chr>    <chr>     <int>          <lgl>
# #  1              1     Case      1003          FALSE
# #  2              1     Ctrl       433           TRUE
# #  3             10     Case       489          FALSE
# #  4             10     Ctrl       309           TRUE
# #  5            100     Case       820           TRUE
# #  6            100     Ctrl       785          FALSE
# #  7            101     Case       111           TRUE
# #  8            101     Ctrl       166          FALSE
# #  9            102     Case       827          FALSE
# # 10            102     Ctrl        45           TRUE
# # # ... with 458 more rows
# # > function.MatchingPairID_isCase_PERSON_ID_shuffle(MatchingPairID_isCase_PERSON_ID)
# # # A tibble: 468 x 4
# #    MatchingPairID CaseCtrl PERSON_ID isCase_shuffle
# #             <chr>    <chr>     <int>          <lgl>
# #  1              1     Case      1003          FALSE
# #  2              1     Ctrl       433           TRUE
# #  3             10     Case       489           TRUE
# #  4             10     Ctrl       309          FALSE
# #  5            100     Case       820           TRUE
# #  6            100     Ctrl       785          FALSE
# #  7            101     Case       111           TRUE
# #  8            101     Ctrl       166          FALSE
# #  9            102     Case       827          FALSE
# # 10            102     Ctrl        45           TRUE

function.MatchingPairID_isCase_PERSON_ID_shuffle_vec = function(MatchingPairID_isCase_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    MatchingPairID_isCase_PERSON_ID = MatchingPairID_isCase_PERSON_ID[order(MatchingPairID_isCase_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isCase_PERSON_ID)/2, replace = T)
    index4Case = ( 1 : (nrow(MatchingPairID_isCase_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isCase_PERSON_ID[[var_PERSON_ID]][index4Case]
    out
}

# #@ test) function.MatchingPairID_isCase_PERSON_ID_shuffle_vec() --------
# set.seed(1)
# function.MatchingPairID_isCase_PERSON_ID_shuffle_vec(MatchingPairID_isCase_PERSON_ID)
# # > function.MatchingPairID_isCase_PERSON_ID_shuffle_vec(MatchingPairID_isCase_PERSON_ID)
# #   [1]  433  309  820  111   45  828  829   83  831  859  777 1096   49  538  852  705  113  858  455  872  875  728  879  868  110  985   55  527  116  355  593  903  677  390
# #  [35] 1052  909  919 1037  926   75  120  939  940  941  943  498  733    1  956  958  435  961  422  140 1009  651  722  989  997  133   14  758 1066  887   16  327  171  509
# #  [69]  640  191   80  193  639  983  836  215  224 1106  511  228  830  230  127   58  243 1034  245  695  552  441  379  927  257  261  265   27 1026  808  274  278   52  801
# # [103]  819   29   30 1054  325  254  331  336  337 1045   39  806  626   67  343  796  558  348   35  642  429  241  369  463  378  840 1097  398  400  794   50  404  531  408
# # [137]  412  413  416 1032  417  419  832  399  430  185  694  436  449   44  443 1061  154 1020  553  297  564  142  945  772  610  572  839 1062  586  214  326  686  454  280
# # [171]  606  607  608  304  161 1078  612  615  616  460   79 1075  624  625  634  708  641 1083  649  650  464  710  530  663  800  684  386  693  629 1089   20   92  703  963
# # [205] 1019   72  723  854  269  736   74  655  473  741  744  518  750  751  754 1074  585  370  683  482 1101  784  743   63  818    8  312  620  129  817
# # > function.MatchingPairID_isCase_PERSON_ID_shuffle_vec(MatchingPairID_isCase_PERSON_ID)
# #   [1]  433  489  820  111   45  281  661   83  831  859  777 1096  547  538  484 1006  113  858  455  872  503  728  714  868  110  885  886  527  180  895  898   22  677  907
# #  [35] 1052  841  971 1037 1055   75  485  653  917  559  565  498  733  954  956  990  435 1058  422  140 1009  651  722  524  997  133   14  147 1066  887  870 1010  165  301
# #  [69]  640  320   80  193  639  198  836  150  481 1106  511  228  830  432  127   58  243  244  245  695  552  514 1017  255  257  261  213   27  271  808  253  278  177  801
# # [103]  819  366   30  306  314  254  331  541  337  851   39  806  626 1027  151  796  346  104   35  642  368  241  369  463 1048  840  385  457  400  402   50  404  531  532
# # [137]  931  413  416  376  377  863  832  426  284  185  694  436  439   44  814  333  542  546  602  560  372  142  568   57  610  483  574 1065  911  214  598  686  454  601
# # [171]  606  607  251  609  161 1078  612  584  616  460  619 1075 1087  973  634  637  556 1083  649  250   40  710  530  663  665  684  689  555  629 1089   20  465  703  963
# # [205] 1019   72  300  854  732  736  156  655  292  741 1050  518  750  718  491 1074  585  774  782  482 1101  344  743   63  818  354  312  807  810  580
# # > function.MatchingPairID_isCase_PERSON_ID_shuffle_vec(MatchingPairID_isCase_PERSON_ID)
# #   [1]  433  489  785  111  827  281  661  900  831  859  777  847   49  538  852 1006  113  858  455  145  875  728  714  490  110  985   55  527  180  895  898   22  904  907
# #  [35] 1052  909  971  921 1055  935  120  939  940  559  565  498  952    1  956  958  435  961  123  968 1009  651  722  989  997  134   14  147  155  887  870  327  171  301
# #  [69]  640  320   80  193  639  198  208  150  481 1106  511  293   23  230  236  237 1092  244  245  695  552  441 1017  255  257  383  213   27  271  273  253  278  177   28
# # [103]  819  366 1018 1054  314  324  331  541  337 1045   39  340  341   67  343  796  558  348   35  353  368  241  369  374  378  103 1097  457 1035  794  403  404  351  408
# # [137]  412  413  822  376  417  863  425  399  430  533  431  638  449  567  443  333  542 1020  553  297  372  445  945   57  610  572  574 1065  911  589  326  686  783  280
# # [171]  606  607  608  304  611  371  612  584  132  460  619   62  624  625  727  708  641  446  882  650  464  656  530  663  800  684  386  693  697  361   20  465  703  717
# # [205]  719   72  723  854  269  579  156  655  473  741 1050  749  750  751  491 1074  585  774  683  482 1101  784  743  797  798  354  805  620  810  817
# # > function.MatchingPairID_isCase_PERSON_ID_shuffle_vec(MatchingPairID_isCase_PERSON_ID)
# #   [1] 1003  489  820  166   45  828  829   83  831  859  777  847  547  538  484  705   37  858  455  872  875  877  714  490  110  885   55  527  116  895  898   22  904  390
# #  [35]  115  909  971 1037 1055  935  120  653  917  559  565  498  733  954   60  958  959 1058  422  140 1009  651  505  524  997  133   14  758 1066  887   16 1010  165  509
# #  [69]  640  191   80  193  197  983  836  215  481 1016  511  228   23  432  236   58  243 1034  781  695  552  441 1017  927  257  261  213   27  271  808  274  614   52   28
# # [103]  819   29 1018  306  325  254  328  541  479 1045   39  340  341 1027  151  345  558  348   35  353  368  241  726  463 1048  103  385  398  400  402   50  404  351  408
# # [137]  412  413  416  376  377  863  832  399  284  533  431  638  439   44  814 1061  154 1020  602  560  372  142  945  772  570  483  839 1065  911  589  598  686  783  601
# # [171]  606  512  251  304  161  371  612  615  132  460  619   62 1087  625  634  637  641  446  882  250   40  710  530  181  665  988  386  555  697 1089   20   92  685  963
# # [205] 1019  409  300  854  732  736   74  655  292  388 1050  749  750  751  491  760  770  370  782  482 1101  344  789   63  798    8  312  620  810  817
