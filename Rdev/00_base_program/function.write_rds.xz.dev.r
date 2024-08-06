

fun.read_and_write_rds <- function(filename, compress = c("none", "gz", "bz2", "xz")) {
  # Set the default compress method and ensure the user input is one of the allowed choices
  compress <- match.arg(compress)

  # Check if the file is either .rds or .rda
  if (grepl("\\.[rR][dD][sS]$", filename)) {
    objectname <- gsub("\\.[rR][dD][sS]$", "", filename)
    object <- readRDS(filename)
  } else if (grepl("\\.[rR][dD][aA]$", filename)) {
    # Loading .rda file
    env = new.env()
    load(filename, env)
    objectnames <- ls(env)

    # Check if there's exactly one object in the .rda file
    if (length(objectnames) != 1) {
      stop("The .rda file must contain exactly one object")
    }
    objectname <- objectnames[1]
    object <- get(objectname, envir = env)
  } else {
    stop("The file must be either .rds or .rda")
  }

  # Save the data using write_rds
  write_rds(object, paste0(objectname,".rds"), compress = compress)
}





#@ -------  

objectname = "os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014"
.t0 = Sys.time()
write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")) )
Sys.time() - .t0
system(paste0( 'xz -9 --threads=10 "', objectname, ".rds", '"' ))  # no --keep just in case using git
Sys.time() - .t0

system("git pull")
system("git add .")
system('git commit -m "automatic commit using system()"')
system("git push")



#@ -------  
# .t0 = Sys.time()
# write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")), "xz", compression=9L )
# Sys.time() - .t0


#@ -------  
.path4read = "../data/data.ID_DATE_DX.distinct/"
.path4write = "../data/data.ID_DATE_DX.distinct/"

objectname = "os.ID_DATE_DX.distinct.gather_DX.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.lmp_le2014"
.t0 = Sys.time()
write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")) )
Sys.time() - .t0
system(paste0( 'xz --keep -9 --threads=10 "', file.path(.path4write, paste0(objectname,".rds")), '"' ))
Sys.time() - .t0



#@ -------  

# .t0 = Sys.time()
# write_rds(ID_Covariates.tbl, "ID_Covariates.tbl(v38).rds", "xz", compression=9)
# Sys.time() - .t0
# # > .t0 = Sys.time()
# # > write_rds(ID_Covariates.tbl, "ID_Covariates.tbl(v38).rds", "xz", compression=9)
# # > Sys.time() - .t0
# # Time difference of 3.1327 mins


.t0 = Sys.time()
write_rds(ID_Covariates.tbl, "ID_Covariates.tbl(v38).rds")
Sys.time() - .t0
system(paste0('xz --keep -9 --threads=10 "', 'ID_Covariates.tbl(v38).rds', '"'))
Sys.time() - .t0
# > .t0 = Sys.time()
# > write_rds(ID_Covariates.tbl, "ID_Covariates.tbl(v38).rds")
# > Sys.time() - .t0
# Time difference of 3.41479 secs
# > .t0 = Sys.time()
# > system(paste0('xz --keep -9 --threads=10 "', 'ID_Covariates.tbl(v38).rds', '"'))
# > Sys.time() - .t0
# Time difference of 1.115018 mins


#@ end ----  
