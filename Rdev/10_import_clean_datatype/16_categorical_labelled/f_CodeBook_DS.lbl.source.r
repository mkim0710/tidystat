# default.R
.RelativeSubPath = "Rdev/10_import_clean_datatype/16_categorical_labelled"  
.SourceName_root = "f_CodeBook_DS.lbl"  
# .SourceName_root = "f_CodeBook_DS.lbl"  
#### Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.r----  
#### Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.Rmd----  
#### Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r")  
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.dev.Rmd") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# file.edit("~/github_tidystat/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## *** Caution) convert lbl to fct (quite deterministic step) before select or recode or filter_n ~!!! ----  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_CodeBook_DS_VarName.lbl =  ----
# https://github.com/mkim0710/blob/main/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r
.tmp$objectname = "f_CodeBook_DS_VarName.lbl"
.tmp$object = function(DS, vec.VarName, tblVarName_VarDescription_ValueOptions, NameValuePair_separator = ",", Name_Value_separator = "=", vecNamed.swap = FALSE, VarType.numeric = "Continuous", VarType.Date = "Date", output.select = FALSE, VERBOSE = isTRUE(getOption("verbose"))) {
    .packagename = "labelled"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    for (i.Varname in vec.VarName) {

        if(is.factor(DS[[i.Varname]])) {
            paste0("Converting ", i.Varname, " to character") |> warning("  \n", immediate. = TRUE)
            DS[[i.Varname]] = DS[[i.Varname]] %>% as.character()
        } 
        
        var_label(DS[[i.Varname]]) = 
            tblVarName_VarDescription_ValueOptions %>% 
            dplyr::filter(VarName == i.Varname) %>% 
            pull(VarDescription) %>% as.character
        if (
            tblVarName_VarDescription_ValueOptions %>% 
            dplyr::filter(VarName == i.Varname) %>% 
            pull(VarType) %in% c(VarType.numeric, VarType.Date) || 
            is.Date(DS[[i.Varname]])  
        ) {
            attributes(DS[[i.Varname]])$ValueOptions = 
                tblVarName_VarDescription_ValueOptions %>% 
                filter(VarName == i.Varname) %>% 
                pull(ValueOptions) %>% as.character()
            if ("ValueUnit" %in% names(tblVarName_VarDescription_ValueOptions)) {
                attributes(DS[[i.Varname]])$ValueUnit = 
                    tblVarName_VarDescription_ValueOptions %>% 
                    filter(VarName == i.Varname) %>% 
                    pull(ValueUnit) %>% as.character()
                attributes(DS[[i.Varname]])$label =
                    attributes(DS[[i.Varname]])$label %>% 
                    paste0(" (", attributes(DS[[i.Varname]])$ValueUnit, ")")
            }
        } else {
            val_labels(DS[[i.Varname]]) = tblVarName_VarDescription_ValueOptions %>% 
                filter(VarName == i.Varname) %>% 
                pull(ValueOptions) %>% as.character |> 
                env1$f$f_chrNameValuePairs2vector(
                    NameValuePair_separator = NameValuePair_separator, 
                    Name_Value_separator = Name_Value_separator, 
                    vecNamed.swap = vecNamed.swap)
        }
    }
    if (output.select) {
        return(DS[vec.VarName])
    } else {
        return(DS)
    }
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "env.internal"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_CodeBook_DS.lbl =  ----
# https://github.com/mkim0710/blob/main/Rdev/10_import_clean_datatype/16_categorical_labelled/f_CodeBook_DS.lbl.source.r
.tmp$objectname = "f_CodeBook_DS.lbl"
.tmp$object = function(DS, tblVarName_VarDescription_ValueOptions, NameValuePair_separator = ",", Name_Value_separator = "=", vecNamed.swap = FALSE, VarType.numeric = "Continuous", VarType.Date = "Date", VERBOSE = isTRUE(getOption("verbose"))) {
    
    DS[names(DS) %in% tblVarName_VarDescription_ValueOptions$VarName] =
        DS[names(DS) %in% tblVarName_VarDescription_ValueOptions$VarName] %>% mutate_if(is.factor, as.character)
    
    DS[names(DS) %in% (tblVarName_VarDescription_ValueOptions %>% filter(VarType == "Continuous") %>% pull(VarName))] =
        DS[names(DS) %in% (tblVarName_VarDescription_ValueOptions %>% filter(VarType == "Continuous") %>% pull(VarName))] %>% mutate_all(as.numeric)
        
    for (i.VarName in names(DS)) {
        if (i.VarName %in% tblVarName$VarName) {
            if(VERBOSE) cat("i.VarName = ", i.VarName, "\n", sep="")
            try({
                DS = DS %>% 
                    env1$env.internal$f_CodeBook_DS_VarName.lbl(
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
    return(DS)
}

#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

  
  
# __________|------  
# @@ END -----  

