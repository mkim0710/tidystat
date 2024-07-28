# function.ggplot.ORCI.dev.r


# https://github.com/cardiomoon/moonBook/blob/master/R/ORplot.R

# https://api.rpubs.com/robincrlee/broom-coef
library(broom)
library(ggplot2)
a <- 5
b <- 3
set.seed(1)
x1 <- rnorm(1000, 40, 25)
x2 <- rep(seq(1:100), 10)
n_over <- sum()
# x2[x2>70] <- rnorm()
e <- rnorm(1000, 5, 10)

y <-a*x1 - b*x2 + e
data <- data.frame(y,x1,x2)

m1 <- lm(y ~ ., data)
coef <- tidy(m1, conf.int = TRUE)
coef

ggplot(coef, aes(term, estimate))+
  geom_point()+
  geom_pointrange(aes(ymin = conf.low, ymax = conf.high))+
  labs(title = "Coefficients of a linear regression model")







#@ AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI$full_join = ====
AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI$full_join = 
    AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI %>% map(function(input_object_name_of_map_function_to_investigate) {
        # Codes to insert inside in the beginning annonymous function for map
        parent.x = get(".x", envir = parent.frame())
        i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, input_object_name_of_map_function_to_investigate) } ))
        
        # # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
        # print(Sys.time())
        #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
        cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))
        
        out = input_object_name_of_map_function_to_investigate %>% 
            mutate(
                tmp = paste0(ORCI, ", p=", p_value) |> str_replace_all("=<", "<")
            ) %>% 
            select(rowname, tmp)
        names(out)[2] = names(parent.x)[i]
        out
    }) %>% reduce(full_join)
AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI |> str() #-----
# > AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI |> str() #-----
# List of 6
#  $ glm_LC_Stage234_1var:'data.frame':	6 obs. of  14 variables:
#   ..$ rowname      : chr [1:6] "(Intercept)" "PM25.tn1m.floor_month.cut[16,36)" "PM25.tn1m.floor_month.cut[36,76)" "PM25.tn1m_tn12m.mean.quartile[22.1,23.7)" ...
#   ..$ ORCI         : chr [1:6] "1.39 (1.31 ~ 1.48)" "0.99 (0.94 ~ 1.05)" "1.07 (0.95 ~ 1.21)" "0.98 (0.91 ~ 1.05)" ...
#   ..$ p_value      : chr [1:6] "<0.001" "0.821" "0.240" "0.619" ...
#   ..$ star         : chr [1:6] "***" "   " "   " "   " ...
#   ..$ p.fdr        : chr [1:6] "<0.001" "0.938" "0.721" "0.938" ...
#   ..$ *fdr         : chr [1:6] "***" "   " "   " "   " ...
#   ..$ p.bon        : chr [1:6] "<0.001" "1.000" "1.000" "1.000" ...
#   ..$ *bon         : chr [1:6] "***" "   " "   " "   " ...
#   ..$ exp(Estimate): num [1:6] 1.391 0.993 1.073 0.982 1.004 ...
#   ..$ exp(2.5 %)   : num [1:6] 1.31 0.937 0.954 0.914 0.935 ...
#   ..$ exp(97.5 %)  : num [1:6] 1.48 1.05 1.21 1.05 1.08 ...
#   ..$ Std. Error   : num [1:6] 0.0307 0.03 0.06 0.0364 0.0367 ...
#   ..$ t value      : num [1:6] 10.759 -0.227 1.174 -0.498 0.12 ...
#   ..$ Pr(>|t|)     : num [1:6] 5.87e-26 8.21e-01 2.40e-01 6.19e-01 9.05e-01 ...
#  $ glm_LC_Stage234_2var:'data.frame':	7 obs. of  14 variables:
#   ..$ rowname      : chr [1:7] "(Intercept)" "PM25.tn1m.floor_month.cut[16,36)" "PM25.tn1m.floor_month.cut[36,76)" "PM25.tn1m_tn12m.mean.quartile[22.1,23.7)" ...
#   ..$ ORCI         : chr [1:7] "1.33 (1.13 ~ 1.57)" "0.99 (0.94 ~ 1.05)" "1.07 (0.95 ~ 1.21)" "0.98 (0.91 ~ 1.05)" ...
#   ..$ p_value      : chr [1:7] "<0.001" "0.844" "0.238" "0.623" ...
#   ..$ star         : chr [1:7] "***" "   " "   " "   " ...
#   ..$ p.fdr        : chr [1:7] "0.005" "0.938" "0.833" "0.938" ...
#   ..$ *fdr         : chr [1:7] "** " "   " "   " "   " ...
#   ..$ p.bon        : chr [1:7] "0.005" "1.000" "1.000" "1.000" ...
#   ..$ *bon         : chr [1:7] "** " "   " "   " "   " ...
#   ..$ exp(Estimate): num [1:7] 1.329 0.994 1.073 0.982 1.004 ...
#   ..$ exp(2.5 %)   : num [1:7] 1.128 0.937 0.954 0.915 0.935 ...
#   ..$ exp(97.5 %)  : num [1:7] 1.57 1.05 1.21 1.05 1.08 ...
#   ..$ Std. Error   : num [1:7] 0.0837 0.03 0.06 0.0364 0.0368 ...
#   ..$ t value      : num [1:7] 3.401 -0.197 1.18 -0.492 0.118 ...
#   ..$ Pr(>|t|)     : num [1:7] 0.000691 0.843729 0.238092 0.622596 0.905863 ...
#  $ glm_LC_Stage234_3var:'data.frame':	8 obs. of  14 variables:
#   ..$ rowname      : chr [1:8] "(Intercept)" "PM25.tn1m.floor_month.cut[16,36)" "PM25.tn1m.floor_month.cut[36,76)" "PM25.tn1m_tn12m.mean.quartile[22.1,23.7)" ...
#   ..$ ORCI         : chr [1:8] "1.32 (1.12 ~ 1.56)" "0.99 (0.94 ~ 1.05)" "1.08 (0.96 ~ 1.21)" "0.98 (0.91 ~ 1.06)" ...
#   ..$ p_value      : chr [1:8] "<0.001" "0.826" "0.227" "0.625" ...
#   ..$ star         : chr [1:8] "***" "   " "   " "   " ...
#   ..$ p.fdr        : chr [1:8] "0.007" "0.921" "0.906" "0.921" ...
#   ..$ *fdr         : chr [1:8] "** " "   " "   " "   " ...
#   ..$ p.bon        : chr [1:8] "0.007" "1.000" "1.000" "1.000" ...
#   ..$ *bon         : chr [1:8] "** " "   " "   " "   " ...
#   ..$ exp(Estimate): num [1:8] 1.322 0.993 1.075 0.982 1.004 ...
#   ..$ exp(2.5 %)   : num [1:8] 1.122 0.937 0.956 0.915 0.934 ...
#   ..$ exp(97.5 %)  : num [1:8] 1.56 1.05 1.21 1.06 1.08 ...
#   ..$ Std. Error   : num [1:8] 0.084 0.03 0.06 0.0364 0.0368 ...
#   ..$ t value      : num [1:8] 3.326 -0.221 1.21 -0.49 0.106 ...
#   ..$ Pr(>|t|)     : num [1:8] 0.000906 0.825514 0.22656 0.624509 0.915225 ...
#  $ glm_LC_Stage234_4var:'data.frame':	11 obs. of  14 variables:
#   ..$ rowname      : chr [1:11] "(Intercept)" "PM25.tn1m.floor_month.cut[16,36)" "PM25.tn1m.floor_month.cut[36,76)" "PM25.tn1m_tn12m.mean.quartile[22.1,23.7)" ...
#   ..$ ORCI         : chr [1:11] "1.27 (1.06 ~ 1.51)" "0.99 (0.94 ~ 1.05)" "1.08 (0.96 ~ 1.21)" "0.98 (0.91 ~ 1.05)" ...
#   ..$ p_value      : chr [1:11] "0.010" "0.816" "0.203" "0.583" ...
#   ..$ star         : chr [1:11] "*  " "   " "   " "   " ...
#   ..$ p.fdr        : chr [1:11] "0.114" "0.987" "0.669" "0.987" ...
#   ..$ *fdr         : chr [1:11] "   " "   " "   " "   " ...
#   ..$ p.bon        : chr [1:11] "0.114" "1.000" "1.000" "1.000" ...
#   ..$ *bon         : chr [1:11] "   " "   " "   " "   " ...
#   ..$ exp(Estimate): num [1:11] 1.266 0.993 1.08 0.98 1.002 ...
#   ..$ exp(2.5 %)   : num [1:11] 1.057 0.936 0.959 0.912 0.932 ...
#   ..$ exp(97.5 %)  : num [1:11] 1.51 1.05 1.21 1.05 1.08 ...
#   ..$ Std. Error   : num [1:11] 0.0917 0.0301 0.0602 0.0365 0.0368 ...
#   ..$ t value      : num [1:11] 2.5684 -0.2329 1.2725 -0.5496 0.0544 ...
#   ..$ Pr(>|t|)     : num [1:11] 0.0103 0.8159 0.2034 0.5827 0.9566 ...
#  $ glm_LC_Stage234_5var:'data.frame':	18 obs. of  14 variables:
#   ..$ rowname      : chr [1:18] "(Intercept)" "PM25.tn1m.floor_month.cut[16,36)" "PM25.tn1m.floor_month.cut[36,76)" "PM25.tn1m_tn12m.mean.quartile[22.1,23.7)" ...
#   ..$ ORCI         : chr [1:18] "1.31 (1.03 ~ 1.67)" "1.00 (0.94 ~ 1.06)" "1.08 (0.96 ~ 1.22)" "0.99 (0.92 ~ 1.06)" ...
#   ..$ p_value      : chr [1:18] "0.028" "0.902" "0.181" "0.677" ...
#   ..$ star         : chr [1:18] "*  " "   " "   " "   " ...
#   ..$ p.fdr        : chr [1:18] "0.248" "0.955" "0.814" "0.955" ...
#   ..$ *fdr         : chr [1:18] "   " "   " "   " "   " ...
#   ..$ p.bon        : chr [1:18] "0.497" "1.000" "1.000" "1.000" ...
#   ..$ *bon         : chr [1:18] "   " "   " "   " "   " ...
#   ..$ exp(Estimate): num [1:18] 1.312 0.996 1.083 0.985 0.992 ...
#   ..$ exp(2.5 %)   : num [1:18] 1.031 0.94 0.964 0.918 0.924 ...
#   ..$ exp(97.5 %)  : num [1:18] 1.67 1.06 1.22 1.06 1.07 ...
#   ..$ Std. Error   : num [1:18] 0.1232 0.0297 0.0595 0.0361 0.0364 ...
#   ..$ t value      : num [1:18] 2.205 -0.123 1.339 -0.416 -0.22 ...
#   ..$ Pr(>|t|)     : num [1:18] 0.0276 0.9021 0.1809 0.6771 0.8261 ...
#  $ full_join         :'data.frame':	18 obs. of  6 variables:
#   ..$ rowname           : chr [1:18] "(Intercept)" "PM25.tn1m.floor_month.cut[16,36)" "PM25.tn1m.floor_month.cut[36,76)" "PM25.tn1m_tn12m.mean.quartile[22.1,23.7)" ...
#   ..$ glm_LC_Stage234_1var: chr [1:18] "1.39 (1.31 ~ 1.48), p<0.001" "0.99 (0.94 ~ 1.05), p=0.821" "1.07 (0.95 ~ 1.21), p=0.240" "0.98 (0.91 ~ 1.05), p=0.619" ...
#   ..$ glm_LC_Stage234_2var: chr [1:18] "1.33 (1.13 ~ 1.57), p<0.001" "0.99 (0.94 ~ 1.05), p=0.844" "1.07 (0.95 ~ 1.21), p=0.238" "0.98 (0.91 ~ 1.05), p=0.623" ...
#   ..$ glm_LC_Stage234_3var: chr [1:18] "1.32 (1.12 ~ 1.56), p<0.001" "0.99 (0.94 ~ 1.05), p=0.826" "1.08 (0.96 ~ 1.21), p=0.227" "0.98 (0.91 ~ 1.06), p=0.625" ...
#   ..$ glm_LC_Stage234_4var: chr [1:18] "1.27 (1.06 ~ 1.51), p=0.010" "0.99 (0.94 ~ 1.05), p=0.816" "1.08 (0.96 ~ 1.21), p=0.203" "0.98 (0.91 ~ 1.05), p=0.583" ...
#   ..$ glm_LC_Stage234_5var: chr [1:18] "1.31 (1.03 ~ 1.67), p=0.028" "1.00 (0.94 ~ 1.06), p=0.902" "1.08 (0.96 ~ 1.22), p=0.181" "0.99 (0.92 ~ 1.06), p=0.677" ...




#@ ggplot ======

for (
    i in c("glm_LC_Stage234_1var", "glm_LC_Stage234_2var", "glm_LC_Stage234_3var", "glm_LC_Stage234_4var", "glm_LC_Stage234_5var", "glm_LC_Stage234_7var")
) {
    
    g = AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI[[i]] %>% 
        dplyr::filter(grepl("PM25.tn1m_tn12m.mean.quartile", rowname)) %>% 
        add_row(rowname = " Reference", `exp(Estimate)` = 1, .before = 1) %>% 
        mutate(rowname = paste(c("1st", "2nd", "3rd", "4th"), "quartile")) %>% 
        ggplot(aes(x = rowname, y = `exp(Estimate)`)) + 
        geom_hline(aes(yintercept = 1), linetype = "dashed") +
        geom_point() + geom_errorbar(aes(ymin = `exp(2.5 %)`, ymax = `exp(97.5 %)`), width=0.1)
    g
    g+theme_bw()+theme(legend.position="bottom")
    g+labs(x = "PM25.tn1m_tn12m.mean.quartile")
    
    filename = paste0("AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI", "$", i, "$", "PM25.tn1m_tn12m.mean.quartile", ".ggplot")
    ggsave(paste0(filename, ".pdf"), width=8, height = 6)
}
    



#@ end -----



getwd()
.path4write = getwd()
objectname = "AnalyticDataset200621.nonsmoker.glm_LC_Stage234_list.ORCI"
# write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds")), compress="gz", compression=9 )
openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE)
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))












