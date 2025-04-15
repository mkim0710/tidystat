# function.vec.fold.index.dev.r

k = 5
# function.vec.fold.index = function(data, k = 5) data %>% nrow %>% {c( rep(1:k, (. %/% k)) , 1:((.-1) %% k +1) )}
function.vec.fold.index = function(data, k = 5) data %>% { rep(1:k, (nrow(.) %/% k) + 1) [1:nrow(.)] }

dataset.train %>% function.vec.fold.index |> dput()
set.seed(12345); dataset.train %>% function.vec.fold.index %>% sample |> dput()
set.seed(12345); dataset.train$fold.index = dataset.train %>% function.vec.fold.index %>% sample
  
  
# __________|------  
# ⸿ END----  
