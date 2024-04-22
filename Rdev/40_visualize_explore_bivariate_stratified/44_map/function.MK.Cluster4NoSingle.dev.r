
function.MK.Cluster4NoSingle = function(input.PopulationDF, input.DistanceMatrix, input.ODMatrix, input.ODMatrix.marginDF, Min.SC, Max.Distance, Min.Pop, print.iteration = T) {
    library(tidyverse)
    # browser()

    if (!identical(input.PopulationDF$Code, sort(input.PopulationDF$Code))) {stop("!identical(input.PopulationDF$Code, sort(input.PopulationDF$Code))")}
    if (!identical(rownames(input.DistanceMatrix), colnames(input.DistanceMatrix))) {stop("!identical(rownames(input.DistanceMatrix), colnames(input.DistanceMatrix))")}
    if (!identical(rownames(input.DistanceMatrix), sort(rownames(input.DistanceMatrix)))) {stop("!identical(rownames(input.DistanceMatrix), sort(rownames(input.DistanceMatrix)))")}
    if (!identical(rownames(input.ODMatrix), colnames(input.ODMatrix))) {stop("!identical(rownames(input.ODMatrix), colnames(input.ODMatrix))")}
    if (!identical(rownames(input.ODMatrix), sort(rownames(input.ODMatrix)))) {stop("!identical(rownames(input.ODMatrix), sort(rownames(input.ODMatrix)))")}
    
    PopulationDF0 <- input.PopulationDF %>% mutate(Code = Code %>% as.character) %>% as.data.frame
    DistanceMatrix0 = input.DistanceMatrix %>% as.matrix
    ODMatrix0 = input.ODMatrix %>% as.matrix
    if (!identical(rownames(DistanceMatrix0), PopulationDF0$Code)) {stop("!identical(rownames(DistanceMatrix0), PopulationDF0$Code)")}
    if (!identical(rownames(ODMatrix0), PopulationDF0$Code)) {stop("!identical(rownames(ODMatrix0), PopulationDF0$Code)")}

    
    ODMatrix0.marginDF = input.ODMatrix.marginDF %>% mutate(
        Code = Code %>% as.character
        , rowSums = ifelse(rowSums == 0, 1/10^10, rowSums)
        , colSums = ifelse(colSums == 0, 1/10^10, colSums)
    ) %>% as.data.frame
    if (!identical(ODMatrix0.marginDF$Code, PopulationDF0$Code)) {stop("!identical(ODMatrix0.marginDF$Code, PopulationDF0$Code)")}
    
    CodeDF0 <- PopulationDF0["Code"] %>% mutate(Code = Code %>% as.character) %>% as.data.frame
    PopDF0 <- PopulationDF0["Pop"] %>% mutate(Pop = Pop %>% as.numeric) %>% as.data.frame  # not necessary?
    CodeDF0.num = CodeDF0 %>% mutate(Code = Code %>% as.integer)
    
    
    
    # ------------------------------------------------------------------------------------------ 
    #@ Internal functions =====

    # ODMatrix_rowP.ftn receives input.ODMatrix and input.ODMatrix as input, and normalize by a rowSums vector (which is a column vector). 
    # In 2015 HealthMap paper, the elements in the rowSums-normalized input.ODMatrix(ODMatrix_rowP) was called Relevance Index (RI_ij).
    # If you want the normalized rowSums to be one, you can divide each elements by rowSums (i.e., input.ODMatrix/rowSums(input.ODMatrix)). 
    # If you want the normalized rowSums to be certain proportions, you can provide the denominators as the function argument input.ODMatrix.denominator.rowSums.
    ODMatrix_rowP.ftn <- function(input.ODMatrix, input.ODMatrix.denominator.rowSums) {
        ODMatrix_rowP = as.matrix(input.ODMatrix)/input.ODMatrix.denominator.rowSums
        return(ODMatrix_rowP)
    } 

    # ODMatrix_t_colP.ftn receives input.ODMatrix and input.ODMatrix as input, normalize by a colSums vector (which is conceptually a row vector, but calculated as a column vector) and transpose it. 
    # In 2015 HealthMap paper, the elements in the colSums-normalized transposed input.ODMatrix(ODMatrix_t_colP) was called Commitment Index (CI_ij).
    # In R, calculation is performed as a column vector, so you transpose the matrix first, and divide by the colSums vector (which is conceptually a row vector, but calculated as a column vector). 
    # If you want the normalized colSums to be one, you can divide each elements by colSums (i.e., t(input.ODMatrix)/colSums(input.ODMatrix)). 
    # If you want the normalized colSums to be certain proportions, you can provide the denominators as the function argument input.ODMatrix.denominator.colSums.
    ODMatrix_t_colP.ftn <- function(input.ODMatrix, input.ODMatrix.denominator.colSums) {
        ODMatrix_t_colP = t(as.matrix(input.ODMatrix)) / input.ODMatrix.denominator.colSums
        return(ODMatrix_t_colP)
    }
    
    # ODMatrix_rowP.ODMatrix_t_colP_t.ftn receives the rowSums-normalized input.ODMatrix(ODMatrix_rowP), and colSums-normalized transposed input.ODMatrix(ODMatrix_t_colP), and returns the ODMatrix_rowP * t(ODMatrix_t_colP).
    # In 2015 HealthMap paper, the elements in the rowSums-normalized input.ODMatrix(ODMatrix_rowP) was called Relevance Index (RI).
    # In 2015 HealthMap paper, the elements in the colSums-normalized transposed input.ODMatrix(ODMatrix_t_colP) was called Commitment Index (CI).
    # In 2015 HealthMap paper, the elements in the ODMatrix_rowP * t(ODMatrix_t_colP) was called the product of Relevance Index (RI) and Commitment Index (CI), RI_ij * CI_ji.
    ODMatrix_rowP.ODMatrix_t_colP_t.ftn <- function(ODMatrix_rowP, ODMatrix_t_colP) {
        ODMatrix_rowP.ODMatrix_t_colP_t <- ODMatrix_rowP * t(ODMatrix_t_colP)
        return(ODMatrix_rowP.ODMatrix_t_colP_t)
    }
    
    diag.rowP.ftn <- function(input.ODMatrix, input.ODMatrix.denominator.rowSums) {
        diag(input.ODMatrix / input.ODMatrix.denominator.rowSums)
    }
    
    
    function.iteration.out = function(Code4MergeFrom, Code4MergeInto, Results.iteration.list, type_of_iteration = "iteration for Min.Pop") {
        # browser() # debug190507v14
        CodeDF.new = Results.iteration.list[[length(Results.iteration.list)]]$CodeDF.new
        CodeDF.new$Code.new = CodeDF.new$Code.new %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T)
        
        PopulationDF.new = Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new %>% 
            mutate(Code.Cluster = Code.Cluster %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T))
        PopulationDF.new = 
            PopulationDF.new %>% 
            group_by(Code.Cluster) %>% summarise(Pop.Cluster = sum(Pop.Cluster, na.rm = T))
        
        DistanceMatrix.new = Results.iteration.list[[length(Results.iteration.list)]]$DistanceMatrix.new %>% 
            as.data.frame %>% rownames_to_column %>% gather("key", "value", -rowname) %>% 
            mutate(
                rowname = rowname %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T)
                , key = key %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T)
            ) %>% 
            group_by(rowname, key) %>% summarise(value = max(value, na.rm = T)) %>% 
            spread("key", "value") %>% as.data.frame %>% column_to_rownames %>% as.matrix
        
        ODMatrix.new = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% 
            as.data.frame %>% rownames_to_column %>% gather("key", "value", -rowname) %>% 
            mutate(
                rowname = rowname %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T)
                , key = key %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T)
            ) %>% 
            group_by(rowname, key) %>% summarise(value = sum(value, na.rm = T)) %>% 
            spread("key", "value") %>% as.data.frame %>% column_to_rownames %>% as.matrix
        
        ODMatrix0.marginDF.new = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix0.marginDF.new %>% 
            mutate(Code.Cluster = Code.Cluster %>% gsub(Code4MergeFrom[1], Code4MergeInto[1], ., fixed = T))
        ODMatrix0.marginDF.new = 
            ODMatrix0.marginDF.new %>% 
            group_by(Code.Cluster) %>% summarise(rowSums = sum(rowSums, na.rm = T), colSums = sum(colSums, na.rm = T))
        
        
        iteration.out = list(
            CodeDF.new = CodeDF.new
            , PopulationDF.new = PopulationDF.new
            , DistanceMatrix.new = DistanceMatrix.new
            , ODMatrix.new = ODMatrix.new
            , ODMatrix0.marginDF.new = ODMatrix0.marginDF.new
            , Cluster.tbl = 
                PopulationDF.new %>% 
                # rename(
                #     Code.Cluster = Code
                #     , Pop.Cluster = Pop
                # ) %>% 
                mutate(
                    OD.diag = ODMatrix.new %>% {diag(.)}
                    # , OD.rowSums = ODMatrix.new %>% {rowSums(., na.rm = T)}
                    # , OD.diag_rowP = ODMatrix.new %>% {diag(.)/rowSums(., na.rm = T)}
                    # , OD.colSums = ODMatrix.new %>% {colSums(., na.rm = T)}
                    # , OD.diag_colP = ODMatrix.new %>% {diag(.)/colSums(., na.rm = T)}
                    , OD.rowSums = ODMatrix0.marginDF.new$rowSums
                    , OD.diag_rowP = OD.diag/OD.rowSums
                    , OD.colSums = ODMatrix0.marginDF.new$colSums
                    , OD.diag_colP = OD.diag/OD.colSums
                    , warning = ""
                ) %>% 
                left_join( # revision190512v2 -----
                           CodeDF.new %>%
                               group_by(Code.new) %>% nest %>%
                               mutate(
                                   Max.Distance.withinCluster = data %>% 
                                       map_dbl(function(df) {
                                           vec_Code = df$Code
                                           Results.iteration.list[[1]]$DistanceMatrix.new[vec_Code, vec_Code] %>% max
                                       })
                               ) %>%
                               mutate(n_Code = data %>% map_int(nrow)) %>%
                               cbind(
                                   .$data %>% map(t) %>% map(as_tibble) %>% bind_rows
                               ) %>%
                               select(-data) %>%
                               rename(Code.Cluster = Code.new) %>%
                               as_tibble
                           , by = "Code.Cluster"
                ) %>%
                as_tibble
        )
        iteration.out$warningmessage.vec = warningmessage.vec 
        iteration.out$Code4MergeFromToDF = Code4MergeFromToDF
        
        attr(iteration.out, "iteration_info") = list(
            type_of_iteration = type_of_iteration
            , Code4MergeFrom.remaining = Code4MergeFrom
            , Code4MergeFrom.current = Code4MergeFrom[1]
            , Code4MergeInto.current = Code4MergeInto
            , time_passed.cumulative = Sys.time() - t0
        ) # list inside attr() is not shown with str(max.level = 1)
        return(iteration.out)
    }
    
    
    
    
    
    # ------------------------------------------------------------------------------------------
    
    
    #@@@@ Start of tuning =====
    warningmessage.vec = vector()
    Code4MergeFromToDF = data.frame(type_of_iteration = "input", iteration = NA, Code4MergeFrom = NA, Code4MergeInto = NA, warning = NA)
    Results.iteration.list = list()
    # Results.iteration.list[[1]] = list(PopulationDF0 = PopulationDF0, DistanceMatrix0 = DistanceMatrix0, ODMatrix0 = ODMatrix0, ODMatrix0.marginDF = ODMatrix0.marginDF)
    Results.iteration.list[[1]] = list(
        PopulationDF.new = PopulationDF0 %>% rename(Code.Cluster = Code, Pop.Cluster = Pop)
        , DistanceMatrix.new = DistanceMatrix0
        , ODMatrix.new = ODMatrix0
        , ODMatrix0.marginDF.new = ODMatrix0.marginDF %>% rename(Code.Cluster = Code)
    )
    
    # Results.iteration.list[[1]]$CodeDF0 = CodeDF0
    CodeDF.new = CodeDF0
    CodeDF.new$Code.new = CodeDF0$Code
    Results.iteration.list[[1]]$CodeDF.new = CodeDF.new

    Results.iteration.list[[1]]$Cluster.tbl = 
        Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new %>% 
        # rename(
        #     Code.Cluster = Code
        #     , Pop.Cluster = Pop
        # ) %>% 
        mutate(
            OD.diag = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {diag(.)}
            # , OD.rowSums = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {rowSums(., na.rm = T)}
            # , OD.diag_rowP = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {diag(.)/rowSums(., na.rm = T)}
            # , OD.colSums = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {colSums(., na.rm = T)}
            # , OD.diag_colP = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {diag(.)/colSums(., na.rm = T)}
            , OD.rowSums = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix0.marginDF.new$rowSums
            , OD.diag_rowP = OD.diag/OD.rowSums
            , OD.colSums = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix0.marginDF.new$colSums
            , OD.diag_colP = OD.diag/OD.colSums
            , warning = ""
            , Max.Distance.withinCluster = 0
            # , n_Code = 1L
        ) %>% 
        left_join(
            Results.iteration.list[[length(Results.iteration.list)]]$CodeDF.new %>% 
                group_by(Code.new) %>% nest %>% 
                mutate(n_Code = data %>% map_int(nrow)) %>% 
                cbind(
                    .$data %>% map(t) %>% map(as_tibble) %>% bind_rows
                ) %>% 
                select(-data) %>% 
                rename(Code.Cluster = Code.new) %>% 
                as_tibble
            , by = "Code.Cluster"
        ) %>% 
        as_tibble
    Results.iteration.list[[1]]$warningmessage.vec = warningmessage.vec 
    attr(Results.iteration.list[[1]], "iteration_info") = list(
        type_of_iteration = "initial data before iteration"
        , time_passed.cumulative = Sys.time() - t0
    ) # list inside attr() is not shown with str(max.level = 1)
    
    # browser()
    # ------------------------------------------------------------------------------------------ 
    #@ iteration) Singles = Cluster.tbl.last %>% filter(n_Code == 1) %>% {.$Code.Cluster} ======
    # print(Sys.time() - t0)
    # cat("..for Min.Pop")
    iteration = 0
    type_of_iteration = "NoSingle"
    if(print.iteration == T) cat(paste0("[", type_of_iteration, "]"))
    i.warningmessage = ""
    for (iteration in 1:999) {
        # if(print.iteration == T) cat(paste0("..", iteration))

        PopulationDF.last = Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new
        Cluster.tbl.last = Results.iteration.list[[length(Results.iteration.list)]]$Cluster.tbl
        DistanceMatrix.last = Results.iteration.list[[length(Results.iteration.list)]]$DistanceMatrix.new
        # ODMatrix.last = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new
        # ODMatrix0.marginDF.last = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix0.marginDF.new
        # 
        # ODMatrix_rowP.ODMatrix_t_colP_t <- 
        #     ODMatrix_rowP.ODMatrix_t_colP_t.ftn(
        #         ODMatrix_rowP.ftn(ODMatrix.last, ODMatrix0.marginDF.last$rowSums)
        #         , ODMatrix_t_colP.ftn(ODMatrix.last, ODMatrix0.marginDF.last$colSums)
        #     )
        # ODMatrix_rowP.ODMatrix_t_colP_t.rm_self = ODMatrix_rowP.ODMatrix_t_colP_t
        # diag(ODMatrix_rowP.ODMatrix_t_colP_t.rm_self) = NA
        # ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_gt_Max.Distance = ODMatrix_rowP.ODMatrix_t_colP_t.rm_self; 
        # ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_gt_Max.Distance[DistanceMatrix.last > Max.Distance ] = NA
        DistanceMatrix.last.rm_self = DistanceMatrix.last
        diag(DistanceMatrix.last.rm_self) = NA
        DistanceMatrix.last.rm_self.rm_gt_Max.Distance = DistanceMatrix.last.rm_self
        DistanceMatrix.last.rm_self.rm_gt_Max.Distance[DistanceMatrix.last > Max.Distance ] = NA
        # DistanceMatrix.last.rm_self.rm_gt_Max.Distance %>% {which(. == min(., na.rm = T), arr.ind = TRUE)} #----
        # Singles = Cluster.tbl.last %>% filter(n_Code == 1) %>% {.$Code.Cluster}
        NotSingle = Cluster.tbl.last %>% filter(n_Code > 1) %>% {.$Code.Cluster}
        DistanceMatrix.last.rm_self.rm_gt_Max.Distance.rm_NotSingle = DistanceMatrix.last.rm_self.rm_gt_Max.Distance
        DistanceMatrix.last.rm_self.rm_gt_Max.Distance.rm_NotSingle[NotSingle, ] = NA
        DistanceMatrix.last.rm_self.rm_gt_Max.Distance.rm_NotSingle[, NotSingle] = NA
        
        tmpvec = DistanceMatrix.last.rm_self.rm_gt_Max.Distance.rm_NotSingle %>% {colnames(.)[unique(as.vector(which(. == min(., na.rm = T), arr.ind = TRUE)))]}
        # Code4MergeFrom = PopulationDF.last %>% filter(Code.Cluster %in% tmpvec) %>% arrange(Pop.Cluster) %>% {.$Code.Cluster}
        # Code4MergeFrom = Cluster.tbl.last %>% filter(n_Code == 1) %>% filter(Code.Cluster %in% tmpvec) %>% arrange(Pop.Cluster) %>% {.$Code.Cluster}
        Code4MergeFrom = Cluster.tbl.last %>% filter(Code.Cluster %in% tmpvec) %>% arrange(Pop.Cluster) %>% {.$Code.Cluster}
        if(length(Code4MergeFrom) == 0) {
            # warning("length(Code4MergeFrom) == 0)")
            # warning("No more Code4MergeFrom")
            
            Singles = Cluster.tbl.last %>% filter(n_Code == 1) %>% {.$Code.Cluster}
            if(length(Singles) == 1) {
                Code4MergeFrom = Singles
            } else {
                break
            }
        }

        index4MergeInto = DistanceMatrix.last.rm_self.rm_gt_Max.Distance[Code4MergeFrom[1], ] %>% which.min
        if(length(index4MergeInto) == 0) {
            # warning("length(index4MergeInto) == 0)")
            i.warningmessage = paste0("[", type_of_iteration, "]", "Remaining Code4MergeFrom, but cannot find where to merge: ", Code4MergeFrom %>% paste(collapse = ", "))
            # warning(i.warningmessage)
            cat(i.warningmessage)
            # Results.iteration.list[[length(Results.iteration.list)]]$Cluster.tbl$warning = i.warningmessage
            warningmessage.vec = c(warningmessage.vec, i.warningmessage)
            Results.iteration.list[[length(Results.iteration.list)]]$Code4MergeFromToDF$warning[
                nrow(Results.iteration.list[[length(Results.iteration.list)]]$Code4MergeFromToDF)
                ] = i.warningmessage
            break # 190513
        }
        # Code4MergeInto = PopulationDF.last$Code.Cluster[index4MergeInto]
        Code4MergeInto = colnames(DistanceMatrix.last.rm_self.rm_gt_Max.Distance)[index4MergeInto]
        
        # if(print.iteration == T) print(paste0("Code4MergeFrom: ", Code4MergeFrom[1], ", Code4MergeInto: ", Code4MergeInto))
        if(print.iteration == T) cat(paste0("..", Code4MergeFrom[1], "->", Code4MergeInto))
        Code4MergeFromToDF = Code4MergeFromToDF %>% add_row(type_of_iteration = type_of_iteration, iteration = iteration, Code4MergeFrom = Code4MergeFrom[1], Code4MergeInto = Code4MergeInto[1])

        Results.iteration.list[[length(Results.iteration.list) + 1]] = 
            function.iteration.out(Code4MergeFrom[1], Code4MergeInto[1], Results.iteration.list)
        
        # print(Sys.time() - t0)
        
    }
    
    
    out = Results.iteration.list
}
