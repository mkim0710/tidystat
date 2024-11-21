# function.metadata.dev.r

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
list.files("data/") %>% grep(".rda$", ., value = T)
list.files.rda = list.files("data/") %>% grep(".rda$", ., value = T) %>% gsub(".rda$", "", .)

# out = list()
# for (i in list.files.rda) {
#     load(paste0("data/", i, ".rda"))
#     out[[i]] = list(nrow = nrow(!!rlang::sym(i)), ncol = ncol(!!rlang::sym(i)), object.size = object.size(!!rlang::sym(i)))
#     rm(i)
# }
# # > for (i in list.files.rda) {
# # +     load(paste0("data/", i, ".rda"))
# # +     out[[i]] = list(nrow = nrow(!!rlang::sym(i)), ncol = ncol(!!rlang::sym(i)), object.size = object.size(!!rlang::sym(i)))
# # +     rm(i)
# # + }
# # Error in !rlang::sym(i) : invalid argument type
# 
# out = list()
# for (i in list.files.rda) {
#     load(paste0("data/", i, ".rda"))
#     out[[i]] = list( nrow = nrow(get(i)), ncol = ncol(get(i)), object.size = object.size(get(i)) )
#     rm(i)
# }
# # > for (i in list.files.rda) {
# # +     load(paste0("data/", i, ".rda"))
# # +     out[[i]] = list( nrow = nrow(get(i)), ncol = ncol(get(i)), object.size = object.size(get(i)) )
# # +     rm(i)
# # + }
# # Error in parse(text = i) : <text>:1:1: unexpected '['
# # 1: [
# #     ^


# ls() %>% grep(".dta$", ., value = T) |> dput()
# # > ls() %>% grep(".dta$", ., value = T) |> dput()
# c("addicts.dta", "anderson.dta", "bladder.dta", "vets.dta")
# list.files.rda = c("addicts.dta", "anderson.dta", "bladder.dta", "vets.dta")
# 
# out = list()
# for (i in list.files.rda) {
#     load(paste0("data/", i, ".rda"))
#     out[[i]] = list( nrow = nrow(get(i)), ncol = ncol(get(i)), object.size = object.size(get(i)) )
#     rm(list = i)
# }
# 
# out |> str(max.level = 2, give.attr = TRUE)
# # > out |> str(max.level = 2, give.attr = TRUE)
# # List of 4
# #  $ addicts.dta :List of 3
# #   ..$ nrow       : int 238
# #   ..$ ncol       : int 6
# #   ..$ object.size: 'object_size' num 15688
# #  $ anderson.dta:List of 3
# #   ..$ nrow       : int 42
# #   ..$ ncol       : int 6
# #   ..$ object.size: 'object_size' num 6040
# #  $ bladder.dta :List of 3
# #   ..$ nrow       : int 191
# #   ..$ ncol       : int 8
# #   ..$ object.size: 'object_size' num 15728
# #  $ vets.dta    :List of 3
# #   ..$ nrow       : int 137
# #   ..$ ncol       : int 11
# #   ..$ object.size: 'object_size' num 19408
# 
# out %>% bind_rows(.id = ".id")
# # > out %>% bind_rows(.id = ".id")
# # # A tibble: 4 x 4
# #   .id           nrow  ncol object.size
# #   <chr>        <int> <int>       <dbl>
# # 1 addicts.dta    238     6       15688
# # 2 anderson.dta    42     6        6040
# # 3 bladder.dta    191     8       15728
# # 4 vets.dta       137    11       19408
# # Warning messages:
# # 1: In bind_rows_(x, .id) :
# #   Vectorizing 'object_size' elements may not preserve their attributes
# # 2: In bind_rows_(x, .id) :
# #   Vectorizing 'object_size' elements may not preserve their attributes
# # 3: In bind_rows_(x, .id) :
# #   Vectorizing 'object_size' elements may not preserve their attributes
# # 4: In bind_rows_(x, .id) :
# #   Vectorizing 'object_size' elements may not preserve their attributes
# 
# object.size(diet) |> str(max.level = 2, give.attr = TRUE)
# # > object.size(diet) |> str(max.level = 2, give.attr = TRUE)
# #  'object_size' num 63544



list.files.rda = list.files("data/") %>% grep(".rda$", ., value = T) %>% gsub(".rda$", "", .)
list.files.rda = list.files.rda %>% grep("^trainset", ., value = T)
list.files.rda |> dput()
# > list.files.rda |> dput()
# c("trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple)", "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather", 
# "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph", 
# "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet", 
# "trainsetCC69agg4i07_829.cv.glmnet_alphas_cox", "trainsetCC69agg4i07_829"
# )

# list.files.rda.data.frame = list.files.rda %>% map_chr(function(i) {
#     print(i)
#     load(paste0("data/", i, ".rda"))
#     if(exists(i)) {
#         out = i
#     } else {
#         out = NA
#     }
#     rm(list = i)
#     out
# })
# list.files.rda.data.frame |> dput()
# # > list.files.rda.data.frame |> dput()
# # c(NA, "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather", "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph", 
# # "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet", 
# # "trainsetCC69agg4i07_829.cv.glmnet_alphas_cox", "trainsetCC69agg4i07_829"
# # )

# ?rm
# ?parent.env
list.files.rda.data.frame = list.files.rda %>% map_chr(function(i) {
    print(i)
    load(paste0("data/", i, ".rda"))
    out = NA
    if(exists(i)) {
        if(is.data.frame(get(i))) {
            out = i
        }
    }
    rm(list = i, envir=.GlobalEnv)
    out
})
list.files.rda.data.frame |> dput()
list.files.rda.data.frame %>% na.omit |> dput()
list.files.rda.data.frame %>% na.omit |> as.vector() |> dput()
# > list.files.rda.data.frame |> dput()
# c(NA, "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather", NA, NA, 
# NA, "trainsetCC69agg4i07_829")
# > list.files.rda.data.frame %>% na.omit |> dput()
# structure(c("trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather", 
# "trainsetCC69agg4i07_829"), na.action = structure(c(1L, 3L, 4L, 
# 5L), class = "omit"))
# > list.files.rda.data.frame %>% na.omit |> as.vector() |> dput()
# c("trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather", "trainsetCC69agg4i07_829"
# )


# out.list = list()
# for (i in list.files.rda) {
#     print(i)
#     load(paste0("data/", i, ".rda"))
#     # out.list[[i]] = list()
#     # out.list[[i]]$object.size = NA
#     if(exists(i)) {
#         out.list[[i]] = list()
#         out.list[[i]]$object.size = object.size(get(i))
#         out.list[[i]]$class = class(get(i))
#         out.list[[i]]$typeof = typeof(get(i))
#         out.list[[i]]$mode = mode(get(i))
#         out.list[[i]]$storage.mode = storage.mode(get(i))
#         # out.list[[i]]$attributes = attributes(get(i))
#         if(is.vector(get(i))) { 
#             out.list[[i]]$length = length(get(i))
#         }
#         if(is.data.frame(get(i))) {
#             out.list[[i]]$nrow = nrow(get(i))
#             out.list[[i]]$ncol = ncol(get(i))
#         }
#     }
#     rm(list = i, envir=.GlobalEnv)
#     out.list
# }
# out.list |> str(max.level = 2, give.attr = TRUE)
# out.list %>% bind_rows(.id = ".id")
# # > out.list |> str(max.level = 2, give.attr = TRUE)
# # List of 6
# #  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple)          :List of 1
# #   ..$ object.size: logi NA
# #  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather                  :List of 7
# #   ..$ object.size : 'object_size' num 356480
# #   ..$ class       : chr [1:3] "tbl_df" "tbl" "data.frame"
# #   ..$ typeof      : chr "list"
# #   ..$ mode        : chr "list"
# #   ..$ storage.mode: chr "list"
# #   ..$ nrow        : int 961
# #   ..$ ncol        : int 33
# #  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph :List of 5
# #   ..$ object.size : 'object_size' num 70456
# #   ..$ class       : chr "igraph"
# #   ..$ typeof      : chr "list"
# #   ..$ mode        : chr "list"
# #   ..$ storage.mode: chr "list"
# #  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet:List of 5
# #   ..$ object.size : 'object_size' num 936640
# #   ..$ class       : chr "network"
# #   ..$ typeof      : chr "list"
# #   ..$ mode        : chr "list"
# #   ..$ storage.mode: chr "list"
# #  $ trainsetCC69agg4i07_829.cv.glmnet_alphas_cox                   :List of 5
# #   ..$ object.size : 'object_size' num 6033680
# #   ..$ class       : chr "list"
# #   ..$ typeof      : chr "list"
# #   ..$ mode        : chr "list"
# #   ..$ storage.mode: chr "list"
# #  $ trainsetCC69agg4i07_829                                        :List of 7
# #   ..$ object.size : 'object_size' num 251256
# #   ..$ class       : chr [1:3] "tbl_df" "tbl" "data.frame"
# #   ..$ typeof      : chr "list"
# #   ..$ mode        : chr "list"
# #   ..$ storage.mode: chr "list"
# #   ..$ nrow        : int 1658
# #   ..$ ncol        : int 35
# # > out.list %>% bind_rows(.id = ".id")
# # Error in bind_rows_(x, .id) : Argument 2 must be length 1, not 3



out.list = list()
for (i in list.files.rda) {
    print(i)
    load(paste0("data/", i, ".rda"))
    # out.list[[i]] = list()
    # out.list[[i]]$object.size = NA
    if(exists(i)) {
        out.list[[i]] = list()
        out.list[[i]]$object.size = object.size(get(i))
        out.list[[i]]$class = class(get(i))
        if (length(out.list[[i]]$class) > 1) out.list[[i]]$class = out.list[[i]]$class |> paste(collapse = "|")
        out.list[[i]]$typeof = typeof(get(i))
        out.list[[i]]$mode = mode(get(i))
        out.list[[i]]$storage.mode = storage.mode(get(i))
        # out.list[[i]]$attributes = attributes(get(i))
        if(is.vector(get(i))) { 
            out.list[[i]]$length = length(get(i))
        }
        if(is.data.frame(get(i))) {
            out.list[[i]]$nrow = nrow(get(i))
            out.list[[i]]$ncol = ncol(get(i))
        }
    }
    rm(list = i, envir=.GlobalEnv)
}
out.list |> str(max.level = 2, give.attr = TRUE)
out.list %>% bind_rows(.id = ".id")
# > out.list = list()
# > for (i in list.files.rda) {
# +     print(i)
# +     load(paste0("data/", i, ".rda"))
# +     # out.list[[i]] = list()
# +     # out.list[[i]]$object.size = NA
# +     if(exists(i)) {
# +         out.list[[i]] = list()
# +         out.list[[i]]$object.size = object.size(get(i))
# +         out.list[[i]]$class = class(get(i))
# +         if (length(out.list[[i]]$class) > 1) out.list[[i]]$class = out.list[[i]]$class |> paste(collapse = "|")
# +         out.list[[i]]$typeof = typeof(get(i))
# +         out.list[[i]]$mode = mode(get(i))
# +         out.list[[i]]$storage.mode = storage.mode(get(i))
# +         # out.list[[i]]$attributes = attributes(get(i))
# +         if(is.vector(get(i))) { 
# +             out.list[[i]]$length = length(get(i))
# +         }
# +         if(is.data.frame(get(i))) {
# +             out.list[[i]]$nrow = nrow(get(i))
# +             out.list[[i]]$ncol = ncol(get(i))
# +         }
# +     }
# +     rm(list = i, envir=.GlobalEnv)
# +     out.list
# + }
# [1] "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple)"
# [1] "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather"
# [1] "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph"
# [1] "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet"
# [1] "trainsetCC69agg4i07_829.cv.glmnet_alphas_cox"
# [1] "trainsetCC69agg4i07_829"
# Warning message:
# In rm(list = i, envir=.GlobalEnv) :
#   .object 'trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple)' not found
# > out.list |> str(max.level = 2, give.attr = TRUE)
# List of 5
#  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather                  :List of 7
#   ..$ object.size : 'object_size' num 356480
#   ..$ class       : chr "tbl_df|tbl|data.frame"
#   ..$ typeof      : chr "list"
#   ..$ mode        : chr "list"
#   ..$ storage.mode: chr "list"
#   ..$ nrow        : int 961
#   ..$ ncol        : int 33
#  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph :List of 5
#   ..$ object.size : 'object_size' num 70456
#   ..$ class       : chr "igraph"
#   ..$ typeof      : chr "list"
#   ..$ mode        : chr "list"
#   ..$ storage.mode: chr "list"
#  $ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet:List of 5
#   ..$ object.size : 'object_size' num 936640
#   ..$ class       : chr "network"
#   ..$ typeof      : chr "list"
#   ..$ mode        : chr "list"
#   ..$ storage.mode: chr "list"
#  $ trainsetCC69agg4i07_829.cv.glmnet_alphas_cox                   :List of 5
#   ..$ object.size : 'object_size' num 6033680
#   ..$ class       : chr "list"
#   ..$ typeof      : chr "list"
#   ..$ mode        : chr "list"
#   ..$ storage.mode: chr "list"
#  $ trainsetCC69agg4i07_829                                        :List of 7
#   ..$ object.size : 'object_size' num 251256
#   ..$ class       : chr "tbl_df|tbl|data.frame"
#   ..$ typeof      : chr "list"
#   ..$ mode        : chr "list"
#   ..$ storage.mode: chr "list"
#   ..$ nrow        : int 1658
#   ..$ ncol        : int 35
# > out.list %>% bind_rows(.id = ".id")
# # A tibble: 5 x 8
#   .id                                                             object.size class                 typeof mode  storage.mode  nrow  ncol
#   <chr>                                                                 <dbl> <chr>                 <chr>  <chr> <chr>        <int> <int>
# 1 trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather                        356480 tbl_df|tbl|data.frame list   list  list           961    33
# 2 trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph        70456 igraph                list   list  list            NA    NA
# 3 trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.statnet      936640 network               list   list  list            NA    NA
# 4 trainsetCC69agg4i07_829.cv.glmnet_alphas_cox                        6033680 list                  list   list  list            NA    NA
# 5 trainsetCC69agg4i07_829                                              251256 tbl_df|tbl|data.frame list   list  list          1658    35
# Warning messages:
# 1: In bind_rows_(x, .id) :
#   Vectorizing 'object_size' elements may not preserve their attributes
# 2: In bind_rows_(x, .id) :
#   Vectorizing 'object_size' elements may not preserve their attributes
# 3: In bind_rows_(x, .id) :
#   Vectorizing 'object_size' elements may not preserve their attributes
# 4: In bind_rows_(x, .id) :
#   Vectorizing 'object_size' elements may not preserve their attributes
# 5: In bind_rows_(x, .id) :
#   Vectorizing 'object_size' elements may not preserve their attributes



  
  
# __________|------  
# @@ END----  
