
# [Flowchart][Graphviz] library(DiagrammeR) flowchart_inclusion_exclusions().RMD
flowchart_inclusion_exclusions <- function(
        n_total, 
        n_eligible, 
        list_n_exclusions, 
        n_analysis = NULL, 
        output_png_path = paste0("flowchart_inclusion_exclusions", "_", Sys.Date(), ".png")
) {
    library(DiagrammeR)
    library(glue)
    library(DiagrammeRsvg)
    library(rsvg)
    
    # Formatting numbers with thousands separator
    n_total_formatted <- format(n_total, big.mark = ",")
    n_eligible_formatted <- format(n_eligible, big.mark = ",")
    
    exclusion_nodes <- ""
    prev_node <- "node1"
    i <- 1
    total_exclusions <- 0
    
    for (label in names(list_n_exclusions)) {
        n_exclusion <- list_n_exclusions[[label]]
        total_exclusions <- total_exclusions + n_exclusion
        n_exclusion_formatted <- format(n_exclusion, big.mark = ",")
        
        exclusion_part <- glue("
    blank{i}[label = '', width = 0.01, height = 0.01]
    excluded{i}[label = <{label} (n={n_exclusion_formatted})>]
    {prev_node} -> blank{i}[dir = none];
    blank{i} -> excluded{i}[minlen = 2];
    {{ rank = same; blank{i} excluded{i} }}
    ", .envir = list(i = i, label = label, n_exclusion_formatted = n_exclusion_formatted, prev_node = prev_node))
        
        exclusion_nodes <- paste(exclusion_nodes, exclusion_part, sep = "\n")
        
        prev_node <- glue("blank{i}", .envir = list(i = i))
        i <- i + 1
    }
    
    
    if(is.null(n_analysis)) {
        n_analysis_formatted <- format(n_eligible - total_exclusions, big.mark = ",")
    } else {
        n_analysis_formatted <- format(n_analysis, big.mark = ",")
    }
    
    graph_code <- glue("
  digraph my_flowchart {{ 
    graph[splines = ortho]
    node [fontname = Helvetica, shape = box, width = 4, height = 1]
    
    node0[label = <Total population<br/>(n = {n_total_formatted})>]
    node1[label = <Eligible population<br/>(n = {n_eligible_formatted})>]
    
    node0 -> node1;

    {exclusion_nodes}

    node2[label = <Included for analysis<br/>(n={n_analysis_formatted})>]
    {prev_node} -> node2;
    
    node3[label = <Data linked with<br/>external dataset>]
    node2 -> node3;
  }}")
    
    g <- grViz(graph_code)
    
    rsvg_png(charToRaw(export_svg(g)), output_png_path)
    return(g)
}


list_n_exclusions <- list("Excluded due to criteria A" = 100, "Excluded due to criteria B" = 200, "Excluded due to missing values" = 50)
flowchart_inclusion_exclusions(n_total = 2000, n_eligible = 1500, list_n_exclusions = list_n_exclusions)
flowchart_inclusion_exclusions(n_total = 2000, n_eligible = 1500, list_n_exclusions = list_n_exclusions, n_analysis = 1200)



#@ end -----
