# f_df.lgl.comat.gather.microbenchmark.r

# @ f_df.lgl.comat.gather = function(data, n11 = F, Fisher.exact.test = F) { ======  



# @ f_df.lgl.comat.gather0 = function(data, n11 = F, Fisher.exact.test = F) { ======  
f_df.lgl.comat.gather0 = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) {
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
            
            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
        }
        
        if (.Fisher.exact.test == T) {
            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
        }
        
        for (k in 1:nrow(out)) {
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
                    # fisher.test.out = fisher.test(matrix(c(TN, FP, FN, TP), nrow = 2))
                    fisher.test.out = fisher.test(data.lgl[[varname1vec[k]]], data.lgl[[varname2vec[k]]])
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
            
            stopifnot(identical(out$cooccurence, (out$n11 %>% replace(., is.na(.), 0))))
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
            
            out$SimpleAgreement = TN * TP / FN / FP
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
            
            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
        }
    } 
    
    # if (any(is.na(out$cooccurence))) {
    #     warning("any(is.na(out$cooccurence))")
    # }
    out
}

# TeaTasting <-
# matrix(c(3, 1, 1, 3),
#        nrow = 2,
#        dimnames = list(Guess = c("Milk", "Tea"),
#                        Truth = c("Milk", "Tea")))
# fisher.test(TeaTasting)
# fisher.test(TeaTasting) |> str()
# List of 7
#  $ p.value    : num 0.486
#  $ conf.int   : atomic [1:2] 0.212 621.934
#   ..- attr(*, "conf.level")= num 0.95
#  $ estimate   : Named num 6.41
#   ..- attr(*, "names")= chr "odds ratio"
#  $ null.value : Named num 1
#   ..- attr(*, "names")= chr "odds ratio"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Fisher's Exact Test for Count Data"
#  $ data.name  : chr "TeaTasting"
#  - attr(*, "class")= chr "htest"
chisq.test(TeaTasting) |> str()
# > chisq.test(TeaTasting) |> str()
# List of 9
#  $ statistic: Named num 0.5
#   ..- attr(*, "names")= chr "X-squared"
#  $ parameter: Named int 1
#   ..- attr(*, "names")= chr "df"
#  $ p.value  : num 0.48
#  $ method   : chr "Pearson's Chi-squared test with Yates' continuity correction"
#  $ data.name: chr "TeaTasting"
#  $ observed : num [1:2, 1:2] 3 1 1 3
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ Guess: chr [1:2] "Milk" "Tea"
#   .. ..$ Truth: chr [1:2] "Milk" "Tea"
#  $ expected : num [1:2, 1:2] 2 2 2 2
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ Guess: chr [1:2] "Milk" "Tea"
#   .. ..$ Truth: chr [1:2] "Milk" "Tea"
#  $ residuals: num [1:2, 1:2] 0.707 -0.707 -0.707 0.707
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ Guess: chr [1:2] "Milk" "Tea"
#   .. ..$ Truth: chr [1:2] "Milk" "Tea"
#  $ stdres   : num [1:2, 1:2] 1.41 -1.41 -1.41 1.41
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ Guess: chr [1:2] "Milk" "Tea"
#   .. ..$ Truth: chr [1:2] "Milk" "Tea"
#  - attr(*, "class")= chr "htest"
# Warning message:
# In chisq.test(TeaTasting) : Chi-squared approximation may be incorrect


f_df.lgl.comat.gather1 = function(data, .Fisher.exact.test = F, .cor.test = F) {
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
        arrange(R) |> as_tibble()
    if (.Fisher.exact.test == T | .cor.test == T) {
        # out$varname1 = out$V1 |> as.character()
        # out$varname2 = out$V2 |> as.character()
        # # out$varname1k = ""
        # # out$varname2k = ""
        varname1vec = out$V1 |> as.character()
        varname2vec = out$V2 |> as.character()

        if (.cor.test == T) {
            out$cor_pearson = as.numeric(NA)
            out$cor_pearson.ll = as.numeric(NA)
            out$cor_pearson.ul = as.numeric(NA)
            out$cor_pearson.p = as.numeric(NA)

            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
        }

        if (.Fisher.exact.test == T) {
            # out$n00 = as.integer(NA)
            # out$n10 = as.integer(NA)
            # out$n01 = as.integer(NA)
            # out$n11 = as.integer(NA)
            out$ntot = nrow(data.lgl)
            out$n00 = as.numeric(NA)
            out$n10 = as.numeric(NA)
            out$n01 = as.numeric(NA)
            out$n11 = as.numeric(NA)

            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
        }

        for (k in 1:nrow(out)) {
            # cat(k)
            # cat(".")
            # varname1 = out$varname1[k]
            # varname2 = out$varname2[k]
            # # out$varname1k[k] = varname1
            # # out$varname2k[k] = varname2

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
                    tmp.table = table(data.lgl[[varname1vec[k]]], data.lgl[[varname2vec[k]]])
                    out$n00[k] = tmp.table[1]
                    out$n10[k] = tmp.table[2]
                    out$n01[k] = tmp.table[3]
                    out$n11[k] = tmp.table[4]

                    # fisher.test.out = fisher.test(matrix(c(TN, FP, FN, TP), nrow = 2))
                    fisher.test.out = fisher.test(as.matrix(tmp.table))

                    out$fisher.test.OR[k] = fisher.test.out$estimate
                    out$fisher.test.OR_ll95[k] = fisher.test.out$conf.int[1]
                    out$fisher.test.OR_ul95[k] = fisher.test.out$conf.int[2]
                    out$fisher.test.p[k] = fisher.test.out$p.value
                }
            }

        }

        if (.Fisher.exact.test == T) {

            stopifnot(identical(out$cooccurence, (out$n11 %>% replace(., is.na(.), 0))))
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

            out$SimpleAgreement = TN * TP / FN / FP
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement)

            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
        }
    }

    # if (any(is.na(out$cooccurence))) {
    #     warning("any(is.na(out$cooccurence))")
    # }
    out
}


# f_df.lgl.comat.gather1 = function(data, .Fisher.exact.test = F, .cor.test = F) {
#     data.lgl = data %>% map_df(as.logical)
#     data.lgl.matrix = as.matrix(data.lgl)
#     out = t(data.lgl.matrix) %*% data.lgl.matrix
#     if (any(is.na(out))) {
#         warning("any(is.na(t(data.lgl.matrix) %*% data.lgl.matrix))")
#     }
#     out = out |> as.data.frame() |> rownames_to_column() %>% 
#         dplyr::rename(V1 = rowname) %>% 
#         gather(-V1, key = "V2", value = "cooccurence") %>% 
#         mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(RC = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
#         mutate(tmp = gsub("^R", "", RC)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
#         arrange(R) |> as_tibble()
#     if (.Fisher.exact.test == T | .cor.test == T) {
#         # out$varname1 = out$V1 |> as.character()
#         # out$varname2 = out$V2 |> as.character()
#         # # out$varname1k = ""
#         # # out$varname2k = ""
#         varname1vec = out$V1 |> as.character()
#         varname2vec = out$V2 |> as.character()
#         
#         if (.cor.test == T) {
#             out$cor_pearson = as.numeric(NA)
#             out$cor_pearson.ll = as.numeric(NA)
#             out$cor_pearson.ul = as.numeric(NA)
#             out$cor_pearson.p = as.numeric(NA)
#             
#             out$cor_spearman = as.numeric(NA)
#             out$cor_spearman.ll = as.numeric(NA)
#             out$cor_spearman.ul = as.numeric(NA)
#             out$cor_spearman.p = as.numeric(NA)
#         }
#         
#         if (.Fisher.exact.test == T) {
#             # out$n00 = as.integer(NA)
#             # out$n10 = as.integer(NA)
#             # out$n01 = as.integer(NA)
#             # out$n11 = as.integer(NA)
#             out$ntot = nrow(data.lgl)
#             out$n00 = as.numeric(NA)
#             out$n10 = as.numeric(NA)
#             out$n01 = as.numeric(NA)
#             out$n11 = as.numeric(NA)
# 
#             out$fisher.test.OR = as.numeric(NA)
#             out$fisher.test.OR_ll95 = as.numeric(NA)
#             out$fisher.test.OR_ul95 = as.numeric(NA)
#             out$fisher.test.p = as.numeric(NA)
#         }
#         
#         for (k in 1:nrow(out)) {
#             # cat(k)
#             # cat(".")
#             # varname1 = out$varname1[k]
#             # varname2 = out$varname2[k]
#             # # out$varname1k[k] = varname1
#             # # out$varname2k[k] = varname2
#             
#             if(length(unique(data.lgl[[varname1vec[k]]])) == 2 & length(unique(data.lgl[[varname2vec[k]]])) == 2 ) {
#                 if (.cor.test == T) {
#                     cor.test_pearson.out = cor.test(as.numeric(data.lgl[[varname1vec[k]]]), as.numeric(data.lgl[[varname2vec[k]]]))
#                     out$cor_pearson[k] = cor.test_pearson.out$estimate
#                     out$cor_pearson.ll[k] = cor.test_pearson.out$conf.int[1]
#                     out$cor_pearson.ul[k] = cor.test_pearson.out$conf.int[2]
#                     out$cor_pearson.p[k] = cor.test_pearson.out$p.value
#                     
#                     # cor.test_spearman.out = cor.test(as.numeric(data.lgl[[varname1vec[k]]]), as.numeric(data.lgl[[varname2vec[k]]]), method = "spearman")
#                     # out$cor_spearman[k] = cor.test_spearman.out$estimate
#                     # out$cor_spearman.ll[k] = cor.test_spearman.out$conf.int[1]
#                     # out$cor_spearman.ul[k] = cor.test_spearman.out$conf.int[2]
#                     # out$cor_spearman.p[k] = cor.test_spearman.out$p.value
#                 }
#                 
#                 if (.Fisher.exact.test == T) {
#                     
#                     # fisher.test.out = fisher.test(matrix(c(TN, FP, FN, TP), nrow = 2))
#                     fisher.test.out = fisher.test(data.lgl[[varname1vec[k]]], data.lgl[[varname2vec[k]]])
#                     
#                     out$n00[k] = tmp.table[1]
#                     out$n10[k] = tmp.table[2]
#                     out$n01[k] = tmp.table[3]
#                     out$n11[k] = tmp.table[4]
#                     
#                     out$fisher.test.OR[k] = fisher.test.out$estimate
#                     out$fisher.test.OR_ll95[k] = fisher.test.out$conf.int[1]
#                     out$fisher.test.OR_ul95[k] = fisher.test.out$conf.int[2]
#                     out$fisher.test.p[k] = fisher.test.out$p.value
#                 }
#             }
# 
#         }
# 
#         if (.Fisher.exact.test == T) {
#             
#             stopifnot(identical(out$cooccurence, (out$n11 %>% replace(., is.na(.), 0))))
#             # stopifnot(identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T)))
#             if(!identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))) {
#                 warning("!identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))")
#             }
#             
#             # out = out %>% mutate(
#             #     phi = (n11 * n00 - n10 * n01) / { (n10+n11)*(n00+n01)*(n00+n10)*(n01+n11) } ^.5
#             #     , OR = n00 * n11 / n10 / n01
#             # )
#             TN = out$n00 %>% replace(., is.na(.), 0)
#             FP = out$n01 %>% replace(., is.na(.), 0)
#             FN = out$n10 %>% replace(., is.na(.), 0)
#             TP = out$n11 %>% replace(., is.na(.), 0)
#             out$phi = (TN * TP - FN * FP) / { (FN+TP)*(TN+FP)*(TN+FN)*(FP+TP) } ^.5
#             out$OR = TN * TP / FN / FP
#             
#             out$SimpleAgreement = TN * TP / FN / FP
#             out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
#             out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
#             
#             # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
#         }
#     } 
#     
#     # if (any(is.na(out$cooccurence))) {
#     #     warning("any(is.na(out$cooccurence))")
#     # }
#     out
# }



f_df.lgl.comat.gather2 = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) {
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
            
            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
        }
        
        if (.Fisher.exact.test == T) {
            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
        }
        
        for (k in 1:nrow(out)) {
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
            
            stopifnot(identical(out$cooccurence, (out$n11 %>% replace(., is.na(.), 0))))
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
            
            out$SimpleAgreement = TN * TP / FN / FP
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
            
            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
        }
    } 
    
    # if (any(is.na(out$cooccurence))) {
    #     warning("any(is.na(out$cooccurence))")
    # }
    out
}

f_df.lgl.comat.gather3 = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) {
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
        mutate(rowname = RC) %>% column_to_rownames %>% 
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
            
            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
        }
        
        if (.Fisher.exact.test == T) {
            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
        }
        
        which.R.lt.C = which(out$R < out$C)
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
            
            out$SimpleAgreement = TN * TP / FN / FP
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
            
            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
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

f_df.lgl.comat.gather4 = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) {
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
        mutate(rowname = RC) %>% column_to_rownames %>% 
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
            
            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
        }
        
        if (.Fisher.exact.test == T) {
            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
        }
        
        which.R.lt.C = which(out$R < out$C)
        # for (k in which.R.lt.C) {
        which.R.lt.C %>% map(function(k) {
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
        })
        # }

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
            
            out$SimpleAgreement = TN * TP / FN / FP
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
            
            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
        }
        
        out[paste0("R", out$C[which.R.lt.C], "C", out$R[which.R.lt.C]), !names(out) %in% c("rowname", "V1", "V2", "cooccurence", "R", "C", "RC")] = 
            out[which.R.lt.C, !names(out) %in% c("rowname", "V1", "V2", "cooccurence", "R", "C", "RC")]
    } 
    
    # if (any(is.na(out$cooccurence))) {
    #     warning("any(is.na(out$cooccurence))")
    # }
    out
}


f_df.lgl.comat.gather5 = function(data, .n11 = F, .cor.test = F, .Fisher.exact.test = F) {
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
        mutate(rowname = RC) %>% column_to_rownames %>% 
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
            
            out$cor_spearman = as.numeric(NA)
            out$cor_spearman.ll = as.numeric(NA)
            out$cor_spearman.ul = as.numeric(NA)
            out$cor_spearman.p = as.numeric(NA)
        }
        
        if (.Fisher.exact.test == T) {
            out$fisher.test.OR = as.numeric(NA)
            out$fisher.test.OR_ll95 = as.numeric(NA)
            out$fisher.test.OR_ul95 = as.numeric(NA)
            out$fisher.test.p = as.numeric(NA)
        }
        
        which.R.lt.C = which(out$R < out$C)
        # for (k in which.R.lt.C) {
        tmp = which.R.lt.C %>% map_dbl(function(k) {
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
            k
        })
        # }

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
            
            out$SimpleAgreement = TN * TP / FN / FP
            out$ChanceAgreement = TN / (TN+FP) * TN / (TN+FN) + TP / (TP+FP) * TP / (TP+FN)
            out$Cohen_kappa = (out$SimpleAgreement - out$ChanceAgreement) / (1 - out$ChanceAgreement) 
            
            # out = out %>% mutate(phi.artanh = .5 * log ( (1+phi)/(1-phi) ))
        }
        
        out[paste0("R", out$C[which.R.lt.C], "C", out$R[which.R.lt.C]), !names(out) %in% c("rowname", "V1", "V2", "cooccurence", "R", "C", "RC")] = 
            out[which.R.lt.C, !names(out) %in% c("rowname", "V1", "V2", "cooccurence", "R", "C", "RC")]
    } 
    
    # if (any(is.na(out$cooccurence))) {
    #     warning("any(is.na(out$cooccurence))")
    # }
    out
}


trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T)
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F)
# # A tibble: 961 x 6
#                        V1                     V2 cooccurence    RC     R     C
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F)
# # A tibble: 961 x 16
#                        V1                     V2 cooccurence    RC     R     C  ntot   n00   n10   n01   n11           phi        OR SimpleAgreement ChanceAgreement Cohen_kappa
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int> <int> <dbl> <dbl> <dbl> <dbl>         <dbl>     <dbl>           <dbl>           <dbl>       <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1   829   800     0     0    29  1.0000000000       Inf             Inf       2.0000000        -Inf
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2   829   799    29     1     0 -0.0066166603 0.0000000       0.0000000       0.9637696 -26.6011500
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3   829   781    28    19     1  0.0128518633 1.4680451       1.4680451       0.9441855   9.3857277
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4   829   699    24   101     5  0.0253993965 1.4418317       1.4418317       0.8528786   4.0031771
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5   829   221     9   579    20 -0.0139912063 0.8482057       0.8482057       0.2884671   0.7866658
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6   829   800    29    NA    NA           NaN       NaN             NaN             NaN         NaN
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7   829   799    29     1     0 -0.0066166603 0.0000000       0.0000000       0.9637696 -26.6011500
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8   829   794    29     6     0 -0.0162565997 0.0000000       0.0000000       0.9575273 -22.5445573
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9   829   579    20   221     9  0.0139912063 1.1789593       1.1789593       0.7117287   1.6208015
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10   829   772    28    28     1 -0.0005172414 0.9846939       0.9846939       0.9324141   0.7735310
# # ... with 951 more rows
# Warning message:
# In f_df.lgl.comat.gather(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
# Error in out$cor_spearman.ll[k] <- cor.test_spearman.out$conf.int[1] : 
#   replacement has length zero
# In addition: Warning message:
# In cor.test.default(as.numeric(data.lgl[[varname1vec[k]]]), as.numeric(data.lgl[[varname2vec[k]]]),  :
#   Cannot compute exact p-value with ties
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
# # A tibble: 961 x 14
#                        V1                     V2 cooccurence    RC     R     C   cor_pearson cor_pearson.ll cor_pearson.ul cor_pearson.p cor_spearman cor_spearman.ll cor_spearman.ul cor_spearman.p
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>         <dbl>          <dbl>          <dbl>         <dbl>        <dbl>           <dbl>           <dbl>          <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1  1.0000000000     1.00000000     1.00000000     0.0000000           NA              NA              NA             NA
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2 -0.0066166603    -0.07467336     0.06150139     0.8491337           NA              NA              NA             NA
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3  0.0128518633    -0.05528686     0.08087144     0.7117607           NA              NA              NA             NA
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4  0.0253993965    -0.04276491     0.09332834     0.4651928           NA              NA              NA             NA
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5 -0.0139912063    -0.08200343     0.05415073     0.6874988           NA              NA              NA             NA
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6            NA             NA             NA            NA           NA              NA              NA             NA
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7 -0.0066166603    -0.07467336     0.06150139     0.8491337           NA              NA              NA             NA
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8 -0.0162565997    -0.08425368     0.05189119     0.6402205           NA              NA              NA             NA
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9  0.0139912063    -0.05415073     0.08200343     0.6874988           NA              NA              NA             NA
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10 -0.0005172414    -0.06860517     0.06757548     0.9881358           NA              NA              NA             NA
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T)
# # A tibble: 961 x 10
#                        V1                     V2 cooccurence    RC     R     C fisher.test.OR fisher.test.OR_ll95 fisher.test.OR_ul95 fisher.test.p
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>          <dbl>               <dbl>               <dbl>         <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1            Inf        3.200677e+03                 Inf  3.339119e-54
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2      0.0000000        0.000000e+00         1058.091715  1.000000e+00
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3      1.4672178        3.412795e-02            9.919660  5.135455e-01
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4      1.4411073        4.199260e-01            3.971758  4.037807e-01
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5      0.8483994        3.626019e-01            2.149752  6.760785e-01
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6             NA                  NA                  NA            NA
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7      0.0000000        0.000000e+00         1058.091715  1.000000e+00
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8      0.0000000        0.000000e+00           24.264405  1.000000e+00
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9      1.1786902        4.651700e-01            2.757845  6.760785e-01
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10      0.9847120        2.326087e-02            6.424633  1.000000e+00
# # ... with 951 more rows


f_df.lgl.comat.gather0
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = T, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.05    0.00    0.85 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    1.17    0.05    4.41 
# Warning message:
# In f_df.lgl.comat.gather(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.55    0.02    2.17 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    1.41    0.06    4.94 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    2.55    0.16    8.67 
# Warning message:
# In f_df.lgl.comat.gather(., .n11 = T, .cor.test = F, .Fisher.exact.test = T) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.16    0.00    0.58 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = T, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.61    0.05    2.56 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    1.70    0.08    6.41 
# Warning message:
# In f_df.lgl.comat.gather1(., .cor.test = F, .Fisher.exact.test = T) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.16    0.01    1.31 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    1.17    0.11    4.36 
# Warning message:
# In f_df.lgl.comat.gather2(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.53    0.07    2.86 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    1.56    0.14    5.64 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    1.86    0.08    6.36 
# Warning message:
# In f_df.lgl.comat.gather2(., .n11 = T, .cor.test = F, .Fisher.exact.test = T) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))

system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.17    0.00    0.51 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.64    0.06    2.30 
# Warning message:
# In f_df.lgl.comat.gather3(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.30    0.02    0.84 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    0.70    0.03    2.53 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    0.99    0.01    3.09 
# Warning message:
# In f_df.lgl.comat.gather3(., .n11 = T, .cor.test = F, .Fisher.exact.test = T) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.19    0.02    0.82 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.63    0.03    2.31 
# Warning message:
# In f_df.lgl.comat.gather4(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#    user  system elapsed 
#    0.34    0.00    1.06 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    0.76    0.03    3.26 
# > system.time(trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#    user  system elapsed 
#    0.98    0.03    3.60 
# Warning message:
# In f_df.lgl.comat.gather4(., .n11 = T, .cor.test = F, .Fisher.exact.test = T) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))

library(microbenchmark)
# ?microbenchmark
# mbm = microbenchmark(
#     fun = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#     , fun.n11 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#     , fun.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#     , fun.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
# )
# autoplot(mbm)
# mbm
# # > mbm
# # Unit: milliseconds
# #                   expr      min         lq      mean    median        uq       max neval  cld
# #                    fun   32.346   37.43537  157.5957  211.5472  223.9238  739.1133   100 a   
# #                fun.n11 3505.647 3738.54818 4069.1486 4012.0067 4261.5844 6794.5234   100   c 
# #           fun.cor.test 1547.790 1765.73744 1960.2175 1842.9701 2031.2027 3500.6116   100  b  
# #  fun.Fisher.exact.test 4378.744 4796.72522 5316.7161 5066.7850 5551.1467 7855.9960   100    d


# mbm = microbenchmark(
#     fun0 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather0(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#     , fun0.n11 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather0(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#     , fun0.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather0(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#     , fun0.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather0(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#     , fun0.n11.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#     , fun1 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = F, .Fisher.exact.test = F))
#     , fun1.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = T, .Fisher.exact.test = F))
#     , fun1.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather1(.cor.test = F, .Fisher.exact.test = T))
#     , fun2 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#     , fun2.n11 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#     , fun2.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#     , fun2.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#     , fun2.n11.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather2(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#     , fun3 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
#     , fun3.n11 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
#     , fun3.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
#     , fun3.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
#     , fun3.n11.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
#     , times = 3L
# )
# autoplot(mbm)
# mbm
# # > mbm
# # Unit: milliseconds
# #                        expr        min         lq        mean      median         uq        max neval     cld
# #                        fun0   34.52081  129.00927   365.37711   223.49774   530.8053   838.1128     3 ab     
# #                    fun0.n11 4051.72531 4180.14871  4404.82406  4308.57211  4581.3734  4854.1748     3    d   
# #               fun0.cor.test 1805.54357 1894.47946  1933.02218  1983.41535  1996.7615  2010.1076     3  bc    
# #      fun0.Fisher.exact.test 5832.07111 6193.82611  6401.46697  6555.58110  6686.1649  6816.7487     3     ef 
# #  fun0.n11.Fisher.exact.test 9586.39663 9983.12004 10678.86035 10379.84345 11225.0922 12070.3410     3       g
# #                        fun1   36.00742   37.07863    94.25953    38.14984   123.3856   208.6213     3 a      
# #               fun1.cor.test 2238.78778 2261.60096  2430.08096  2284.41414  2525.7275  2767.0409     3   c    
# #      fun1.Fisher.exact.test 6789.98568 7086.12404  7351.90145  7382.26240  7632.8593  7883.4563     3      f 
# #                        fun2   33.37750   37.37947   110.43832    41.38143   148.9687   256.5560     3 a      
# #                    fun2.n11 4257.70092 4407.06076  4788.91718  4556.42061  5054.5253  5552.6300     3    d   
# #               fun2.cor.test 1973.04105 2098.39424  2164.07507  2223.74742  2259.5921  2295.4367     3   c    
# #      fun2.Fisher.exact.test 5283.12743 5306.36787  5321.36365  5329.60830  5340.4818  5351.3552     3    de  
# #  fun2.n11.Fisher.exact.test 6798.41707 7565.96607  7822.83788  8333.51506  8335.0483  8336.5815     3      f 
# #                        fun3  215.32038  222.70762   225.52045   230.09486   230.6205   231.1461     3 a      
# #                    fun3.n11 1831.62312 2186.43195  2381.62662  2541.24079  2656.6284  2772.0159     3   c    
# #               fun3.cor.test  986.55450 1093.23474  1314.06977  1199.91498  1477.8274  1755.7398     3 a c    
# #      fun3.Fisher.exact.test 2338.05273 2451.62441  2624.90900  2565.19609  2768.3371  2971.4782     3   c    
# #  fun3.n11.Fisher.exact.test 4023.10671 4305.79977  4652.53429  4588.49283  4967.2481  5346.0033     3    d   

Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
mbm = microbenchmark(
    times = 10L
    , fun3 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
    , fun3.n11 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
    , fun3.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
    , fun3.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
    , fun3.n11.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
    , fun4 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = F, .Fisher.exact.test = F))
    , fun4.n11 = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = F, .Fisher.exact.test = F))
    , fun4.cor.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = T, .Fisher.exact.test = F))
    , fun4.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = F, .cor.test = F, .Fisher.exact.test = T))
    , fun4.n11.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = F, .Fisher.exact.test = T))
)
Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
autoplot(mbm)
mbm
# > mbm
# Unit: milliseconds
#                        expr        min         lq      mean     median        uq       max neval    cld
#                        fun3   34.96683   37.78559  112.0498   41.44148  214.6855  235.3112    10 a     
#                    fun3.n11 1768.77803 1985.02996 2084.9278 1998.42825 2168.6965 2807.9831    10    d  
#               fun3.cor.test  813.80824  985.80705 1059.5158 1036.03271 1060.0006 1487.4726    10   c   
#      fun3.Fisher.exact.test 2313.41753 2471.63701 2528.8357 2498.88494 2547.1165 3038.1593    10    de 
#  fun3.n11.Fisher.exact.test 2824.38758 3001.21165 3664.9214 3261.35721 3306.9298 7620.2285    10      f
#                        fun4   37.97680   39.70519  151.7161  219.03652  222.2422  242.8391    10 ab    
#                    fun4.n11 1784.21780 2029.54897 2225.4792 2132.20137 2479.0140 2857.0903    10    d  
#               fun4.cor.test  812.17901  976.24025  995.4259  987.54986  996.8656 1224.9962    10  bc   
#      fun4.Fisher.exact.test 2093.48719 2274.48982 2802.5197 2486.42611 3055.4697 5509.1148    10    d f
#  fun4.n11.Fisher.exact.test 2858.69821 3042.27032 3334.0748 3246.28998 3298.9042 4482.8259    10     ef


Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
mbm = microbenchmark(
    times = 100L
    , fun3.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
    , fun4.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
)
Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
autoplot(mbm)
mbm
# > Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
# [1] "Sys.time_2 - Sys.time_1 : structure(15.0132476011912, units = \"mins\", class = \"difftime\")"
# > mbm
# Unit: seconds
#                                 expr      min       lq     mean   median       uq      max neval cld
#  fun3.n11.cor.test.Fisher.exact.test 3.382242 3.830812 4.476218 4.295382 4.803102 7.779448   100   a
#  fun4.n11.cor.test.Fisher.exact.test 3.585725 4.030800 4.523568 4.321054 4.811916 7.849434   100   a



Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
mbm = microbenchmark(
    times = 10L
    , fun3.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
    , fun4.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
    , fun5.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather5(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
)
Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
autoplot(mbm)
mbm
# > Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
# [1] "Sys.time_2 - Sys.time_1 : structure(2.33128124872843, units = \"mins\", class = \"difftime\")"
# > autoplot(mbm)
# > mbm
# Unit: seconds
#                                 expr      min       lq     mean   median       uq      max neval cld
#  fun3.n11.cor.test.Fisher.exact.test 4.284834 4.304698 4.595245 4.531230 4.553609 5.519339    10   a
#  fun4.n11.cor.test.Fisher.exact.test 4.313771 4.530994 4.821379 4.779988 5.066972 5.326881    10   a
#  fun5.n11.cor.test.Fisher.exact.test 4.092557 4.309335 4.524577 4.534411 4.776114 4.838178    10   a

Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
mbm = microbenchmark(
    times = 100L
    , fun3.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather3(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
    , fun4.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather4(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
    , fun5.n11.cor.test.Fisher.exact.test = (trainsetCC69agg4i07_829.Ctrl.lgl %>% f_df.lgl.comat.gather5(.n11 = T, .cor.test = T, .Fisher.exact.test = T))
)
Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
autoplot(mbm)
mbm
# > Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) ))
# [1] "Sys.time_2 - Sys.time_1 : structure(23.0755514979362, units = \"mins\", class = \"difftime\")"
# > autoplot(mbm)
# > mbm
# Unit: seconds
#                                 expr      min       lq     mean   median       uq      max neval cld
#  fun3.n11.cor.test.Fisher.exact.test 3.723355 4.289194 4.556821 4.499253 4.738552 7.115376   100   a
#  fun4.n11.cor.test.Fisher.exact.test 3.804902 4.317565 4.643447 4.537701 4.769974 7.096995   100   a
#  fun5.n11.cor.test.Fisher.exact.test 3.572550 4.298385 4.629451 4.516325 4.812071 7.819923   100   a


# @ end ----  
# @  selected function = f_df.lgl.comat.gather3 ==========  
