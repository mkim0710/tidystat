function.data.ExposedUnexposed.list = function(data, varname_Exposed = "isExposed", rm_zero_vars = T) {
    # library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.data.ExposedUnexposed.list.source.r")
    if(!is.logical(data[[varname_Exposed]])) {
        stop("error - !is.logical(data[[varname_Exposed]])")
    }
    if(rm_zero_vars == T) {
        data2 = data[, which( 
            colSums( data[data[[varname_Exposed]] == T, ] %>% map_df(as.numeric) ) != 0 &
                colSums( data[data[[varname_Exposed]] == F, ] %>% map_df(as.numeric) ) != 0
        )]
        data2[[varname_Exposed]] = data[[varname_Exposed]]
    } else {
        data2 = data
    }
    print("* Dropping variables with all-zero values, either in the Exposed or the Unexposed:")
    dput(setdiff(names(data), names(data2)))
    # function.deparse.cat.width(setdiff(names(data), names(data2)))
    rm(data)
    
    data.ExposedUnexposed.list = list()
    data.ExposedUnexposed.list$Exposed = data2[data2[[varname_Exposed]] == T, ]
    data.ExposedUnexposed.list$Unexposed = data2[data2[[varname_Exposed]] == F, ]
    # print("* dim(data2)")
    # print(dim(data2))
    rm(data2)
    
    data.ExposedUnexposed.list
}


# #@ test --------
# load(url("https://github.com/mkim0710/tidystat/raw/master/library(Matching) lalonde.rda"))
# lalonde$isExposed = lalonde$treat == 1
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
# #  $ isExposed : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# str(function.data.ExposedUnexposed.list(lalonde, varname_Exposed = "isExposed", rm_zero_vars = T))
# # > str(function.data.ExposedUnexposed.list(lalonde, varname_Exposed = "isExposed", rm_zero_vars = T))
# # [1] "* Dropping variables with all-zero values, either in the Exposed or the Unexposed:"
# # "treat"
# # List of 2
# #  $ Exposed:'data.frame':	185 obs. of  12 variables:
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
# #   ..$ isExposed : logi [1:185] TRUE TRUE TRUE TRUE TRUE TRUE ...
# #  $ Unexposed:'data.frame':	260 obs. of  12 variables:
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
# #   ..$ isExposed : logi [1:260] FALSE FALSE FALSE FALSE FALSE FALSE ...

