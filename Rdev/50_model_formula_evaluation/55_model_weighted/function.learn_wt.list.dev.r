# function.learn_wt.list.dev.r


function.learn_wt.list = function(
    data = data_frame(PERSON_ID = as.interger(PERSON_ID), WT = as.numeric(WT), DM = as.factor(DM), SDH = as.factor(SDH))
    , max_iteration = 10^3
    , early_stop_when_cost_diff_lt = .1^5
    , Dist_DM_target = Dist_DM_target
    , Dist_SDH_target = Dist_SDH_target
){

    wt.normalized.list = list()
    wt.normalized.list[[1]] = data$WT / sum(data$WT)

    Dist_DM.list = list()
    Dist_DM.list[[1]] = (
        data %>% group_by(DM) %>% summarise(WT.sum_by_DM = sum(WT)) %>% as.data.frame %>% column_to_rownames("DM") %>% t %>% {.[1,]}
    ) / sum(data$WT)

    Dist_SDH.list = list()
    Dist_SDH.list[[1]] = (
        data %>% group_by(SDH) %>% summarise(WT.sum_by_SDH = sum(WT)) %>% as.data.frame %>% column_to_rownames("SDH") %>% t %>% {.[1,]}
    ) / sum(data$WT)

    # sub-function for calculating cost ----
    .function.compute_cost = function(.Dist_SDH_current, .Dist_DM_current, .Dist_DM_target, .Dist_SDH_target){
        J = sum((.Dist_SDH_current - .Dist_SDH_target)^2)/length(.Dist_SDH_target) + sum((.Dist_DM_current - .Dist_DM_target)^2)/length(.Dist_DM_target)
        return(J)
    }
    
    cost = vector(mode = "numeric", length = max_iteration)
    cost[1] = .function.compute_cost(.Dist_SDH_current = Dist_SDH.list[[1]], .Dist_DM_current = Dist_DM.list[[1]], .Dist_DM_target = Dist_DM_target, .Dist_SDH_target = Dist_SDH_target)
    
    for(i in 2:max_iteration){
 
        wt.normalized.list[[i]] = wt.normalized.list[[i-1]]
        
        # update weights for target distribution of DM & SDH ----
        for (k in 1:length(levels(data$DM))) {
            wt.normalized.list[[i]] [data$DM==levels(data$DM)[k]] = wt.normalized.list[[i]] [data$DM==levels(data$DM)[k]] * Dist_DM_target[k] / Dist_DM.list[[i-1]][k]
        }
        for (k in 1:length(levels(data$SDH))) {
            wt.normalized.list[[i]] [data$SDH==levels(data$SDH)[k]] = wt.normalized.list[[i]] [data$SDH==levels(data$SDH)[k]] * Dist_DM_target[k] / Dist_DM.list[[i-1]][k]
        }
        
        # for every iteration, updated weights will be stored ----
        wt.normalized.list[[i]] = wt.normalized.list[[i]] / sum(wt.normalized.list[[i]])
        
        # for every iteration, updated distribution of DM given the updated weights will be stored ----
        Dist_DM.list[[i]]= (
            data %>% mutate(WT = wt.normalized.list[[i]]) %>% 
                group_by(DM) %>% summarise(WT.sum_by_DM = sum(WT)) %>% as.data.frame %>% column_to_rownames("DM") %>% t %>% {.[1,]}
        )
        
        # for every iteration, updated distribution of SDH given the updated weights will be stored ----
        Dist_SDH.list[[i]] = (
            data %>% mutate(WT = wt.normalized.list[[i]]) %>% 
                group_by(SDH) %>% summarise(WT.sum_by_SDH = sum(WT)) %>% as.data.frame %>% column_to_rownames("SDH") %>% t %>% {.[1,]}
        )
        
        # for every iteration, updated cost given the updated weights will be stored ----
        cost[i] = .function.compute_cost(.Dist_SDH_current = Dist_SDH.list[[i]], .Dist_DM_current = Dist_DM.list[[i]], .Dist_DM_target = Dist_DM_target, .Dist_SDH_target = Dist_SDH_target)
        
        # early stopping critera ----
        if (abs(cost[i] - cost[i-1]) < early_stop_when_cost_diff_lt) break
    }
    
    return = list(
        wt.normalized.list = wt.normalized.list
        , Dist_DM.df = (Dist_DM.list %>% map(as.list) %>% bind_rows)
        , Dist_SDH.df = (Dist_SDH.list %>% map(as.list) %>% bind_rows)
        , cost = cost
    )
    attr(return, "input") = list(
        data = data
        , max_iteration = max_iteration
        , early_stop_when_cost_diff_lt = early_stop_when_cost_diff_lt
        , Dist_DM_target = Dist_DM_target
        , Dist_SDH_target = Dist_SDH_target
    )
    return
}



#@ end ----

