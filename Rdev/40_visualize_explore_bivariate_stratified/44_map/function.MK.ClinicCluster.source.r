# function.MK.ClinicCluster190512v4clean.r
function.MK.ClinicCluster = function(input.PopulationDF, input.DistanceMatrix, input.ODMatrix, input.ODMatrix.marginDF, Min.SC, Max.Distance, Min.Pop, print.iteration = T) {
    library(tidyverse)
    
    PopulationDF <- input.PopulationDF %>% mutate(Code = Code %>% as.character) %>% as.data.frame
    DistanceMatrix = input.DistanceMatrix %>% as.matrix
    ODMatrix = input.ODMatrix %>% as.matrix
    if (!identical(rownames(DistanceMatrix), PopulationDF$Code)) {stop("!identical(rownames(DistanceMatrix), PopulationDF$Code)")}
    if (!identical(colnames(DistanceMatrix), PopulationDF$Code)) {stop("!identical(colnames(DistanceMatrix), PopulationDF$Code)")}
    if (!identical(rownames(ODMatrix), PopulationDF$Code)) {stop("!identical(rownames(ODMatrix), PopulationDF$Code)")}
    if (!identical(colnames(ODMatrix), PopulationDF$Code)) {stop("!identical(colnames(ODMatrix), PopulationDF$Code)")}

    ODMatrix.marginDF = input.ODMatrix.marginDF %>% mutate(
        Code = Code %>% as.character
        , rowSums = ifelse(rowSums == 0, 1/10^10, rowSums)
        , colSums = ifelse(colSums == 0, 1/10^10, colSums)
    ) %>% as.data.frame
    if (!identical(ODMatrix.marginDF$Code, PopulationDF$Code)) {stop("!identical(ODMatrix.marginDF$Code, PopulationDF$Code)")}
    
    CodeDF <- PopulationDF["Code"] %>% mutate(Code = Code %>% as.character) %>% as.data.frame
    PopDF <- PopulationDF["Pop"] %>% mutate(Pop = Pop %>% as.numeric) %>% as.data.frame
    CodeDF.num = CodeDF %>% mutate(Code = Code %>% as.integer)
    
    
    
    # ------------------------------------------------------------------------------------------------------------- 
    #@ Internal functions =====

    # ODMatrix_rowP.ftn receives ODMatrix and ODMatrix as input, and normalize by a rowSums vector (which is a column vector). 
    # In 2015 HealthMap paper, the elements in the rowSums-normalized ODMatrix(ODMatrix_rowP) was called Relevance Index (RI_ij).
    # If you want the normalized rowSums to be one, you can divide each elements by rowSums (i.e., ODMatrix/rowSums(ODMatrix)). 
    # If you want the normalized rowSums to be certain proportions, you can provide the denominators as the function argument ODMatrix.denominator.rowSums.
    ODMatrix_rowP.ftn <- function(ODMatrix, ODMatrix.denominator.rowSums) {
        ODMatrix_rowP = as.matrix(ODMatrix)/ODMatrix.denominator.rowSums
        return(ODMatrix_rowP)
    } 

    # ODMatrix_t_colP.ftn receives ODMatrix and ODMatrix as input, normalize by a colSums vector (which is conceptually a row vector, but calculated as a column vector) and transpose it. 
    # In 2015 HealthMap paper, the elements in the colSums-normalized transposed ODMatrix(ODMatrix_t_colP) was called Commitment Index (CI_ij).
    # In R, calculation is performed as a column vector, so you transpose the matrix first, and divide by the colSums vector (which is conceptually a row vector, but calculated as a column vector). 
    # If you want the normalized colSums to be one, you can divide each elements by colSums (i.e., t(ODMatrix)/colSums(ODMatrix)). 
    # If you want the normalized colSums to be certain proportions, you can provide the denominators as the function argument ODMatrix.denominator.colSums.
    ODMatrix_t_colP.ftn <- function(ODMatrix, ODMatrix.denominator.colSums) {
        ODMatrix_t_colP = t(as.matrix(ODMatrix)) / ODMatrix.denominator.colSums
        return(ODMatrix_t_colP)
    }
    
    # ODMatrix_rowP.ODMatrix_t_colP_t.ftn receives the rowSums-normalized ODMatrix(ODMatrix_rowP), and colSums-normalized transposed ODMatrix(ODMatrix_t_colP), and returns the ODMatrix_rowP * t(ODMatrix_t_colP).
    # In 2015 HealthMap paper, the elements in the rowSums-normalized ODMatrix(ODMatrix_rowP) was called Relevance Index (RI).
    # In 2015 HealthMap paper, the elements in the colSums-normalized transposed ODMatrix(ODMatrix_t_colP) was called Commitment Index (CI).
    # In 2015 HealthMap paper, the elements in the ODMatrix_rowP * t(ODMatrix_t_colP) was called the product of Relevance Index (RI) and Commitment Index (CI), RI_ij * CI_ji.
    ODMatrix_rowP.ODMatrix_t_colP_t.ftn <- function(ODMatrix_rowP, ODMatrix_t_colP) {
        ODMatrix_rowP.ODMatrix_t_colP_t <- ODMatrix_rowP * t(ODMatrix_t_colP)
        return(ODMatrix_rowP.ODMatrix_t_colP_t)
    }
    
    diag.rowP.ftn <- function(ODMatrix, ODMatrix.denominator.rowSums) {
        diag(ODMatrix / ODMatrix.denominator.rowSums)
    }
    
    # -------------------------------------------------------------------------------------------------------------
    
    
    #@@@@ Start of tuning =====
    Results.iteration.list = list()
    Results.iteration.list[[1]] = list(PopulationDF.new = PopulationDF, DistanceMatrix.new = DistanceMatrix, ODMatrix.new = ODMatrix, ODMatrix.marginDF.new = ODMatrix.marginDF)
    
    CodeDF.new = CodeDF
    CodeDF.new$Code.new = CodeDF$Code
    Results.iteration.list[[1]]$CodeDF.new = CodeDF.new
    

    Results.iteration.list[[1]]$Cluster.tbl = 
        Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new %>% 
        rename(
            Code.Cluster = Code
            , Pop.Cluster = Pop
        ) %>% 
        mutate(
            OD.diag_rowSums = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {diag(.)/rowSums(., na.rm = T)}
            , OD.diag_colSums = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% {diag(.)/colSums(., na.rm = T)}
        ) %>% 
        left_join(
            Results.iteration.list[[length(Results.iteration.list)]]$CodeDF.new %>% 
                group_by(Code.new) %>% nest %>% 
                mutate(n_Code = data %>% map_int(nrow)) %>% 
                cbind(
                    .$data %>% map(t) %>% map(as.tibble) %>% bind_rows
                ) %>% 
                select(-data) %>% 
                rename(Code.Cluster = Code.new) %>% 
                as.tibble
            , by = "Code.Cluster"
        ) %>% 
        as.tibble
    attr(Results.iteration.list[[1]], "iteration_info") = list(
        type_of_iteration = "initial data before iteration"
        , time_passed.cumulative = Sys.time() - t0
    ) # list inside attr() is not shown with str(max.level = 1)
    
    
    
    # ------------------------------------------------------------------------------------------------------------- 
    #@ iteration) Code4MergeFrom = PopulationDF %>% filter(Pop < Min.Pop) %>% arrange(Pop) %>% {.$Code} ======
    # warning("Starting iteration for Min.Pop")
    # print(Sys.time() - t0)
    # print("Starting iteration for Min.Pop")
    cat("..for Min.Pop")
    iteration = 0
    for (iteration in 1:999) {
        if(print.iteration == T) print(iteration)
        
        PopulationDF = Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new
        DistanceMatrix = Results.iteration.list[[length(Results.iteration.list)]]$DistanceMatrix.new
        ODMatrix = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new
        ODMatrix.marginDF = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.marginDF.new
        
        ODMatrix_rowP.ODMatrix_t_colP_t <- ODMatrix_rowP.ODMatrix_t_colP_t.ftn(ODMatrix_rowP.ftn(ODMatrix, ODMatrix.marginDF$rowSums),ODMatrix_t_colP.ftn(ODMatrix, ODMatrix.marginDF$colSums))
        ODMatrix_rowP.ODMatrix_t_colP_t.rm_self = ODMatrix_rowP.ODMatrix_t_colP_t
        diag(ODMatrix_rowP.ODMatrix_t_colP_t.rm_self) = NA
        ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_DistanceMatrix = ODMatrix_rowP.ODMatrix_t_colP_t.rm_self; ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_DistanceMatrix[DistanceMatrix >= Max.Distance ] = NA
        
        Code4MergeFrom = PopulationDF %>% filter(Pop < Min.Pop) %>% arrange(Pop) %>% {.$Code}
        if(length(Code4MergeFrom) == 0) {
            # warning("length(Code4MergeFrom) == 0)")
            # warning("No more Code4MergeFrom")
            break
        }

        index4MergeInto = ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_DistanceMatrix[Code4MergeFrom[1], ] %>% which.max
        if(length(index4MergeInto) == 0) {
            # warning("length(index4MergeInto) == 0)")
            warning( paste0("Remaining Code4MergeFrom, but cannot find where to merge: ", Code4MergeFrom %>% paste(collapse = ", ")) )
            print( paste0("Remaining Code4MergeFrom, but cannot find where to merge: ", Code4MergeFrom %>% paste(collapse = ", ")) )
            break # 190513
        }
        Code4MergeInto = PopulationDF$Code[index4MergeInto]
        
        if(print.iteration == T) print(paste0("Code4MergeFrom: ", Code4MergeFrom[1], ", Code4MergeInto: ", Code4MergeInto))

        CodeDF.new = Results.iteration.list[[length(Results.iteration.list)]]$CodeDF.new
        CodeDF.new$Code.new = CodeDF.new$Code.new %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
        
        PopulationDF.new = Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new %>% 
            mutate(Code = Code %>% gsub(Code4MergeFrom[1], Code4MergeInto, .))
        PopulationDF.new = PopulationDF.new %>% group_by(Code) %>% summarise(Pop = sum(Pop, na.rm = T))
        
        DistanceMatrix.new = Results.iteration.list[[length(Results.iteration.list)]]$DistanceMatrix.new %>% 
            as.data.frame %>% rownames_to_column %>% gather("key", "value", -rowname) %>% 
            mutate(
                rowname = rowname %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
                , key = key %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
            ) %>% 
            group_by(rowname, key) %>% summarise(value = max(value, na.rm = T)) %>% 
            spread("key", "value") %>% as.data.frame %>% column_to_rownames %>% as.matrix
        
        ODMatrix.new = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% 
            as.data.frame %>% rownames_to_column %>% gather("key", "value", -rowname) %>% 
            mutate(
                rowname = rowname %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
                , key = key %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
            ) %>% 
            group_by(rowname, key) %>% summarise(value = sum(value, na.rm = T)) %>% 
            spread("key", "value") %>% as.data.frame %>% column_to_rownames %>% as.matrix
        
        ODMatrix.marginDF.new = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.marginDF.new %>% 
            mutate(Code = Code %>% gsub(Code4MergeFrom[1], Code4MergeInto, .))
        ODMatrix.marginDF.new = ODMatrix.marginDF.new %>% group_by(Code) %>% summarise(rowSums = sum(rowSums, na.rm = T), colSums = sum(colSums, na.rm = T))
        
        
        iteration.out = list(
            CodeDF.new = CodeDF.new
            , PopulationDF.new = PopulationDF.new
            , DistanceMatrix.new = DistanceMatrix.new
            , ODMatrix.new = ODMatrix.new
            , ODMatrix.marginDF.new = ODMatrix.marginDF.new
            , Cluster.tbl = 
                PopulationDF.new %>% 
                rename(
                    Code.Cluster = Code
                    , Pop.Cluster = Pop
                ) %>% 
                mutate(
                    OD.diag_rowSums = ODMatrix.new %>% {diag(.)/rowSums(., na.rm = T)}
                    , OD.diag_colSums = ODMatrix.new %>% {diag(.)/colSums(., na.rm = T)}
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
                            .$data %>% map(t) %>% map(as.tibble) %>% bind_rows
                        ) %>%
                        select(-data) %>%
                        rename(Code.Cluster = Code.new) %>%
                        as.tibble
                    , by = "Code.Cluster"
                ) %>%
                as.tibble
        )
        attr(iteration.out, "iteration_info") = list(
            type_of_iteration = "iteration for Min.Pop"
            , Code4MergeFrom.remaining = Code4MergeFrom
            , Code4MergeFrom.current = Code4MergeFrom[1]
            , Code4MergeInto.current = Code4MergeInto
            , time_passed.cumulative = Sys.time() - t0
        ) # list inside attr() is not shown with str(max.level = 1)
        Results.iteration.list[[length(Results.iteration.list) + 1]] = iteration.out
        
        # print(Sys.time() - t0)
        
    }
    
    
    
    # ------------------------------------------------------------------------------------------------------------- 
    #@ iteration) Code4MergeFrom = Cluster.tbl %>% filter(OD.diag_rowSums < Min.SC) %>% arrange(OD.diag_rowSums) %>% {.$Code.Cluster} ======
    # warning("Starting iteration for Min.SC")
    # print(Sys.time() - t0)
    # print("Starting iteration for Min.SC")
    cat("..for Min.SC")
    iteration = 0
    for (iteration in 1:999) {
        if(print.iteration == T) print(iteration)
        
        PopulationDF = Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new
        DistanceMatrix = Results.iteration.list[[length(Results.iteration.list)]]$DistanceMatrix.new
        ODMatrix = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new
        ODMatrix.marginDF = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.marginDF.new
        
		Cluster.tbl = Results.iteration.list[[length(Results.iteration.list)]]$Cluster.tbl
		
        ODMatrix_rowP.ODMatrix_t_colP_t <- ODMatrix_rowP.ODMatrix_t_colP_t.ftn(ODMatrix_rowP.ftn(ODMatrix, ODMatrix.marginDF$rowSums),ODMatrix_t_colP.ftn(ODMatrix, ODMatrix.marginDF$colSums))
        ODMatrix_rowP.ODMatrix_t_colP_t.rm_self = ODMatrix_rowP.ODMatrix_t_colP_t
        diag(ODMatrix_rowP.ODMatrix_t_colP_t.rm_self) = NA
        ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_DistanceMatrix = ODMatrix_rowP.ODMatrix_t_colP_t.rm_self; ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_DistanceMatrix[DistanceMatrix >= Max.Distance ] = NA
        
        Code4MergeFrom = Cluster.tbl %>% filter(OD.diag_rowSums < Min.SC) %>% arrange(OD.diag_rowSums) %>% {.$Code.Cluster}
        if(length(Code4MergeFrom) == 0) {
            # warning("length(Code4MergeFrom) == 0)")
            # warning("No more Code4MergeFrom")
            break
        }

        index4MergeInto = ODMatrix_rowP.ODMatrix_t_colP_t.rm_self.rm_DistanceMatrix[Code4MergeFrom[1], ] %>% which.max
        if(length(index4MergeInto) == 0) {
            # warning("length(index4MergeInto) == 0)")
            warning( paste0("Remaining Code4MergeFrom, but cannot find where to merge: ", Code4MergeFrom %>% paste(collapse = ", ")) )
            print( paste0("Remaining Code4MergeFrom, but cannot find where to merge: ", Code4MergeFrom %>% paste(collapse = ", ")) )
            break # 190513
        }
        Code4MergeInto = PopulationDF$Code[index4MergeInto]
        
        if(print.iteration == T) print(paste0("Code4MergeFrom: ", Code4MergeFrom[1], ", Code4MergeInto: ", Code4MergeInto))

        # browser() # debug190507v14
        CodeDF.new = Results.iteration.list[[length(Results.iteration.list)]]$CodeDF.new
        CodeDF.new$Code.new = CodeDF.new$Code.new %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
        
        PopulationDF.new = Results.iteration.list[[length(Results.iteration.list)]]$PopulationDF.new %>% 
            mutate(Code = Code %>% gsub(Code4MergeFrom[1], Code4MergeInto, .))
        PopulationDF.new = PopulationDF.new %>% group_by(Code) %>% summarise(Pop = sum(Pop, na.rm = T))
        
        DistanceMatrix.new = Results.iteration.list[[length(Results.iteration.list)]]$DistanceMatrix.new %>% 
            as.data.frame %>% rownames_to_column %>% gather("key", "value", -rowname) %>% 
            mutate(
                rowname = rowname %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
                , key = key %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
            ) %>% 
            group_by(rowname, key) %>% summarise(value = max(value, na.rm = T)) %>% 
            spread("key", "value") %>% as.data.frame %>% column_to_rownames %>% as.matrix
        
        ODMatrix.new = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.new %>% 
            as.data.frame %>% rownames_to_column %>% gather("key", "value", -rowname) %>% 
            mutate(
                rowname = rowname %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
                , key = key %>% gsub(Code4MergeFrom[1], Code4MergeInto, .)
            ) %>% 
            group_by(rowname, key) %>% summarise(value = sum(value, na.rm = T)) %>% 
            spread("key", "value") %>% as.data.frame %>% column_to_rownames %>% as.matrix
        
        ODMatrix.marginDF.new = Results.iteration.list[[length(Results.iteration.list)]]$ODMatrix.marginDF.new %>% 
            mutate(Code = Code %>% gsub(Code4MergeFrom[1], Code4MergeInto, .))
        ODMatrix.marginDF.new = ODMatrix.marginDF.new %>% group_by(Code) %>% summarise(rowSums = sum(rowSums, na.rm = T), colSums = sum(colSums, na.rm = T))
        
        
        iteration.out = list(
            CodeDF.new = CodeDF.new
            , PopulationDF.new = PopulationDF.new
            , DistanceMatrix.new = DistanceMatrix.new
            , ODMatrix.new = ODMatrix.new
            , ODMatrix.marginDF.new = ODMatrix.marginDF.new
            , Cluster.tbl = 
                PopulationDF.new %>% 
                rename(
                    Code.Cluster = Code
                    , Pop.Cluster = Pop
                ) %>% 
                mutate(
                    OD.diag_rowSums = ODMatrix.new %>% {diag(.)/rowSums(., na.rm = T)}
                    , OD.diag_colSums = ODMatrix.new %>% {diag(.)/colSums(., na.rm = T)}
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
                            .$data %>% map(t) %>% map(as.tibble) %>% bind_rows
                        ) %>%
                        select(-data) %>%
                        rename(Code.Cluster = Code.new) %>%
                        as.tibble
                    , by = "Code.Cluster"
                ) %>%
                as.tibble
        )
        attr(iteration.out, "iteration_info") = list(
            type_of_iteration = "iteration for Min.Pop"
            , Code4MergeFrom.remaining = Code4MergeFrom
            , Code4MergeFrom.current = Code4MergeFrom[1]
            , Code4MergeInto.current = Code4MergeInto
            , time_passed.cumulative = Sys.time() - t0
        ) # list inside attr() is not shown with str(max.level = 1)
        Results.iteration.list[[length(Results.iteration.list) + 1]] = iteration.out
                
        # print(Sys.time() - t0))
        
    }
    
    out = Results.iteration.list
}

