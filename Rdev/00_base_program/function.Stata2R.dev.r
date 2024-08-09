

haven::read_stata()

str(give.attr = F)

# stata.covariates.list.sort.unequal.clean from stata.covariates.list.sort.unequal .r

# @ tmp.vector2 ====  
tmp.vector2 <- tmp.vector
# grep("Q_bool", tmp.vector2)
tmp.vector2 <- gsub("^i.", "", tmp.vector2)
tmp.vector2 <- gsub("Q_bool$", "", tmp.vector2)
tmp.vector2 <- gsub("Q$", "", tmp.vector2)
tmp.vector2 <- gsub("total_days`var'_ASPIRIN", "", tmp.vector2)
tmp.vector2 <- gsub("NSAIDASPIRIN", "", tmp.vector2)
tmp.vector2 <- gsub("SEX_F_M", "", tmp.vector2)
tmp.vector2 <- unique(tmp.vector2)
tmp.vector2 <- sort(tmp.vector2)
# tmp.vector2[tmp.vector2==""] <- NA
# tmp.vector2 <- na.omit(tmp.vector2)
tmp.vector2 <- tmp.vector2[tmp.vector2 != ""]
tmp.vector2



