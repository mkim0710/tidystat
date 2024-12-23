#%% f_df.add_BMI.5bins() ====  
# library(dplyr)
# library(rlang)


## :: f_df.add_BMI_calculated =  ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_BMI.5bins.source.r
.tmp$objectname = "f_df.add_BMI_calculated"
.tmp$object = function(DS, varname_Height = "HEIGHT", varname_Weight = "WEIGHT", varname_BMI = "BMI") {

  # Check if BMI column exists
  if (varname_BMI %in% names(DS)) {
    warning(paste0(deparse(varname_BMI),' %in% names(DS)')); cat("  \n", sep="")
    DS <- DS %>%
      mutate(
        !!rlang::sym(paste0(varname_BMI,"_calculated")) := as.numeric(!!rlang::sym(varname_Weight)) / (as.numeric(!!rlang::sym(varname_Height))/100)^2
      )
  } else {
    DS <- DS %>%
      mutate(
        !!rlang::sym(varname_BMI) := as.numeric(!!rlang::sym(varname_Weight)) / (as.numeric(!!rlang::sym(varname_Height))/100)^2
      )
  }
    
  return(DS)
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)



## :: f_df.add_BMI.5bins =  ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_BMI.5bins.source.r
.tmp$objectname = "f_df.add_BMI.5bins"
.tmp$object = function(DS, varname_BMI = "BMI") {

  # Compute additional BMI-related columns
  DS <- DS %>%
    mutate(
      !!rlang::sym(paste0(varname_BMI,"_lt185")) := !!rlang::sym(varname_BMI) < 18.5,
      
      !!rlang::sym(paste0(varname_BMI,"_ge185lt230")) := !!rlang::sym(varname_BMI) >= 18.5 & !!rlang::sym(varname_BMI) < 23,
      !!rlang::sym(paste0(varname_BMI,"_ge230lt250")) := !!rlang::sym(varname_BMI) >= 23 & !!rlang::sym(varname_BMI) < 25,
      !!rlang::sym(paste0(varname_BMI,"_ge185lt250")) := !!rlang::sym(varname_BMI) >= 18.5 & !!rlang::sym(varname_BMI) < 25,
      !!rlang::sym(paste0(varname_BMI,"_ge250lt300")) := !!rlang::sym(varname_BMI) >= 25 & !!rlang::sym(varname_BMI) < 30,
      !!rlang::sym(paste0(varname_BMI,"_ge230")) := !!rlang::sym(varname_BMI) >= 23,
      !!rlang::sym(paste0(varname_BMI,"_ge250")) := !!rlang::sym(varname_BMI) >= 25,
      !!rlang::sym(paste0(varname_BMI,"_ge300")) := !!rlang::sym(varname_BMI) >= 30,
      !!rlang::sym(paste0(varname_BMI,"_ge350")) := !!rlang::sym(varname_BMI) >= 35,
      !!rlang::sym(paste0(varname_BMI,"_ge400")) := !!rlang::sym(varname_BMI) >= 40,
      !!rlang::sym(paste0(varname_BMI,".4bins")) := cut(!!rlang::sym(varname_BMI), breaks = c(0, 18.5, 25, 30, Inf), include.lowest = T, right = F),
      !!rlang::sym(paste0(varname_BMI,".5bins")) := cut(!!rlang::sym(varname_BMI), breaks = c(0, 18.5, 23, 25, 30, Inf), include.lowest = T, right = F)
    )
  
  return(DS)
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)


# gj_jk.Date.DTH.recode = 
#     gj_jk.Date.DTH.recode %>% 
#     data.add_BMI_calculated(varname_Height = "HEIGHT", varname_Weight = "WEIGHT") %>% 
#     f_df.add_BMI.5bins
# gj_jk.Date.DTH.recode %>% select(matches("BMI")) |> summary()
# all.equal(gj_jk.Date.DTH.recode$BMI_calculated, gj_jk.Date.DTH.recode$BMI)



# # @ function.df_add_BMI.4bins ======  
# function.df_add_BMI.4bins = function(df) {
#     df %>% mutate(
#         BMI = as.numeric(WEIGHT) / (as.numeric(HEIGHT)/100)^2
#         , BMI_lt185 = BMI < 18.5
#         , BMI_ge185lt230 = BMI >= 18.5 & BMI < 23
#         , BMI_ge230lt250 = BMI >= 23 & BMI < 25
#         , BMI_ge185lt250 = BMI >= 18.5 & BMI < 25
#         , BMI_ge250lt300 = BMI >= 25 & BMI < 30
#         , BMI_ge300 = BMI >= 30
#         , BMI_ge350 = BMI >= 35
#         , BMI_ge400 = BMI >= 40
#         , BMI.4bins = BMI %>% cut(breaks = c(0, 18.5, 25, 30, Inf), include.lowest = T, right = F)
#     )
# }
# 
# # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_BMI.4bins %>% select(matches("BMI")) |> summary() #----
# # # > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na %>% function.df_add_BMI %>% select(matches("BMI")) |> summary() #----  
# # #       BMI        BMI_lt185       BMI_ge185lt230  BMI_ge230lt250  BMI_ge185lt250  BMI_ge250lt300  BMI_ge300       BMI_ge350       BMI_ge400            BMI_4cat     
# # #  Min.   :11.96   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   [0,18.5) : 11948  
# # #  1st Qu.:21.31   FALSE:271850    FALSE:167553    FALSE:214403    FALSE:98158     FALSE:206858    FALSE:274528    FALSE:283030    FALSE:283697    [18.5,25):185640  
# # #  Median :23.38   TRUE :11948     TRUE :116245    TRUE :69395     TRUE :185640    TRUE :76940     TRUE :9270      TRUE :768       TRUE :101       [25,30)  : 76940  
# # #  Mean   :23.57                                                                                                                                   [30,Inf] :  9270  
# # #  3rd Qu.:25.54                                                                                                                                                     
# # #  Max.   :66.94   

