# #         https://github.com/mkim0710/tidystat/blob/master/f_DSname.Search.read.checkEntity.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/f_DSname.Search.read.checkEntity-source.R")


cat("dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="") 
vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID")
for (varname in vec_candidate4ID) {if(varname %in% names(get(.objectname))) cat("n_distinct(",.objectname,"$",varname,") == ",n_distinct(get(.objectname)[[varname]]),"  \n", sep="")}






## @ Data Availability Check ------  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.nproptable.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.summarize_all_sum_is.na.dev.r
# get(.objectname) %>% summarise_all(function(x) sum(is.na(x)) ) %>% t # Caution) always check for missing values~!!! -----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.dev.r
f_df.NotNA_p_df = function(data) {
    out = data %>% map_df(is.na) %>% colSums |> as.data.frame() |> rownames_to_column() |> rename(varname = rowname) |> rownames_to_column() |> rename(RowNum = rowname)
    colnames(out)[which(colnames(out) == ".")] = "IsNA"
    out = out %>% mutate(NotNA = nrow(data) - IsNA, NRow = nrow(data)) 
    out = out %>% add_column(IsNA_p_df = sprintf("%4.3f",out$IsNA/out$NRow), .after = "IsNA")
    out = out %>% add_column(NotNA_p_df = sprintf("%4.3f",out$NotNA/out$NRow), .after = "NotNA")
    out = out %>% arrange(IsNA)
    out
}
get(.objectname) %>% f_df.NotNA_p_df
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_df.variable.Date.nID_anyTRUE_allTRUE.dev.r



## @ Data Summary ------  
cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
assign(paste0(.objectname,".dropNAcols"), get(.objectname) %>% select_if(function(vec) all(!is.na(vec))))
.objectname = paste0(.objectname,".dropNAcols")
.t0 = Sys.time()
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",.objectname," |> dplyr::select_if(is.numeric))"," |> summary()","  \n", sep=""); get(.objectname) |> dplyr::select_if(is.numeric) |> summary() #-----
Sys.time() - .t0
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",.objectname," |> dplyr::select_if(is.logical))"," |> summary()","  \n", sep=""); get(.objectname) |> dplyr::select_if(is.logical) |> summary() #-----
Sys.time() - .t0
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",.objectname," |> dplyr::select_if(is.factor))"," |> summary()","  \n", sep=""); get(.objectname) |> dplyr::select_if(is.factor) |> summary() #-----
Sys.time() - .t0
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",.objectname," |> dplyr::select_if(is.factor))"," |> summary()","  \n", sep=""); get(.objectname) %>% select_if(is.character) %>% map_df(as.factor) |> summary() #-----
Sys.time() - .t0
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/18_dichotomous_logical/function.dichotomous2logical.dev.r

# PENDING
