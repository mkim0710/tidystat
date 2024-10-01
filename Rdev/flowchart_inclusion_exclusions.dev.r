# [Flowchart][Graphviz] library(DiagrammeR) flowchart_inclusion_exclusions().RMD

library(tidyverse)
flowchart_inclusion_exclusions_v3.4 <- function(
  list_n_inclusions = list(
    "Total population" = 2000,
    "Data available" = 1500,
    "Included for analysis" = NA,
    "Data linked with external dataset" = NA
  ),
  list_n_exclusions = list(
    "Excluded due to criteria A" = 100,
    "Excluded due to criteria B" = 200,
    "Excluded due to missing values" = 50
  ),
  output_png_path = paste0("flowchart_inclusion_exclusions", "_", Sys.Date(), ".png")
) {
    library(DiagrammeR)
    library(glue)
    library(DiagrammeRsvg)
    library(rsvg)
    
    # 1. Check if list_n_inclusions contains exactly 4 elements.
  if (length(list_n_inclusions) != 4) stop("The list_n_inclusions must contain exactly 4 elements.")

  # 2. Ensure all elements in list_n_inclusions and list_n_exclusions are either numeric or NA.
  # check_numeric_or_na <- function(vec) {all(map_lgl(vec, ~ is.numeric(.x) || is.na(.x)))}
  check_numeric_or_na <- function(vec) {all(map_lgl(vec, function(.x) is.numeric(.x) || is.na(.x)))}
  if (!check_numeric_or_na(list_n_inclusions) || !check_numeric_or_na(list_n_exclusions)) stop("All elements in list_n_inclusions and list_n_exclusions must be numeric or NA.")

  # 3. Ensure all elements have names, and the names do not contain problematic characters.
  # check_names <- function(vec) all(!is.na(names(vec))) && !any(grepl("[[:punct:]]", names(vec)))
  # check_names <- function(vec) all(!is.na(names(vec))) && !any(grepl("[^a-zA-Z0-9_ .-]", names(vec)))
  # check_names <- function(vec) all(!is.na(names(vec))) && !any(grepl("[^a-zA-Z0-9_ !@#$%&*()\\[\\]\\{\\},.<>=+:\\-\\r\\n]", names(vec)))
  tmp_regex = "[^a-zA-Z0-9_ !@#$%&*()\\[\\]\\{\\},.+:\\-\\r\\n]"
  check_names <- function(vec) all(!is.na(names(vec))) && !any(grepl(tmp_regex, names(vec)))

  if (!check_names(list_n_inclusions) || !check_names(list_n_exclusions)) stop(paste0("All elements in list_n_inclusions and list_n_exclusions must have names. Names should only contain: ", tmp_regex))

  # 4. Optionally, ensure the order of elements in list_n_inclusions makes logical sense.
  # We're assuming that the first item is the total number, so all subsequent numbers 
  # should be less than or equal to this.
  if (!all(sapply(list_n_inclusions[-1], function(x) is.na(x) || x <= list_n_inclusions[[1]])))     stop("Elements in list_n_inclusions must decrease in number or be NA.")
  
    # Retrieve the values from list_n_inclusions
    n_total <- list_n_inclusions[[1]]
    n_eligible <- list_n_inclusions[[2]]
    
    # Formatting numbers
    n_total_formatted <- format(n_total, big.mark = ",")
    n_eligible_formatted <- format(n_eligible, big.mark = ",")
    
    exclusion_nodes <- ""
    prev_node <- "node2"
    i <- 1
    total_exclusions <- 0
    
    for (label in names(list_n_exclusions)) {
        n_exclusion <- list_n_exclusions[[label]]
        total_exclusions <- total_exclusions + n_exclusion
        n_exclusion_formatted <- format(n_exclusion, big.mark = ",")
        
        exclusion_part <- glue("
    blank{i}[label = "", width=0.01, height = 0.01]
    excluded{i}[label = <{label} (n={n_exclusion_formatted})>]
    {prev_node} -> blank{i}[dir = none]
    blank{i} -> excluded{i}[minlen = 2]
    {{ rank = same; blank{i} excluded{i} }}
    ", .envir = list(i = i, label = label, n_exclusion_formatted = n_exclusion_formatted, prev_node = prev_node))
        
        exclusion_nodes <- paste(exclusion_nodes, exclusion_part, sep = "\n")
        
        prev_node <- glue("blank{i}", .envir = list(i = i))
        i <- i + 1
    }
    
    if(is.na(list_n_inclusions[[3]])) {
        n_analysis_formatted <- format(n_eligible - total_exclusions, big.mark = ",")
    } else {
        n_analysis_formatted <- format(list_n_inclusions[[3]], big.mark = ",")
    }
    
    graph_code <- glue("
  digraph my_flowchart {{ 
    graph[splines = ortho]
    node [fontname = Helvetica, shape = box, width=4, height = 1]
    
    node1[label = <{names(list_n_inclusions)[1]}<br/>(n = {n_total_formatted})>]
    node2[label = <{names(list_n_inclusions)[2]}<br/>(n = {n_eligible_formatted})>]
    
    node1 -> node2

    {exclusion_nodes}

    node3[label = <{names(list_n_inclusions)[3]}<br/>(n={n_analysis_formatted})>]
    {prev_node} -> node3
    
    node4[label = <{names(list_n_inclusions)[4]}>]
    node3 -> node4
  }}")
    
    g <- grViz(graph_code)
    
    rsvg_png(charToRaw(export_svg(g)), output_png_path)
    return(g)
}


flowchart_inclusion_exclusions_v3.4()
flowchart_inclusion_exclusions_v3.4(
    list_n_inclusions = list(
        "Total population" = 2000,
        "Data available" = 1500,
        "Included for analysis" = 1200,
        "Data linked with external dataset" = NA),
    list_n_exclusions = list(
        "Excluded due to criteria A" = 100,
        "Excluded due to criteria B" = 200,
        "Excluded due to missing values" = 50))
flowchart_inclusion_exclusions_v3.4(
    list_n_inclusions = list(
        "A" = 2000,
        "b" = 1500,
        "c" = NA,
        "d" = NA),
    list_n_exclusions = list(
        "Excluded due to criteria A" = 100,
        "Excluded due to criteria B" = 200,
        "Excluded due to missing values" = 50))

















flowchart_inclusion_exclusions_v2 <- function(
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
    blank{i}[label = "", width=0.01, height = 0.01]
    excluded{i}[label = <{label} (n={n_exclusion_formatted})>]
    {prev_node} -> blank{i}[dir = none]
    blank{i} -> excluded{i}[minlen = 2]
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
    node [fontname = Helvetica, shape = box, width=4, height = 1]
    
    node0[label = <Total population<br/>(n = {n_total_formatted})>]
    node1[label = <Eligible population<br/>(n = {n_eligible_formatted})>]
    
    node0 -> node1

    {exclusion_nodes}

    node2[label = <Included for analysis<br/>(n={n_analysis_formatted})>]
    {prev_node} -> node2
    
    node3[label = <Data linked with<br/>external dataset>]
    node2 -> node3
  }}")
    
    g <- grViz(graph_code)
    
    rsvg_png(charToRaw(export_svg(g)), output_png_path)
    return(g)
}


list_n_exclusions <- list("Excluded due to criteria A" = 100, "Excluded due to criteria B" = 200, "Excluded due to missing values" = 50)
flowchart_inclusion_exclusions_v2(n_total = 2000, n_eligible = 1500, list_n_exclusions = list_n_exclusions, n_analysis = 1200)
flowchart_inclusion_exclusions_v2(
    n_total = 2000, 
    n_eligible = 1500, 
    list_n_exclusions = list("Excluded due to criteria A" = 100, 
                             "Excluded due to criteria B" = 200, 
                             "Excluded due to missing values" = 50),
    n_analysis = NULL,
    output_png_path = paste0("flowchart_inclusion_exclusions", "_", Sys.Date(), ".png"))


# @@ END-----  
