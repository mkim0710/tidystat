function.binary2numeric = function(x) {
  # source("https://github.com/mkim0710/tidystat/raw/master/function.binary2numeric.source.r")
  # caution) as.numeric(CategoricalVariable_3MoreLevels)
  if (is.character(x)) {
    x = as.factor(x)
  }
  if (length(levels(x)) == 2) {
    x = as.numeric(x)
  } else if (length(levels(x)) > 2) {
    print("error - length(levels(x)) > 2")
  }
  if (is.logical(x)) {
    x = as.numeric(x)
  } 
  x
}

#@ test) function.binary2numeric() ----
# > function.binary2numeric(c(T, F ,T))
# [1] 1 0 1
# > function.binary2numeric(c("A", "A", "B", "B", "A"))
# [1] 1 1 2 2 1
# > function.binary2numeric(c("A", "A", "B", "C", "A"))
# [1] A A B C A
# Levels: A B C


function.data.CaseCtrl.list = function(data, varname_Case, rm_zero_vars = T) {
  if(!is.logical(data[[varname_Case]])) {
    stop("error - !is.logical(data[[varname_Case]])")
  }
  
  if(rm_zero_vars == T) {
    data2 = data[, which( 
      colSums( data[data[[varname_Case]] == T, ] %>% map_df(as.numeric) ) != 0 &
        colSums( data[data[[varname_Case]] == F, ] %>% map_df(as.numeric) ) != 0
    )]
    data2[[varname_Case]] = data[[varname_Case]]
  } else {
    data2 = data
  }
  print("* Dropping variables with all-zero values, either in the case or the control:")
  # dput(setdiff(names(data), names(data2)))
  function.deparse.cat.width(setdiff(names(data), names(data2)))
  rm(data)
  
  data.CaseCtrl.list = list()
  data.CaseCtrl.list$Case = data2[data2[[varname_Case]] == T, ]
  data.CaseCtrl.list$Ctrl = data2[data2[[varname_Case]] == F, ]
  # print("* dim(data2)")
  # print(dim(data2))
  rm(data2)

  data.CaseCtrl.list
}

