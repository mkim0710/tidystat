function.data.CaseCtrl.list = function(data, varname_Case = "isCase", rm_zero_vars = T) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.data.CaseCtrl.list.source.r")
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
    dput(setdiff(names(data), names(data2)))
    # function.deparse.cat.width(setdiff(names(data), names(data2)))
    rm(data)
    
    data.CaseCtrl.list = list()
    data.CaseCtrl.list$Case = data2[data2[[varname_Case]] == T, ]
    data.CaseCtrl.list$Ctrl = data2[data2[[varname_Case]] == F, ]
    # print("* dim(data2)")
    # print(dim(data2))
    rm(data2)
    
    data.CaseCtrl.list
}

#@ test --------
# load(url("https://github.com/mkim0710/tidystat/raw/master/library(Matching) lalonde.rda"))
# lalonde$isCase = lalonde$treat == 1
# str(lalonde)
# # > str(lalonde)
# # 'data.frame':	445 obs. of  13 variables:
# #  $ age    : int  37 22 30 27 33 22 23 32 22 33 ...
# #  $ educ   : int  11 9 12 11 8 9 12 11 16 12 ...
# #  $ black  : int  1 0 1 1 1 1 1 1 1 0 ...
# #  $ hisp   : int  0 1 0 0 0 0 0 0 0 0 ...
# #  $ married: int  1 0 0 0 0 0 0 0 0 1 ...
# #  $ nodegr : int  1 1 0 1 1 1 0 1 0 0 ...
# #  $ re74   : num  0 0 0 0 0 0 0 0 0 0 ...
# #  $ re75   : num  0 0 0 0 0 0 0 0 0 0 ...
# #  $ re78   : num  9930 3596 24910 7506 290 ...
# #  $ u74    : int  1 1 1 1 1 1 1 1 1 1 ...
# #  $ u75    : int  1 1 1 1 1 1 1 1 1 1 ...
# #  $ treat  : int  1 1 1 1 1 1 1 1 1 1 ...
# #  $ isCase : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# str(function.data.CaseCtrl.list(lalonde, varname_Case = "isCase", rm_zero_vars = T))
# # > str(function.data.CaseCtrl.list(lalonde, varname_Case = "isCase", rm_zero_vars = T))
# # [1] "* Dropping variables with all-zero values, either in the case or the control:"
# # "treat"
# # List of 2
# #  $ Case:'data.frame':	185 obs. of  12 variables:
# #   ..$ age    : int [1:185] 37 22 30 27 33 22 23 32 22 33 ...
# #   ..$ educ   : int [1:185] 11 9 12 11 8 9 12 11 16 12 ...
# #   ..$ black  : int [1:185] 1 0 1 1 1 1 1 1 1 0 ...
# #   ..$ hisp   : int [1:185] 0 1 0 0 0 0 0 0 0 0 ...
# #   ..$ married: int [1:185] 1 0 0 0 0 0 0 0 0 1 ...
# #   ..$ nodegr : int [1:185] 1 1 0 1 1 1 0 1 0 0 ...
# #   ..$ re74   : num [1:185] 0 0 0 0 0 0 0 0 0 0 ...
# #   ..$ re75   : num [1:185] 0 0 0 0 0 0 0 0 0 0 ...
# #   ..$ re78   : num [1:185] 9930 3596 24910 7506 290 ...
# #   ..$ u74    : int [1:185] 1 1 1 1 1 1 1 1 1 1 ...
# #   ..$ u75    : int [1:185] 1 1 1 1 1 1 1 1 1 1 ...
# #   ..$ isCase : logi [1:185] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ Ctrl:'data.frame':	260 obs. of  12 variables:
# #   ..$ age    : int [1:260] 23 26 22 18 45 18 24 34 24 36 ...
# #   ..$ educ   : int [1:260] 10 12 9 9 11 9 8 11 4 10 ...
# #   ..$ black  : int [1:260] 1 0 1 1 1 1 0 1 0 1 ...
# #   ..$ hisp   : int [1:260] 0 0 0 0 0 0 0 0 1 0 ...
# #   ..$ married: int [1:260] 0 0 0 0 0 0 0 1 0 0 ...
# #   ..$ nodegr : int [1:260] 1 0 1 1 1 1 1 1 1 1 ...
# #   ..$ re74   : num [1:260] 0 0 0 0 0 0 0 0 0 0 ...
# #   ..$ re75   : num [1:260] 0 0 0 0 0 0 0 0 0 0 ...
# #   ..$ re78   : num [1:260] 0 12384 0 10740 11796 ...
# #   ..$ u74    : int [1:260] 1 1 1 1 1 1 1 1 1 1 ...
# #   ..$ u75    : int [1:260] 1 1 1 1 1 1 1 1 1 1 ...
# #   ..$ isCase : logi [1:260] FALSE FALSE FALSE FALSE FALSE FALSE ...
=======
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

>>>>>>> c58bcf68a498fd70d74dba22a38ce6d6a882476c
