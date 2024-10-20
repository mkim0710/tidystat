# Rdev/00_base_program/f_objectsize_unit.create.dev.r
# f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# https://chatgpt.com/c/671499bc-53ac-800e-9480-6939c7279a53
# https://gemini.google.com/app/2fae119217594d4b


#@ Rdev/00_base_program/f_objectsize_unit.create.dev.r ----
## f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2) ----
f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2) { 
    .object = numeric(objectsize_in_bytes/8) 
}

100*1024^2
# > 100*1024^2
# [1] 104857600

100*1024^2 |> f_objectsize_in_bytes.create() |> str()  # str() buggy when object is too large? 
100*1024^2 |> f_objectsize_in_bytes.create() |> length()
# > 100*1024^2 |> f_objectsize_in_bytes.create() |> str  # str() buggy when object is too large? 
#  num [1:131072] 0 0 0 0 0 0 0 0 0 0 ...
# numeric(0)
# > 100*1024^2 |> f_objectsize_in_bytes.create() |> length
# [1] 13107200

13107200 * 8
# > 13107200 * 8
# [1] 104857600

100*1024^2 |> f_objectsize_in_bytes.create() |> object.size() 
# > 100*1024^2 |> f_objectsize_in_bytes.create() |> object.size()
# 104862400 bytes
104862400 - 104857600
# > 104862400 - 104857600
# [1] 4800



#@ Rdev/00_base_program/f_objectsize_unit.create.dev.r ----
## f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2, createRandomNumbers = FALSE, objectname = NULL) ----
f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1, createRandomNumbers = FALSE, objectname = NULL) {
    
    if (createRandomNumbers) {
        .object = runif(objectsize_in_bytes/8)
    } else {
        .object = numeric(objectsize_in_bytes/8)
    }
    if(!is.null(objectname)) {
        assign(objectname, .object)
        invisible(.object)
    } else {
        .object
    }
}

set.seed(1)
100*1024^2 |> f_objectsize_in_bytes.create(createRandomNumbers = TRUE) |> str()  # str() buggy when object is too large? 
100*1024^2 |> f_objectsize_in_bytes.create(createRandomNumbers = TRUE) |> length()
100*1024^2 |> f_objectsize_in_bytes.create(createRandomNumbers = TRUE) |> object.size() 
# > 100*1024^2 |> f_objectsize_in_bytes.create(createRandomNumbers = TRUE) |> str()  # str() buggy when object is too large? 
#  num [1:131072] 0.266 0.372 0.573 0.908 0.202 ...
# numeric(0)
# > 100*1024^2 |> f_objectsize_in_bytes.create(createRandomNumbers = TRUE) |> length()
# [1] 13107200
# > 100*1024^2 |> f_objectsize_in_bytes.create(createRandomNumbers = TRUE) |> object.size() 
# 104862400 bytes






#@ object.size.format() ==== 
?object.size
structure(2^20, class = "object_size") |> format(units = "b", standard = "auto", digits = 3L)
# > structure(2^20, class = "object_size") |> format(units = "b", standard = "auto", digits = 3L)
# [1] "1048576 bytes"


## |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line() ----
### :: c("bytes", "b", "Kb", "Mb", "B", "KiB", "MiB", "KB", "MB", "kB", "MB") ----

c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB", "kB") |>  map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 3L)  }) |> env1$f$f_vec.dput_line_by_line() 
# > c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB", "kB")  map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 3L)  })
# Error in `map()`:
# ℹ In index: 1.
# Caused by error in `match.arg()`:
# ! 'arg' should be one of “auto”, “B”, “kB”, “MB”, “GB”, “TB”, “PB”, “EB”, “ZB”, “YB”, “RB”, “QB”, “KiB”, “MiB”, “GiB”, “TiB”, “PiB”, “EiB”, “ZiB”, “YiB”, “b”, “Kb”, “Mb”, “Gb”, “Tb”, “Pb”, “KB”
# Run `rlang::last_trace()` to see where the error occurred.
# Called from: signal_abort(cnd, .file)

# c("auto", "B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# # Error in `map()`:
# # ℹ In index: 3.
# # Caused by error in `format.object_size()`:
# # ! For SI units, specify 'standard = "SI"'
# # Run `rlang::last_trace()` to see where the error occurred.
# # Called from: signal_abort(cnd, .file)

#### :: c("b", "Kb", "Mb", "Gb", "Tb", "Pb", "B", "KB", "MB", "GB", "TB", "PB") ----
c("b", "Kb", "Mb", "Gb", "Tb", "Pb", "B", "KB", "MB", "GB", "TB", "PB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
c("1048576 bytes",  
  "1024 Kb",  
  "1 Mb",  
  "0.0009765625 Gb",  
  "9.537e-07 Tb",  
  "9e-10 Pb",  
  "1048576 bytes",  
  "1024 Kb",  
  "1 Mb",  
  "0.0009765625 Gb",  
  "9.537e-07 Tb",  
  "9e-10 Pb")  

#### :: c("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB") ----
c("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# > c("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# c("1048576 bytes",  
#   "1024 KiB",  
#   "1 MiB",  
#   "0.0009765625 GiB",  
#   "9.537e-07 TiB",  
#   "9e-10 PiB",  
#   "0 EiB",  
#   "0 ZiB",  
#   "0 YiB") 


#### :: c("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB") ----
# c("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# # > c("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# # Error in `map()`:
# # ℹ In index: 2.
# # Caused by error in `format.object_size()`:
# # ! For SI units, specify 'standard = "SI"'
# # Run `rlang::last_trace()` to see where the error occurred.
# # Called from: signal_abort(cnd, .file)


### |> table() |> sort() ----
c(
    "b", "Kb", "Mb", "Gb", "Tb", "Pb", "B", "KB", "MB", "GB", "TB", "PB",
     "B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB", 
    "B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB"
) |> table() |> sort()
# > c(
# +     "b", "Kb", "Mb", "Gb", "Tb", "Pb", "B", "KB", "MB", "GB", "TB", "PB",
# +      "B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB", 
# +     "B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB"
# + ) |> table() |> sort
# .
#   b  EB EiB  Gb GiB  kB  Kb  KB KiB  Mb MiB  Pb PiB  QB  RB  Tb TiB  YB YiB  ZB ZiB  GB  MB  PB  TB   B 
#   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   2   2   2   2   3 



### |> purrr::keep(~.x >= 2) |> names() |> dput() ----
### :: c("B", "GB", "MB", "PB", "TB") ----
c(
    "b", "Kb", "Mb", "Gb", "Tb", "Pb", "B", "KB", "MB", "GB", "TB", "PB",
     "B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB", 
    "B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "RB", "QB"
) |> table() |> purrr::keep(~.x >= 2) |> names() |> dput()
c("B", "GB", "MB", "PB", "TB")


#### |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line() ----
c("B", "GB", "MB", "PB", "TB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
c("1048576 bytes",  
  "0.0009765625 Gb",  
  "1 Mb",  
  "9e-10 Pb",  
  "9.537e-07 Tb")



### :: c"kB" ----
#### |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line() ----
# c("kB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# # > c("kB") |> map(function(chr_unit) {  structure(2^20, class = "object_size") |> format(units = chr_unit, standard = "auto", digits = 10L)  }) |> env1$f$f_vec.dput_line_by_line()
# # Error in `map()`:
# # ℹ In index: 1.
# # Caused by error in `format.object_size()`:
# # ! For SI units, specify 'standard = "SI"'
# # Run `rlang::last_trace()` to see where the error occurred.
# # Called from: signal_abort(cnd, .file)






## :: vec.unit_conversions_legacy ----
# Define conversion factors for legacy/IEC units (binary, based on 1024)
vec.unit_conversions_legacy <- c(
    b = 1  
    , Kb = 1024     # 1 Kb = 1024 bytes
    , Mb = 1024^2   # 1 Mb = 1024^2 bytes
    , Gb = 1024^3   # 1 Gb = 1024^3 bytes
    , Tb = 1024^4   # 1 Tb = 1024^4 bytes
    # , Pb = 1024^5   # 1 Pb = 1024^5 bytes
    # , B = 1
    # , KB = 1024     # 1 KB = 1024 bytes
    # , MB = 1024^2   # 1 MB = 1024^2 bytes
    # , GB = 1024^3   # 1 GB = 1024^3 bytes
    # , TB = 1024^4   # 1 TB = 1024^4 bytes
    # , PB = 1024^5   # 1 PB = 1024^5 bytes
)

## :: vec.unit_conversions_SI ----
# Define conversion factors for SI units (decimal, based on 1000)
vec.unit_conversions_SI <- c(
    B = 1   
    , kB = 1000      # 1 kB = 1000 bytes
    , MB = 1000^2    # 1 MB = 1000^2 bytes
    , GB = 1000^3    # 1 GB = 1000^3 bytes
    , TB = 1000^4    # 1 TB = 1000^4 bytes
    # , PB = 1000^5    # 1 PB = 1000^5 bytes
)




## :: f_objectsize_unit.convert2units_vec = function(objectsize = 1 * 1024^2) ----

f_objectsize_unit.convert2units_vec = function(objectsize_in_bytes = 1 * 1024^2) {
    
    ## :: vec.unit_conversions_legacy ----
    # Define conversion factors for legacy/IEC units (binary, based on 1024)
    vec.unit_conversions_legacy <- c(
        b = 1  
        , Kb = 1024     # 1 Kb = 1024 bytes
        , Mb = 1024^2   # 1 Mb = 1024^2 bytes
        , Gb = 1024^3   # 1 Gb = 1024^3 bytes
        , Tb = 1024^4   # 1 Tb = 1024^4 bytes
        # , Pb = 1024^5   # 1 Pb = 1024^5 bytes
        # , B = 1
        # , KB = 1024     # 1 KB = 1024 bytes
        # , MB = 1024^2   # 1 MB = 1024^2 bytes
        # , GB = 1024^3   # 1 GB = 1024^3 bytes
        # , TB = 1024^4   # 1 TB = 1024^4 bytes
        # , PB = 1024^5   # 1 PB = 1024^5 bytes
    )
    
    ## :: vec.unit_conversions_SI ----
    # Define conversion factors for SI units (decimal, based on 1000)
    vec.unit_conversions_SI <- c(
        B = 1   
        , kB = 1000      # 1 kB = 1000 bytes
        , MB = 1000^2    # 1 MB = 1000^2 bytes
        , GB = 1000^3    # 1 GB = 1000^3 bytes
        , TB = 1000^4    # 1 TB = 1000^4 bytes
        # , PB = 1000^5    # 1 PB = 1000^5 bytes
    )
    
    c(vec.unit_conversions_legacy, vec.unit_conversions_SI) %>% map_dbl(~objectsize_in_bytes / .x) 
    
}

# 2^20 |> f_objectsize_unit.convert2units_vec()
# 2^30 |> f_objectsize_unit.convert2units_vec()
# 2^40 |> f_objectsize_unit.convert2units_vec()
# 10^6 |> f_objectsize_unit.convert2units_vec()
# 10^12 |> f_objectsize_unit.convert2units_vec()
# 10^24 |> f_objectsize_unit.convert2units_vec()




## :: c(`2^20` = 2^20, `2^30` = 2^30, `2^40` = 2^40, `10^6` = 10^6, `10^9` = 10^9, `10^12` = 10^12) 
# "2^20, 2^30, 2^40, 10^6, 10^9, 10^12" %>% strsplit(", ") %>% unlist %>% set_names %>% map_dbl(~eval(parse(text = .x))) %>% deparse(width.cutoff = 500) %>% cat("\n")
# # > "2^20, 2^30, 2^40, 10^6, 10^9, 10^12" %>% strsplit(", ") %>% unlist %>% set_names %>% map_dbl(~eval(parse(text = .x))) %>% deparse(width.cutoff = 500) %>% cat("\n")
# # c("2^20" = 1048576, "2^30" = 1073741824, "2^40" = 1099511627776, "10^6" = 1e+06, "10^9" = 1e+09, "10^12" = 1e+12) 

"2^20, 2^30, 2^40, 10^6, 10^9, 10^12" %>% strsplit(", ") %>% unlist %>% map_chr(function(chr) paste0("`",chr,"` = ",chr)) %>% paste0(collapse = ", ") %>% paste0("c(", ., ")") %>% cat("\n")
# > "2^20, 2^30, 2^40, 10^6, 10^9, 10^12" %>% strsplit(", ") %>% unlist %>% map_chr(function(chr) paste0("`",chr,"` = ",chr)) %>% paste0(collapse = ", ") %>% paste0("c(", ., ")") %>% cat("\n")
# c(`2^20` = 2^20, `2^30` = 2^30, `2^40` = 2^40, `10^6` = 10^6, `10^9` = 10^9, `10^12` = 10^12) 


### |> map(f_objectsize_unit.convert2units_vec) ----
c(`2^20` = 2^20, `2^30` = 2^30, `2^40` = 2^40, `10^6` = 10^6, `10^9` = 10^9, `10^12` = 10^12) %>% map(f_objectsize_unit.convert2units_vec) %>% deparse(width.cutoff = 500) %>% cat("\n")
list_vec = list("2^20" = c(b = 1048576, Kb = 1024, Mb = 1, Gb = 0.0009765625, Tb = 9.5367431640625e-07, B = 1048576, kB = 1048.576, MB = 1.048576, GB = 0.001048576, TB = 1.048576e-06), "2^30" = c(b = 1073741824, Kb = 1048576, Mb = 1024, Gb = 1, Tb = 0.0009765625, B = 1073741824, kB = 1073741.824, MB = 1073.741824, GB = 1.073741824, TB = 0.001073741824), "2^40" = c(b = 1099511627776, Kb = 1073741824, Mb = 1048576, Gb = 1024, Tb = 1, B = 1099511627776, kB = 1099511627.776, MB = 1099511.627776, GB = 1099.511627776,  TB = 1.099511627776), "10^6" = c(b = 1e+06, Kb = 976.5625, Mb = 0.95367431640625, Gb = 0.000931322574615479, Tb = 9.09494701772928e-07, B = 1e+06, kB = 1000, MB = 1, GB = 0.001, TB = 1e-06), "10^9" = c(b = 1e+09, Kb = 976562.5, Mb = 953.67431640625, Gb = 0.931322574615479, Tb = 0.000909494701772928, B = 1e+09, kB = 1e+06, MB = 1000, GB = 1, TB = 0.001), "10^12" = c(b = 1e+12, Kb = 976562500, Mb = 953674.31640625, Gb = 931.322574615479, Tb = 0.909494701772928, B = 1e+12, kB = 1e+09, MB = 1e+06, GB = 1000,  TB = 1)) 
# list_vec %>% as.data.frame
# list_vec %>% as_tibble
# # > list_vec %>% as.data.frame
# #           X2.20        X2.30        X2.40        X10.6        X10.9       X10.12
# # b  1.048576e+06 1.073742e+09 1.099512e+12 1.000000e+06 1.000000e+09 1.000000e+12
# # Kb 1.024000e+03 1.048576e+06 1.073742e+09 9.765625e+02 9.765625e+05 9.765625e+08
# # Mb 1.000000e+00 1.024000e+03 1.048576e+06 9.536743e-01 9.536743e+02 9.536743e+05
# # Gb 9.765625e-04 1.000000e+00 1.024000e+03 9.313226e-04 9.313226e-01 9.313226e+02
# # Tb 9.536743e-07 9.765625e-04 1.000000e+00 9.094947e-07 9.094947e-04 9.094947e-01
# # B  1.048576e+06 1.073742e+09 1.099512e+12 1.000000e+06 1.000000e+09 1.000000e+12
# # kB 1.048576e+03 1.073742e+06 1.099512e+09 1.000000e+03 1.000000e+06 1.000000e+09
# # MB 1.048576e+00 1.073742e+03 1.099512e+06 1.000000e+00 1.000000e+03 1.000000e+06
# # GB 1.048576e-03 1.073742e+00 1.099512e+03 1.000000e-03 1.000000e+00 1.000000e+03
# # TB 1.048576e-06 1.073742e-03 1.099512e+00 1.000000e-06 1.000000e-03 1.000000e+00
# # > list_vec %>% as_tibble
# # # A tibble: 10 × 6
# #     `2^20`  `2^30`  `2^40`  `10^6`  `10^9`  `10^12`
# #      <dbl>   <dbl>   <dbl>   <dbl>   <dbl>    <dbl>
# #  1 1.05e+6 1.07e+9 1.10e12 1   e+6 1   e+9 1   e+12
# #  2 1.02e+3 1.05e+6 1.07e 9 9.77e+2 9.77e+5 9.77e+ 8
# #  3 1   e+0 1.02e+3 1.05e 6 9.54e-1 9.54e+2 9.54e+ 5
# #  4 9.77e-4 1   e+0 1.02e 3 9.31e-4 9.31e-1 9.31e+ 2
# #  5 9.54e-7 9.77e-4 1   e 0 9.09e-7 9.09e-4 9.09e- 1
# #  6 1.05e+6 1.07e+9 1.10e12 1   e+6 1   e+9 1   e+12
# #  7 1.05e+3 1.07e+6 1.10e 9 1   e+3 1   e+6 1   e+ 9
# #  8 1.05e+0 1.07e+3 1.10e 6 1   e+0 1   e+3 1   e+ 6
# #  9 1.05e-3 1.07e+0 1.10e 3 1   e-3 1   e+0 1   e+ 3
# # 10 1.05e-6 1.07e-3 1.10e 0 1   e-6 1   e-3 1   e+ 0

do.call(rbind, list_vec) %>% str
do.call(rbind, list_vec)
do.call(rbind, list_vec) %>% as_tibble(rownames = "rowname")
# > do.call(rbind, list_vec) %>% str
#  num [1:6, 1:10] 1.05e+06 1.07e+09 1.10e+12 1.00e+06 1.00e+09 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:6] "2^20" "2^30" "2^40" "10^6" ...
#   ..$ : chr [1:10] "b" "Kb" "Mb" "Gb" ...
# > do.call(rbind, list_vec)
#                  b           Kb           Mb           Gb           Tb            B           kB           MB           GB           TB
# 2^20  1.048576e+06 1.024000e+03 1.000000e+00 9.765625e-04 9.536743e-07 1.048576e+06 1.048576e+03 1.048576e+00 1.048576e-03 1.048576e-06
# 2^30  1.073742e+09 1.048576e+06 1.024000e+03 1.000000e+00 9.765625e-04 1.073742e+09 1.073742e+06 1.073742e+03 1.073742e+00 1.073742e-03
# 2^40  1.099512e+12 1.073742e+09 1.048576e+06 1.024000e+03 1.000000e+00 1.099512e+12 1.099512e+09 1.099512e+06 1.099512e+03 1.099512e+00
# 10^6  1.000000e+06 9.765625e+02 9.536743e-01 9.313226e-04 9.094947e-07 1.000000e+06 1.000000e+03 1.000000e+00 1.000000e-03 1.000000e-06
# 10^9  1.000000e+09 9.765625e+05 9.536743e+02 9.313226e-01 9.094947e-04 1.000000e+09 1.000000e+06 1.000000e+03 1.000000e+00 1.000000e-03
# 10^12 1.000000e+12 9.765625e+08 9.536743e+05 9.313226e+02 9.094947e-01 1.000000e+12 1.000000e+09 1.000000e+06 1.000000e+03 1.000000e+00
# > do.call(rbind, list_vec) %>% as_tibble(rownames = "rowname")
# # A tibble: 6 × 11
#   rowname             b          Kb          Mb          Gb          Tb             B          kB         MB         GB         TB
#   <chr>           <dbl>       <dbl>       <dbl>       <dbl>       <dbl>         <dbl>       <dbl>      <dbl>      <dbl>      <dbl>
# 1 2^20          1048576       1024        1        0.000977 0.000000954       1048576       1049.       1.05    0.00105 0.00000105
# 2 2^30       1073741824    1048576     1024        1        0.000977       1073741824    1073742.    1074.      1.07    0.00107   
# 3 2^40    1099511627776 1073741824  1048576     1024        1           1099511627776 1099511628. 1099512.   1100.      1.10      
# 4 10^6          1000000        977.       0.954    0.000931 0.000000909       1000000       1000        1       0.001   0.000001  
# 5 10^9       1000000000     976562.     954.       0.931    0.000909       1000000000    1000000     1000       1       0.001     
# 6 10^12   1000000000000  976562500   953674.     931.       0.909       1000000000000 1000000000  1000000    1000       1         




## :: f_objectsize_unit.convert2bytes = function(objectsize = 1 * 1024^2, objectsize_unit = c("bytes", "b", "Kb", "Mb", "B", "KiB", "MiB", "KB", "MB", "kB", "MB") ----


f_objectsize_unit.convert2bytes = function(objectsize = 1 * 1024^2, objectsize_unit = c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB", "kB"), objectsize_standard = c("auto", "legacy", "IEC", "SI"), digits = 3L) { 

    if (is.character(objectsize)) {
        'is.character(objectsize)  -->  attempting to deparse into `numeric unit`' |> warning(call. = FALSE, immediate. = TRUE)
        objectsize0 = objectsize
        objectsize = objectsize0 %>% strsplit(" ") %>% unlist() %>% pluck(1) %>% {eval(parse(text = .))}
        objectsize_unit = objectsize0 %>% strsplit(" ") %>% unlist() %>% pluck(2) 
        cat("objectsize = ", deparse(objectsize), "\n")
        cat("objectsize_unit = ", deparse(objectsize_unit), "\n")
    }

    # objectsize_unit = match.arg(objectsize_unit)
    if (length(objectsize_unit) > 1) {
        'length(objectsize_unit) > 1  --> objectsize_unit[1] will be used.' |> warning(call. = FALSE, immediate. = TRUE)
        objectsize_unit = objectsize_unit[1]
    }
    if (length(objectsize_standard) > 1) {
        'length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.' |> warning(call. = FALSE, immediate. = TRUE)
        objectsize_standard = objectsize_standard[1]
    }
    
    if (objectsize_standard == "auto") {
        if (objectsize_unit %in% c("B", "MB", "GB", "TB", "PB", "kB")) {
            'c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.' |> warning(call. = FALSE, immediate. = TRUE)
            objectsize_standard = "legacy"
        # } else if (objectsize_unit %in% c("B", "kB", "MB", "GB", "TB", "PB")) {
        #     objectsize_standard = "SI"
        } else if (objectsize_unit %in% c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB")) {
            objectsize_standard = "legacy"
        } else {
            '!objectsize_unit %in% c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB", "kB")' |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop : ", e$message))
            return(invisible())
        }
    }
    
    if (objectsize_unit == "bytes") objectsize_unit = "b"
    
    objectsize_in_bytes = switch(objectsize_unit,
                                 "b" = objectsize,
                                 "Kb" = objectsize * 1024,
                                 "Mb" = objectsize * 1024^2,
                                 "Gb" = objectsize * 1024^3,
                                 "Tb" = objectsize * 1024^4,
                                 "Pb" = objectsize * 1024^5,
                                 "B" = objectsize,
                                 "KB" = objectsize * 1024,
                                 "MB" = objectsize * 1024^2,
                                 "GB" = objectsize * 1024^3,
                                 "TB" = objectsize * 1024^4,
                                 "PB" = objectsize * 1024^5,
                                 "KiB" = objectsize * 1024,
                                 "MiB" = objectsize * 1024^2,
                                 "GiB" = objectsize * 1024^3,
                                 "TiB" = objectsize * 1024^4,
                                 "PiB" = objectsize * 1024^5,
                                 "kB" = objectsize * 10^3,
                                 "MB" = objectsize * 10^6,
                                 "GB" = objectsize * 10^9,
                                 "TB" = objectsize * 10^12,
                                 "PB" = objectsize * 10^15)
    
    objectsize_in_bytes
}
1 |> f_objectsize_unit.convert2bytes("kb")
1 |> f_objectsize_unit.convert2bytes("Kb")
1 |> f_objectsize_unit.convert2bytes("kB")
1 |> f_objectsize_unit.convert2bytes("Mb")
1 |> f_objectsize_unit.convert2bytes("MB")
"1 kB" %>% f_objectsize_unit.convert2bytes()
# > 1 |> f_objectsize_unit.convert2bytes("kb")
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# stop : !objectsize_unit %in% c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB", "kB")
# > 1 |> f_objectsize_unit.convert2bytes("Kb")
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# [1] 1024
# > 1 |> f_objectsize_unit.convert2bytes("kB")
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
# [1] 1000
# > 1 |> f_objectsize_unit.convert2bytes("Mb")
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# [1] 1048576
# > 1 |> f_objectsize_unit.convert2bytes("MB")
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
# [1] 1048576
# > "1 kB" %>% f_objectsize_unit.convert2bytes()
# Warning: is.character(objectsize)  -->  attempting to deparse into `numeric unit`
# objectsize =  1 
# objectsize_unit =  "kB" 
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
# [1] 1000





#@ Rdev/00_base_program/f_objectsize_unit.create.dev.r ----
## f_objectsize_unit.create = function(objectsize = 1 * 1024^2) ----
f_objectsize_unit.create = function(objectsize = 1 * 1024^2, objectsize_unit = c("bytes", "b", "Kb", "Mb", "Gb", "Tb", "Pb", "KiB", "MiB", "GiB", "TiB", "PiB", "B", "KB", "MB", "GB", "TB", "PB", "kB"), objectsize_standard = c("auto", "legacy", "IEC", "SI"), createRandomNumbers = FALSE, objectname = NULL) { 
    
    objectsize_in_bytes = f_objectsize_unit.convert2bytes(objectsize, objectsize_unit, objectsize_standard)
    f_objectsize_in_bytes.create(objectsize_in_bytes, createRandomNumbers, objectname)
}


1 %>% f_objectsize_unit.create("kB") %>% str()
1 %>% f_objectsize_unit.create("kB") %>% object.size()
# > 1 %>% f_objectsize_unit.create("kB") %>% str()
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
#  num [1:125] 0 0 0 0 0 0 0 0 0 0 ...
# > 1 %>% f_objectsize_unit.create("kB") %>% object.size()
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
# 1048 bytes


"1 kB" %>% f_objectsize_unit.create() %>% str()
"1 kB" %>% f_objectsize_unit.create() %>% object.size()
# > "1 kB" %>% f_objectsize_unit.create() %>% str()
# Warning: is.character(objectsize)  -->  attempting to deparse into `numeric unit`
# objectsize =  1 
# objectsize_unit =  "kB" 
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
#  num [1:125] 0 0 0 0 0 0 0 0 0 0 ...
# > "1 kB" %>% f_objectsize_unit.create() %>% object.size()
# Warning: is.character(objectsize)  -->  attempting to deparse into `numeric unit`
# objectsize =  1 
# objectsize_unit =  "kB" 
# Warning: length(objectsize_standard) > 1  --> objectsize_standard[1] will be used.
# Warning: c("B", "kB", "MB", "GB", "TB", "PB", "kB") could be either "legacy" or "SI" units.  Defaulting to "legacy" units.
# 1048 bytes


