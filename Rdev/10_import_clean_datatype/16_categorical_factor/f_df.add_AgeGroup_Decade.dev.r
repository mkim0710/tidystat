

library(dplyr)
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_AgeGroup_Decade.dev.r
#%% f_df.add_AgeGroup_Decade() ====  
f_df.add_AgeGroup_Decade <- function(dataset, varname4Age = "AGE") {
  dataset %>%
    mutate(
      AgeGroup = case_when(
        get(varname4Age) < 5   ~ "0-4",
        get(varname4Age) >= 5  & get(varname4Age) < 10  ~ "5-9",
        get(varname4Age) >= 10 & get(varname4Age) < 15  ~ "10-14",
        get(varname4Age) >= 15 & get(varname4Age) < 20  ~ "15-19",
        get(varname4Age) >= 20 & get(varname4Age) < 25  ~ "20-24",
        get(varname4Age) >= 25 & get(varname4Age) < 30  ~ "25-29",
        get(varname4Age) >= 30 & get(varname4Age) < 35  ~ "30-34",
        get(varname4Age) >= 35 & get(varname4Age) < 40  ~ "35-39",
        get(varname4Age) >= 40 & get(varname4Age) < 45  ~ "40-44",
        get(varname4Age) >= 45 & get(varname4Age) < 50  ~ "45-49",
        get(varname4Age) >= 50 & get(varname4Age) < 55  ~ "50-54",
        get(varname4Age) >= 55 & get(varname4Age) < 60  ~ "55-59",
        get(varname4Age) >= 60 & get(varname4Age) < 65  ~ "60-64",
        get(varname4Age) >= 65 & get(varname4Age) < 70  ~ "65-69",
        get(varname4Age) >= 70 & get(varname4Age) < 75  ~ "70-74",
        get(varname4Age) >= 75 & get(varname4Age) < 80  ~ "75-79",
        get(varname4Age) >= 80                         ~ "80+",
        TRUE                                            ~ NA_character_
      ) %>% factor(ordered = TRUE, levels = c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", "80+")),
      
      AgeDecade = case_when(
        get(varname4Age) < 10  ~ "0-9",
        get(varname4Age) >= 10 & get(varname4Age) < 20  ~ "10-19",
        get(varname4Age) >= 20 & get(varname4Age) < 30  ~ "20-29",
        get(varname4Age) >= 30 & get(varname4Age) < 40  ~ "30-39",
        get(varname4Age) >= 40 & get(varname4Age) < 50  ~ "40-49",
        get(varname4Age) >= 50 & get(varname4Age) < 60  ~ "50-59",
        get(varname4Age) >= 60 & get(varname4Age) < 70  ~ "60-69",
        get(varname4Age) >= 70 & get(varname4Age) < 80  ~ "70-79",
        get(varname4Age) >= 80                         ~ "80+",
        TRUE                                            ~ NA_character_
      ) %>% factor(ordered = TRUE, levels = c("0-9", "10-19", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80+"))
    )
}

# Example usage:
# some_data <- data.frame(AGE = c(3, 8, 13, 28, 33, 48, 53, 68, 73, 88))
# some_data %>% f_df.add_AgeGroup_Decade()
