# source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")


# data.tab_strata_exposure.old = function(
#     .mydata
#     , .vars4strata = c("female", "age.cut")
#     , .exposure = "treatment"
# ) {
#     .mydata.strata_list = .mydata %>% data.strata_list(.vars4strata = .vars4strata)
#     out = .mydata.strata_list %>% map(function(df) {
#         out = df[[.exposure]] %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
#         parent.x = get(".x", envir = parent.frame())
#         attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
#         names(out)[1] = attr(out, "parent_name")
#         out = out %>% t %>% as.data.frame %>% rownames_to_column
#         out
#     }) %>% reduce(bind_rows)
#     out$total = rowSums(out[, 2:3], na.rm = T)
#     out$ratio = out[[2]] / out[[3]] %>% round(3)
#     out$ratio_inv = out[[3]] / out[[2]] %>% round(3)
#     print(paste0("min(ratio, na.rm = T): ", min(out$ratio, na.rm = T)))
#     print(paste0("min(ratio_inv, na.rm = T): ", min(out$ratio_inv, na.rm = T)))
#     out
# }
data.tab_strata_exposure = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , .exposure = "treatment"
    , round_digits = 2
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = "_")
    # tmp = table(.mydata$strata, .mydata[[.exposure]]) %>% as.data.frame
    # out = table(.mydata$strata, .mydata[[.exposure]]) %>% as.data.frame.matrix %>% rownames_to_column
    out = table(.mydata$strata, .mydata[[.exposure]]) %>% addmargins %>% as.data.frame.matrix %>% rownames_to_column
    
    # out$total = rowSums(out[, 2:3], na.rm = T)
    out$ratio = out[[2]] / out[[3]] 
    out$ratio = out$ratio %>% round(round_digits)
    out$ratio_inv = out[[3]] / out[[2]] 
    out$ratio_inv = out$ratio_inv %>% round(round_digits)
    print(paste0("min(ratio, na.rm = T): ", min(out$ratio, na.rm = T)))
    print(paste0("min(ratio_inv, na.rm = T): ", min(out$ratio_inv, na.rm = T)))
    out
}

#@ test) data.tab_strata_exposure() -----
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata %>% data.tab_strata_exposure(.vars4strata = c("female", "age.cut"), .exposure = "treatment")
# > rhc_mydata %>% data.tab_strata_exposure(.vars4strata = c("female", "age.cut"), .exposure = "treatment")
# [1] "min(ratio, na.rm = T): 0"
# [1] "min(ratio_inv, na.rm = T): 0"
#        rowname    0    1  Sum ratio ratio_inv
# 1    0_[10,20)   17    5   22  3.40      0.29
# 2  0_[100,Inf]    0    1    1  0.00       Inf
# 3    0_[20,30)   85   50  135  1.70      0.59
# 4    0_[30,40)  170   72  242  2.36      0.42
# 5    0_[40,50)  230  174  404  1.32      0.76
# 6    0_[50,60)  309  218  527  1.42      0.71
# 7    0_[60,70)  459  343  802  1.34      0.75
# 8    0_[70,80)  427  330  757  1.29      0.77
# 9    0_[80,90)  190   80  270  2.38      0.42
# 10  0_[90,100)   27    5   32  5.40      0.19
# 11   1_[10,20)    8    3   11  2.67      0.38
# 12 1_[100,Inf]    2    0    2   Inf      0.00
# 13   1_[20,30)   71   46  117  1.54      0.65
# 14   1_[30,40)  130   81  211  1.60      0.62
# 15   1_[40,50)  173  109  282  1.59      0.63
# 16   1_[50,60)  237  153  390  1.55      0.65
# 17   1_[60,70)  353  234  587  1.51      0.66
# 18   1_[70,80)  382  199  581  1.92      0.52
# 19   1_[80,90)  232   73  305  3.18      0.31
# 20  1_[90,100)   49    8   57  6.12      0.16
# 21         Sum 3551 2184 5735  1.63      0.62



#@ -----
data.strata_list = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = "_")
    .mydata$strata = .mydata$strata %>% as.factor
    out = map(
        levels(.mydata$strata)
        , function(chr) {
            out2 = .mydata %>% filter(strata == !!chr) %>% as.tibble
            # attr(out2, ".vars4strata") = .vars4strata
            out2
        }
    )
    names(out) = levels(.mydata$strata)
    attr(out, ".vars4strata") = .vars4strata
    attr(out, "function.input") = list(
        data.strata_list = data.strata_list
        , .vars4strata = .vars4strata
    ) # list inside attr() is not shown with str(max.level = 1)
    out
}


#@ test) data.strata_list() -----
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata %>% as.tibble
# > rhc_mydata %>% as.tibble
# # A tibble: 5,735 x 14
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>
#  1     0     0     0      0     0       0     0      0 70.25098      0      41         0     0 [70,80)
#  2     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)
#  3     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)
#  4     1     0     0      0     0       0     0      0 75.33197      1      55         0     1 [70,80)
#  5     0     0     0      0     0       0     0      1 67.90997      0      65         1     1 [60,70)
#  6     0     0     0      0     0       0     0      0 86.07794      1     115         0     0 [80,90)
#  7     0     0     0      0     0       0     1      0 54.96799      0      67         0     0 [50,60)
#  8     1     0     0      0     0       0     0      0 43.63898      0     128         0     1 [40,50)
#  9     0     0     0      0     0       0     1      0 18.04199      1      53         0     0 [10,20)
# 10     1     0     0      0     0       0     0      0 48.42398      1      73         1     0 [40,50)
# # ... with 5,725 more rows
# %>% map(seq_along(.), function(i) {df = .[[i]]; names(df)[1] = names(.)[i]; t(df)})
rhc_mydata.strata_list = rhc_mydata %>% data.strata_list(.vars4strata = c("female", "age.cut"))
rhc_mydata.strata_list %>% str(max.level = 1)
rhc_mydata.strata_list[[1]]
# > rhc_mydata.strata_list %>% str(max.level = 1)
# List of 20
#  $ 0_[10,20)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	22 obs. of  15 variables:
#  $ 0_[100,Inf]:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  15 variables:
#  $ 0_[20,30)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	135 obs. of  15 variables:
#  $ 0_[30,40)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	242 obs. of  15 variables:
#  $ 0_[40,50)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	404 obs. of  15 variables:
#  $ 0_[50,60)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	527 obs. of  15 variables:
#  $ 0_[60,70)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	802 obs. of  15 variables:
#  $ 0_[70,80)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	757 obs. of  15 variables:
#  $ 0_[80,90)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	270 obs. of  15 variables:
#  $ 0_[90,100) :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	32 obs. of  15 variables:
#  $ 1_[10,20)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	11 obs. of  15 variables:
#  $ 1_[100,Inf]:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2 obs. of  15 variables:
#  $ 1_[20,30)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	117 obs. of  15 variables:
#  $ 1_[30,40)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	211 obs. of  15 variables:
#  $ 1_[40,50)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	282 obs. of  15 variables:
#  $ 1_[50,60)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	390 obs. of  15 variables:
#  $ 1_[60,70)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	587 obs. of  15 variables:
#  $ 1_[70,80)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	581 obs. of  15 variables:
#  $ 1_[80,90)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	305 obs. of  15 variables:
#  $ 1_[90,100) :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	57 obs. of  15 variables:
#  - attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  - attr(*, "function.input")=List of 2
# > rhc_mydata.strata_list[[1]]
# # A tibble: 22 x 15
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>
#  1     0     0     0      0     0       0     0      1 19.67400      0     105         1     1 [10,20) 0_[10,20)
#  2     0     0     0      0     0       0     0      1 19.35100      0      70         0     0 [10,20) 0_[10,20)
#  3     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)
#  4     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)
#  5     0     0     0      0     0       0     0      1 19.14899      0     103         0     0 [10,20) 0_[10,20)
#  6     1     0     0      0     0       0     0      0 19.21999      0     128         0     0 [10,20) 0_[10,20)
#  7     0     0     0      0     0       0     0      1 18.84999      0      63         0     0 [10,20) 0_[10,20)
#  8     0     0     0      0     0       0     0      1 18.41499      0      53         0     0 [10,20) 0_[10,20)
#  9     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)
# 10     1     0     0      0     0       0     0      0 18.16299      0      65         0     1 [10,20) 0_[10,20)
# # ... with 12 more rows
rhc_mydata.strata_list %>% map(function(df) {
    out = df$treatment %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
    parent.x = get(".x", envir = parent.frame())
    attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
    names(out)[1] = attr(out, "parent_name")
    out = out %>% t %>% as.data.frame %>% rownames_to_column
    out
}) %>% reduce(bind_rows)
# > rhc_mydata.strata_list %>% map(function(df) {
# +     out = df$treatment %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
# +     parent.x = get(".x", envir = parent.frame())
# +     attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
# +     names(out)[1] = attr(out, "parent_name")
# +     out = out %>% t %>% as.data.frame %>% rownames_to_column
# +     out
# + }) %>% reduce(bind_rows)
#        rowname   0   1
# 1    0_[10,20)  17   5
# 2  0_[100,Inf]  NA   1
# 3    0_[20,30)  85  50
# 4    0_[30,40) 170  72
# 5    0_[40,50) 230 174
# 6    0_[50,60) 309 218
# 7    0_[60,70) 459 343
# 8    0_[70,80) 427 330
# 9    0_[80,90) 190  80
# 10  0_[90,100)  27   5
# 11   1_[10,20)   8   3
# 12 1_[100,Inf]   2  NA
# 13   1_[20,30)  71  46
# 14   1_[30,40) 130  81
# 15   1_[40,50) 173 109
# 16   1_[50,60) 237 153
# 17   1_[60,70) 353 234
# 18   1_[70,80) 382 199
# 19   1_[80,90) 232  73
# 20  1_[90,100)  49   8


data.Match <- function(
    .mydata
    , .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T
    , RowNum_original_before_strata = NULL
    , apply.na.omit = F
    , print.process = F
    , load.dependent.library = T
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    if (load.dependent.library == T) {
        library(tidyverse)
        library(Matching)
        library(tableone)
        # library(useful)
    }
    select = dplyr::select
    .mydata$RowNum_original = 1:nrow(.mydata)
    
    if (length(unique(.mydata[[.exposure]])) < 2) {
        warning("length(unique(.mydata[[.exposure]]) < 2")
        out = list()
        out$data = NA  # need this object to avoid error "attempt to set an attribute on NULL"
        attr(out, "error.message") = "length(unique(.mydata[[.exposure]]) < 2"  # attr() is shown with str(max.level = 1)
        # if (add_tableone_pre_post == T) {
        #     out$tableone_pre = NA
        #     out$tableone_post_total = NA
        #     out$tableone_post_i = NA
        # }
    } else {
        out = list()
        if (add_tableone_pre_post == T) {
            out$tableone_pre = CreateTableOne(vars = .vars4Matching, strata = .exposure, data = .mydata, test=T, includeNA = T)
        }
        
        if (apply.na.omit == T) {
            nrow1 = nrow(.mydata)
            # .mydata = .mydata %>% na.omit
            # nrow2 = nrow(.mydata)
            # print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
            .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")] %>% na.omit 
            .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
            nrow2 = nrow(.mydata.exposure.vars4Matching.na.omit)
            print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
        } else {
            .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")]
            .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
        }
        
        # .X = .mydata.exposure.vars4Matching.na.omit[, .vars4Matching]
        .X = model.matrix(~., .mydata.exposure.vars4Matching.na.omit[, .vars4Matching])
        # .X = build.x(~., .mydata.exposure.vars4Matching.na.omit)
        
        if (print.process == T) {
            print(paste0("data.Match() - dim(.mydata) : ", dim(.mydata) %>% deparse))
            # print(paste0("data.Match() - dim(.mydata.exposure.vars4Matching.na.omit) : ", dim(.mydata.exposure.vars4Matching.na.omit) %>% deparse))
            print(paste0("data.Match() - dim(.X) : ", dim(.X) %>% deparse))
        }
        .mydata.Match = Match(Tr = .mydata.exposure.vars4Matching.na.omit[[.exposure]], M = .MatchingRatio, X = .X, replace = FALSE)
        
        tmpDf = .mydata.Match[c("index.treated","index.control")] %>% as.tibble() %>% mutate(MatchingPairID = as.numeric(as.factor(index.treated)))
        tmpDf$MatchingCtrlNum = 1:.MatchingRatio
        # tmpDf
        
        tmpDf2ctrl = tmpDf[,c("index.control", "MatchingPairID", "MatchingCtrlNum")]
        # names(tmpDf2ctrl)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
        names(tmpDf2ctrl)[1] = "RowNum_after_na.omit"
        # tmpDf2ctrl
        
        tmpDf2tx = tmpDf[,c("index.treated", "MatchingPairID", "MatchingCtrlNum")]
        tmpDf2tx$MatchingCtrlNum = 0
        # names(tmpDf2tx)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
        names(tmpDf2tx)[1] = "RowNum_after_na.omit"
        tmpDf2tx = tmpDf2tx %>% distinct()
        # tmpDf2tx
        
        tmpDf3 = union(tmpDf2tx, tmpDf2ctrl)
        # tmpDf3$rowname = tmpDf3$rowname %>% as.character()  # bug fix 170826 - rowname are altered when apply.na.omit == T
        # tmpDf3 %>% arrange(MatchingPairID, MatchingCtrlNum)
        
        tmpDf4 = left_join(tmpDf3, .mydata.exposure.vars4Matching.na.omit[, c(RowNum_original_before_strata, "RowNum_original", "RowNum_after_na.omit")], by = "RowNum_after_na.omit")
        
        # .mydataMatching = .mydata %>% rownames_to_column() %>% as.tibble()  # bug fix 170826 - rowname are altered when apply.na.omit == T
        # .mydataMatching = inner_join(.mydataMatching, tmpDf3, by = "rowname") %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
        .mydataMatching = inner_join(.mydata, tmpDf4, by = c(RowNum_original_before_strata, "RowNum_original")) %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
        
        # .mydataMatching$MatchingPairID = paste0()
        # .mydataMatching
        out$data = .mydataMatching %>% as.tibble
        if (add_tableone_pre_post == T) {
            out$tableone_post_total = CreateTableOne(
                vars = .vars4Matching, strata = .exposure
                , data = .mydataMatching
                , test=T
                , includeNA = T)
            out$tableone_post_i = lapply(1:.MatchingRatio, function(i) {
                CreateTableOne(
                    vars = .vars4Matching, strata = .exposure
                    , data = .mydataMatching %>% filter(MatchingCtrlNum %in% c(0,i))
                    , test=T
                    , includeNA = T)
            })
            names(out$tableone_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
        }
    }
    attr(out$data, ".vars4Matching") = .vars4Matching
    attr(out$data, ".exposure") = .exposure
    attr(out$data, ".MatchingRatio") = .MatchingRatio
    attr(out$data, "apply.na.omit") = apply.na.omit
    attr(out, "function.input") = list(data.Match = data.Match
                                       , .vars4Matching = .vars4Matching
                                       , .exposure = .exposure
                                       , .MatchingRatio = .MatchingRatio
                                       , apply.na.omit = apply.na.omit
    ) # list inside attr() is not shown with str(max.level = 1)
    if(is.data.frame(out$data)) {
        # out$data$RowNum_original = NULL
        out$data$RowNum_after_na.omit = NULL
    }
    out
}



#@ test) data.Match() rhc_mydata -----
rhc_mydata.Match = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.Match = rhc_mydata %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "data.Match() - dim(.mydata) : c(5735L, 14L)"
# [1] "data.Match() - dim(.X) : c(5735L, 5L)"
rhc_mydata.Match = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
)
rhc_mydata.Match %>% str(max.level = 1)
rhc_mydata.Match %>% attr("function.input") %>% str
# > rhc_mydata.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4260 obs. of  17 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.Match %>% attr("function.input") %>% str
# List of 5
#  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T, apply.na.omit = F, print.process = F, 
#     load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 15 103 1 15 1 1 103
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000017eebc40> 
#  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
#  $ .exposure     : chr "treatment"
#  $ .MatchingRatio: num 5
#  $ apply.na.omit : logi FALSE
rhc_mydata.Match$tableone_pre %>% print(smd = T)
rhc_mydata.Match$tableone_post_total %>% print(smd = T)
rhc_mydata.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.Match$data
# > rhc_mydata.Match$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.76 (17.29) 60.75 (15.63)  0.026       0.061
#   meanbp1 (mean (sd)) 84.87 (38.87) 68.20 (34.24) <0.001       0.455
# > rhc_mydata.Match$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3550           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.083       0.071
#   age (mean (sd))     61.77 (17.29) 60.72 (15.53)  0.133       0.064
#   meanbp1 (mean (sd)) 84.82 (38.79) 69.14 (33.79) <0.001       0.431
# > rhc_mydata.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     710           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.200       0.068
#   age (mean (sd))     61.79 (17.17) 60.72 (15.53)  0.216       0.066
#   meanbp1 (mean (sd)) 84.94 (38.99) 69.14 (33.79) <0.001       0.433
# > rhc_mydata.Match$data
# # A tibble: 4,260 x 17
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>           <int>          <dbl>           <dbl>
#  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)               2              1               0
#  2     1     0     0      0     0       0     0      0 78.91895      1      62         0     1 [70,80)            1041              1               1
#  3     0     0     0      0     1       0     0      0 77.32495      1      63         0     0 [70,80)            1871              1               2
#  4     1     0     0      0     0       0     0      0 77.46698      1      61         0     1 [70,80)            2288              1               3
#  5     0     0     0      0     1       0     0      0 77.55499      1      62         0     1 [70,80)            3765              1               4
#  6     0     0     0      0     0       0     0      0 76.98798      1      63         0     0 [70,80)            4800              1               5
#  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)               3              2               0
#  8     0     0     0      0     0       0     0      1 45.43698      1      55         0     0 [40,50)            1993              2               1
#  9     0     0     0      0     0       0     0      1 45.02698      1      57         0     0 [40,50)            3043              2               2
# 10     1     0     0      0     0       0     0      0 47.93399      1      58         0     0 [40,50)            3887              2               3
# # ... with 4,250 more rows

#@ test) data.Match() rhc_mydata.na ----
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.na = rhc_mydata
rhc_mydata.na$age[0:99 * 7 + 1] = NA
rhc_mydata.na$meanbp1[0:99 * 5 + 1] = NA
rhc_mydata.na %>% str
# > rhc_mydata.na %>% str
# 'data.frame':	5735 obs. of  14 variables:
#  $ ARF      : num  0 0 0 1 0 0 0 1 0 1 ...
#  $ CHF      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Cirr     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ colcan   : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Coma     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ lungcan  : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ MOSF     : num  0 0 1 0 0 0 1 0 1 0 ...
#  $ sepsis   : num  0 1 0 0 1 0 0 0 0 0 ...
#  $ age      : num  NA 78.2 46.1 75.3 67.9 ...
#  $ female   : num  0 1 1 1 0 1 0 0 1 1 ...
#  $ meanbp1  : num  NA 63 57 55 65 NA 67 128 53 73 ...
#  $ treatment: num  0 1 1 0 1 0 0 0 0 1 ...
#  $ died     : num  0 1 0 1 1 0 0 1 0 0 ...
#  $ age.cut  : Factor w/ 11 levels "[0,10)","[10,20)",..: 8 8 5 8 7 9 6 5 2 5 ...

rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "data.Match() - dim(.mydata) : c(5735L, 15L)"
# [1] "data.Match() - dim(.X) : c(5550L, 4L)"
#  Show Traceback
#  
#  Rerun with Debug
#  Error in Match(Tr = .mydata.exposure.vars4Matching.na.omit[[.exposure]],  : 
#   length(Tr) != nrow(X) 
rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
    , apply.na.omit = T
)
# > rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# +     , apply.na.omit = T
# + )
# [1] "apply.na.omit == T : removing 185 rows - from 5735 rows to 5550 rows"
# [1] "data.Match() - dim(.mydata) : c(5735L, 15L)"
# [1] "data.Match() - dim(.X) : c(5550L, 4L)"
rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = F
    , apply.na.omit = T
)
# > rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = F
# +     , apply.na.omit = T
# + )
# [1] "apply.na.omit == T : removing 185 rows - from 5735 rows to 5550 rows"

rhc_mydata.na.Match %>% str(max.level = 1)
rhc_mydata.na.Match %>% attr("function.input") %>% str
# > rhc_mydata.na.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4134 obs. of  18 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi TRUE
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.na.Match %>% attr("function.input") %>% str
# List of 5
#  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T, apply.na.omit = F, print.process = F, 
#     load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 15 117 1 15 1 1 117
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000296bcf98> 
#  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
#  $ .exposure     : chr "treatment"
#  $ .MatchingRatio: num 5
#  $ apply.na.omit : logi TRUE

rhc_mydata.Match$data %>% dim
rhc_mydata.na.Match$data %>% dim
# > rhc_mydata.Match$data %>% dim
# [1] 4260   18
# > rhc_mydata.na.Match$data %>% dim
# [1] 4134   18
4260 - 4134
# > 4260 - 4134
# [1] 126

rhc_mydata.na.Match$tableone_pre %>% print(smd = T)
rhc_mydata.na.Match$tableone_post_total %>% print(smd = T)
rhc_mydata.na.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.na.Match$data
# > rhc_mydata.na.Match$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.68 (17.28) 60.71 (15.62)  0.034       0.059
#   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# > rhc_mydata.na.Match$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3445           689                           
#   female (mean (sd))   0.46 (0.50)   0.44 (0.50)   0.258       0.047
#   age (mean (sd))     61.70 (17.31) 60.53 (15.42)  0.099       0.071
#   meanbp1 (mean (sd)) 84.84 (38.84) 68.97 (34.53) <0.001       0.432
# > rhc_mydata.na.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     689           689                           
#   female (mean (sd))   0.46 (0.50)   0.44 (0.50)   0.449       0.041
#   age (mean (sd))     61.65 (17.20) 60.53 (15.42)  0.203       0.069
#   meanbp1 (mean (sd)) 84.90 (39.06) 68.97 (34.53) <0.001       0.432
# > rhc_mydata.na.Match$data
# # A tibble: 4,134 x 17
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>           <int>          <dbl>           <dbl>
#  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)               2              1               0
#  2     1     0     0      0     0       0     0      0 78.91895      1      62         0     1 [70,80)            1041              1               1
#  3     0     0     0      0     1       0     0      0 77.32495      1      63         0     0 [70,80)            1871              1               2
#  4     1     0     0      0     0       0     0      0 77.46698      1      61         0     1 [70,80)            2288              1               3
#  5     0     0     0      0     1       0     0      0 77.55499      1      62         0     1 [70,80)            3765              1               4
#  6     0     0     0      0     0       0     0      0 76.98798      1      63         0     0 [70,80)            4800              1               5
#  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)               3              2               0
#  8     0     0     0      0     0       0     0      1 45.43698      1      55         0     0 [40,50)            1993              2               1
#  9     0     0     0      0     0       0     0      1 45.02698      1      57         0     0 [40,50)            3043              2               2
# 10     1     0     0      0     0       0     0      0 47.93399      1      58         0     0 [40,50)            3887              2               3
# # ... with 4,124 more rows

rhc_mydata.na.Match$data$RowNum_original %>% unique %>% length
rhc_mydata.na.Match$data$RowNum_after_na.omit %>% unique %>% length
# > rhc_mydata.na.Match$data$RowNum_original %>% unique %>% length
# [1] 4134
# > rhc_mydata.na.Match$data$RowNum_after_na.omit %>% unique %>% length
# [1] 4134


#@ test) data.Match() rhc_mydata.strata_list -----
rhc_mydata.strata_list.Match.old = rhc_mydata.strata_list %>% 
    map(data.Match
        , .vars4Matching = c("age","meanbp1")
        , .exposure = "treatment"
        , .MatchingRatio = 5
    )
# > rhc_mydata.strata_list.Match.old = rhc_mydata.strata_list %>% 
# +     map(data.Match
# +         , .vars4Matching = c("age","meanbp1")
# +         , .exposure = "treatment"
# +         , .MatchingRatio = 5
# +     )
# Warning messages:
# 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
rhc_mydata.strata_list.Match.old %>% str(max.level = 1)
# > rhc_mydata.strata_list.Match.old %>% str(max.level = 1)
# List of 20
#  $ 0_[10,20)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[100,Inf]:List of 1
#   ..- attr(*, "error.message")= chr "length(unique(.mydata[[.exposure]]) < 2"
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[20,30)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[30,40)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[40,50)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[50,60)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[60,70)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[70,80)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[80,90)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 0_[90,100) :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[10,20)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[100,Inf]:List of 1
#   ..- attr(*, "error.message")= chr "length(unique(.mydata[[.exposure]]) < 2"
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[20,30)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[30,40)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[40,50)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[50,60)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[60,70)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[70,80)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[80,90)  :List of 4
#   ..- attr(*, "function.input")=List of 5
#  $ 1_[90,100) :List of 4
#   ..- attr(*, "function.input")=List of 5
rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_pre %>% print(smd = T)
rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_total %>% print(smd = T)
rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.strata_list.Match.old$`0_[60,70)`$data
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     459           343                           
#   age (mean (sd))     65.16 (2.91)  64.97 (2.87)   0.346       0.067
#   meanbp1 (mean (sd)) 85.39 (38.10) 68.43 (36.41) <0.001       0.455
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     455            91                           
#   age (mean (sd))     65.15 (2.90)  65.29 (2.73)   0.676       0.049
#   meanbp1 (mean (sd)) 84.64 (37.36) 69.77 (33.90) <0.001       0.417
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                      91            91                           
#   age (mean (sd))     65.24 (2.88)  65.29 (2.73)   0.909       0.017
#   meanbp1 (mean (sd)) 85.51 (37.50) 69.77 (33.90)  0.003       0.440
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$data
# # A tibble: 546 x 18
#    rowname   ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata MatchingPairID MatchingCtrlNum
#      <chr> <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>          <dbl>           <dbl>
#  1       1     0     0     0      0     0       0     0      1 67.90997      0      65         1     1 [60,70) 0_[60,70)              1               0
#  2      36     0     1     0      0     0       0     0      0 67.89294      0      66         0     0 [60,70) 0_[60,70)              1               1
#  3     517     1     0     0      0     0       0     0      0 67.89600      0      65         0     1 [60,70) 0_[60,70)              1               2
#  4     538     1     0     0      0     0       0     0      0 67.96997      0      67         0     1 [60,70) 0_[60,70)              1               3
#  5     676     0     0     0      0     0       0     0      0 68.02496      0      63         0     1 [60,70) 0_[60,70)              1               4
#  6     731     0     0     0      0     0       0     1      0 67.79700      0      65         0     1 [60,70) 0_[60,70)              1               5
#  7       2     1     0     0      0     0       0     0      0 68.34796      0      50         1     0 [60,70) 0_[60,70)              2               0
#  8     166     0     0     1      0     0       0     0      0 68.07397      0      53         0     1 [60,70) 0_[60,70)              2               1
#  9     220     0     0     0      0     0       0     0      1 68.51196      0      52         0     1 [60,70) 0_[60,70)              2               2
# 10     227     0     0     0      0     0       0     1      0 68.23297      0      47         0     1 [60,70) 0_[60,70)              2               3
# # ... with 536 more rows

data.stratified.Match = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age", "income"), .exposure = "treatment", .MatchingRatio = 5
    , .paralletlsugar = F
    , apply.na.omit = F
    , print.process = F
    , load.dependent.library = T
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    if (!is.data.frame(.mydata)) stop("!is.data.frame(.mydata)")
    if (load.dependent.library == T) {
        library(tidyverse)
        library(Matching)
        library(tableone)
        # library(useful)
    }
    select = dplyr::select
    .mydata$RowNum_original_before_strata = 1:nrow(.mydata)
    
    # if(.parallelsugar == T) {
    #     library(parallelsugar)
    #     map = parallelsugar::mclapply
    # }
    
    data.strata_list = function(
        .mydata
        , .vars4strata = c("female", "age.cut")
    ) {
        # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
        if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
        .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = "_")
        .mydata$strata = .mydata$strata %>% as.factor
        out = map(
            levels(.mydata$strata)
            , function(chr) {
                out2 = .mydata %>% filter(strata == !!chr) %>% as.tibble
                # attr(out2, ".vars4strata") = .vars4strata
                out2
            }
        )
        names(out) = levels(.mydata$strata)
        attr(out, ".vars4strata") = .vars4strata
        attr(out, "function.input") = list(
            data.strata_list = data.strata_list
            , .vars4strata = .vars4strata
        ) # list inside attr() is not shown with str(max.level = 1)
        out
    }
    
    data.Match <- function(
        .mydata
        , .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T
        , RowNum_original_before_strata = NULL
        , apply.na.omit = F
        , print.process = F
        , load.dependent.library = T
    ) {
        # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
        if (load.dependent.library == T) {
            library(tidyverse)
            library(Matching)
            library(tableone)
            # library(useful)
        }
        select = dplyr::select
        .mydata$RowNum_original = 1:nrow(.mydata)
        
        if (length(unique(.mydata[[.exposure]])) < 2) {
            warning("length(unique(.mydata[[.exposure]]) < 2")
            out = list()
            out$data = NA  # need this object to avoid error "attempt to set an attribute on NULL"
            attr(out, "error.message") = "length(unique(.mydata[[.exposure]]) < 2"  # attr() is shown with str(max.level = 1)
            # if (add_tableone_pre_post == T) {
            #     out$tableone_pre = NA
            #     out$tableone_post_total = NA
            #     out$tableone_post_i = NA
            # }
        } else {
            out = list()
            if (add_tableone_pre_post == T) {
                out$tableone_pre = CreateTableOne(vars = .vars4Matching, strata = .exposure, data = .mydata, test=T, includeNA = T)
            }
            
            if (apply.na.omit == T) {
                nrow1 = nrow(.mydata)
                # .mydata = .mydata %>% na.omit
                # nrow2 = nrow(.mydata)
                # print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
                .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")] %>% na.omit 
                .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
                nrow2 = nrow(.mydata.exposure.vars4Matching.na.omit)
                print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
            } else {
                .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")]
                .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
            }
            
            # .X = .mydata.exposure.vars4Matching.na.omit[, .vars4Matching]
            .X = model.matrix(~., .mydata.exposure.vars4Matching.na.omit[, .vars4Matching])
            # .X = build.x(~., .mydata.exposure.vars4Matching.na.omit)
            
            if (print.process == T) {
                print(paste0("data.Match() - dim(.mydata) : ", dim(.mydata) %>% deparse))
                # print(paste0("data.Match() - dim(.mydata.exposure.vars4Matching.na.omit) : ", dim(.mydata.exposure.vars4Matching.na.omit) %>% deparse))
                print(paste0("data.Match() - dim(.X) : ", dim(.X) %>% deparse))
            }
            .mydata.Match = Match(Tr = .mydata.exposure.vars4Matching.na.omit[[.exposure]], M = .MatchingRatio, X = .X, replace = FALSE)
            
            tmpDf = .mydata.Match[c("index.treated","index.control")] %>% as.tibble() %>% mutate(MatchingPairID = as.numeric(as.factor(index.treated)))
            tmpDf$MatchingCtrlNum = 1:.MatchingRatio
            # tmpDf
            
            tmpDf2ctrl = tmpDf[,c("index.control", "MatchingPairID", "MatchingCtrlNum")]
            # names(tmpDf2ctrl)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
            names(tmpDf2ctrl)[1] = "RowNum_after_na.omit"
            # tmpDf2ctrl
            
            tmpDf2tx = tmpDf[,c("index.treated", "MatchingPairID", "MatchingCtrlNum")]
            tmpDf2tx$MatchingCtrlNum = 0
            # names(tmpDf2tx)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
            names(tmpDf2tx)[1] = "RowNum_after_na.omit"
            tmpDf2tx = tmpDf2tx %>% distinct()
            # tmpDf2tx
            
            tmpDf3 = union(tmpDf2tx, tmpDf2ctrl)
            # tmpDf3$rowname = tmpDf3$rowname %>% as.character()  # bug fix 170826 - rowname are altered when apply.na.omit == T
            # tmpDf3 %>% arrange(MatchingPairID, MatchingCtrlNum)
            
            tmpDf4 = left_join(tmpDf3, .mydata.exposure.vars4Matching.na.omit[, c(RowNum_original_before_strata, "RowNum_original", "RowNum_after_na.omit")], by = "RowNum_after_na.omit")
            
            # .mydataMatching = .mydata %>% rownames_to_column() %>% as.tibble()  # bug fix 170826 - rowname are altered when apply.na.omit == T
            # .mydataMatching = inner_join(.mydataMatching, tmpDf3, by = "rowname") %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
            .mydataMatching = inner_join(.mydata, tmpDf4, by = c(RowNum_original_before_strata, "RowNum_original")) %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
            
            # .mydataMatching$MatchingPairID = paste0()
            # .mydataMatching
            out$data = .mydataMatching %>% as.tibble
            if (add_tableone_pre_post == T) {
                out$tableone_post_total = CreateTableOne(
                    vars = .vars4Matching, strata = .exposure
                    , data = .mydataMatching
                    , test=T
                    , includeNA = T)
                out$tableone_post_i = lapply(1:.MatchingRatio, function(i) {
                    CreateTableOne(
                        vars = .vars4Matching, strata = .exposure
                        , data = .mydataMatching %>% filter(MatchingCtrlNum %in% c(0,i))
                        , test=T
                        , includeNA = T)
                })
                names(out$tableone_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
            }
        }
        attr(out$data, ".vars4Matching") = .vars4Matching
        attr(out$data, ".exposure") = .exposure
        attr(out$data, ".MatchingRatio") = .MatchingRatio
        attr(out$data, "apply.na.omit") = apply.na.omit
        attr(out, "function.input") = list(data.Match = data.Match
                                           , .vars4Matching = .vars4Matching
                                           , .exposure = .exposure
                                           , .MatchingRatio = .MatchingRatio
                                           , apply.na.omit = apply.na.omit
        ) # list inside attr() is not shown with str(max.level = 1)
        if(is.data.frame(out$data)) {
            # out$data$RowNum_original = NULL
            out$data$RowNum_after_na.omit = NULL
        }
        out
    }
    
    
    .mydata.strata_list = data.strata_list(.mydata = .mydata, .vars4strata = .vars4strata)
    
    if (print.process == T) {
        .mydata.strata_list.Match = .mydata.strata_list %>% seq_along %>% 
            map(function(i, ...) {
                print(paste0("map to data.Match() with .mydata.strata_list$", names(.mydata.strata_list)[i]))
                out = .mydata.strata_list[[i]] %>% data.Match(...)
                out
            }
            , .vars4Matching = .vars4Matching
            , .exposure = .exposure
            , .MatchingRatio = .MatchingRatio
            , add_tableone_pre_post = F
            , print.process = T
            , load.dependent.library = F
            , apply.na.omit = apply.na.omit
            , RowNum_original_before_strata = "RowNum_original_before_strata"
            )
        names(.mydata.strata_list.Match) = names(.mydata.strata_list)
    } else {
        .mydata.strata_list.Match = .mydata.strata_list %>%
            map(data.Match
                , .vars4Matching = .vars4Matching
                , .exposure = .exposure
                , .MatchingRatio = .MatchingRatio
                , add_tableone_pre_post = F
                , load.dependent.library = F
                , apply.na.omit = apply.na.omit
                , RowNum_original_before_strata = "RowNum_original_before_strata"
            )
    }
    # map = purrr::map
    out = list()
    out$tableone_pre = CreateTableOne(vars = c(.vars4strata, .vars4Matching), strata = .exposure, data = .mydata, test=T, includeNA = T)

    warning_lgl = .mydata.strata_list.Match %>% map_lgl(function(object) {
            as.logical(sum(attr(object, "error.message") == "length(unique(.mydata[[.exposure]]) < 2")) # sum() to avoid error "argument is of length zero" in if()
        })
    # print(paste0("warning_lgl : ", deparse(warning_lgl)))
    # print(paste0("names(.mydata.strata_list.Match) : ", deparse(names(.mydata.strata_list.Match))))
    # print(paste0("names(.mydata.strata_list.Match)[warning_lgl] : ", deparse(names(.mydata.strata_list.Match)[warning_lgl])))
    out$data = .mydata.strata_list.Match[!warning_lgl] %>% map(function(x) x$data) %>% reduce(rbind)
    out$data$MatchingPairID = paste0(out$data$strata, "_", out$data$MatchingPairID) %>% as.factor
    
    if (sum(warning_lgl) > 0) {
        # warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", paste0(warning_which, collapse = ", ")))
        # warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", dput(warning_which)))
        warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", deparse(names(.mydata.strata_list.Match)[warning_lgl])))
    }
    
    out$tableone_post_total = CreateTableOne(
        vars = c(.vars4strata, .vars4Matching), strata = .exposure
        , data = out$data
        , test=T
        , includeNA = T)
    out$tableone_post_i = lapply(1:.MatchingRatio, function(i) {
        CreateTableOne(
            vars = c(.vars4strata, .vars4Matching), strata = .exposure
            , data = out$data %>% filter(MatchingCtrlNum %in% c(0,i))
            , test=T
            , includeNA = T)
    })
    names(out$tableone_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
    
    attr(out$data, ".vars4strata") = .vars4strata
    attr(out$data, ".vars4Matching") = .vars4Matching
    attr(out$data, ".exposure") = .exposure
    attr(out$data, ".MatchingRatio") = .MatchingRatio
    attr(out$data, "apply.na.omit") = apply.na.omit
    attr(out, "function.input") = list(
        data.stratified.Match = data.stratified.Match
        , data.strata_list = data.strata_list
        , data.Match = data.Match
        , .vars4strata
        , .vars4Matching = .vars4Matching
        , .exposure = .exposure
        , .MatchingRatio = .MatchingRatio
        , apply.na.omit = apply.na.omit
    ) # list inside attr() is not shown with str(max.level = 1)
    out$data$RowNum_original = out$data$RowNum_original_before_strata  # these are not unique numbers d/t stratified map
    out$data$RowNum_original_before_strata  = NULL
    out$data$RowNum_after_na.omit = NULL  # these are not unique numbers d/t stratified map
    out
}


#@ test) data.stratified.Match() rhc_mydata -----
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.stratified.Match = rhc_mydata %>% data.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.stratified.Match = rhc_mydata %>% data.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "data.Match() - dim(.mydata) : c(22L, 15L)"
# [1] "data.Match() - dim(.X) : c(22L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$0_[20,30)"
# [1] "data.Match() - dim(.mydata) : c(135L, 15L)"
# [1] "data.Match() - dim(.X) : c(135L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[30,40)"
# [1] "data.Match() - dim(.mydata) : c(242L, 15L)"
# [1] "data.Match() - dim(.X) : c(242L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[40,50)"
# [1] "data.Match() - dim(.mydata) : c(404L, 15L)"
# [1] "data.Match() - dim(.X) : c(404L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[50,60)"
# [1] "data.Match() - dim(.mydata) : c(527L, 15L)"
# [1] "data.Match() - dim(.X) : c(527L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[60,70)"
# [1] "data.Match() - dim(.mydata) : c(802L, 15L)"
# [1] "data.Match() - dim(.X) : c(802L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[70,80)"
# [1] "data.Match() - dim(.mydata) : c(757L, 15L)"
# [1] "data.Match() - dim(.X) : c(757L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[80,90)"
# [1] "data.Match() - dim(.mydata) : c(270L, 15L)"
# [1] "data.Match() - dim(.X) : c(270L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[90,100)"
# [1] "data.Match() - dim(.mydata) : c(32L, 15L)"
# [1] "data.Match() - dim(.X) : c(32L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[10,20)"
# [1] "data.Match() - dim(.mydata) : c(11L, 15L)"
# [1] "data.Match() - dim(.X) : c(11L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$1_[20,30)"
# [1] "data.Match() - dim(.mydata) : c(117L, 15L)"
# [1] "data.Match() - dim(.X) : c(117L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[30,40)"
# [1] "data.Match() - dim(.mydata) : c(211L, 15L)"
# [1] "data.Match() - dim(.X) : c(211L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[40,50)"
# [1] "data.Match() - dim(.mydata) : c(282L, 15L)"
# [1] "data.Match() - dim(.X) : c(282L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[50,60)"
# [1] "data.Match() - dim(.mydata) : c(390L, 15L)"
# [1] "data.Match() - dim(.X) : c(390L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[60,70)"
# [1] "data.Match() - dim(.mydata) : c(587L, 15L)"
# [1] "data.Match() - dim(.X) : c(587L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[70,80)"
# [1] "data.Match() - dim(.mydata) : c(581L, 15L)"
# [1] "data.Match() - dim(.X) : c(581L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[80,90)"
# [1] "data.Match() - dim(.mydata) : c(305L, 15L)"
# [1] "data.Match() - dim(.X) : c(305L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[90,100)"
# [1] "data.Match() - dim(.mydata) : c(57L, 15L)"
# [1] "data.Match() - dim(.X) : c(57L, 4L)"
# Warning messages:
# 1: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")
# 4: Unknown or uninitialised column: 'RowNum_original_before_strata'. 

rhc_mydata.stratified.Match = rhc_mydata %>% data.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
)
# > rhc_mydata.stratified.Match = rhc_mydata %>% data.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# + )
# Warning messages:
# 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")

# library(parallelsugar)
# system.time(
#     rhc_mydata.stratified.Match <- rhc_mydata %>% data.stratified.Match(
#         .vars4strata = c("female", "age.cut")
#         , .vars4Matching = c("age","meanbp1")
#         , .exposure = "treatment"
#         , .MatchingRatio = 5
#         , .parallelsugar = F
#     )
# )
# system.time(
#     rhc_mydata.stratified.Match1 <- rhc_mydata %>% data.stratified.Match(
#         .vars4strata = c("female", "age.cut")
#         , .vars4Matching = c("age","meanbp1")
#         , .exposure = "treatment"
#         , .MatchingRatio = 5
#         , .parallelsugar = T
#     )
# )
# # > system.time(
# # +     rhc_mydata.stratified.Match <- rhc_mydata %>% data.stratified.Match(
# # +         .vars4strata = c("female", "age.cut")
# # +         , .vars4Matching = c("age","meanbp1")
# # +         , .exposure = "treatment"
# # +         , .MatchingRatio = 5
# # +         , .parallelsugar = F
# # +     )
# # + )
# #  사용자  시스템 elapsed 
# #    1.34    0.00    1.34 
# # Warning messages:
# # 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# # 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# # 3: In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
# #   length(unique(.mydata[[.exposure]]) < 2: 
# # c("0_[100,Inf]", "1_[100,Inf]")
# # > system.time(
# # +     rhc_mydata.stratified.Match1 <- rhc_mydata %>% data.stratified.Match(
# # +         .vars4strata = c("female", "age.cut")
# # +         , .vars4Matching = c("age","meanbp1")
# # +         , .exposure = "treatment"
# # +         , .MatchingRatio = 5
# # +         , .parallelsugar = T
# # +     )
# # + )
# #  사용자  시스템 elapsed 
# #    2.97    2.69   52.17 
# # Warning message:
# # In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
# #   length(unique(.mydata[[.exposure]]) < 2: 
# # c("0_[100,Inf]", "1_[100,Inf]")

rhc_mydata.stratified.Match %>% str(max.level = 1)
rhc_mydata.stratified.Match %>% attr("function.input") %>% str
# > rhc_mydata.stratified.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4212 obs. of  18 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:2] "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#   ..- attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5
#  - attr(*, "function.input")=List of 8
# > rhc_mydata.stratified.Match %>% attr("function.input") %>% str
# List of 8
#  $ data.stratified.Match:function (.mydata, .vars4strata = c("female", "age.cut"), .vars4Matching = c("age", "income"), .exposure = "treatment", .MatchingRatio = 5, .paralletlsugar = F, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 25 230 1 25 1 1 230
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000187ec3b0> 
#  $ data.strata_list     :function (.mydata, .vars4strata = c("female", "age.cut"))  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 25 24 48 5 24 5 25 48
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000187ec3b0> 
#  $ data.Match           :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T, apply.na.omit = F, print.process = F, 
#     load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 50 19 152 5 19 5 50 152
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000187ec3b0> 
#  $                      : chr [1:2] "female" "age.cut"
#  $ .vars4Matching       : chr [1:2] "age" "meanbp1"
#  $ .exposure            : chr "treatment"
#  $ .MatchingRatio       : num 5
#  $ apply.na.omit        : logi FALSE

rhc_mydata.Match$data %>% dim
rhc_mydata.stratified.Match$data %>% dim
# > rhc_mydata.Match$data %>% dim
# [1] 4260   17
# > rhc_mydata.stratified.Match$data %>% dim
# [1] 4212   19
4260 - 4212
# > 4260 - 4212
# [1] 48

rhc_mydata.stratified.Match$tableone_pre %>% print(smd = T)
rhc_mydata.stratified.Match$tableone_post_total %>% print(smd = T)
rhc_mydata.stratified.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.stratified.Match$data
# > rhc_mydata.stratified.Match$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age.cut (%)                                      NaN         0.241
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             25 ( 0.7)      8 ( 0.4)                    
#      [20,30)            156 ( 4.4)     96 ( 4.4)                    
#      [30,40)            300 ( 8.4)    153 ( 7.0)                    
#      [40,50)            403 (11.3)    283 (13.0)                    
#      [50,60)            546 (15.4)    371 (17.0)                    
#      [60,70)            812 (22.9)    577 (26.4)                    
#      [70,80)            809 (22.8)    529 (24.2)                    
#      [80,90)            422 (11.9)    153 ( 7.0)                    
#      [90,100)            76 ( 2.1)     13 ( 0.6)                    
#      [100,Inf]            2 ( 0.1)      1 ( 0.0)                    
#   age (mean (sd))     61.76 (17.29) 60.75 (15.63)  0.026       0.061
#   meanbp1 (mean (sd)) 84.87 (38.87) 68.20 (34.24) <0.001       0.455
# > rhc_mydata.stratified.Match$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3510           702                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             20 ( 0.6)      4 ( 0.6)                    
#      [20,30)            155 ( 4.4)     31 ( 4.4)                    
#      [30,40)            300 ( 8.5)     60 ( 8.5)                    
#      [40,50)            400 (11.4)     80 (11.4)                    
#      [50,60)            540 (15.4)    108 (15.4)                    
#      [60,70)            805 (22.9)    161 (22.9)                    
#      [70,80)            805 (22.9)    161 (22.9)                    
#      [80,90)            420 (12.0)     84 (12.0)                    
#      [90,100)            65 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.69 (17.15) 61.79 (16.94)  0.896       0.005
#   meanbp1 (mean (sd)) 84.29 (38.28) 67.72 (33.91) <0.001       0.458
# > rhc_mydata.stratified.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     702           702                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)              4 ( 0.6)      4 ( 0.6)                    
#      [20,30)             31 ( 4.4)     31 ( 4.4)                    
#      [30,40)             60 ( 8.5)     60 ( 8.5)                    
#      [40,50)             80 (11.4)     80 (11.4)                    
#      [50,60)            108 (15.4)    108 (15.4)                    
#      [60,70)            161 (22.9)    161 (22.9)                    
#      [70,80)            161 (22.9)    161 (22.9)                    
#      [80,90)             84 (12.0)     84 (12.0)                    
#      [90,100)            13 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.71 (17.14) 61.79 (16.94)  0.931       0.005
#   meanbp1 (mean (sd)) 84.69 (38.18) 67.72 (33.91) <0.001       0.470
# > rhc_mydata.stratified.Match$data
# # A tibble: 4,212 x 18
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>           <int>         <fctr>           <dbl>
#  1     0     0     0      0     0       0     0      1 19.67400      0     105         1     1 [10,20) 0_[10,20)             201    0_[10,20)_1               0
#  2     0     0     0      0     0       0     0      1 19.35100      0      70         0     0 [10,20) 0_[10,20)             491    0_[10,20)_1               1
#  3     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)             714    0_[10,20)_1               2
#  4     0     0     0      0     0       0     0      1 19.14899      0     103         0     0 [10,20) 0_[10,20)             722    0_[10,20)_1               3
#  5     1     0     0      0     0       0     0      0 19.21999      0     128         0     0 [10,20) 0_[10,20)            1944    0_[10,20)_1               4
#  6     0     0     0      0     0       0     1      0 18.94600      0     112         0     1 [10,20) 0_[10,20)            4091    0_[10,20)_1               5
#  7     0     0     0      0     0       0     0      1 19.85199      0      63         1     1 [10,20) 0_[10,20)            3746    0_[10,20)_2               0
#  8     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)             607    0_[10,20)_2               1
#  9     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)            2647    0_[10,20)_2               2
# 10     1     0     0      0     0       0     0      0 19.70999      0      55         0     1 [10,20) 0_[10,20)            3399    0_[10,20)_2               3
# # ... with 4,202 more rows


#@ test) data.stratified.Match() rhc_mydata.na ----
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.na = rhc_mydata
rhc_mydata.na$age[0:99 * 7 + 1] = NA
rhc_mydata.na$meanbp1[0:99 * 5 + 1] = NA
rhc_mydata.na %>% str
# > rhc_mydata.na %>% str
# 'data.frame':	5735 obs. of  14 variables:
#  $ ARF      : num  0 0 0 1 0 0 0 1 0 1 ...
#  $ CHF      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Cirr     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ colcan   : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Coma     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ lungcan  : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ MOSF     : num  0 0 1 0 0 0 1 0 1 0 ...
#  $ sepsis   : num  0 1 0 0 1 0 0 0 0 0 ...
#  $ age      : num  NA 78.2 46.1 75.3 67.9 ...
#  $ female   : num  0 1 1 1 0 1 0 0 1 1 ...
#  $ meanbp1  : num  NA 63 57 55 65 NA 67 128 53 73 ...
#  $ treatment: num  0 1 1 0 1 0 0 0 0 1 ...
#  $ died     : num  0 1 0 1 1 0 0 1 0 0 ...
#  $ age.cut  : Factor w/ 11 levels "[0,10)","[10,20)",..: 8 8 5 8 7 9 6 5 2 5 ...
rhc_mydata.na.stratified.Match = rhc_mydata.na %>% data.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.na.stratified.Match = rhc_mydata.na %>% data.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "data.Match() - dim(.mydata) : c(22L, 16L)"
# [1] "data.Match() - dim(.X) : c(20L, 3L)"
#  Show Traceback
#  
#  Rerun with Debug
#  Error in Match(Tr = .mydata.exposure.vars4Matching.na.omit[[.exposure]],  : 
#   length(Tr) != nrow(X) 
rhc_mydata.na.stratified.Match = rhc_mydata.na %>% data.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
    , apply.na.omit = T
)
# > rhc_mydata.na.stratified.Match = rhc_mydata.na %>% data.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# +     , apply.na.omit = T
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "apply.na.omit == T : removing 2 rows - from 22 rows to 20 rows"
# [1] "data.Match() - dim(.mydata) : c(22L, 16L)"
# [1] "data.Match() - dim(.X) : c(20L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$0_[20,30)"
# [1] "apply.na.omit == T : removing 0 rows - from 135 rows to 135 rows"
# [1] "data.Match() - dim(.mydata) : c(135L, 16L)"
# [1] "data.Match() - dim(.X) : c(135L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[30,40)"
# [1] "apply.na.omit == T : removing 7 rows - from 242 rows to 235 rows"
# [1] "data.Match() - dim(.mydata) : c(242L, 16L)"
# [1] "data.Match() - dim(.X) : c(235L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[40,50)"
# [1] "apply.na.omit == T : removing 13 rows - from 404 rows to 391 rows"
# [1] "data.Match() - dim(.mydata) : c(404L, 16L)"
# [1] "data.Match() - dim(.X) : c(391L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[50,60)"
# [1] "apply.na.omit == T : removing 17 rows - from 527 rows to 510 rows"
# [1] "data.Match() - dim(.mydata) : c(527L, 16L)"
# [1] "data.Match() - dim(.X) : c(510L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[60,70)"
# [1] "apply.na.omit == T : removing 29 rows - from 802 rows to 773 rows"
# [1] "data.Match() - dim(.mydata) : c(802L, 16L)"
# [1] "data.Match() - dim(.X) : c(773L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[70,80)"
# [1] "apply.na.omit == T : removing 28 rows - from 757 rows to 729 rows"
# [1] "data.Match() - dim(.mydata) : c(757L, 16L)"
# [1] "data.Match() - dim(.X) : c(729L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[80,90)"
# [1] "apply.na.omit == T : removing 9 rows - from 270 rows to 261 rows"
# [1] "data.Match() - dim(.mydata) : c(270L, 16L)"
# [1] "data.Match() - dim(.X) : c(261L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[90,100)"
# [1] "apply.na.omit == T : removing 1 rows - from 32 rows to 31 rows"
# [1] "data.Match() - dim(.mydata) : c(32L, 16L)"
# [1] "data.Match() - dim(.X) : c(31L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[10,20)"
# [1] "apply.na.omit == T : removing 0 rows - from 11 rows to 11 rows"
# [1] "data.Match() - dim(.mydata) : c(11L, 16L)"
# [1] "data.Match() - dim(.X) : c(11L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$1_[20,30)"
# [1] "apply.na.omit == T : removing 3 rows - from 117 rows to 114 rows"
# [1] "data.Match() - dim(.mydata) : c(117L, 16L)"
# [1] "data.Match() - dim(.X) : c(114L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[30,40)"
# [1] "apply.na.omit == T : removing 9 rows - from 211 rows to 202 rows"
# [1] "data.Match() - dim(.mydata) : c(211L, 16L)"
# [1] "data.Match() - dim(.X) : c(202L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[40,50)"
# [1] "apply.na.omit == T : removing 12 rows - from 282 rows to 270 rows"
# [1] "data.Match() - dim(.mydata) : c(282L, 16L)"
# [1] "data.Match() - dim(.X) : c(270L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[50,60)"
# [1] "apply.na.omit == T : removing 7 rows - from 390 rows to 383 rows"
# [1] "data.Match() - dim(.mydata) : c(390L, 16L)"
# [1] "data.Match() - dim(.X) : c(383L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[60,70)"
# [1] "apply.na.omit == T : removing 16 rows - from 587 rows to 571 rows"
# [1] "data.Match() - dim(.mydata) : c(587L, 16L)"
# [1] "data.Match() - dim(.X) : c(571L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[70,80)"
# [1] "apply.na.omit == T : removing 19 rows - from 581 rows to 562 rows"
# [1] "data.Match() - dim(.mydata) : c(581L, 16L)"
# [1] "data.Match() - dim(.X) : c(562L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[80,90)"
# [1] "apply.na.omit == T : removing 9 rows - from 305 rows to 296 rows"
# [1] "data.Match() - dim(.mydata) : c(305L, 16L)"
# [1] "data.Match() - dim(.X) : c(296L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[90,100)"
# [1] "apply.na.omit == T : removing 4 rows - from 57 rows to 53 rows"
# [1] "data.Match() - dim(.mydata) : c(57L, 16L)"
# [1] "data.Match() - dim(.X) : c(53L, 3L)"
# Warning messages:
# 1: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")
rhc_mydata.na.stratified.Match = rhc_mydata.na %>% data.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = F
    , apply.na.omit = T
)
# > rhc_mydata.na.stratified.Match = rhc_mydata.na %>% data.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = F
# +     , apply.na.omit = T
# + )
# [1] "apply.na.omit == T : removing 2 rows - from 22 rows to 20 rows"
# [1] "apply.na.omit == T : removing 0 rows - from 135 rows to 135 rows"
# [1] "apply.na.omit == T : removing 7 rows - from 242 rows to 235 rows"
# [1] "apply.na.omit == T : removing 13 rows - from 404 rows to 391 rows"
# [1] "apply.na.omit == T : removing 17 rows - from 527 rows to 510 rows"
# [1] "apply.na.omit == T : removing 29 rows - from 802 rows to 773 rows"
# [1] "apply.na.omit == T : removing 28 rows - from 757 rows to 729 rows"
# [1] "apply.na.omit == T : removing 9 rows - from 270 rows to 261 rows"
# [1] "apply.na.omit == T : removing 1 rows - from 32 rows to 31 rows"
# [1] "apply.na.omit == T : removing 0 rows - from 11 rows to 11 rows"
# [1] "apply.na.omit == T : removing 3 rows - from 117 rows to 114 rows"
# [1] "apply.na.omit == T : removing 9 rows - from 211 rows to 202 rows"
# [1] "apply.na.omit == T : removing 12 rows - from 282 rows to 270 rows"
# [1] "apply.na.omit == T : removing 7 rows - from 390 rows to 383 rows"
# [1] "apply.na.omit == T : removing 16 rows - from 587 rows to 571 rows"
# [1] "apply.na.omit == T : removing 19 rows - from 581 rows to 562 rows"
# [1] "apply.na.omit == T : removing 9 rows - from 305 rows to 296 rows"
# [1] "apply.na.omit == T : removing 4 rows - from 57 rows to 53 rows"
# Warning messages:
# 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")




rhc_mydata.na.stratified.Match %>% str(max.level = 1)
rhc_mydata.na.stratified.Match %>% attr("function.input") %>% str
# > rhc_mydata.na.stratified.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4086 obs. of  19 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:2] "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi TRUE
#   ..- attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5
#  - attr(*, "function.input")=List of 8
# > rhc_mydata.na.stratified.Match %>% attr("function.input") %>% str
# List of 8
#  $ data.stratified.Match:function (.mydata, .vars4strata = c("female", "age.cut"), .vars4Matching = c("age", "income"), .exposure = "treatment", 
#     .MatchingRatio = 5, .paralletlsugar = F, apply.na.omit = F, print.process = F, load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 25 246 1 25 1 1 246
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000268d6bf8> 
#  $ data.strata_list     :function (.mydata, .vars4strata = c("female", "age.cut"))  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 25 24 48 5 24 5 25 48
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000268d6bf8> 
#  $ data.Match           :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 50 19 166 5 19 5 50 166
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000268d6bf8> 
#  $                      : chr [1:2] "female" "age.cut"
#  $ .vars4Matching       : chr [1:2] "age" "meanbp1"
#  $ .exposure            : chr "treatment"
#  $ .MatchingRatio       : num 5
#  $ apply.na.omit        : logi TRUE

rhc_mydata.Match$data %>% dim
rhc_mydata.stratified.Match$data %>% dim
rhc_mydata.na.stratified.Match$data %>% dim
# > rhc_mydata.Match$data %>% dim
# [1] 4260   17
# > rhc_mydata.stratified.Match$data %>% dim
# [1] 4212   19
# > rhc_mydata.na.stratified.Match$data %>% dim
# [1] 4086   19
4260 - 4086
# > 4260 - 4086
# [1] 174


rhc_mydata.na.stratified.Match$tableone_pre %>% print(smd = T)
rhc_mydata.na.stratified.Match$tableone_post_total %>% print(smd = T)
rhc_mydata.na.stratified.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.na.stratified.Match$data
# > rhc_mydata.na.stratified.Match$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age.cut (%)                                      NaN         0.241
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             25 ( 0.7)      8 ( 0.4)                    
#      [20,30)            156 ( 4.4)     96 ( 4.4)                    
#      [30,40)            300 ( 8.4)    153 ( 7.0)                    
#      [40,50)            403 (11.3)    283 (13.0)                    
#      [50,60)            546 (15.4)    371 (17.0)                    
#      [60,70)            812 (22.9)    577 (26.4)                    
#      [70,80)            809 (22.8)    529 (24.2)                    
#      [80,90)            422 (11.9)    153 ( 7.0)                    
#      [90,100)            76 ( 2.1)     13 ( 0.6)                    
#      [100,Inf]            2 ( 0.1)      1 ( 0.0)                    
#   age (mean (sd))     61.68 (17.28) 60.71 (15.62)  0.034       0.059
#   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# > rhc_mydata.na.stratified.Match$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3405           681                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             20 ( 0.6)      4 ( 0.6)                    
#      [20,30)            150 ( 4.4)     30 ( 4.4)                    
#      [30,40)            290 ( 8.5)     58 ( 8.5)                    
#      [40,50)            385 (11.3)     77 (11.3)                    
#      [50,60)            525 (15.4)    105 (15.4)                    
#      [60,70)            780 (22.9)    156 (22.9)                    
#      [70,80)            785 (23.1)    157 (23.1)                    
#      [80,90)            405 (11.9)     81 (11.9)                    
#      [90,100)            65 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.72 (17.17) 61.77 (16.88)  0.941       0.003
#   meanbp1 (mean (sd)) 84.27 (38.26) 68.20 (34.25) <0.001       0.443
# > rhc_mydata.na.stratified.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     681           681                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)              4 ( 0.6)      4 ( 0.6)                    
#      [20,30)             30 ( 4.4)     30 ( 4.4)                    
#      [30,40)             58 ( 8.5)     58 ( 8.5)                    
#      [40,50)             77 (11.3)     77 (11.3)                    
#      [50,60)            105 (15.4)    105 (15.4)                    
#      [60,70)            156 (22.9)    156 (22.9)                    
#      [70,80)            157 (23.1)    157 (23.1)                    
#      [80,90)             81 (11.9)     81 (11.9)                    
#      [90,100)            13 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.73 (17.12) 61.77 (16.88)  0.965       0.002
#   meanbp1 (mean (sd)) 84.87 (38.44) 68.20 (34.25) <0.001       0.458
# > rhc_mydata.na.stratified.Match$data
# # A tibble: 4,086 x 18
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>           <int>         <fctr>           <dbl>
#  1     0     0     0      0     0       0     0      1 19.85199      0      63         1     1 [10,20) 0_[10,20)            3746    0_[10,20)_1               0
#  2     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)             607    0_[10,20)_1               1
#  3     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)             714    0_[10,20)_1               2
#  4     1     0     0      0     0       0     0      0 19.70999      0      55         0     1 [10,20) 0_[10,20)            3399    0_[10,20)_1               3
#  5     1     0     0      0     0       0     0      0 19.75099      0      53         0     0 [10,20) 0_[10,20)            4066    0_[10,20)_1               4
#  6     1     0     0      0     0       0     0      0 19.82999      0      63         0     0 [10,20) 0_[10,20)            4568    0_[10,20)_1               5
#  7     1     0     0      0     0       0     0      0 19.81899      0      17         1     0 [10,20) 0_[10,20)            4020    0_[10,20)_2               0
#  8     0     0     0      0     0       0     0      1 18.84999      0      63         0     0 [10,20) 0_[10,20)            1949    0_[10,20)_2               1
#  9     0     0     0      0     0       0     0      1 18.41499      0      53         0     0 [10,20) 0_[10,20)            2553    0_[10,20)_2               2
# 10     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)            2647    0_[10,20)_2               3
# # ... with 4,076 more rows


rhc_mydata.na.stratified.Match$data %>% summary
# rhc_mydata.na.stratified.Match$data$RowNum_original_before_strata %>% unique %>% length
# rhc_mydata.na.stratified.Match$data$RowNum_original %>% unique %>% length
# rhc_mydata.na.stratified.Match$data$RowNum_after_na.omit %>% unique %>% length
# # > rhc_mydata.na.stratified.Match$data$RowNum_original_before_strata %>% unique %>% length
# # [1] 4086
# # > rhc_mydata.na.stratified.Match$data$RowNum_original %>% unique %>% length
# # [1] 741
# # > rhc_mydata.na.stratified.Match$data$RowNum_after_na.omit %>% unique %>% length
# # [1] 719
rhc_mydata.na.stratified.Match$data$RowNum_original %>% unique %>% length
# > rhc_mydata.na.stratified.Match$data$RowNum_original %>% unique %>% length
# [1] 4086


#@ end -----
