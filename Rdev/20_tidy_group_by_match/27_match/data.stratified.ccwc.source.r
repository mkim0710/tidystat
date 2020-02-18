# source("https://github.com/mkim0710/tidystat/raw/master/R/data.stratified.ccwc.source.r")

#@ to do ----
#@ .entry_age_of_Case
#@ EndTime.of.Case
# 
# dataset %>% 
#     filter(MatchingCtrlNum == 0) %>% 
#     select(MatchingPairID1_1, .exit_age) %>% rename(.exit_age_of_Case = .exit_age)
# # > dataset %>% 
# # +     filter(MatchingCtrlNum == 0) %>% 
# # +     select(MatchingPairID1_1, .exit_age) %>% rename(.exit_age_of_Case = .exit_age)
# # # A tibble: 10,299 x 2
# #    MatchingPairID1_1                    .exit_age_of_Case
# #    <fct>                                            <dbl>
# #  1 1|10|1q|11_36| TRUE|FALSE|FALSE_2_1              13969
# #  2 1|10|1q|11_36| TRUE|FALSE|FALSE_4_1              14060
# #  3 1|10|1q|11_36| TRUE|FALSE|FALSE_7_1              15917
# #  4 1|10|1q|11_36|FALSE|FALSE| TRUE_23_2             14364
# #  5 1|10|1q|11_36|FALSE|FALSE| TRUE_24_1             14487
# #  6 1|10|1q|11_36|FALSE|FALSE| TRUE_25_1             14548
# #  7 1|10|1q|11_36|FALSE|FALSE| TRUE_26_1             14729
# #  8 1|10|1q|11_36|FALSE|FALSE| TRUE_27_1             14790
# #  9 1|10|1q|11_36|FALSE|FALSE| TRUE_28_1             14821
# # 10 1|10|1q|11_36|FALSE|FALSE| TRUE_29_1             15005
# # # ... with 10,289 more rows
# 
# dataset = dataset %>% 
#     left_join(
#         dataset %>%
#             filter(MatchingCtrlNum == 0) %>% 
#             select(MatchingPairID1_1, .exit_age) %>% rename(.exit_age_of_Case = .exit_age)
#     )


#@ data.ccwc = function( - debug 180519 v5 =====
data.ccwc = function(
    .mydata
    , ...
    , varname4event = "failure"
    , varname4entry = ".entry_age"
    , varname4exit = ".exit_age"
    , varname4origin = NULL
    , .MatchingRatio = 2
    , seed = 1
    , add_tableone_pre_post = F
    , RowNum_original_before_strata = NULL
    , apply.na.omit = F
    , print.process = F
    , load.dependent.library = T
    , apply.function.dichotomous2logical = F
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/R/data.stratified.ccwc.source.r")
    if (load.dependent.library == T) {
        library(tidyverse)
        # library(tableone)
    }
    select = dplyr::select
    
    Call <- match.call(expand.dots = TRUE)
    
    # if (is.null(.mydata$RowNum_original)) {
    # if (!exists(.mydata$RowNum_original)) {
    if (!"RowNum_original" %in% colnames(.mydata)) {  # debug 180519 v5
        .mydata$RowNum_original = 1:nrow(.mydata)
    }

    function.dichotomous2logical = function(x, dichotomous2integer = F) {
        # source("https://github.com/mkim0710/tidystat/raw/master/function.dichotomous2logical.source.r")
        # caution) as.numeric(CategoricalVariable_3MoreLevels)
        if (is.numeric(x)) {
            x = as.character(x)
        }
        if (is.character(x)) {
            x = as.factor(x)
        }
        # if (length(levels(x)) == 1) {
        #     print("length(levels(x)) == 1")
        # }
        if (length(unique(x)) == 1) {
            print("length(unique(x)) == 1")
        }
        if (!is.null(levels(x))) {
            if (length(levels(x)) %in% 1:2) {
                if (dichotomous2integer == T) {
                    print(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to 0 & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to 1"))
                } else {
                    print(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to FALSE & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to TRUE"))
                }
                x = as.integer(x) - 1
            } else if (length(levels(x)) > 2) {
                stop("length(levels(x)) > 2")
            }
        }
        if (dichotomous2integer == T) {
            x = as.integer(x)
        } else {
            x = as.logical(x)
        }
        x
    }
    
    .mydata[[".event"]] = .mydata[[varname4event]]
    if (apply.function.dichotomous2logical == T) .mydata[[".event"]] = .mydata[[varname4event]] %>% function.dichotomous2logical  # debug 180519 v5

    if(!is.character(varname4entry)) {
        stop("!is.character(varname4entry)")
    } else if (!is.character(varname4exit)) {
        stop("!is.character(varname4exit)")
    } else if (is.numeric(varname4origin)) {
        stop("is.numeric(varname4origin)")
    } else {
        
        .mydata[[".entry_age"]] = .mydata[[varname4entry]]
        .mydata[[".exit_age"]] = .mydata[[varname4exit]]
        
        # debug 180516
        # browser()
        # Browse[2]> str(.mydata[[".entry_age"]])
        # Date[1:26], format: "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" "2002-01-01" ...
        if(!is.numeric(.mydata[[".entry_age"]])) .mydata[[".entry_age"]] = as.numeric(.mydata[[".entry_age"]])
        if(!is.numeric(.mydata[[".exit_age"]])) .mydata[[".exit_age"]] = as.numeric(.mydata[[".exit_age"]])
        # Browse[2]> str(.mydata[[".entry_age"]])
        # num [1:26] 11688 11688 11688 11688 11688 ...
        
        if(!is.null(varname4origin)) {
            # debug 180516
            if(!is.numeric(.mydata[[varname4origin]])) {
                .mydata[[".entry_age"]] = .mydata[[".entry_age"]] - as.numeric(.mydata[[varname4origin]])
                .mydata[[".exit_age"]] = .mydata[[".exit_age"]] - as.numeric(.mydata[[varname4origin]])
            } else {
                .mydata[[".entry_age"]] = .mydata[[".entry_age"]] - .mydata[[varname4origin]]
                .mydata[[".exit_age"]] = .mydata[[".exit_age"]] - .mydata[[varname4origin]]
            }
        }
    }

    # if (apply.na.omit == T) {
    #     nrow1 = nrow(.mydata)
    #     # .mydata = .mydata %>% na.omit
    #     # nrow2 = nrow(.mydata)
    #     # print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
    #     .mydata.event.entry.exit.na.omit = .mydata[, c(varname4event, ".entry_age", ".exit_age", RowNum_original_before_strata, "RowNum_original")] %>% na.omit 
    #     .mydata.event.entry.exit.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.event.entry.exit.na.omit)
    #     nrow2 = nrow(.mydata.event.entry.exit.na.omit)
    #     print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
    # } else {
    #     .mydata.event.entry.exit.na.omit = .mydata[, c(varname4event, ".entry_age", ".exit_age", RowNum_original_before_strata, "RowNum_original")]
    #     .mydata.event.entry.exit.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.event.entry.exit.na.omit)
    # }
    #     
    # if (apply.function.dichotomous2logical == T) {
    #     .mydata.event.entry.exit.na.omit.event.logical = function.dichotomous2logical(.mydata.event.entry.exit.na.omit[[varname4event]])
    # } else {
    #     .mydata.event.entry.exit.na.omit.event.logical = .mydata.event.entry.exit.na.omit[[varname4event]]
    # }
    # 
    # # if (!identical( unique(.mydata.event.entry.exit.na.omit.event.logical), c(F, T) )) {  # This set is a superset of (length(unique(.mydata[[varname4event]])) < 2)
    # if (!identical( sort(as.integer(unique(.mydata.event.entry.exit.na.omit.event.logical))), 0:1 )) {
    #     print("!identical( sort(as.integer(unique(.mydata.event.entry.exit.na.omit.event.logical))), 0:1 )")
    #     out = list()
    #     attr(out, "error.message0") = "!identical( sort(as.integer(unique(.mydata.event.entry.exit.na.omit.event.logical))), 0:1 )"  # attr() is shown with str(max.level = 1)
    # }
    if (length(unique(.mydata[[varname4event]])) < 2) {  # This set is a subset of (!identical( as.integer(unique(.mydata.event.entry.exit.na.omit.event.logical)), 0:1 ))
        print("length(unique(.mydata[[varname4event]]) < 2")
        out = list()
        # out$data = NA  # need this object to avoid error "attempt to set an attribute on NULL"
        # debug 180519 v5
        out$data = .mydata %>%  mutate(
            MatchingPairID = NA
            , MatchingCtrlNum = NA
            , is.Case = NA
            , is.Ctrl.Candidate = NA
            , is.assigned = NA
        )
        attr(out, "error.message") = "length(unique(.mydata[[varname4event]])) < 2"  # attr() is shown with str(max.level = 1)
        
        # if (add_tableone_pre_post == T) {
        #     out$tableone_pre = NA
        #     out$tableone_post_total = NA
        #     out$tableone_post_i = NA
        # }
    } else {
        out = list()
        # if (add_tableone_pre_post == T) {
        #     out$tableone_pre = CreateTableOne(vars = c(varname4entry, varname4exit), strata = varname4event, data = .mydata, test=T, includeNA = T)
        #     # # debug 180516
        #     # out$tableone_pre = CreateTableOne(vars = c(varname4entry, varname4exit), strata = varname4event, data = map_df(, function(x) ifelse(is.factor(x), as.character(x), x)), test=T, includeNA = T)
        # }

        .mydata = .mydata %>%  mutate(
            MatchingPairID = 999999999L
            , MatchingCtrlNum = 999999999L
            , is.Case = F
            , is.Ctrl.Candidate = T
            , is.assigned = F
        )
        .event.exit_age.unique.sort = .mydata %>% filter(.event == T) %>% select(.exit_age) %>% unlist %>% unname %>% unique %>% sort
        # Browse[2]> .event.exit_age.unique.sort %>% str
        # num 14790
        # print(paste0(".event.exit_age.unique.sort: ", deparse(.event.exit_age.unique.sort) ))
        incomplete = 0
        ## ccwc() 140 ties <- FALSE
        ties <- FALSE
        
        ## ccwc() 146 for (tf in ft) {
        .mydata.ccwc = .mydata
        for (i in 1:length(.event.exit_age.unique.sort)) {
            if(print.process == T) print(paste0("*** ", i, "-th iteration for .event.exit_age.unique.sort: ", .event.exit_age.unique.sort[i]))

            ## ccwc() 151 case <- (grp==g) & (t.exit==tf) & (fail!=0)
            # Q) original code -> did not sort.. no problem?
            # which.Case = which({ ({ abs(.mydata.ccwc[[".exit_age"]] - .event.exit_age.unique.sort[i]) < 0.001 }) & .mydata.ccwc[[".event"]] == T })  # error - this case may have already been assigned as control
            if (class(.mydata.ccwc[[".exit_age"]]) == "numeric") {
                which.Case = which({ ({ abs(.mydata.ccwc[[".exit_age"]] - .event.exit_age.unique.sort[i]) < 0.001 }) & .mydata.ccwc[[".event"]] == T & .mydata.ccwc$is.assigned == F })  # this case may have already been assigned as control
            } else if (class(.mydata.ccwc[[".exit_age"]]) %in% c("integer", "Date")) {
                which.Case = which({ ({ .mydata.ccwc[[".exit_age"]] == .event.exit_age.unique.sort[i] }) & .mydata.ccwc[[".event"]] == T & .mydata.ccwc$is.assigned == F })  # this case may have already been assigned as control
            }  # debug 180516

            # Browse[2]> which.Case %>% str
            # int 2
            if(print.process == T) print(paste0("which.Case: ", deparse(which.Case)))
            if (length(which.Case) == 0) {
                print(paste0("*** Caution) ", i, "-th iteration for: ", .event.exit_age.unique.sort[i], " -> this case may have already been assigned as control"))
            } else {
                .mydata.ccwc[which.Case, c("is.Case", "is.assigned")] = T
                .mydata.ccwc[which.Case, c("is.Ctrl.Candidate")] = F
                .mydata.ccwc[which.Case, c("MatchingPairID")] = i
                .mydata.ccwc[which.Case, c("MatchingCtrlNum")] = 0L

                ## ccwc() 155 noncase <- (grp==g) & (t.entry<=tf) & (t.exit>=tf) & !case
                # Q) one can be control for multiple cases? => .mydata.ccwc$is.Ctrl.Candidate == T
                # Q) why (t.entry<=tf)?

                which.Ctrl.Candidate = which({ .mydata.ccwc$is.Ctrl.Candidate == T & (.mydata.ccwc[[".entry_age"]] <= .event.exit_age.unique.sort[i]) & (.mydata.ccwc[[".exit_age"]] >= .event.exit_age.unique.sort[i]) })
                # which.Ctrl.Candidate %>% str
                # print(.mydata.ccwc[c(which.Case, which.Ctrl.Candidate), ] %>% select(RowNum_original, .entry_age, .exit_age, varname4event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned))
                if(print.process == T) print(paste0("which.Ctrl.Candidate: ", deparse(which.Ctrl.Candidate)))
				
				if (length(which.Ctrl.Candidate) == 0) {  # debug 180519
					print(paste0("length(which.Ctrl.Candidate) == 0 ", "for .mydata.ccwc[which.Case,], where which.Case is: ", deparse(which.Case) ))
				} else {
					## ccwc() 160 if (controls*ncase > sum(noncase) & controls*ncase > 0) {incomplete = incomplete + 1}
					## ccwc() 159 ncont = min(controls*ncase, sum(noncase))
					if(.MatchingRatio*length(which.Case) > length(which.Ctrl.Candidate)) {incomplete = incomplete + 1}
					tmp.nCtrl = min(.MatchingRatio*length(which.Case), length(which.Ctrl.Candidate))
					if(print.process == T) print(paste0("incomplete: ", incomplete))
					if(print.process == T) print(paste0("tmp.nCtrl: ", tmp.nCtrl))


					## ccwc() 169 pr[(nn+ncase+1):(newnn)] <- sample((1:n)[noncase], size=ncont)
					## ccwc() 169 pr[(nn+ncase+1):(newnn)] <- sample(which(noncase == T), size=ncont)
					set.seed(seed + i)
					if(print.process == T) print(paste0("set.seed: ", seed + i))
					which.Ctrl = sample(which.Ctrl.Candidate, size = tmp.nCtrl)
					if(print.process == T) print(paste0("which.Ctrl: ", deparse(which.Ctrl)))

					.mydata.ccwc[which.Ctrl, c("is.assigned")] = T
					.mydata.ccwc[which.Ctrl, c("is.Ctrl.Candidate")] = F
					.mydata.ccwc[which.Ctrl, c("MatchingPairID")] = i
					.mydata.ccwc[which.Ctrl, c("MatchingCtrlNum")] = 1:{length(which.Ctrl)/length(which.Case)}
					if(print.process == T) print(.mydata.ccwc[c(which.Case, which.Ctrl), ] %>% select(RowNum_original, .entry_age, .exit_age, varname4event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned))
					if(length(which.Ctrl) > 0) {  # debug 180516
						if(any(.mydata.ccwc[which.Ctrl, ".event"] == T)) {
							print(paste0("*** Caution) a future case has been assigned as a control - RowNum_original: ", deparse(.mydata.ccwc[{which.Ctrl[.mydata.ccwc[which.Ctrl, ".event"] == T]}, ]$RowNum_original) ))
						}
					}

					## ccwc() 154 ties <- TRUE
					if(length(which.Case) > 1) {
						ties <- TRUE
						print(paste0("** ties in RowNum_original: ", deparse(.mydata.ccwc[which.Case, ]$RowNum_original) ))
					}
				}
            }
        }
        # stopifnot(nrow(.mydata) == nrow(.mydata.ccwc))  # debug 180519 v4
        # out$data = .mydata.ccwc %>% select(RowNum_original, .entry_age, .exit_age, varname4event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned) %>% arrange(MatchingPairID, MatchingCtrlNum)
        out$data = .mydata.ccwc %>% arrange(MatchingPairID, MatchingCtrlNum)
            
        # .mydata.ccwc$.new.label = c("Control", "Case")[as.numeric(.mydata.ccwc$MatchingCtrlNum == 0)+1]
        
        # if (add_tableone_pre_post == T) {
        #     out$tableone_post_total = CreateTableOne(
        #         vars = c(varname4entry, varname4exit), strata = "is.Case"
        #         , data = filter(.mydata.ccwc, is.assigned == T)
        #         , test=T
        #         , includeNA = T)
        #     # # debug 180516
        #     # out$tableone_post_total = CreateTableOne(
        #     #     vars = c(varname4entry, varname4exit), strata = "is.Case"
        #     #     , data = map_df(filter(.mydata.ccwc, is.assigned == T), function(x) ifelse(is.factor(x), as.character(x), x))
        #     #     , test=T
        #     #     , includeNA = T)
        #     
        #     # out$tableone_post_i = lapply(1:.MatchingRatio, function(i) {
        #     #     CreateTableOne(
        #     #         vars = c(varname4entry, varname4exit), strata = varname4event
        #     #         , data = .mydata.ccwc %>% filter(MatchingCtrlNum %in% c(0,i))
        #     #         , test=T
        #     #         , includeNA = T)
        #     # })
        #     # names(out$tableone_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
        # }
        
    }
    attr(out$data, ".event") = varname4event
    attr(out$data, ".entry") = varname4entry
    attr(out$data, ".exit") = varname4exit
    attr(out$data, ".origin") = varname4origin
    attr(out$data, ".MatchingRatio") = .MatchingRatio
    attr(out$data, "apply.na.omit") = apply.na.omit
    # attr(out, "function.input") = match.call(expand.dots = TRUE)   # list inside attr() is not shown with str(max.level = 1)
    attr(out, "function.input") = list(
        Call = match.call(expand.dots = TRUE)
        , fun = data.ccwc
        , varname4event = varname4event
        , varname4entry = varname4entry
        , varname4exit = varname4exit
        , varname4origin = varname4origin
        , .MatchingRatio = .MatchingRatio
        , apply.na.omit = apply.na.omit
        , apply.function.dichotomous2logical = apply.function.dichotomous2logical
    ) # list inside attr() is not shown with str(max.level = 1)
    if(is.data.frame(out$data)) {
        # outdataRowNum_original = NULL
        out$data$RowNum_after_na.omit = NULL
    }
    out
}


#@ test) data.ccwc() mycohort_1strata_tie ----
library(tidyverse)
mycohort_1strata_tie = tibble::tribble(
    ~RowNum_original, ~entry_age, ~exit_age, ~event,              ~strata,
                125L,        31L,        42,   TRUE, "Driver|>2750 KCals",
                143L,        61L,        68,   TRUE, "Driver|>2750 KCals",
                170L,        46L,        56,   TRUE, "Driver|>2750 KCals",
                221L,        50L,        67,  FALSE, "Driver|>2750 KCals",
                236L,        59L,        70,  FALSE, "Driver|>2750 KCals",
                244L,        49L,        65,   TRUE, "Driver|>2750 KCals",
                247L,        60L,        70,  FALSE, "Driver|>2750 KCals",
                249L,        59L,        65,   TRUE, "Driver|>2750 KCals",
                258L,        57L,        70,  FALSE, "Driver|>2750 KCals",
                284L,        40L,        57,  FALSE, "Driver|>2750 KCals",
                315L,        47L,        63,  FALSE, "Driver|>2750 KCals",
                322L,        38L,        49,  FALSE, "Driver|>2750 KCals"
    )
mycohort_1strata_tie %>% as.tibble
# > mycohort_1strata_tie %>% as.tibble
# # A tibble: 12 x 5
#    RowNum_original entry_age exit_age event             strata
#              <int>     <int>    <dbl> <lgl>             <fctr>
#  1             125        31       42  TRUE Driver|>2750 KCals
#  2             143        61       68  TRUE Driver|>2750 KCals
#  3             170        46       56  TRUE Driver|>2750 KCals
#  4             221        50       67 FALSE Driver|>2750 KCals
#  5             236        59       70 FALSE Driver|>2750 KCals
#  6             244        49       65  TRUE Driver|>2750 KCals
#  7             247        60       70 FALSE Driver|>2750 KCals
#  8             249        59       65  TRUE Driver|>2750 KCals
#  9             258        57       70 FALSE Driver|>2750 KCals
# 10             284        40       57 FALSE Driver|>2750 KCals
# 11             315        47       63 FALSE Driver|>2750 KCals
# 12             322        38       49 FALSE Driver|>2750 KCals


mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = T) %>% str(max.level = 1) #----
# > mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = T) %>% str(max.level = 1) #----
# [1] "*** 1-th iteration for .event.exit_age.unique.sort: 42"
# [1] "which.Case: 1L"
# [1] "which.Ctrl.Candidate: c(10L, 12L)"
# [1] "incomplete: 0"
# [1] "tmp.nCtrl: 2"
# [1] "set.seed: 2"
# [1] "which.Ctrl: c(10L, 12L)"
# # A tibble: 3 x 10
#   RowNum_original .entry_age .exit_age event strata             MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#             <int>      <int>     <dbl> <lgl> <fct>                       <int>           <int> <lgl>   <lgl>             <lgl>      
# 1             125         31        42 TRUE  Driver|>2750 KCals              1               0 TRUE    FALSE             TRUE       
# 2             284         40        57 FALSE Driver|>2750 KCals              1               1 FALSE   FALSE             TRUE       
# 3             322         38        49 FALSE Driver|>2750 KCals              1               2 FALSE   FALSE             TRUE       
# [1] "*** 2-th iteration for .event.exit_age.unique.sort: 56"
# [1] "which.Case: 3L"
# [1] "which.Ctrl.Candidate: c(4L, 6L, 11L)"
# [1] "incomplete: 0"
# [1] "tmp.nCtrl: 2"
# [1] "set.seed: 3"
# [1] "which.Ctrl: c(4L, 6L)"
# # A tibble: 3 x 10
#   RowNum_original .entry_age .exit_age event strata             MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#             <int>      <int>     <dbl> <lgl> <fct>                       <int>           <int> <lgl>   <lgl>             <lgl>      
# 1             170         46        56 TRUE  Driver|>2750 KCals              2               0 TRUE    FALSE             TRUE       
# 2             221         50        67 FALSE Driver|>2750 KCals              2               1 FALSE   FALSE             TRUE       
# 3             244         49        65 TRUE  Driver|>2750 KCals              2               2 FALSE   FALSE             TRUE       
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 244L"
# [1] "*** 3-th iteration for .event.exit_age.unique.sort: 65"
# [1] "which.Case: 8L"
# [1] "which.Ctrl.Candidate: c(2L, 5L, 7L, 9L)"
# [1] "incomplete: 0"
# [1] "tmp.nCtrl: 2"
# [1] "set.seed: 4"
# [1] "which.Ctrl: c(7L, 2L)"
# # A tibble: 3 x 10
#   RowNum_original .entry_age .exit_age event strata             MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#             <int>      <int>     <dbl> <lgl> <fct>                       <int>           <int> <lgl>   <lgl>             <lgl>      
# 1             249         59        65 TRUE  Driver|>2750 KCals              3               0 TRUE    FALSE             TRUE       
# 2             247         60        70 FALSE Driver|>2750 KCals              3               1 FALSE   FALSE             TRUE       
# 3             143         61        68 TRUE  Driver|>2750 KCals              3               2 FALSE   FALSE             TRUE       
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 143L"
# [1] "*** 4-th iteration for .event.exit_age.unique.sort: 68"
# [1] "which.Case: integer(0)"
# [1] "*** Caution) 4-th iteration for: 68 -> this case may have already been assigned as control"
# List of 1
#  $ data:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	12 obs. of  13 variables:
#   ..- attr(*, ".event")= chr "event"
#   ..- attr(*, ".entry")= chr "entry_age"
#   ..- attr(*, ".exit")= chr "exit_age"
#   ..- attr(*, ".MatchingRatio")= num 2
#   ..- attr(*, "apply.na.omit")= logi FALSE
#  - attr(*, "function.input")=List of 9

mycohort_1strata_tie %>% mutate(origin = 30) %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = "origin", print.process = F) %>% str(max.level = 1)
mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = F) %>% str(max.level = 1)
mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = F) %>% {.[c(2, 1, 3)]}
mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = F)
# > mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = F) %>% str(max.level = 1)
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 244L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 143L"
# [1] "*** Caution) 4-th iteration for: 68 -> this case may have already been assigned as control"
# List of 3
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	12 obs. of  13 variables:
#   ..- attr(*, ".event")= chr "event"
#   ..- attr(*, ".entry")= chr "entry_age"
#   ..- attr(*, ".exit")= chr "exit_age"
#   ..- attr(*, ".MatchingRatio")= num 2
#   ..- attr(*, "apply.na.omit")= logi FALSE
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  - attr(*, "function.input")=List of 9
# > mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = F) %>% {.[c(2, 1, 3)]}
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 244L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 143L"
# [1] "*** Caution) 4-th iteration for: 68 -> this case may have already been assigned as control"
# $data
# # A tibble: 12 x 13
#    RowNum_original entry_age exit_age event strata             .event .entry_age .exit_age MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#              <int>     <int>    <dbl> <lgl> <fct>              <lgl>       <int>     <dbl>          <int>           <dbl> <lgl>   <lgl>             <lgl>      
#  1             125        31       42 TRUE  Driver|>2750 KCals TRUE           31        42              1               0 TRUE    FALSE             TRUE       
#  2             284        40       57 FALSE Driver|>2750 KCals FALSE          40        57              1               1 FALSE   FALSE             TRUE       
#  3             322        38       49 FALSE Driver|>2750 KCals FALSE          38        49              1               2 FALSE   FALSE             TRUE       
#  4             170        46       56 TRUE  Driver|>2750 KCals TRUE           46        56              2               0 TRUE    FALSE             TRUE       
#  5             221        50       67 FALSE Driver|>2750 KCals FALSE          50        67              2               1 FALSE   FALSE             TRUE       
#  6             244        49       65 TRUE  Driver|>2750 KCals TRUE           49        65              2               2 FALSE   FALSE             TRUE       
#  7             249        59       65 TRUE  Driver|>2750 KCals TRUE           59        65              3               0 TRUE    FALSE             TRUE       
#  8             247        60       70 FALSE Driver|>2750 KCals FALSE          60        70              3               1 FALSE   FALSE             TRUE       
#  9             143        61       68 TRUE  Driver|>2750 KCals TRUE           61        68              3               2 FALSE   FALSE             TRUE       
# 10             236        59       70 FALSE Driver|>2750 KCals FALSE          59        70            999             999 FALSE   TRUE              FALSE      
# 11             258        57       70 FALSE Driver|>2750 KCals FALSE          57        70            999             999 FALSE   TRUE              FALSE      
# 12             315        47       63 FALSE Driver|>2750 KCals FALSE          47        63            999             999 FALSE   TRUE              FALSE      
# 
# $tableone_pre
#                        Stratified by event
#                         FALSE        TRUE          p      test
#   n                         7            5                    
#   entry_age (mean (sd)) 50.14 (8.97) 49.20 (12.01)  0.879     
#   exit_age (mean (sd))  63.71 (8.08) 59.20 (10.62)  0.420     
# 
# $tableone_post_total
#                        Stratified by is.Case
#                         FALSE        TRUE          p      test
#   n                         6            3                    
#   entry_age (mean (sd)) 49.67 (9.65) 45.33 (14.01)  0.597     
#   exit_age (mean (sd))  62.67 (8.07) 54.33 (11.59)  0.242     
# 
# > mycohort_1strata_tie %>% data.ccwc(varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.process = F)
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 244L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 143L"
# [1] "*** Caution) 4-th iteration for: 68 -> this case may have already been assigned as control"
# $tableone_pre
#                        Stratified by event
#                         FALSE        TRUE          p      test
#   n                         7            5                    
#   entry_age (mean (sd)) 50.14 (8.97) 49.20 (12.01)  0.879     
#   exit_age (mean (sd))  63.71 (8.08) 59.20 (10.62)  0.420     
# 
# $data
# # A tibble: 12 x 13
#    RowNum_original entry_age exit_age event strata             .event .entry_age .exit_age MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#              <int>     <int>    <dbl> <lgl> <fct>              <lgl>       <int>     <dbl>          <int>           <dbl> <lgl>   <lgl>             <lgl>      
#  1             125        31       42 TRUE  Driver|>2750 KCals TRUE           31        42              1               0 TRUE    FALSE             TRUE       
#  2             284        40       57 FALSE Driver|>2750 KCals FALSE          40        57              1               1 FALSE   FALSE             TRUE       
#  3             322        38       49 FALSE Driver|>2750 KCals FALSE          38        49              1               2 FALSE   FALSE             TRUE       
#  4             170        46       56 TRUE  Driver|>2750 KCals TRUE           46        56              2               0 TRUE    FALSE             TRUE       
#  5             221        50       67 FALSE Driver|>2750 KCals FALSE          50        67              2               1 FALSE   FALSE             TRUE       
#  6             244        49       65 TRUE  Driver|>2750 KCals TRUE           49        65              2               2 FALSE   FALSE             TRUE       
#  7             249        59       65 TRUE  Driver|>2750 KCals TRUE           59        65              3               0 TRUE    FALSE             TRUE       
#  8             247        60       70 FALSE Driver|>2750 KCals FALSE          60        70              3               1 FALSE   FALSE             TRUE       
#  9             143        61       68 TRUE  Driver|>2750 KCals TRUE           61        68              3               2 FALSE   FALSE             TRUE       
# 10             236        59       70 FALSE Driver|>2750 KCals FALSE          59        70            999             999 FALSE   TRUE              FALSE      
# 11             258        57       70 FALSE Driver|>2750 KCals FALSE          57        70            999             999 FALSE   TRUE              FALSE      
# 12             315        47       63 FALSE Driver|>2750 KCals FALSE          47        63            999             999 FALSE   TRUE              FALSE      
# 
# $tableone_post_total
#                        Stratified by is.Case
#                         FALSE        TRUE          p      test
#   n                         6            3                    
#   entry_age (mean (sd)) 49.67 (9.65) 45.33 (14.01)  0.597     
#   exit_age (mean (sd))  62.67 (8.07) 54.33 (11.59)  0.242     
# 
# attr(,"function.input")
# attr(,"function.input")$Call
# data.ccwc(.mydata = ., varname4event = "event", varname4entry = "entry_age", 
#     varname4exit = "exit_age", varname4origin = NULL, print.process = F)
# 
# attr(,"function.input")$fun
# function (.mydata, ..., varname4event = "failure", varname4entry = ".entry_age", 
#     varname4exit = ".exit_age", varname4origin = NULL, .MatchingRatio = 2, 
#     seed = 1, add_tableone_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, 
#     apply.function.dichotomous2logical = F) 
# {
#     if (load.dependent.library == T) {
#         library(tidyverse)
#         library(tableone)
#     }
#     select = dplyr::select
#     if (is.null(.mydata$RowNum_original)) {
#         .mydata$RowNum_original = 1:nrow(.mydata)
#     }
#     Call <- match.call(expand.dots = TRUE)
#     function.dichotomous2logical = function(x, dichotomous2integer = F) {
#         if (is.numeric(x)) {
#             x = as.character(x)
#         }
#         if (is.character(x)) {
#             x = as.factor(x)
#         }
#         if (length(unique(x)) == 1) {
#             warning("length(unique(x)) == 1")
#         }
#         if (!is.null(levels(x))) {
#             if (length(levels(x)) %in% 1:2) {
#                 if (dichotomous2integer == T) {
#                   warning(paste0(ifelse(is.null(levels(x)[1]), 
#                     "NULL", levels(x)[1]), " is coded to 0 & ", 
#                     ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), 
#                     " is coded to 1"))
#                 }
#                 else {
#                   warning(paste0(ifelse(is.null(levels(x)[1]), 
#                     "NULL", levels(x)[1]), " is coded to FALSE & ", 
#                     ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), 
#                     " is coded to TRUE"))
#                 }
#                 x = as.integer(x) - 1
#             }
#             else if (length(levels(x)) > 2) {
#                 stop("length(levels(x)) > 2")
#             }
#         }
#         if (dichotomous2integer == T) {
#             x = as.integer(x)
#         }
#         else {
#             x = as.logical(x)
#         }
#         x
#     }
#     .mydata[[".event"]] = .mydata[[varname4event]] %>% function.dichotomous2logical
#     if (!is.character(varname4entry)) {
#         stop("!is.character(varname4entry)")
#     }
#     else if (!is.character(varname4exit)) {
#         stop("!is.character(varname4exit)")
#     }
#     else if (is.numeric(varname4origin)) {
#         stop("is.numeric(varname4origin)")
#     }
#     else {
#         if (!is.null(varname4origin)) {
#             .mydata[[".entry_age"]] = .mydata[[varname4entry]] - 
#                 .mydata[[varname4origin]]
#             .mydata[[".exit_age"]] = .mydata[[varname4exit]] - 
#                 .mydata[[varname4origin]]
#         }
#         else {
#             .mydata[[".entry_age"]] = .mydata[[varname4entry]]
#             .mydata[[".exit_age"]] = .mydata[[varname4exit]]
#         }
#     }
#     if (length(unique(.mydata[[varname4event]])) < 2) {
#         print("length(unique(.mydata[[varname4event]]) < 2")
#         out = list()
#         out$data = NA
#         attr(out, "error.message") = "length(unique(.mydata[[varname4event]])) < 2"
#     }
#     else {
#         out = list()
#         if (add_tableone_pre_post == T) {
#             out$tableone_pre = CreateTableOne(vars = c(varname4entry, 
#                 varname4exit), strata = varname4event, data = .mydata, 
#                 test = T, includeNA = T)
#         }
#         .mydata = .mydata %>% mutate(MatchingPairID = 999L, MatchingCtrlNum = 999L, 
#             is.Case = F, is.Ctrl.Candidate = T, is.assigned = F)
#         .event.exit_age.unique.sort = .mydata %>% filter(.event == 
#             T) %>% select(.exit_age) %>% unlist %>% unname %>% 
#             unique %>% sort
#         incomplete = 0
#         ties <- FALSE
#         .mydata.ccwc = .mydata
#         for (i in 1:length(.event.exit_age.unique.sort)) {
#             if (print.process == T) 
#                 print(paste0("*** ", i, "-th iteration for .event.exit_age.unique.sort: ", 
#                   .event.exit_age.unique.sort[i]))
#             which.Case = which({
#                 ({
#                   abs(.mydata.ccwc[[".exit_age"]] - .event.exit_age.unique.sort[i]) < 
#                     0.001
#                 }) & .mydata.ccwc[[".event"]] == T & .mydata.ccwc$is.assigned == 
#                   F
#             })
#             if (length(which.Case) == 0) {
#                 if (print.process == T) 
#                   print(paste0("which.Case: ", which.Case))
#                 print(paste0("*** Caution) ", i, "-th iteration for: ", 
#                   .event.exit_age.unique.sort[i], " -> this case may have already been assigned as control"))
#             }
#             else {
#                 if (print.process == T) 
#                   print(paste0("which.Case: ", which.Case))
#                 .mydata.ccwc[which.Case, c("is.Case", "is.assigned")] = T
#                 .mydata.ccwc[which.Case, c("is.Ctrl.Candidate")] = F
#                 .mydata.ccwc[which.Case, c("MatchingPairID")] = i
#                 .mydata.ccwc[which.Case, c("MatchingCtrlNum")] = 0
#                 which.Ctrl.Candidate = which({
#                   .mydata.ccwc$is.Ctrl.Candidate == T & (.mydata.ccwc[[".entry_age"]] <= 
#                     .event.exit_age.unique.sort[i]) & (.mydata.ccwc[[".exit_age"]] >= 
#                     .event.exit_age.unique.sort[i])
#                 })
#                 if (print.process == T) 
#                   print(paste0("which.Ctrl.Candidate: ", deparse(which.Ctrl.Candidate)))
#                 if (.MatchingRatio * length(which.Case) > length(which.Ctrl.Candidate)) {
#                   incomplete = incomplete + 1
#                 }
#                 tmp.nCtrl = min(.MatchingRatio * length(which.Case), 
#                   length(which.Ctrl.Candidate))
#                 if (print.process == T) 
#                   print(paste0("incomplete: ", incomplete))
#                 if (print.process == T) 
#                   print(paste0("tmp.nCtrl: ", tmp.nCtrl))
#                 set.seed(seed + i)
#                 if (print.process == T) 
#                   print(paste0("set.seed: ", seed + i))
#                 which.Ctrl = sample(which.Ctrl.Candidate, size = tmp.nCtrl)
#                 if (print.process == T) 
#                   print(paste0("which.Ctrl: ", deparse(which.Ctrl)))
#                 .mydata.ccwc[which.Ctrl, c("is.assigned")] = T
#                 .mydata.ccwc[which.Ctrl, c("is.Ctrl.Candidate")] = F
#                 .mydata.ccwc[which.Ctrl, c("MatchingPairID")] = i
#                 .mydata.ccwc[which.Ctrl, c("MatchingCtrlNum")] = 1:{
#                   length(which.Ctrl)/length(which.Case)
#                 }
#                 if (print.process == T) 
#                   print(.mydata.ccwc[c(which.Case, which.Ctrl), 
#                     ] %>% select(RowNum_original, .entry_age, 
#                     .exit_age, varname4event, strata, MatchingPairID, 
#                     MatchingCtrlNum, is.Case, is.Ctrl.Candidate, 
#                     is.assigned))
#                 if (any(.mydata.ccwc[which.Ctrl, ".event"] == 
#                   T)) {
#                   print(paste0("*** Caution) a future case has been assigned as a control - RowNum_original: ", 
#                     deparse(.mydata.ccwc[{
#                       which.Ctrl[.mydata.ccwc[which.Ctrl, ".event"] == 
#                         T]
#                     }, ]$RowNum_original)))
#                 }
#                 if (length(which.Case) > 1) {
#                   ties <- TRUE
#                   print(paste0("** ties in RowNum_original: ", 
#                     deparse(.mydata.ccwc[which.Case, ]$RowNum_original)))
#                 }
#             }
#         }
#         out$data = .mydata.ccwc %>% arrange(MatchingPairID, MatchingCtrlNum)
#         if (add_tableone_pre_post == T) {
#             out$tableone_post_total = CreateTableOne(vars = c(varname4entry, 
#                 varname4exit), strata = "is.Case", data = filter(.mydata.ccwc, 
#                 is.assigned == T), test = T, includeNA = T)
#         }
#     }
#     attr(out$data, ".event") = varname4event
#     attr(out$data, ".entry") = varname4entry
#     attr(out$data, ".exit") = varname4exit
#     attr(out$data, ".origin") = varname4origin
#     attr(out$data, ".MatchingRatio") = .MatchingRatio
#     attr(out$data, "apply.na.omit") = apply.na.omit
#     attr(out, "function.input") = list(Call = match.call(expand.dots = TRUE), 
#         fun = data.ccwc, varname4event = varname4event, varname4entry = varname4entry, 
#         varname4exit = varname4exit, varname4origin = varname4origin, 
#         .MatchingRatio = .MatchingRatio, apply.na.omit = apply.na.omit, 
#         apply.function.dichotomous2logical = apply.function.dichotomous2logical)
#     if (is.data.frame(out$data)) {
#         out$data$RowNum_after_na.omit = NULL
#     }
#     out
# }
# <bytecode: 0x000000000305ff08>
# 
# attr(,"function.input")$varname4event
# [1] "event"
# 
# attr(,"function.input")$varname4entry
# [1] "entry_age"
# 
# attr(,"function.input")$varname4exit
# [1] "exit_age"
# 
# attr(,"function.input")$varname4origin
# NULL
# 
# attr(,"function.input")$.MatchingRatio
# [1] 2
# 
# attr(,"function.input")$apply.na.omit
# [1] FALSE
# 
# attr(,"function.input")$apply.function.dichotomous2logical
# [1] FALSE



#@ test) data.ccwc() mydata2089.strata_list_1_17_1q_41_49_TRUE_TRUE ----
mydata2089.strata_list_1_17_1q_41_49_TRUE_TRUE =
structure(list(RowNum_original_before_strata = c(39429L, 39894L,
40732L, 41167L, 41447L, 41513L, 41969L, 42023L, 42319L, 42587L,
43622L, 43647L, 43677L, 43798L, 43918L, 43952L, 44381L, 44587L,
44703L, 44789L, 45419L, 45506L, 46138L, 46253L, 46285L, 46412L
), entry = structure(c(11688, 11688, 11688, 11688, 11688, 11688,
11688, 11688, 11688, 11688, 11688, 11688, 11688, 11688, 11688,
11688, 11688, 11688, 11688, 11688, 11688, 11688, 11688, 11688,
11688, 11688), class = "Date"), EndTime.YM = structure(c(14275,
14790, 13999, 12142, 14943, 12295, 12477, 14152, 16070, 14244,
12752, 12630, 14303, 14913, 12448, 14943, 13513, 13360, 13878,
13329, 12295, 16070, 14364, 12569, 12873, 12722), class = "Date"),
    EndTime.is.MDD = c(FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE)), class = "data.frame", row.names = c(NA, -26L
), .Names = c("RowNum_original_before_strata", "entry", "EndTime.YM",
"EndTime.is.MDD"))

mydata2089.strata_list_1_17_1q_41_49_TRUE_TRUE %>% as.tibble
# > mydata2089.strata_list_1_17_1q_41_49_TRUE_TRUE %>% as.tibble
# # A tibble: 26 x 4
#    RowNum_original_before_strata entry      EndTime.YM EndTime.is.MDD
#                            <int> <date>     <date>     <lgl>         
#  1                         39429 2002-01-01 2009-01-31 FALSE         
#  2                         39894 2002-01-01 2010-06-30 TRUE          
#  3                         40732 2002-01-01 2008-04-30 FALSE         
#  4                         41167 2002-01-01 2003-03-31 FALSE         
#  5                         41447 2002-01-01 2010-11-30 FALSE         
#  6                         41513 2002-01-01 2003-08-31 FALSE         
#  7                         41969 2002-01-01 2004-02-29 FALSE         
#  8                         42023 2002-01-01 2008-09-30 FALSE         
#  9                         42319 2002-01-01 2013-12-31 FALSE         
# 10                         42587 2002-01-01 2008-12-31 FALSE         
# # ... with 16 more rows

# debugonce(data.ccwc)  # debug 180516
mydata2089.strata_list_1_17_1q_41_49_TRUE_TRUE %>%
    data.ccwc(
        varname4event = "EndTime.is.MDD"
        , varname4entry = "entry"
        , varname4exit = "EndTime.YM"
        , .MatchingRatio = 1
        , apply.na.omit = F
        , print.process = F
        , print.map.process = F
        , add_tableone_pre_post = F
    ) %>% {.$data}
# > mydata2089.strata_list_1_17_1q_41_49_TRUE_TRUE %>%
# +     data.ccwc(
# +         varname4event = "EndTime.is.MDD"
# +         , varname4entry = "entry"
# +         , varname4exit = "EndTime.YM"
# +         , .MatchingRatio = 1
# +         , apply.na.omit = F
# +         , print.process = F
# +         , print.map.process = F
# +         , add_tableone_pre_post = F
# +     ) %>% {.$data}
#    RowNum_original_before_strata      entry EndTime.YM EndTime.is.MDD .event .entry_age .exit_age MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
# 1                          39894 2002-01-01 2010-06-30           TRUE   TRUE      11688     14790              1               0    TRUE             FALSE        TRUE
# 2                          41447 2002-01-01 2010-11-30          FALSE  FALSE      11688     14943              1               1   FALSE             FALSE        TRUE
# 3                          39429 2002-01-01 2009-01-31          FALSE  FALSE      11688     14275      999999999       999999999   FALSE              TRUE       FALSE
# 4                          40732 2002-01-01 2008-04-30          FALSE  FALSE      11688     13999      999999999       999999999   FALSE              TRUE       FALSE
# 5                          41167 2002-01-01 2003-03-31          FALSE  FALSE      11688     12142      999999999       999999999   FALSE              TRUE       FALSE
# 6                          41513 2002-01-01 2003-08-31          FALSE  FALSE      11688     12295      999999999       999999999   FALSE              TRUE       FALSE
# 7                          41969 2002-01-01 2004-02-29          FALSE  FALSE      11688     12477      999999999       999999999   FALSE              TRUE       FALSE
# 8                          42023 2002-01-01 2008-09-30          FALSE  FALSE      11688     14152      999999999       999999999   FALSE              TRUE       FALSE
# 9                          42319 2002-01-01 2013-12-31          FALSE  FALSE      11688     16070      999999999       999999999   FALSE              TRUE       FALSE
# 10                         42587 2002-01-01 2008-12-31          FALSE  FALSE      11688     14244      999999999       999999999   FALSE              TRUE       FALSE
# 11                         43622 2002-01-01 2004-11-30          FALSE  FALSE      11688     12752      999999999       999999999   FALSE              TRUE       FALSE
# 12                         43647 2002-01-01 2004-07-31          FALSE  FALSE      11688     12630      999999999       999999999   FALSE              TRUE       FALSE
# 13                         43677 2002-01-01 2009-02-28          FALSE  FALSE      11688     14303      999999999       999999999   FALSE              TRUE       FALSE
# 14                         43798 2002-01-01 2010-10-31          FALSE  FALSE      11688     14913      999999999       999999999   FALSE              TRUE       FALSE
# 15                         43918 2002-01-01 2004-01-31          FALSE  FALSE      11688     12448      999999999       999999999   FALSE              TRUE       FALSE
# 16                         43952 2002-01-01 2010-11-30          FALSE  FALSE      11688     14943      999999999       999999999   FALSE              TRUE       FALSE
# 17                         44381 2002-01-01 2006-12-31          FALSE  FALSE      11688     13513      999999999       999999999   FALSE              TRUE       FALSE
# 18                         44587 2002-01-01 2006-07-31          FALSE  FALSE      11688     13360      999999999       999999999   FALSE              TRUE       FALSE
# 19                         44703 2002-01-01 2007-12-31          FALSE  FALSE      11688     13878      999999999       999999999   FALSE              TRUE       FALSE
# 20                         44789 2002-01-01 2006-06-30          FALSE  FALSE      11688     13329      999999999       999999999   FALSE              TRUE       FALSE
# 21                         45419 2002-01-01 2003-08-31          FALSE  FALSE      11688     12295      999999999       999999999   FALSE              TRUE       FALSE
# 22                         45506 2002-01-01 2013-12-31          FALSE  FALSE      11688     16070      999999999       999999999   FALSE              TRUE       FALSE
# 23                         46138 2002-01-01 2009-04-30          FALSE  FALSE      11688     14364      999999999       999999999   FALSE              TRUE       FALSE
# 24                         46253 2002-01-01 2004-05-31          FALSE  FALSE      11688     12569      999999999       999999999   FALSE              TRUE       FALSE
# 25                         46285 2002-01-01 2005-03-31          FALSE  FALSE      11688     12873      999999999       999999999   FALSE              TRUE       FALSE
# 26                         46412 2002-01-01 2004-10-31          FALSE  FALSE      11688     12722      999999999       999999999   FALSE              TRUE       FALSE


#@ test) data.ccwc() mydata2089.strata_list_2_18_3q_11_36_FALSE_TRUE_TRUE -----
mydata2089.strata_list_2_18_3q_11_36_FALSE_TRUE_TRUE = 
structure(list(RowNum_original_before_strata = c(36092L, 37713L,
38766L), entry = structure(c(11688, 11688, 11688), class = "Date"),
    EndTime.YM = structure(c(13664, 12417, 14183), class = "Date"),
    EndTime.is.MDD = c(FALSE, FALSE, TRUE)), row.names = c(NA,
-3L), class = c("tbl_df", "tbl", "data.frame"), .Names = c("RowNum_original_before_strata",
"entry", "EndTime.YM", "EndTime.is.MDD"))
mydata2089.strata_list_2_18_3q_11_36_FALSE_TRUE_TRUE %>% as.tibble
# > mydata2089.strata_list_2_18_3q_11_36_FALSE_TRUE_TRUE %>% as.tibble
# # A tibble: 3 x 4
#   RowNum_original_before_strata entry      EndTime.YM EndTime.is.MDD
#                           <int> <date>     <date>     <lgl>         
# 1                         36092 2002-01-01 2007-05-31 FALSE         
# 2                         37713 2002-01-01 2003-12-31 FALSE         
# 3                         38766 2002-01-01 2008-10-31 TRUE          

mydata2089.strata_list_2_18_3q_11_36_FALSE_TRUE_TRUE %>% 
    data.ccwc(
        varname4event = "EndTime.is.MDD"
        , varname4entry = "entry"
        , varname4exit = "EndTime.YM"
        , .MatchingRatio = 1
        , apply.na.omit = F
        , print.process = F
        , print.map.process = F
        , add_tableone_pre_post = F
    ) %>% {.$data}
# > mydata2089.strata_list_2_18_3q_11_36_FALSE_TRUE_TRUE %>% 
# +     data.ccwc(
# +         varname4event = "EndTime.is.MDD"
# +         , varname4entry = "entry"
# +         , varname4exit = "EndTime.YM"
# +         , .MatchingRatio = 1
# +         , apply.na.omit = F
# +         , print.process = F
# +         , print.map.process = F
# +         , add_tableone_pre_post = F
# +     ) %>% {.$data}
# [1] "length(which.Ctrl.Candidate) == 0 for .mydata.ccwc[which.Case,], where which.Case is: 3L"
# # A tibble: 3 x 13
#   RowNum_original_before_strata entry      EndTime.YM EndTime.is.MDD RowNum_original .event .entry_age .exit_age MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#                           <int> <date>     <date>     <lgl>                    <int> <lgl>       <dbl>     <dbl>          <int>           <int> <lgl>   <lgl>             <lgl>      
# 1                         38766 2002-01-01 2008-10-31 TRUE                         3 TRUE        11688     14183              1               0 TRUE    FALSE             TRUE       
# 2                         36092 2002-01-01 2007-05-31 FALSE                        1 FALSE       11688     13664      999999999       999999999 FALSE   TRUE              FALSE      
# 3                         37713 2002-01-01 2003-12-31 FALSE                        2 FALSE       11688     12417      999999999       999999999 FALSE   TRUE              FALSE      




#@ data.strata_list = function( -----
data.strata_list = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , paste.collapse = "_"
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.ccwc")
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = paste.collapse)
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


#@ test) data.strata_list() diet.rda -----
# data(diet, package = "Epi")
load(url("https://github.com/mkim0710/tidystat/raw/master/data/library(Epi) diet.rda"))
diet = diet %>% mutate(
    RowNum_original = 1:nrow(.)
    , entry_age = as.numeric(doe - dob)/365
    , exit_age = as.numeric(dox - dob)/365
    , event = fail > 0
)
diet %>% as.tibble
# > diet %>% as.tibble
# # A tibble: 337 x 19
#       id        doe        dox        dob          y  fail         job month  energy   height   weight    fat     fibre   energy.grp   chd RowNum_original entry_age exit_age event
#    <dbl>     <date>     <date>     <date>      <dbl> <dbl>      <fctr> <dbl>   <dbl>    <dbl>    <dbl>  <dbl>     <dbl>       <fctr> <dbl>           <int>     <dbl>    <dbl> <lgl>
#  1   102 1976-01-17 1986-12-02 1939-03-02 10.8747433     0      Driver     1 22.8601 181.6100 88.17984  9.168 1.4000000 <=2750 KCals     0               1  36.90411 47.78630 FALSE
#  2    59 1973-07-16 1982-07-05 1912-07-05  8.9691992     0      Driver     7 23.8841 165.9890 58.74120  9.651 0.9350001 <=2750 KCals     0               2  61.07123 70.04658 FALSE
#  3   126 1970-03-17 1984-03-20 1919-12-24 14.0095825    13   Conductor     3 24.9537 152.4000 49.89600 11.249 1.2480000 <=2750 KCals     1               3  50.26301 64.28219  TRUE
#  4    16 1969-05-16 1969-12-31 1906-09-17  0.6269678     3      Driver     5 22.2383 171.1960 89.40456  7.578 1.5570000 <=2750 KCals     1               4  62.70411 63.33151  TRUE
#  5   247 1968-03-16 1979-06-25 1918-07-10 11.2744695    13 Bank worker     3 18.5402 177.8000 97.07040  9.147 0.9910000 <=2750 KCals     1               5  49.71781 61.00000  TRUE
#  6   272 1969-03-16 1973-12-13 1920-03-06  4.7446954     3 Bank worker     3 20.3073 175.2600 61.00920  8.536 0.7650000 <=2750 KCals     1               6  49.06027 53.80822  TRUE
#  7   268 1969-02-16 1986-12-02 1919-06-24 17.7905544     0 Bank worker     2 24.5261 179.0700 81.19440 11.307 1.3210000 <=2750 KCals     0               7  49.68493 67.48767 FALSE
#  8   206 1967-01-17 1986-12-02 1917-09-26 19.8740589     0 Bank worker     1 23.6894 187.9600 95.25600 11.094 1.7890000 <=2750 KCals     0               8  49.34247 69.23014 FALSE
#  9   182 1971-03-17 1976-07-27 1925-01-31  5.3634497    13   Conductor     3 23.1603 173.9900 65.99880 10.140 1.4100000 <=2750 KCals     1               9  46.15342 51.52055  TRUE
# 10     2 1974-12-17 1986-12-02 1924-06-03 11.9589322     0      Driver    12 19.8234 164.2872 70.08120  8.577 0.9490000 <=2750 KCals     0              10  50.57260 62.53973 FALSE
# # ... with 327 more rows

diet.strata_list = diet %>% data.strata_list(.vars4strata = c("job", "energy.grp"), paste.collapse = "|")
diet.strata_list %>% str(max.level = 1)
diet.strata_list[[1]]
# > diet.strata_list = diet %>% data.strata_list(.vars4strata = c("job", "energy.grp"), paste.collapse = "|")
# > diet.strata_list %>% str(max.level = 1)
# List of 6
#  $ Bank worker|<=2750 KCals:Classes ??tbl_df??, ??tbl?? and 'data.frame':	68 obs. of  20 variables:
#  $ Bank worker|>2750 KCals :Classes ??tbl_df??, ??tbl?? and 'data.frame':	83 obs. of  20 variables:
#  $ Conductor|<=2750 KCals  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	39 obs. of  20 variables:
#  $ Conductor|>2750 KCals   :Classes ??tbl_df??, ??tbl?? and 'data.frame':	45 obs. of  20 variables:
#  $ Driver|<=2750 KCals     :Classes ??tbl_df??, ??tbl?? and 'data.frame':	48 obs. of  20 variables:
#  $ Driver|>2750 KCals      :Classes ??tbl_df??, ??tbl?? and 'data.frame':	54 obs. of  20 variables:
#  - attr(*, ".vars4strata")= chr [1:2] "job" "energy.grp"
#  - attr(*, "function.input")=List of 2
# > diet.strata_list[[1]]
# # A tibble: 68 x 20
#       id        doe        dox        dob         y  fail         job month  energy height   weight       fat fibre   energy.grp   chd RowNum_original entry_age exit_age event                   strata
#    <dbl>     <date>     <date>     <date>     <dbl> <dbl>      <fctr> <dbl>   <dbl>  <dbl>    <dbl>     <dbl> <dbl>       <fctr> <dbl>           <int>     <dbl>    <dbl> <lgl>                   <fctr>
#  1   247 1968-03-16 1979-06-25 1918-07-10 11.274470    13 Bank worker     3 18.5402 177.80 97.07040  9.147000 0.991 <=2750 KCals     1               5  49.71781 61.00000  TRUE Bank worker|<=2750 KCals
#  2   272 1969-03-16 1973-12-13 1920-03-06  4.744695     3 Bank worker     3 20.3073 175.26 61.00920  8.536000 0.765 <=2750 KCals     1               6  49.06027 53.80822  TRUE Bank worker|<=2750 KCals
#  3   268 1969-02-16 1986-12-02 1919-06-24 17.790554     0 Bank worker     2 24.5261 179.07 81.19440 11.307000 1.321 <=2750 KCals     0               7  49.68493 67.48767 FALSE Bank worker|<=2750 KCals
#  4   206 1967-01-17 1986-12-02 1917-09-26 19.874059     0 Bank worker     1 23.6894 187.96 95.25600 11.094000 1.789 <=2750 KCals     0               8  49.34247 69.23014 FALSE Bank worker|<=2750 KCals
#  5   221 1967-02-17 1983-06-17 1913-06-17 16.328542     0 Bank worker     2 23.7180 176.53 76.20480 13.873000 1.589 <=2750 KCals     0              12  53.70685 70.04658 FALSE Bank worker|<=2750 KCals
#  6   225 1967-03-17 1986-12-02 1918-04-30 19.712526     0 Bank worker     3 23.3816 166.37 66.45240 10.608000 1.535 <=2750 KCals     0              15  48.91233 68.63836 FALSE Bank worker|<=2750 KCals
#  7   222 1967-02-17 1982-07-11 1912-07-11 15.394935     0 Bank worker     2 24.6795 158.75 58.24224 11.209000 1.003 <=2750 KCals     0              16  54.64110 70.04658 FALSE Bank worker|<=2750 KCals
#  8   273 1969-03-16 1983-12-28 1913-12-28 14.784394     0 Bank worker     3 23.3237 171.45 75.75120 11.792000 1.516 <=2750 KCals     0              18  55.25205 70.04658 FALSE Bank worker|<=2750 KCals
#  9   224 1967-03-17 1972-01-03 1912-06-14  4.799452     1 Bank worker     3 24.4270 167.64 75.66048  8.911000 1.146 <=2750 KCals     1              19  54.79178 59.59452  TRUE Bank worker|<=2750 KCals
# 10   307 1970-02-16 1986-12-02 1917-10-07 16.791239     0 Bank worker     2 21.9797 187.96 93.89520  9.412001 1.320 <=2750 KCals     0              21  52.39726 69.20000 FALSE Bank worker|<=2750 KCals
# # ... with 58 more rows

diet.strata_list %>% map(function(df) {
    out = df$event %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
    parent.x = get(".x", envir = parent.frame())
    attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
    names(out)[1] = attr(out, "parent_name")
    out = out %>% t %>% as.data.frame %>% rownames_to_column
    out
}) %>% reduce(bind_rows)
# > diet.strata_list %>% map(function(df) {
# +     out = df$event %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
# +     parent.x = get(".x", envir = parent.frame())
# +     attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
# +     names(out)[1] = attr(out, "parent_name")
# +     out = out %>% t %>% as.data.frame %>% rownames_to_column
# +     out
# + }) %>% reduce(bind_rows)
#                    rowname FALSE TRUE
# 1 Bank worker|<=2750 KCals    50   18
# 2  Bank worker|>2750 KCals    67   16
# 3   Conductor|<=2750 KCals    28   11
# 4    Conductor|>2750 KCals    33   12
# 5      Driver|<=2750 KCals    35   13
# 6       Driver|>2750 KCals    44   10







#@ data.stratified.ccwc = function( - debug 180519 v5 ----
data.stratified.ccwc = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , paste.collapse = "|"
    , ...
    , varname4event = "failure"
    , varname4entry = ".entry_age"
    , varname4exit = ".exit_age"
    , varname4origin = NULL
    , .MatchingRatio = 2
    , seed = 1
    , add_tableone_pre_post = F
    , RowNum_original_before_strata = NULL
    , apply.na.omit = F
    , print.process = F
    , print.map.process = T
    , load.dependent.library = T
    , apply.function.dichotomous2logical = F
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.ccwc.source.r")
    if (!is.data.frame(.mydata)) stop("!is.data.frame(.mydata)")
    if (load.dependent.library == T) {
        library(tidyverse)
        # library(tableone)
    }
    select = dplyr::select
    .mydata$RowNum_original_before_strata = 1:nrow(.mydata)
    
    .mydata.strata_list = data.strata_list(.mydata = .mydata, .vars4strata = .vars4strata, paste.collapse = paste.collapse)
    
    if (print.map.process == T) {
        .mydata.strata_list.ccwc = .mydata.strata_list %>% seq_along %>% 
            map(function(i, ...) {
                print(paste0("map to data.ccwc() with .mydata.strata_list$", names(.mydata.strata_list)[i]))
                out = .mydata.strata_list[[i]] %>% data.ccwc(...)
                out
            }
            , varname4event = varname4event
            , varname4entry = varname4entry
            , varname4exit = varname4exit
            , varname4origin = varname4origin
            , seed = seed
            , .MatchingRatio = .MatchingRatio
            , add_tableone_pre_post = F
            , print.process = print.process
            , RowNum_original_before_strata = "RowNum_original_before_strata"
            , apply.na.omit = apply.na.omit
            , load.dependent.library = F
            , apply.function.dichotomous2logical = apply.function.dichotomous2logical
            )
        names(.mydata.strata_list.ccwc) = names(.mydata.strata_list)
    } else {
        .mydata.strata_list.ccwc = .mydata.strata_list %>%
            map(data.ccwc
                , varname4event = varname4event
                , varname4entry = varname4entry
                , varname4exit = varname4exit
                , varname4origin = varname4origin
                , seed = seed
                , .MatchingRatio = .MatchingRatio
                , add_tableone_pre_post = F
                , print.process = F
                , RowNum_original_before_strata = "RowNum_original_before_strata"
                , apply.na.omit = apply.na.omit
                , load.dependent.library = F
                , apply.function.dichotomous2logical = apply.function.dichotomous2logical
            )
    }
    # map = purrr::map
    out = list()
    # # out$tableone_pre = CreateTableOne(vars = c(varname4entry, varname4exit), strata = varname4event, data = .mydata, test=T, includeNA = T)
    # # debug 180516
    # out$tableone_pre = CreateTableOne(vars = c(varname4entry, varname4exit), strata = varname4event, data = map_df(.mydata, function(x) ifelse(is.factor(x), as.character(x), x)), test=T, includeNA = T)
    
    warning_lgl = .mydata.strata_list.ccwc %>% map_lgl(function(object) {
        as.logical(sum(attr(object, "error.message") == "length(unique(.mydata[[varname4event]])) < 2")) # sum() to avoid error "argument is of length zero" in if()
    })
    # print(paste0("warning_lgl : ", deparse(warning_lgl)))
    # print(paste0("names(.mydata.strata_list.ccwc) : ", deparse(names(.mydata.strata_list.ccwc))))
    # print(paste0("names(.mydata.strata_list.ccwc)[warning_lgl] : ", deparse(names(.mydata.strata_list.ccwc)[warning_lgl])))

    # out$data = .mydata.strata_list.ccwc[!warning_lgl] %>% map(function(x) x$data) %>% reduce(rbind)
    # debug 180519 v5
    out$data = .mydata.strata_list.ccwc %>% map(function(x) x$data) %>% bind_rows
    out$data$MatchingPairID = paste0(out$data$strata, "_", out$data$MatchingPairID) %>% as.factor
    
    if (sum(warning_lgl) > 0) {
        # warning(paste0("length(unique(.mydata[[varname4event]]) < 2",": \n", paste0(warning_which, collapse = ", ")))
        # warning(paste0("length(unique(.mydata[[varname4event]]) < 2",": \n", dput(warning_which)))
        warning(paste0("length(unique(.mydata[[varname4event]]) < 2",": \n", deparse(names(.mydata.strata_list.ccwc)[warning_lgl])))
    }
    
    # # out$tableone_post_total = CreateTableOne(
    # #     vars = c(varname4entry, varname4exit), strata = "is.Case"
    # #     , data = filter(out$data, is.assigned == T)
    # #     , test=T
    # #     , includeNA = T)
    # # debug 180516
    # out$tableone_post_total = CreateTableOne(
    #     vars = c(varname4entry, varname4exit), strata = "is.Case"
    #     , data = map_df(filter(out$data, is.assigned == T), function(x) ifelse(is.factor(x), as.character(x), x))
    #     , test=T
    #     , includeNA = T)

    attr(out$data, ".vars4strata") = .vars4strata
    attr(out$data, ".event") = varname4event
    attr(out$data, ".entry") = varname4entry
    attr(out$data, ".exit") = varname4exit
    attr(out$data, ".MatchingRatio") = .MatchingRatio
    attr(out$data, "apply.na.omit") = apply.na.omit
    attr(out, "function.input") = list(
        data.stratified.ccwc = data.stratified.ccwc
        , data.strata_list = data.strata_list
        , data.ccwc = data.ccwc
        , .vars4strata = .vars4strata
        , varname4event = varname4event
        , varname4entry = varname4entry
        , varname4exit = varname4exit
        , .MatchingRatio = .MatchingRatio
        , apply.na.omit = apply.na.omit
    ) # list inside attr() is not shown with str(max.level = 1)
    out$data$RowNum_original = out$data$RowNum_original_before_strata  # these are not unique numbers d/t stratified map
    out$data$RowNum_original_before_strata  = NULL
    out$data$RowNum_after_na.omit = NULL  # these are not unique numbers d/t stratified map
    out
}


#@ test) data.stratified.ccwc() diet ----
.vars4strata = c("job", "energy.grp")
varname4event = "event"
diet.stratified.ccwc = diet %>% data.stratified.ccwc(
    .vars4strata = .vars4strata, paste.collapse = "|"
    , varname4event = varname4event, varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.map.process = T
    )
# > diet.stratified.ccwc = diet %>% data.stratified.ccwc(
# +     .vars4strata = c("job", "energy.grp"), paste.collapse = "|"
# +     , varname4event = "event", varname4entry = "entry_age", varname4exit = "exit_age", varname4origin = NULL, print.map.process = T
# +     )
# [1] "map to data.ccwc() with .mydata.strata_list$Bank worker|<=2750 KCals"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: c(120L, 5L)"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 92L"
# [1] "*** Caution) 10-th iteration for: 61 -> this case may have already been assigned as control"
# [1] "*** Caution) 13-th iteration for: 62.641095890411 -> this case may have already been assigned as control"
# [1] "*** Caution) 16-th iteration for: 65.7643835616438 -> this case may have already been assigned as control"
# [1] "map to data.ccwc() with .mydata.strata_list$Bank worker|>2750 KCals"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 283L"
# [1] "*** Caution) 9-th iteration for: 57.4630136986301 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 90L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 189L"
# [1] "*** Caution) 13-th iteration for: 63.4630136986301 -> this case may have already been assigned as control"
# [1] "*** Caution) 16-th iteration for: 68.0109589041096 -> this case may have already been assigned as control"
# [1] "map to data.ccwc() with .mydata.strata_list$Conductor|<=2750 KCals"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: c(26L, 137L)"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 20L"
# [1] "*** Caution) 3-th iteration for: 54.2904109589041 -> this case may have already been assigned as control"
# [1] "*** Caution) 4-th iteration for: 55.3068493150685 -> this case may have already been assigned as control"
# [1] "*** Caution) 5-th iteration for: 55.3835616438356 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 3L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 121L"
# [1] "*** Caution) 10-th iteration for: 64.2821917808219 -> this case may have already been assigned as control"
# [1] "*** Caution) 11-th iteration for: 65.8739726027397 -> this case may have already been assigned as control"
# [1] "map to data.ccwc() with .mydata.strata_list$Conductor|>2750 KCals"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 83L"
# [1] "*** Caution) 6-th iteration for: 60.9643835616438 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 115L"
# [1] "*** Caution) 9-th iteration for: 63.7780821917808 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 320L"
# [1] "*** Caution) 12-th iteration for: 68.6438356164384 -> this case may have already been assigned as control"
# [1] "map to data.ccwc() with .mydata.strata_list$Driver|<=2750 KCals"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 183L"
# [1] "*** Caution) 3-th iteration for: 59.0328767123288 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 39L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 180L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 60L"
# [1] "*** Caution) 8-th iteration for: 63.4547945205479 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 35L"
# [1] "*** Caution) 10-th iteration for: 65.827397260274 -> this case may have already been assigned as control"
# [1] "*** Caution) 12-th iteration for: 68.2602739726027 -> this case may have already been assigned as control"
# [1] "*** Caution) 13-th iteration for: 68.6027397260274 -> this case may have already been assigned as control"
# [1] "map to data.ccwc() with .mydata.strata_list$Driver|>2750 KCals"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 170L"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: 254L"
# [1] "*** Caution) 5-th iteration for: 56.5013698630137 -> this case may have already been assigned as control"
# [1] "*** Caution) 6-th iteration for: 56.5369863013699 -> this case may have already been assigned as control"
# [1] "*** Caution) a future case has been assigned as a control - RowNum_original: c(244L, 143L)"
# [1] "*** Caution) 9-th iteration for: 66.3698630136986 -> this case may have already been assigned as control"
# [1] "*** Caution) 10-th iteration for: 68.0739726027397 -> this case may have already been assigned as control"




diet.stratified.ccwc$data %>% group_by(!!!rlang::syms(.vars4strata)) %>% summarise( n(), `sum(event==T)` = eval(parse(text = paste0("sum(", varname4event, "==T)"))), `sum(event==F)` = eval(parse(text = paste0("sum(", varname4event, "==F)"))), sum(is.Case), sum(is.assigned)  ) #----
diet.stratified.ccwc$data %>% group_by(!!!rlang::syms(c(.vars4strata, varname4event))) %>% summarise( n(), `sum(event==T)` = eval(parse(text = paste0("sum(", varname4event, "==T)"))), `sum(event==F)` = eval(parse(text = paste0("sum(", varname4event, "==F)"))), sum(is.Case), sum(is.assigned)  ) #----
# > diet.stratified.ccwc$data %>% group_by(!!!rlang::syms(.vars4strata)) %>% summarise( n(), `sum(event==T)` = eval(parse(text = paste0("sum(", varname4event, "==T)"))), `sum(event==F)` = eval(parse(text = paste0("sum(", varname4event, "==F)"))), sum(is.Case), sum(is.assigned)  ) #----
# # A tibble: 6 x 7
# # Groups:   job [3]
#   job         energy.grp   `n()` `sum(event==T)` `sum(event==F)` `sum(is.Case)` `sum(is.assigned)`
#   <fct>       <fct>        <int>           <int>           <int>          <int>              <int>
# 1 Driver      <=2750 KCals    48              13              35              8                 24
# 2 Driver      >2750 KCals     54              10              44              6                 18
# 3 Conductor   <=2750 KCals    39              11              28              6                 18
# 4 Conductor   >2750 KCals     45              12              33              9                 27
# 5 Bank worker <=2750 KCals    68              18              50             15                 45
# 6 Bank worker >2750 KCals     83              16              67             13                 39
# > diet.stratified.ccwc$data %>% group_by(!!!rlang::syms(c(.vars4strata, varname4event))) %>% summarise( n(), `sum(event==T)` = eval(parse(text = paste0("sum(", varname4event, "==T)"))), `sum(event==F)` = eval(parse(text = paste0("sum(", varname4event, "==F)"))), sum(is.Case), sum(is.assigned)  ) #----
# # A tibble: 12 x 8
# # Groups:   job, energy.grp [6]
#    job         energy.grp   event `n()` `sum(event==T)` `sum(event==F)` `sum(is.Case)` `sum(is.assigned)`
#    <fct>       <fct>        <lgl> <int>           <int>           <int>          <int>              <int>
#  1 Driver      <=2750 KCals FALSE    35               0              35              0                 11
#  2 Driver      <=2750 KCals TRUE     13              13               0              8                 13
#  3 Driver      >2750 KCals  FALSE    44               0              44              0                  8
#  4 Driver      >2750 KCals  TRUE     10              10               0              6                 10
#  5 Conductor   <=2750 KCals FALSE    28               0              28              0                  7
#  6 Conductor   <=2750 KCals TRUE     11              11               0              6                 11
#  7 Conductor   >2750 KCals  FALSE    33               0              33              0                 15
#  8 Conductor   >2750 KCals  TRUE     12              12               0              9                 12
#  9 Bank worker <=2750 KCals FALSE    50               0              50              0                 27
# 10 Bank worker <=2750 KCals TRUE     18              18               0             15                 18
# 11 Bank worker >2750 KCals  FALSE    67               0              67              0                 23
# 12 Bank worker >2750 KCals  TRUE     16              16               0             13                 16



diet.stratified.ccwc$data %>% select(RowNum_original, !!rlang::sym(varname4entry), !!rlang::sym(varname4exit), .event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned) #----
diet.stratified.ccwc$data %>% select(RowNum_original, entry_age, exit_age, .event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned) %>% as.data.frame() #----
# > diet.stratified.ccwc$data %>% select(RowNum_original, entry_age, exit_age, .event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned) #----
# # A tibble: 337 x 10
#    RowNum_original entry_age exit_age .event strata                   MatchingPairID             MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
#              <int>     <dbl>    <dbl> <lgl>  <fct>                    <fct>                                <dbl> <lgl>   <lgl>             <lgl>      
#  1              71      46.6     48.1 TRUE   Bank worker|<=2750 KCals Bank worker|<=2750 KCals_1               0 TRUE    FALSE             TRUE       
#  2              61      47.5     67.5 FALSE  Bank worker|<=2750 KCals Bank worker|<=2750 KCals_1               1 FALSE   FALSE             TRUE       
#  3             152      42.3     57.7 FALSE  Bank worker|<=2750 KCals Bank worker|<=2750 KCals_1               2 FALSE   FALSE             TRUE       
#  4             186      44.6     49.1 TRUE   Bank worker|<=2750 KCals Bank worker|<=2750 KCals_2               0 TRUE    FALSE             TRUE       
#  5              41      46.4     61.9 FALSE  Bank worker|<=2750 KCals Bank worker|<=2750 KCals_2               1 FALSE   FALSE             TRUE       
#  6             156      48.9     68.8 FALSE  Bank worker|<=2750 KCals Bank worker|<=2750 KCals_2               2 FALSE   FALSE             TRUE       
#  7             117      48.8     53.2 TRUE   Bank worker|<=2750 KCals Bank worker|<=2750 KCals_3               0 TRUE    FALSE             TRUE       
#  8             120      51.2     62.6 TRUE   Bank worker|<=2750 KCals Bank worker|<=2750 KCals_3               1 FALSE   FALSE             TRUE       
#  9               5      49.7     61   TRUE   Bank worker|<=2750 KCals Bank worker|<=2750 KCals_3               2 FALSE   FALSE             TRUE       
# 10               6      49.1     53.8 TRUE   Bank worker|<=2750 KCals Bank worker|<=2750 KCals_4               0 TRUE    FALSE             TRUE       
# # ... with 327 more rows
# > diet.stratified.ccwc$data %>% select(RowNum_original, entry_age, exit_age, .event, strata, MatchingPairID, MatchingCtrlNum, is.Case, is.Ctrl.Candidate, is.assigned) %>% as.data.frame() #----
#     RowNum_original entry_age exit_age .event                   strata               MatchingPairID MatchingCtrlNum is.Case is.Ctrl.Candidate is.assigned
# 1                71  46.57808 48.07397   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_1               0    TRUE             FALSE        TRUE
# 2                61  47.52877 67.50137  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_1               1   FALSE             FALSE        TRUE
# 3               152  42.27671 57.74795  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_1               2   FALSE             FALSE        TRUE
# 4               186  44.61644 49.09589   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_2               0    TRUE             FALSE        TRUE
# 5                41  46.40822 61.87945  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_2               1   FALSE             FALSE        TRUE
# 6               156  48.90685 68.79452  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_2               2   FALSE             FALSE        TRUE
# 7               117  48.79726 53.15342   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_3               0    TRUE             FALSE        TRUE
# 8               120  51.15342 62.64110   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_3               1   FALSE             FALSE        TRUE
# 9                 5  49.71781 61.00000   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_3               2   FALSE             FALSE        TRUE
# 10                6  49.06027 53.80822   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_4               0    TRUE             FALSE        TRUE
# 11               37  43.34521 62.98630  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_4               1   FALSE             FALSE        TRUE
# 12              141  44.55068 60.02192  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_4               2   FALSE             FALSE        TRUE
# 13               45  53.87671 54.77808   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_5               0    TRUE             FALSE        TRUE
# 14              113  46.38904 66.19178  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_5               1   FALSE             FALSE        TRUE
# 15              197  53.88767 70.04658  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_5               2   FALSE             FALSE        TRUE
# 16               27  51.89863 55.41918   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_6               0    TRUE             FALSE        TRUE
# 17              216  41.89589 61.78356  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_6               1   FALSE             FALSE        TRUE
# 18               63  49.53425 69.09315  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_6               2   FALSE             FALSE        TRUE
# 19               53  50.49863 58.37808   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_7               0    TRUE             FALSE        TRUE
# 20               72  49.32603 64.79726  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_7               1   FALSE             FALSE        TRUE
# 21               28  50.69589 70.04658  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_7               2   FALSE             FALSE        TRUE
# 22              210  55.34247 58.79726   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_8               0    TRUE             FALSE        TRUE
# 23               30  44.51507 64.56986  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_8               1   FALSE             FALSE        TRUE
# 24                8  49.34247 69.23014  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_8               2   FALSE             FALSE        TRUE
# 25               19  54.79178 59.59452   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_9               0    TRUE             FALSE        TRUE
# 26               92  47.93151 65.76438   TRUE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_9               1   FALSE             FALSE        TRUE
# 27               57  52.20274 70.04658  FALSE Bank worker|<=2750 KCals   Bank worker|<=2750 KCals_9               2   FALSE             FALSE        TRUE
# 28              132  44.37260 61.59178   TRUE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_11               0    TRUE             FALSE        TRUE
# 29               15  48.91233 68.63836  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_11               1   FALSE             FALSE        TRUE
# 30              161  47.36164 62.75068  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_11               2   FALSE             FALSE        TRUE
# 31              173  51.56438 62.41918   TRUE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_12               0    TRUE             FALSE        TRUE
# 32              128  48.15068 65.03836  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_12               1   FALSE             FALSE        TRUE
# 33               44  54.57534 70.04658  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_12               2   FALSE             FALSE        TRUE
# 34              160  47.84932 62.98356   TRUE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_14               0    TRUE             FALSE        TRUE
# 35              109  48.65753 68.04932  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_14               1   FALSE             FALSE        TRUE
# 36               24  52.73425 70.04658  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_14               2   FALSE             FALSE        TRUE
# 37               69  52.87671 63.66027   TRUE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_15               0    TRUE             FALSE        TRUE
# 38              123  52.16164 69.96438  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_15               1   FALSE             FALSE        TRUE
# 39               52  51.92055 70.04658  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_15               2   FALSE             FALSE        TRUE
# 40               99  53.97534 66.36986   TRUE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_17               0    TRUE             FALSE        TRUE
# 41              177  48.68219 66.40822  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_17               1   FALSE             FALSE        TRUE
# 42               79  55.40000 70.04658  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_17               2   FALSE             FALSE        TRUE
# 43              112  50.66301 68.26849   TRUE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_18               0    TRUE             FALSE        TRUE
# 44               16  54.64110 70.04658  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_18               1   FALSE             FALSE        TRUE
# 45               38  55.10959 70.04658  FALSE Bank worker|<=2750 KCals  Bank worker|<=2750 KCals_18               2   FALSE             FALSE        TRUE
# 46                7  49.68493 67.48767  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 47               12  53.70685 70.04658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 48               18  55.25205 70.04658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 49               21  52.39726 69.20000  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 50               56  54.09589 70.04658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 51               58  46.38356 61.85479  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 52               59  54.69589 70.04658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 53               66  49.10685 64.57808  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 54               68  49.54247 66.51507  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 55               73  46.49589 66.46849  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 56               85  48.05753 63.44658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 57              103  45.51233 64.40000  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 58              114  55.46575 70.04658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 59              131  48.20000 65.08767  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 60              144  41.46027 57.01644  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 61              151  41.29041 56.84658  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 62              154  43.41370 58.96986  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 63              158  49.26027 65.31233  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 64              174  46.79726 65.76986  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 65              184  50.09863 69.32055  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 66              188  51.81096 69.53699  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 67              198  49.36986 64.67397  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 68              201  45.46575 64.43836  FALSE Bank worker|<=2750 KCals Bank worker|<=2750 KCals_999             999   FALSE              TRUE       FALSE
# 69              105  45.49589 47.93151   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_1               0    TRUE             FALSE        TRUE
# 70              139  41.45479 60.50959  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_1               1   FALSE             FALSE        TRUE
# 71              289  46.47945 66.36712  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_1               2   FALSE             FALSE        TRUE
# 72              250  45.47397 49.09589   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_2               0    TRUE             FALSE        TRUE
# 73              130  40.71781 56.27397  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_2               1   FALSE             FALSE        TRUE
# 74              302  40.61918 57.34247  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_2               2   FALSE             FALSE        TRUE
# 75              300  46.92329 50.01096   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_3               0    TRUE             FALSE        TRUE
# 76              275  46.60274 65.99452  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_3               1   FALSE             FALSE        TRUE
# 77               76  43.55342 59.10959  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_3               2   FALSE             FALSE        TRUE
# 78              293  44.61096 51.73973   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_4               0    TRUE             FALSE        TRUE
# 79              147  43.66849 63.55616  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_4               1   FALSE             FALSE        TRUE
# 80              283  45.33151 57.46301   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_4               2   FALSE             FALSE        TRUE
# 81               81  51.03288 52.73425   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_5               0    TRUE             FALSE        TRUE
# 82              276  46.19452 64.99726  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_5               1   FALSE             FALSE        TRUE
# 83              326  39.96712 57.69315  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_5               2   FALSE             FALSE        TRUE
# 84              306  44.93425 53.97808   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_6               0    TRUE             FALSE        TRUE
# 85              334  42.94521 62.50411  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_6               1   FALSE             FALSE        TRUE
# 86              232  41.29041 61.26301  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_6               2   FALSE             FALSE        TRUE
# 87              248  42.17534 55.83836   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_7               0    TRUE             FALSE        TRUE
# 88              243  50.10137 65.15342  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_7               1   FALSE             FALSE        TRUE
# 89              134  43.98630 62.95890  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_7               2   FALSE             FALSE        TRUE
# 90              133  54.12055 57.23288   TRUE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_8               0    TRUE             FALSE        TRUE
# 91              138  52.80274 70.04658  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_8               1   FALSE             FALSE        TRUE
# 92               91  53.53699 70.04658  FALSE  Bank worker|>2750 KCals    Bank worker|>2750 KCals_8               2   FALSE             FALSE        TRUE
# 93              164  49.30137 58.76164   TRUE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_10               0    TRUE             FALSE        TRUE
# 94              159  46.57534 63.54795  FALSE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_10               1   FALSE             FALSE        TRUE
# 95               90  53.41918 63.46301   TRUE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_10               2   FALSE             FALSE        TRUE
# 96              126  51.15616 58.90685   TRUE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_11               0    TRUE             FALSE        TRUE
# 97              116  43.71781 60.44110  FALSE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_11               1   FALSE             FALSE        TRUE
# 98              299  47.24658 64.97260  FALSE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_11               2   FALSE             FALSE        TRUE
# 99              330  51.56986 62.54795   TRUE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_12               0    TRUE             FALSE        TRUE
# 100             288  53.52603 70.04658  FALSE  Bank worker|>2750 KCals   Bank worker|>2750 KCals_12               1   FALSE             FALSE        TRUE
#  [ reached getOption("max.print") -- omitted 237 rows ]

diet.stratified.ccwc %>% {.[c(2, 1, 3)]} #----
diet.stratified.ccwc #----
# > diet.stratified.ccwc %>% {.[c(2, 1, 3)]} #----
# $data
# # A tibble: 337 x 28
#       id doe        dox        dob            y  fail job      month energy height weight   fat fibre energy.grp   chd RowNum_original entry_age exit_age event strata       .event .entry_age
#    <dbl> <date>     <date>     <date>     <dbl> <dbl> <fct>    <dbl>  <dbl>  <dbl>  <dbl> <dbl> <dbl> <fct>      <dbl>           <int>     <dbl>    <dbl> <lgl> <fct>        <lgl>       <dbl>
#  1   305 1970-01-16 1971-07-16 1923-07-01  1.49     3 Bank wo~     1   23.6    NA    NA   11.0  1.30  <=2750 KC~     1              71      46.6     48.1 TRUE  Bank worker~ TRUE         46.6
#  2   200 1966-12-17 1986-12-02 1919-06-19 20.0      0 Bank wo~    12   24.5   178.   73.5 12.8  1.84  <=2750 KC~     0              61      47.5     67.5 FALSE Bank worker~ FALSE        47.5
#  3   332 1971-06-17 1986-12-02 1929-03-18 15.5      0 Bank wo~     6   27.5   174.   68.7 10.0  1.91  <=2750 KC~     0             152      42.3     57.7 FALSE Bank worker~ FALSE        42.3
#  4   324 1971-06-17 1975-12-08 1926-11-15  4.48     1 Bank wo~     6   25.6   173.   85.0 11.3  2.02  <=2750 KC~     1             186      44.6     49.1 TRUE  Bank worker~ TRUE         44.6
#  5   333 1971-06-17 1986-12-02 1925-01-30 15.5      0 Bank wo~     6   20.6   186.   67.4  8.63 1.24  <=2750 KC~     0              41      46.4     61.9 FALSE Bank worker~ FALSE        46.4
#  6   220 1967-01-17 1986-12-02 1918-03-04 19.9      0 Bank wo~     1   27.2   183.   72.1 12.0  1.35  <=2750 KC~     0             156      48.9     68.8 FALSE Bank worker~ FALSE        48.9
#  7   278 1969-04-16 1973-08-23 1920-07-11  4.35     3 Bank wo~     4   25.1   174.   81.2 12.4  1.29  <=2750 KC~     1             117      48.8     53.2 TRUE  Bank worker~ TRUE         48.8
#  8   252 1967-11-17 1979-05-11 1916-10-04 11.5     15 Bank wo~    11   26.7   176.   72.6 11.4  1.82  <=2750 KC~     0             120      51.2     62.6 TRUE  Bank worker~ TRUE         51.2
#  9   247 1968-03-16 1979-06-25 1918-07-10 11.3     13 Bank wo~     3   18.5   178.   97.1  9.15 0.991 <=2750 KC~     1               5      49.7     61   TRUE  Bank worker~ TRUE         49.7
# 10   272 1969-03-16 1973-12-13 1920-03-06  4.74     3 Bank wo~     3   20.3   175.   61.0  8.54 0.765 <=2750 KC~     1               6      49.1     53.8 TRUE  Bank worker~ TRUE         49.1
# # ... with 327 more rows, and 6 more variables: .exit_age <dbl>, MatchingPairID <fct>, MatchingCtrlNum <dbl>, is.Case <lgl>, is.Ctrl.Candidate <lgl>, is.assigned <lgl>
# 
# $tableone_pre
#                        Stratified by event
#                         FALSE        TRUE         p      test
#   n                       257           80                   
#   entry_age (mean (sd)) 49.02 (7.17) 51.05 (6.23)  0.023     
#   exit_age (mean (sd))  64.36 (5.80) 59.34 (6.18) <0.001     
# 
# $tableone_post_total
#                        Stratified by is.Case
#                         FALSE        TRUE         p      test
#   n                       114           57                   
#   entry_age (mean (sd)) 49.84 (6.03) 50.90 (6.38)  0.289     
#   exit_age (mean (sd))  64.86 (4.92) 58.03 (6.22) <0.001  
# > diet.stratified.ccwc #----
# $tableone_pre
#                        Stratified by event
#                         FALSE        TRUE         p      test
#   n                       257           80                   
#   entry_age (mean (sd)) 49.02 (7.17) 51.05 (6.23)  0.023     
#   exit_age (mean (sd))  64.36 (5.80) 59.34 (6.18) <0.001     
# 
# $data
# # A tibble: 337 x 28
#       id doe        dox        dob            y  fail job      month energy height weight   fat fibre energy.grp   chd RowNum_original entry_age exit_age event strata       .event .entry_age
#    <dbl> <date>     <date>     <date>     <dbl> <dbl> <fct>    <dbl>  <dbl>  <dbl>  <dbl> <dbl> <dbl> <fct>      <dbl>           <int>     <dbl>    <dbl> <lgl> <fct>        <lgl>       <dbl>
#  1   305 1970-01-16 1971-07-16 1923-07-01  1.49     3 Bank wo~     1   23.6    NA    NA   11.0  1.30  <=2750 KC~     1              71      46.6     48.1 TRUE  Bank worker~ TRUE         46.6
#  2   200 1966-12-17 1986-12-02 1919-06-19 20.0      0 Bank wo~    12   24.5   178.   73.5 12.8  1.84  <=2750 KC~     0              61      47.5     67.5 FALSE Bank worker~ FALSE        47.5
#  3   332 1971-06-17 1986-12-02 1929-03-18 15.5      0 Bank wo~     6   27.5   174.   68.7 10.0  1.91  <=2750 KC~     0             152      42.3     57.7 FALSE Bank worker~ FALSE        42.3
#  4   324 1971-06-17 1975-12-08 1926-11-15  4.48     1 Bank wo~     6   25.6   173.   85.0 11.3  2.02  <=2750 KC~     1             186      44.6     49.1 TRUE  Bank worker~ TRUE         44.6
#  5   333 1971-06-17 1986-12-02 1925-01-30 15.5      0 Bank wo~     6   20.6   186.   67.4  8.63 1.24  <=2750 KC~     0              41      46.4     61.9 FALSE Bank worker~ FALSE        46.4
#  6   220 1967-01-17 1986-12-02 1918-03-04 19.9      0 Bank wo~     1   27.2   183.   72.1 12.0  1.35  <=2750 KC~     0             156      48.9     68.8 FALSE Bank worker~ FALSE        48.9
#  7   278 1969-04-16 1973-08-23 1920-07-11  4.35     3 Bank wo~     4   25.1   174.   81.2 12.4  1.29  <=2750 KC~     1             117      48.8     53.2 TRUE  Bank worker~ TRUE         48.8
#  8   252 1967-11-17 1979-05-11 1916-10-04 11.5     15 Bank wo~    11   26.7   176.   72.6 11.4  1.82  <=2750 KC~     0             120      51.2     62.6 TRUE  Bank worker~ TRUE         51.2
#  9   247 1968-03-16 1979-06-25 1918-07-10 11.3     13 Bank wo~     3   18.5   178.   97.1  9.15 0.991 <=2750 KC~     1               5      49.7     61   TRUE  Bank worker~ TRUE         49.7
# 10   272 1969-03-16 1973-12-13 1920-03-06  4.74     3 Bank wo~     3   20.3   175.   61.0  8.54 0.765 <=2750 KC~     1               6      49.1     53.8 TRUE  Bank worker~ TRUE         49.1
# # ... with 327 more rows, and 6 more variables: .exit_age <dbl>, MatchingPairID <fct>, MatchingCtrlNum <dbl>, is.Case <lgl>, is.Ctrl.Candidate <lgl>, is.assigned <lgl>
# 
# $tableone_post_total
#                        Stratified by is.Case
#                         FALSE        TRUE         p      test
#   n                       114           57                   
#   entry_age (mean (sd)) 49.84 (6.03) 50.90 (6.38)  0.289     
#   exit_age (mean (sd))  64.86 (4.92) 58.03 (6.22) <0.001     
# 
# attr(,"function.input")
# attr(,"function.input")$data.stratified.ccwc
# function (.mydata, .vars4strata = c("female", "age.cut"), paste.collapse = "|", 
#     ..., varname4event = "failure", varname4entry = ".entry_age", 
#     varname4exit = ".exit_age", varname4origin = NULL, .MatchingRatio = 2, 
#     seed = 1, add_tableone_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, print.map.process = T, 
#     load.dependent.library = T, apply.function.dichotomous2logical = F) 
# {
#     if (!is.data.frame(.mydata)) 
#         stop("!is.data.frame(.mydata)")
#     if (load.dependent.library == T) {
#         library(tidyverse)
#         library(tableone)
#     }
#     select = dplyr::select
#     .mydata$RowNum_original_before_strata = 1:nrow(.mydata)
#     .mydata.strata_list = data.strata_list(.mydata = .mydata, 
#         .vars4strata = .vars4strata, paste.collapse = paste.collapse)
#     if (print.map.process == T) {
#         .mydata.strata_list.ccwc = .mydata.strata_list %>% seq_along %>% 
#             map(function(i, ...) {
#                 print(paste0("map to data.ccwc() with .mydata.strata_list$", 
#                   names(.mydata.strata_list)[i]))
#                 out = .mydata.strata_list[[i]] %>% data.ccwc(...)
#                 out
#             }, varname4event = varname4event, varname4entry = varname4entry, 
#                 varname4exit = varname4exit, varname4origin = varname4origin, 
#                 seed = seed, .MatchingRatio = .MatchingRatio, 
#                 add_tableone_pre_post = F, print.process = print.process, 
#                 RowNum_original_before_strata = "RowNum_original_before_strata", 
#                 apply.na.omit = apply.na.omit, load.dependent.library = F, 
#                 apply.function.dichotomous2logical = apply.function.dichotomous2logical)
#         names(.mydata.strata_list.ccwc) = names(.mydata.strata_list)
#     }
#     else {
#         .mydata.strata_list.ccwc = .mydata.strata_list %>% map(data.ccwc, 
#             varname4event = varname4event, varname4entry = varname4entry, 
#             varname4exit = varname4exit, varname4origin = varname4origin, 
#             seed = seed, .MatchingRatio = .MatchingRatio, add_tableone_pre_post = F, 
#             print.process = F, RowNum_original_before_strata = "RowNum_original_before_strata", 
#             apply.na.omit = apply.na.omit, load.dependent.library = F, 
#             apply.function.dichotomous2logical = apply.function.dichotomous2logical)
#     }
#     out = list()
#     out$tableone_pre = CreateTableOne(vars = c(varname4entry, 
#         varname4exit), strata = varname4event, data = .mydata, 
#         test = T, includeNA = T)
#     warning_lgl = .mydata.strata_list.ccwc %>% map_lgl(function(object) {
#         as.logical(sum(attr(object, "error.message") == "length(unique(.mydata[[varname4event]])) < 2"))
#     })
#     out$data = .mydata.strata_list.ccwc[!warning_lgl] %>% map(function(x) x$data) %>% 
#         reduce(rbind)
#     out$data$MatchingPairID = paste0(out$data$strata, "_", out$data$MatchingPairID) %>% 
#         as.factor
#     if (sum(warning_lgl) > 0) {
#         warning(paste0("length(unique(.mydata[[varname4event]]) < 2", 
#             ": \n", deparse(names(.mydata.strata_list.ccwc)[warning_lgl])))
#     }
#     out$tableone_post_total = CreateTableOne(vars = c(varname4entry, 
#         varname4exit), strata = "is.Case", data = filter(out$data, 
#         is.assigned == T), test = T, includeNA = T)
#     attr(out$data, ".vars4strata") = .vars4strata
#     attr(out$data, ".event") = varname4event
#     attr(out$data, ".entry") = varname4entry
#     attr(out$data, ".exit") = varname4exit
#     attr(out$data, ".MatchingRatio") = .MatchingRatio
#     attr(out$data, "apply.na.omit") = apply.na.omit
#     attr(out, "function.input") = list(data.stratified.ccwc = data.stratified.ccwc, 
#         data.strata_list = data.strata_list, data.ccwc = data.ccwc, 
#         .vars4strata = .vars4strata, varname4event = varname4event, 
#         varname4entry = varname4entry, varname4exit = varname4exit, 
#         .MatchingRatio = .MatchingRatio, apply.na.omit = apply.na.omit)
#     out$data$RowNum_original = out$data$RowNum_original_before_strata
#     out$data$RowNum_original_before_strata = NULL
#     out$data$RowNum_after_na.omit = NULL
#     out
# }
# <bytecode: 0x000000001fc5df78>
# 
# attr(,"function.input")$data.strata_list
# function (.mydata, .vars4strata = c("female", "age.cut"), paste.collapse = "_") 
# {
#     if ("strata" %in% names(.mydata)) 
#         stop("\"strata\" %in% names(.mydata)")
#     .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, 
#         FUN = paste, collapse = paste.collapse)
#     .mydata$strata = .mydata$strata %>% as.factor
#     out = map(levels(.mydata$strata), function(chr) {
#         out2 = .mydata %>% filter(strata == (!(!chr))) %>% as.tibble
#         out2
#     })
#     names(out) = levels(.mydata$strata)
#     attr(out, ".vars4strata") = .vars4strata
#     attr(out, "function.input") = list(data.strata_list = data.strata_list, 
#         .vars4strata = .vars4strata)
#     out
# }
# <bytecode: 0x000000001f7e1188>
# 
# attr(,"function.input")$data.ccwc
# function (.mydata, ..., varname4event = "failure", varname4entry = ".entry_age", 
#     varname4exit = ".exit_age", varname4origin = NULL, .MatchingRatio = 2, 
#     seed = 1, add_tableone_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, 
#     apply.function.dichotomous2logical = F) 
# {
#     if (load.dependent.library == T) {
#         library(tidyverse)
#         library(tableone)
#     }
#     select = dplyr::select
#     if (is.null(.mydata$RowNum_original)) {
#         .mydata$RowNum_original = 1:nrow(.mydata)
#     }
#     Call <- match.call(expand.dots = TRUE)
#     function.dichotomous2logical = function(x, dichotomous2integer = F) {
#         if (is.numeric(x)) {
#             x = as.character(x)
#         }
#         if (is.character(x)) {
#             x = as.factor(x)
#         }
#         if (length(unique(x)) == 1) {
#             warning("length(unique(x)) == 1")
#         }
#         if (!is.null(levels(x))) {
#             if (length(levels(x)) %in% 1:2) {
#                 if (dichotomous2integer == T) {
#                   warning(paste0(ifelse(is.null(levels(x)[1]), 
#                     "NULL", levels(x)[1]), " is coded to 0 & ", 
#                     ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), 
#                     " is coded to 1"))
#                 }
#                 else {
#                   warning(paste0(ifelse(is.null(levels(x)[1]), 
#                     "NULL", levels(x)[1]), " is coded to FALSE & ", 
#                     ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), 
#                     " is coded to TRUE"))
#                 }
#                 x = as.integer(x) - 1
#             }
#             else if (length(levels(x)) > 2) {
#                 stop("length(levels(x)) > 2")
#             }
#         }
#         if (dichotomous2integer == T) {
#             x = as.integer(x)
#         }
#         else {
#             x = as.logical(x)
#         }
#         x
#     }
#     .mydata[[".event"]] = .mydata[[varname4event]] %>% function.dichotomous2logical
#     if (!is.character(varname4entry)) {
#         stop("!is.character(varname4entry)")
#     }
#     else if (!is.character(varname4exit)) {
#         stop("!is.character(varname4exit)")
#     }
#     else if (is.numeric(varname4origin)) {
#         stop("is.numeric(varname4origin)")
#     }
#     else {
#         if (!is.null(varname4origin)) {
#             .mydata[[".entry_age"]] = .mydata[[varname4entry]] - 
#                 .mydata[[varname4origin]]
#             .mydata[[".exit_age"]] = .mydata[[varname4exit]] - 
#                 .mydata[[varname4origin]]
#         }
#         else {
#             .mydata[[".entry_age"]] = .mydata[[varname4entry]]
#             .mydata[[".exit_age"]] = .mydata[[varname4exit]]
#         }
#     }
#     if (length(unique(.mydata[[varname4event]])) < 2) {
#         print("length(unique(.mydata[[varname4event]]) < 2")
#         out = list()
#         out$data = NA
#         attr(out, "error.message") = "length(unique(.mydata[[varname4event]])) < 2"
#     }
#     else {
#         out = list()
#         if (add_tableone_pre_post == T) {
#             out$tableone_pre = CreateTableOne(vars = c(varname4entry, 
#                 varname4exit), strata = varname4event, data = .mydata, 
#                 test = T, includeNA = T)
#         }
#         .mydata = .mydata %>% mutate(MatchingPairID = 999L, MatchingCtrlNum = 999L, 
#             is.Case = F, is.Ctrl.Candidate = T, is.assigned = F)
#         .event.exit_age.unique.sort = .mydata %>% filter(.event == 
#             T) %>% select(.exit_age) %>% unlist %>% unname %>% 
#             unique %>% sort
#         incomplete = 0
#         ties <- FALSE
#         .mydata.ccwc = .mydata
#         for (i in 1:length(.event.exit_age.unique.sort)) {
#             if (print.process == T) 
#                 print(paste0("*** ", i, "-th iteration for .event.exit_age.unique.sort: ", 
#                   .event.exit_age.unique.sort[i]))
#             which.Case = which({
#                 ({
#                   abs(.mydata.ccwc[[".exit_age"]] - .event.exit_age.unique.sort[i]) < 
#                     0.001
#                 }) & .mydata.ccwc[[".event"]] == T & .mydata.ccwc$is.assigned == 
#                   F
#             })
#             if (length(which.Case) == 0) {
#                 if (print.process == T) 
#                   print(paste0("which.Case: ", which.Case))
#                 print(paste0("*** Caution) ", i, "-th iteration for: ", 
#                   .event.exit_age.unique.sort[i], " -> this case may have already been assigned as control"))
#             }
#             else {
#                 if (print.process == T) 
#                   print(paste0("which.Case: ", which.Case))
#                 .mydata.ccwc[which.Case, c("is.Case", "is.assigned")] = T
#                 .mydata.ccwc[which.Case, c("is.Ctrl.Candidate")] = F
#                 .mydata.ccwc[which.Case, c("MatchingPairID")] = i
#                 .mydata.ccwc[which.Case, c("MatchingCtrlNum")] = 0
#                 which.Ctrl.Candidate = which({
#                   .mydata.ccwc$is.Ctrl.Candidate == T & (.mydata.ccwc[[".entry_age"]] <= 
#                     .event.exit_age.unique.sort[i]) & (.mydata.ccwc[[".exit_age"]] >= 
#                     .event.exit_age.unique.sort[i])
#                 })
#                 if (print.process == T) 
#                   print(paste0("which.Ctrl.Candidate: ", deparse(which.Ctrl.Candidate)))
#                 if (.MatchingRatio * length(which.Case) > length(which.Ctrl.Candidate)) {
#                   incomplete = incomplete + 1
#                 }
#                 tmp.nCtrl = min(.MatchingRatio * length(which.Case), 
#                   length(which.Ctrl.Candidate))
#                 if (print.process == T) 
#                   print(paste0("incomplete: ", incomplete))
#                 if (print.process == T) 
#                   print(paste0("tmp.nCtrl: ", tmp.nCtrl))
#                 set.seed(seed + i)
#                 if (print.process == T) 
#                   print(paste0("set.seed: ", seed + i))
#                 which.Ctrl = sample(which.Ctrl.Candidate, size = tmp.nCtrl)
#                 if (print.process == T) 
#                   print(paste0("which.Ctrl: ", deparse(which.Ctrl)))
#                 .mydata.ccwc[which.Ctrl, c("is.assigned")] = T
#                 .mydata.ccwc[which.Ctrl, c("is.Ctrl.Candidate")] = F
#                 .mydata.ccwc[which.Ctrl, c("MatchingPairID")] = i
#                 .mydata.ccwc[which.Ctrl, c("MatchingCtrlNum")] = 1:{
#                   length(which.Ctrl)/length(which.Case)
#                 }
#                 if (print.process == T) 
#                   print(.mydata.ccwc[c(which.Case, which.Ctrl), 
#                     ] %>% select(RowNum_original, .entry_age, 
#                     .exit_age, varname4event, strata, MatchingPairID, 
#                     MatchingCtrlNum, is.Case, is.Ctrl.Candidate, 
#                     is.assigned))
#                 if (any(.mydata.ccwc[which.Ctrl, ".event"] == 
#                   T)) {
#                   print(paste0("*** Caution) a future case has been assigned as a control - RowNum_original: ", 
#                     deparse(.mydata.ccwc[{
#                       which.Ctrl[.mydata.ccwc[which.Ctrl, ".event"] == 
#                         T]
#                     }, ]$RowNum_original)))
#                 }
#                 if (length(which.Case) > 1) {
#                   ties <- TRUE
#                   print(paste0("** ties in RowNum_original: ", 
#                     deparse(.mydata.ccwc[which.Case, ]$RowNum_original)))
#                 }
#             }
#         }
#         out$data = .mydata.ccwc %>% arrange(MatchingPairID, MatchingCtrlNum)
#         if (add_tableone_pre_post == T) {
#             out$tableone_post_total = CreateTableOne(vars = c(varname4entry, 
#                 varname4exit), strata = "is.Case", data = filter(.mydata.ccwc, 
#                 is.assigned == T), test = T, includeNA = T)
#         }
#     }
#     attr(out$data, ".event") = varname4event
#     attr(out$data, ".entry") = varname4entry
#     attr(out$data, ".exit") = varname4exit
#     attr(out$data, ".origin") = varname4origin
#     attr(out$data, ".MatchingRatio") = .MatchingRatio
#     attr(out$data, "apply.na.omit") = apply.na.omit
#     attr(out, "function.input") = list(Call = match.call(expand.dots = TRUE), 
#         fun = data.ccwc, varname4event = varname4event, varname4entry = varname4entry, 
#         varname4exit = varname4exit, varname4origin = varname4origin, 
#         .MatchingRatio = .MatchingRatio, apply.na.omit = apply.na.omit, 
#         apply.function.dichotomous2logical = apply.function.dichotomous2logical)
#     if (is.data.frame(out$data)) {
#         out$data$RowNum_after_na.omit = NULL
#     }
#     out
# }
# <bytecode: 0x000000000305ff08>
# 
# attr(,"function.input")$.vars4strata
# [1] "job"        "energy.grp"
# 
# attr(,"function.input")$varname4event
# [1] "event"
# 
# attr(,"function.input")$varname4entry
# [1] "entry_age"
# 
# attr(,"function.input")$varname4exit
# [1] "exit_age"
# 
# attr(,"function.input")$.MatchingRatio
# [1] 2
# 
# attr(,"function.input")$apply.na.omit
# [1] FALSE
# 





#@ end -----
