# Run This.r

for (packagename in c("tidyverse", "openxlsx")) {
    if(!require(packagename, character.only = T)) {install.packages(packagename); require(packagename, character.only = T)}
}
dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
dput(l10n_info()) #----
dput(.Platform) #----
dput(Sys.info()) #----


library(tidyverse)
Population.df <- readRDS("Population.df.rds")
DistanceMatrix <- readRDS("DistanceMatrix.rds")
ODMatrix <- readRDS("ODMatrix.rds")
ODMatrix.marginDF <- readRDS("ODMatrix.marginDF.rds")
kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2 = readRDS("kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2.rds")




source("function.MK.ClinicCluster.source190512v4clean.r")



#@ function.MK.output.nest_sigungu.Seoul11$Min.SC$Max.Distance$Min.Pop$sigungu_cd from input ============================================
t0 = Sys.time(); t0
if(!exists("function.MK.output.nest_sigungu.Seoul11")) function.MK.output.nest_sigungu.Seoul11 = list()
for (Min.SC in c(0.4, 0.5)) {
    if(!paste0("Min.SC", Min.SC) %in% names(function.MK.output.nest_sigungu.Seoul11)) function.MK.output.nest_sigungu.Seoul11[[paste0("Min.SC", Min.SC)]] = list()
    for (Max.Distance in c(10, 30)) {
        if(!paste0("Max.Distance", Max.Distance) %in% names(function.MK.output.nest_sigungu.Seoul11[[paste0("Min.SC", Min.SC)]])) function.MK.output.nest_sigungu.Seoul11[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]] = list()
        for (Min.Pop in c(10000, 30000)) {
            print(Sys.time())
            print(paste0("Min.SC", Min.SC, "$", "Max.Distance", Max.Distance, "$", "Min.Pop", Min.Pop))
            if(is.null(function.MK.output.nest_sigungu.Seoul11[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]][[paste0("Min.Pop", Min.Pop)]])) {
                function.MK.output.nest_sigungu.Seoul11[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]][[paste0("Min.Pop", Min.Pop)]] = list()
            }
            for (
                i.sigungu_cd in 
                kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2 %>% filter(SIDO_CD == "11") %>% {.$sigungu_cd} %>% as.character %>% unique
            ) {
                print(i.sigungu_cd)
                Population.df = kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2 %>% 
                    filter(sigungu_cd == i.sigungu_cd) %>% {.$Population.df} %>% {if(length(.) == 1) out = .[[1]] else out = bind_rows(.); out}
                ODMatrix = kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2 %>% filter(sigungu_cd == i.sigungu_cd) %>% {.$ODMatrix} %>% {if(length(.) == 1) out = .[[1]] else out = bind_rows(.); out} %>% as.matrix
                DistanceMatrix = kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2 %>% filter(sigungu_cd == i.sigungu_cd) %>% {.$DistanceMatrix} %>% {if(length(.) == 1) out = .[[1]] else out = bind_rows(.); out} %>% as.matrix
                ODMatrix.marginDF.filter = ODMatrix.marginDF %>% filter(sigungu_cd == i.sigungu_cd)
                
                function.MK.output.nest_sigungu.Seoul11[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]][[paste0("Min.Pop", Min.Pop)]][[
                    as.character(i.sigungu_cd)
                    ]] =
                    function.MK.ClinicCluster(
                        input.PopulationDF = Population.df %>% mutate(Code = Code %>% as.character, Pop = Pop %>% as.integer) %>% as.data.frame
                        , input.DistanceMatrix = DistanceMatrix
                        , input.ODMatrix = ODMatrix
                        , input.ODMatrix.marginDF = ODMatrix.marginDF.filter
                        , Min.SC = Min.SC
                        , Max.Distance = Max.Distance
                        , Min.Pop = Min.Pop
                        , print.iteration = F
                    )
            }
        }
    }
}
Sys.time() - t0
warnings() #----
saveRDS(function.MK.output.nest_sigungu.Seoul11, "function.MK.output.nest_sigungu.Seoul11.rds")







#@ function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows ================
function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows =
    function.MK.output.nest_sigungu.Seoul11 %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(list_iteration_sigungu_code) {
                list_iteration_sigungu_code %>% map(function(list_output) {
                    list_output[[length(list_output)]]$CodeDF.new
                }) %>% bind_rows
            })
        })
    })
saveRDS(function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows, "function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.rds")






#@ function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows ----
function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows =
    function.MK.output.nest_sigungu.Seoul11 %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(list_iteration_sigungu_code) {
                list_iteration_sigungu_code %>% map(function(list_output) {
                    list_output[[length(list_output)]]$Cluster.tbl
                }) %>% bind_rows
            })
        })
    })
saveRDS(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows, "function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.rds")






#@ function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.Korean ======

kormaps2014_kormap321.codebook = readRDS("kormaps2014_kormap321.codebook.rds")

function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.Korean = 
    function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(df) {
                out = df %>% mutate(
                    SIDO_CD = Code.Cluster %>% substr(1, 2)
                    , sigungu_cd = Code.Cluster %>% substr(1, 5)
                ) %>% left_join(
                    kormaps2014_kormap321.codebook %>% select(SIDO_CD, SIDO_NM, sigungu_cd, sigungu_nm, adm_dr_cd, adm_dr_nm) %>% 
                        rename(Code.Cluster = adm_dr_cd)
                ) %>% 
                    select(SIDO_CD, SIDO_NM, sigungu_cd, sigungu_nm, Code.Cluster, adm_dr_nm, everything(), -matches("^V[1-9]+")) %>% 
                    as.tibble
                out = out %>% bind_cols(
                    df %>% select(matches("^V[1-9]+")) %>% 
                        map_df(function(vec) {
                            tbl = tibble(adm_dr_cd = vec) %>% left_join(
                                kormaps2014_kormap321.codebook %>%
                                    mutate(adm_dr_cd_nm = paste(adm_dr_cd, adm_dr_nm)) %>%
                                    select(adm_dr_cd, adm_dr_cd_nm)
                                , by = "adm_dr_cd"
                            )
                            out = tbl$adm_dr_cd_nm
                        }) %>%
                        as.tibble
                )
                out
            })
        })
    })
saveRDS(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.Korean, "function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.Korean.rds")



#@ function.MK.output.nest_sigungu.Seoul11$i$j$k[CodeDF, Cluster.tbl].xlsx ============
dir.create("output")
for (i in names(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows)) {
    for (j in names(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows[[i]])) {
        for (k in names(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows[[i]][[j]])) {
            openxlsx::write.xlsx(
                list(
                    CodeDF.bind_rows = function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows[[i]][[j]][[k]]
                    , Cluster.tbl.bind_rows = function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows[[i]][[j]][[k]]
                    , Cluster.tbl.bind_rows.Korean = function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.Korean[[i]][[j]][[k]]
                    , kormaps2014_kormap321.codebook = kormaps2014_kormap321.codebook
                )
                , file.path("output", paste0("function.MK.output.nest_sigungu.Seoul11", "$", i, "$", j, "$", k, "[CodeDF, Cluster.tbl]", ".xlsx"))
                , asTable = T
            )
        }
    }
}



#@ function.MK.output.nest_sigungu.Seoul11.metadata =====
function.MK.output.nest_sigungu.Seoul11.metadata =    
    function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(df) {
                df %>% summarise(
                    n_Cluster = n()
                    , Pop.Cluster.median.min.max = paste0(median(Pop.Cluster) %>% round(2), " [", min(Pop.Cluster) %>% round(2), ", ", max(Pop.Cluster) %>% round(2), "]")
                    , OD.diag_rowSums.median.min.max = paste0(median(OD.diag_rowSums) %>% round(2), " [", min(OD.diag_rowSums) %>% round(2), ", ", max(OD.diag_rowSums) %>% round(2), "]")
                    , OD.diag_colSums.median.min.max = paste0(median(OD.diag_colSums) %>% round(2), " [", min(OD.diag_colSums) %>% round(2), ", ", max(OD.diag_colSums) %>% round(2), "]")
                    , Max.Distance.withinCluster.median.min.max = paste0(median(Max.Distance.withinCluster) %>% round(2), " [", min(Max.Distance.withinCluster) %>% round(2), ", ", max(Max.Distance.withinCluster) %>% round(2), "]")
                    , n_Code.median.min.max = paste0(median(n_Code) %>% round(2), " [", min(n_Code) %>% round(2), ", ", max(n_Code) %>% round(2), "]")
                    , Pop.Cluster.mean = mean(Pop.Cluster)
                    , Pop.Cluster.sd = sd(Pop.Cluster)
                    , Pop.Cluster.min = min(Pop.Cluster)
                    , Pop.Cluster.median = median(Pop.Cluster)
                    , Pop.Cluster.max = max(Pop.Cluster)
                    , OD.diag_rowSums.mean = mean(OD.diag_rowSums)
                    , OD.diag_rowSums.sd = sd(OD.diag_rowSums)
                    , OD.diag_rowSums.min = min(OD.diag_rowSums)
                    , OD.diag_rowSums.median = median(OD.diag_rowSums)
                    , OD.diag_rowSums.max = max(OD.diag_rowSums)
                    , OD.diag_colSums.mean = mean(OD.diag_colSums)
                    , OD.diag_colSums.sd = sd(OD.diag_colSums)
                    , OD.diag_colSums.min = min(OD.diag_colSums)
                    , OD.diag_colSums.median = median(OD.diag_colSums)
                    , OD.diag_colSums.max = max(OD.diag_colSums)  
                    , Max.Distance.withinCluster.mean = mean(Max.Distance.withinCluster)
                    , Max.Distance.withinCluster.sd = sd(Max.Distance.withinCluster)
                    , Max.Distance.withinCluster.min = min(Max.Distance.withinCluster)
                    , Max.Distance.withinCluster.median = median(Max.Distance.withinCluster)
                    , Max.Distance.withinCluster.max = max(Max.Distance.withinCluster)
                    , n_Code.mean = mean(n_Code)
                    , n_Code.sd = sd(n_Code)
                    , n_Code.min = min(n_Code)
                    , n_Code.median = median(n_Code)
                    , n_Code.max = max(n_Code)
                )
            }) %>% bind_rows(.id = "Min.Pop")
        }) %>% bind_rows(.id = "Max.Distance")
    }) %>% bind_rows(.id = "Min.SC")
saveRDS(function.MK.output.nest_sigungu.Seoul11.metadata, "function.MK.output.nest_sigungu.Seoul11.metadata.rds")
openxlsx::write.xlsx(function.MK.output.nest_sigungu.Seoul11.metadata, "function.MK.output.nest_sigungu.Seoul11.metadata.xlsx", asTable = T)



#@ function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map =====
function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map = 
    function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(CodeDF.new) {
                out = kormaps2014_kormap121321.nest_sigungu.input.list_EMD2014v2 %>% 
                    filter(SIDO_CD == "11")
                out = out %>% mutate(
                    data.kormap321 = data.kormap321 %>% map(function(df) {
                        df = df %>% mutate(Code = adm_dr_cd %>% as.character) %>% left_join(CodeDF.new)
                    })
                )
                out
            })
        })
    })
saveRDS(function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map, "function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map.rds")




#@ function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$i$j$k.pdf =====
Sys.setlocale("LC_ALL", "korean") #----
pdf.options(family = "Batang-Regular")
pdf.options(family = "Korea1deb")
dir.create("output")
t0 = Sys.time()
for (i in names(function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map)) {
    for (j in names(function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map[[i]])) {
        for (k in names(function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map[[i]][[j]])) {
            function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map[[i]][[j]][[k]] %>% filter(SIDO_CD == "11") %>% {
                ggplot(data = .$data.kormap321 %>% bind_rows) +
                    geom_polygon(
                        data = .$data.kormap1 %>% bind_rows
                        , aes(x=long, y=lat, group=group)
                        , fill = NA
                        , color='black'
                    ) +
                    geom_polygon(
                        data = .$data.kormap21 %>% bind_rows %>% mutate(name = sigungu_nm.CP949)
                        , aes(x=long, y=lat, group=group)
                        , color='black', size = 2
                        , fill = NA
                    ) +
                    geom_polygon(
                        data = .$data.kormap321 %>% bind_rows %>%
                            mutate(
                                name = adm_dr_nm.CP949
                                , code_name = paste(code, name)
                                , ColorIndex6 = factor({(as.integer(Code.new) - 1) %% 6 + 1}, labels = c(2, 6, 3, 4, 1, 5))
                                , ColorIndex9 = factor({(as.integer(Code.new) - 1) %% 9 + 1}, labels = c(3, 9, 5, 6, 2, 4, 8, 7, 1))
                                , ColorIndex12 = factor({(as.integer(Code.new) - 1) %% 12 + 1}, labels = c(4, 5, 6, 9, 2, 7, 10, 12, 3, 1, 11, 8))
                            )
                        , aes(x=long, y=lat, group=group, fill = ColorIndex12)
                        , alpha = 0.5
                        # , show.legend = FALSE
                        , color='black'
                    ) +
                    geom_text(
                        data = .$data.kormap321 %>% bind_rows %>%
                            mutate(
                                name = adm_dr_nm.CP949
                                , code_name = paste0(code, "\n", name)
                            ) %>% group_by(code_name) %>% summarise(long = mean(long), lat = mean(lat))
                        , aes(x = long, y = lat, label = code_name)
                        , size = 2
                    ) + theme(legend.position = "none") # + theme_void()
                ggsave(file.path("output", paste0("function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$", i, "$", j, "$", k, ".pdf")), width = 32, height = 24)
                
            }
            print(Sys.time() - t0)
        }
    }
}


#@ end ============



