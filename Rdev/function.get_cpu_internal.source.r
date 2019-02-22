

library(parallel)
detectCores()
# > library(parallel)
# > detectCores()
# [1] 8



# https://github.com/cran/benchmarkme/blob/master/R/timing_mean.R
remove_white = function(x) gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)

# https://github.com/cran/benchmarkme/blob/master/R/get_cpu.R

function.get_cpu_internal = function() {
    os = R.version$os
    if(length(grep("^linux", os))) {
        cmd  = "awk '/vendor_id/' /proc/cpuinfo"
        vendor_id = gsub("vendor_id\t: ", "", unique(system(cmd, intern=TRUE)))
        cmd  = "awk '/model name/' /proc/cpuinfo"
        model_name = gsub("model name\t: ", "", unique(system(cmd, intern=TRUE)))
    } else if(length(grep("^darwin", os))) {
        vendor_id = system("sysctl -n machdep.cpu.vendor", intern=TRUE) # nocov
        model_name = system("sysctl -n machdep.cpu.brand_string", intern=TRUE) # nocov
    } else if(length(grep("^solaris", os))) {
        vendor_id = NA # nocov
        model_name = NA # nocov
    } else {
        ## CPU
        model_name = system("wmic cpu get name", intern=TRUE)[2] # nocov
        vendor_id = system("wmic cpu get manufacturer", intern=TRUE)[2] # nocov
    }
    list(vendor_id=remove_white(vendor_id), 
         model_name = remove_white(model_name), 
         no_of_cores = parallel::detectCores())
}
function.get_cpu_internal()
# > function.get_cpu_internal()
# $vendor_id
# [1] "GenuineIntel"
# 
# $model_name
# [1] "Intel(R) Core(TM) i7-6770HQ CPU @ 2.60GHz"
# 
# $no_of_cores
# [1] 8

# https://github.com/cran/benchmarkme/blob/master/R/get_ram.R
system_ram = function(os) {
    if(length(grep("^linux", os))) {
        cmd = "awk '/MemTotal/ {print $2}' /proc/meminfo"
        ram = system(cmd, intern=TRUE)
    } else if(length(grep("^darwin", os))) {
        ram = substring(system("sysctl hw.memsize", intern = TRUE), 13) #nocov
    } else if(length(grep("^solaris", os))) {
        cmd = "prtconf | grep Memory" # nocov
        ram = system(cmd, intern=TRUE) ## Memory size: XXX Megabytes # nocov
    } else {
        ram = system("wmic MemoryChip get Capacity", intern=TRUE)[-1] # nocov
    }
    ram
}
function.get_ram = function() {
    os = R.version$os
    ram = suppressWarnings(try(system_ram(os), silent = TRUE))
    if(class(ram) == "try-error" || length(ram) == 0) {
        message("\t Unable to detect your RAM. # nocov
            Please raise an issue at https://github.com/csgillespie/benchmarkme") # nocov
        ram = structure(NA, names="ram") # nocov
    } else {
        cleaned_ram = suppressWarnings(try(clean_ram(ram,os), silent=TRUE))
        if(class(cleaned_ram) == "try-error" || length(ram) == 0) {
            message("\t Unable to detect your RAM. # nocov 
            Please raise an issue at https://github.com/csgillespie/benchmarkme") # nocov
            ram = structure(NA, names="ram") #nocov
        } else {
            ram = structure(cleaned_ram, class = "bytes", names="ram")
        }
    }
    return(ram)
}
function.get_ram()







####
library(benchmarkme)
library(tidyverse)

get_cpu() %>% str
get_ram() %>% str
get_platform_info() %>% str
get_r_version() %>% str
Sys.info() %>% as.list %>% str
# > get_cpu() %>% str
# List of 3
# $ vendor_id  : chr "GenuineIntel"
# $ model_name : chr "Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz"
# $ no_of_cores: int 32
# > get_ram() %>% str
# Class 'bytes'  Named num 3.38e+11
# ..- attr(*, "names")= chr "ram"
# > get_platform_info() %>% str
# List of 8
# $ OS.type   : chr "unix"
# $ file.sep  : chr "/"
# $ dynlib.ext: chr ".so"
# $ GUI       : chr "RStudio"
# $ endian    : chr "little"
# $ pkgType   : chr "source"
# $ path.sep  : chr ":"
# $ r_arch    : chr ""
# > get_r_version() %>% str
# List of 14
# $ platform      : chr "x86_64-pc-linux-gnu"
# $ arch          : chr "x86_64"
# $ os            : chr "linux-gnu"
# $ system        : chr "x86_64, linux-gnu"
# $ status        : chr ""
# $ major         : chr "3"
# $ minor         : chr "4.3"
# $ year          : chr "2017"
# $ month         : chr "11"
# $ day           : chr "30"
# $ svn rev       : chr "73796"
# $ language      : chr "R"
# $ version.string: chr "R version 3.4.3 (2017-11-30)"
# $ nickname      : chr "Kite-Eating Tree"








    
    
#@ end -----
