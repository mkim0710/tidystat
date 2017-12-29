# trainset.cv.glmnet_alphas_cox.source.r



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
    x <- build.x(myFormula, data = trainset, contrast = FALSE)[,-1];
    # print(paste0("dim(x) : ", deparse(dim(x)) ))
    # print(paste0("any(colSums(x) == 0) : ", deparse(any(colSums(x) == 0)) ))
    # print(paste0("which(colSums(x) == 0) : ", deparse(which(colSums(x) == 0)) ))
    if (any(colSums(x) == 0)) {
        print(paste0("any(colSums(x) == 0) == T : removing columns: ", deparse(colnames(x)[which(colSums(x) == 0)]) ))
        x = x[,-which(colSums(x) == 0)]  # 170522 remove columns with only 0
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
    mf.response <- model.extract(mf, "response")
    if (!inherits(mf.response, "Surv")) stop("Response must be a survival object")
    # browser()
    # Browse[2]> mf.response %>% str
    # Surv [1:1000, 1:2]  1.76878   0.54528   0.04486+  0.85032+  0.61488   0.29861+  0.01717+ 15.97135   0.64802   1.91448+ ...
    # - attr(*, "dimnames")=List of 2
    # ..$ : chr [1:1000] "1" "2" "3" "4" ...
    # ..$ : chr [1:2] "time" "status"
    # - attr(*, "type")= chr "right"
    # Browse[2]> mf.response %>% as.matrix %>% str
    # num [1:1000, 1:2] 1.7688 0.5453 0.0449 0.8503 0.6149 ...
    # - attr(*, "dimnames")=List of 2
    # ..$ : chr [1:1000] "1" "2" "3" "4" ...
    # ..$ : chr [1:2] "time" "status"
    
    # help(glmnet)
    # # For family="cox", y should be a two-column matrix with columns named 'time' and 'status'. The latter is a binary variable, with '1' indicating death, and '0' indicating right censored. The function Surv() in package survival produces such a matrix.
    y = mf.response

    
    # train <- 1:nrow(x) ;  # set.seed( seed ) ; train <- sample( 1:nrow(x) , nrow(x)/2 ) ; test <- ( -train ) ; 
    return_list = alphas %>% seq_along %>% map(function(i_alpha) {
        print(paste0("Beginning .f() map from alphas [", i_alpha, "] valued : ", alphas[i_alpha] ))
        Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) ;
        
        return_name.i.tmp = paste0(return_name,paste_itrainset,".cv.glmnet",paste_imyFormula,"_a", alphas[i_alpha])
        set.seed( seed ) ; 
        # out = cv.glmnet(x[train,], y[train], alpha = alphas[i_alpha], family="binomial", type.measure = my.type.measure, nfolds = nfolds)
        out = cv.glmnet(x, y, alpha = alphas[i_alpha], family=glmnet.family, type.measure = my.type.measure, nfolds = nfolds)
        
        if (saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha == T) {
            saveRDS(out, paste0(return_name.i.tmp, ".rds"))
            print(paste0("saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha == T : ", paste0(return_name.i.tmp, ".rds") ))
        }
        if(save.png == TRUE) {
            png(paste0(return_name.i.tmp , "_plot.png"), width = png.size, height =  png.size, units = "px", bg = "transparent"); 
            plot(out, main =  paste0(return_name.i.tmp, "_plot"), cex.main = 0.5); 
            dev.off(); 
            print(paste0("plot(object_cvglmnet) : ", paste0(return_name.i.tmp , "_plot.png") ))
        }
        
        if (return.glmnet.objects != T) {
            out = list(saveRDS = paste0(return_name.i.tmp, ".rds"), png = paste0(return_name.i.tmp , "_plot.png"))
        }
        Sys.time_2 <- Sys.time(); print(paste0("Sys.time_2 - Sys.time_1 : ", deparse(Sys.time_2 - Sys.time_1) )); gc()
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
        , myFormula = myFormula
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
    # print( paste0( return_name , ".cv.glmnet_alphas" ) ); # assign( paste0( return_name, ".cv.glmnet_alphas" ) , return_list , envir = .GlobalEnv) ;
    out}; # save.image() # update 170509

#@ test) trainset.cv.glmnet_alphas_cox() CoxExample_tibble ----
# library(glmnet)
# data(CoxExample)
# CoxExample_tibble = bind_cols(as_tibble(y), as_tibble(x))
# save(CoxExample_tibble, file = "library(glmnet) CoxExample_tibble.rda")
library(tidyverse)
load("library(glmnet) CoxExample_tibble.rda")
CoxExample_tibble %>% as.tibble
# > CoxExample_tibble %>% as.tibble
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


CoxExample_tibble.cv.glmnet_alphas_cox =
    CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time, status)~., itrainset = NULL, imyFormula = NULL,save.png = F)
CoxExample_tibble.cv.glmnet_alphas_cox %>% str(max.level = 1)
CoxExample_tibble.cv.glmnet_alphas_cox =
    CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time, status)~., itrainset = "itrainset", imyFormula = "imyFormula",save.png = T)
CoxExample_tibble.cv.glmnet_alphas_cox %>% str(max.level = 1)
CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% str(max.level = 1)
# > CoxExample_tibble.cv.glmnet_alphas_cox =
# +     CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time, status)~., itrainset = NULL, imyFormula = NULL,save.png = F)
# [1] "Beginning .f() map from alphas [1] valued : 1"
# [1] "Sys.time_1 : 2017-12-29 18:08:26"
# [1] "Sys.time_2 - Sys.time_1 : structure(0.290771007537842, units = \"secs\", class = \"difftime\")"
# [1] "Beginning .f() map from alphas [2] valued : 0.5"
# [1] "Sys.time_1 : 2017-12-29 18:08:26"
# [1] "Sys.time_2 - Sys.time_1 : structure(0.616238117218018, units = \"secs\", class = \"difftime\")"
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% str(max.level = 1)
# List of 2
#  $ alpha1  :List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#  $ alpha0.5:List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#  - attr(*, "function.input")=List of 18
# > CoxExample_tibble.cv.glmnet_alphas_cox =
# +     CoxExample_tibble %>% trainset.cv.glmnet_alphas_cox(myFormula = Surv(time, status)~., itrainset = "itrainset", imyFormula = "imyFormula",save.png = T)
# [1] "Beginning .f() map from alphas [1] valued : 1"
# [1] "Sys.time_1 : 2017-12-29 18:08:27"
# [1] "plot(object_cvglmnet) : trainset_itrainset.cv.glmnet_imyFormula_a1_plot.png"
# [1] "Sys.time_2 - Sys.time_1 : structure(0.352939128875732, units = \"secs\", class = \"difftime\")"
# [1] "Beginning .f() map from alphas [2] valued : 0.5"
# [1] "Sys.time_1 : 2017-12-29 18:08:28"
# [1] "plot(object_cvglmnet) : trainset_itrainset.cv.glmnet_imyFormula_a0.5_plot.png"
# [1] "Sys.time_2 - Sys.time_1 : structure(0.39408802986145, units = \"secs\", class = \"difftime\")"
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% str(max.level = 1)
# List of 2
#  $ alpha1  :List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#  $ alpha0.5:List of 10
#   ..- attr(*, "class")= chr "cv.glmnet"
#  - attr(*, "function.input")=List of 18
# > CoxExample_tibble.cv.glmnet_alphas_cox %>% attr(., "function.input") %>% str(max.level = 1)
# List of 18
#  $ Call                                                     : language trainset.cv.glmnet_alphas_cox(trainset = ., myFormula = Surv(time, status) ~ ., itrainset = "itrainset", imyFormu| __truncated__
#  $ CreatedDate                                              : POSIXct[1:1], format: "2017-12-29 18:08:29"
#  $ functionUsed                                             :function (trainset, myFormula, alphas = c(1, 0.5), glmnet.family = "cox", my.type.measure = "deviance", na.omit.needed = F, return.glmnet.objects = T, 
#     saveRDS_return_name_itrainset.cv.glmnet_imyFormula_ialpha = F, return_name = NULL, itrainset = NULL, imyFormula = NULL, save.png = TRUE, 
#     png.size = 1280, seed = 1, nfolds = 5)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 33 149 8 33 8 1 149
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000006e692e0> 
#  $ trainset_name                                            : chr [1:7840] "structure(list(time = c(1.7687775658842, 0.545284044924978, 0.0448591779898214, " "0.850322982646606, 0.614884258533517, 0.298609393241967, 0.0171739813784381, " "15.9713501150213, 0.648016143423707, 1.91448321146452, 1.37737581822182, " "0.504883313673581, 0.175484415215699, 0.0502979398859797, 1.77155865113711, " ...
#  $ myFormula                                                :Class 'formula'  language Surv(time, status) ~ .
#   .. ..- attr(*, ".Environment")=<environment: 0x0000000024b33d78> 
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




object_cvglmnet.coefexp = function(object_cvglmnet, nonzero = F) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")
    library(glmnet)
    library(tidyverse)
    out = c("lambda.min", "lambda.1se") %>% map(function(chr) {
        coef(object_cvglmnet, s = chr)
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
        out.NA = out.NA %>% filter(is.na(coef.min) * is.na(coef.1se) == 0)
    }
    out.NA
}
object_list_cvglmnet.coefexp = function(object_list_cvglmnet, i_names = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")    
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
            i_names = names(object_list_cvglmnet) %>% stringr::str_extract("\\_a1$|\\_a0\\.[1-9]$")
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


#@ end -----
