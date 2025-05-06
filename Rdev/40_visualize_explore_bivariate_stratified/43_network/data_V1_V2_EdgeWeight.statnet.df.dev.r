# data_V1_V2_EdgeWeight.statnet.df.dev.r

.tmp$packagename_to_unload = "igraph"
paste0("package:",.tmp$packagename_to_unload)
for (packagename_to_unload in packagename_to_unload) {
    if(paste0("package:",packagename_to_unload) %in% search()) {
        detach(name = paste0("package:",packagename_to_unload), unload = T, character.only = T)
        paste0("detach(name = \"",paste0("package:", packagename_to_unload),"\", unload = T, character.only = T)") |> cat("  \n", sep="")
    } else {
        # paste0("!paste0(\"package:\",", packagename_to_unload,") %in% search()") |> cat("  \n", sep="")
    }
}
library(intergraph)
library(statnet)


## @ test) termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph ------  
load("data/termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph.rda")
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet = 
    termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph %>% asNetwork
save(termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet, file = "data/termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet.rda")

## @ termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> str(max.level = 1, give.attr = TRUE) -----  
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% network.size #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> summary() #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> summary() |> str(max.level = 1, give.attr = TRUE) #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> str(max.level = 1, give.attr = TRUE) #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> str(max.level = 2, give.attr = TRUE) #----
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet #----  
#  Network attributes:
#   vertices = 21 
#   directed = FALSE 
#   hyper = FALSE 
#   loops = FALSE 
#   multiple = FALSE 
#   bipartite = FALSE 
#   total edges= 210 
#     missing edges= 0 
#     non-missing edges= 210 
# 
#  Vertex attribute names: 
#     color label.cex label.color size vertex.names 
# 
#  Edge attribute names: 
#     C color cooccurence R rowname weight width 
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% network.size #----  
# [1] 21
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> summary() #----  
# Network attributes:
#   vertices = 21
#   directed = FALSE
#   hyper = FALSE
#   loops = FALSE
#   multiple = FALSE
#   bipartite = FALSE
#  total edges = 210 
#    missing edges = 0 
#    non-missing edges = 210 
#  density = 1 
# 
# Vertex attributes:
# 
#  color:
#    character valued attribute
#    attribute summary:
# lightblue 
#        21 
# 
#  label.cex:
#    numeric valued attribute
#    attribute summary:
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     0.5     0.5     0.5     0.5     0.5     0.5 
# 
#  label.color:
#    character valued attribute
#    attribute summary:
# black 
#    21 
# 
#  size:
#    numeric valued attribute
#    attribute summary:
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#      25      25      25      25      25      25 
#   vertex.names:
#    character valued attribute
#    21 valid vertex names
# 
# Edge attributes:
# 
#  C:
#    integer valued attribute
#    210values
# 
#  color:
#    character valued attribute
#    attribute summary:
# gray 
#  210 
# 
#  cooccurence:
#    numeric valued attribute
#    attribute summary:
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.000   0.000   1.000   2.452   3.000  34.000 
# 
#  R:
#    integer valued attribute
#    210values
# 
#  rowname:
#    character valued attribute
#    attribute summary:
#    the 10 most common values are:
# R10C11 R10C12 R10C13 R10C14 R10C15 R10C16 R10C17 R10C18 R10C19 R10C20 
#      1      1      1      1      1      1      1      1      1      1 
# 
#  weight:
#    numeric valued attribute
#    attribute summary:
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00000 0.00000 0.02941 0.07213 0.08824 1.00000 
# 
#  width:
#    numeric valued attribute
#    attribute summary:
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.000   0.000   1.029   2.525   3.088  35.000 
# 
# Network edgelist matrix:
#        [,1] [,2]
#   [1,]    1    2
#   [2,]    1    3
#   [3,]    1    4
# 
# 
# 
# [208,]   19   20
# [209,]   19   21
# [210,]   20   21
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> summary() |> str(max.level = 1, give.attr = TRUE) #----  
# List of 5
#  $ mel:List of 210
#  $ gal:List of 10
#  $ val:List of 21
#  $ iel:List of 21
#  $ oel:List of 21
#  - attr(*, "class")= chr "summary.network"
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> str(max.level = 1, give.attr = TRUE) #----  
# List of 5
#  $ mel:List of 210
#  $ gal:List of 7
#  $ val:List of 21
#  $ iel:List of 21
#  $ oel:List of 21
#  - attr(*, "class")= chr "network"
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet |> str(max.level = 2, give.attr = TRUE) #----  
# List of 5
#  $ mel:List of 210
#   ..$ :List of 3
#   ..$ :List of 3
#   ..$ :List of 3
#
#
#
#   ..$ :List of 3
#   ..$ :List of 3
#   ..$ :List of 3
#   .. [list output truncated]
#  $ gal:List of 7
#   ..$ n        : num 21
#   ..$ mnext    : int 211
#   ..$ directed : logi FALSE
#   ..$ hyper    : logi FALSE
#   ..$ loops    : logi FALSE
#   ..$ multiple : logi FALSE
#   ..$ bipartite: logi FALSE
#  $ val:List of 21
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#   ..$ :List of 6
#  $ iel:List of 21
#   ..$ : int(0) 
#   ..$ : int 1
#   ..$ : int [1:2] 2 21
#   ..$ : int [1:3] 3 22 40
#   ..$ : int [1:4] 4 23 41 58
#   ..$ : int [1:5] 5 24 42 59 75
#   ..$ : int [1:6] 6 25 43 60 76 91
#   ..$ : int [1:7] 7 26 44 61 77 92 106
#   ..$ : int [1:8] 8 27 45 62 78 93 107 120
#   ..$ : int [1:9] 9 28 46 63 79 94 108 121 133
#   ..$ : int [1:10] 10 29 47 64 80 95 109 122 134 145
#   ..$ : int [1:11] 11 30 48 65 81 96 110 123 135 146 ...
#   ..$ : int [1:12] 12 31 49 66 82 97 111 124 136 147 ...
#   ..$ : int [1:13] 13 32 50 67 83 98 112 125 137 148 ...
#   ..$ : int [1:14] 14 33 51 68 84 99 113 126 138 149 ...
#   ..$ : int [1:15] 15 34 52 69 85 100 114 127 139 150 ...
#   ..$ : int [1:16] 16 35 53 70 86 101 115 128 140 151 ...
#   ..$ : int [1:17] 17 36 54 71 87 102 116 129 141 152 ...
#   ..$ : int [1:18] 18 37 55 72 88 103 117 130 142 153 ...
#   ..$ : int [1:19] 19 38 56 73 89 104 118 131 143 154 ...
#   ..$ : int [1:20] 20 39 57 74 90 105 119 132 144 155 ...
#  $ oel:List of 21
#   ..$ : int [1:20] 20 19 18 17 16 15 14 13 12 11 ...
#   ..$ : int [1:19] 39 38 37 36 35 34 33 32 31 30 ...
#   ..$ : int [1:18] 57 56 55 54 53 52 51 50 49 48 ...
#   ..$ : int [1:17] 74 73 72 71 70 69 68 67 66 65 ...
#   ..$ : int [1:16] 90 89 88 87 86 85 84 83 82 81 ...
#   ..$ : int [1:15] 105 104 103 102 101 100 99 98 97 96 ...
#   ..$ : int [1:14] 119 118 117 116 115 114 113 112 111 110 ...
#   ..$ : int [1:13] 132 131 130 129 128 127 126 125 124 123 ...
#   ..$ : int [1:12] 144 143 142 141 140 139 138 137 136 135 ...
#   ..$ : int [1:11] 155 154 153 152 151 150 149 148 147 146 ...
#   ..$ : int [1:10] 165 164 163 162 161 160 159 158 157 156
#   ..$ : int [1:9] 174 173 172 171 170 169 168 167 166
#   ..$ : int [1:8] 182 181 180 179 178 177 176 175
#   ..$ : int [1:7] 189 188 187 186 185 184 183
#   ..$ : int [1:6] 195 194 193 192 191 190
#   ..$ : int [1:5] 200 199 198 197 196
#   ..$ : int [1:4] 204 203 202 201
#   ..$ : int [1:3] 207 206 205
#   ..$ : int [1:2] 209 208
#   ..$ : int 210
#   ..$ : int(0) 
#  - attr(*, "class")= chr "network"



## @ termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% components -----  
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% components
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% components
# Node 1, Reach 21, Total 21
# Node 2, Reach 21, Total 42
# Node 3, Reach 21, Total 63
# Node 4, Reach 21, Total 84
# Node 5, Reach 21, Total 105
# Node 6, Reach 21, Total 126
# Node 7, Reach 21, Total 147
# Node 8, Reach 21, Total 168
# Node 9, Reach 21, Total 189
# Node 10, Reach 21, Total 210
# Node 11, Reach 21, Total 231
# Node 12, Reach 21, Total 252
# Node 13, Reach 21, Total 273
# Node 14, Reach 21, Total 294
# Node 15, Reach 21, Total 315
# Node 16, Reach 21, Total 336
# Node 17, Reach 21, Total 357
# Node 18, Reach 21, Total 378
# Node 19, Reach 21, Total 399
# Node 20, Reach 21, Total 420
# Node 21, Reach 21, Total 441
# [1] 1

## @ termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() %>% {.$gdist} %>% max -----  
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() |> str() #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() %>% {.$gdist} %>% max #----
lgc = termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% component.largest(result="graph") #----
lgc %>% geodist() %>% {.$gdist} %>% max #----
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() #----
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() |> str() #----  
# List of 2
#  $ counts: num [1:21, 1:21] 1 1 1 1 1 1 1 1 1 1 ...
#  $ gdist : num [1:21, 1:21] 0 1 1 1 1 1 1 1 1 1 ...
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() %>% {.$gdist} %>% max #----  
# [1] 1
# > lgc = termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% component.largest(result="graph") #----  
# Node 1, Reach 21, Total 21
# Node 2, Reach 21, Total 42
# Node 3, Reach 21, Total 63
# Node 4, Reach 21, Total 84
# Node 5, Reach 21, Total 105
# Node 6, Reach 21, Total 126
# Node 7, Reach 21, Total 147
# Node 8, Reach 21, Total 168
# Node 9, Reach 21, Total 189
# Node 10, Reach 21, Total 210
# Node 11, Reach 21, Total 231
# Node 12, Reach 21, Total 252
# Node 13, Reach 21, Total 273
# Node 14, Reach 21, Total 294
# Node 15, Reach 21, Total 315
# Node 16, Reach 21, Total 336
# Node 17, Reach 21, Total 357
# Node 18, Reach 21, Total 378
# Node 19, Reach 21, Total 399
# Node 20, Reach 21, Total 420
# Node 21, Reach 21, Total 441
# > lgc %>% geodist() %>% {.$gdist} %>% max #----  
# [1] 1
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% geodist() #----  
# $counts
#       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21]
#  [1,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [2,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [3,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [4,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [5,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [6,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [7,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [8,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [9,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [10,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [11,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [12,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [13,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [14,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [15,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [16,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [17,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [18,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [19,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [20,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# [21,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
# 
# $gdist
#       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21]
#  [1,]    0    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [2,]    1    0    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [3,]    1    1    0    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [4,]    1    1    1    0    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [5,]    1    1    1    1    0    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [6,]    1    1    1    1    1    0    1    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [7,]    1    1    1    1    1    1    0    1    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [8,]    1    1    1    1    1    1    1    0    1     1     1     1     1     1     1     1     1     1     1     1     1
#  [9,]    1    1    1    1    1    1    1    1    0     1     1     1     1     1     1     1     1     1     1     1     1
# [10,]    1    1    1    1    1    1    1    1    1     0     1     1     1     1     1     1     1     1     1     1     1
# [11,]    1    1    1    1    1    1    1    1    1     1     0     1     1     1     1     1     1     1     1     1     1
# [12,]    1    1    1    1    1    1    1    1    1     1     1     0     1     1     1     1     1     1     1     1     1
# [13,]    1    1    1    1    1    1    1    1    1     1     1     1     0     1     1     1     1     1     1     1     1
# [14,]    1    1    1    1    1    1    1    1    1     1     1     1     1     0     1     1     1     1     1     1     1
# [15,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     0     1     1     1     1     1     1
# [16,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     0     1     1     1     1     1
# [17,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     0     1     1     1     1
# [18,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     0     1     1     1
# [19,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     0     1     1
# [20,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     0     1
# [21,]    1    1    1    1    1    1    1    1    1     1     1     1     1     1     1     1     1     1     1     1     0


## @ termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %v% 'vertex.names' -----  
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %v% 'vertex.names'
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %v% 'vertex.names'
#  [1] "analysis"     "applications" "code"         "computing"    "data"         "examples"     "introduction"
#  [8] "mining"       "network"      "package"      "parallel"     "positions"    "postdoctoral" "r"           
# [15] "research"     "series"       "slides"       "social"       "time"         "tutorial"     "users"       

## @ termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% degree(gmode = "graph") -----  
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% degree(gmode = "graph")
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% degree(gmode = "graph")
#  [1] 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20


object_statnet.summary_df = function(object_statnet) {
    # detach("package:igraph", unload=TRUE)
    .tmp$packagename_to_unload = "igraph"
    paste0("package:",.tmp$packagename_to_unload)
    for (packagename_to_unload in packagename_to_unload) {
        if(paste0("package:",packagename_to_unload) %in% search()) {
            detach(name = paste0("package:",packagename_to_unload), unload = T, character.only = T)
            paste0("detach(name = \"",paste0("package:", packagename_to_unload),"\", unload = T, character.only = T)") |> cat("  \n", sep="")
        } else {
            # paste0("!paste0(\"package:\",", packagename_to_unload,") %in% search()") |> cat("  \n", sep="")
        }
    }
    .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    .packagename = "intergraph"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    .packagename = "statnet"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    out.df = data.frame(vertex.names = (object_statnet %v% 'vertex.names'))
    out.df$degree = object_statnet %>% degree(gmode = "graph")
    out.df$closeness = object_statnet %>% closeness(gmode = "graph")
    out.df$betweenness = object_statnet %>% betweenness(gmode = "graph")
    out.df=out.df[order(out.df$closeness, decreasing = T),]
    out.df
}
termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% object_statnet.summary_df
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.statnet %>% object_statnet.summary_df
#    vertex.names degree closeness betweenness
# 1      analysis     20         1           0
# 2  applications     20         1           0
# 3          code     20         1           0
# 4     computing     20         1           0
# 5          data     20         1           0
# 6      examples     20         1           0
# 7  introduction     20         1           0
# 8        mining     20         1           0
# 9       network     20         1           0
# 10      package     20         1           0
# 11     parallel     20         1           0
# 12    positions     20         1           0
# 13 postdoctoral     20         1           0
# 14            r     20         1           0
# 15     research     20         1           0
# 16       series     20         1           0
# 17       slides     20         1           0
# 18       social     20         1           0
# 19         time     20         1           0
# 20     tutorial     20         1           0
# 21        users     20         1           0




  
  
# __________|------  
# 〚〛 END-----  
