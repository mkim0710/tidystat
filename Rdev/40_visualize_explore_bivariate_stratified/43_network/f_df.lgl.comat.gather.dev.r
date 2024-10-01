#@ f_df.lgl.comat.gather.dev.r  


# data.lgl.comat = function(data) {
#     data.lgl.matrix = as.matrix(data %>% map_df(as.logical))
#     out = t(data.lgl.matrix) %*% data.lgl.matrix
#     if (any(is.na(out))) {
#         warning("any(is.na(t(data.lgl.matrix) %*% data.lgl.matrix))")
#     }
#     out
# }
# 
# trainsetCC69agg4i07_829.Ctrl.lgl.comat = t(as.matrix(trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical))) %*% as.matrix(trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# trainsetCC69agg4i07_829.Ctrl.lgl.comat %>% diag
# identical((trainsetCC69agg4i07_829.Ctrl.lgl %>% colSums), (trainsetCC69agg4i07_829.Ctrl.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# identical((trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical) %>% colSums), (trainsetCC69agg4i07_829.Ctrl.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# trainsetCC69agg4i07_829.Ctrl.lgl.comat |> str()
# # > trainsetCC69agg4i07_829.Ctrl.lgl.comat %>% diag
# #    AcquiredHypothyroidism        AdjustmentDisorder                    Anemia                   Anxiety                 Arthritis        AtrialFibrillation           BenignProstatic 
# #                        29                         1                        20                       106                       599                         0                         1 
# #               BrainInjury                  Cataract             ChronicKidney                  Diabetes                 Dysthymia                  Epilepsy Fibromyalgia_Pain_Fatigue 
# #                         6                       230                        29                       133                         2                         4                       336 
# #                  Glaucoma         HearingImpairment              HeartFailure            Hyperlipidemia              Hypertension             IschemicHeart  Migraine_ChronicHeadache 
# #                        94                        21                        36                       206                        38                       103                       134 
# #       MobilityImpairments              Osteoporosis                  PelvicFx      PersonalityDisorders          SpinalCordInjury                 StrokeTIA         AlzheimerDementia 
# #                        13                       127                        14                         0                        26                        70                         2 
# #              LiverDisease    ObstructiveLungDisease           CancerSurvivors 
# #                       118                       154                        15 
# # > identical((trainsetCC69agg4i07_829.Ctrl.lgl %>% colSums), (trainsetCC69agg4i07_829.Ctrl.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# # [1] TRUE
# # > identical((trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical) %>% colSums), (trainsetCC69agg4i07_829.Ctrl.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# # [1] TRUE
# # > trainsetCC69agg4i07_829.Ctrl.lgl.comat |> str()
# #  num [1:31, 1:31] 29 0 1 5 20 0 0 0 9 1 ...
# #  - attr(*, "dimnames")=List of 2
# #   ..$ : chr [1:31] "AcquiredHypothyroidism" "AdjustmentDisorder" "Anemia" "Anxiety" ...
# #   ..$ : chr [1:31] "AcquiredHypothyroidism" "AdjustmentDisorder" "Anemia" "Anxiety" ...
# 
# 
# 
# trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather = trainsetCC69agg4i07_829.Ctrl.lgl.comat |> as.data.frame() |> rownames_to_column() %>% 
#     dplyr::rename(V1 = rowname) |> rownames_to_column() %>% 
#     gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
#     mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
#     mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
#     arrange(R) |> as_tibble()
# trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather
# identical(nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather), ncol(trainsetCC69agg4i07_829.Ctrl.lgl.comat) * nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat))
# # save(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather, file = "data/trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.rda")
# # > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather = trainsetCC69agg4i07_829.Ctrl.lgl.comat |> as.data.frame() |> rownames_to_column() %>% 
# # +     dplyr::rename(V1 = rowname) |> rownames_to_column() %>% 
# # +     gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
# # +     mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
# # +     mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
# # +     arrange(R) |> as_tibble()
# # > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather
# # # A tibble: 961 x 6
# #    rowname                     V1                     V2 cooccurence     R     C
# #      <chr>                 <fctr>                 <fctr>       <dbl> <int> <int>
# #  1    R1C1 AcquiredHypothyroidism AcquiredHypothyroidism          29     1     1
# #  2    R1C2 AcquiredHypothyroidism     AdjustmentDisorder           0     1     2
# #  3    R1C3 AcquiredHypothyroidism                 Anemia           1     1     3
# #  4    R1C4 AcquiredHypothyroidism                Anxiety           5     1     4
# #  5    R1C5 AcquiredHypothyroidism              Arthritis          20     1     5
# #  6    R1C6 AcquiredHypothyroidism     AtrialFibrillation           0     1     6
# #  7    R1C7 AcquiredHypothyroidism        BenignProstatic           0     1     7
# #  8    R1C8 AcquiredHypothyroidism            BrainInjury           0     1     8
# #  9    R1C9 AcquiredHypothyroidism               Cataract           9     1     9
# # 10   R1C10 AcquiredHypothyroidism          ChronicKidney           1     1    10
# # # ... with 951 more rows
# # > identical(nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather), ncol(trainsetCC69agg4i07_829.Ctrl.lgl.comat) * nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat))
# # [1] TRUE



## @ f_df.lgl.comat.gather = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) { ======  
f_df.lgl.comat.gather = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) { 
    # f_df.lgl.comat.gather3
    data.lgl = data %>% map_df(as.logical)
    data.lgl.matrix = as.matrix(data.lgl)
    out = t(data.lgl.matrix) %*% data.lgl.matrix
    if (any(is.na(out))) {
        warning("any(is.na(t(data.lgl.matrix) %*% data.lgl.matrix))")
    }
    out = out |> as.data.frame() |> rownames_to_column() %>% 
        dplyr::rename(V1 = rowname) %>% 
        gather(-V1, key = "V2", value = "cooccurence") %>% 
        mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(RC = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
        mutate(tmp = gsub("^R", "", RC)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
        mutate(rowname = RC, upper.tri = ifelse( R==C, 0, (C-R)/abs(C-R) ) ) %>% column_to_rownames %>% 
        arrange(R) |> as_tibble()
    if (.n11 == T | .cor.test == T | .Fisher.exact.test == T) {
        # out$varname1 = out$V1 |> as.character()
        # out$varname2 = out$V2 |> as.character()
        # # out$varname1k = ""
        # # out$varname2k = ""
        varname1vec = out$V1 |> as.character()
        varname2vec = out$V2 |> as.character()
        
        if (.n11 == T) {
            # out$n00 = as.integer(NA)
            # out$n10 = as.integer(NA)
            # out$n01 = as.integer(NA)
            # out$n11 = as.integer(NA)
            out$ntot = nrow(data.lgl)
            out$n00 = as.numeric(NA)
            out$n10 = as.numeric(NA)
            out$n01 = as.numeric(NA)
            out$n11 = as.numeric(NA)
        }
        
        if (.cor.test == T) {
            out$cor_pearson = as.numeric(NA)
            out$cor_pearson.ll = as.numeric(NA)
            out$cor_pearson.ul = as.numeric(NA)
            out$cor_pearson.p = as.numeric(NA)
            out$cor_pearson.p.bon = as.numeric(NA)
            
            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
            out$cor_spearman.p.bon = as.numeric(NA)
        }
        
        if (.Fisher.exact.test == T) {
            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
            out$fisher.test.p.bon = as.numeric(NA)
        }
        
        which.R.lt.C = which(out$R < out$C)
        out$comparison = length(which.R.lt.C)
        for (k in which.R.lt.C) {
            # cat(k)
            # cat(".")
            # varname1 = out$varname1[k]
            # varname2 = out$varname2[k]
            # # out$varname1k[k] = varname1
            # # out$varname2k[k] = varname2
            
            if (.n11 == T) {
                tmp.table = table(data.lgl[[varname1vec[k]]], data.lgl[[varname2vec[k]]])
                # print(tmp.table)
                # out$n00[k] = tmp.table[1] |> as.integer()
                # out$n10[k] = tmp.table[2] |> as.integer()
                # out$n01[k] = tmp.table[3] |> as.integer()
                # out$n11[k] = tmp.table[4] |> as.integer()
                out$n00[k] = tmp.table[1]
                out$n10[k] = tmp.table[2]
                out$n01[k] = tmp.table[3]
                out$n11[k] = tmp.table[4]
            }
                
            # if(!any(is.na(tmp.table))) {
            if(length(unique(data.lgl[[varname1vec[k]]])) == 2 & length(unique(data.lgl[[varname2vec[k]]])) == 2 ) {
                if (.cor.test == T) {
                    cor.test_pearson.out = cor.test(as.numeric(data.lgl[[varname1vec[k]]]), as.numeric(data.lgl[[varname2vec[k]]]))
                    out$cor_pearson[k] = cor.test_pearson.out$estimate
                    out$cor_pearson.ll[k] = cor.test_pearson.out$conf.int[1]
                    out$cor_pearson.ul[k] = cor.test_pearson.out$conf.int[2]
                    out$cor_pearson.p[k] = cor.test_pearson.out$p.value
                    
                    # cor.test_spearman.out = cor.test(as.numeric(data.lgl[[varname1vec[k]]]), as.numeric(data.lgl[[varname2vec[k]]]), method = "spearman")
                    # out$cor_spearman[k] = cor.test_spearman.out$estimate
                    # out$cor_spearman.ll[k] = cor.test_spearman.out$conf.int[1]
                    # out$cor_spearman.ul[k] = cor.test_spearman.out$conf.int[2]
                    # out$cor_spearman.p[k] = cor.test_spearman.out$p.value
                }
                
                if (.Fisher.exact.test == T) {
                    if (.n11 == T) {
                        # fisher.test.out = fisher.test(matrix(c(TN, FP, FN, TP), nrow = 2))
                        fisher.test.out = fisher.test(as.matrix(tmp.table))
                    } else {
                        fisher.test.out = fisher.test(data.lgl[[varname1vec[k]]], data.lgl[[varname2vec[k]]])
                    }
                    out$fisher.test.OR[k] = fisher.test.out$estimate
                    out$fisher.test.OR_ll95[k] = fisher.test.out$conf.int[1]
                    out$fisher.test.OR_ul95[k] = fisher.test.out$conf.int[2]
                    out$fisher.test.p[k] = fisher.test.out$p.value
                }
            }

        }

        # print()
        # stopifnot(identical(out$varname1, out$varname1k))
        # stopifnot(identical(out$varname2, out$varname2k))
        # # all.equal(out$cooccurence, as.numeric(out$n11))
        out$varname1 = NULL
        out$varname2 = NULL
        # out$varname1k = NULL
        # out$varname2k = NULL
        
        if (.n11 == T) {
            
            # stopifnot(identical(out$cooccurence, (out$n11 %>% replace(., is.na(.), 0))))
            # stopifnot(identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T)))
            if(!identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))) {
                warning("!identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))")
            }
            
            # out = out %>% mutate(
            #     phi = (n11 * n00 - n10 * n01) / { (n10+n11)*(n00+n01)*(n00+n10)*(n01+n11) } ^.5
            #     , OR = n00 * n11 / n10 / n01
            # )
            TN = out$n00 %>% replace(., is.na(.), 0)
            FP = out$n01 %>% replace(., is.na(.), 0)
            FN = out$n10 %>% replace(., is.na(.), 0)
            TP = out$n11 %>% replace(., is.na(.), 0)
            out$phi = (TN * TP - FN * FP) / { (FN+TP)*(TN+FP)*(TN+FN)*(FP+TP) } ^.5
            out$OR = TN * TP / FN / FP
            
            out$SimpleAgreement = (TP + TN) / (TP + TN + FP + FN)
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
            
            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
        }
        if (.cor.test == T) {
            out$cor_pearson.p.bon = out$cor_pearson.p * out$comparison
            out$cor_spearman.p.bon = out$cor_spearman.p * out$comparison
        }
        if (.Fisher.exact.test == T) {
            out$fisher.test.p.bon = out$fisher.test.p * out$comparison
        }
        
        # browser()
        out = out |> as.data.frame()
        rownames(out) = out$RC
        out[paste0("R", out$C[which.R.lt.C], "C", out$R[which.R.lt.C]), !names(out) %in% c("rowname", "V1", "V2", "cooccurence", "R", "C", "RC")] = 
            out[which.R.lt.C, !names(out) %in% c("rowname", "V1", "V2", "cooccurence", "R", "C", "RC")]
    } 
    
    # if (any(is.na(out$cooccurence))) {
    #     warning("any(is.na(out$cooccurence))")
    # }
    out |> as_tibble()
}


## @ test) f_df.lgl.comat.gather() trainsetCC69agg4i07_829.Ctrl.lgl ----  
library(tidyverse)
load("data/trainsetCC69agg4i07_829.rda")
trainsetCC69agg4i07_829.Ctrl.lgl = trainsetCC69agg4i07_829 %>% select_if(is.logical) %>% dplyr::filter(is.Case != T) %>% select(-is.Case)
# trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.factor) |> summary()
# trainsetCC69agg4i07_829.Ctrl.lgl %>% colSums
# # trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical) %>% colSums
trainsetCC69agg4i07_829.Ctrl.lgl |> str()
# > trainsetCC69agg4i07_829.Ctrl.lgl |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	829 obs. of  31 variables:
#  $ AcquiredHypothyroidism   : logi  FALSE FALSE FALSE FALSE FALSE TRUE ...
#  $ AdjustmentDisorder       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Anemia                   : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Anxiety                  : logi  FALSE TRUE FALSE TRUE FALSE FALSE ...
#  $ Arthritis                : logi  TRUE FALSE FALSE FALSE TRUE TRUE ...
#  $ AtrialFibrillation       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BenignProstatic          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BrainInjury              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Cataract                 : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
#  $ ChronicKidney            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Diabetes                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Dysthymia                : logi  FALSE FALSE FALSE TRUE FALSE FALSE ...
#  $ Epilepsy                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Fibromyalgia_Pain_Fatigue: logi  TRUE TRUE TRUE TRUE TRUE FALSE ...
#  $ Glaucoma                 : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
#  $ HearingImpairment        : logi  FALSE FALSE FALSE TRUE FALSE FALSE ...
#  $ HeartFailure             : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Hyperlipidemia           : logi  TRUE FALSE FALSE TRUE FALSE FALSE ...
#  $ Hypertension             : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ IschemicHeart            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Migraine_ChronicHeadache : logi  FALSE FALSE FALSE FALSE TRUE FALSE ...
#  $ MobilityImpairments      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Osteoporosis             : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PelvicFx                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PersonalityDisorders     : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SpinalCordInjury         : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ StrokeTIA                : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ AlzheimerDementia        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ LiverDisease             : logi  TRUE FALSE FALSE TRUE FALSE FALSE ...
#  $ ObstructiveLungDisease   : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ CancerSurvivors          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...


trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T)
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F)
# # A tibble: 961 x 7
#                        V1                     V2 cooccurence    RC     R     C upper.tri
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>     <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1         0
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2         1
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3         1
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4         1
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5         1
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6         1
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7         1
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8         1
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9         1
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10         1
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F)
# # A tibble: 961 x 18
#                        V1                     V2 cooccurence    RC     R     C upper.tri  ntot   n00   n10   n01   n11 comparison           phi        OR SimpleAgreement ChanceAgreement   Cohen_kappa
#  *                 <fctr>                 <fctr>       <dbl> <chr> <int> <int>     <dbl> <int> <dbl> <dbl> <dbl> <dbl>      <int>         <dbl>     <dbl>           <dbl>           <dbl>         <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1         0   829    NA    NA    NA    NA        465           NaN       NaN             NaN             NaN           NaN
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2         1   829   799    29     1     0        465 -0.0066166603 0.0000000       0.9638118       0.9637696  0.0011646545
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3         1   829   781    28    19     1        465  0.0128518633 1.4680451       0.9433052       0.9441855 -0.0157723026
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4         1   829   699    24   101     5        465  0.0253993965 1.4418317       0.8492159       0.8528786 -0.0248954492
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5         1   829   221     9   579    20        465 -0.0139912063 0.8482057       0.2907117       0.2884671  0.0031545970
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6         1   829   800    29    NA    NA        465           NaN       NaN       0.9650181             NaN           NaN
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7         1   829   799    29     1     0        465 -0.0066166603 0.0000000       0.9638118       0.9637696  0.0011646545
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8         1   829   794    29     6     0        465 -0.0162565997 0.0000000       0.9577805       0.9575273  0.0059595837
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9         1   829   579    20   221     9        465  0.0139912063 1.1789593       0.7092883       0.7117287 -0.0084654734
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10         1   829   772    28    28     1        465 -0.0005172414 0.9846939       0.9324487       0.9324141  0.0005130175
# # ... with 951 more rows
# Warning message:
# In f_df.lgl.comat.gather(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
# # A tibble: 961 x 18
#                        V1                     V2 cooccurence    RC     R     C upper.tri   cor_pearson cor_pearson.ll cor_pearson.ul cor_pearson.p cor_pearson.p.bon cor_spearman cor_spearman.ll cor_spearman.ul
#  *                 <fctr>                 <fctr>       <dbl> <chr> <int> <int>     <dbl>         <dbl>          <dbl>          <dbl>         <dbl>             <dbl>        <dbl>           <dbl>           <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1         0            NA             NA             NA            NA                NA           NA              NA              NA
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2         1 -0.0066166603    -0.07467336     0.06150139     0.8491337          394.8472           NA              NA              NA
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3         1  0.0128518633    -0.05528686     0.08087144     0.7117607          330.9687           NA              NA              NA
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4         1  0.0253993965    -0.04276491     0.09332834     0.4651928          216.3147           NA              NA              NA
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5         1 -0.0139912063    -0.08200343     0.05415073     0.6874988          319.6869           NA              NA              NA
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6         1            NA             NA             NA            NA                NA           NA              NA              NA
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7         1 -0.0066166603    -0.07467336     0.06150139     0.8491337          394.8472           NA              NA              NA
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8         1 -0.0162565997    -0.08425368     0.05189119     0.6402205          297.7025           NA              NA              NA
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9         1  0.0139912063    -0.05415073     0.08200343     0.6874988          319.6869           NA              NA              NA
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10         1 -0.0005172414    -0.06860517     0.06757548     0.9881358          459.4831           NA              NA              NA
# # ... with 951 more rows, and 3 more variables: cor_spearman.p <dbl>, cor_spearman.p.bon <dbl>, comparison <int>
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T)
# # A tibble: 961 x 13
#                        V1                     V2 cooccurence    RC     R     C upper.tri fisher.test.OR fisher.test.OR_ll95 fisher.test.OR_ul95 fisher.test.p fisher.test.p.bon comparison
#  *                 <fctr>                 <fctr>       <dbl> <chr> <int> <int>     <dbl>          <dbl>               <dbl>               <dbl>         <dbl>             <dbl>      <int>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1         0             NA                  NA                  NA            NA                NA        465
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2         1      0.0000000          0.00000000         1058.091715     1.0000000          465.0000        465
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3         1      1.4672178          0.03412795            9.919660     0.5135455          238.7986        465
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4         1      1.4411073          0.41992602            3.971758     0.4037807          187.7580        465
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5         1      0.8483994          0.36260191            2.149752     0.6760785          314.3765        465
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6         1             NA                  NA                  NA            NA                NA        465
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7         1      0.0000000          0.00000000         1058.091715     1.0000000          465.0000        465
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8         1      0.0000000          0.00000000           24.264405     1.0000000          465.0000        465
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9         1      1.1786902          0.46517002            2.757845     0.6760785          314.3765        465
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10         1      0.9847120          0.02326087            6.424633     1.0000000          465.0000        465
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather = trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = T, .Fisher.exact.test = T)
# Warning message:
# In f_df.lgl.comat.gather(., .n11 = T, .cor.test = T, .Fisher.exact.test = T) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))



trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather = trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = T, .Fisher.exact.test = T)
# save(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather, file = "data/trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.rda")
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% mutate(div = fisher.test.p.bon/fisher.test.p, tmp = p.adjust(fisher.test.p, method = "bonferroni"), tmp.div = tmp/fisher.test.p) %>% select(fisher.test.p, fisher.test.p.bon, div, tmp, tmp.div)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% mutate(div = fisher.test.p.bon/fisher.test.p, tmp = p.adjust(fisher.test.p, method = "bonferroni"), tmp.div = tmp/fisher.test.p) %>% select(fisher.test.p, fisher.test.p.bon, div, tmp, tmp.div) %>% arrange(fisher.test.p)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% mutate(div = fisher.test.p.bon/fisher.test.p, tmp = p.adjust(fisher.test.p, method = "bonferroni"), tmp.div = tmp/fisher.test.p) %>% select(fisher.test.p, fisher.test.p.bon, div, tmp, tmp.div)
# # A tibble: 961 x 5
#    fisher.test.p fisher.test.p.bon   div   tmp  tmp.div
#            <dbl>             <dbl> <dbl> <dbl>    <dbl>
#  1            NA                NA    NA    NA       NA
#  2     1.0000000          465.0000   465     1 1.000000
#  3     0.5135455          238.7986   465     1 1.947247
#  4     0.4037807          187.7580   465     1 2.476592
#  5     0.6760785          314.3765   465     1 1.479118
#  6            NA                NA    NA    NA       NA
#  7     1.0000000          465.0000   465     1 1.000000
#  8     1.0000000          465.0000   465     1 1.000000
#  9     0.6760785          314.3765   465     1 1.479118
# 10     1.0000000          465.0000   465     1 1.000000
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% mutate(div = fisher.test.p.bon/fisher.test.p, tmp = p.adjust(fisher.test.p, method = "bonferroni"), tmp.div = tmp/fisher.test.p) %>% select(fisher.test.p, fisher.test.p.bon, div, tmp, tmp.div) %>% arrange(fisher.test.p)
# # A tibble: 961 x 5
#    fisher.test.p fisher.test.p.bon   div          tmp tmp.div
#            <dbl>             <dbl> <dbl>        <dbl>   <dbl>
#  1  3.151544e-08      1.465468e-05   465 2.559054e-05     812
#  2  3.151544e-08      1.465468e-05   465 2.559054e-05     812
#  3  7.222512e-08      3.358468e-05   465 5.864680e-05     812
#  4  7.222512e-08      3.358468e-05   465 5.864680e-05     812
#  5  1.930771e-05      8.978086e-03   465 1.567786e-02     812
#  6  1.930771e-05      8.978086e-03   465 1.567786e-02     812
#  7  3.637371e-05      1.691377e-02   465 2.953545e-02     812
#  8  3.637371e-05      1.691377e-02   465 2.953545e-02     812
#  9  1.371930e-04      6.379476e-02   465 1.114007e-01     812
# 10  1.371930e-04      6.379476e-02   465 1.114007e-01     812
# # ... with 951 more rows





trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% select(V1, V2, cooccurence, n11, OR, fisher.test.OR, phi, cor_pearson, cor_spearman)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% select(V1, V2, cooccurence, n11, OR, fisher.test.OR, phi, cor_pearson, cor_spearman)
# # A tibble: 961 x 9
#                        V1                     V2 cooccurence   n11        OR fisher.test.OR           phi   cor_pearson cor_spearman
#  *                 <fctr>                 <fctr>       <dbl> <dbl>     <dbl>          <dbl>         <dbl>         <dbl>        <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29    NA       NaN             NA           NaN            NA           NA
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0     0 0.0000000      0.0000000 -0.0066166603 -0.0066166603           NA
#  3 AcquiredHypothyroidism                 Anemia           1     1 1.4680451      1.4672178  0.0128518633  0.0128518633           NA
#  4 AcquiredHypothyroidism                Anxiety           5     5 1.4418317      1.4411073  0.0253993965  0.0253993965           NA
#  5 AcquiredHypothyroidism              Arthritis          20    20 0.8482057      0.8483994 -0.0139912063 -0.0139912063           NA
#  6 AcquiredHypothyroidism     AtrialFibrillation           0    NA       NaN             NA           NaN            NA           NA
#  7 AcquiredHypothyroidism        BenignProstatic           0     0 0.0000000      0.0000000 -0.0066166603 -0.0066166603           NA
#  8 AcquiredHypothyroidism            BrainInjury           0     0 0.0000000      0.0000000 -0.0162565997 -0.0162565997           NA
#  9 AcquiredHypothyroidism               Cataract           9     9 1.1789593      1.1786902  0.0139912063  0.0139912063           NA
# 10 AcquiredHypothyroidism          ChronicKidney           1     1 0.9846939      0.9847120 -0.0005172414 -0.0005172414           NA
# # ... with 951 more rows


trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri = trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather %>% dplyr::filter(R < C)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri
identical(as.numeric(nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri)), ncol(trainsetCC69agg4i07_829.Ctrl.lgl.comat) * {nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat) - 1} / 2)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri = trainsetCC69agg4i07_829.Ctrl.lgl.comat |> as.data.frame() |> rownames_to_column() %>% 
# +     dplyr::rename(V1 = rowname) |> rownames_to_column() %>% 
# +     gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
# +     mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
# +     mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>%
# +     arrange(R) |> as_tibble() %>% dplyr::filter(R < C)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri
# # A tibble: 465 x 7
#                        V1                 V2 cooccurence    RC     R     C upper.tri
#                    <fctr>             <fctr>       <dbl> <chr> <int> <int>     <dbl>
#  1 AcquiredHypothyroidism AdjustmentDisorder           0  R1C2     1     2         1
#  2 AcquiredHypothyroidism             Anemia           1  R1C3     1     3         1
#  3 AcquiredHypothyroidism            Anxiety           5  R1C4     1     4         1
#  4 AcquiredHypothyroidism          Arthritis          20  R1C5     1     5         1
#  5 AcquiredHypothyroidism AtrialFibrillation           0  R1C6     1     6         1
#  6 AcquiredHypothyroidism    BenignProstatic           0  R1C7     1     7         1
#  7 AcquiredHypothyroidism        BrainInjury           0  R1C8     1     8         1
#  8 AcquiredHypothyroidism           Cataract           9  R1C9     1     9         1
#  9 AcquiredHypothyroidism      ChronicKidney           1 R1C10     1    10         1
# 10 AcquiredHypothyroidism           Diabetes           1 R1C11     1    11         1
# # ... with 455 more rows
# > identical(as.numeric(nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri)), ncol(trainsetCC69agg4i07_829.Ctrl.lgl.comat) * {nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat) - 1} / 2)
# [1] TRUE


# @@ END----  
