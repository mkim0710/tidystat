# Rdev/00_base_program/f_objectsize.create.dev.r
# f_objectname.size.write_rds.git_lfs_track_add_f.dev.r


# Rdev/00_base_program/f_objectsize.create.dev.r
f_objectsize.create = function(objectsize = 1 * 1024^2) {
        .object = numeric(objectsize/8)
}


100*1024^2
# > 100*1024^2
# [1] 104857600

100*1024^2 |> f_objectsize.create() %>% str  # str() buggy when object is too large? 
100*1024^2 |> f_objectsize.create() %>% length
# > 100*1024^2 |> f_objectsize.create() %>% str  # str() buggy when object is too large? 
#  num [1:131072] 0 0 0 0 0 0 0 0 0 0 ...
# numeric(0)
# > 100*1024^2 |> f_objectsize.create() %>% length
# [1] 13107200

13107200 * 8
# > 13107200 * 8
# [1] 104857600

100*1024^2 |> f_objectsize.create() |> object.size() 
# > 100*1024^2 |> f_objectsize.create() |> object.size()
# 104862400 bytes
104862400 - 104857600
# > 104862400 - 104857600
# [1] 4800


# Rdev/00_base_program/f_objectsize.create.dev.r
f_objectsize.create = function(objectsize = 1 * 1024^2, createRandomNumbers = FALSE, objectname = NULL) {
    
    if (createRandomNumbers) {
        .object = runif(objectsize/8)
    } else {
        .object = numeric(objectsize/8)
    }
    if(!is.null(objectname)) {
        assign(objectname, .object)
        invisible(.object)
    } else {
        .object
    }
}


100*1024^2 |> f_objectsize.create(createRandomNumbers = TRUE) %>% str  # str() buggy when object is too large? 
100*1024^2 |> f_objectsize.create(createRandomNumbers = TRUE) %>% length
100*1024^2 |> f_objectsize.create(createRandomNumbers = TRUE) |> object.size() 
# > 100*1024^2 |> f_objectsize.create(createRandomNumbers = TRUE) %>% str  # str() buggy when object is too large? 
#  num [1:131072] 0.741 0.72 0.925 0.559 0.554 ...
# numeric(0)
# > 100*1024^2 |> f_objectsize.create(createRandomNumbers = TRUE) %>% length
# [1] 13107200
# > 100*1024^2 |> f_objectsize.create(createRandomNumbers = TRUE) |> object.size() 
# 104862400 bytes

