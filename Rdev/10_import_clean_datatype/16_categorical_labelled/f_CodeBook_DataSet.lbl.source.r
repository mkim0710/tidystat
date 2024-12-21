# default.R
.subpath = "Rdev/10_import_clean_datatype/16_categorical_labelled"  
.sourcename_root = "f_CodeBook_DataSet.lbl"  
# .sourcename_root = "f_CodeBook_DataSet.lbl"  
#### Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.r----  
#### Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.Rmd----  
#### Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r")  
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.r"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));  
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.dev.Rmd"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));  
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## *** Caution) convert lbl to fct (quite deterministic step) before select or recode or filter_n ~!!! ----  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_CodeBook_DataSet_VarName.lbl =  ----
# https://github.com/mkim0710/blob/main/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r
.tmp$objectname = "f_CodeBook_DataSet_VarName.lbl"
.tmp$object = function(DataSet, vec.VarName, tblVarName_VarDescription_ValueOptions, NameValuePair_separator = ",", Name_Value_separator = "=", vecNamed.swap = FALSE, VarType.numeric = "Continuous", VarType.Date = "Date", output.select = FALSE, VERBOSE = isTRUE(getOption("verbose"))) {
    .packagename = "labelled"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    for (i.Varname in vec.VarName) {

        if(is.factor(DataSet[[i.Varname]])) {
            paste0("Converting ", i.Varname, " to character") |> warning("  \n", immediate. = TRUE)
            DataSet[[i.Varname]] = DataSet[[i.Varname]] %>% as.character()
        } 
        
        var_label(DataSet[[i.Varname]]) = 
            tblVarName_VarDescription_ValueOptions %>% 
            dplyr::filter(VarName == i.Varname) %>% 
            pull(VarDescription) %>% as.character
        if (
            tblVarName_VarDescription_ValueOptions %>% 
            dplyr::filter(VarName == i.Varname) %>% 
            pull(VarType) %in% c(VarType.numeric, VarType.Date) || 
            is.Date(DataSet[[i.Varname]])  
        ) {
            attributes(DataSet[[i.Varname]])$ValueOptions = 
                tblVarName_VarDescription_ValueOptions %>% 
                filter(VarName == i.Varname) %>% 
                pull(ValueOptions) %>% as.character()
            if ("ValueUnit" %in% names(tblVarName_VarDescription_ValueOptions)) {
                attributes(DataSet[[i.Varname]])$ValueUnit = 
                    tblVarName_VarDescription_ValueOptions %>% 
                    filter(VarName == i.Varname) %>% 
                    pull(ValueUnit) %>% as.character()
                attributes(DataSet[[i.Varname]])$label =
                    attributes(DataSet[[i.Varname]])$label %>% 
                    paste0(" (", attributes(DataSet[[i.Varname]])$ValueUnit, ")")
            }
        } else {
            val_labels(DataSet[[i.Varname]]) = tblVarName_VarDescription_ValueOptions %>% 
                filter(VarName == i.Varname) %>% 
                pull(ValueOptions) %>% as.character |> 
                env1$f$f_chrNameValuePairs2vector(
                    NameValuePair_separator = NameValuePair_separator, 
                    Name_Value_separator = Name_Value_separator, 
                    vecNamed.swap = vecNamed.swap)
        }
    }
    if (output.select) {
        return(DataSet[vec.VarName])
    } else {
        return(DataSet)
    }
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_CodeBook_DataSet.lbl =  ----
# https://github.com/mkim0710/blob/main/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DataSet.lbl.source.r
.tmp$objectname = "f_CodeBook_DataSet.lbl"
.tmp$object = function(DataSet, tblVarName_VarDescription_ValueOptions, NameValuePair_separator = ",", Name_Value_separator = "=", vecNamed.swap = FALSE, VarType.numeric = "Continuous", VarType.Date = "Date", VERBOSE = isTRUE(getOption("verbose"))) {
    
    DataSet[names(DataSet) %in% tblVarName_VarDescription_ValueOptions$VarName] =
        DataSet[names(DataSet) %in% tblVarName_VarDescription_ValueOptions$VarName] %>% mutate_if(is.factor, as.character)
    
    DataSet[names(DataSet) %in% (tblVarName_VarDescription_ValueOptions %>% filter(VarType == "Continuous") %>% pull(VarName))] =
        DataSet[names(DataSet) %in% (tblVarName_VarDescription_ValueOptions %>% filter(VarType == "Continuous") %>% pull(VarName))] %>% mutate_all(as.numeric)
        
    for (i.VarName in names(DataSet)) {
        if (i.VarName %in% tblVarName$VarName) {
            if(VERBOSE) cat("i.VarName = ", i.VarName, "\n", sep="")
            try({
                DataSet = DataSet %>% 
                    env1$env.internal$f_CodeBook_DataSet_VarName.lbl(
                        vec.VarName = i.VarName, 
                        tblVarName_VarDescription_ValueOptions = tblVarName_VarDescription_ValueOptions, 
                        NameValuePair_separator = NameValuePair_separator, 
                        Name_Value_separator = Name_Value_separator, 
                        vecNamed.swap = vecNamed.swap, 
                        VarType.numeric = VarType.numeric,
                        VarType.Date = VarType.Date,
                        output.select = FALSE,
                        VERBOSE = VERBOSE)
            })
        }
    }
    return(DataSet)
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

  
  
# __________|------  
# @@ END -----  

