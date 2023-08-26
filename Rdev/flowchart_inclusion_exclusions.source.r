

flowchart_inclusion_exclusions <- function(
        n_total, 
        n_eligible, 
        vector_named_n_exclusions, 
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
    
    for (label in names(vector_named_n_exclusions)) {
        n_exclusion <- vector_named_n_exclusions[label]
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


vector_named_n_exclusions <- c("Excluded due to criteria A" = 100, "Excluded due to criteria B" = 200, "Excluded due to missing values" = 50)
flowchart_inclusion_exclusions(n_total = 2000, n_eligible = 1500, vector_named_n_exclusions = vector_named_n_exclusions)
flowchart_inclusion_exclusions(n_total = 2000, n_eligible = 1500, vector_named_n_exclusions = vector_named_n_exclusions, n_analysis = 1200)











#@ ----------
flowchart_inclusion_exclusion2 <- function(
  n_total, 
  n_eligible, 
  n_exclusion1, 
  n_exclusion2, 
  label_exclusion1 = "Excluded due to exclusion criteria",
  label_exclusion2 = "Excluded due to missing values",
  output_png_path = paste0("flowchart_inclusion_exclusion2", "_", Sys.Date(), ".png")
) {
  library(DiagrammeR)
  library(glue)
  library(DiagrammeRsvg)
  library(rsvg)

  # Formatting numbers with thousands separator
  n_total_formatted <- format(n_total, big.mark = ",")
  n_eligible_formatted <- format(n_eligible, big.mark = ",")
  n_exclusion1_formatted <- format(n_exclusion1, big.mark = ",")
  n_exclusion2_formatted <- format(n_exclusion2, big.mark = ",")
  n_analysis_formatted <- format(n_eligible - n_exclusion1 - n_exclusion2, big.mark = ",")

  g <- grViz(
    glue("
    digraph my_flowchart {{ 
      graph[splines = ortho]
      node [fontname = Helvetica, shape = box, width = 4, height = 1]

      node0[label = <Total population<br/>(n = {n_total_formatted})>]
      node1[label = <Eligible population<br/>(n = {n_eligible_formatted})>]

      node0 -> node1;

      blank1[label = '', width = 0.01, height = 0.01]
      excluded1[label = <{label_exclusion1} (n={n_exclusion1_formatted})>]

      node1 -> blank1[dir = none];
      blank1 -> excluded1[minlen = 2];
      {{ rank = same; blank1 excluded1 }}

      blank2[label = '', width = 0.01, height = 0.01]
      excluded2[label = <{label_exclusion2} (n={n_exclusion2_formatted})>]

      blank1 -> blank2[dir = none];
      blank2 -> excluded2[minlen = 2];
      {{ rank = same; blank2 excluded2 }}

      node2[label = <Included for analysis<br/>(n={n_analysis_formatted})>]
      blank2 -> node2;

      node3[label = <Data linked with<br/>external dataset>]
      node2 -> node3;
    }}")
  )

  rsvg_png(charToRaw(export_svg(g)), output_png_path)
  return(g)
}
flowchart_inclusion_exclusion2(10000, 9500, 300, 200, "Excluded for other reasons", "Excluded for being duplicate records")









#@ ----------
library(DiagrammeR)
flowchart_eligible_randomized <- function(n_total, n_eligible, n_randomized, n_GroupA, n_GroupB, n_refused, n_contraindicated) {
  DiagrammeR::grViz(paste0('
    digraph G {
        // Global attributes
        rankdir=TB;
        node [shape=box, style="rounded"];

        // Define the nodes
        Total [label="Total population\nn = ', format(n_total, big.mark = ","), '", width=3, fixedsize=true]
        eligible [label="Eligible\nn = ', format(n_eligible, big.mark = ","), '", width=3, fixedsize=true]
        randomized [label="Randomized\nn = ', format(n_randomized, big.mark = ","), '", width=3, fixedsize=true]
        GroupA [label="Group A\nn = ', format(n_GroupA, big.mark = ","), '"]
        GroupB [label="Group B\nn = ', format(n_GroupB, big.mark = ","), '"]
        excluded [label="Excluded (n = ', format(n_refused + n_contraindicated, big.mark = ","), '):\n - refused: ', format(n_refused, big.mark = ","), '\n - contra-indicated: ', format(n_contraindicated, big.mark = ","), '"]

        // Define the edges
        Total -> eligible
        eligible -> randomized
        randomized -> GroupA [label="', format(n_GroupA, big.mark = ","), '"]
        randomized -> GroupB [label="', format(n_GroupB, big.mark = ","), '"]
        eligible -> excluded [style="dashed"]

        // Use a subgraph to align Eligible and Excluded horizontally
        {
            rank=same;
            eligible; excluded;
        }
    }
  '))
}
flowchart_eligible_randomized(1632798, 10032, 122, 43, 49, 12, 18)


#@ end -----
