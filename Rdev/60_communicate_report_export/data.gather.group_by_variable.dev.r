# data.gather.group_by_variable.dev.r

#@ ---------------  
# data_wide %>% gather(key = "variable", value = "value") %>%
#     ggplot(aes(x = value, fill = variable)) + geom_histogram(position = "identity", alpha = 0.4, bins = 100) +
#     geom_vline(aes(xintercept = JK02.2079...Match.TimeFrame1.recode.1_1.CCW63.CaseCtrl.pairwise.partial_correlation.join124.p_diff$LookBackWindow.gt.1y$r_Case[i]), color = "red") +
#     geom_vline(aes(xintercept = JK02.2079...Match.TimeFrame1.recode.1_1.CCW63.CaseCtrl.pairwise.partial_correlation.join124.p_diff$LookBackWindow.gt.1y$r_Ctrl[i]), color = "blue") +
#     scale_fill_discrete(name = "variable", labels = c( "r_Case", "r_Ctrl"))
iris[,1:4] %>% gather(key = "variable", value = "value") %>%
    ggplot(aes(x = value, fill = variable)) + geom_histogram(position = "identity", alpha = 0.4, bins = 30) +
    scale_fill_discrete(name = "variable")



#@ ------------  
data.numeric.gather.group_by.summarise_all = function(data, round_digits = 3) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/data.gather.group_by_variable.dev.r")
    Q1 = function(x) quantile(x, probs = 0.25)
    Q2 = function(x) quantile(x, probs = 0.75)
    
    if(any(!map_lgl(data, is.numeric))) {
        warning(paste0("!map_lgl(data, is.numeric) \n    Dropping variables: ", colnames(data)[!map_lgl(data, is.numeric)]))
    }
    data.numeric.colnames = colnames(data)[map_lgl(data, is.numeric)]
    data = data[, which(map_lgl(data, is.numeric))]
    # data %>% gather %>% group_by(variable) %>% summarize_all(funs(mean,sd))
    out = data %>% gather(key = "variable") %>% group_by(variable) %>% summarize_all(funs(mean, sd, min, Q1, median, Q2, max)) %>% map_df(function(x) {if(is.numeric(x)) {x = round(x, round_digits)}  ;   x})
    out = out |> as.data.frame() %>% column_to_rownames("variable") %>% t
    out = out[, data.numeric.colnames]
    out
}

# #@ test: iris) data.gather.group_by.summarise_all()
# iris |> as_tibble()
# # > iris |> as_tibble()
# # # A tibble: 150 x 5
# #    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# #           <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
# #  1          5.1         3.5          1.4         0.2  setosa
# #  2          4.9         3.0          1.4         0.2  setosa
# #  3          4.7         3.2          1.3         0.2  setosa
# #  4          4.6         3.1          1.5         0.2  setosa
# #  5          5.0         3.6          1.4         0.2  setosa
# #  6          5.4         3.9          1.7         0.4  setosa
# #  7          4.6         3.4          1.4         0.3  setosa
# #  8          5.0         3.4          1.5         0.2  setosa
# #  9          4.4         2.9          1.4         0.2  setosa
# # 10          4.9         3.1          1.5         0.1  setosa
# # # ... with 140 more rows
# summary(iris)
# # > summary(iris)
# #   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
# #  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
# #  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
# #  Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
# #  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
# #  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
# #  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500                  
# data.numeric.gather.group_by.summarise_all(iris)
# # > data.numeric.gather.group_by.summarise_all(iris)
# #        Sepal.Length Sepal.Width Petal.Length Petal.Width
# # mean          5.843       3.057        3.758       1.199
# # sd            0.828       0.436        1.765       0.762
# # min           4.300       2.000        1.000       0.100
# # Q1            5.100       2.800        1.600       0.300
# # median        5.800       3.000        4.350       1.300
# # Q2            6.400       3.300        5.100       1.800
# # max           7.900       4.400        6.900       2.500
# # Warning message:
# # In data.numeric.gather.group_by.summarise_all(iris) :
# #   !map_lgl(data, is.numeric) 
# #     Dropping variables: Species

