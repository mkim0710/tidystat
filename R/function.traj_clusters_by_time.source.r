# function.traj_clusters_by_time.source.r

Sys.setenv(LANG = "en")
library(tidyverse)
library(RODBC)
channel = odbcDriverConnect("Driver= {SQL Server}; server=VITS-ARCHSQLP04; database=DM_DEID")
dataset = sqlQuery(channel, paste("
SELECT *
FROM [DM_DEID].[jyp2001].[PAT_PHQ_IDEN]
;")) %>% mutate(ID = as.numeric(as.factor(PAT_ID)), value = Value, time = CONTACT_DATE)
dataset %>% str


function.t0_value_ge20.dup_max.lag.n_d0 = function(dataset, varname4ID = "ID", varname4value = "value", varname4time = "time") {
    dataset$ID = dataset[[varname4ID]] %>% as.factor
    library(lubridate)
    dataset$time = dataset[[varname4time]] %>% floor_date("day")
    dataset.t0_value_ge20 = dataset %>% filter(!!rlang::sym(varname4value) >= 20) %>% group_by(ID) %>% summarise(t0 = min(time)) %>% left_join(dataset) %>% mutate(days_from_t0 = as.Date(time) - as.Date(t0)) %>% 
        filter(days_from_t0 >= 0)
    
    dataset.t0_value_ge20.dup_max = dataset.t0_value_ge20 %>% 
        group_by(ID, time, days_from_t0) %>% 
        summarise(value = max(!!rlang::sym(varname4value)))
    dataset.t0_value_ge20.dup_max = dataset.t0_value_ge20.dup_max %>% mutate(
        PHQ_category = ""
        , PHQ_category = PHQ_category %>% ifelse(value %in% 0:4, "1_Minimal", .)
        , PHQ_category = PHQ_category %>% ifelse(value %in% 5:9, "2_Mild", .)
        , PHQ_category = PHQ_category %>% ifelse(value %in% 10:14, "3_Moderate", .)
        , PHQ_category = PHQ_category %>% ifelse(value %in% 15:19, "4_ModeratelySevere", .)
        , PHQ_category = PHQ_category %>% ifelse(value %in% 20:27, "5_Severe", .)
    )

    dataset.t0_value_ge20.dup_max = dataset.t0_value_ge20.dup_max %>% mutate(
        PHQ_category.45 = PHQ_category %in% c("4_ModeratelySevere", "5_Severe")
    )

    dataset.t0_value_ge20.dup_max =
        dataset.t0_value_ge20.dup_max %>% arrange(ID, time) %>% group_by(ID) %>% mutate(one = 1, sequence = cumsum(one)) %>% select(-one)

    dataset.t0_value_ge20.dup_max.lag =
        dataset.t0_value_ge20.dup_max %>% arrange(ID, time) %>%
        group_by(ID) %>% mutate(
            PHQ_category.increased = as.numeric(PHQ_category) - lag(as.numeric(PHQ_category))
            , PHQ_category.45.increased = PHQ_category.45 - lag(PHQ_category.45)
        )

    out = dataset.t0_value_ge20.dup_max.lag %>%
        left_join(
            dataset.t0_value_ge20.dup_max.lag %>% filter(PHQ_category.45.increased %in% c(-1, 1)) %>%
                group_by(ID) %>% summarise(n_d0 = n())
        )
    out
}

dataset = dataset %>% function.t0_value_ge20.dup_max.lag.n_d0
dataset
# > dataset
# # A tibble: 969 x 10
# # Groups:   ID [?]
#    ID    time                days_from_t0 value PHQ_category       PHQ_category.45 sequence PHQ_category.increased PHQ_category.45.increased  n_d0
#    <fct> <dttm>              <time>       <dbl> <chr>              <lgl>              <dbl>                  <dbl>                     <int> <int>
#  1 4     2016-02-23 00:00:00 0               20 5_Severe           TRUE                   1                     NA                        NA    NA
#  2 16    2017-01-26 00:00:00 0               23 5_Severe           TRUE                   1                     NA                        NA    NA
#  3 16    2017-02-06 00:00:00 11              22 5_Severe           TRUE                   2                     NA                         0    NA
#  4 16    2017-02-13 00:00:00 18              24 5_Severe           TRUE                   3                     NA                         0    NA
#  5 16    2017-02-27 00:00:00 32              24 5_Severe           TRUE                   4                     NA                         0    NA
#  6 27    2016-12-22 00:00:00 0               24 5_Severe           TRUE                   1                     NA                        NA     1
#  7 27    2017-01-05 00:00:00 14              24 5_Severe           TRUE                   2                     NA                         0     1
#  8 27    2017-02-18 00:00:00 58              24 5_Severe           TRUE                   3                     NA                         0     1
#  9 27    2017-02-28 00:00:00 68              15 4_ModeratelySevere TRUE                   4                     NA                         0     1
# 10 27    2017-03-17 00:00:00 85               9 2_Mild             FALSE                  5                     NA                        -1     1
# # ... with 959 more rows


function.dataset.transform = function(dataset, varname4value = "value", varname4time = "days_from_t0", nsequence = 5) {
    library(tidyverse)
    out = list()
    dataset = dataset %>% filter(sequence %in% 1:nsequence)
    out$data =
        dataset %>% 
        select(ID, sequence, !!rlang::sym(varname4value)) %>%
        spread(key = sequence, value = !!rlang::sym(varname4value)) %>% 
        na.omit %>% as.data.frame
    out$time =
        dataset %>% 
        select(ID, sequence, !!rlang::sym(varname4time)) %>%
        spread(key = sequence, value = !!rlang::sym(varname4time)) %>% 
        na.omit %>% as.data.frame
    out$sequence =
        dataset %>% 
        select(ID, sequence) %>% 
        spread(key = sequence, value = sequence) %>% 
        na.omit %>% as.data.frame
    out
}

dataset.transform = function.dataset.transform(dataset)
dataset.transform %>% str
# > dataset.transform %>% str
# List of 3
#  $ data    :'data.frame':	65 obs. of  6 variables:
#   ..$ ID: Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ 1 : num [1:65] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ 2 : num [1:65] 24 26 25 18 10 25 23 3 24 20 ...
#   ..$ 3 : num [1:65] 24 23 26 19 9 15 18 3 24 20 ...
#   ..$ 4 : num [1:65] 15 27 27 17 5 16 24 3 1 20 ...
#   ..$ 5 : num [1:65] 9 24 26 13 21 18 24 3 1 19 ...
#   ..- attr(*, "na.action")= 'omit' Named int [1:184] 1 2 4 5 8 9 10 11 12 13 ...
#   .. ..- attr(*, "names")= chr [1:184] "1" "2" "4" "5" ...
#  $ time    :'data.frame':	65 obs. of  6 variables:
#   ..$ ID: Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ 1 : 'difftime' num [1:65] 0 0 0 0 ...
#   .. ..- attr(*, "units")= chr "days"
#   ..$ 2 : 'difftime' num [1:65] 14 10 22 8 ...
#   .. ..- attr(*, "units")= chr "days"
#   ..$ 3 : 'difftime' num [1:65] 58 17 53 13 ...
#   .. ..- attr(*, "units")= chr "days"
#   ..$ 4 : 'difftime' num [1:65] 68 25 74 14 ...
#   .. ..- attr(*, "units")= chr "days"
#   ..$ 5 : 'difftime' num [1:65] 85 31 99 31 ...
#   .. ..- attr(*, "units")= chr "days"
#   ..- attr(*, "na.action")= 'omit' Named int [1:184] 1 2 4 5 8 9 10 11 12 13 ...
#   .. ..- attr(*, "names")= chr [1:184] "1" "2" "4" "5" ...
#  $ sequence:'data.frame':	65 obs. of  6 variables:
#   ..$ ID: Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ 1 : num [1:65] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ 2 : num [1:65] 2 2 2 2 2 2 2 2 2 2 ...
#   ..$ 3 : num [1:65] 3 3 3 3 3 3 3 3 3 3 ...
#   ..$ 4 : num [1:65] 4 4 4 4 4 4 4 4 4 4 ...
#   ..$ 5 : num [1:65] 5 5 5 5 5 5 5 5 5 5 ...
#   ..- attr(*, "na.action")= 'omit' Named int [1:184] 1 2 4 5 8 9 10 11 12 13 ...
#   .. ..- attr(*, "names")= chr [1:184] "1" "2" "4" "5" ...



function.traj_clusters_by_sequence = function(input, seed = 1) {
    library(tidyverse)
    library(traj)
    measures = input %>% {step1measures(.$data, .$sequence, ID = T)}
    factors = measures %>% step2factors
    ncluster = factors %>% step3clusters %>% {.$clust.distr} %>% length

    out = list()
    set.seed(seed)
    for (i in 1:ncluster) {
        out[[i]] =
            factors %>% step3clusters(nclusters = i) %>% (
                function(ls) {
                    ls$measurments %>% as.tibble %>% select(ID) %>% mutate(IDvector = as.numeric(ID)) %>% left_join(ls$data %>% as.tibble, by = "IDvector") %>% select(-IDvector) %>% 
                        gather(-ID, key = "sequence", value = "value") %>% mutate(sequence = as.numeric(as.factor(sequence))) %>%
                        left_join(ls$clusters %>% map_df(unlist), by = "ID")
                })
    }
    dir.create("Rplot", showWarnings = FALSE)
    for (i in 1:ncluster) {
        out[[i]] %>% ggplot(aes(x = sequence, y = value, group = ID, color = as.factor(as.numeric(as.factor(ID))%%10)))+geom_line()+facet_wrap(~cluster)+theme(legend.position="none")
        ggsave(paste0("Rplot/traj_clusters_by_sequence", ".", i, ".png"), width = 7, height = 7)
    }
    out
}
traj_clusters_by_sequence = function.traj_clusters_by_sequence(dataset.transform)
traj_clusters_by_sequence %>% str
# > traj_clusters_by_sequence = function.traj_clusters_by_sequence(dataset.transform)
# [1] "Correlation of m5 and m6 : 1"
# [1] "Correlation of m12 and m13 : 1"
# [1] "Correlation of m17 and m18 : 1"
# [1] "m6 is removed because it is perfectly correlated with m5"   "m13 is removed because it is perfectly correlated with m12"
# [1] "Computing reduced correlation e-values..."
# > traj_clusters_by_sequence %>% str
# List of 15
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 1 2 2 1 2 2 2 1 1 2 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 2 3 3 2 1 3 3 2 2 3 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 1 2 2 1 3 2 2 4 4 2 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 2 5 5 2 1 5 5 3 3 5 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 3 5 5 3 4 6 5 2 2 5 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 7 5 1 7 2 4 5 3 3 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 1 8 7 4 3 5 8 2 2 7 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 4 6 6 3 5 9 2 1 1 6 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 5 9 9 6 2 10 1 8 8 9 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 6 4 8 1 10 11 4 5 5 8 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 11 12 5 2 10 8 12 7 7 5 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 11 12 6 3 8 4 12 1 1 7 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 7 12 11 6 13 8 12 2 2 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  4 variables:
#   ..$ ID      : Factor w/ 1583 levels "1","2","3","4",..: 27 41 43 99 137 140 161 173 226 277 ...
#   ..$ sequence: num [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#   ..$ value   : num [1:325] 24 26 24 24 21 23 23 24 24 20 ...
#   ..$ cluster : int [1:325] 9 13 12 4 7 1 13 14 14 15 ...







function.traj_clusters_by_time = function(input, seed = 1) {
    library(tidyverse)
    library(traj)
    measures = input %>% {step1measures(.$data, .$time, ID = T)}
    factors = measures %>% step2factors
    ncluster = factors %>% step3clusters %>% {.$clust.distr} %>% length
    
    out = list()
    set.seed(seed)
    for (i in 1:ncluster) {
        out[[i]] =
            factors %>% step3clusters(nclusters = i) %>% (
                function(ls) {
                    ls$measurments %>% as.tibble %>% select(ID) %>% mutate(IDvector = as.numeric(ID)) %>% left_join(
                        ls$data %>% as.tibble %>% gather(-IDvector, key = "sequence", value = "value") %>% 
                            left_join(ls$time %>% as.tibble %>% gather(-IDvector, key = "sequence", value = "time_from_t0"), by = c("IDvector", "sequence"))
                        , by = "IDvector"
                    ) %>% select(-IDvector) %>%
                        mutate(sequence = as.numeric(as.factor(sequence))) %>%
                        left_join(ls$clusters %>% map_df(unlist), by = "ID")
                })
    }
    dir.create("Rplot", showWarnings = FALSE)
    for (i in 1:ncluster) {
        xlim.max = out[[i]]$time_from_t0 %>% quantile(0.9)
        out[[i]] %>%
            ggplot(aes(x = time_from_t0, y = value, group = ID, color = as.factor(as.numeric(as.factor(ID))%%10)))+geom_line()+facet_wrap(~cluster)+theme(legend.position="none")+
            xlim(0, xlim.max)
        ggsave(paste0("Rplot/traj_clusters_by_time", ".", i, ".png"), width = 7, height = 7)
    }
    out
}
traj_clusters_by_time = function.traj_clusters_by_time(dataset.transform)
traj_clusters_by_time %>% str
# > traj_clusters_by_time = function.traj_clusters_by_time(dataset.transform)
# [1] "No correlations found. That is good."
# [1] "Computing reduced correlation e-values..."
# Warning messages:
# 1: Removed 33 rows containing missing values (geom_path). 
# 2: Removed 33 rows containing missing values (geom_path). 
# 3: Removed 33 rows containing missing values (geom_path). 
# 4: Removed 33 rows containing missing values (geom_path). 
# 5: Removed 33 rows containing missing values (geom_path). 
# 6: Removed 33 rows containing missing values (geom_path). 
# 7: Removed 33 rows containing missing values (geom_path). 
# 8: Removed 33 rows containing missing values (geom_path). 
# 9: Removed 33 rows containing missing values (geom_path). 
# > traj_clusters_by_time %>% str
# List of 9
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 1 1 1 1 1 1 1 1 1 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 2 2 2 2 2 1 1 1 1 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 4 4 4 4 4 3 3 3 3 3 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 3 3 3 3 3 5 5 5 5 5 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 5 5 5 5 5 1 1 1 1 1 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 5 5 5 5 5 7 7 7 7 7 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 3 3 3 3 3 5 5 5 5 5 ...
#  $ :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	325 obs. of  5 variables:
#   ..$ ID          : Factor w/ 1583 levels "1","2","3","4",..: 27 27 27 27 27 41 41 41 41 41 ...
#   ..$ sequence    : num [1:325] 1 2 3 4 5 1 2 3 4 5 ...
#   ..$ value       : num [1:325] 24 24 24 15 9 26 26 23 27 24 ...
#   ..$ time_from_t0: num [1:325] 0 14 58 68 85 0 10 17 25 31 ...
#   ..$ cluster     : int [1:325] 4 4 4 4 4 9 9 9 9 9 ...




#@ end ----
