# function.learn_wt.list.source.r


function.learn_wt.list = function(
    data = as.tibble(public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(CAPI_WT, RACE, isCollege_MS_PhD))
    , max_iteration = 10^3
    , early_stop_when_cost_diff_lt = .1^5
    , Dist_RACE_target = Dist_RACE_target
    , Dist_College_target = Dist_College_target
){

    wt.normalized.list = list()
    wt.normalized.list[[1]] = data$CAPI_WT / sum(data$CAPI_WT)

    Dist_RACE.list = list()
    Dist_RACE.list[[1]] = (
        data %>% group_by(RACE) %>% summarise(CAPI_WT.sum_by_RACE = sum(CAPI_WT)) %>% as.data.frame %>% column_to_rownames("RACE") %>% t %>% {.[1,]}
    ) / sum(data$CAPI_WT)

    Dist_College.list = list()
    Dist_College.list[[1]] = (
        data %>% group_by(isCollege_MS_PhD) %>% summarise(CAPI_WT.sum_by_COLLEGE = sum(CAPI_WT)) %>% as.data.frame %>% column_to_rownames("isCollege_MS_PhD") %>% t %>% {.[1,]}
    ) / sum(data$CAPI_WT)

    cost = vector(mode = "numeric", length = max_iteration)
    cost[1] = .function.compute_cost(.Dist_College_current = Dist_College.list[[1]], .Dist_RACE_current = Dist_RACE.list[[1]], .Dist_RACE_target = Dist_RACE_target, .Dist_College_target = Dist_College_target)
    
    .function.compute_cost = function(.Dist_College_current, .Dist_RACE_current, .Dist_RACE_target, .Dist_College_target){
        J = sum((.Dist_College_current - .Dist_College_target)^2)/length(.Dist_College_target) + sum((.Dist_RACE_current - .Dist_RACE_target)^2)/length(.Dist_RACE_target)
        return(J)
    }

    for(i in 2:max_iteration){
 
        wt.normalized.list[[i]] = wt.normalized.list[[i-1]]
        for (k in 1:length(levels(data$RACE))) {
            wt.normalized.list[[i]]
            wt.normalized.list[[i]] [data$RACE==levels(data$RACE)[k]] = wt.normalized.list[[i]] [data$RACE==levels(data$RACE)[k]] * Dist_RACE_target[k] / Dist_RACE.list[[i-1]][k]
        }
        for (k in 1:length(c(F,T))) {
            wt.normalized.list[[i]] [data$isCollege_MS_PhD==c(F,T)[k]] = wt.normalized.list[[i]] [data$isCollege_MS_PhD==c(F,T)[k]] * Dist_College_target[k] / Dist_College.list[[i-1]][k]
        }
        wt.normalized.list[[i]] = wt.normalized.list[[i]] / sum(wt.normalized.list[[i]])
        
        Dist_RACE.list[[i]]= (
            data %>% mutate(CAPI_WT = wt.normalized.list[[i]]) %>% 
                group_by(RACE) %>% summarise(CAPI_WT.sum_by_RACE = sum(CAPI_WT)) %>% as.data.frame %>% column_to_rownames("RACE") %>% t %>% {.[1,]}
        # ) / sum(wt.normalized.list[[i]])
        )
        
        Dist_College.list[[i]] = (
            data %>% mutate(CAPI_WT = wt.normalized.list[[i]]) %>% 
                group_by(isCollege_MS_PhD) %>% summarise(CAPI_WT.sum_by_COLLEGE = sum(CAPI_WT)) %>% as.data.frame %>% column_to_rownames("isCollege_MS_PhD") %>% t %>% {.[1,]}
        # ) / sum(wt.normalized.list[[i]])
        )
        
        cost[i] = .function.compute_cost(.Dist_College_current = Dist_College.list[[i]], .Dist_RACE_current = Dist_RACE.list[[i]], .Dist_RACE_target = Dist_RACE_target, .Dist_College_target = Dist_College_target)
        if (abs(cost[i] - cost[i-1]) < early_stop_when_cost_diff_lt) break
    }
    
    return = list(
        wt.normalized.list = wt.normalized.list
        , Dist_RACE.df = (Dist_RACE.list %>% map(as.list) %>% bind_rows)
        , Dist_College.df = (Dist_College.list %>% map(as.list) %>% bind_rows)
        , cost = cost
    )
    attr(return, "input") = list(
        data = data
        , max_iteration = max_iteration
        , early_stop_when_cost_diff_lt = early_stop_when_cost_diff_lt
        , Dist_RACE_target = Dist_RACE_target
        , Dist_College_target = Dist_College_target
    )
    return
}



#@ end ----

