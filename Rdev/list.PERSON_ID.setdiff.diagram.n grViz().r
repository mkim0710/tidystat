# list.PERSON_ID.setdiff.diagram.n grViz().r
# https://github.com/mkim0710/tidystat/edit/master/Rdev/list.PERSON_ID.setdiff.diagram.n%20grViz().r

library(tidyverse)
list.PERSON_ID.setdiff = read_rds("list.PERSON_ID.setdiff.rds")
list.PERSON_ID.setdiff |> str() #----
# > list.PERSON_ID.setdiff |> str() #----
# List of 8
#  $ temp2:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp3:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp4:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp5:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE
#  $ temp6:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:211655] "30761968" "30826346" "31100750" "31269616" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp7:List of 7
#   ..$ vec1       : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:12560] "10008958" "10012253" "10018712" "10018767" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp8:List of 7
#   ..$ vec1       : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:2449] "10011773" "10032231" "10033962" "10041103" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp9:List of 7
#   ..$ vec1       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr(0) 
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi TRUE

list.PERSON_ID.setdiff.keep =
    list.PERSON_ID.setdiff %>% keep(function(ls) !ls$identical)
list.PERSON_ID.setdiff.keep |> str() #----
# > list.PERSON_ID.setdiff.keep |> str() #----
# List of 3
#  $ temp6:List of 7
#   ..$ vec1       : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:211655] "30761968" "30826346" "31100750" "31269616" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp7:List of 7
#   ..$ vec1       : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:12560] "10008958" "10012253" "10018712" "10018767" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE
#  $ temp8:List of 7
#   ..$ vec1       : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ vec2       : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ union      : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ intersect  : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...
#   ..$ setdiff_1_2: chr [1:2449] "10011773" "10032231" "10033962" "10041103" ...
#   ..$ setdiff_2_1: chr(0) 
#   ..$ identical  : logi FALSE


list.PERSON_ID.setdiff.keep %>% map(function(ls) {
    print(paste0(length(ls$vec1)," = ",length(ls$vec2)," + ",length(ls$setdiff_1_2)))
    print(length(ls$vec1) == length(ls$vec2) + length(ls$setdiff_1_2))
})
# > list.PERSON_ID.setdiff.keep %>% map(function(ls) {
# +     print(paste0(length(ls$vec1)," = ",length(ls$vec2)," + ",length(ls$setdiff_1_2)))
# +     print(length(ls$vec1) == length(ls$vec2) + length(ls$setdiff_1_2))
# + })
# [1] "264777 = 53122 + 211655"
# [1] TRUE
# [1] "53122 = 40562 + 12560"
# [1] TRUE
# [1] "40562 = 38113 + 2449"
# [1] TRUE
# $temp6
# [1] TRUE
# 
# $temp7
# [1] TRUE
# 
# $temp8
# [1] TRUE



#@ list.PERSON_ID.setdiff.diagram =====
list.PERSON_ID.setdiff.diagram = list()
for (i in 1:length(list.PERSON_ID.setdiff.keep)) {
    list.PERSON_ID.setdiff.diagram[[paste0("n", i-1)]] = list.PERSON_ID.setdiff.keep[[i]]$vec1
    list.PERSON_ID.setdiff.diagram[[paste0("setdiff_", i-1, "_", i)]] = list.PERSON_ID.setdiff.keep[[i]]$setdiff_1_2
    list.PERSON_ID.setdiff.diagram[[paste0("n", i)]] = list.PERSON_ID.setdiff.keep[[i]]$vec2
}
list.PERSON_ID.setdiff.diagram |> str() #-----
# > list.PERSON_ID.setdiff.diagram |> str() #-----
# List of 7
#  $ n0         : chr [1:264777] "10000084" "10001637" "10004213" "10006065" ...
#  $ setdiff_0_1: chr [1:211655] "30761968" "30826346" "31100750" "31269616" ...
#  $ n1         : chr [1:53122] "10000084" "10001637" "10004213" "10006065" ...
#  $ setdiff_1_2: chr [1:12560] "10008958" "10012253" "10018712" "10018767" ...
#  $ n2         : chr [1:40562] "10000084" "10001637" "10004213" "10006065" ...
#  $ setdiff_2_3: chr [1:2449] "10011773" "10032231" "10033962" "10041103" ...
#  $ n3         : chr [1:38113] "10000084" "10001637" "10004213" "10006065" ...

list.PERSON_ID.setdiff.diagram.n =
    list.PERSON_ID.setdiff.diagram %>% map(length)
list.PERSON_ID.setdiff.diagram.n |> str()
# > list.PERSON_ID.setdiff.diagram.n |> str()
# List of 7
#  $ n0         : int 264777
#  $ setdiff_0_1: int 211655
#  $ n1         : int 53122
#  $ setdiff_1_2: int 12560
#  $ n2         : int 40562
#  $ setdiff_2_3: int 2449
#  $ n3         : int 38113











#@ library(DiagrammeR) -----------
library(DiagrammeR)
out.grViz = DiagrammeR::grViz(paste0('
digraph G {
    // Global attributes
    rankdir=TB
    node [shape=box, style="rounded"]

    // Define the nodes with fixed width
    Total [label="Total population\nn = ', format(list.PERSON_ID.setdiff.diagram.n$n0, big.mark = ","), '", width=3, fixedsize=true]
    Exclusion1 [label="Exclusion1\nn = ', format(list.PERSON_ID.setdiff.diagram.n$setdiff_0_1, big.mark = ","), '", width=3, fixedsize=true]
    Selection1 [label="Selection1\nn = ', format(list.PERSON_ID.setdiff.diagram.n$n1, big.mark = ","), '", width=3, fixedsize=true]
    Exclusion2 [label="Exclusion2\nn = ', format(list.PERSON_ID.setdiff.diagram.n$setdiff_1_2, big.mark = ","), '", width=3, fixedsize=true]
    Selection2 [label="Selection2\nn = ', format(list.PERSON_ID.setdiff.diagram.n$n2, big.mark = ","), '", width=3, fixedsize=true]
    Exclusion3 [label="Exclusion3\nn = ', format(list.PERSON_ID.setdiff.diagram.n$setdiff_2_3, big.mark = ","), '", width=3, fixedsize=true]
    Selection3 [label="Selection3\nn = ', format(list.PERSON_ID.setdiff.diagram.n$n3, big.mark = ","), '", width=3, fixedsize=true]

    // Define the edges
    Total -> Selection1 [weight=10]
    Total -> Exclusion1 [style="dashed"]

    Selection1 -> Selection2 [weight=10]
    Selection1 -> Exclusion2 [style="dashed"]

    Selection2 -> Selection3 [weight=10]
    Selection2 -> Exclusion3 [style="dashed"]

    // Use a subgraph to align Selection1 and Exclusion1 horizontally
    subgraph cluster_1 { style=invis; rank=same; Selection1; Exclusion1; }
    subgraph cluster_2 { style=invis; rank=same; Selection2; Exclusion2; }
    subgraph cluster_3 { style=invis; rank=same; Selection3; Exclusion3; }
}
'))
out.grViz





library(DiagrammeRsvg)
out.grViz.svg <- DiagrammeRsvg::export_svg(out.grViz)

out.filename = "out.grViz.svg"
rsvg::rsvg_pdf(charToRaw(out.grViz.svg), paste0(out.filename, ".pdf"))
rsvg::rsvg_png(charToRaw(out.grViz.svg), paste0(out.filename, ".png"))



#@ end ----
objectname = "list.PERSON_ID.setdiff.diagram"
.path4write = getwd()
system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="xz", compression=9 ))



