# data.NA.recode.dev.r

data.NA.recode = function(data, numeric_NA_recode_into_0 = T, character_NA_recode_into = "", reorder_factor = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/data.strata_list.Match.dev.r")
    library(tidyverse)
    out = data %>% map_df(function(x){
        if (is.numeric(x)) {
            if (numeric_NA_recode_into_0 == T) {
                x[is.na(x)] = 0
            }
        }
        if (is.character(x)) {
            x[is.na(x)] = character_NA_recode_into
        }
        if (is.factor(x)) {
            if (reorder_factor == T) {
                x = x |> as.character()
                x[is.na(x)] = character_NA_recode_into
                x = x |> as.factor()  # In this way, "" will be the first level
            } else {
                x = x %>% factor(exclude = NULL)
                levels(x)[is.na(levels(x))] = character_NA_recode_into  # In this way, "character_NA_recode_into" will be the first level
            }
        }
        x
    })
    out
}

#@ end ----
