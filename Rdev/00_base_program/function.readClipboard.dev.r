

# https://www.dummies.com/programming/r/how-to-use-the-clipboard-to-copy-and-paste-data-in-r/

library(tidyverse)

readClipboard() |> dput() #----
# > readClipboard() |> dput() #----
# c("667\t2\t0\t0", "267\t7\t0\t0", "14\t83\t2\t1", "4\t18\t1\t0", 
# "2\t13\t69\t1", "0\t1\t1\t22", "4\t12\t0\t184")

read.table(file = "clipboard", sep = "\t", header=F) |> dput() #----
# structure(list(V1 = c(667L, 267L, 14L, 4L, 2L, 0L, 4L), V2 = c(2L, 
# 7L, 83L, 18L, 13L, 1L, 12L), V3 = c(0L, 0L, 2L, 1L, 69L, 1L, 
# 0L), V4 = c(0L, 0L, 1L, 0L, 1L, 22L, 184L)), class = "data.frame", row.names = c(NA, 
# -7L))

tribble_paste = datapasta::tribble_paste
# read.table(file = "clipboard", sep = "\t", header=F) %>% tribble_paste #----
tibble::tribble(
   ~V1, ~V2, ~V3,  ~V4,
  667L,  2L,  0L,   0L,
  267L,  7L,  0L,   0L,
   14L, 83L,  2L,   1L,
    4L, 18L,  1L,   0L,
    2L, 13L, 69L,   1L,
    0L,  1L,  1L,  22L,
    4L, 12L,  0L, 184L
  )


# https://www.johndcook.com/blog/r_excel_clipboard/
objectname %>% writeClipboard
objectname %>% write.table("clipboard", sep="\t", row.names=F, col.names=T)




#@ nBreakdown.list =====
nBreakdown.list = list()
nBreakdown.list$Cohort                                  = ID_Criteria.lgl.tbl %>% nrow
nBreakdown.list$Cohort1845                              = ID_Criteria.lgl.tbl %>% dplyr::filter(Age_at_lmp %in% 18:45) %>% nrow
nBreakdown.list$Cohort1845AnyDM                         = ID_Criteria.lgl.tbl %>% dplyr::filter(Age_at_lmp %in% 18:45) %>% dplyr::filter(Inc2.ia.1) %>% nrow
nBreakdown.list$Cohort1845PregestationalDM              = ID_Criteria.lgl.tbl %>% dplyr::filter(Age_at_lmp %in% 18:45) %>% dplyr::filter(Inc2.ia.1) %>% dplyr::filter(Inc2.ia.2) %>% nrow
nBreakdown.list$Cohort1845PregestationalDMtype1         = ID_Criteria.lgl.tbl %>% dplyr::filter(Age_at_lmp %in% 18:45) %>% dplyr::filter(Inc2.ia.1) %>% dplyr::filter(Inc2.ia.2) %>% dplyr::filter(!Inc2.ia.3) %>% nrow
nBreakdown.list$Cohort1845PregestationalDMtype2         = ID_Criteria.lgl.tbl %>% dplyr::filter(Age_at_lmp %in% 18:45) %>% dplyr::filter(Inc2.ia.1) %>% dplyr::filter(Inc2.ia.2) %>% dplyr::filter(Inc2.ia.3) %>% dplyr::filter(Inc2.ia.4) %>% nrow
nBreakdown.list$Cohort1845PregestationalDMunspecified   = ID_Criteria.lgl.tbl %>% dplyr::filter(Age_at_lmp %in% 18:45) %>% dplyr::filter(Inc2.ia.1) %>% dplyr::filter(Inc2.ia.2) %>% dplyr::filter(Inc2.ia.3) %>% dplyr::filter(!Inc2.ia.4) %>% nrow
nBreakdown.list |> str() #----
# nBreakdown.list %>% as.matrix %>% as.data.frame %>% rownames_to_column %>% write.table("clipboard", sep="\t", row.names=F, col.names=T)  # error: list -> matrix of lists -> dataframe of list columns
# nBreakdown.list %>% t %>% t %>% as.data.frame %>% rownames_to_column %>% write.table("clipboard", sep="\t", row.names=F, col.names=T)  # error: list -> matrix of lists -> dataframe of list columns
nBreakdown.list %>% as.data.frame %>% t %>% as.data.frame %>% rownames_to_column %>% write.table("clipboard", sep="\t", row.names=F, col.names=T)
nBreakdown.list %>% as.data.frame %>% t %>% as.data.frame %>% rownames_to_column %>% tribble_paste




#@ end ----
