# https://github.com/jmcphers/rsrecovr/tree/master/R

#' Recover RStudio Files
#'
#' Recovers unsaved changes or abandoned auto-save copies of files
#' previously opened in RStudio.
#'
#' @param project_path The project directory from which to recover files.
#'   Typically a path on disk to the directory. Use the special value
#'   `NULL` to recover files from sessions not associated with projects,
#'   and `"all"` to recover files from every recently used project and
#'   session.
#' @param out_folder The path to which recovered files should be written.
#'   Defaults to the folder "recovered_XXX" in the root of the project
#'   when run on a single project (where XXX is the current date/time),
#'   or the current working directory if not.
#' @param force Whether `out_folder` should be overwritten if it already exists.
#'
#' @return A data frame listing the recovered files.
#'
#' @examples
#' \dontrun{
#' # Recover files in the current project to the temporary directory
#' recovr()
#'
#' # Recover all recent projects/files to a custom folder
#' recovr(project_path = "all", out_folder = "~/scratch/rstudio")
#'
#' }
#'
#' @export

recovr <- function(project_path,
                   out_folder = NULL,
                   force = FALSE) {
  if (missing(project_path)) {
    # user has not specified a project path; try to infer from working dir
    tryCatch({
      project_path <- rprojroot::find_root(rprojroot::is_rstudio_project)
    }, error = function(e) {
      warning("The current path (", getwd(), ") does not appear to be inside ",
              "an RStudio project. Files not open in a project will be ",
              "recovered. Suppress this warning with project_path = NULL ",
              "to explicitly restore files not open in a project.")
      project_path <<- NULL
    })
  }

  # if the user did not specify an output folder, create one
  if (is.null(out_folder)) {
    stem <- paste0("recovered_", format(Sys.time(), "%Y%m%d%H%M"))
    if (!is.null(project_path) && project_path != "all") {
      # we are recovering a single project; put the recovery folder at
      # the project root
      out_folder <- file.path(project_path, stem)
    } else {
      # no project home; just use the current working directory
      out_folder <- file.path(getwd(), stem)
    }
  }

  # establish output folder
  if (file.exists(out_folder)) {
    if (!isTRUE(force)) {
      stop("The output folder ", out_folder, " already exists. Remove it and ",
           "try again, or use force = TRUE to overwrite it.")
    }

    # get old output folder out of the way
    unlink(out_folder, recursive = TRUE)
  }

  # create the output folder and saved/unsaved folders
  dir.create(file.path(out_folder, "saved"), recursive = TRUE)
  dir.create(file.path(out_folder, "unsaved"), recursive = TRUE)

  # recover requested content
  results <- if (is.null(project_path)) {
    # explicitly specifying null recovers user content
    recovr_user(out_folder)
  } else if (identical(project_path, "all")) {
    # explicitly specifying all recovers *everything*
    recovr_all(out_folder)
  } else {
    # otherwise, recover just the project specified
    recovr_project(project_path, out_folder)
  }

  # sum the results which have a restored file; many of the restored buffers
  # wind up not being files (e.g. data viewers)
  total <- length(which(!is.na(results["restored"])))

  message("Recovery complete; recovered ", total, " files to ", out_folder)

  invisible(results)
}


# Recover sessions from a source folder
recovr_sessions <- function(sources_folder, out_folder) {
  # extract all of the session folders from the sources folder
  folders <- list.files(sources_folder)
  session_ids <- folders[grepl("^s-[a-zA-Z0-9]{8}$", folders, perl = TRUE)]

  # recover the sources from each session
  results <- lapply(session_ids, function(session_id) {

    # recover the sources from this session
    recovred <- recovr_sources(file.path(sources_folder, session_id),
                               out_folder)

    if (nrow(recovred) > 0) {
      # we found sources in this folder; tag with the session ID
      cbind(data.frame(session = session_id), recovred)
    } else {
      # no sources here
      NULL
    }
  })

  # combine all the results into a single data frame
  do.call(rbind, results)
}


# Recover a single source file. Returns the path to the recovered file, or NA
# if file recovery did not take place.
recovr_source_file <- function(folder, id, out_folder) {
  metadata <- jsonlite::fromJSON(file.path(folder, id))

  # recover filename
  filename <- if (is.null(metadata$path)) {
    if (is.null(metadata$properties) ||
        is.null(metadata$properties$tempName))
    {
      if (identical(metadata$type, "r_dataframe")) {
        # data viewer object; no filename
        paste0("Data", "-", id)
      } else {
        # no way to infer a name, bail out and use the raw ID
        id
      }
    } else {
      # use the temporary name; e.g. "Untitled1"
      metadata$properties$tempName
    }
  } else {
    # we have a real path; use the base filename
    basename(metadata$path)
  }

  # recover content
  contents_file <- file.path(folder, paste0(id, "-contents"))
  contents <- if (file.exists(contents_file) && file.info(contents_file)$size > 0) {
    # newer RStudio versions keep the contents alongside the metadata
    readLines(con = contents_file)
  } else if (!is.null(metadata$contents) && nchar(metadata$contents) > 0) {
    # older versions use the "contents" value in the JSON metadata
    metadata$contents
  } else {
    "No contents found"
  }

  # put it in saved/unsaved depending on whether or not the file is dirty
  out_folder <- file.path(out_folder, if (isTRUE(metadata$dirty)) {
    # explicitly marked dirty; we know it's unsaved
    "unsaved"
  } else {
    # the dirty flag when unset doesn't reliably tell us if the contents differ
    # from disk since they could have changed; compare contents here.
    if (is.null(metadata$path)) {
      # no file on disk to compare this to, so consider it to be saved
      # (this is probably not a file buffer at all)
      "saved"
    } else {
      if (file.exists(metadata$path)) {
        old_contents <- readLines(metadata$path)
        if (identical(contents, old_contents)) {
          # the file's contents are the same as the contents on disk
          "saved"
        } else {
          # the file in the source database is not the same; consider it
          # unsaved
          "unsaved"
        }
      } else {
        # the file exists in the source database but not on disk, which should
        # be considered unsaved
        "unsaved"
      }
    }
  })

  # ascertain target
  target <- file.path(out_folder, filename)

  # ensure target doesn't exist already; could happen if e.g. user had two
  # different foo.R files open in two different directories. in this case,
  # make the filename unique: foo-0123456.R
  if (file.exists(target)) {
    target <- file.path(out_folder, paste0(
      tools::file_path_sans_ext(filename),
        "-",
        id, ".", tools::file_ext(filename)))
  }

  # save the contents to the file
  writeLines(contents, con = target)

  # return the file we created
  target
}

recovr_sources <- function(folder, out_folder) {
  # list all the files in the sources folder
  files <- list.files(folder)

  # narrow to those that look like IDs
  ids <- files[grepl("^[a-zA-Z0-9]{8}$", files, perl = TRUE)]

  # attempt to recover each id/file
  recovred <- vapply(ids, function(id) {
    recovr_source_file(folder, id, out_folder)
  }, "")

  # return data frame with results
  data.frame(
    filename = basename(recovred),
    id = ids,
    origin = file.path(folder, ids),
    restored = recovred
  )
}

# Recover user-level (no project) files
recovr_user <- function(out_folder) {
  results <- NULL

  # recover sessions for RStudio Desktop
  desktop_folder <- rstudio_desktop_folder()
  if (file.exists(desktop_folder)) {
    results <- recovr_sessions(file.path(desktop_folder, "sources"), out_folder)
  }

  # recover sessions for RStudio Server v1.3. (v1.4 and
  # following use the same folder as desktop so have a more
  # symmetric recovery path)
  server_folder <- path.expand("~/.rstudio")
  if (file.exists(server_folder)) {
    results <- rbind(results, recovr_sessions(
      file.path(server_folder, "sources"),
      out_folder))
  }

  # return results
  results
}

# Recovers RStudio content from a single project
recovr_project <- function(project_folder, out_folder) {

  state_folder <- file.path(normalizePath(project_folder), ".Rproj.user")
  if (!file.exists(state_folder)) {
    stop("The folder ", project_folder, " does not appear to contain an ",
         "RStudio project.")
  }

  # list all the context IDs
  contexts <- list.files(state_folder, pattern = "^[a-zA-Z0-9]{8}$")

  # recover the sources from each context
  results <- lapply(contexts, function(context_id) {
    # recover the sources from this session
    recovred <- recovr_sessions(file.path(state_folder, context_id, "sources"),
                                out_folder)

    if (!is.null(recovred) && nrow(recovred) > 0) {
      # we found sources in this folder; tag with the session ID
      cbind(data.frame(context = context_id), recovred)
    } else {
      # no sources here
      NULL
    }
  })

  # return summary of results
  do.call(rbind, results)
}


rstudio_desktop_folder <- function() {
  # Check for folders specified by an environment variable.
  # This is not common but is a possibility for custom
  # installations of RStudio Server.
  rstudioDataHome <- Sys.getenv("RSTUDIO_DATA_HOME")
  if (nzchar(rstudioDataHome)){
    return(rstudioDataHome)
  }
  xdgDataHome <- Sys.getenv("XDG_DATA_HOME")
  if (nzchar(xdgDataHome)) {
    return(file.path(xdgDataHome, "rstudio"))
  }

  # Check for RStudio 1.4 folders
  v14_folder <- if (identical(.Platform$OS.type, "windows")) {
    file.path(Sys.getenv("LOCALAPPDATA"), "RStudio")
  } else {
    path.expand("~/.local/share/rstudio")
  }
  if (file.exists(v14_folder)) {
    return(v14_folder)
  }

  # Check for RStudio 1.3 and prior folders
  if (identical(.Platform$OS.type, "windows")) {
    file.path(Sys.getenv("LOCALAPPDATA"), "RStudio-Desktop")
  } else {
    path.expand("~/.rstudio-desktop")
  }
}


recovr_all <- function(out_folder) {
  # start with an empty list of projects
  projects <- c()

  # look for a project MRU to examine
  for (folder in c(rstudio_desktop_folder(), path.expand("~/.rstudio"))) {
    mru <- file.path(folder, "monitored", "lists", "project_mru")
    if (file.exists(mru)) {
      projects <- c(projects, readLines(mru))
    }
  }

  results <- NULL

  # restore all the projects in the MRU
  project_results <- lapply(projects, function(mru_entry) {
    # mru_entry points to an rproj file; move up one level
    mru_entry <- dirname(mru_entry)

    # recover files from the project
    results <- recovr_project(path.expand(mru_entry), out_folder)
    if (!is.null(results) && nrow(results) > 0) {
      # found files to recover
      cbind(project = basename(mru_entry), results)
    } else {
      NULL
    }
  })

  # combine all project results
  results <- do.call(rbind, project_results)

  # combine user results
  user_results <- recovr_user(out_folder)
  if (!is.null(user_results) && nrow(user_results) > 0) {
    results <- rbind(results, cbind(project = NA, context = NA, user_results))
  }

  # return everything
  results
}
