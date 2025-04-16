# fDfFromToRelationship_CodeText4Mermaid-cl-better.R


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fDfFromToRelationship_CodeText4Mermaid ====  
#' @title Generate Mermaid Flowchart from Edge Relationship Data
#'
#' @description Converts edge relationships from a data frame into Mermaid flowchart code with
#'              customizable styling options and optional edge chaining.
#'
#' @param df Data frame containing edge relationships
#' @param fromCol Source node column name (default: "From")
#' @param toCol Target node column name (default: "To")
#' @param direction Flowchart direction: "TD" (top-down), "BT" (bottom-top),
#'                  "LR" (left-right), or "RL" (right-left) (default: "LR")
#' @param nodeShape Node style starter (default: "[/" for trapezoid)
#' @param nodeShapeEnd Node style ending (default: "/]")
#' @param nodePrefix Prefix for node IDs (default: "")
#' @param chain Enable edge chaining for consecutive paths (default: FALSE)
#' @param includeHeader Include flowchart declaration (default: TRUE)
#' @param verbose Show debugging output (default: FALSE)
#'
#' @return Character string containing Mermaid flowchart code
#'
#' @examples
#' library(tibble)
#' dfTest <- tibble::tribble(
#'   ~From, ~To,
#'   "A", "B",
#'   "A", "C",
#'   "B", "C",
#'   "B", "D"
#' )
#' 
#' # Basic usage
#' mermaidCode <- fDfFromToRelationship_CodeText4Mermaid(dfTest)
#' cat(mermaidCode)
#' 
#' # With edge chaining and left-to-right direction
#' mermaidCode <- fDfFromToRelationship_CodeText4Mermaid(
#'   dfTest, 
#'   direction = "LR", 
#'   chain = TRUE
#' )
#' cat(mermaidCode)
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDfFromToRelationship_CodeText4Mermaid"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(df, 
                                                 fromCol = "From",
                                                 toCol = "To",
                                                 direction = "LR",
                                                 nodeShape = "[/\"",
                                                 nodeShapeEnd = "\"/]",
                                                 nodePrefix = "",
                                                 chain = FALSE,
                                                 includeHeader = TRUE,
                                                 verbose = FALSE) {
  
  # ----- Input Validation -----
  if (!is.data.frame(df)) {
    stop("Input must be a data frame")
  }
  
  requiredCols <- c(fromCol, toCol)
  missingCols <- setdiff(requiredCols, names(df))
  if (length(missingCols) > 0) {
    stop("Missing required columns: ", paste(missingCols, collapse = ", "))
  }
  
  # Validate node shape
  validShapes <- list(
    start = c("[\"", "(\"", "((\"", "[[\"", "[/\"", "[\\\"", "{\""),
    end = c("\"]", "\")", "\"))", "\"]]", "\"/]", "\"\\]", "\"}")
  )
  
  if (!nodeShape %in% validShapes$start || !nodeShapeEnd %in% validShapes$end) {
    warning("Invalid node shape. Using default trapezoid")
    nodeShape <- "[/\""
    nodeShapeEnd <- "\"/]"
  }
  
  # Validate direction
  validDirections <- c("TD", "BT", "LR", "RL", "TB")
  if (!direction %in% validDirections) {
    warning("Invalid direction. Using default LR. Valid options are: ", 
            paste(setdiff(validDirections, "TB"), collapse = ", "))
    direction <- "LR"
  }
  
  # Handle TD/TB equivalence (both are valid in Mermaid)
  if (direction == "TB") direction <- "TD"
  
  # ----- Node Processing -----
  # Ensure data is in character format (handles factors)
  df[[fromCol]] <- as.character(df[[fromCol]])
  df[[toCol]] <- as.character(df[[toCol]])
  
  # Apply node prefixes
  if (nchar(nodePrefix) > 0) {
    fromColValues <- paste0(nodePrefix, df[[fromCol]])
    toColValues <- paste0(nodePrefix, df[[toCol]])
  } else {
    fromColValues <- df[[fromCol]]
    toColValues <- df[[toCol]]
  }
  
  # Extract unique nodes and sort them
  uniqueNodesVec <- sort(unique(c(fromColValues, toColValues)))
  
  if (verbose) {
    message("Unique nodes found: ", paste(uniqueNodesVec, collapse = ", "))
  }
  
  # Generate node definitions with labels (original node name without prefix)
  nodeDefinitionsVec <- paste0(uniqueNodesVec, nodeShape, 
                             sub(paste0("^", nodePrefix), "", uniqueNodesVec), 
                             nodeShapeEnd)
  
  # ----- Edge Processing -----
  if (chain) {
    # Create a temporary data frame with prefixed values for chaining
    dfPrefixed <- data.frame(
      From = fromColValues,
      To = toColValues,
      stringsAsFactors = FALSE
    )
    
    # For chaining, we need to properly graph-analyze the edges
    # This implementation correctly identifies path sequences
    edgesVec <- fDfFromToRelationship_findChainedPaths(dfPrefixed, verbose)
    
  } else {
    # Simple approach: direct edges
    edgesVec <- paste0(fromColValues, " --> ", toColValues)
  }
  
  # ----- Assemble Mermaid Code -----
  # Create components
  componentsListText <- list(
    header = if (includeHeader) paste0("flowchart ", direction) else NULL,
    nodes = paste(nodeDefinitionsVec, collapse = "\n"),
    edges = paste(edgesVec, collapse = "\n")
  )
  
  # Filter out NULL components
  componentsToPaste <- componentsListText[!sapply(componentsListText, is.null)]
  
  if (verbose) {
    message("Components generated:")
    print(componentsToPaste)
  }
  
  # Combine non-NULL components with proper spacing
  mermaidResultText <- paste(componentsToPaste, collapse = "\n\n")
  
  # Clean up any redundant whitespace
  mermaidResultText <- trimws(mermaidResultText)
  
  mermaidResultText = paste0(mermaidResultText, "\n")
  mermaidResultText = paste0("```mermaid\n", mermaidResultText, "```\n")
  
  return(mermaidResultText)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) generateCodeText4Mermaid  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "generateCodeText4Mermaid")


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## fDfFromToRelationship_findChainedPaths  ----  
#' Helper function for finding chained paths in a graph
#' @keywords internal
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDfFromToRelationship_findChainedPaths"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(df, verbose = FALSE) {
  # Create an adjacency list representation of the graph
  adjacencyList <- list()
  
  # Build the adjacency list
  for (i in 1:nrow(df)) {
    from <- df$From[i]
    to <- df$To[i]
    
    # Initialize if needed
    if (is.null(adjacencyList[[from]])) {
      adjacencyList[[from]] <- character(0)
    }
    
    # Add connection
    adjacencyList[[from]] <- c(adjacencyList[[from]], to)
  }
  
  # Remove duplicates from adjacency list
  for (node in names(adjacencyList)) {
    adjacencyList[[node]] <- unique(adjacencyList[[node]])
  }
  
  if (verbose) {
    message("Adjacency list:")
    print(adjacencyList)
  }
  
  # Function to find paths starting from a node
  fInternal_buildChainedPaths <- function(node, visited = character(0)) {
    # If node has no outgoing edges or all edges lead to already visited nodes
    if (is.null(adjacencyList[[node]]) || 
        all(adjacencyList[[node]] %in% visited)) {
      return(node)
    }
    
    # Mark current node as visited
    visited <- c(visited, node)
    
    # For each adjacent node not yet visited
    result <- character(0)
    for (next_node in adjacencyList[[node]]) {
      if (!(next_node %in% visited)) {
        # Recursively build paths from the next node
        path <- fInternal_buildChainedPaths(next_node, visited)
        # Add current node to the beginning of each path
        result <- c(result, paste(node, "-->", path))
      } else {
        # Direct edge to already visited node
        result <- c(result, paste(node, "-->", next_node))
      }
    }
    
    return(result)
  }
  
  # Find all starting points (nodes that are not pointed to by any other node)
  allTargets <- unique(df$To)
  allSources <- unique(df$From)
  startNodes <- setdiff(allSources, allTargets)
  
  # If no clear starting points, use all sources
  if (length(startNodes) == 0) {
    startNodes <- allSources
  }
  
  if (verbose) {
    message("Start nodes:", paste(startNodes, collapse = ", "))
  }
  
  # Build all paths from starting nodes
  allPaths <- character(0)
  for (start in startNodes) {
    paths <- fInternal_buildChainedPaths(start)
    allPaths <- c(allPaths, paths)
  }
  
  # Ensure we handle any disconnected subgraphs
  covered <- character(0)
  for (path in allPaths) {
    nodes <- strsplit(path, " --> ")[[1]]
    covered <- c(covered, nodes)
  }
  covered <- unique(covered)
  
  # Add any missing edges (those not included in any path)
  for (i in 1:nrow(df)) {
    edge <- paste(df$From[i], "-->", df$To[i])
    if (!any(grepl(edge, allPaths, fixed = TRUE))) {
      allPaths <- c(allPaths, edge)
    }
  }
  
  if (verbose) {
    message("Found paths:")
    print(allPaths)
  }
  
  return(allPaths)
}

# #@ examples ----
# library(tibble)
# dfTest <- tibble::tribble(
#   ~From, ~To,
#   "A", "B",
#   "A", "C",
#   "B", "C",
#   "B", "D"
# )
# 
# # Basic usage
# mermaidCode <- fDfFromToRelationship_CodeText4Mermaid(dfTest)
# cat(mermaidCode)
# # flowchart LR
# # 
# # A[/A/]
# # B[/B/]
# # C[/C/]
# # D[/D/]
# # 
# # A --> B
# # A --> C
# # B --> C
# # B --> D
# 
# # With edge chaining and left-to-right direction
# mermaidCode <- fDfFromToRelationship_CodeText4Mermaid(
#   dfTest,
#   direction = "LR",
#   chain = TRUE
# )
# cat(mermaidCode)
# # > cat(mermaidCode)
# # flowchart LR
# # 
# # A[/A/]
# # B[/B/]
# # C[/C/]
# # D[/D/]
# # 
# # A --> B --> C
# # A --> B --> D
# # A --> C
