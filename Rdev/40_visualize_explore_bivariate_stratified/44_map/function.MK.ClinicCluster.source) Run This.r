# Run This (SouthKorea) v6.r



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ Global Parameters) Users should take care of this. -----  
vector_of_Min.SC = c(0.4, 0.5, 0.6, 0.7, 0.8)
vector_of_Max.Distance = c(20, 30, 60, 120)
vector_of_Min.Pop = c(1000)

filename.function.source = "function.MK.ClinicCluster.v6clean.r"
software.version = "v6"
area.level = "SouthKorea"


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## @ Global Parameters) Automatically calculated. -----  
name.subscript = paste0(".", area.level, ".", software.version)
path.output = paste0("output", name.subscript)
if(area.level == "SouthKorea") SIDO_CD4filter = c("11", "21", "22", "23", "24", "25", "26", "29", "31", "32", "33", "34", "35", "36", "37", "38", "39")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  


for(.packagename in c("tidyverse", "openxlsx2")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}
dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
dput(l10n_info()) #----
dput(.Platform) #----
dput(Sys.info()) #----


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
Population.df0 <- readRDS("Population.df.rds")
DistanceMatrix0 <- readRDS("DistanceMatrix.rds")
ODMatrix0 <- readRDS("ODMatrix.rds")
ODMatrix.marginDF0 = 
    ODMatrix0 %>% {
        full_join(
            tibble(
                Code = rownames(.)
                , rowSums = rowSums(., na.rm = T)
            )
            , tibble(
                Code = colnames(.)
                , colSums = colSums(., na.rm = T)
            )
        )
    } %>% mutate(
        SIDO_CD = Code %>% substr(1, 2) |> as.factor()
        , SGG_CD = Code %>% substr(1, 5) |> as.factor()
    )





source(filename.function.source)

## @ function.MK.output.nest_sigungu.SouthKorea$Min.SC$Max.Distance$Min.Pop$SGG_CD from input ................................................................................  
.t0 = Sys.time(); t0
if(!exists("function.MK.output.nest_sigungu.SouthKorea")) function.MK.output.nest_sigungu.SouthKorea = list()
for (Min.SC in vector_of_Min.SC) {
    if(!paste0("Min.SC", Min.SC) %in% names(function.MK.output.nest_sigungu.SouthKorea)) function.MK.output.nest_sigungu.SouthKorea[[paste0("Min.SC", Min.SC)]] = list()
    for (Max.Distance in vector_of_Max.Distance) {
        if(!paste0("Max.Distance", Max.Distance) %in% names(function.MK.output.nest_sigungu.SouthKorea[[paste0("Min.SC", Min.SC)]])) function.MK.output.nest_sigungu.SouthKorea[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]] = list()
        for (Min.Pop in vector_of_Min.Pop) {
            print(Sys.time())
            print(paste0("Min.SC", Min.SC, "$", "Max.Distance", Max.Distance, "$", "Min.Pop", Min.Pop))
            if(is.null(function.MK.output.nest_sigungu.SouthKorea[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]][[paste0("Min.Pop", Min.Pop)]])) {
                function.MK.output.nest_sigungu.SouthKorea[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]][[paste0("Min.Pop", Min.Pop)]] = list()
            }
            for (
                i.SGG_CD in 
                Population.df0 %>% 
                dplyr::filter(SIDO_CD %in% SIDO_CD4filter) %>% 
                {.$SGG_CD} |> as.character() |> unique()
            ) {
                cat(paste0("\n#", i.SGG_CD))
                # cat(paste0("..#", i.SGG_CD))
                i.Population.df = Population.df0 %>% dplyr::filter(SGG_CD == i.SGG_CD)
                i.DistanceMatrix = 
                    DistanceMatrix0[
                        DistanceMatrix0 %>% rownames %>% substr(1, 5) == as.character(i.SGG_CD)
                        ,
                        DistanceMatrix0 %>% colnames %>% substr(1, 5) == as.character(i.SGG_CD) 
                        ]
                i.ODMatrix = 
                    ODMatrix0[
                        ODMatrix0 %>% rownames %>% substr(1, 5) == as.character(i.SGG_CD)
                        ,
                        ODMatrix0 %>% colnames %>% substr(1, 5) == as.character(i.SGG_CD) 
                        ]
                i.ODMatrix.marginDF = ODMatrix.marginDF0 %>% dplyr::filter(SGG_CD == i.SGG_CD)
                
                function.MK.output.nest_sigungu.SouthKorea[[paste0("Min.SC", Min.SC)]][[paste0("Max.Distance", Max.Distance)]][[paste0("Min.Pop", Min.Pop)]][[
                    as.character(i.SGG_CD)
                    ]] =
                    function.MK.ClinicCluster(
                        input.PopulationDF = i.Population.df %>% mutate(Code = Code %>% as.character, Pop = Pop %>% as.integer) |> as.data.frame()
                        , input.DistanceMatrix = i.DistanceMatrix
                        , input.ODMatrix = i.ODMatrix
                        , input.ODMatrix.marginDF = i.ODMatrix.marginDF
                        , Min.SC = Min.SC
                        , Max.Distance = Max.Distance
                        , Min.Pop = Min.Pop
                        , print.iteration = T
                    )
            }
        }
    }
}
Sys.time() - .t0
warnings() #----
dir.create(path.output, showWarnings = F)
saveRDS(function.MK.output.nest_sigungu.SouthKorea, file.path(path.output, "function.MK.output.nest_sigungu.SouthKorea.rds"))






## @ function.MK.output.nest_sigungu.SouthKorea.list3_CodeDF.bind_rows ================  
function.MK.output.nest_sigungu.SouthKorea.list3_CodeDF.bind_rows =
    function.MK.output.nest_sigungu.SouthKorea %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(list_iteration_sigungu_code) {
                list_iteration_sigungu_code %>% map(function(list_output) {
                    list_output[[length(list_output)]]$CodeDF.new
                }) %>% bind_rows
            })
        })
    })
dir.create(path.output, showWarnings = F)
saveRDS(function.MK.output.nest_sigungu.SouthKorea.list3_CodeDF.bind_rows, file.path(path.output, "function.MK.output.nest_sigungu.SouthKorea.list3_CodeDF.bind_rows.rds"))






## @ function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows ----  
function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows =
    function.MK.output.nest_sigungu.SouthKorea %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(list_iteration_sigungu_code) {
                list_iteration_sigungu_code %>% map(function(list_output) {
                    list_output[[length(list_output)]]$Cluster.tbl
                }) %>% bind_rows
            })
        })
    })
# path.output = "output.SouthKorea"
# dir.create(path.output, showWarnings = F)
# saveRDS(function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows, file.path(path.output, "function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows.rds"))






## @ function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows.Korean ======  
Population.df0 = readRDS("Population.df.rds")
function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows.Korean = 
    function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(df) {
                out = df %>% mutate(
                    SIDO_CD = Code.Cluster %>% substr(1, 2)
                    , SGG_CD = Code.Cluster %>% substr(1, 5)
                ) %>% left_join(
                    Population.df0 %>% select(SIDO_CD, SIDO_NM, SGG_CD, SGG_NM, EMD_CD, EMD_NM) |> 
                        rename(Code.Cluster = EMD_CD)
                    , by = c("Code.Cluster", "SIDO_CD", "SGG_CD")
                ) %>% 
                    select(SIDO_CD, SIDO_NM, SGG_CD, SGG_NM, Code.Cluster, EMD_NM, everything(), -matches("^V[1-9]+")) %>% 
                    as_tibble
                out = out %>% bind_cols(
                    df %>% select(matches("^V[1-9]+")) %>% 
                        map_df(function(vec) {
                            tbl = tibble(EMD_CD = vec) %>% left_join(
                                Population.df0 %>%
                                    mutate(EMD_CD_NM = paste(EMD_CD, EMD_NM)) %>%
                                    select(EMD_CD, EMD_CD_NM)
                                , by = "EMD_CD"
                            )
                            out = tbl$EMD_CD_NM
                        }) %>%
                        as_tibble
                )
                out
            })
        })
    })
dir.create(path.output, showWarnings = F)
saveRDS(function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows.Korean, file.path(path.output, "function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows.Korean.rds"))





## @ function.MK.output.nest_sigungu.SouthKorea$i$j$k[CodeDF, Cluster.tbl].xlsx ============  
dir.create(path.output, showWarnings = F)
for (i in names(function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows)) {
    for (j in names(function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows[[i]])) {
        for (k in names(function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows[[i]][[j]])) {
            openxlsx2::write_xlsx(
                list(
                    CodeDF.bind_rows = function.MK.output.nest_sigungu.SouthKorea.list3_CodeDF.bind_rows[[i]][[j]][[k]]
                    , Cluster.tbl.bind_rows = function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows[[i]][[j]][[k]]
                    , Cluster.tbl.bind_rows.Korean = function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows.Korean[[i]][[j]][[k]]
                    # , Population.df = Population.df0
                )
                , file.path(path.output, paste0("function.MK.output.nest_sigungu.SouthKorea", "$", i, "$", j, "$", k, "[CodeDF, Cluster.tbl]", ".xlsx"))
                , as_table=TRUE
            )
        }
    }
}



## @ function.MK.output.nest_sigungu.SouthKorea.metadata =====  
function.MK.output.nest_sigungu.SouthKorea.metadata =    
    function.MK.output.nest_sigungu.SouthKorea.list3_Cluster.tbl.bind_rows %>% map(function(ls2) {
        ls2 %>% map(function(ls) {
            ls %>% map(function(df) {
                df %>% summarise(
                    n_Cluster = n()
                    , Pop.Cluster.median.min.max = paste0(median(Pop.Cluster) %>% round(2), " [", min(Pop.Cluster) %>% round(2), ", ", max(Pop.Cluster) %>% round(2), "]")
                    , OD.diag_rowP.median.min.max = paste0(median(OD.diag_rowP) %>% round(2), " [", min(OD.diag_rowP) %>% round(2), ", ", max(OD.diag_rowP) %>% round(2), "]")
                    , OD.diag_colP.median.min.max = paste0(median(OD.diag_colP) %>% round(2), " [", min(OD.diag_colP) %>% round(2), ", ", max(OD.diag_colP) %>% round(2), "]")
                    , Max.Distance.withinCluster.median.min.max = paste0(median(Max.Distance.withinCluster) %>% round(2), " [", min(Max.Distance.withinCluster) %>% round(2), ", ", max(Max.Distance.withinCluster) %>% round(2), "]")
                    , n_Code.median.min.max = paste0(median(n_Code) %>% round(2), " [", min(n_Code) %>% round(2), ", ", max(n_Code) %>% round(2), "]")
                    , Pop.Cluster.mean = mean(Pop.Cluster)
                    , Pop.Cluster.sd = sd(Pop.Cluster)
                    , Pop.Cluster.min = min(Pop.Cluster)
                    , Pop.Cluster.median = median(Pop.Cluster)
                    , Pop.Cluster.max = max(Pop.Cluster)
                    , OD.diag_rowP.mean = mean(OD.diag_rowP)
                    , OD.diag_rowP.sd = sd(OD.diag_rowP)
                    , OD.diag_rowP.min = min(OD.diag_rowP)
                    , OD.diag_rowP.median = median(OD.diag_rowP)
                    , OD.diag_rowP.max = max(OD.diag_rowP)
                    , OD.diag_colP.mean = mean(OD.diag_colP)
                    , OD.diag_colP.sd = sd(OD.diag_colP)
                    , OD.diag_colP.min = min(OD.diag_colP)
                    , OD.diag_colP.median = median(OD.diag_colP)
                    , OD.diag_colP.max = max(OD.diag_colP)  
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
dir.create(path.output, showWarnings = F)
saveRDS(function.MK.output.nest_sigungu.SouthKorea.metadata, file.path(path.output, "function.MK.output.nest_sigungu.SouthKorea.metadata.rds"))
openxlsx2::write_xlsx(function.MK.output.nest_sigungu.SouthKorea.metadata, file.path(path.output, "function.MK.output.nest_sigungu.SouthKorea.metadata.xlsx"), as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2)













  
  
# __________|------  
# @@ END============  



