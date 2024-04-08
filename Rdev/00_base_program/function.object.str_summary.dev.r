


    Code.Adj <- matrix(,0,dim(Cluster.pivot)[2])
    Code.Adj %>% {
        str(.)
        cat(paste0("# ", "summary(as.numeric(.))", "---- \n"))
        print(summary(as.numeric(.)))
        cat(paste0("# ", "summary(as.numeric(.)>0)", "---- \n"))
        print(summary(as.numeric(.)>0)) #----
    }
