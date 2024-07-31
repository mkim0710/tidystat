# data_V1_V2_EdgeWeight.igraph.dev.r

# ?scale
data_V1_V2_EdgeWeight.igraph = function(
    df.V1_V2_EdgeWeight
    , out.name.prefix = deparse(substitute(df.V1_V2_EdgeWeight))
    , varname4V1 = colnames(df.V1_V2_EdgeWeight)[1]
    , varname4V2 = colnames(df.V1_V2_EdgeWeight)[2]
    , varname4weight = "weight"
    , varname4edgeColor_vector0to1 = NULL
    , edgeColor_vector0to1.by.weight = FALSE
    , edgeColor_vector0to1.colorRampPalette = colorRampPalette(c("red", "yellow", "springgreen", "royalblue"))(101)
    , varname.edgeColor.Red = NULL
    , varname.edgeColor.Orange = NULL
    , varname.edgeColor.Green = NULL
    , varname.edgeColor.Blue = NULL
    , varname.edgeColor.Purple = NULL
    , varname.edgeColor.DarkGray = NULL
    , varname.edgeColor.Black = NULL
    , vertex.color.default = rgb(r=159, g=159, b=159, maxColorValue=255, alpha=255)
    , name4vertex.color.tomato = NULL
    , name4vertex.color.yellow = NULL
    , name4vertex.color.lightblue = NULL
    , vertex.size.default = 20
    , vertex.size.multiplier = 1
    , vertex.label.df = NULL
    , weight.max.scale1 = TRUE
    , weight.multiplier = 30
    , directed = TRUE, vertices = NULL
    , layouts = c("layout.fruchterman.reingold", "layout.circle")
    , vertice = NULL
    , out.png.pdf = F
    , out.png.pdf.path = "Rplot/"
    , out.graphic.device = T
    , par.mfrow.device = c(1,2)
    , par.mar.device = c(.5,.5,.5,.5)
    , seed = 1
) {
    # , edge.color = rgb(0.5, 0.5, 0.5)
    # , edge.width=5 * ( E(g)$weight - min(E(g)$weight) ) / ( max(E(g)$weight) - min(E(g)$weight)
    
    # , edge.width=5 * E(g)$weight / max(E(g)$weight)
    # , edge.color = c(rgb(.5,0,0,.8), rgb(0,0,.5,.8))[(E(g)$weight > 0) + 1]
    
    .tmp$packagename_to_unload = "statnet"
    for (packagename_to_unload in packagename_to_unload) {
        if(paste0("package:",packagename_to_unload) %in% search()) {
            detach(name = paste0("package:",packagename_to_unload), unload = T, character.only = T)
            paste0("detach(name = \"",paste0("package:", packagename_to_unload),"\", unload = T, character.only = T)") |> cat("  \n", sep="")
        } else {
            # paste0("!paste0(\"package:\",", packagename_to_unload,") %in% search()") |> cat("  \n", sep="")
        }
    }
    library(tidyverse)
    library(igraph)
    par.mfrow.original = par()$mfrow
    par.mar.original = par()$mar
    
    # browser() 
    # Browse[2]> out.name.prefix
    # [1] "."
    # Browse[2]> identical(get(".", envir = parent.frame()), df.V1_V2_EdgeWeight)
    # [1] TRUE
    # Browse[2]> ls(envir = parent.frame(), all.names = T)
    # [1] "."
    # Browse[2]> ls(envir = parent.frame(n = 2), all.names = T)
    # [1] "function_list" "i"             "k"             "value"
    # Browse[2]> ls(envir = parent.frame(n = 3), all.names = T)
    # [1] "value"
    # Browse[2]> ls(envir = parent.frame(n = 4), all.names = T)
    # [1] "_fseq"          "_function_list" "_lhs"           "freduce"
    # Browse[2]> ls(envir = parent.frame(n = 5), all.names = T)
    # [1] "enclos" "envir"  "expr"
    # Browse[2]> ls(envir = parent.frame(n = 6), all.names = T)
    # [1] "chain_parts" "env"         "lhs"         "parent"      "pipes"       "rhs"         "rhss"
    # Browse[2]> ls(envir = parent.frame(n = 7), all.names = T)
    # [1] ".Random.seed"                              "data_V1_V2_EdgeWeight.igraph"              "termDocMatrix"
    # [4] "termDocMatrix.t.df"                        "termDocMatrix.t.df.lgl.comat"                  "termDocMatrix.t.df.lgl.comat.gather"
    # [7] "termDocMatrix.t.df.lgl.comat.gather.lower.tri" "termDocMatrix.t.df.lgl.comat.gather.upper.tri"
    # Browse[2]> ls(envir=.GlobalEnv)
    # [1] "data_V1_V2_EdgeWeight.igraph"              "termDocMatrix"                             "termDocMatrix.t.df"
    # [4] "termDocMatrix.t.df.lgl.comat"                  "termDocMatrix.t.df.lgl.comat.gather"           "termDocMatrix.t.df.lgl.comat.gather.lower.tri"
    # [7] "termDocMatrix.t.df.lgl.comat.gather.upper.tri"
    # 
    # # ls(envir = globalenv()) %>% map_lgl(function(x) identical(get(x, envir=.GlobalEnv), get(".", envir = parent.frame())))
    # ls(envir = globalenv()) %>% map_lgl(function(x) identical(get(x, envir=.GlobalEnv), get(".", envir = parent.frame())))
    # Browse[2]> ls(envir = globalenv()) %>% map_lgl(function(x) identical(get(x, envir=.GlobalEnv), get(".", envir = parent.frame(n = 2))))
    # [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    # Browse[2]> ls(envir = globalenv()) %>% map_lgl(function(x) identical(get(x, envir=.GlobalEnv), df.V1_V2_EdgeWeight))
    # [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    
    if(out.name.prefix == ".") {
        print(paste0("Caution: out.name.prefix == \".\") "))
        warning(paste0("Caution: out.name.prefix == \".\") "))
        out.name.prefix.tmp = ls(envir = globalenv())[{ ls(envir = globalenv()) %>% map_lgl(function(x) identical(get(x, envir=.GlobalEnv), df.V1_V2_EdgeWeight)) }]
        if (length(out.name.prefix.tmp) == 0) {
            print(paste0("Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) failed..."))
        } else if (length(out.name.prefix.tmp) == 1) {
            print(paste0("Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) ", out.name.prefix.tmp))
            out.name.prefix = out.name.prefix.tmp
            print(paste0("Caution) using \"", out.name.prefix, "\" as out.name.prefix"))
            warning(paste0("Caution) using \"", out.name.prefix, "\" as out.name.prefix"))
        } else {
            print(paste0("Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) multiple guess... ", deparse(out.name.prefix.tmp)))
            out.name.prefix = out.name.prefix.tmp[{out.name.prefix.tmp %>% map_dbl(nchar) %>% which.min}]
            print(paste0("Caution) using \"", out.name.prefix, "\" as out.name.prefix"))
            warning(paste0("Caution) using \"", out.name.prefix, "\" as out.name.prefix"))
        }
    }
    ?gsub
    # out.png.pdf.path = "Rplot"
    # out.png.pdf.path = "\\Rplot\\"
    # out.png.pdf.path |> cat("  \n", sep="")
    out.png.pdf.path = gsub("\\", "/", out.png.pdf.path, fixed = T)
    if (grepl("/$", out.png.pdf.path) != T) out.png.pdf.path = paste0(out.png.pdf.path, "/")
    if (!dir.exists(out.png.pdf.path)){
        dir.create(out.png.pdf.path)
        print(paste0("dir.create(\"", out.png.pdf.path, "\")"))
        warning(paste0("dir.create(\"", out.png.pdf.path, "\")"))
    }
    
    df.V1_V2_EdgeWeight = cbind(df.V1_V2_EdgeWeight[, c(varname4V1, varname4V2)], df.V1_V2_EdgeWeight[, !colnames(df.V1_V2_EdgeWeight) %in% c(varname4V1, varname4V2)])
    g = graph.data.frame(df.V1_V2_EdgeWeight, directed = directed, vertices = vertices)
    E(g)$weight = df.V1_V2_EdgeWeight[[varname4weight]]
    if (min(E(g)$weight) < 0) {
        print(paste0("Caution) min(E(g)$weight) < 0"))
        warning(paste0("Caution) min(E(g)$weight) < 0"))
        #@ need to work) what to do when weight is less than zero?!  -----
    }
    if (max(E(g)$weight) != 1) {
        print(paste0("Caution) max(E(g)$weight) != 1"))
        warning(paste0("Caution) max(E(g)$weight) != 1"))
        if (weight.max.scale1 == TRUE) {
            E(g)$weight = E(g)$weight / max(E(g)$weight)
            print(paste0("weight.max.scale1 == TRUE) E(g)$weight = E(g)$weight / max(E(g)$weight)"))
            warning(paste0("weight.max.scale1 == TRUE) E(g)$weight = E(g)$weight / max(E(g)$weight)"))
        }
    }
    E(g)$width=weight.multiplier * E(g)$weight
    edge.width=E(g)$width
    
    # E(g)$color = c(rgb(0,0,.6), rgb(.8,0,0))[(df.V1_V2_EdgeWeight[[varname.edgeColor.NegBluePosRed]] > 0) + 1]
    # E(g)$color[is.na(df.V1_V2_EdgeWeight[[varname.edgeColor.NegBluePosRed]])] = "grey"
    # E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.NegBluePosRed]] == 0] = "grey"
    # E(g)$color = rep("gray90", nrow(df.V1_V2_EdgeWeight))  # gray90 - very very light
    # E(g)$color = rep("lightgray", nrow(df.V1_V2_EdgeWeight))  
    
    if (edgeColor_vector0to1.by.weight) {
        E(g)$color = edgeColor_vector0to1.colorRampPalette[round(E(g)$weight * 100)+1]
        # Browse[2]> round(E(g)$weight * 100) |> summary()
        #  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
        # 0.000   0.000   0.000   3.032   3.000 100.000
    } else if (!is.null(varname4edgeColor_vector0to1)) {
        E(g)$color = edgeColor_vector0to1.colorRampPalette[round(df.V1_V2_EdgeWeight[[varname4edgeColor_vector0to1]] * 100)+1]
    } else {
        E(g)$color = rep("gray", nrow(df.V1_V2_EdgeWeight))  
    }
    if (!is.null(varname.edgeColor.Red)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.Red]] == 1] = "indianred3"
    if (!is.null(varname.edgeColor.Orange)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.Orange]] == 1] = "sienna3"
    if (!is.null(varname.edgeColor.Green)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.Green]] == 1] = "olivedrab4"
    if (!is.null(varname.edgeColor.Blue)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.Blue]] == 1] = "turquoise4"
    if (!is.null(varname.edgeColor.Purple)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.Purple]] == 1] = "mediumorchid4"
    if (!is.null(varname.edgeColor.DarkGray)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.DarkGray]] == 1] = "ivory4"
    if (!is.null(varname.edgeColor.Black)) E(g)$color[df.V1_V2_EdgeWeight[[varname.edgeColor.Black]] == 1] = "black"
    edge.color = E(g)$color
    
    V(g)$size = vertex.size.default
    vertex.size = V(g)$size * vertex.size.multiplier
    
    V(g)$color = rep(vertex.color.default, length(V(g)$name))
    V(g)$color[V(g)$name %in% name4vertex.color.tomato] = "tomato"
    V(g)$color[V(g)$name %in% name4vertex.color.yellow] = "yellow"
    V(g)$color[V(g)$name %in% name4vertex.color.lightblue] = "lightblue"
    # # vertex.color = c("lightblue", "tomato")[(V(g)$name == "Case") + 1]
    vertex.color = V(g)$color
    
    V(g)$label.color = "black"
    vertex.label.color = V(g)$label.color
    V(g)$label.cex = 0.5
    vertex.label.cex = V(g)$label.cex
    if (!is.null(vertex.label.df)){
        tmp.df = data.frame(varname = V(g)$name) 
        tmp.df = left_join(tmp.df, vertex.label.df)
        V(g)$label = tmp.df$label
    }
    
    # # label size of vertices based on their degrees
    # V(g)$label.cex = 2.2 * V(g)$degree / max(V(g)$degree) + .2
    # # rgb(red, green, blue, alpha) 
    # V(g)$label.color = rgb(0, 0, .2, .8)
    # V(g)$frame.color = NA
    # # width & transparency of edges based on their weights
    # egam =(log(E(g)$weight)+.4) / max(log(E(g)$weight)+.4)
    # egam = 5 * ( E(g)$weight - min(E(g)$weight) ) / ( max(E(g)$weight) - min(E(g)$weight) ) 
    # E(g)$color = rgb(.5, .5, 0, egam)
    # E(g)$width=egam
    
    par(mfrow = par.mfrow.device)
    par(mar = par.mar.device)
    for (layout in layouts) {
        if (layout == "layout.fruchterman.reingold") {
            vertex.size = vertex.size * 0.8
            tmp.name = paste0(out.name.prefix, ".igraph_", "fruchterman(seed", seed, ")")
        } else if (layout == "layout.circle") {
            vertex.size = vertex.size
            tmp.name = paste0(out.name.prefix, ".igraph_", "circle")
            # layout = layout_in_circle(g, order = order(names(V(g))))
        }
        if (out.graphic.device == T) {
            set.seed(seed); g %>% plot.igraph(
                layout = eval(parse(text = layout))
                , vertex.size = vertex.size, vertex.color = vertex.color
                , vertex.label.color = vertex.label.color, vertex.label.cex = vertex.label.cex
                , edge.color = edge.color, edge.width=edge.width
            )
            print(paste0("out.graphic.device == T) ", tmp.name))
        }
        if(out.png.pdf == T) {
            for (i in 1:2){
                if (i == 1) {
                    png(paste0(out.png.pdf.path, tmp.name, ".png"), width=1200, height = 1000)
                    print(paste0("out.png.pdf == T) File created: ", paste0(tmp.name, ".png")))
                } else if (i == 2) {
                    pdf(paste0(out.png.pdf.path, tmp.name, ".pdf"))
                    print(paste0("out.png.pdf == T) File created: ", paste0(tmp.name, ".pdf")))
                }
                set.seed(seed); g %>% plot.igraph(
                    layout = eval(parse(text = layout))
                    , vertex.size = vertex.size, vertex.color = vertex.color
                    , vertex.label.color = vertex.label.color, vertex.label.cex = vertex.label.cex
                    , edge.color = edge.color, edge.width=edge.width
                )
                dev.off()
            }
        } 
    }
    par(mfrow = par.mfrow.original)
    par(mar = par.mar.original)
    g
}


#@ test) data_V1_V2_EdgeWeight.igraph() termDocMatrix.t.df.lgl.comat ----
library(tidyverse)
load("data/termDocMatrix.rdata")
termDocMatrix.t.df = termDocMatrix %>% t %>% as_data_frame
termDocMatrix.t.df %>% map_df(as.factor) |> summary()
termDocMatrix.t.df %>% colSums
termDocMatrix.t.df %>% map_df(as.logical) %>% colSums
termDocMatrix.t.df |> str()
# > termDocMatrix.t.df %>% map_df(as.factor) |> summary()
#  analysis applications code    computing data    examples introduction mining  network package parallel positions postdoctoral r      research series  slides  social  time    tutorial users  
#  0:131    0:145        0:145   0:144     0:101   0:137    0:144        0:107   0:137   0:133   0:146    0:143     0:143        0:84   0:142    0:146   0:138   0:142   0:146   0:138    0:136  
#  1: 23    1:  9        1:  9   1: 10     1: 44   1: 17    1: 10        1: 43   1: 17   1: 19   1:  8    1: 11     1: 11        1:57   1: 10    1:  8   1: 16   1: 12   1:  8   1: 15    1: 18  
#                                          2:  8                         2:  3           2:  2                                   2:13   2:  1                                    2:  1           
#                                          3:  1                         3:  1                                                          3:  1                                                    
# > termDocMatrix.t.df %>% colSums
#     analysis applications         code    computing         data     examples introduction       mining      network      package     parallel    positions postdoctoral            r 
#           23            9            9           10           63           17           10           52           17           23            8           11           11           83 
#     research       series       slides       social         time     tutorial        users 
#           15            8           16           12            8           17           18 
# > termDocMatrix.t.df %>% map_df(as.logical) %>% colSums
#     analysis applications         code    computing         data     examples introduction       mining      network      package     parallel    positions postdoctoral            r 
#           23            9            9           10           53           17           10           47           17           21            8           11           11           70 
#     research       series       slides       social         time     tutorial        users 
#           12            8           16           12            8           16           18 
# > termDocMatrix.t.df |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	154 obs. of  21 variables:
#  $ analysis    : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ applications: num  0 0 0 0 0 0 0 0 0 0 ...
#  $ code        : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ computing   : num  0 0 1 1 0 1 1 1 1 1 ...
#  $ data        : num  1 1 0 0 2 0 0 0 0 0 ...
#  $ examples    : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ introduction: num  0 0 0 0 0 0 0 0 0 0 ...
#  $ mining      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ network     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ package     : num  0 0 0 1 1 0 0 0 0 0 ...
#  $ parallel    : num  0 0 1 1 0 1 1 1 1 0 ...
#  $ positions   : num  1 1 0 0 0 0 0 0 0 0 ...
#  $ postdoctoral: num  0 0 0 0 0 0 0 0 0 0 ...
#  $ r           : num  0 0 1 1 1 1 1 1 1 1 ...
#  $ research    : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ series      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ slides      : num  0 0 0 0 0 0 0 1 0 0 ...
#  $ social      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ time        : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ tutorial    : num  0 0 0 1 0 0 0 0 0 0 ...
#  $ users       : num  0 0 0 1 1 1 0 0 0 0 ...
# termDocMatrix.t.df.comat = t(as.matrix(termDocMatrix.t.df)) %*% as.matrix(termDocMatrix.t.df)  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# termDocMatrix.t.df.comat %>% diag
# identical((termDocMatrix.t.df %>% colSums), (termDocMatrix.t.df.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# identical((termDocMatrix.t.df %>% map_df(as.logical) %>% colSums), (termDocMatrix.t.df.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# termDocMatrix.t.df.lgl.comat |> str()
# # > termDocMatrix.t.df.comat = t(as.matrix(termDocMatrix.t.df)) %*% as.matrix(termDocMatrix.t.df)  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# # > termDocMatrix.t.df.comat %>% diag
# #     analysis applications         code    computing         data     examples introduction       mining      network      package     parallel    positions postdoctoral 
# #           23            9            9           10           85           17           10           64           17           27            8           11           11 
# #            r     research       series       slides       social         time     tutorial        users 
# #          109           23            8           16           12            8           19           18 
# # > identical((termDocMatrix.t.df %>% colSums), (termDocMatrix.t.df.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# # [1] FALSE
# # > identical((termDocMatrix.t.df %>% map_df(as.logical) %>% colSums), (termDocMatrix.t.df.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# # [1] FALSE
# # > termDocMatrix.t.df.lgl.comat |> str()
# #  num [1:21, 1:21] 23 0 1 0 4 4 2 4 12 2 ...
# #  - attr(*, "dimnames")=List of 2
# #   ..$ : chr [1:21] "analysis" "applications" "code" "computing" ...
# #   ..$ : chr [1:21] "analysis" "applications" "code" "computing" ...

termDocMatrix.t.df.lgl.comat = t(as.matrix(termDocMatrix.t.df %>% map_df(as.logical))) %*% as.matrix(termDocMatrix.t.df %>% map_df(as.logical))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
termDocMatrix.t.df.lgl.comat %>% diag
identical((termDocMatrix.t.df %>% colSums), (termDocMatrix.t.df.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
identical((termDocMatrix.t.df %>% map_df(as.logical) %>% colSums), (termDocMatrix.t.df.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
termDocMatrix.t.df.lgl.comat |> str()
# > termDocMatrix.t.df.lgl.comat = t(as.matrix(termDocMatrix.t.df %>% map_df(as.logical))) %*% as.matrix(termDocMatrix.t.df %>% map_df(as.logical))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# > termDocMatrix.t.df.lgl.comat %>% diag
#     analysis applications         code    computing         data     examples introduction       mining      network      package     parallel    positions postdoctoral            r 
#           23            9            9           10           53           17           10           47           17           21            8           11           11           70 
#     research       series       slides       social         time     tutorial        users 
#           12            8           16           12            8           16           18 
# > identical((termDocMatrix.t.df %>% colSums), (termDocMatrix.t.df.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# [1] FALSE
# > identical((termDocMatrix.t.df %>% map_df(as.logical) %>% colSums), (termDocMatrix.t.df.lgl.comat %>% diag))  # Caution) Cooccurrence matrix can be made from the matrix product when the data is binary (logical)
# [1] TRUE
# > termDocMatrix.t.df.lgl.comat |> str()
#  num [1:21, 1:21] 23 0 1 0 4 4 2 4 12 2 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:21] "analysis" "applications" "code" "computing" ...
#   ..$ : chr [1:21] "analysis" "applications" "code" "computing" ...

termDocMatrix.t.df.lgl.comat.gather = termDocMatrix.t.df.lgl.comat |> as.data.frame() %>% rownames_to_column %>% 
    dplyr::rename(V1 = rowname) %>% rownames_to_column %>% 
    gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
    mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
    mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
    arrange(R) |> as_tibble()
termDocMatrix.t.df.lgl.comat.gather
identical(nrow(termDocMatrix.t.df.lgl.comat.gather), ncol(termDocMatrix.t.df.lgl.comat) * nrow(termDocMatrix.t.df.lgl.comat))
# save(termDocMatrix.t.df.lgl.comat.gather, file = "data/termDocMatrix.t.df.lgl.comat.gather.rda")
# > termDocMatrix.t.df.lgl.comat.gather = termDocMatrix.t.df.lgl.comat |> as.data.frame() %>% rownames_to_column %>% 
# +     dplyr::rename(V1 = rowname) %>% rownames_to_column %>% 
# +     gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
# +     mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
# +     mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
# +     arrange(R) |> as_tibble()
# > termDocMatrix.t.df.lgl.comat.gather
# # A tibble: 441 x 6
#    rowname       V1           V2 cooccurence     R     C
#      <chr>   <fctr>       <fctr>       <dbl> <int> <int>
#  1    R1C1 analysis     analysis          23     1     1
#  2    R1C2 analysis applications           0     1     2
#  3    R1C3 analysis         code           1     1     3
#  4    R1C4 analysis    computing           0     1     4
#  5    R1C5 analysis         data           4     1     5
#  6    R1C6 analysis     examples           4     1     6
#  7    R1C7 analysis introduction           2     1     7
#  8    R1C8 analysis       mining           4     1     8
#  9    R1C9 analysis      network          12     1     9
# 10   R1C10 analysis      package           2     1    10
# # ... with 431 more rows
# > identical(nrow(termDocMatrix.t.df.lgl.comat.gather), ncol(termDocMatrix.t.df.lgl.comat) * nrow(termDocMatrix.t.df.lgl.comat))
# [1] TRUE


termDocMatrix.t.df.lgl.comat.gather



termDocMatrix.t.df.lgl.comat.gather.upper.tri = termDocMatrix.t.df.lgl.comat |> as.data.frame() %>% rownames_to_column %>% 
    dplyr::rename(V1 = rowname) %>% rownames_to_column %>% 
    gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
    mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
    mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
    arrange(R) |> as_tibble() %>% dplyr::filter(R < C)
termDocMatrix.t.df.lgl.comat.gather.upper.tri
identical(as.numeric(nrow(termDocMatrix.t.df.lgl.comat.gather.upper.tri)), ncol(termDocMatrix.t.df.lgl.comat) * {nrow(termDocMatrix.t.df.lgl.comat) - 1} / 2)
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri = termDocMatrix.t.df.lgl.comat |> as.data.frame() %>% rownames_to_column %>% 
# +     dplyr::rename(V1 = rowname) %>% rownames_to_column %>% 
# +     gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
# +     mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
# +     mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>% 
# +     arrange(R) |> as_tibble() %>% dplyr::filter(R < C)
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri
# # A tibble: 210 x 6
#    rowname       V1           V2 cooccurence     R     C
#      <chr>   <fctr>       <fctr>       <dbl> <int> <int>
#  1    R1C2 analysis applications           0     1     2
#  2    R1C3 analysis         code           1     1     3
#  3    R1C4 analysis    computing           0     1     4
#  4    R1C5 analysis         data           4     1     5
#  5    R1C6 analysis     examples           4     1     6
#  6    R1C7 analysis introduction           2     1     7
#  7    R1C8 analysis       mining           4     1     8
#  8    R1C9 analysis      network          12     1     9
#  9   R1C10 analysis      package           2     1    10
# 10   R1C11 analysis     parallel           0     1    11
# # ... with 200 more rows
# > identical(as.numeric(nrow(termDocMatrix.t.df.lgl.comat.gather.upper.tri)), ncol(termDocMatrix.t.df.lgl.comat) * {nrow(termDocMatrix.t.df.lgl.comat) - 1} / 2)
# [1] TRUE

# debug(data_V1_V2_EdgeWeight.igraph)
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph = termDocMatrix.t.df.lgl.comat.gather.upper.tri %>% select(-rowname) %>% data_V1_V2_EdgeWeight.igraph(varname4weight = "cooccurence", vertex.size.default = 25, weight.multiplier = 35, directed = F)
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph = termDocMatrix.t.df.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", vertex.size.default = 25, weight.multiplier = 35, directed = F, out.png.pdf = T, out.png.pdf.path = "Rplot/")
# undebug(data_V1_V2_EdgeWeight.igraph)
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph = termDocMatrix.t.df.lgl.comat.gather.upper.tri %>% select(-rowname) %>% data_V1_V2_EdgeWeight.igraph(varname4weight = "cooccurence", vertex.size.default = 25, weight.multiplier = 35, directed = F)
# [1] "Caution: out.name.prefix == \".\") "
# [1] "Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) failed..."
# [1] "Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)"
# [1] "out.graphic.device == T) ..igraph_fruchterman(seed1)"
# [1] "out.graphic.device == T) ..igraph_circle"
# Warning messages:
# 1: In rm(list = cmd, envir = .tkplot.env) : object 'tkp.2' not found
# 2: In data_V1_V2_EdgeWeight.igraph(., varname4weight = "cooccurence",  :
#   Caution: out.name.prefix == ".") 
# 3: In data_V1_V2_EdgeWeight.igraph(., varname4weight = "cooccurence",  :
#   Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph = termDocMatrix.t.df.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", vertex.size.default = 25, weight.multiplier = 35, directed = F, out.png.pdf = T)
# [1] "Caution: out.name.prefix == \".\") "
# [1] "Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) termDocMatrix.t.df.lgl.comat.gather.upper.tri"
# [1] "Caution) using \"termDocMatrix.t.df.lgl.comat.gather.upper.tri\" as out.name.prefix"
# [1] "Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)"
# [1] "out.graphic.device == T) termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1)"
# [1] "out.png.pdf == T) File created: termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).png"
# [1] "out.png.pdf == T) File created: termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).pdf"
# [1] "out.graphic.device == T) termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph_circle"
# [1] "out.png.pdf == T) File created: termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph_circle.png"
# [1] "out.png.pdf == T) File created: termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph_circle.pdf"
# Warning messages:
# 1: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution: out.name.prefix == ".") 
# 2: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution) using "termDocMatrix.t.df.lgl.comat.gather.upper.tri" as out.name.prefix
# 3: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)

termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph %>% tkplot




#@ termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph |> str(max.level = 1) ------
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]$analysis
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph |> str(max.level = 1)
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph |> str(max.level = 2)
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]$analysis |> str()
termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]$analysis %>% attr(., "env")
# save(termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph, file = "data/termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph.rda")
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph
# IGRAPH c535cb5 UNW- 21 210 -- 
# + attr: name (v/c), size (v/n), color (v/c), label.color (v/c), label.cex (v/n), rowname (e/c), cooccurence
# | (e/n), R (e/n), C (e/n), weight (e/n), width (e/n), color (e/c)
# + edges from c535cb5 (vertex names):
#  [1] analysis    --applications analysis    --code         analysis    --computing    analysis    --data        
#  [5] analysis    --examples     analysis    --introduction analysis    --mining       analysis    --network     
#  [9] analysis    --package      analysis    --parallel     analysis    --positions    analysis    --postdoctoral
# [13] analysis    --r            analysis    --research     analysis    --series       analysis    --slides      
# [17] analysis    --social       analysis    --time         analysis    --tutorial     analysis    --users       
# [21] applications--code         applications--computing    applications--data         applications--examples    
# [25] applications--introduction applications--mining       applications--network      applications--package     
# + ... omitted several edges
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]
# $analysis
# + 20/21 vertices, named, from c535cb5:
#  [1] applications code         computing    data         examples     introduction mining       network      package     
# [10] parallel     positions    postdoctoral r            research     series       slides       social       time        
# [19] tutorial     users       
# 
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]$analysis
# + 20/21 vertices, named, from c535cb5:
#  [1] applications code         computing    data         examples     introduction mining       network      package     
# [10] parallel     positions    postdoctoral r            research     series       slides       social       time        
# [19] tutorial     users       
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph |> str(max.level = 1)
# List of 10
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  - attr(*, "class")= chr "igraph"
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph |> str(max.level = 2)
# List of 10
#  $ :List of 1
#   ..$ analysis:Class 'igraph.vs'  atomic [1:20] 2 3 4 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ applications:Class 'igraph.vs'  atomic [1:20] 1 3 4 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ code:Class 'igraph.vs'  atomic [1:20] 1 2 4 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ computing:Class 'igraph.vs'  atomic [1:20] 1 2 3 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ data:Class 'igraph.vs'  atomic [1:20] 1 2 3 4 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ examples:Class 'igraph.vs'  atomic [1:20] 1 2 3 4 5 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ introduction:Class 'igraph.vs'  atomic [1:20] 1 2 3 4 5 6 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ mining:Class 'igraph.vs'  atomic [1:20] 1 2 3 4 5 6 7 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ network:Class 'igraph.vs'  atomic [1:20] 1 2 3 4 5 6 7 8 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ package:Class 'igraph.vs'  atomic [1:20] 1 2 3 4 5 6 7 8 9 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
#  - attr(*, "class")= chr "igraph"
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]$analysis |> str()
# Class 'igraph.vs'  atomic [1:20] 2 3 4 5 6 7 8 9 10 11 ...
#   ..- attr(*, "env")=<weakref> 
#   ..- attr(*, "graph")= chr "c535cb56-eea6-11e7-857e-d13d2de48e1b"
# > termDocMatrix.t.df.lgl.comat.gather.upper.tri.igraph[[1]]$analysis %>% attr(., "env")
# <weak reference>




#@ test) data_V1_V2_EdgeWeight.igraph() trainsetCC69agg4i07_829.Ctrl.lgl.comat ----
library(tidyverse)
load("data/trainsetCC69agg4i07_829.rda")
trainsetCC69agg4i07_829.Ctrl.lgl = trainsetCC69agg4i07_829 %>% select_if(is.logical) %>% dplyr::filter(is.Case != T) %>% select(-is.Case)
trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.factor) |> summary()
trainsetCC69agg4i07_829.Ctrl.lgl %>% colSums
# trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical) %>% colSums
trainsetCC69agg4i07_829.Ctrl.lgl |> str()
# > trainsetCC69agg4i07_829.Ctrl.lgl = trainsetCC69agg4i07_829 %>% select_if(is.logical) %>% dplyr::filter(is.Case != T) %>% select(-is.Case)
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.factor) |> summary()
#  AcquiredHypothyroidism AdjustmentDisorder   Anemia     Anxiety    Arthritis   AtrialFibrillation BenignProstatic BrainInjury  Cataract   ChronicKidney  Diabetes   Dysthymia    Epilepsy  
#  FALSE:800              FALSE:828          FALSE:809   FALSE:723   FALSE:230   FALSE:829          FALSE:828       FALSE:823   FALSE:599   FALSE:800     FALSE:696   FALSE:827   FALSE:825  
#  TRUE : 29              TRUE :  1          TRUE : 20   TRUE :106   TRUE :599                      TRUE :  1       TRUE :  6   TRUE :230   TRUE : 29     TRUE :133   TRUE :  2   TRUE :  4  
#  Fibromyalgia_Pain_Fatigue  Glaucoma   HearingImpairment HeartFailure Hyperlipidemia Hypertension IschemicHeart Migraine_ChronicHeadache MobilityImpairments Osteoporosis  PelvicFx  
#  FALSE:493                 FALSE:735   FALSE:808         FALSE:793    FALSE:623      FALSE:791    FALSE:726     FALSE:695                FALSE:816           FALSE:702    FALSE:815  
#  TRUE :336                 TRUE : 94   TRUE : 21         TRUE : 36    TRUE :206      TRUE : 38    TRUE :103     TRUE :134                TRUE : 13           TRUE :127    TRUE : 14  
#  PersonalityDisorders SpinalCordInjury StrokeTIA   AlzheimerDementia LiverDisease ObstructiveLungDisease CancerSurvivors
#  FALSE:829            FALSE:803        FALSE:759   FALSE:827         FALSE:711    FALSE:675              FALSE:814      
#                       TRUE : 26        TRUE : 70   TRUE :  2         TRUE :118    TRUE :154              TRUE : 15      
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% colSums
#    AcquiredHypothyroidism        AdjustmentDisorder                    Anemia                   Anxiety                 Arthritis        AtrialFibrillation           BenignProstatic 
#                        29                         1                        20                       106                       599                         0                         1 
#               BrainInjury                  Cataract             ChronicKidney                  Diabetes                 Dysthymia                  Epilepsy Fibromyalgia_Pain_Fatigue 
#                         6                       230                        29                       133                         2                         4                       336 
#                  Glaucoma         HearingImpairment              HeartFailure            Hyperlipidemia              Hypertension             IschemicHeart  Migraine_ChronicHeadache 
#                        94                        21                        36                       206                        38                       103                       134 
#       MobilityImpairments              Osteoporosis                  PelvicFx      PersonalityDisorders          SpinalCordInjury                 StrokeTIA         AlzheimerDementia 
#                        13                       127                        14                         0                        26                        70                         2 
#              LiverDisease    ObstructiveLungDisease           CancerSurvivors 
#                       118                       154                        15 
# > # trainsetCC69agg4i07_829.Ctrl.lgl %>% map_df(as.logical) %>% colSums
# > trainsetCC69agg4i07_829.Ctrl.lgl |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	829 obs. of  31 variables:
#  $ AcquiredHypothyroidism   : logi  FALSE FALSE FALSE FALSE FALSE TRUE ...
#  $ AdjustmentDisorder       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Anemia                   : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Anxiety                  : logi  FALSE TRUE FALSE TRUE FALSE FALSE ...
#  $ Arthritis                : logi  TRUE FALSE FALSE FALSE TRUE TRUE ...
#  $ AtrialFibrillation       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BenignProstatic          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ BrainInjury              : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Cataract                 : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
#  $ ChronicKidney            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Diabetes                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Dysthymia                : logi  FALSE FALSE FALSE TRUE FALSE FALSE ...
#  $ Epilepsy                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Fibromyalgia_Pain_Fatigue: logi  TRUE TRUE TRUE TRUE TRUE FALSE ...
#  $ Glaucoma                 : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
#  $ HearingImpairment        : logi  FALSE FALSE FALSE TRUE FALSE FALSE ...
#  $ HeartFailure             : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Hyperlipidemia           : logi  TRUE FALSE FALSE TRUE FALSE FALSE ...
#  $ Hypertension             : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ IschemicHeart            : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Migraine_ChronicHeadache : logi  FALSE FALSE FALSE FALSE TRUE FALSE ...
#  $ MobilityImpairments      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ Osteoporosis             : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PelvicFx                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ PersonalityDisorders     : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ SpinalCordInjury         : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ StrokeTIA                : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ AlzheimerDementia        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ LiverDisease             : logi  TRUE FALSE FALSE TRUE FALSE FALSE ...
#  $ ObstructiveLungDisease   : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#  $ CancerSurvivors          : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...



#@ data.lgl.comat.gather() separate file ======


trainsetCC69agg4i07_829.Ctrl.lgl 
trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T)
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = F)
# # A tibble: 961 x 6
#                        V1                     V2 cooccurence    RC     R     C
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = T, .cor.test = F, .Fisher.exact.test = F)
# # A tibble: 961 x 16
#                        V1                     V2 cooccurence    RC     R     C  ntot   n00   n10   n01   n11           phi        OR SimpleAgreement ChanceAgreement Cohen_kappa
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int> <int> <dbl> <dbl> <dbl> <dbl>         <dbl>     <dbl>           <dbl>           <dbl>       <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1   829   800     0     0    29  1.0000000000       Inf             Inf       2.0000000        -Inf
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2   829   799    29     1     0 -0.0066166603 0.0000000       0.0000000       0.9637696 -26.6011500
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3   829   781    28    19     1  0.0128518633 1.4680451       1.4680451       0.9441855   9.3857277
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4   829   699    24   101     5  0.0253993965 1.4418317       1.4418317       0.8528786   4.0031771
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5   829   221     9   579    20 -0.0139912063 0.8482057       0.8482057       0.2884671   0.7866658
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6   829   800    29    NA    NA           NaN       NaN             NaN             NaN         NaN
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7   829   799    29     1     0 -0.0066166603 0.0000000       0.0000000       0.9637696 -26.6011500
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8   829   794    29     6     0 -0.0162565997 0.0000000       0.0000000       0.9575273 -22.5445573
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9   829   579    20   221     9  0.0139912063 1.1789593       1.1789593       0.7117287   1.6208015
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10   829   772    28    28     1 -0.0005172414 0.9846939       0.9846939       0.9324141   0.7735310
# # ... with 951 more rows
# Warning message:
# In data.lgl.comat.gather(., .n11 = T, .cor.test = F, .Fisher.exact.test = F) :
#   !identical(out$ntot, colSums(select(out, n00, n10, n01, n11), na.rm = T))
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
# Error in out$cor_spearman.ll[k] <- cor.test_spearman.out$conf.int[1] : 
#   replacement has length zero
# In addition: Warning message:
# In cor.test.default(as.numeric(data.lgl[[varname1vec[k]]]), as.numeric(data.lgl[[varname2vec[k]]]),  :
#   Cannot compute exact p-value with ties
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = T, .Fisher.exact.test = F)
# # A tibble: 961 x 14
#                        V1                     V2 cooccurence    RC     R     C   cor_pearson cor_pearson.ll cor_pearson.ul cor_pearson.p cor_spearman cor_spearman.ll cor_spearman.ul cor_spearman.p
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>         <dbl>          <dbl>          <dbl>         <dbl>        <dbl>           <dbl>           <dbl>          <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1  1.0000000000     1.00000000     1.00000000     0.0000000           NA              NA              NA             NA
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2 -0.0066166603    -0.07467336     0.06150139     0.8491337           NA              NA              NA             NA
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3  0.0128518633    -0.05528686     0.08087144     0.7117607           NA              NA              NA             NA
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4  0.0253993965    -0.04276491     0.09332834     0.4651928           NA              NA              NA             NA
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5 -0.0139912063    -0.08200343     0.05415073     0.6874988           NA              NA              NA             NA
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6            NA             NA             NA            NA           NA              NA              NA             NA
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7 -0.0066166603    -0.07467336     0.06150139     0.8491337           NA              NA              NA             NA
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8 -0.0162565997    -0.08425368     0.05189119     0.6402205           NA              NA              NA             NA
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9  0.0139912063    -0.05415073     0.08200343     0.6874988           NA              NA              NA             NA
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10 -0.0005172414    -0.06860517     0.06757548     0.9881358           NA              NA              NA             NA
# # ... with 951 more rows
# > trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather(.n11 = F, .cor.test = F, .Fisher.exact.test = T)
# # A tibble: 961 x 10
#                        V1                     V2 cooccurence    RC     R     C fisher.test.OR fisher.test.OR_ll95 fisher.test.OR_ul95 fisher.test.p
#                    <fctr>                 <fctr>       <dbl> <chr> <int> <int>          <dbl>               <dbl>               <dbl>         <dbl>
#  1 AcquiredHypothyroidism AcquiredHypothyroidism          29  R1C1     1     1            Inf        3.200677e+03                 Inf  3.339119e-54
#  2 AcquiredHypothyroidism     AdjustmentDisorder           0  R1C2     1     2      0.0000000        0.000000e+00         1058.091715  1.000000e+00
#  3 AcquiredHypothyroidism                 Anemia           1  R1C3     1     3      1.4672178        3.412795e-02            9.919660  5.135455e-01
#  4 AcquiredHypothyroidism                Anxiety           5  R1C4     1     4      1.4411073        4.199260e-01            3.971758  4.037807e-01
#  5 AcquiredHypothyroidism              Arthritis          20  R1C5     1     5      0.8483994        3.626019e-01            2.149752  6.760785e-01
#  6 AcquiredHypothyroidism     AtrialFibrillation           0  R1C6     1     6             NA                  NA                  NA            NA
#  7 AcquiredHypothyroidism        BenignProstatic           0  R1C7     1     7      0.0000000        0.000000e+00         1058.091715  1.000000e+00
#  8 AcquiredHypothyroidism            BrainInjury           0  R1C8     1     8      0.0000000        0.000000e+00           24.264405  1.000000e+00
#  9 AcquiredHypothyroidism               Cataract           9  R1C9     1     9      1.1786902        4.651700e-01            2.757845  6.760785e-01
# 10 AcquiredHypothyroidism          ChronicKidney           1 R1C10     1    10      0.9847120        2.326087e-02            6.424633  1.000000e+00
# # ... with 951 more rows

# trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather = trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather
# save(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather, file = "data/trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple).rda")
load("data/trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather(simple).rda")
# trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri = trainsetCC69agg4i07_829.Ctrl.lgl %>% data.lgl.comat.gather %>% dplyr::filter(R < C)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather %>% dplyr::filter(R < C)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri
identical(as.numeric(nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri)), ncol(trainsetCC69agg4i07_829.Ctrl.lgl.comat) * {nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat) - 1} / 2)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri = trainsetCC69agg4i07_829.Ctrl.lgl.comat |> as.data.frame() %>% rownames_to_column %>% 
# +     dplyr::rename(V1 = rowname) %>% rownames_to_column %>% 
# +     gather(-rowname, -V1, key = "V2", value = "cooccurence") %>% 
# +     mutate(V1 = as.factor(V1), V2 = as.factor(V2)) %>% mutate(rowname = {paste0("R", 1:nlevels(V1), "C", {rep(1:nlevels(V2), each = nlevels(V1))})} ) %>% 
# +     mutate(tmp = gsub("^R", "", rowname)) %>% separate(tmp, c("R", "C"), sep = "C") %>% mutate(R = as.integer(R), C = as.integer(C)) %>%
# +     arrange(R) |> as_tibble() %>% dplyr::filter(R < C)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri
# # A tibble: 465 x 6
#    rowname                     V1                 V2 cooccurence     R     C
#      <chr>                 <fctr>             <fctr>       <dbl> <int> <int>
#  1    R1C2 AcquiredHypothyroidism AdjustmentDisorder           0     1     2
#  2    R1C3 AcquiredHypothyroidism             Anemia           1     1     3
#  3    R1C4 AcquiredHypothyroidism            Anxiety           5     1     4
#  4    R1C5 AcquiredHypothyroidism          Arthritis          20     1     5
#  5    R1C6 AcquiredHypothyroidism AtrialFibrillation           0     1     6
#  6    R1C7 AcquiredHypothyroidism    BenignProstatic           0     1     7
#  7    R1C8 AcquiredHypothyroidism        BrainInjury           0     1     8
#  8    R1C9 AcquiredHypothyroidism           Cataract           9     1     9
#  9   R1C10 AcquiredHypothyroidism      ChronicKidney           1     1    10
# 10   R1C11 AcquiredHypothyroidism           Diabetes           1     1    11
# # ... with 455 more rows
# > identical(as.numeric(nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri)), ncol(trainsetCC69agg4i07_829.Ctrl.lgl.comat) * {nrow(trainsetCC69agg4i07_829.Ctrl.lgl.comat) - 1} / 2)
# [1] TRUE



# debug(data_V1_V2_EdgeWeight.igraph)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri %>% select(-rowname) %>% data_V1_V2_EdgeWeight.igraph(varname4weight = "cooccurence", vertex.size.default = 20, weight.multiplier = 30, directed = F)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", vertex.size.default = 20, weight.multiplier = 30, directed = F, out.png.pdf = F, out.png.pdf.path = "Rplot/")
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", edgeColor_vector0to1.by.weight = T, vertex.size.default = 20, weight.multiplier = 30, directed = F, out.png.pdf = F, out.png.pdf.path = "Rplot/")
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", edgeColor_vector0to1.by.weight = T, vertex.size.default = 20, weight.multiplier = 30, directed = F, out.png.pdf = T, out.png.pdf.path = "Rplot/", name4vertex.color.tomato = c("AtrialFibrillation", "HeartFailure", "IschemicHeart"), name4vertex.color.yellow = c("AdjustmentDisorder", "Anxiety", "Dysthymia"), name4vertex.color.lightblue = "ObstructiveLungDisease")
# undebug(data_V1_V2_EdgeWeight.igraph)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", vertex.size.default = 25, weight.multiplier = 35, directed = F, out.png.pdf = T, out.png.pdf.path = "Rplot/")
# [1] "Caution: out.name.prefix == \".\") "
# [1] "Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri"
# [1] "Caution) using \"trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri\" as out.name.prefix"
# [1] "Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)"
# [1] "out.graphic.device == T) trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1)"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).png"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).pdf"
# [1] "out.graphic.device == T) trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle.png"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle.pdf"
# Warning messages:
# 1: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution: out.name.prefix == ".") 
# 2: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution) using "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri" as out.name.prefix
# 3: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph = trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri %>% data_V1_V2_EdgeWeight.igraph(varname4V1 = "V1", varname4V2 = "V2", varname4weight = "cooccurence", vertex.size.default = 20, weight.multiplier = 30, directed = F, out.png.pdf = T, out.png.pdf.path = "Rplot/")
# [1] "Caution: out.name.prefix == \".\") "
# [1] "Caution: guessing df.V1_V2_EdgeWeight in .GlobalEnv) trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri"
# [1] "Caution) using \"trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri\" as out.name.prefix"
# [1] "Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)"
# [1] "out.graphic.device == T) trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1)"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).png"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_fruchterman(seed1).pdf"
# [1] "out.graphic.device == T) trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle.png"
# [1] "out.png.pdf == T) File created: trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph_circle.pdf"
# Warning messages:
# 1: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution: out.name.prefix == ".") 
# 2: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution) using "trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri" as out.name.prefix
# 3: In data_V1_V2_EdgeWeight.igraph(., varname4V1 = "V1", varname4V2 = "V2",  :
#   Caution (max(E(g)$weight) != 1): E(g)$weight = E(g)$weight / max(E(g)$weight)

trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph %>% tkplot




#@ trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph |> str(max.level = 1) ------
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]$AcquiredHypothyroidism
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph |> str(max.level = 1)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph |> str(max.level = 2)
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]$AcquiredHypothyroidism |> str()
trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]$AcquiredHypothyroidism %>% attr(., "env")
# save(trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph, file = "data/trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph.rda")
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph
# IGRAPH cf5642e UNW- 31 465 -- 
# + attr: name (v/c), size (v/n), color (v/c), label.color (v/c), label.cex (v/n), rowname (e/c), cooccurence (e/n), R
# | (e/n), C (e/n), weight (e/n), width (e/n), color (e/c)
# + edges from cf5642e (vertex names):
#  [1] AcquiredHypothyroidism--AdjustmentDisorder        AcquiredHypothyroidism--Anemia                   
#  [3] AcquiredHypothyroidism--Anxiety                   AcquiredHypothyroidism--Arthritis                
#  [5] AcquiredHypothyroidism--AtrialFibrillation        AcquiredHypothyroidism--BenignProstatic          
#  [7] AcquiredHypothyroidism--BrainInjury               AcquiredHypothyroidism--Cataract                 
#  [9] AcquiredHypothyroidism--ChronicKidney             AcquiredHypothyroidism--Diabetes                 
# [11] AcquiredHypothyroidism--Dysthymia                 AcquiredHypothyroidism--Epilepsy                 
# [13] AcquiredHypothyroidism--Fibromyalgia_Pain_Fatigue AcquiredHypothyroidism--Glaucoma                 
# + ... omitted several edges
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]
# $AcquiredHypothyroidism
# + 30/31 vertices, named, from cf5642e:
#  [1] AdjustmentDisorder        Anemia                    Anxiety                   Arthritis                 AtrialFibrillation       
#  [6] BenignProstatic           BrainInjury               Cataract                  ChronicKidney             Diabetes                 
# [11] Dysthymia                 Epilepsy                  Fibromyalgia_Pain_Fatigue Glaucoma                  HearingImpairment        
# [16] HeartFailure              Hyperlipidemia            Hypertension              IschemicHeart             Migraine_ChronicHeadache 
# [21] MobilityImpairments       Osteoporosis              PelvicFx                  PersonalityDisorders      SpinalCordInjury         
# [26] StrokeTIA                 AlzheimerDementia         LiverDisease              ObstructiveLungDisease    CancerSurvivors          
# 
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]$AcquiredHypothyroidism
# + 30/31 vertices, named, from cf5642e:
#  [1] AdjustmentDisorder        Anemia                    Anxiety                   Arthritis                 AtrialFibrillation       
#  [6] BenignProstatic           BrainInjury               Cataract                  ChronicKidney             Diabetes                 
# [11] Dysthymia                 Epilepsy                  Fibromyalgia_Pain_Fatigue Glaucoma                  HearingImpairment        
# [16] HeartFailure              Hyperlipidemia            Hypertension              IschemicHeart             Migraine_ChronicHeadache 
# [21] MobilityImpairments       Osteoporosis              PelvicFx                  PersonalityDisorders      SpinalCordInjury         
# [26] StrokeTIA                 AlzheimerDementia         LiverDisease              ObstructiveLungDisease    CancerSurvivors          
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph |> str(max.level = 1)
# List of 10
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  $ :List of 1
#  - attr(*, "class")= chr "igraph"
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph |> str(max.level = 2)
# List of 10
#  $ :List of 1
#   ..$ AcquiredHypothyroidism:Class 'igraph.vs'  atomic [1:30] 2 3 4 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ AdjustmentDisorder:Class 'igraph.vs'  atomic [1:30] 1 3 4 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ Anemia:Class 'igraph.vs'  atomic [1:30] 1 2 4 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ Anxiety:Class 'igraph.vs'  atomic [1:30] 1 2 3 5 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ Arthritis:Class 'igraph.vs'  atomic [1:30] 1 2 3 4 6 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ AtrialFibrillation:Class 'igraph.vs'  atomic [1:30] 1 2 3 4 5 7 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ BenignProstatic:Class 'igraph.vs'  atomic [1:30] 1 2 3 4 5 6 8 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ BrainInjury:Class 'igraph.vs'  atomic [1:30] 1 2 3 4 5 6 7 9 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ Cataract:Class 'igraph.vs'  atomic [1:30] 1 2 3 4 5 6 7 8 10 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  $ :List of 1
#   ..$ ChronicKidney:Class 'igraph.vs'  atomic [1:30] 1 2 3 4 5 6 7 8 9 11 ...
#   .. .. ..- attr(*, "env")=<weakref> 
#   .. .. ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
#  - attr(*, "class")= chr "igraph"
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]$AcquiredHypothyroidism |> str()
# Class 'igraph.vs'  atomic [1:30] 2 3 4 5 6 7 8 9 10 11 ...
#   ..- attr(*, "env")=<weakref> 
#   ..- attr(*, "graph")= chr "cf5642e8-efd2-11e7-857e-d13d2de48e1b"
# > trainsetCC69agg4i07_829.Ctrl.lgl.comat.gather.upper.tri.igraph[[1]]$AcquiredHypothyroidism %>% attr(., "env")
# <weak reference>



#@ end ------
