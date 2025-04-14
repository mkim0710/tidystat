##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# @@ SOURCE)                                                                #L229
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# @@ env1\$f\$f_object                                                      #L283
# @@ env1\$f\$f_str                                                         #L283
# @@ env1\$f\$f_vec                                                         #L395
# @@ env1\$f\$f_list                                                        #L396
# @@ env1\$f\$f_list_list                                                   #L796
# @@ env1\$f\$f_matrix                                                      #L797
# @@ env1\$f\$f_array                                                       #L798
# @@ env1\$f\$f_formula                                                     #L887
# @@ env1\$f\$f_df                                                          #L966
# @@ env1\$env.internal functions                                           #L1155
# @@ source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# @@ env1\$f\$f_df                                                          #L966
# @@ env1\$f\$f_DS                                                          #L966
## :: f_df.tribble_construct =                                              #L968
## :: f_df.transpose =                                                      #L984
## :: f_df.t.tribble_construct =                                            #L998
## :: f_df.print_byVar =                                                    #L1015
## :: f_df.add_VarNameT.deltaT0 =                                           #L1030
## :: f_df.add_VarNameT.pdeltaT0 =                                          #L1045
## :: f_df.add_RegExVars.kbins =                                            #L1060
## :: f_df.add_RegExVars.quintile_factor =                                  #L1089
## :: f_df.add_RegExVars.quartile_factor =                                  #L1120
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_df.add_VarNameT.deltaT0 =  ----  
## -> included in "f_df.t.tribble_construct.source.r"
.tmp$objectname = "f_df.add_VarNameT.deltaT0"
.tmp$object = function(DS.DNR, VarName0, VarNameT, prefix = "", suffix = ".deltaT0", logical_as_numeric = FALSE) {
    if(logical_as_numeric && is.logical(DS.DNR[[VarName0]]) && is.logical(DS.DNR[[VarNameT]])) {
    } else if(is.numeric(DS.DNR[[VarName0]]) && is.numeric(DS.DNR[[VarNameT]])) {
    } else if(lubridate::is.Date(DS.DNR[[VarName0]]) && lubridate::is.Date(DS.DNR[[VarNameT]])) {
    } else {
        stop("Both ",VarName0," and ",VarNameT," must be in the same class, either numeric or Date.")
    }
    DS.DNR |> mutate( !!rlang::sym(paste0(prefix,VarNameT,suffix)) := !!rlang::sym(VarNameT) - !!rlang::sym(VarName0) )
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_df.add_VarNameT.pdeltaT0 =  ----  
## -> included in "f_df.t.tribble_construct.source.r"
.tmp$objectname = "f_df.add_VarNameT.pdeltaT0"
.tmp$object = function(DS.DNR, VarName0, VarNameT, prefix = "", suffix = ".pdeltaT0", logical_as_numeric = FALSE) {
    if(logical_as_numeric && is.logical(DS.DNR[[VarName0]]) && is.logical(DS.DNR[[VarNameT]])) {
    } else if(is.numeric(DS.DNR[[VarName0]]) && is.numeric(DS.DNR[[VarNameT]])) {
    } else if(lubridate::is.Date(DS.DNR[[VarName0]]) && lubridate::is.Date(DS.DNR[[VarNameT]])) {
    } else {
        stop("Both ",VarName0," and ",VarNameT," must be in the same class, either numeric or Date.")
    }
    DS.DNR |> mutate( !!rlang::sym(paste0(prefix,VarNameT,suffix)) := (!!rlang::sym(VarNameT) - !!rlang::sym(VarName0)) / !!rlang::sym(VarName0) ) 
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_df.add_RegExVars.kbins =  ----  
## -> included in "f_df.t.tribble_construct.source.r"
# https://chatgpt.com/c/20d6b4e3-c198-49c2-90f5-c8959d55c1ed
# Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_RegExVars.kbins.dev.Rmd
.tmp$objectname = "f_df.add_RegExVars.kbins"
.tmp$object = function(DS.DNR, regex_pattern = ".", breaks = c(-Inf, -0.1, -0.05, 0.05, 0.1, Inf), suffix = paste0(".",length(breaks)-1,"bins")) {
    if (!is.data.frame(DS.DNR)) {
        stop("DS.DNR must be a data frame.")
    }
    
    # Apply the cut operation across columns matching the regex pattern
    DS.DNR <- DS.DNR %>%
        mutate(across(
            .cols = matches(regex_pattern), # Select columns matching the regex pattern
            .fns = ~ cut(., 
                         breaks = breaks, # Define breakpoints
                         include.lowest = TRUE, 
                         right = FALSE), 
            .names = paste0("{.col}", suffix) # Naming convention for new columns
        ))
    
    return(DS.DNR)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) f_df.add_RegExVars.cut  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_df.add_RegExVars.cut")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_df.add_RegExVars.quintile_factor =  ----  
## -> included in "f_df.t.tribble_construct.source.r"
# https://chatgpt.com/c/516e86f6-008f-4d70-87e7-b99f3b5a7af5
# /github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_RegExVars.quintile_factor.dev.Rmd
.tmp$objectname = "f_df.add_RegExVars.quintile_factor"
.tmp$object = function(DS.DNR, regex_pattern, factor.ordered = FALSE) {
  DS.DNR %>%
    mutate(across(
      .cols = matches(paste0(regex_pattern)), 
      .fns = ~ {
        # Compute quintile
        quintile <- ntile(., 5)
        
        # Define labels for the quintiles with rounded values
        labels <- c(
          paste0("(", round(quantile(., 0, na.rm = TRUE), 3), ", ", round(quantile(., 0.2, na.rm = TRUE), 3), "]"),
          paste0("(", round(quantile(., 0.2, na.rm = TRUE), 3), ", ", round(quantile(., 0.4, na.rm = TRUE), 3), "]"),
          paste0("(", round(quantile(., 0.4, na.rm = TRUE), 3), ", ", round(quantile(., 0.6, na.rm = TRUE), 3), "]"),
          paste0("(", round(quantile(., 0.6, na.rm = TRUE), 3), ", ", round(quantile(., 0.8, na.rm = TRUE), 3), "]"),
          paste0("(", round(quantile(., 0.8, na.rm = TRUE), 3), ", ", round(quantile(., 1, na.rm = TRUE), 3), "]")
        )
        
        # Convert to ordered factor - caution) glm makes ordered factor as Quadratic/Cubic contrasts
        factor(quintile, levels = 1:5, labels = labels, ordered = factor.ordered)
      },
      .names = "{.col}.quintile"
    ))
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_df.add_RegExVars.quartile_factor =  ----  
## -> included in "f_df.t.tribble_construct.source.r"
# https://chatgpt.com/c/516e86f6-008f-4d70-87e7-b99f3b5a7af5
# /github_tidystat/Rdev/10_import_clean_datatype/16_categorical_factor/f_df.add_RegExVars.quintile_factor.dev.Rmd
.tmp$objectname = "f_df.add_RegExVars.quartile_factor"
.tmp$object = function(DS.DNR, regex_pattern, factor.ordered = FALSE) {
    DS.DNR %>%
        mutate(across(
            .cols = matches(paste0(regex_pattern)), 
            .fns = ~ {
                quartile <- ntile(., 4)
                
                # Define labels for the quintiles with rounded values
                labels <- c(
                    paste0("(", round(quantile(., 0, na.rm = TRUE), 3), ", ", round(quantile(., 0.25, na.rm = TRUE), 3), "]"),
                    paste0("(", round(quantile(., 0.25, na.rm = TRUE), 3), ", ", round(quantile(., 0.5, na.rm = TRUE), 3), "]"),
                    paste0("(", round(quantile(., 0.5, na.rm = TRUE), 3), ", ", round(quantile(., 0.75, na.rm = TRUE), 3), "]"),
                    paste0("(", round(quantile(., 0.75, na.rm = TRUE), 3), ", ", round(quantile(., 1, na.rm = TRUE), 3), "]")
                )
                
        # Convert to ordered factor - caution) glm makes ordered factor as Quadratic/Cubic contrasts
                factor(quartile, levels = 1:4, labels = labels, ordered = factor.ordered)
            },
            .names = "{.col}.quartile"
        ))
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)



##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# @@ END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
