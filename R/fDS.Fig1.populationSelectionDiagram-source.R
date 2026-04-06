
##________________________________________________________________________________
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## :: fDS.Fig1.populationSelectionDiagram ====
#' Population Selection Diagram with Automatic Exclusion Tracking
#'
#' @description
#' Generates a CONSORT/STROBE-style population selection flowchart by
#' automatically tracking row counts through a pipeline of inclusion/exclusion
#' criteria. Replaces the manual count specification required by the older
#' \code{flowchart_inclusion_exclusions_v3.4()} approach.
#'
#' Uses the \code{dtrackr} package for automatic tracking when available,
#' with a lightweight fallback that uses \code{DiagrammeR::grViz()} directly.
#'
#' @param .data A data frame (the source population).
#' @param exclusion_criteria A named list where each name is a human-readable
#'   exclusion reason and each value is a quoted expression (via \code{quote()})
#'   evaluating to \code{TRUE} for rows to be \strong{excluded}.
#'   Example:
#'   \preformatted{
#'     list(
#'       "Age < 18"           = quote(age < 18),
#'       "Missing lab values"  = quote(is.na(albumin)),
#'       "DNR at admission"    = quote(dnr == "Yes")
#'     )
#'   }
#' @param source_label Character string for the top box label
#'   (default: \code{"Source population"}).
#' @param final_label Character string for the bottom box label
#'   (default: \code{"Final analytic cohort"}).
#' @param output_path Optional file path for PNG/SVG/PDF export. The format is
#'   determined by the file extension (\code{.png}, \code{.svg}, or \code{.pdf}).
#'   If \code{NULL} (default), no file is written.
#' @param output_width Integer width in pixels for PNG export (default: 1200).
#' @param use_dtrackr Logical. If \code{TRUE} (default), uses \code{dtrackr}
#'   for tracking and diagram generation. If \code{FALSE} or if \code{dtrackr}
#'   is not installed, falls back to a lightweight \code{DiagrammeR::grViz()}
#'   implementation.
#' @param group_by_var Optional character string naming a column to split the
#'   cohort by (e.g., treatment arm) after all exclusions are applied.
#'   Only used when \code{use_dtrackr = TRUE}. The resulting flowchart shows
#'   per-group counts.
#' @param verbose Logical. If \code{TRUE}, prints exclusion counts at each step
#'   to the console (default: \code{TRUE}).
#'
#' @return A list with the following elements:
#'   \describe{
#'     \item{\code{data}}{The filtered data frame (plain, without tracking metadata).}
#'     \item{\code{history}}{A data frame (tibble) recording each exclusion step:
#'       step number, reason, N before, N excluded, N remaining.}
#'     \item{\code{flowchart}}{A \code{grViz} object (the rendered diagram). Display
#'       it by printing in RStudio or calling \code{print()}.}
#'     \item{\code{output_path}}{The file path if export was requested, or \code{NULL}.}
#'   }
#'
#' @examples
#' # Basic usage with iris dataset
#' result <- fDS.Fig1.populationSelectionDiagram(
#'   iris,
#'   exclusion_criteria = list(
#'     "Sepal.Length < 5"  = quote(Sepal.Length < 5),
#'     "Species == setosa" = quote(Species == "setosa")
#'   ),
#'   source_label = "All iris observations",
#'   final_label  = "Analysis set"
#' )
#' result$history
#' result$flowchart
#'
#' # Export to PNG
#' result <- fDS.Fig1.populationSelectionDiagram(
#'   iris,
#'   exclusion_criteria = list(
#'     "Sepal.Length < 5" = quote(Sepal.Length < 5)
#'   ),
#'   output_path = tempfile(fileext = ".png")
#' )
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDS.Fig1.populationSelectionDiagram"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
    .data,
    exclusion_criteria,
    source_label = "Source population",
    final_label = "Final analytic cohort",
    output_path = NULL,
    output_width = 1200,
    use_dtrackr = TRUE,
    group_by_var = NULL,
    verbose = TRUE
) {
    # ── Input validation ─────────────────────────────────────────────────────
    if (!is.data.frame(.data)) {
        stop("'.data' must be a data frame.")
    }
    if (!is.list(exclusion_criteria) || length(exclusion_criteria) == 0) {
        stop("'exclusion_criteria' must be a non-empty named list of quoted expressions.")
    }
    if (is.null(names(exclusion_criteria)) || any(nchar(names(exclusion_criteria)) == 0)) {
        stop("All elements of 'exclusion_criteria' must be named (the name is the exclusion reason).")
    }
    for (nm in names(exclusion_criteria)) {
        if (!is.call(exclusion_criteria[[nm]]) && !is.name(exclusion_criteria[[nm]])) {
            stop("Each element of 'exclusion_criteria' must be a quoted expression (use quote()). ",
                 "Problem with: '", nm, "'")
        }
    }

    # ── Decide backend ───────────────────────────────────────────────────────
    has_dtrackr <- requireNamespace("dtrackr", quietly = TRUE)
    if (use_dtrackr && !has_dtrackr) {
        if (verbose) message("dtrackr package not installed. Falling back to lightweight DiagrammeR backend.")
        use_dtrackr <- FALSE
    }

    # ── Route to backend ─────────────────────────────────────────────────────
    if (use_dtrackr) {
        result <- .fDS.Fig1._dtrackr_backend(
            .data = .data,
            exclusion_criteria = exclusion_criteria,
            source_label = source_label,
            final_label = final_label,
            group_by_var = group_by_var,
            verbose = verbose
        )
    } else {
        result <- .fDS.Fig1._grViz_backend(
            .data = .data,
            exclusion_criteria = exclusion_criteria,
            source_label = source_label,
            final_label = final_label,
            verbose = verbose
        )
    }

    # ── Export if requested ──────────────────────────────────────────────────
    if (!is.null(output_path)) {
        result$output_path <- .fDS.Fig1._export(
            grViz_object = result$flowchart,
            output_path = output_path,
            output_width = output_width,
            verbose = verbose
        )
    } else {
        result$output_path <- NULL
    }

    return(result)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#### (ALIAS) populationSelectionDiagram  ----
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "populationSelectionDiagram")


##________________________________________________________________________________
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## :: .fDS.Fig1._dtrackr_backend (internal) ====
#' @description Internal: dtrackr-based exclusion tracking and flowchart generation.
#' @keywords internal
.tmp$env1_subenv_name = "f"
.tmp$objectname = ".fDS.Fig1._dtrackr_backend"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
    .data,
    exclusion_criteria,
    source_label,
    final_label,
    group_by_var,
    verbose
) {
    # Build history manually (dtrackr::history() format varies by version)
    history_rows <- list()
    step <- 0L

    # Start tracking
    tracked <- .data %>%
        dtrackr::track(.messages = NULL) %>%
        dtrackr::comment("{source_label}\n(n = {.count})")

    n_current <- nrow(.data)
    step <- step + 1L
    history_rows[[step]] <- data.frame(
        step = step,
        reason = source_label,
        n_before = n_current,
        n_excluded = 0L,
        n_remaining = n_current,
        stringsAsFactors = FALSE
    )

    if (verbose) {
        message(sprintf("Step %d: %s  (n = %s)",
                        step, source_label, format(n_current, big.mark = ",")))
    }

    # Apply each exclusion criterion sequentially
    for (reason in names(exclusion_criteria)) {
        expr <- exclusion_criteria[[reason]]
        n_before <- nrow(tracked)

        # Rows where the expression is TRUE are EXCLUDED
        # Use base R eval to apply the filter (dtrackr wraps dplyr::filter)
        tracked <- tracked %>%
            dplyr::filter(!eval(expr))

        n_after <- nrow(tracked)
        n_excl <- n_before - n_after

        tracked <- tracked %>%
            dtrackr::comment(
                "Excluded: {reason}\n(n = {n_excl} removed, {.count} remaining)",
                .envir = rlang::current_env()
            )

        step <- step + 1L
        history_rows[[step]] <- data.frame(
            step = step,
            reason = reason,
            n_before = n_before,
            n_excluded = n_excl,
            n_remaining = n_after,
            stringsAsFactors = FALSE
        )

        if (verbose) {
            message(sprintf("Step %d: Excluded '%s'  (-%s, remaining: %s)",
                            step, reason,
                            format(n_excl, big.mark = ","),
                            format(n_after, big.mark = ",")))
        }
    }

    # Optional group split
    if (!is.null(group_by_var)) {
        if (!group_by_var %in% names(tracked)) {
            warning("group_by_var '", group_by_var, "' not found in data. Skipping group split.")
        } else {
            tracked <- tracked %>%
                dplyr::group_by(.data[[group_by_var]]) %>%
                dtrackr::comment("{group_by_var} = {.strata}\n(n = {.count})")
        }
    }

    # Final label
    tracked <- tracked %>%
        dtrackr::comment("{final_label}\n(n = {.count})")

    step <- step + 1L
    n_final <- nrow(tracked)
    history_rows[[step]] <- data.frame(
        step = step,
        reason = final_label,
        n_before = n_final,
        n_excluded = 0L,
        n_remaining = n_final,
        stringsAsFactors = FALSE
    )

    if (verbose) {
        message(sprintf("Step %d: %s  (n = %s)",
                        step, final_label, format(n_final, big.mark = ",")))
    }

    # Build history tibble
    history_df <- do.call(rbind, history_rows)
    if (requireNamespace("tibble", quietly = TRUE)) {
        history_df <- tibble::as_tibble(history_df)
    }

    # Generate flowchart (returns a grViz/htmlwidget object)
    fc <- tracked %>% dtrackr::flowchart()

    # Strip tracking metadata from the returned data
    clean_data <- tracked %>% dtrackr::untrack()

    list(
        data = clean_data,
        history = history_df,
        flowchart = fc
    )
}


##________________________________________________________________________________
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## :: .fDS.Fig1._grViz_backend (internal) ====
#' @description Internal: Lightweight DiagrammeR::grViz() backend for when
#'   dtrackr is not available. Produces the same output structure.
#' @keywords internal
.tmp$env1_subenv_name = "f"
.tmp$objectname = ".fDS.Fig1._grViz_backend"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
    .data,
    exclusion_criteria,
    source_label,
    final_label,
    verbose
) {
    if (!requireNamespace("DiagrammeR", quietly = TRUE)) {
        stop("DiagrammeR package is required. Install with: install.packages('DiagrammeR')")
    }

    # ── Apply exclusions and track counts ────────────────────────────────────
    history_rows <- list()
    step <- 0L
    current_data <- .data
    n_current <- nrow(current_data)

    step <- step + 1L
    history_rows[[step]] <- data.frame(
        step = step,
        reason = source_label,
        n_before = n_current,
        n_excluded = 0L,
        n_remaining = n_current,
        stringsAsFactors = FALSE
    )

    if (verbose) {
        message(sprintf("Step %d: %s  (n = %s)",
                        step, source_label, format(n_current, big.mark = ",")))
    }

    # Node definitions for Graphviz DOT
    # node0 = source, node1..nodeK = after each exclusion, nodeK+1 = final
    node_defs <- sprintf(
        '    node0[label = <%s<br/>(n = %s)>]',
        .grViz_escape_html(source_label),
        format(n_current, big.mark = ",")
    )
    edge_defs <- character(0)
    exclusion_node_defs <- character(0)
    rank_defs <- character(0)

    prev_node <- "node0"

    for (i in seq_along(exclusion_criteria)) {
        reason <- names(exclusion_criteria)[i]
        expr <- exclusion_criteria[[i]]

        n_before <- nrow(current_data)

        # Evaluate the exclusion expression; rows where TRUE are removed
        keep_mask <- !eval(expr, envir = current_data, enclos = parent.frame())
        # Handle NAs in the mask: NA means "don't exclude" (conservative)
        keep_mask[is.na(keep_mask)] <- TRUE
        current_data <- current_data[keep_mask, , drop = FALSE]

        n_after <- nrow(current_data)
        n_excl <- n_before - n_after

        step <- step + 1L
        history_rows[[step]] <- data.frame(
            step = step,
            reason = reason,
            n_before = n_before,
            n_excluded = n_excl,
            n_remaining = n_after,
            stringsAsFactors = FALSE
        )

        if (verbose) {
            message(sprintf("Step %d: Excluded '%s'  (-%s, remaining: %s)",
                            step, reason,
                            format(n_excl, big.mark = ","),
                            format(n_after, big.mark = ",")))
        }

        # Graphviz nodes: blank junction + exclusion box (side branch)
        blank_id <- sprintf("blank%d", i)
        excl_id <- sprintf("excluded%d", i)
        next_node <- sprintf("node%d", i)

        # Selection node (remaining after this exclusion)
        node_defs <- c(node_defs, sprintf(
            '    %s[label = <After excluding: %s<br/>(n = %s)>]',
            next_node,
            .grViz_escape_html(reason),
            format(n_after, big.mark = ",")
        ))

        # Exclusion box (side branch)
        exclusion_node_defs <- c(exclusion_node_defs, sprintf(
            '    %s[label = "", width=0.01, height=0.01]',
            blank_id
        ))
        exclusion_node_defs <- c(exclusion_node_defs, sprintf(
            '    %s[label = <Excluded: %s<br/>(n = %s)>]',
            excl_id,
            .grViz_escape_html(reason),
            format(n_excl, big.mark = ",")
        ))

        # Edges: prev -> blank (no arrow), blank -> exclusion (side), blank -> next
        edge_defs <- c(edge_defs, sprintf('    %s -> %s[dir = none]', prev_node, blank_id))
        edge_defs <- c(edge_defs, sprintf('    %s -> %s[minlen = 2]', blank_id, excl_id))
        edge_defs <- c(edge_defs, sprintf('    %s -> %s', blank_id, next_node))

        # Rank constraint: blank and exclusion box on same row
        rank_defs <- c(rank_defs, sprintf('    { rank = same; %s; %s; }', blank_id, excl_id))

        prev_node <- next_node
    }

    # Final node
    final_node <- sprintf("final_node")
    node_defs <- c(node_defs, sprintf(
        '    %s[label = <%s<br/>(n = %s)>]',
        final_node,
        .grViz_escape_html(final_label),
        format(nrow(current_data), big.mark = ",")
    ))
    edge_defs <- c(edge_defs, sprintf('    %s -> %s', prev_node, final_node))

    step <- step + 1L
    history_rows[[step]] <- data.frame(
        step = step,
        reason = final_label,
        n_before = nrow(current_data),
        n_excluded = 0L,
        n_remaining = nrow(current_data),
        stringsAsFactors = FALSE
    )

    if (verbose) {
        message(sprintf("Step %d: %s  (n = %s)",
                        step, final_label, format(nrow(current_data), big.mark = ",")))
    }

    # ── Assemble DOT code ────────────────────────────────────────────────────
    dot_code <- paste0(
        'digraph population_selection {\n',
        '    graph[splines = ortho]\n',
        '    node [fontname = Helvetica, shape = box, width = 4, height = 1]\n',
        '\n',
        paste(node_defs, collapse = "\n"), '\n',
        '\n',
        paste(exclusion_node_defs, collapse = "\n"), '\n',
        '\n',
        paste(edge_defs, collapse = "\n"), '\n',
        '\n',
        paste(rank_defs, collapse = "\n"), '\n',
        '}'
    )

    fc <- DiagrammeR::grViz(dot_code)

    # Build history tibble
    history_df <- do.call(rbind, history_rows)
    if (requireNamespace("tibble", quietly = TRUE)) {
        history_df <- tibble::as_tibble(history_df)
    }

    list(
        data = current_data,
        history = history_df,
        flowchart = fc
    )
}


##________________________________________________________________________________
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## :: .fDS.Fig1._export (internal) ====
#' @description Internal: Export a grViz object to PNG, SVG, or PDF.
#' @keywords internal
.tmp$env1_subenv_name = "f"
.tmp$objectname = ".fDS.Fig1._export"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
    grViz_object,
    output_path,
    output_width = 1200,
    verbose = TRUE
) {
    ext <- tolower(tools::file_ext(output_path))

    if (ext == "svg") {
        if (!requireNamespace("DiagrammeRsvg", quietly = TRUE)) {
            stop("DiagrammeRsvg package is required for SVG export. Install with: install.packages('DiagrammeRsvg')")
        }
        svg_text <- DiagrammeRsvg::export_svg(grViz_object)
        writeLines(svg_text, output_path)
    } else if (ext == "png") {
        if (!requireNamespace("DiagrammeRsvg", quietly = TRUE) ||
            !requireNamespace("rsvg", quietly = TRUE)) {
            stop("DiagrammeRsvg and rsvg packages are required for PNG export. ",
                 "Install with: install.packages(c('DiagrammeRsvg', 'rsvg'))")
        }
        svg_raw <- charToRaw(DiagrammeRsvg::export_svg(grViz_object))
        rsvg::rsvg_png(svg_raw, output_path, width = output_width)
    } else if (ext == "pdf") {
        if (!requireNamespace("DiagrammeRsvg", quietly = TRUE) ||
            !requireNamespace("rsvg", quietly = TRUE)) {
            stop("DiagrammeRsvg and rsvg packages are required for PDF export. ",
                 "Install with: install.packages(c('DiagrammeRsvg', 'rsvg'))")
        }
        svg_raw <- charToRaw(DiagrammeRsvg::export_svg(grViz_object))
        rsvg::rsvg_pdf(svg_raw, output_path)
    } else {
        stop("Unsupported output format: '.", ext, "'. Use .png, .svg, or .pdf.")
    }

    if (verbose) message("Saved: ", output_path)
    return(output_path)
}


##________________________________________________________________________________
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## :: .grViz_escape_html (internal utility) ====
#' @description Internal: Escape special characters for Graphviz HTML labels.
#' @keywords internal
.tmp$env1_subenv_name = "f"
.tmp$objectname = ".grViz_escape_html"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(x) {
    x <- gsub("&", "&amp;", x, fixed = TRUE)
    x <- gsub("<", "&lt;", x, fixed = TRUE)
    x <- gsub(">", "&gt;", x, fixed = TRUE)
    x
}


##////////////////////////////////////////////////////////////////////////////////
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##********************************************************************************
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##________________________________________________________________________________
#|________________________________________________________________________________|#  ----
# 〚〛 END -----
##________________________________________________________________________________
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##________________________________________________________________________________
