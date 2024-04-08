# https://github.com/mkim0710/tidystat/edit/master/Rdev/10_import_clean_datatype/16_categorical_factor/data.add_BP_HTN_140_90.dev.r

data.add_BP_HTN_140_90 <- function(dataset, varname4SBP = "BP_HIGH", varname4DBP = "BP_LWST") {
    dataset %>%
      mutate(
        BP_HTN_140_90 = if_else((get(varname4SBP) >= 140) | (get(varname4DBP) >= 90), TRUE, FALSE)
      )
}


data.add_BP_KSH2018 <- function(dataset, varname4SBP = "BP_HIGH", varname4DBP = "BP_LWST") {
  
  dataset <- dataset %>%
    mutate(
      SBP = get(varname4SBP),
      DBP = get(varname4DBP),
      BP_KSH2018 = case_when(
        SBP < 120 & DBP < 80                                       ~ "(1) Optimal",
        SBP >= 120 & SBP < 130 & DBP < 85                          ~ "(2) Normal",
        (SBP >= 130 & SBP < 140) | (DBP >= 85 & DBP < 90)          ~ "(3) High Normal",
        (SBP >= 140 & SBP < 160) | (DBP >= 90 & DBP < 100)         ~ "(4) Hypertension Stage 1",
        (SBP >= 160 & SBP < 180) | (DBP >= 100 & DBP < 110)        ~ "(5) Hypertension Stage 2",
        SBP >= 180 | DBP >= 110                                    ~ "(6) Hypertension Stage 3",
        TRUE                                                       ~ "(99) Not elsewhere classified"
      ) %>% as.factor()
    )
  
  return(dataset)
}

data.add_BP_ESCESH2018 <- function(dataset, varname4SBP = "BP_HIGH", varname4DBP = "BP_LWST") {
  
  dataset <- dataset %>%
    mutate(
      SBP = get(varname4SBP),
      DBP = get(varname4DBP),
      BP_ESCESH2018 = case_when(
        SBP < 120 & DBP < 80                   ~ "(1) Optimal BP",
        SBP >= 120 & SBP < 130 & DBP < 85      ~ "(2) Normal BP",
        SBP < 130 & DBP >= 80 & DBP < 85       ~ "(2) Normal BP",
        SBP >= 130 & SBP < 140 & DBP < 90      ~ "(3) High Normal BP",
        SBP < 140 & DBP >= 85 & DBP < 90       ~ "(3) High Normal BP",
        SBP >= 140 & SBP < 160 & DBP < 100     ~ "(4) HTN Grade 1",
        SBP < 160 & DBP >= 90 & DBP < 100      ~ "(4) HTN Grade 1",
        SBP >= 160 & SBP < 180 & DBP < 110     ~ "(5) HTN Grade 2",
        SBP < 180 & DBP >= 100 & DBP < 110     ~ "(5) HTN Grade 2",
        SBP >= 180                            ~ "(6) HTN Grade 3",
        DBP >= 110                            ~ "(6) HTN Grade 3",
        TRUE                                  ~ "(99) Not elsewhere classified"
      ) %>% as.factor()
    )
  
  return(dataset)
}

data.add_BP_ACC2017 <- function(dataset, varname4SBP = "BP_HIGH", varname4DBP = "BP_LWST") {
  
  dataset <- dataset %>%
    mutate(
      SBP = get(varname4SBP),
      DBP = get(varname4DBP),
      BP_ACC2017 = case_when(
        SBP < 120 & DBP < 80                                      ~ "(1) Normal",
        SBP >= 120 & SBP < 130 & DBP < 80                         ~ "(2) Elevated",
        (SBP >= 130 & SBP < 140) | (DBP >= 80 & DBP < 90)         ~ "(3) Hypertension Stage 1",
        SBP >= 140 | DBP >= 90                                    ~ "(4) Hypertension Stage 2",
        TRUE                                                     ~ "(99) Not elsewhere classified"
      ) %>% as.factor()
    )
  
  return(dataset)
}

gj_jk.Date.DTH.recode = 
    gj_jk.Date.DTH.recode %>% 
    data.add_BP_HTN_140_90 %>% 
    data.add_BP_KSH2018 %>% 
    data.add_BP_ESCESH2018 %>% 
    data.add_BP_ACC2017
gj_jk.Date.DTH.recode %>% select(matches("BP_")) %>% summary
# > gj_jk.Date.DTH.recode %>% select(matches("BP_")) %>% summary
#     BP_HIGH         BP_LWST       BP_HTN_140_90                           BP_KSH2018                         BP_ESCESH2018                          BP_ACC2017   
#  Min.   : 78.0   Min.   : 34.00   Mode :logical   (1) Optimal                  :9073   (1) Optimal BP               :9073   (1) Normal                   : 9073  
#  1st Qu.:115.0   1st Qu.: 70.00   FALSE:24531     (2) Normal                   :6980   (2) Normal BP                :7808   (2) Elevated                 : 3447  
#  Median :125.0   Median : 80.00   TRUE :7391      (3) High Normal              :9319   (3) High Normal BP           :7650   (3) Hypertension Stage 1     :14785  
#  Mean   :125.7   Mean   : 78.18   NA's :9         (4) Hypertension Stage 1     :4960   (4) HTN Grade 1              :5441   (4) Hypertension Stage 2     : 4617  
#  3rd Qu.:135.0   3rd Qu.: 85.00                   (5) Hypertension Stage 2     : 677   (5) HTN Grade 2              :1563   (99) Not elsewhere classified:    9  
#  Max.   :250.0   Max.   :170.00                   (6) Hypertension Stage 3     :  85   (6) HTN Grade 3              : 387                                        
#  NA's   :9       NA's   :9                        (99) Not elsewhere classified: 837   (99) Not elsewhere classified:   9                                  
