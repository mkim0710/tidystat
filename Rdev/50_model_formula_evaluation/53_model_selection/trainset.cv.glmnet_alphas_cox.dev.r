# trainset.cv.glmnet_alphas_cox.dev.r

#@@@ trainset.cv.glmnet_alphas_cox = function( ======  
trainset.cv.glmnet_alphas_cox = function(
    trainset, myFormula
    , alphas = c(1, 0.5)
    , glmnet.family = "cox", my.type.measure = "deviance"
    , na.omit.needed = F
    , return.glmnet.objects = T
    , saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha = F
    , return_name = NULL
    , itrainset = NULL
    , imyFormula = NULL
    , save.png = TRUE
    , png.size = 1280, seed = 1, nfolds = 5
) { 
    library( glmnet ); library( useful ); # library( coefplot ) 
    library(survival)
    
    trainset_dim = dim(trainset)
    trainset_dimnames = dimnames(trainset)
    # # Browse[2]> trainset[1:2,] |> deparse() |> cat("  \n", sep="")
    # # structure(list(is.Case = c(FALSE, FALSE), EndTime = c(7, 7),      Sex = structure(c(1L, 1L), .Label = c("Female", "Male"), class = "factor"),      AgeDecade = c(4, 4), AcquiredHypothyroidism = c(FALSE, FALSE     ), AdjustmentDisorder = c(FALSE, FALSE), Anemia = c(FALSE,      FALSE), Anxiety = c(FALSE, TRUE), Arthritis = c(TRUE, FALSE     ), AtrialFibrillation = c(FALSE, FALSE), BenignProstatic = c(FALSE,      FALSE), BrainInjury = c(FALSE, FALSE), Cataract = c(FALSE,      FALSE), ChronicKidney = c(FALSE, FALSE), Diabetes = c(FALSE,      FALSE), Dysthymia = c(FALSE, FALSE), Epilepsy = c(FALSE,      FALSE), Fibromyalgia_Pain_Fatigue = c(TRUE, TRUE), Glaucoma = c(FALSE,      FALSE), HearingImpairment = c(FALSE, FALSE), HeartFailure = c(FALSE,      FALSE), Hyperlipidemia = c(TRUE, FALSE), Hypertension = c(FALSE,      FALSE), IschemicHeart = c(FALSE, FALSE), Migraine_ChronicHeadache = c(FALSE,      FALSE), MobilityImpairments = c(FALSE, FALSE), Osteoporosis = c(FALSE,      FALSE), PelvicFx = c(FALSE, FALSE), PersonalityDisorders = c(FALSE,      FALSE), SpinalCordInjury = c(FALSE, FALSE), StrokeTIA = c(FALSE,      FALSE), AlzheimerDementia = c(FALSE, FALSE), LiverDisease = c(TRUE,      FALSE), ObstructiveLungDisease = c(FALSE, FALSE), CancerSurvivors = c(FALSE,      FALSE)), .Names = c("is.Case", "EndTime", "Sex", "AgeDecade",  "AcquiredHypothyroidism", "AdjustmentDisorder", "Anemia", "Anxiety",  "Arthritis", "AtrialFibrillation", "BenignProstatic", "BrainInjury",  "Cataract", "ChronicKidney", "Diabetes", "Dysthymia", "Epilepsy",  "Fibromyalgia_Pain_Fatigue", "Glaucoma", "HearingImpairment",  "HeartFailure", "Hyperlipidemia", "Hypertension", "IschemicHeart",  "Migraine_ChronicHeadache", "MobilityImpairments", "Osteoporosis",  "PelvicFx", "PersonalityDisorders", "SpinalCordInjury", "StrokeTIA",  "AlzheimerDementia", "LiverDisease", "ObstructiveLungDisease",  "CancerSurvivors"), row.names = 1:2, class = "data.frame")
    # trainset = structure(list(is.Case = c(FALSE, FALSE), EndTime = c(7, 7),      Sex = structure(c(1L, 1L), .Label = c("Female", "Male"), class = "factor"),      AgeDecade = c(4, 4), AcquiredHypothyroidism = c(FALSE, FALSE     ), AdjustmentDisorder = c(FALSE, FALSE), Anemia = c(FALSE,      FALSE), Anxiety = c(FALSE, TRUE), Arthritis = c(TRUE, FALSE     ), AtrialFibrillation = c(FALSE, FALSE), BenignProstatic = c(FALSE,      FALSE), BrainInjury = c(FALSE, FALSE), Cataract = c(FALSE,      FALSE), ChronicKidney = c(FALSE, FALSE), Diabetes = c(FALSE,      FALSE), Dysthymia = c(FALSE, FALSE), Epilepsy = c(FALSE,      FALSE), Fibromyalgia_Pain_Fatigue = c(TRUE, TRUE), Glaucoma = c(FALSE,      FALSE), HearingImpairment = c(FALSE, FALSE), HeartFailure = c(FALSE,      FALSE), Hyperlipidemia = c(TRUE, FALSE), Hypertension = c(FALSE,      FALSE), IschemicHeart = c(FALSE, FALSE), Migraine_ChronicHeadache = c(FALSE,      FALSE), MobilityImpairments = c(FALSE, FALSE), Osteoporosis = c(FALSE,      FALSE), PelvicFx = c(FALSE, FALSE), PersonalityDisorders = c(FALSE,      FALSE), SpinalCordInjury = c(FALSE, FALSE), StrokeTIA = c(FALSE,      FALSE), AlzheimerDementia = c(FALSE, FALSE), LiverDisease = c(TRUE,      FALSE), ObstructiveLungDisease = c(FALSE, FALSE), CancerSurvivors = c(FALSE,      FALSE)), .Names = c("is.Case", "EndTime", "Sex", "AgeDecade",  "AcquiredHypothyroidism", "AdjustmentDisorder", "Anemia", "Anxiety",  "Arthritis", "AtrialFibrillation", "BenignProstatic", "BrainInjury",  "Cataract", "ChronicKidney", "Diabetes", "Dysthymia", "Epilepsy",  "Fibromyalgia_Pain_Fatigue", "Glaucoma", "HearingImpairment",  "HeartFailure", "Hyperlipidemia", "Hypertension", "IschemicHeart",  "Migraine_ChronicHeadache", "MobilityImpairments", "Osteoporosis",  "PelvicFx", "PersonalityDisorders", "SpinalCordInjury", "StrokeTIA",  "AlzheimerDementia", "LiverDisease", "ObstructiveLungDisease",  "CancerSurvivors"), row.names = 1:2, class = "data.frame")
    trainset_colnames_levels = data_frame(
        colNum_original = 1:ncol(trainset)
        , colnames = colnames(trainset)
        , colnames_levels = colnames(trainset)
        , col_class = map_chr(trainset, class)
        , col_Nlevels = map_chr(trainset, function(x) as.integer(max(1, {length(levels(x))} )) )
    )
    trainset_colnames_levels = trainset_colnames_levels[unlist(map2(1:ncol(trainset), trainset_colnames_levels$col_Nlevels, rep)), ]
    # map(trainset, function(x) ifelse(is.factor(x), levels(x), NA))
    trainset_colnames_levels$colnames_levels = 
        paste0(
            trainset_colnames_levels$colnames
            , unlist(map(trainset, function(x) {
                if (is.factor(x)) {y = levels(x)}
                else if (is.logical(x)) {y = "TRUE"}
                else {y = ""}
                y
            }))
            
        )
    # trainset_colnames_levels

    return_name.input = return_name
    if (is.null(return_name)) {
        if (deparse(substitute(trainset)) == ".") {
            #@ need to work further ----
            return_name = "trainset"
        } else {
            return_name = deparse(substitute(trainset))
        }
    }        
    paste_itrainset = NULL
    if (!is.null(itrainset)) {
        if (length(itrainset) > 1) {
            print("error) length(itrainset) > 1")
        } else {
            paste_itrainset = paste0("_", itrainset)
        }
    }
    paste_imyFormula = NULL
    if (!is.null(imyFormula)) {
        if (length(imyFormula) > 1) {
            print("error) length(imyFormula) > 1")
        } else {
            paste_imyFormula = paste0("_", imyFormula)
        }
    }
    
    if (return.glmnet.objects != T & saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha != T) {
        stop("return.glmnet.objects != T & saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha != T")
    }
    if (na.omit.needed != F) {
        nrow1 = nrow(trainset)
        trainset = na.omit(trainset)
        nrow2 = nrow(trainset)
        print(paste0("na.omit.needed == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
    }
    trainset = as.data.frame(trainset)
    # print(paste0("dim(trainset) : ", deparse(dim(trainset)) ))
    x <- build.x(myFormula, data = trainset, contrast = FALSE)[,-1]
    build.x.colnames_levels = dimnames(x)[[2]]
    
    trainset_colnames_levels$build.x.colnames_levels = as.logical(NA)
    trainset_colnames_levels$build.x.colnames_levels[
        trainset_colnames_levels$colnames_levels %in% build.x.colnames_levels
        ] = T

    # print(paste0("dim(x) : ", deparse(dim(x)) ))
    # print(paste0("any(colSums(x) == 0) : ", deparse(any(colSums(x) == 0)) ))
    # print(paste0("which(colSums(x) == 0) : ", deparse(which(colSums(x) == 0)) ))
    colnames_levels.colSums0 = colnames(x)[which(colSums(x) == 0)]
    
    trainset_colnames_levels$colnames_levels.colSums0 = as.logical(NA)
    trainset_colnames_levels$colnames_levels.colSums0[
        trainset_colnames_levels$colnames_levels %in% colnames_levels.colSums0
    ] = T

    if (length(colnames_levels.colSums0) >= 1) {
        print(paste0("any(colSums(x) == 0) == T : removing columns: ", deparse(colnames_levels.colSums0) ))
        x = x[,!colnames(x) %in% colnames_levels.colSums0]  # 170522 remove columns with only 0
        trainset = trainset[,!colnames(trainset) %in% colnames_levels.colSums0]  # trainset is used toin Call.model.frame
        # print(paste0("dim(x) : ", deparse(dim(x)) ))
    }
    
    if(nrow(x) != nrow(trainset)) {print("error - model.matrix size should be less than 2^31");  print(paste0("dim(x) : ", deparse(dim(x)) ));  stop() } # error found on 2017 May 7
    
    ?aeqSurv
    
    # y = trainset[,c(varname4time, varname4event)]; y[,1] = as.numeric(y[,1]); if ( max(y[,1]) > 13 ) { y[,1] = y[,1]/365 }
    # colnames(y) = c("time", "status"); y = as.matrix(y)
    #@ reference) coxph -----
    Call <- match.call()
    indx = match(c("myFormula", "trainset"), names(Call), nomatch = 0)
    if (indx[1] ==0) stop("A formula argument is required")
    Call.model.frame = Call[c(1, indx)]  # only keep the arguments we wanted
    Call.model.frame[[1L]] = quote(stats::model.frame)  # change the function called
    names(Call.model.frame)[2:3] = c("formula", "data")
    
    mf = eval(Call.model.frame, parent.frame())
    if (nrow(mf) ==0) stop("No (non-missing) observations")
    Terms <- terms(mf)
    trainset_colnames_levels$Terms.term.labels = as.logical(NA)
    trainset_colnames_levels$Terms.term.labels[
        trainset_colnames_levels$colnames %in% attr(Terms, "term.labels")
        ] = T
    
    terms.inner <- function(x) {
        if (inherits(x, "formula")) {
            if (length(x) ==3) c(terms.inner(x[[2]]), terms.inner(x[[3]]))
            else terms.inner(x[[2]])
        }
        else if (class(x)== "call" &&
                 (x[[1]] != as.name("$") && x[[1]] != as.name("["))) {
            if (x[[1]] == '+' || x[[1]]== '*' || x[[1]] == '-') {
                # terms in a model equation, unary minus only has one argument
                if (length(x)==3) c(terms.inner(x[[2]]), terms.inner(x[[3]]))
                else terms.inner(x[[2]])
            }
            else if (x[[1]] == as.name("Surv"))
                unlist(lapply(x[-1], terms.inner))
            else terms.inner(x[[2]])
        }
        else(deparse(x))
    }
    if (length(attr(Terms, 'variables')) > 2) { # a ~1 formula has length 2
        varname4y <- terms.inner(myFormula[1:2])
        varname4x <- terms.inner(myFormula[c(1,3)])
        if (any(!is.na(match(varname4y, varname4x))))
            warning("a variable appears on both the left and right sides of the formula")
    }
    trainset_colnames_levels$terms.inner = as.character(NA)
    trainset_colnames_levels$terms.inner[
        trainset_colnames_levels$colnames %in% varname4x
        ] = "varname4x"
    trainset_colnames_levels$terms.inner[
        trainset_colnames_levels$colnames %in% varname4y
        ] = "varname4y"
    trainset_colnames_levels$terms.inner = trainset_colnames_levels$terms.inner |> as.factor()
    
    mf.response <- model.extract(mf, "response")
    if (!inherits(mf.response, "Surv")) stop("Response must be a survival object")
    # browser()
    # Browse[2]> mf.response |> str()
    # Surv [1:1000, 1:2]  1.76878   0.54528   0.04486+  0.85032+  0.61488   0.29861+  0.01717+ 15.97135   0.64802   1.91448+ ...
    # - attr(*, "dimnames")=List of 2
    # ..$ : chr [1:1000] "1" "2" "3" "4" ...
    # ..$ : chr [1:2] "time" "status"
    # - attr(*, "type")= chr "right"
    # Browse[2]> mf.response |> as.matrix() |> str()
    # num [1:1000, 1:2] 1.7688 0.5453 0.0449 0.8503 0.6149 ...
    # - attr(*, "dimnames")=List of 2
    # ..$ : chr [1:1000] "1" "2" "3" "4" ...
    # ..$ : chr [1:2] "time" "status"
    
    # help(glmnet)
    # # For family="cox", y should be a two-column matrix with columns named 'time' and 'status'. The latter is a binary variable, with '1' indicating death, and '0' indicating right censored. The function Surv() in package survival produces such a matrix.
    y = mf.response
    
    # train <- 1:nrow(x) ;  # set.seed( seed ) ; train <- sample( 1:nrow(x) , nrow(x)/2 ) ; test <- ( -train ) 
    return_list = alphas %>% seq_along %>% map(function(i_alpha) {
        print(paste0("Beginning .f() map from alphas [", i_alpha, "] valued : ", alphas[i_alpha] ))
        Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
        
        return_name.i.tmp = paste0(return_name,paste_itrainset,".cv.glmnet",paste_imyFormula,"_a", alphas[i_alpha])
        set.seed( seed ) 
        # out = cv.glmnet(x[train,], y[train], alpha = alphas[i_alpha], family="binomial", type.measure = my.type.measure, nfolds = nfolds)
        out = cv.glmnet(x, y, alpha = alphas[i_alpha], family=glmnet.family, type.measure = my.type.measure, nfolds = nfolds)
        
        if (saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha == T) {
            saveRDS(out, paste0(return_name.i.tmp, ".rds"))
            print(paste0("saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha == T : ", paste0(return_name.i.tmp, ".rds") ))
        }
        if(save.png == TRUE) {
            png(paste0(return_name.i.tmp , "_plot.png"), width=png.size, height =  png.size, units = "px", bg = "transparent")
            plot(out, main =  paste0(return_name.i.tmp, "_plot"), cex.main = 0.5)
            dev.off()
            print(paste0("plot(object_cvglmnet) : ", paste0(return_name.i.tmp , "_plot.png") ))
        }
        
        if (return.glmnet.objects != T) {
            out = list(saveRDS = paste0(return_name.i.tmp, ".rds"), png = paste0(return_name.i.tmp , "_plot.png"))
        }
        Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) )); gc()
        attr(out, "alphas[i_alpha]") = alphas[i_alpha]
        attr(out, "function.input") = list(
            Call = match.call(expand.dots = TRUE)
            , CreatedDate = Sys.time()
            , functionUsed = trainset.cv.glmnet_alphas_cox
            , trainset_name = deparse(substitute(trainset))
            , trainset_dim = trainset_dim
            , trainset_dimnames = trainset_dimnames
            , colnames_levels.colSums0 = colnames_levels.colSums0
            , trainset_dim.rm.colSums0 = dim(trainset)
            , trainset_dimnames.rm.colSums0 = dimnames(trainset)
            , myFormula = myFormula
            , build.x.colnames_levels = build.x.colnames_levels
            , Terms = Terms
            , varname4y = varname4y
            , varname4x = varname4x
            , trainset_colnames_levels = trainset_colnames_levels
            , alphas = alphas
            , glmnet.family = glmnet.family, my.type.measure = my.type.measure
            , na.omit.needed = na.omit.needed
            , return.glmnet.objects = return.glmnet.objects
            , saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha = saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha
            , return_name = return_name.input
            , itrainset = itrainset
            , imyFormula = imyFormula
            , save.png = save.png
            , png.size = png.size, seed = seed, nfolds = nfolds
        ) # list inside attr() is not shown with str(max.level = 1)
        out
    })
    # names(return_list) = paste0(return_name,paste_itrainset,".cv.glmnet",paste_imyFormula,"_a", alphas)
    out = return_list
    names(out) = paste0("alpha", alphas) 
    # attr(out, "function.input") = match.call(expand.dots = TRUE)   # list inside attr() is not shown with str(max.level = 1)
    attr(out, "function.input") = list(
        Call = match.call(expand.dots = TRUE)
        , CreatedDate = Sys.time()
        , functionUsed = trainset.cv.glmnet_alphas_cox
        , trainset_name = deparse(substitute(trainset))
        , trainset_dim = trainset_dim
        , trainset_dimnames = trainset_dimnames
        , colnames_levels.colSums0 = colnames_levels.colSums0
        , trainset_dim.rm.colSums0 = dim(trainset)
        , trainset_dimnames.rm.colSums0 = dimnames(trainset)
        , myFormula = myFormula
        , build.x.colnames_levels = build.x.colnames_levels
        , Terms = Terms
        , varname4y = varname4y
        , varname4x = varname4x
        , trainset_colnames_levels = trainset_colnames_levels
        , alphas = alphas
        , glmnet.family = glmnet.family, my.type.measure = my.type.measure
        , na.omit.needed = na.omit.needed
        , return.glmnet.objects = return.glmnet.objects
        , saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha = saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha
        , return_name = return_name.input
        , itrainset = itrainset
        , imyFormula = imyFormula
        , save.png = save.png
        , png.size = png.size, seed = seed, nfolds = nfolds
    ) # list inside attr() is not shown with str(max.level = 1)
    # print( paste0( return_name , ".cv.glmnet_alphas" ) ); # assign( paste0( return_name, ".cv.glmnet_alphas" ) , return_list , envir=.GlobalEnv) 
    out}  ;   # save.image() # update 170509

#@ test) trainset.cv.glmnet_alphas_cox() CoxExample_tibble ----  
# library(glmnet)
# data(CoxExample)
# CoxExample_tibble = bind_cols(as_tibble(y), as_tibble(x))
# save(CoxExample_tibble, file = "library_glmnet_CoxExample_tibble.rda")
library(tidyverse)
load("library_glmnet_CoxExample_tibble.rda")
CoxExample_tibble |> as_tibble()
# > CoxExample_tibble |> as_tibble()
# # A tibble: 1,000 x 32
#           time status         V1         V2          V3          V4          V5         V6          V7
#          <dbl>  <dbl>      <dbl>      <dbl>       <dbl>       <dbl>       <dbl>      <dbl>       <dbl>
#  1  1.76877757      1 -0.8767670 -0.6135224 -0.56757380  0.66215994  1.82218019 -1.0906678 -0.33186564
#  2  0.54528404      1 -0.7463894 -1.7519457  0.28545898  1.13921055  0.80178007  1.8501985  0.30663005
#  3  0.04485918      0  1.3759148 -0.2641132  0.88727408  0.38418702  0.05751801 -1.0917341  0.82119791
#  4  0.85032298      0  0.2375820  0.7859162 -0.89670281 -0.83393380 -0.58237643  0.1874136 -0.58595131
#  5  0.61488426      1  0.1086275  0.4665686 -0.57637261  1.70413136  0.32750715 -0.1211972  0.88537209
#  6  0.29860939      0  1.2027213 -0.4187073 -0.05735193  0.59484915  0.44328682 -0.1191545  0.08097645
#  7  0.01717398      0 -0.4590724  0.4140486  0.87286118  1.37656346  0.96739058  1.2219487  2.88408284
#  8 15.97135012      1  0.6403460  0.9754372 -0.38440407  0.02511687  0.74576547  1.5326117 -1.67808726
#  9  0.64801614      1  0.4167875  0.8356885  1.54530465 -1.02988660 -1.23843050 -0.7730188  0.36102521
# 10  1.91448321      0  0.7765431  0.8140571 -0.42338915 -0.44327120  0.02147758  1.0137511  0.61859979
# # ... with 990 more rows, and 23 more variables: V8 <dbl>, V9 <dbl>, V10 <dbl>, V11 <dbl>, V12 <dbl>,
# #   V13 <dbl>, V14 <dbl>, V15 <dbl>, V16 <dbl>, V17 <dbl>, V18 <dbl>, V19 <dbl>, V20 <dbl>, V21 <dbl>,
# #   V22 <dbl>, V23 <dbl>, V24 <dbl>, V25 <dbl>, V26 <dbl>, V27 <dbl>, V28 <dbl>, V29 <dbl>, V30 <dbl>

# debug(trainset.cv.glmnet_alphas_cox)
CoxExample_tibble.cv.glmnet_alphas_cox =
    CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time, status)~., itrainset = NULL, imyFormula = NULL,save.png = F)
# undebug(trainset.cv.glmnet_alphas_cox)
save(CoxExample_tibble.cv.glmnet_alphas_cox, file = "CoxExample_tibble.cv.glmnet_alphas_cox.rda")
CoxExample_tibble.cv.glmnet_alphas_cox |> str(max.level = 1)
CoxExample_tibble.cv.glmnet_alphas_cox =
    CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time = time, event = status)~., itrainset = "itrainset", imyFormula = "imyFormula",save.png = T)
CoxExample_tibble.cv.glmnet_alphas_cox |> str(max.level = 1)
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") |> str(max.level = 1)
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels} %>% dplyr::filter(colnames_levels.colSums0 == T)
# > CoxExample_tibble.cv.glmnet_alphas_cox =
# +     CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time, status)~., itrainset = NULL, imyFormula = NULL,save.png = F)
# [1] "Beginning .f() map from alphas [1] valued : 1"
# [1] "Sys.time_1 : 2017-12-30 19:03:28"
# [1] "Sys.time_2 - Sys.time_1 : structure(0.799239873886108, units = \"secs\", class = \"difftime\")"
# [1] "Beginning .f() map from alphas [2] valued : 0.5"
# [1] "Sys.time_1 : 2017-12-30 19:03:30"
# [1] "Sys.time_2 - Sys.time_1 : structure(0.80761981010437, units = \"secs\", class = \"difftime\")"
# > # undebug(trainset.cv.glmnet_alphas_cox)
# > CoxExample_tibble.cv.glmnet_alphas_cox |> str(max.level = 1)
# List of 2
#  $ alpha1  :List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#   ..- attr(*, "alphas[i_alpha]")= num 1
#   ..- attr(*, "function.input")=List of 28
#  $ alpha0.5:List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#   ..- attr(*, "alphas[i_alpha]")= num 0.5
#   ..- attr(*, "function.input")=List of 28
#  - attr(*, "function.input")=List of 28
# > CoxExample_tibble.cv.glmnet_alphas_cox =
# +     CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time = time, event = status)~., itrainset = "itrainset", imyFormula = "imyFormula",save.png = T)
# [1] "Beginning .f() map from alphas [1] valued : 1"
# [1] "Sys.time_1 : 2017-12-30 19:03:31"
# [1] "plot(object_cvglmnet) : trainset_itrainset.cv.glmnet_imyFormula_a1_plot.png"
# [1] "Sys.time_2 - Sys.time_1 : structure(1.04684090614319, units = \"secs\", class = \"difftime\")"
# [1] "Beginning .f() map from alphas [2] valued : 0.5"
# [1] "Sys.time_1 : 2017-12-30 19:03:33"
# [1] "plot(object_cvglmnet) : trainset_itrainset.cv.glmnet_imyFormula_a0.5_plot.png"
# [1] "Sys.time_2 - Sys.time_1 : structure(1.00568795204163, units = \"secs\", class = \"difftime\")"
# > CoxExample_tibble.cv.glmnet_alphas_cox |> str(max.level = 1)
# List of 2
#  $ alpha1  :List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#   ..- attr(*, "alphas[i_alpha]")= num 1
#   ..- attr(*, "function.input")=List of 28
#  $ alpha0.5:List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#   ..- attr(*, "alphas[i_alpha]")= num 0.5
#   ..- attr(*, "function.input")=List of 28
#  - attr(*, "function.input")=List of 28
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") |> str(max.level = 1)
# List of 28
#  $ Call                                                     : language trainset.cv.glmnet_alphas_cox(trainset = ., myFormula = Surv(time = time, event = status) ~ ., itrainset = "itrai| __truncated__
#  $ CreatedDate                                              : POSIXct[1:1], format: "2017-12-30 19:03:34"
#  $ functionUsed                                             :function (trainset, myFormula, alphas = c(1, 0.5), glmnet.family = "cox", my.type.measure = "deviance", na.omit.needed = F, return.glmnet.objects = T, saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha = F, 
#     return_name = NULL, itrainset = NULL, imyFormula = NULL, save.png = TRUE, png.size = 1280, seed = 1, nfolds = 5)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 33 267 8 33 8 1 267
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000024c84698> 
#  $ trainset_name                                            : chr [1:7840] "structure(list(time = c(1.7687775658842, 0.545284044924978, 0.0448591779898214, " "0.850322982646606, 0.614884258533517, 0.298609393241967, 0.0171739813784381, " "15.9713501150213, 0.648016143423707, 1.91448321146452, 1.37737581822182, " "0.504883313673581, 0.175484415215699, 0.0502979398859797, 1.77155865113711, " ...
#  $ trainset_dim                                             : int [1:2] 1000 32
#  $ trainset_dimnames                                        :List of 2
#  $ colnames_levels.colSums0                                 : chr(0) 
#  $ trainset_dim.rm.colSums0                                 : int [1:2] 1000 32
#  $ trainset_dimnames.rm.colSums0                            :List of 2
#  $ myFormula                                                :Class 'formula'  language Surv(time = time, event = status) ~ .
#   .. ..- attr(*, ".Environment")=<environment: 0x0000000025a62620> 
#  $ build.x.colnames_levels                                  : chr [1:30] "V1" "V2" "V3" "V4" ...
#  $ Terms                                                    :Classes 'terms', 'formula'  language Surv(time = time, event = status) ~ V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9 + V10 + V11 + V12 + V13 + V14 + V1| __truncated__
#   .. ..- attr(*, "variables")= language list(Surv(time = time, event = status), V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V1| __truncated__
#   .. ..- attr(*, "factors")= int [1:31, 1:30] 0 1 0 0 0 0 0 0 0 0 ...
#   .. .. ..- attr(*, "dimnames")=List of 2
#   .. ..- attr(*, "term.labels")= chr [1:30] "V1" "V2" "V3" "V4" ...
#   .. ..- attr(*, "order")= int [1:30] 1 1 1 1 1 1 1 1 1 1 ...
#   .. ..- attr(*, "intercept")= int 1
#   .. ..- attr(*, "response")= int 1
#   .. ..- attr(*, ".Environment")=<environment: 0x0000000025a62620> 
#   .. ..- attr(*, "predvars")= language list(Surv(time = time, event = status), V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V1| __truncated__
#   .. ..- attr(*, "dataClasses")= Named chr [1:31] "nmatrix.2" "numeric" "numeric" "numeric" ...
#   .. .. ..- attr(*, "names")= chr [1:31] "Surv(time = time, event = status)" "V1" "V2" "V3" ...
#  $ varname4y                                                : Named chr [1:2] "time" "status"
#   ..- attr(*, "names")= chr [1:2] "time" "event"
#  $ varname4x                                                : chr "."
#  $ trainset_colnames_levels                                 :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	32 obs. of  9 variables:
#  $ alphas                                                   : num [1:2] 1 0.5
#  $ glmnet.family                                            : chr "cox"
#  $ my.type.measure                                          : chr "deviance"
#  $ na.omit.needed                                           : logi FALSE
#  $ return.glmnet.objects                                    : logi TRUE
#  $ saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha: logi FALSE
#  $ return_name                                              : NULL
#  $ itrainset                                                : chr "itrainset"
#  $ imyFormula                                               : chr "imyFormula"
#  $ save.png                                                 : logi TRUE
#  $ png.size                                                 : num 1280
#  $ seed                                                     : num 1
#  $ nfolds                                                   : num 5
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
# # A tibble: 32 x 9
#    colNum_original colnames colnames_levels col_class col_Nlevels build.x.colnames_levels colnames_levels.colSums0 Terms.term.labels terms.inner
#              <int>    <chr>           <chr>     <chr>       <chr>                   <lgl>                    <lgl>             <lgl>      <fctr>
#  1               1     time            time   numeric           1                      NA                       NA                NA   varname4y
#  2               2   status          status   numeric           1                      NA                       NA                NA   varname4y
#  3               3       V1              V1   numeric           1                    TRUE                       NA              TRUE        <NA>
#  4               4       V2              V2   numeric           1                    TRUE                       NA              TRUE        <NA>
#  5               5       V3              V3   numeric           1                    TRUE                       NA              TRUE        <NA>
#  6               6       V4              V4   numeric           1                    TRUE                       NA              TRUE        <NA>
#  7               7       V5              V5   numeric           1                    TRUE                       NA              TRUE        <NA>
#  8               8       V6              V6   numeric           1                    TRUE                       NA              TRUE        <NA>
#  9               9       V7              V7   numeric           1                    TRUE                       NA              TRUE        <NA>
# 10              10       V8              V8   numeric           1                    TRUE                       NA              TRUE        <NA>
# # ... with 22 more rows
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels} %>% dplyr::filter(colnames_levels.colSums0 == T)
# # A tibble: 0 x 9
# # ... with 9 variables: colNum_original <int>, colnames <chr>, colnames_levels <chr>, col_class <chr>, col_Nlevels <chr>, build.x.colnames_levels <lgl>,
# #   colnames_levels.colSums0 <lgl>, Terms.term.labels <lgl>, terms.inner <fctr>



#@ test) trainset.cv.glmnet_alphas_cox() trainsetCC69agg4i07_829 ----  
library(tidyverse)
load("trainsetCC69agg4i07_829.rda")
trainsetCC69agg4i07_829 |> as_tibble()
# > trainsetCC69agg4i07_829 |> as_tibble()
# # A tibble: 1,658 x 35
#    is.Case EndTime    Sex AgeDecade AcquiredHypothyroidism AdjustmentDisorder Anemia Anxiety Arthritis AtrialFibrillation BenignProstatic BrainInjury Cataract
#      <lgl>   <dbl> <fctr>     <dbl>                  <lgl>              <lgl>  <lgl>   <lgl>     <lgl>              <lgl>           <lgl>       <lgl>    <lgl>
#  1   FALSE       7 Female         4                  FALSE              FALSE  FALSE   FALSE      TRUE              FALSE           FALSE       FALSE    FALSE
#  2   FALSE       7 Female         4                  FALSE              FALSE  FALSE    TRUE     FALSE              FALSE           FALSE       FALSE    FALSE
#  3   FALSE       7   Male         4                  FALSE              FALSE  FALSE   FALSE     FALSE              FALSE           FALSE       FALSE     TRUE
#  4   FALSE       7   Male         4                  FALSE              FALSE  FALSE    TRUE     FALSE              FALSE           FALSE       FALSE    FALSE
#  5   FALSE       7 Female         4                  FALSE              FALSE  FALSE   FALSE      TRUE              FALSE           FALSE       FALSE    FALSE
#  6   FALSE       7 Female         4                   TRUE              FALSE  FALSE   FALSE      TRUE              FALSE           FALSE       FALSE    FALSE
#  7   FALSE       7 Female         4                   TRUE              FALSE  FALSE   FALSE     FALSE              FALSE           FALSE       FALSE    FALSE
#  8   FALSE       4 Female         4                  FALSE              FALSE  FALSE   FALSE      TRUE              FALSE           FALSE       FALSE    FALSE
#  9   FALSE       7 Female         4                  FALSE              FALSE  FALSE    TRUE      TRUE              FALSE           FALSE       FALSE    FALSE
# 10   FALSE       7 Female         4                  FALSE              FALSE  FALSE   FALSE      TRUE              FALSE           FALSE       FALSE    FALSE
# # ... with 1,648 more rows, and 22 more variables: ChronicKidney <lgl>, Diabetes <lgl>, Dysthymia <lgl>, Epilepsy <lgl>, Fibromyalgia_Pain_Fatigue <lgl>,
# #   Glaucoma <lgl>, HearingImpairment <lgl>, HeartFailure <lgl>, Hyperlipidemia <lgl>, Hypertension <lgl>, IschemicHeart <lgl>, Migraine_ChronicHeadache <lgl>,
# #   MobilityImpairments <lgl>, Osteoporosis <lgl>, PelvicFx <lgl>, PersonalityDisorders <lgl>, SpinalCordInjury <lgl>, StrokeTIA <lgl>, AlzheimerDementia <lgl>,
# #   LiverDisease <lgl>, ObstructiveLungDisease <lgl>, CancerSurvivors <lgl>

# debug(trainset.cv.glmnet_alphas_cox)
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox =
    trainsetCC69agg4i07_829 %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time = EndTime, event = is.Case)~., itrainset = NULL, imyFormula = NULL,save.png = T)
# undebug(trainset.cv.glmnet_alphas_cox)
save(trainsetCC69agg4i07_829.cv.glmnet_alphas_cox, file = "trainsetCC69agg4i07_829.cv.glmnet_alphas_cox.rda")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox |> str(max.level = 1)
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") |> str(max.level = 1)
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels} %>% dplyr::filter(colnames_levels.colSums0 == T)
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox =
# +     trainsetCC69agg4i07_829 %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time = EndTime, event = is.Case)~., itrainset = NULL, imyFormula = NULL,save.png = T)
# [1] "any(colSums(x) == 0) == T : removing columns: \"AtrialFibrillationTRUE\""
# [1] "Beginning .f() map from alphas [1] valued : 1"
# [1] "Sys.time_1 : 2017-12-30 19:02:15"
# [1] "plot(object_cvglmnet) : trainset.cv.glmnet_a1_plot.png"
# [1] "Sys.time_2 - Sys.time_1 : structure(1.28141784667969, units = \"secs\", class = \"difftime\")"
# [1] "Beginning .f() map from alphas [2] valued : 0.5"
# [1] "Sys.time_1 : 2017-12-30 19:02:17"
# [1] "plot(object_cvglmnet) : trainset.cv.glmnet_a0.5_plot.png"
# [1] "Sys.time_2 - Sys.time_1 : structure(1.33505201339722, units = \"secs\", class = \"difftime\")"
# > # undebug(trainset.cv.glmnet_alphas_cox)
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox |> str(max.level = 1)
# List of 2
#  $ alpha1  :List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#   ..- attr(*, "alphas[i_alpha]")= num 1
#   ..- attr(*, "function.input")=List of 28
#  $ alpha0.5:List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#   ..- attr(*, "alphas[i_alpha]")= num 0.5
#   ..- attr(*, "function.input")=List of 28
#  - attr(*, "function.input")=List of 28
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") |> str(max.level = 1)
# List of 28
#  $ Call                                                     : language trainset.cv.glmnet_alphas_cox(trainset = ., myFormula = Surv(time = EndTime, event = is.Case) ~ ., itrainset = NU| __truncated__
#  $ CreatedDate                                              : POSIXct[1:1], format: "2017-12-30 19:02:19"
#  $ functionUsed                                             :function (trainset, myFormula, alphas = c(1, 0.5), glmnet.family = "cox", my.type.measure = "deviance", na.omit.needed = F, return.glmnet.objects = T, saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha = F, 
#     return_name = NULL, itrainset = NULL, imyFormula = NULL, save.png = TRUE, png.size = 1280, seed = 1, nfolds = 5)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 33 267 8 33 8 1 267
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000024c84698> 
#  $ trainset_name                                            : chr [1:6173] "structure(list(is.Case = c(FALSE, FALSE, FALSE, FALSE, FALSE, " "FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, " "FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, " "FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, " ...
#  $ trainset_dim                                             : int [1:2] 1658 35
#  $ trainset_dimnames                                        :List of 2
#  $ colnames_levels.colSums0                                 : chr "AtrialFibrillationTRUE"
#  $ trainset_dim.rm.colSums0                                 : int [1:2] 1658 35
#  $ trainset_dimnames.rm.colSums0                            :List of 2
#  $ myFormula                                                :Class 'formula'  language Surv(time = EndTime, event = is.Case) ~ .
#   .. ..- attr(*, ".Environment")=<environment: 0x00000000241d4990> 
#  $ build.x.colnames_levels                                  : chr [1:34] "SexFemale" "SexMale" "AgeDecade" "AcquiredHypothyroidismTRUE" ...
#  $ Terms                                                    :Classes 'terms', 'formula'  language Surv(time = EndTime, event = is.Case) ~ Sex + AgeDecade + AcquiredHypothyroidism + AdjustmentDisorder + Anemia + | __truncated__ ...
#   .. ..- attr(*, "variables")= language list(Surv(time = EndTime, event = is.Case), Sex, AgeDecade, AcquiredHypothyroidism, AdjustmentDisorder, Anemia, A| __truncated__ ...
#   .. ..- attr(*, "factors")= int [1:34, 1:33] 0 1 0 0 0 0 0 0 0 0 ...
#   .. .. ..- attr(*, "dimnames")=List of 2
#   .. ..- attr(*, "term.labels")= chr [1:33] "Sex" "AgeDecade" "AcquiredHypothyroidism" "AdjustmentDisorder" ...
#   .. ..- attr(*, "order")= int [1:33] 1 1 1 1 1 1 1 1 1 1 ...
#   .. ..- attr(*, "intercept")= int 1
#   .. ..- attr(*, "response")= int 1
#   .. ..- attr(*, ".Environment")=<environment: 0x00000000241d4990> 
#   .. ..- attr(*, "predvars")= language list(Surv(time = EndTime, event = is.Case), Sex, AgeDecade, AcquiredHypothyroidism, AdjustmentDisorder, Anemia, A| __truncated__ ...
#   .. ..- attr(*, "dataClasses")= Named chr [1:34] "nmatrix.2" "factor" "numeric" "logical" ...
#   .. .. ..- attr(*, "names")= chr [1:34] "Surv(time = EndTime, event = is.Case)" "Sex" "AgeDecade" "AcquiredHypothyroidism" ...
#  $ varname4y                                                : Named chr [1:2] "EndTime" "is.Case"
#   ..- attr(*, "names")= chr [1:2] "time" "event"
#  $ varname4x                                                : chr "."
#  $ trainset_colnames_levels                                 :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	36 obs. of  9 variables:
#  $ alphas                                                   : num [1:2] 1 0.5
#  $ glmnet.family                                            : chr "cox"
#  $ my.type.measure                                          : chr "deviance"
#  $ na.omit.needed                                           : logi FALSE
#  $ return.glmnet.objects                                    : logi TRUE
#  $ saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha: logi FALSE
#  $ return_name                                              : NULL
#  $ itrainset                                                : NULL
#  $ imyFormula                                               : NULL
#  $ save.png                                                 : logi TRUE
#  $ png.size                                                 : num 1280
#  $ seed                                                     : num 1
#  $ nfolds                                                   : num 5
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
# # A tibble: 36 x 9
#    colNum_original               colnames            colnames_levels col_class col_Nlevels build.x.colnames_levels colnames_levels.colSums0 Terms.term.labels terms.inner
#              <int>                  <chr>                      <chr>     <chr>       <chr>                   <lgl>                    <lgl>             <lgl>      <fctr>
#  1               1                is.Case                is.CaseTRUE   logical           1                      NA                       NA                NA   varname4y
#  2               2                EndTime                    EndTime   numeric           1                      NA                       NA                NA   varname4y
#  3               3                    Sex                  SexFemale    factor           2                    TRUE                       NA              TRUE        <NA>
#  4               3                    Sex                    SexMale    factor           2                    TRUE                       NA              TRUE        <NA>
#  5               4              AgeDecade                  AgeDecade   numeric           1                    TRUE                       NA              TRUE        <NA>
#  6               5 AcquiredHypothyroidism AcquiredHypothyroidismTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
#  7               6     AdjustmentDisorder     AdjustmentDisorderTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
#  8               7                 Anemia                 AnemiaTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
#  9               8                Anxiety                AnxietyTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
# 10               9              Arthritis              ArthritisTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
# # ... with 26 more rows
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels} %>% dplyr::filter(colnames_levels.colSums0 == T)
# # A tibble: 1 x 9
#   colNum_original           colnames        colnames_levels col_class col_Nlevels build.x.colnames_levels colnames_levels.colSums0 Terms.term.labels terms.inner
#             <int>              <chr>                  <chr>     <chr>       <chr>                   <lgl>                    <lgl>             <lgl>      <fctr>
# 1              10 AtrialFibrillation AtrialFibrillationTRUE   logical           1                    TRUE                     TRUE              TRUE        <NA>







#@@@ object_cvglmnet.coefexp = function(object_cvglmnet, nonzero = F) { ==========  
object_cvglmnet.coefexp = function(object_cvglmnet, nonzero = F) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
    library(glmnet)
    library(tidyverse)
    out = c("lambda.min", "lambda.1se") %>% map(function(chr) {
        coef.cv.glmnet(object_cvglmnet, s = chr)
    }) %>% map(as.matrix) %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = "rowname")
    names(out)[2:3] = c("coef.min", "coef.1se")
    # names(out)[2:3] = names(out)[2:3] %>% format(nsmall = 3)
    out$rownum = 1:nrow(out)
    
    out.NA = out
    out.NA [out.NA == 0] = NA
    
    # out.NA[["exp(coef.min)"]] = out.NA$coef.min %>% exp %>% sprintf("%.2f", .)
    # out.NA[["exp(coef.1se)"]] = out.NA$coef.1se %>% exp %>% sprintf("%.2f", .)
    # out.NA = out.NA %>% select(rownum, rowname, matches("exp\\(coef"), matches("coef\\."))
    out.NA[["expB.min"]] = out.NA$coef.min %>% exp %>% sprintf("%.2f", .)
    out.NA[["expB.1se"]] = out.NA$coef.1se %>% exp %>% sprintf("%.2f", .)
    out.NA = out.NA %>% select(rownum, rowname, matches("expB\\."), matches("coef\\."))
    
    if (nonzero == T) {
        out.NA = out.NA %>% dplyr::filter(is.na(coef.min) * is.na(coef.1se) == 0)
    }
    out.NA
}
object_list_cvglmnet.coefexp = function(object_list_cvglmnet, i_names = NULL) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")    
    library(glmnet)
    library(tidyverse)
    out2 = object_list_cvglmnet %>% map(object_cvglmnet.coefexp)
    if (is.null(i_names)) {
        if ({substr(names(object_list_cvglmnet)[1], start = 1, stop = 5) == "alpha"}) {
            i_names = names(object_list_cvglmnet)
            i_names = i_names %>% gsub("^alpha", "a", .)
            i_names = i_names %>% gsub("a0\\.", "a.", .)
        } else {
            # names(object_list_cvglmnet) %>% grep("\\_a1$|\\_a0\\.[1-9]$", ., value = T)
            i_names = names(object_list_cvglmnet) |> str()ingr::str_extract("\\_a1$|\\_a0\\.[1-9]$")
            i_names = i_names %>% gsub("\\_a0\\.", "_a.", .)
            i_names = i_names %>% gsub("^\\_", "", .)
        }
        if (any(is.na(i_names))) {
            stop("any(is.na(i_names))")
        }
    }
    out3 = out2 %>% seq_along %>% map(function(i) {
        df = out2[[i]]
        names(df) [!names(df) %in% c("rownum", "rowname")] = 
            paste0(
                i_names[i]
                , names(df) [!names(df) %in% c("rownum", "rowname")]
            )
        df
    })
    
    out4 = out3 %>% reduce(full_join, by = c("rownum", "rowname"))
    # out4 = out4 %>% select(rownum, rowname, matches("exp\\(coef"), matches("coef\\."))
    out4 = out4 %>% select(rownum, rowname, matches("expB\\."), matches("coef\\."))
    out4
}


#@ test) object_list_cvglmnet.coefexp() CoxExample_tibble.cv.glmnet_alphas_cox -----  
object_cvglmnet.coefexp(CoxExample_tibble.cv.glmnet_alphas_cox$alpha1) #----
object_list_cvglmnet.coefexp(CoxExample_tibble.cv.glmnet_alphas_cox) #----
# > object_cvglmnet.coefexp(CoxExample_tibble.cv.glmnet_alphas_cox$alpha1) #----
#    rownum rowname expB.min expB.1se    coef.min     coef.1se
# 1       1      V1     1.62     1.39  0.47972069  0.332155771
# 2       2      V2     0.85     0.94 -0.16674492 -0.063825745
# 3       3      V3     0.81     0.90 -0.21014303 -0.103020945
# 4       4      V4     1.18     1.07  0.16781912  0.066405963
# 5       5      V5     0.84     0.92 -0.17951289 -0.085542691
# 6       6      V6     0.62     0.71 -0.48058218 -0.347938771
# 7       7      V7     1.39     1.23  0.32603876  0.206025170
# 8       8      V8     1.09     1.01  0.08646499  0.012908662
# 9       9      V9     1.55     1.36  0.44014704  0.306959063
# 10     10     V10     1.11     1.01  0.10854409  0.005616284
# 11     11     V11       NA       NA          NA           NA
# 12     12     V12       NA       NA          NA           NA
# 13     13     V13     1.01       NA  0.01304299           NA
# 14     14     V14       NA       NA          NA           NA
# 15     15     V15       NA       NA          NA           NA
# 16     16     V16       NA       NA          NA           NA
# 17     17     V17     0.99       NA -0.01388096           NA
# 18     18     V18       NA       NA          NA           NA
# 19     19     V19       NA       NA          NA           NA
# 20     20     V20       NA       NA          NA           NA
# 21     21     V21       NA       NA          NA           NA
# 22     22     V22       NA       NA          NA           NA
# 23     23     V23       NA       NA          NA           NA
# 24     24     V24       NA       NA          NA           NA
# 25     25     V25     0.98       NA -0.01830447           NA
# 26     26     V26       NA       NA          NA           NA
# 27     27     V27       NA       NA          NA           NA
# 28     28     V28       NA       NA          NA           NA
# 29     29     V29       NA       NA          NA           NA
# 30     30     V30     1.00       NA -0.00301953           NA
# > object_list_cvglmnet.coefexp(CoxExample_tibble.cv.glmnet_alphas_cox) #----
#    rownum rowname a1expB.min a1expB.1se a.5expB.min a.5expB.1se  a1coef.min   a1coef.1se   a.5coef.min a.5coef.1se
# 1       1      V1       1.62       1.39        1.60        1.38  0.47972069  0.332155771  0.4702664543  0.32244534
# 2       2      V2       0.85       0.94        0.85        0.93 -0.16674492 -0.063825745 -0.1662272351 -0.07327914
# 3       3      V3       0.81       0.90        0.81        0.90 -0.21014303 -0.103020945 -0.2088175878 -0.11018701
# 4       4      V4       1.18       1.07        1.18        1.08  0.16781912  0.066405963  0.1667420520  0.07698016
# 5       5      V5       0.84       0.92        0.84        0.91 -0.17951289 -0.085542691 -0.1790779843 -0.09491137
# 6       6      V6       0.62       0.71        0.62        0.71 -0.48058218 -0.347938771 -0.4709548588 -0.33758352
# 7       7      V7       1.39       1.23        1.38        1.23  0.32603876  0.206025170  0.3212960746  0.20619960
# 8       8      V8       1.09       1.01        1.09        1.03  0.08646499  0.012908662  0.0878921191  0.02502086
# 9       9      V9       1.55       1.36        1.54        1.35  0.44014704  0.306959063  0.4318903899  0.29925257
# 10     10     V10       1.11       1.01        1.12        1.02  0.10854409  0.005616284  0.1094098263  0.02159228
# 11     11     V11         NA         NA          NA          NA          NA           NA            NA          NA
# 12     12     V12         NA         NA          NA          NA          NA           NA            NA          NA
# 13     13     V13       1.01         NA        1.02          NA  0.01304299           NA  0.0177894164          NA
# 14     14     V14         NA         NA          NA          NA          NA           NA            NA          NA
# 15     15     V15         NA         NA          NA          NA          NA           NA            NA          NA
# 16     16     V16         NA         NA          NA          NA          NA           NA            NA          NA
# 17     17     V17       0.99         NA        0.98          NA -0.01388096           NA -0.0172848043          NA
# 18     18     V18         NA         NA          NA          NA          NA           NA            NA          NA
# 19     19     V19         NA         NA          NA          NA          NA           NA            NA          NA
# 20     20     V20         NA         NA          NA          NA          NA           NA            NA          NA
# 21     21     V21         NA         NA        1.00          NA          NA           NA -0.0024320160          NA
# 22     22     V22         NA         NA          NA          NA          NA           NA            NA          NA
# 23     23     V23         NA         NA          NA          NA          NA           NA            NA          NA
# 24     24     V24         NA         NA          NA          NA          NA           NA            NA          NA
# 25     25     V25       0.98         NA        0.98          NA -0.01830447           NA -0.0219618248          NA
# 26     26     V26         NA         NA          NA          NA          NA           NA            NA          NA
# 27     27     V27         NA         NA        1.00          NA          NA           NA  0.0006136365          NA
# 28     28     V28         NA         NA          NA          NA          NA           NA            NA          NA
# 29     29     V29         NA         NA          NA          NA          NA           NA            NA          NA
# 30     30     V30       1.00         NA        0.99          NA -0.00301953           NA -0.0080371921          NA


#@ test) object_list_cvglmnet.coefexp() trainsetCC69agg4i07_829.cv.glmnet_alphas_cox -----  
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.coefexp #----
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% object_list_cvglmnet.coefexp #----
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.coefexp #----
#    rownum                       rowname expB.min expB.1se    coef.min  coef.1se
# 1       1                     SexFemale       NA       NA          NA        NA
# 2       2                       SexMale       NA       NA          NA        NA
# 3       3                     AgeDecade       NA       NA          NA        NA
# 4       4    AcquiredHypothyroidismTRUE     0.90       NA -0.10411797        NA
# 5       5        AdjustmentDisorderTRUE     1.68       NA  0.51892022        NA
# 6       6                    AnemiaTRUE     1.18       NA  0.16228986        NA
# 7       7                   AnxietyTRUE     1.86     1.22  0.62216032 0.1977225
# 8       8                 ArthritisTRUE     1.08       NA  0.07946892        NA
# 9       9           BenignProstaticTRUE       NA       NA          NA        NA
# 10     10               BrainInjuryTRUE       NA       NA          NA        NA
# 11     11                  CataractTRUE     1.05       NA  0.04503386        NA
# 12     12             ChronicKidneyTRUE     1.13       NA  0.12516627        NA
# 13     13                  DiabetesTRUE       NA       NA          NA        NA
# 14     14                 DysthymiaTRUE     2.21       NA  0.79223737        NA
# 15     15                  EpilepsyTRUE     1.10       NA  0.09406791        NA
# 16     16 Fibromyalgia_Pain_FatigueTRUE     1.01       NA  0.01042374        NA
# 17     17                  GlaucomaTRUE     1.06       NA  0.06295570        NA
# 18     18         HearingImpairmentTRUE       NA       NA          NA        NA
# 19     19              HeartFailureTRUE       NA       NA          NA        NA
# 20     20            HyperlipidemiaTRUE     1.18       NA  0.16911572        NA
# 21     21              HypertensionTRUE     1.02       NA  0.02398514        NA
# 22     22             IschemicHeartTRUE       NA       NA          NA        NA
# 23     23  Migraine_ChronicHeadacheTRUE     1.06       NA  0.05624714        NA
# 24     24       MobilityImpairmentsTRUE       NA       NA          NA        NA
# 25     25              OsteoporosisTRUE     1.16       NA  0.14910997        NA
# 26     26                  PelvicFxTRUE       NA       NA          NA        NA
# 27     27      PersonalityDisordersTRUE       NA       NA          NA        NA
# 28     28          SpinalCordInjuryTRUE       NA       NA          NA        NA
# 29     29                 StrokeTIATRUE     1.26       NA  0.22770807        NA
# 30     30         AlzheimerDementiaTRUE       NA       NA          NA        NA
# 31     31              LiverDiseaseTRUE     1.02       NA  0.02254691        NA
# 32     32    ObstructiveLungDiseaseTRUE     1.02       NA  0.02083958        NA
# 33     33           CancerSurvivorsTRUE     1.03       NA  0.02732249        NA
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% object_list_cvglmnet.coefexp #----
#    rownum                       rowname a1expB.min a1expB.1se a.5expB.min a.5expB.1se  a1coef.min a1coef.1se a.5coef.min a.5coef.1se
# 1       1                     SexFemale         NA         NA          NA          NA          NA         NA          NA          NA
# 2       2                       SexMale         NA         NA          NA          NA          NA         NA          NA          NA
# 3       3                     AgeDecade         NA         NA          NA          NA          NA         NA          NA          NA
# 4       4    AcquiredHypothyroidismTRUE       0.90         NA        0.90          NA -0.10411797         NA -0.10027026          NA
# 5       5        AdjustmentDisorderTRUE       1.68         NA        1.62          NA  0.51892022         NA  0.48066158          NA
# 6       6                    AnemiaTRUE       1.18         NA        1.17          NA  0.16228986         NA  0.15797244          NA
# 7       7                   AnxietyTRUE       1.86       1.22        1.83        1.23  0.62216032  0.1977225  0.60514595   0.2044966
# 8       8                 ArthritisTRUE       1.08         NA        1.08          NA  0.07946892         NA  0.07608923          NA
# 9       9           BenignProstaticTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 10     10               BrainInjuryTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 11     11                  CataractTRUE       1.05         NA        1.04          NA  0.04503386         NA  0.04391836          NA
# 12     12             ChronicKidneyTRUE       1.13         NA        1.13          NA  0.12516627         NA  0.12154999          NA
# 13     13                  DiabetesTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 14     14                 DysthymiaTRUE       2.21         NA        2.18          NA  0.79223737         NA  0.77871163          NA
# 15     15                  EpilepsyTRUE       1.10         NA        1.10          NA  0.09406791         NA  0.09903926          NA
# 16     16 Fibromyalgia_Pain_FatigueTRUE       1.01         NA        1.01          NA  0.01042374         NA  0.01051333          NA
# 17     17                  GlaucomaTRUE       1.06         NA        1.06          NA  0.06295570         NA  0.05992734          NA
# 18     18         HearingImpairmentTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 19     19              HeartFailureTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 20     20            HyperlipidemiaTRUE       1.18         NA        1.18          NA  0.16911572         NA  0.16409185          NA
# 21     21              HypertensionTRUE       1.02         NA        1.03          NA  0.02398514         NA  0.02507942          NA
# 22     22             IschemicHeartTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 23     23  Migraine_ChronicHeadacheTRUE       1.06         NA        1.06          NA  0.05624714         NA  0.05779151          NA
# 24     24       MobilityImpairmentsTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 25     25              OsteoporosisTRUE       1.16         NA        1.15          NA  0.14910997         NA  0.14331811          NA
# 26     26                  PelvicFxTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 27     27      PersonalityDisordersTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 28     28          SpinalCordInjuryTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 29     29                 StrokeTIATRUE       1.26         NA        1.25          NA  0.22770807         NA  0.22015469          NA
# 30     30         AlzheimerDementiaTRUE         NA         NA          NA          NA          NA         NA          NA          NA
# 31     31              LiverDiseaseTRUE       1.02         NA        1.02          NA  0.02254691         NA  0.02370865          NA
# 32     32    ObstructiveLungDiseaseTRUE       1.02         NA        1.02          NA  0.02083958         NA  0.02047452          NA
# 33     33           CancerSurvivorsTRUE       1.03         NA        1.02          NA  0.02732249         NA  0.02210308          NA



#@@@ object_cvglmnet.newFormula = function(object_cvglmnet, coef.cv.glmnet.s = "lambda.min") { ======  
object_cvglmnet.newFormula = function(object_cvglmnet, coef.cv.glmnet.s = "lambda.min") {
    # object_cvglmnet = CoxExample_tibble.cv.glmnet_alphas_cox$alpha1
    # object_cvglmnet = trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1
    # coef.cv.glmnet.s = "lambda.min"

    library(tidyverse)
    library(glmnet)

    # ?coef.cv.glmnet
    colnames_levels.select = object_cvglmnet %>% coef.cv.glmnet(s = coef.cv.glmnet.s) |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
        mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
    colnames_levels.select
    
    trainset_colnames_levels.df = object_cvglmnet %>% attr(., "function.input") %>% {.$trainset_colnames_levels} |> as.data.frame()
    rownames(trainset_colnames_levels.df) = trainset_colnames_levels.df$colnames_levels
    colnames.select = trainset_colnames_levels.df[colnames_levels.select, "colnames"]
    
    # varname4y = CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4y}
    # if (identical(names(varname4y), c("event", "time"))) {
    #     warning("identical(names(varname4y), c(\"event\", \"time\") - flipped")
    #     varname4y = varname4y[2:1]
    # }
    # out = as.formula(paste0(
    #     "Surv(time = ", varname4y[1], ", event = ", varname4y[2], ") ~ "
    #     , paste0(colnames.select, collapse = " + ")
    # ))
    
    varname4y = object_cvglmnet %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "factors") %>% rownames %>% {.[1]}
    out = as.formula(paste0(
        varname4y , " ~ "
        , paste0(colnames.select, collapse = " + ")
    ))
    out

}
object_list_cvglmnet.newFormula = function(object_list_cvglmnet, coef.cv.glmnet.s = c("lambda.1se","lambda.min")) {
    # glmnet.alpha = gsub("alpha", "", names(object_list_cvglmnet)) |> as.numeric()
    # out = object_list_cvglmnet %>% seq_along %>% map(function(i) {
    #     coef.cv.glmnet.s %>% map(function(s) {
    #         object_cvglmnet.newFormula(object_cvglmnet[[i]], glmnet.alpha = )
    #     })
    # })
    out = object_list_cvglmnet %>% map(function(object_cvglmnet) {
        out2 = coef.cv.glmnet.s %>% map(function(s) {
            object_cvglmnet.newFormula(object_cvglmnet, coef.cv.glmnet.s = s)
        })
        names(out2) = coef.cv.glmnet.s
        out2
    })
    # names(out) = names(object_list_cvglmnet)
    out
}
    
#@ test) object_cvglmnet.newFormula() CoxExample_tibble.cv.glmnet_alphas_cox -----  
library(tidyverse)
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_dimnames[[2]]} |> deparse() |> cat("  \n", sep="")
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "variables") |> str()
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "predvars") |> str()
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "term.labels") |> deparse() |> cat("  \n", sep="")
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4y} |> deparse() |> cat("  \n", sep="")
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4x} |> deparse() |> cat("  \n", sep="")
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_dimnames[[2]]} |> deparse() |> cat("  \n", sep="")
# c("time", "status", "V1", "V2", "V3", "V4", "V5", "V6", "V7", 
# "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", 
# "V17", "V18", "V19", "V20", "V21", "V22", "V23", "V24", "V25", 
# "V26", "V27", "V28", "V29", "V30")
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "variables") |> str()
#  language list(Surv(time = time, event = status), V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V1| __truncated__
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "predvars") |> str()
#  language list(Surv(time = time, event = status), V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V1| __truncated__
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "term.labels") |> deparse() |> cat("  \n", sep="")
# c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", 
# "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", 
# "V20", "V21", "V22", "V23", "V24", "V25", "V26", "V27", "V28", 
# "V29", "V30")
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4y} |> deparse() |> cat("  \n", sep="")
# structure(c("time", "status"), .Names = c("time", "event"))
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4x} |> deparse() |> cat("  \n", sep="")
# "."
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
# # A tibble: 32 x 9
#    colNum_original colnames colnames_levels col_class col_Nlevels build.x.colnames_levels colnames_levels.colSums0 Terms.term.labels terms.inner
#              <int>    <chr>           <chr>     <chr>       <chr>                   <lgl>                    <lgl>             <lgl>      <fctr>
#  1               1     time            time   numeric           1                      NA                       NA                NA   varname4y
#  2               2   status          status   numeric           1                      NA                       NA                NA   varname4y
#  3               3       V1              V1   numeric           1                    TRUE                       NA              TRUE        <NA>
#  4               4       V2              V2   numeric           1                    TRUE                       NA              TRUE        <NA>
#  5               5       V3              V3   numeric           1                    TRUE                       NA              TRUE        <NA>
#  6               6       V4              V4   numeric           1                    TRUE                       NA              TRUE        <NA>
#  7               7       V5              V5   numeric           1                    TRUE                       NA              TRUE        <NA>
#  8               8       V6              V6   numeric           1                    TRUE                       NA              TRUE        <NA>
#  9               9       V7              V7   numeric           1                    TRUE                       NA              TRUE        <NA>
# 10              10       V8              V8   numeric           1                    TRUE                       NA              TRUE        <NA>
# # ... with 22 more rows

CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.min") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
    mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.1se") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
    mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
# > CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.min") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
# +     mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
#  [1] "V6"  "V1"  "V9"  "V7"  "V3"  "V5"  "V4"  "V2"  "V10" "V8"  "V25" "V17" "V13" "V30"
# > CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.1se") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
# +     mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
#  [1] "V6"  "V1"  "V9"  "V7"  "V3"  "V5"  "V4"  "V2"  "V8"  "V10"

CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.min")
CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.1se")
# > CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.min")
# Surv(time = time, event = status) ~ V6 + V1 + V9 + V7 + V3 + 
#     V5 + V4 + V2 + V10 + V8 + V25 + V17 + V13 + V30
# <environment: 0x000000000628a288>
# > CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.1se")
# Surv(time = time, event = status) ~ V6 + V1 + V9 + V7 + V3 + 
#     V5 + V4 + V2 + V8 + V10
# <environment: 0x000000002695bba8>



#@ test) object_cvglmnet.newFormula() trainsetCC69agg4i07_829.cv.glmnet_alphas_cox -----  
load("trainsetCC69agg4i07_829.cv.glmnet_alphas_cox.rda")
library(tidyverse)
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_dimnames[[2]]} |> deparse() |> cat("  \n", sep="")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "variables") |> str()
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "predvars") |> str()
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "term.labels") |> deparse() |> cat("  \n", sep="")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "factors") %>% rownames |> deparse() |> cat("  \n", sep="")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "dataClasses") |> deparse() |> cat("  \n", sep="")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4y} |> deparse() |> cat("  \n", sep="")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4x} |> deparse() |> cat("  \n", sep="")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_dimnames[[2]]} |> deparse() |> cat("  \n", sep="")
# c("is.Case", "EndTime", "Sex", "AgeDecade", "AcquiredHypothyroidism",  "AdjustmentDisorder", "Anemia", "Anxiety", "Arthritis", "AtrialFibrillation",  "BenignProstatic", "BrainInjury", "Cataract", "ChronicKidney",  "Diabetes", "Dysthymia", "Epilepsy", "Fibromyalgia_Pain_Fatigue",  "Glaucoma", "HearingImpairment", "HeartFailure", "Hyperlipidemia",  "Hypertension", "IschemicHeart", "Migraine_ChronicHeadache",  "MobilityImpairments", "Osteoporosis", "PelvicFx", "PersonalityDisorders",  "SpinalCordInjury", "StrokeTIA", "AlzheimerDementia", "LiverDisease",  "ObstructiveLungDisease", "CancerSurvivors")> trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "variables") |> str()
#  language list(Surv(time = EndTime, event = is.Case), Sex, AgeDecade, AcquiredHypothyroidism, AdjustmentDisorder, Anemia, A| __truncated__ ...
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "predvars") |> str()
#  language list(Surv(time = EndTime, event = is.Case), Sex, AgeDecade, AcquiredHypothyroidism, AdjustmentDisorder, Anemia, A| __truncated__ ...
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "term.labels") |> deparse() |> cat("  \n", sep="")
# c("Sex", "AgeDecade", "AcquiredHypothyroidism", "AdjustmentDisorder",  "Anemia", "Anxiety", "Arthritis", "AtrialFibrillation", "BenignProstatic",  "BrainInjury", "Cataract", "ChronicKidney", "Diabetes", "Dysthymia",  "Epilepsy", "Fibromyalgia_Pain_Fatigue", "Glaucoma", "HearingImpairment",  "HeartFailure", "Hyperlipidemia", "Hypertension", "IschemicHeart",  "Migraine_ChronicHeadache", "MobilityImpairments", "Osteoporosis",  "PelvicFx", "PersonalityDisorders", "SpinalCordInjury", "StrokeTIA",  "AlzheimerDementia", "LiverDisease", "ObstructiveLungDisease",  "CancerSurvivors")> trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "factors") %>% rownames |> deparse() |> cat("  \n", sep="")
# c("Surv(time = EndTime, event = is.Case)", "Sex", "AgeDecade",  "AcquiredHypothyroidism", "AdjustmentDisorder", "Anemia", "Anxiety",  "Arthritis", "AtrialFibrillation", "BenignProstatic", "BrainInjury",  "Cataract", "ChronicKidney", "Diabetes", "Dysthymia", "Epilepsy",  "Fibromyalgia_Pain_Fatigue", "Glaucoma", "HearingImpairment",  "HeartFailure", "Hyperlipidemia", "Hypertension", "IschemicHeart",  "Migraine_ChronicHeadache", "MobilityImpairments", "Osteoporosis",  "PelvicFx", "PersonalityDisorders", "SpinalCordInjury", "StrokeTIA",  "AlzheimerDementia", "LiverDisease", "ObstructiveLungDisease",  "CancerSurvivors")> trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$Terms} %>% attr(., "dataClasses") |> deparse() |> cat("  \n", sep="")
# structure(c("nmatrix.2", "factor", "numeric", "logical", "logical",  "logical", "logical", "logical", "logical", "logical", "logical",  "logical", "logical", "logical", "logical", "logical", "logical",  "logical", "logical", "logical", "logical", "logical", "logical",  "logical", "logical", "logical", "logical", "logical", "logical",  "logical", "logical", "logical", "logical", "logical"), .Names = c("Surv(time = EndTime, event = is.Case)",  "Sex", "AgeDecade", "AcquiredHypothyroidism", "AdjustmentDisorder",  "Anemia", "Anxiety", "Arthritis", "AtrialFibrillation", "BenignProstatic",  "BrainInjury", "Cataract", "ChronicKidney", "Diabetes", "Dysthymia",  "Epilepsy", "Fibromyalgia_Pain_Fatigue", "Glaucoma", "HearingImpairment",  "HeartFailure", "Hyperlipidemia", "Hypertension", "IschemicHeart",  "Migraine_ChronicHeadache", "MobilityImpairments", "Osteoporosis",  "PelvicFx", "PersonalityDisorders", "SpinalCordInjury", "StrokeTIA",  "AlzheimerDementia", "LiverDisease", "ObstructiveLungDisease",  "CancerSurvivors"))> trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4y} |> deparse() |> cat("  \n", sep="")
# structure(c("EndTime", "is.Case"), .Names = c("time", "event" ))> trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$varname4x} |> deparse() |> cat("  \n", sep="")
# "."> trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% {.$trainset_colnames_levels}
# # A tibble: 36 x 9
#    colNum_original               colnames            colnames_levels col_class col_Nlevels build.x.colnames_levels colnames_levels.colSums0 Terms.term.labels terms.inner
#              <int>                  <chr>                      <chr>     <chr>       <chr>                   <lgl>                    <lgl>             <lgl>      <fctr>
#  1               1                is.Case                is.CaseTRUE   logical           1                      NA                       NA                NA   varname4y
#  2               2                EndTime                    EndTime   numeric           1                      NA                       NA                NA   varname4y
#  3               3                    Sex                  SexFemale    factor           2                    TRUE                       NA              TRUE        <NA>
#  4               3                    Sex                    SexMale    factor           2                    TRUE                       NA              TRUE        <NA>
#  5               4              AgeDecade                  AgeDecade   numeric           1                    TRUE                       NA              TRUE        <NA>
#  6               5 AcquiredHypothyroidism AcquiredHypothyroidismTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
#  7               6     AdjustmentDisorder     AdjustmentDisorderTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
#  8               7                 Anemia                 AnemiaTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
#  9               8                Anxiety                AnxietyTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
# 10               9              Arthritis              ArthritisTRUE   logical           1                    TRUE                       NA              TRUE        <NA>
# # ... with 26 more rows


trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.min") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
    mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.1se") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
    mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.min") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
# +     mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
#  [1] "DysthymiaTRUE"                 "AnxietyTRUE"                   "AdjustmentDisorderTRUE"        "StrokeTIATRUE"                 "HyperlipidemiaTRUE"           
#  [6] "AnemiaTRUE"                    "OsteoporosisTRUE"              "ChronicKidneyTRUE"             "AcquiredHypothyroidismTRUE"    "EpilepsyTRUE"                 
# [11] "ArthritisTRUE"                 "GlaucomaTRUE"                  "Migraine_ChronicHeadacheTRUE"  "CataractTRUE"                  "CancerSurvivorsTRUE"          
# [16] "HypertensionTRUE"              "LiverDiseaseTRUE"              "ObstructiveLungDiseaseTRUE"    "Fibromyalgia_Pain_FatigueTRUE"
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% coef.cv.glmnet(s = "lambda.1se") |> as.matrix() |> as.data.frame() %>% rownames_to_column %>% 
# +     mutate(coef.abs = abs(`1`)) %>% arrange(desc(coef.abs)) %>% dplyr::filter(`1` != 0) %>% select(rowname) |> unlist() |> unname()
# [1] "AnxietyTRUE"

trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.min")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.1se")
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% object_list_cvglmnet.newFormula
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.min")
# Surv(time = EndTime, event = is.Case) ~ Dysthymia + Anxiety + 
#     AdjustmentDisorder + StrokeTIA + Hyperlipidemia + Anemia + 
#     Osteoporosis + ChronicKidney + AcquiredHypothyroidism + Epilepsy + 
#     Arthritis + Glaucoma + Migraine_ChronicHeadache + Cataract + 
#     CancerSurvivors + Hypertension + LiverDisease + ObstructiveLungDisease + 
#     Fibromyalgia_Pain_Fatigue
# <environment: 0x00000000221d8230>
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula(coef.cv.glmnet.s = "lambda.1se")
# Surv(time = EndTime, event = is.Case) ~ Anxiety
# <environment: 0x0000000025d995c0>
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% object_list_cvglmnet.newFormula
# $alpha1
# $alpha1$lambda.1se
# Surv(time = EndTime, event = is.Case) ~ Anxiety
# <environment: 0x000000002555dbd0>
# 
# $alpha1$lambda.min
# Surv(time = EndTime, event = is.Case) ~ Dysthymia + Anxiety + 
#     AdjustmentDisorder + StrokeTIA + Hyperlipidemia + Anemia + 
#     Osteoporosis + ChronicKidney + AcquiredHypothyroidism + Epilepsy + 
#     Arthritis + Glaucoma + Migraine_ChronicHeadache + Cataract + 
#     CancerSurvivors + Hypertension + LiverDisease + ObstructiveLungDisease + 
#     Fibromyalgia_Pain_Fatigue
# <environment: 0x0000000023d3ad88>
# 
# 
# $alpha0.5
# $alpha0.5$lambda.1se
# Surv(time = EndTime, event = is.Case) ~ Anxiety
# <environment: 0x0000000026d91930>
# 
# $alpha0.5$lambda.min
# Surv(time = EndTime, event = is.Case) ~ Dysthymia + Anxiety + 
#     AdjustmentDisorder + StrokeTIA + Hyperlipidemia + Anemia + 
#     Osteoporosis + ChronicKidney + AcquiredHypothyroidism + Epilepsy + 
#     Arthritis + Glaucoma + Migraine_ChronicHeadache + Cataract + 
#     Hypertension + LiverDisease + CancerSurvivors + ObstructiveLungDisease + 
#     Fibromyalgia_Pain_Fatigue
# <environment: 0x0000000024d528f0>



#@ function.coxph_object.summary.exp = function(coxph_object, sprintf_fmt_decimal = 2, coef.exp = T, is.clogit = "unknown", p.adjust_method = c("fdr", "bonferroni")) { =====  
function.coxph_object.summary.exp = function(coxph_object, sprintf_fmt_decimal = 2, coef.exp = T, is.clogit = "unknown", p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
    if (!"coxph" %in% class(coxph_object)) {
        stop("!\"coxph\" %in% class(coxph_object)")
    }
    if (is.clogit == "unknown") {
        if ("clogit" %in% class(coxph_object)) {
            warning("\"clogit\" %in% class(coxph_object)")
            is.clogit = T
        }
    } else if (is.clogit == T) {
        if (!"clogit" %in% class(coxph_object)) {
            stop("!\"clogit\" %in% class(coxph_object)")
        }
    } 
    library(tidyverse)
    library(survival)
    coxph_object.confint.df = as.data.frame(confint(coxph_object))
    coxph_object.summary.coef.df = as.data.frame(coef(summary(coxph_object))) %>% rownames_to_column
    if (coef.exp == T) {
        coxph_object.confint.df = exp(coxph_object.confint.df)
        coxph_object.summary.coef.df$coef = exp(coxph_object.summary.coef.df$coef)
    }

    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(coxph_object.summary.coef.df$coef, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(coxph_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(coxph_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(coxph_object.summary.coef.df$coef, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(coxph_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(coxph_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(coxph_object.summary.coef.dfcoef,coxphobject.confint.df`2.5 %`, coxph_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
    tmp.vec = c(coxph_object.summary.coef.df$coef, coxph_object.confint.df$`2.5 %`, coxph_object.confint.df$`97.5 %`)
    tmp.vec[is.infinite(tmp.vec)] = NA
    digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
    if (any(c(coxph_object.summary.coef.df$coef, coxph_object.confint.df$`2.5 %`, coxph_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
        digits_total_incl_decimal = digits_total_incl_decimal + 1
    }

    tmp.df = data.frame(coefCI = paste0(
        sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), coxph_object.summary.coef.df$coef)
        , " ("
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), coxph_object.confint.df$`2.5 %`)
        , " ~ "
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), coxph_object.confint.df$`97.5 %`)
        , ")"
    ), stringsAsFactors = F)
    # tmp.dfpvalue=coxphobject.summary.coef.df`Pr(>|z|)` %>% round(3) |> as.character()
    tmp.df$p_value = sprintf("%.3f", coxph_object.summary.coef.df$`Pr(>|z|)`)
    tmp.df$p_value[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.05] = "*  "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.01] = "** "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "***"
    ?p.adjust
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = coxph_object.summary.coef.df$`Pr(>|z|)` %>% p.adjust(method = p.adjust_method[i])
        p.adjust_method.i = substr(p.adjust_method[i], 1, 3)
        tmp.df[[paste0("p.", p.adjust_method.i)]] = sprintf("%.3f", tmp.df[[paste0("p.adjust.", i)]])
        tmp.df[[paste0("p.", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "<0.001"
        
        tmp.df[[paste0("*", p.adjust_method.i)]] = "   "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.05] = "*  "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.01] = "** "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "***"
        tmp.df[[paste0("p.adjust.", i)]] = NULL
    }
    
    out = cbind(
        coxph_object.summary.coef.df$rowname
        , tmp.df
        , coxph_object.summary.coef.df[ , 1:2]
        , coxph_object.confint.df
        , coxph_object.summary.coef.df[ , -1:(-2)]
        , stringsAsFactors = F
    )
    out$rowname = NULL
    names(out) [1] = "rowname"
    if (coef.exp == T) {
        out$`exp(coef)` = NULL
        if (is.clogit == T) {
            names(out) [2] = "ORCI"
        } else {
            names(out) [2] = "HRCI"
        }
        names(out) [names(out) == "coef"] = "exp(coef)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}

#@@@ object_cvglmnet.newFormula_coxph = function(object_cvglmnet, testset, coef.cv.glmnet.s = "lambda.min") { =====  
object_cvglmnet.newFormula_coxph = function(object_cvglmnet, testset, coef.cv.glmnet.s = "lambda.min") {
    # ?coxph
    library(survival)
    coxph(
        formula = object_cvglmnet.newFormula(object_cvglmnet = object_cvglmnet, coef.cv.glmnet.s = coef.cv.glmnet.s)
        , data = testset
    )
}
object_list_cvglmnet.newFormula_coxph = function(object_list_cvglmnet, testset, coef.cv.glmnet.s = c("lambda.1se","lambda.min")) {
    # glmnet.alpha = gsub("alpha", "", names(object_list_cvglmnet)) |> as.numeric()
    # out = object_list_cvglmnet %>% seq_along %>% map(function(i) {
    #     coef.cv.glmnet.s %>% map(function(s) {
    #         object_cvglmnet.newFormula(object_cvglmnet[[i]], glmnet.alpha = )
    #     })
    # })
    out = object_list_cvglmnet %>% map(function(object_cvglmnet) {
        out2 = coef.cv.glmnet.s %>% map(function(s) {
            object_cvglmnet.newFormula_coxph(object_cvglmnet = object_cvglmnet, testset = testset, coef.cv.glmnet.s = s)
        })
        names(out2) = coef.cv.glmnet.s
        out2
    })
    # names(out) = names(object_list_cvglmnet)
    out
}

#@ test) object_cvglmnet.newFormula_coxph() CoxExample_tibble.cv.glmnet_alphas_cox ------  
CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = CoxExample_tibble, coef.cv.glmnet.s = "lambda.min")
CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = CoxExample_tibble, coef.cv.glmnet.s = "lambda.min") %>% function.coxph_object.summary.exp
# > CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = CoxExample_tibble, coef.cv.glmnet.s = "lambda.min")
# Call:
# coxph(formula = object_cvglmnet.newFormula(object_cvglmnet = object_cvglmnet, 
#     coef.cv.glmnet.s = coef.cv.glmnet.s), data = testset)
# 
#        coef exp(coef) se(coef)      z       p
# V6  -0.5397    0.5829   0.0423 -12.76 < 2e-16
# V1   0.5509    1.7347   0.0419  13.14 < 2e-16
# V9   0.5033    1.6542   0.0422  11.93 < 2e-16
# V7   0.3813    1.4642   0.0403   9.45 < 2e-16
# V3  -0.2618    0.7697   0.0384  -6.81 9.5e-12
# V5  -0.2224    0.8006   0.0396  -5.62 1.9e-08
# V4   0.2105    1.2343   0.0389   5.41 6.3e-08
# V2  -0.2149    0.8066   0.0393  -5.47 4.4e-08
# V10  0.1529    1.1652   0.0382   4.00 6.3e-05
# V8   0.1179    1.1251   0.0358   3.29   0.001
# V25 -0.0473    0.9538   0.0381  -1.24   0.215
# V17 -0.0418    0.9591   0.0373  -1.12   0.263
# V13  0.0388    1.0396   0.0384   1.01   0.312
# V30 -0.0346    0.9660   0.0386  -0.90   0.370
# 
# Likelihood ratio test=478  on 14 df, p=0
# n= 1000, number of events= 692 
# > CoxExample_tibble.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = CoxExample_tibble, coef.cv.glmnet.s = "lambda.min") %>% function.coxph_object.summary.exp
#    rowname               HRCI p_value star  p.fdr *fdr  p.bon *bon exp(coef) exp(2.5 %) exp(97.5 %)   se(coef)           z     Pr(>|z|)
# 1       V6 0.58 (0.54 ~ 0.63)  <0.001  *** <0.001  *** <0.001  *** 0.5828975  0.5365219   0.6332816 0.04229871 -12.7602935 0.000000e+00
# 2       V1 1.73 (1.60 ~ 1.88)  <0.001  *** <0.001  *** <0.001  *** 1.7347332  1.5979384   1.8832384 0.04190856  13.1441780 0.000000e+00
# 3       V9 1.65 (1.52 ~ 1.80)  <0.001  *** <0.001  *** <0.001  *** 1.6541716  1.5228799   1.7967824 0.04219321  11.9284691 0.000000e+00
# 4       V7 1.46 (1.35 ~ 1.58)  <0.001  *** <0.001  *** <0.001  *** 1.4641851  1.3529085   1.5846143 0.04032838   9.4548523 0.000000e+00
# 5       V3 0.77 (0.71 ~ 0.83)  <0.001  *** <0.001  *** <0.001  *** 0.7696787  0.7138524   0.8298709 0.03841753  -6.8141310 9.483525e-12
# 6       V5 0.80 (0.74 ~ 0.87)  <0.001  *** <0.001  *** <0.001  *** 0.8005745  0.7408461   0.8651184 0.03956028  -5.6224487 1.882695e-08
# 7       V4 1.23 (1.14 ~ 1.33)  <0.001  *** <0.001  *** <0.001  *** 1.2342639  1.1436583   1.3320476 0.03889999   5.4106629 6.279187e-08
# 8       V2 0.81 (0.75 ~ 0.87)  <0.001  *** <0.001  *** <0.001  *** 0.8066359  0.7468858   0.8711661 0.03926612  -5.4724742 4.437955e-08
# 9      V10 1.17 (1.08 ~ 1.26)  <0.001  *** <0.001  *** <0.001  *** 1.1652192  1.0811123   1.2558692 0.03822455   4.0002875 6.326558e-05
# 10      V8 1.13 (1.05 ~ 1.21)   0.001  **   0.001  **   0.014  *   1.1251229  1.0488072   1.2069916 0.03583674   3.2897034 1.002930e-03
# 11     V25 0.95 (0.89 ~ 1.03)   0.215       0.274       1.000      0.9538481  0.8851976   1.0278228 0.03810966  -1.2398649 2.150254e-01
# 12     V17 0.96 (0.89 ~ 1.03)   0.263       0.307       1.000      0.9590610  0.8913674   1.0318956 0.03734662  -1.1192591 2.630296e-01
# 13     V13 1.04 (0.96 ~ 1.12)   0.312       0.336       1.000      1.0395658  0.9642376   1.1207787 0.03837856   1.0110621 3.119867e-01
# 14     V30 0.97 (0.90 ~ 1.04)   0.370       0.370       1.000      0.9660162  0.8957073   1.0418440 0.03855524  -0.8967573 3.698484e-01

object_list_cvglmnet.newFormula_coxph
#@ test) object_cvglmnet.newFormula_coxph() trainsetCC69agg4i07_829.cv.glmnet_alphas_cox ------  
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = trainsetCC69agg4i07_829, coef.cv.glmnet.s = "lambda.min") #----
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = trainsetCC69agg4i07_829, coef.cv.glmnet.s = "lambda.min") %>% function.coxph_object.summary.exp #----
trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% object_list_cvglmnet.newFormula_coxph(testset = trainsetCC69agg4i07_829) %>% map(function(ls) {map(ls, function(x) function.coxph_object.summary.exp(x))}) #-----
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = trainsetCC69agg4i07_829, coef.cv.glmnet.s = "lambda.min")
# Call:
# coxph(formula = object_cvglmnet.newFormula(object_cvglmnet = object_cvglmnet, 
#     coef.cv.glmnet.s = coef.cv.glmnet.s), data = testset)
# 
#                                  coef exp(coef) se(coef)     z       p
# DysthymiaTRUE                  1.0535    2.8677   0.2213  4.76 1.9e-06
# AnxietyTRUE                    0.7135    2.0411   0.0779  9.16 < 2e-16
# AdjustmentDisorderTRUE         1.7014    5.4816   0.7122  2.39  0.0169
# StrokeTIATRUE                  0.3237    1.3823   0.1097  2.95  0.0032
# HyperlipidemiaTRUE             0.2400    1.2712   0.0760  3.16  0.0016
# AnemiaTRUE                     0.3683    1.4452   0.1802  2.04  0.0410
# OsteoporosisTRUE               0.2504    1.2845   0.0891  2.81  0.0050
# ChronicKidneyTRUE              0.2436    1.2758   0.1595  1.53  0.1267
# AcquiredHypothyroidismTRUE    -0.3427    0.7099   0.2331 -1.47  0.1416
# EpilepsyTRUE                   0.3549    1.4260   0.2883  1.23  0.2183
# ArthritisTRUE                  0.2062    1.2291   0.0853  2.42  0.0156
# GlaucomaTRUE                   0.1757    1.1921   0.1048  1.68  0.0936
# Migraine_ChronicHeadacheTRUE   0.1329    1.1421   0.0874  1.52  0.1284
# CataractTRUE                   0.1213    1.1290   0.0773  1.57  0.1164
# CancerSurvivorsTRUE            0.4026    1.4957   0.2478  1.62  0.1043
# HypertensionTRUE               0.1637    1.1778   0.1467  1.12  0.2647
# LiverDiseaseTRUE               0.0965    1.1013   0.0953  1.01  0.3112
# ObstructiveLungDiseaseTRUE     0.1083    1.1144   0.0856  1.27  0.2057
# Fibromyalgia_Pain_FatigueTRUE  0.0786    1.0818   0.0711  1.11  0.2688
# 
# Likelihood ratio test=167  on 19 df, p=0
# n= 1658, number of events= 829 
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox$alpha1 %>% object_cvglmnet.newFormula_coxph(testset = trainsetCC69agg4i07_829, coef.cv.glmnet.s = "lambda.min") %>% function.coxph_object.summary.exp
#                          rowname                  HRCI p_value star  p.fdr *fdr  p.bon *bon exp(coef) exp(2.5 %) exp(97.5 %)   se(coef)         z     Pr(>|z|)
# 1                  DysthymiaTRUE  2.87 ( 1.86 ~  4.42)  <0.001  *** <0.001  *** <0.001  *** 2.8677199  1.8585707    4.424807 0.22128441  4.760919 1.927130e-06
# 2                    AnxietyTRUE  2.04 ( 1.75 ~  2.38)  <0.001  *** <0.001  *** <0.001  *** 2.0410716  1.7521331    2.377658 0.07787949  9.161269 0.000000e+00
# 3         AdjustmentDisorderTRUE  5.48 ( 1.36 ~ 22.14)   0.017  *    0.046  *    0.321      5.4816022  1.3572165   22.139403 0.71223836  2.388803 1.690334e-02
# 4                  StrokeTIATRUE  1.38 ( 1.11 ~  1.71)   0.003  **   0.015  *    0.060      1.3822801  1.1147876    1.713957 0.10973185  2.950231 3.175360e-03
# 5             HyperlipidemiaTRUE  1.27 ( 1.10 ~  1.48)   0.002  **   0.010  *    0.030  *   1.2712416  1.0953296    1.475405 0.07599053  3.158210 1.587414e-03
# 6                     AnemiaTRUE  1.45 ( 1.02 ~  2.06)   0.041  *    0.097       0.779      1.4452143  1.0152025    2.057367 0.18019183  2.043698 4.098342e-02
# 7               OsteoporosisTRUE  1.28 ( 1.08 ~  1.53)   0.005  **   0.019  *    0.094      1.2845012  1.0786324    1.529662 0.08912231  2.809290 4.965084e-03
# 8              ChronicKidneyTRUE  1.28 ( 0.93 ~  1.74)   0.127       0.188       1.000      1.2758004  0.9332795    1.744029 0.15950509  1.527059 1.267463e-01
# 9     AcquiredHypothyroidismTRUE  0.71 ( 0.45 ~  1.12)   0.142       0.192       1.000      0.7098834  0.4495108    1.121073 0.23313743 -1.469753 1.416286e-01
# 10                  EpilepsyTRUE  1.43 ( 0.81 ~  2.51)   0.218       0.259       1.000      1.4260418  0.8104668    2.509165 0.28829481  1.231041 2.183077e-01
# 11                 ArthritisTRUE  1.23 ( 1.04 ~  1.45)   0.016  *    0.046  *    0.296      1.2290567  1.0399114    1.452605 0.08526253  2.418964 1.556478e-02
# 12                  GlaucomaTRUE  1.19 ( 0.97 ~  1.46)   0.094       0.188       1.000      1.1921177  0.9707556    1.463957 0.10480388  1.676764 9.358873e-02
# 13  Migraine_ChronicHeadacheTRUE  1.14 ( 0.96 ~  1.36)   0.128       0.188       1.000      1.1421294  0.9623328    1.355518 0.08739410  1.520633 1.283519e-01
# 14                  CataractTRUE  1.13 ( 0.97 ~  1.31)   0.116       0.188       1.000      1.1289740  0.9703137    1.313577 0.07726931  1.569953 1.164259e-01
# 15           CancerSurvivorsTRUE  1.50 ( 0.92 ~  2.43)   0.104       0.188       1.000      1.4956666  0.9202286    2.430938 0.24781328  1.624497 1.042697e-01
# 16              HypertensionTRUE  1.18 ( 0.88 ~  1.57)   0.265       0.284       1.000      1.1778428  0.8834378    1.570358 0.14674712  1.115420 2.646705e-01
# 17              LiverDiseaseTRUE  1.10 ( 0.91 ~  1.33)   0.311       0.311       1.000      1.1013413  0.9136702    1.327561 0.09531521  1.012732 3.111881e-01
# 18    ObstructiveLungDiseaseTRUE  1.11 ( 0.94 ~  1.32)   0.206       0.259       1.000      1.1143988  0.9422821    1.317954 0.08559630  1.265417 2.057217e-01
# 19 Fibromyalgia_Pain_FatigueTRUE  1.08 ( 0.94 ~  1.24)   0.269       0.284       1.000      1.0817927  0.9410720    1.243556 0.07110089  1.105747 2.688360e-01
# > trainsetCC69agg4i07_829.cv.glmnet_alphas_cox %>% object_list_cvglmnet.newFormula_coxph(testset = trainsetCC69agg4i07_829) %>% map(function(ls) {map(ls, function(x) function.coxph_object.summary.exp(x))}) #-----
# $alpha1
# $alpha1$lambda.1se
#       rowname               HRCI p_value star  p.fdr *fdr  p.bon *bon exp(coef) exp(2.5 %) exp(97.5 %)   se(coef)        z Pr(>|z|)
# 1 AnxietyTRUE 2.12 (1.83 ~ 2.45)  <0.001  *** <0.001  *** <0.001  ***  2.117198   1.826935    2.453577 0.07523286 9.970291        0
# 
# $alpha1$lambda.min
#                          rowname                  HRCI p_value star  p.fdr *fdr  p.bon *bon exp(coef) exp(2.5 %) exp(97.5 %)   se(coef)         z     Pr(>|z|)
# 1                  DysthymiaTRUE  2.87 ( 1.86 ~  4.42)  <0.001  *** <0.001  *** <0.001  *** 2.8677199  1.8585707    4.424807 0.22128441  4.760919 1.927130e-06
# 2                    AnxietyTRUE  2.04 ( 1.75 ~  2.38)  <0.001  *** <0.001  *** <0.001  *** 2.0410716  1.7521331    2.377658 0.07787949  9.161269 0.000000e+00
# 3         AdjustmentDisorderTRUE  5.48 ( 1.36 ~ 22.14)   0.017  *    0.046  *    0.321      5.4816022  1.3572165   22.139403 0.71223836  2.388803 1.690334e-02
# 4                  StrokeTIATRUE  1.38 ( 1.11 ~  1.71)   0.003  **   0.015  *    0.060      1.3822801  1.1147876    1.713957 0.10973185  2.950231 3.175360e-03
# 5             HyperlipidemiaTRUE  1.27 ( 1.10 ~  1.48)   0.002  **   0.010  *    0.030  *   1.2712416  1.0953296    1.475405 0.07599053  3.158210 1.587414e-03
# 6                     AnemiaTRUE  1.45 ( 1.02 ~  2.06)   0.041  *    0.097       0.779      1.4452143  1.0152025    2.057367 0.18019183  2.043698 4.098342e-02
# 7               OsteoporosisTRUE  1.28 ( 1.08 ~  1.53)   0.005  **   0.019  *    0.094      1.2845012  1.0786324    1.529662 0.08912231  2.809290 4.965084e-03
# 8              ChronicKidneyTRUE  1.28 ( 0.93 ~  1.74)   0.127       0.188       1.000      1.2758004  0.9332795    1.744029 0.15950509  1.527059 1.267463e-01
# 9     AcquiredHypothyroidismTRUE  0.71 ( 0.45 ~  1.12)   0.142       0.192       1.000      0.7098834  0.4495108    1.121073 0.23313743 -1.469753 1.416286e-01
# 10                  EpilepsyTRUE  1.43 ( 0.81 ~  2.51)   0.218       0.259       1.000      1.4260418  0.8104668    2.509165 0.28829481  1.231041 2.183077e-01
# 11                 ArthritisTRUE  1.23 ( 1.04 ~  1.45)   0.016  *    0.046  *    0.296      1.2290567  1.0399114    1.452605 0.08526253  2.418964 1.556478e-02
# 12                  GlaucomaTRUE  1.19 ( 0.97 ~  1.46)   0.094       0.188       1.000      1.1921177  0.9707556    1.463957 0.10480388  1.676764 9.358873e-02
# 13  Migraine_ChronicHeadacheTRUE  1.14 ( 0.96 ~  1.36)   0.128       0.188       1.000      1.1421294  0.9623328    1.355518 0.08739410  1.520633 1.283519e-01
# 14                  CataractTRUE  1.13 ( 0.97 ~  1.31)   0.116       0.188       1.000      1.1289740  0.9703137    1.313577 0.07726931  1.569953 1.164259e-01
# 15           CancerSurvivorsTRUE  1.50 ( 0.92 ~  2.43)   0.104       0.188       1.000      1.4956666  0.9202286    2.430938 0.24781328  1.624497 1.042697e-01
# 16              HypertensionTRUE  1.18 ( 0.88 ~  1.57)   0.265       0.284       1.000      1.1778428  0.8834378    1.570358 0.14674712  1.115420 2.646705e-01
# 17              LiverDiseaseTRUE  1.10 ( 0.91 ~  1.33)   0.311       0.311       1.000      1.1013413  0.9136702    1.327561 0.09531521  1.012732 3.111881e-01
# 18    ObstructiveLungDiseaseTRUE  1.11 ( 0.94 ~  1.32)   0.206       0.259       1.000      1.1143988  0.9422821    1.317954 0.08559630  1.265417 2.057217e-01
# 19 Fibromyalgia_Pain_FatigueTRUE  1.08 ( 0.94 ~  1.24)   0.269       0.284       1.000      1.0817927  0.9410720    1.243556 0.07110089  1.105747 2.688360e-01
# 
# 
# $alpha0.5
# $alpha0.5$lambda.1se
#       rowname               HRCI p_value star  p.fdr *fdr  p.bon *bon exp(coef) exp(2.5 %) exp(97.5 %)   se(coef)        z Pr(>|z|)
# 1 AnxietyTRUE 2.12 (1.83 ~ 2.45)  <0.001  *** <0.001  *** <0.001  ***  2.117198   1.826935    2.453577 0.07523286 9.970291        0
# 
# $alpha0.5$lambda.min
#                          rowname                  HRCI p_value star  p.fdr *fdr  p.bon *bon exp(coef) exp(2.5 %) exp(97.5 %)   se(coef)         z     Pr(>|z|)
# 1                  DysthymiaTRUE  2.87 ( 1.86 ~  4.42)  <0.001  *** <0.001  *** <0.001  *** 2.8677199  1.8585707    4.424807 0.22128441  4.760919 1.927130e-06
# 2                    AnxietyTRUE  2.04 ( 1.75 ~  2.38)  <0.001  *** <0.001  *** <0.001  *** 2.0410716  1.7521331    2.377658 0.07787949  9.161269 0.000000e+00
# 3         AdjustmentDisorderTRUE  5.48 ( 1.36 ~ 22.14)   0.017  *    0.046  *    0.321      5.4816022  1.3572165   22.139403 0.71223836  2.388803 1.690334e-02
# 4                  StrokeTIATRUE  1.38 ( 1.11 ~  1.71)   0.003  **   0.015  *    0.060      1.3822801  1.1147876    1.713957 0.10973185  2.950231 3.175360e-03
# 5             HyperlipidemiaTRUE  1.27 ( 1.10 ~  1.48)   0.002  **   0.010  *    0.030  *   1.2712416  1.0953296    1.475405 0.07599053  3.158210 1.587414e-03
# 6                     AnemiaTRUE  1.45 ( 1.02 ~  2.06)   0.041  *    0.097       0.779      1.4452143  1.0152025    2.057367 0.18019183  2.043698 4.098342e-02
# 7               OsteoporosisTRUE  1.28 ( 1.08 ~  1.53)   0.005  **   0.019  *    0.094      1.2845012  1.0786324    1.529662 0.08912231  2.809290 4.965084e-03
# 8              ChronicKidneyTRUE  1.28 ( 0.93 ~  1.74)   0.127       0.188       1.000      1.2758004  0.9332795    1.744029 0.15950509  1.527059 1.267463e-01
# 9     AcquiredHypothyroidismTRUE  0.71 ( 0.45 ~  1.12)   0.142       0.192       1.000      0.7098834  0.4495108    1.121073 0.23313743 -1.469753 1.416286e-01
# 10                  EpilepsyTRUE  1.43 ( 0.81 ~  2.51)   0.218       0.259       1.000      1.4260418  0.8104668    2.509165 0.28829481  1.231041 2.183077e-01
# 11                 ArthritisTRUE  1.23 ( 1.04 ~  1.45)   0.016  *    0.046  *    0.296      1.2290567  1.0399114    1.452605 0.08526253  2.418964 1.556478e-02
# 12                  GlaucomaTRUE  1.19 ( 0.97 ~  1.46)   0.094       0.188       1.000      1.1921177  0.9707556    1.463957 0.10480388  1.676764 9.358873e-02
# 13  Migraine_ChronicHeadacheTRUE  1.14 ( 0.96 ~  1.36)   0.128       0.188       1.000      1.1421294  0.9623328    1.355518 0.08739410  1.520633 1.283519e-01
# 14                  CataractTRUE  1.13 ( 0.97 ~  1.31)   0.116       0.188       1.000      1.1289740  0.9703137    1.313577 0.07726931  1.569953 1.164259e-01
# 15              HypertensionTRUE  1.18 ( 0.88 ~  1.57)   0.265       0.284       1.000      1.1778428  0.8834378    1.570358 0.14674712  1.115420 2.646705e-01
# 16              LiverDiseaseTRUE  1.10 ( 0.91 ~  1.33)   0.311       0.311       1.000      1.1013413  0.9136702    1.327561 0.09531521  1.012732 3.111881e-01
# 17           CancerSurvivorsTRUE  1.50 ( 0.92 ~  2.43)   0.104       0.188       1.000      1.4956666  0.9202286    2.430938 0.24781328  1.624497 1.042697e-01
# 18    ObstructiveLungDiseaseTRUE  1.11 ( 0.94 ~  1.32)   0.206       0.259       1.000      1.1143988  0.9422821    1.317954 0.08559630  1.265417 2.057217e-01
# 19 Fibromyalgia_Pain_FatigueTRUE  1.08 ( 0.94 ~  1.24)   0.269       0.284       1.000      1.0817927  0.9410720    1.243556 0.07110089  1.105747 2.688360e-01






#@ end -----  

