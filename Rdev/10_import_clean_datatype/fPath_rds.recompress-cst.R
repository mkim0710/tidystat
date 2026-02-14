#!/usr/bin/env Rscript
# ==============================================================================
# RDS Recompression: Auto-Selector with Intelligent Fallback
# ==============================================================================
# BEST-OF-ALL approach combining:
# - Auto-selector pattern (chooses bash vs R automatically)
# - Negative compression values with fallback (platform-aware xz -e)
# - Comprehensive error handling and reporting
# - Follows all coding standards (§0-99)
# ==============================================================================

# Setup and Configuration ----

if (!require("fs", quietly = TRUE)) install.packages("fs")
if (!require("purrr", quietly = TRUE)) install.packages("purrr")

library(fs)
library(purrr)

VERBOSE = isTRUE(getOption("verbose"))


# File Discovery Functions ----

#' List RDS Files Under Root Directory
#'
#' @description
#' Recursively finds all RDS files, excluding common non-data directories.
#'
#' @param rootDirText Character(1). Root directory path.
#' @param recursiveLog Logical. Search subdirectories.
#' @param excludePatternVec Character vector. Patterns to exclude.
#' @param verboseLog Logical. Print progress.
#'
#' @return Character vector of file paths.
#'
#' @examples
#' \dontrun{
#' filesVec = fPathText_list_rdsFiles_Vec(
#'   rootDirText = ".",
#'   recursiveLog = TRUE
#' )
#' }
#'
#' @export
fPathText_list_rdsFiles_Vec = function(
    rootDirText = ".",
    recursiveLog = TRUE,
    excludePatternVec = c("\\.git", "renv", "packrat", "backup_"),
    verboseLog = VERBOSE
) {
  
  # Input validation ----
  stopifnot(
    is.character(rootDirText),
    length(rootDirText) == 1L
  )
  
  if (!dir.exists(rootDirText)) {
    stop("Error: Directory does not exist: ", rootDirText)
  }
  
  if (verboseLog) {
    cat("[INFO] Searching for RDS files in:", rootDirText, "\n")
  }
  
  # Find all RDS files ----
  allFilesVec = list.files(
    path = rootDirText,
    pattern = "\\.rds$",
    ignore.case = TRUE,
    recursive = recursiveLog,
    full.names = TRUE,
    include.dirs = FALSE
  )
  
  # Filter existing files only ----
  existingFilesVec = allFilesVec[file.exists(allFilesVec)]
  
  # Apply exclusion patterns ----
  if (length(excludePatternVec) > 0 && length(existingFilesVec) > 0) {
    excludeRegex = paste(excludePatternVec, collapse = "|")
    keepLogicalVec = !grepl(excludeRegex, existingFilesVec, ignore.case = TRUE)
    resultFilesVec = existingFilesVec[keepLogicalVec]
    
    if (verboseLog && any(!keepLogicalVec)) {
      cat("[INFO] Excluded", sum(!keepLogicalVec), "files\n")
    }
  } else {
    resultFilesVec = existingFilesVec
  }
  
  if (verboseLog) {
    cat("[INFO] Found", length(resultFilesVec), "RDS files\n")
  }
  
  unname(resultFilesVec)
}


#' Detect Compression Type from File Header
#'
#' @description
#' Reads magic bytes to determine compression without loading full file.
#'
#' @param pathText Character(1). File path.
#'
#' @return Character. One of: "xz", "gzip", "bzip2", "none".
#'
#' @details
#' Magic byte signatures:
#' - xz: 0xfd 0x37 0x7a 0x58 0x5a 0x00
#' - gzip: 0x1f 0x8b
#' - bzip2: 0x42 0x5a 0x68
#'
#' @export
fPathText_detect_compression_Text = function(pathText) {
  
  if (!file.exists(pathText)) {
    stop("Error: File does not exist: ", pathText)
  }
  
  # Read file header ----
  con = file(pathText, "rb")
  on.exit(close(con), add = TRUE)
  
  headerBytes = readBin(con, what = "raw", n = 6L)
  
  # Detect compression type ----
  if (length(headerBytes) >= 6L &&
      identical(headerBytes[1:6], as.raw(c(0xfd, 0x37, 0x7a, 0x58, 0x5a, 0x00)))) {
    return("xz")
  }
  
  if (length(headerBytes) >= 2L &&
      identical(headerBytes[1:2], as.raw(c(0x1f, 0x8b)))) {
    return("gzip")
  }
  
  if (length(headerBytes) >= 3L &&
      identical(headerBytes[1:3], as.raw(c(0x42, 0x5a, 0x68)))) {
    return("bzip2")
  }
  
  return("none")
}


# Pure R Streaming Backend ----

#' Stream Single RDS File to xz Compression
#'
#' @description
#' Byte-stream transcoding without deserializing R objects.
#' Memory usage is bounded by chunk size, not object size.
#'
#' @param pathText Character(1). Input RDS file path.
#' @param useExtremeLog Logical. Attempt xz extreme mode (-e flag).
#' @param skipIfLargerLog Logical. Keep original if xz result is larger.
#' @param keepBackupLog Logical. Create .bak file before replacing.
#' @param chunkBytesInt Integer. Buffer size for streaming.
#' @param verboseLog Logical. Print progress.
#'
#' @return Data frame (one row) with compression statistics.
#'
#' @details
#' IMPORTANT: xz extreme mode via negative compression values is
#' platform/build-dependent. This function attempts it with fallback
#' to standard level 9 if unsupported.
#'
#' Compression levels:
#' - useExtremeLog = FALSE: xzfile(compress = 9)
#' - useExtremeLog = TRUE: xzfile(compress = -9) with fallback to 9
#'
#' Platform support:
#' - Linux/Mac: Usually supports negative values
#' - Windows: May not support negative values (fallback applies)
#' - Older R versions: May not support negative values
#'
#' @examples
#' \dontrun{
#' resultDf = fPathText_stream_to_xz_RowDf(
#'   pathText = "data/myfile.rds",
#'   useExtremeLog = TRUE,
#'   skipIfLargerLog = TRUE
#' )
#' }
#'
#' @export
fPathText_stream_to_xz_RowDf = function(
    pathText,
    useExtremeLog = TRUE,
    skipIfLargerLog = TRUE,
    keepBackupLog = FALSE,
    chunkBytesInt = 1024L * 1024L,
    verboseLog = VERBOSE
) {
  
  # Input validation ----
  stopifnot(
    is.character(pathText),
    length(pathText) == 1L,
    file.exists(pathText)
  )
  
  # Get original file info ----
  oldInfo = file.info(pathText)
  oldSizeDbl = as.double(oldInfo$size)
  oldPermOct = oldInfo$mode
  oldMtime = oldInfo$mtime
  oldCodecText = fPathText_detect_compression_Text(pathText)
  
  if (verboseLog) {
    cat("\n[PROCESSING]", basename(pathText), "\n")
    cat("  Current compression:", oldCodecText, "\n")
    cat("  Size:", format(oldSizeDbl, big.mark = ","), "bytes\n")
  }
  
  # Skip if already xz ----
  if (oldCodecText == "xz") {
    if (verboseLog) {
      cat("  [SKIP] Already xz compressed\n")
    }
    return(data.frame(
      path = pathText,
      old_codec = oldCodecText,
      old_size = oldSizeDbl,
      new_size = oldSizeDbl,
      saved_bytes = 0,
      saved_pct = 0,
      action = "skipped_already_xz",
      error = NA_character_,
      stringsAsFactors = FALSE
    ))
  }
  
  # Open input stream based on current compression ----
  inCon = switch(
    oldCodecText,
    gzip = gzfile(pathText, "rb"),
    bzip2 = bzfile(pathText, "rb"),
    xz = xzfile(pathText, "rb"),
    file(pathText, "rb")
  )
  on.exit(try(close(inCon), silent = TRUE), add = TRUE)
  
  # Create temporary output file ----
  tmpPath = paste0(pathText, ".tmp.xz")
  
  # Attempt xz extreme mode if requested ----
  # CRITICAL: Negative compression values are platform-dependent
  # Always include fallback to positive level 9
  
  levelInt = 9L
  reqLevelInt = if (isTRUE(useExtremeLog)) -abs(levelInt) else levelInt
  
  if (verboseLog && useExtremeLog) {
    cat("  Attempting xz extreme mode (compression = -9)...\n")
  }
  
  # Try extreme mode, fallback to standard if unsupported ----
  outCon = try(
    xzfile(tmpPath, "wb", compression = reqLevelInt),
    silent = TRUE
  )
  
  if (inherits(outCon, "try-error")) {
    if (verboseLog) {
      cat("  [INFO] Extreme mode not supported, using standard level 9\n")
    }
    outCon = xzfile(tmpPath, "wb", compression = 9L)
  } else if (verboseLog && useExtremeLog) {
    cat("  [SUCCESS] Using xz extreme mode\n")
  }
  
  on.exit({
    try(close(outCon), silent = TRUE)
    if (file.exists(tmpPath)) unlink(tmpPath)
  }, add = TRUE)
  
  # Stream bytes in chunks ----
  if (verboseLog) {
    cat("  Streaming bytes...\n")
  }
  
  repeat {
    bufferBytes = readBin(inCon, what = "raw", n = chunkBytesInt)
    if (length(bufferBytes) == 0L) break
    writeBin(bufferBytes, outCon, useBytes = TRUE)
  }
  
  # Close connections ----
  try(close(inCon), silent = TRUE)
  try(close(outCon), silent = TRUE)
  
  # Verify output ----
  if (!file.exists(tmpPath)) {
    return(data.frame(
      path = pathText,
      old_codec = oldCodecText,
      old_size = oldSizeDbl,
      new_size = NA_real_,
      saved_bytes = NA_real_,
      saved_pct = NA_real_,
      action = "failed",
      error = "output_file_not_created",
      stringsAsFactors = FALSE
    ))
  }
  
  newSizeDbl = as.double(file.info(tmpPath)$size)
  
  if (!is.finite(newSizeDbl) || newSizeDbl <= 0) {
    unlink(tmpPath)
    return(data.frame(
      path = pathText,
      old_codec = oldCodecText,
      old_size = oldSizeDbl,
      new_size = NA_real_,
      saved_bytes = NA_real_,
      saved_pct = NA_real_,
      action = "failed",
      error = "empty_output",
      stringsAsFactors = FALSE
    ))
  }
  
  # Skip if larger ----
  if (isTRUE(skipIfLargerLog) && newSizeDbl >= oldSizeDbl) {
    if (verboseLog) {
      cat("  [SKIP] New file larger (", format(newSizeDbl, big.mark = ","),
          "bytes)\n")
    }
    unlink(tmpPath)
    return(data.frame(
      path = pathText,
      old_codec = oldCodecText,
      old_size = oldSizeDbl,
      new_size = newSizeDbl,
      saved_bytes = oldSizeDbl - newSizeDbl,
      saved_pct = if (oldSizeDbl > 0) {
        100 * (oldSizeDbl - newSizeDbl) / oldSizeDbl
      } else {
        NA_real_
      },
      action = "skipped_larger",
      error = NA_character_,
      stringsAsFactors = FALSE
    ))
  }
  
  # Create backup if requested ----
  if (isTRUE(keepBackupLog)) {
    bakPath = paste0(pathText, ".bak")
    try(file.copy(pathText, bakPath, overwrite = TRUE), silent = TRUE)
    if (verboseLog) {
      cat("  [BACKUP] Created:", basename(bakPath), "\n")
    }
  }
  
  # Replace original file atomically ----
  replaceOk = file.rename(tmpPath, pathText)
  if (!replaceOk) {
    replaceOk = file.copy(tmpPath, pathText, overwrite = TRUE)
    unlink(tmpPath)
  }
  
  if (!replaceOk) {
    return(data.frame(
      path = pathText,
      old_codec = oldCodecText,
      old_size = oldSizeDbl,
      new_size = newSizeDbl,
      saved_bytes = oldSizeDbl - newSizeDbl,
      saved_pct = if (oldSizeDbl > 0) {
        100 * (oldSizeDbl - newSizeDbl) / oldSizeDbl
      } else {
        NA_real_
      },
      action = "failed",
      error = "replace_failed",
      stringsAsFactors = FALSE
    ))
  }
  
  # Restore metadata ----
  try(Sys.setFileTime(pathText, oldMtime), silent = TRUE)
  try(Sys.chmod(pathText, mode = as.octmode(oldPermOct)), silent = TRUE)
  
  # Calculate final statistics ----
  finalSizeDbl = as.double(file.size(pathText))
  savedBytesDbl = oldSizeDbl - finalSizeDbl
  savedPctDbl = if (oldSizeDbl > 0) {
    100 * savedBytesDbl / oldSizeDbl
  } else {
    NA_real_
  }
  
  if (verboseLog) {
    cat("  [SUCCESS] Recompressed\n")
    cat("  New size:", format(finalSizeDbl, big.mark = ","), "bytes\n")
    cat("  Saved:", format(savedBytesDbl, big.mark = ","),
        "bytes (", sprintf("%.2f%%", savedPctDbl), ")\n")
  }
  
  return(data.frame(
    path = pathText,
    old_codec = oldCodecText,
    old_size = oldSizeDbl,
    new_size = finalSizeDbl,
    saved_bytes = savedBytesDbl,
    saved_pct = savedPctDbl,
    action = "converted",
    error = NA_character_,
    stringsAsFactors = FALSE
  ))
}


#' Build Timestamped CSV Output Path
#'
#' @param stemText Character. Base filename.
#'
#' @return Character. Full path to output CSV.
#'
#' @export
fText_output_csv_Path = function(stemText = "recompress_rds") {
  
  # Create output directory ----
  if (!dir.exists("./output")) {
    dir.create("./output", recursive = TRUE)
  }
  
  # Get source filename or use stem ----
  baseText = tryCatch({
    sourcePath = rstudioapi::getSourceEditorContext()$path
    if (nzchar(sourcePath)) {
      tools::file_path_sans_ext(basename(sourcePath))
    } else {
      stemText
    }
  }, error = function(e) stemText)
  
  # Build timestamped filename ----
  timestampText = format(Sys.time(), "%y%m%dT%H%M")
  
  file.path("./output", paste0(baseText, "-", timestampText, ".csv"))
}


#' Batch R Streaming with Optional Parallelism
#'
#' @description
#' Pure R streaming backend with optional parallel processing.
#'
#' @param rootDirText Character(1). Root directory.
#' @param recursiveLog Logical. Search subdirectories.
#' @param nWorkersInt Integer. Parallel workers (requires furrr/future).
#' @param useExtremeLog Logical. Attempt xz extreme mode.
#' @param skipIfLargerLog Logical. Skip if new file larger.
#' @param keepBackupLog Logical. Create backups.
#' @param verboseLog Logical. Print progress.
#'
#' @return Data frame with compression statistics.
#'
#' @export
fPathText_recompress_rdsTree_R_ReportDf = function(
    rootDirText = ".",
    recursiveLog = TRUE,
    nWorkersInt = 1L,
    useExtremeLog = TRUE,
    skipIfLargerLog = TRUE,
    keepBackupLog = FALSE,
    verboseLog = VERBOSE
) {
  
  cat("\n========================================\n")
  cat("RDS Recompression: Pure R Streaming\n")
  cat("========================================\n")
  
  # Find RDS files ----
  pathsVec = fPathText_list_rdsFiles_Vec(
    rootDirText = rootDirText,
    recursiveLog = recursiveLog,
    verboseLog = verboseLog
  )
  
  if (length(pathsVec) == 0) {
    cat("[INFO] No RDS files found.\n")
    return(data.frame())
  }
  
  cat("[INFO] Processing", length(pathsVec), "files...\n")
  
  # Setup parallel processing if requested ----
  mapFun = lapply
  
  if (nWorkersInt > 1L) {
    if (requireNamespace("furrr", quietly = TRUE) &&
        requireNamespace("future", quietly = TRUE)) {
      
      future::plan(future::multisession, workers = nWorkersInt)
      on.exit(try(future::plan(future::sequential)), add = TRUE)
      
      mapFun = function(X, FUN) {
        furrr::future_map(X, FUN, .progress = verboseLog)
      }
      
      cat("[INFO] Using", nWorkersInt, "parallel workers\n")
    } else {
      cat("[WARNING] furrr/future not available, using sequential\n")
    }
  }
  
  # Process files ----
  resultsList = mapFun(pathsVec, function(p) {
    fPathText_stream_to_xz_RowDf(
      pathText = p,
      useExtremeLog = useExtremeLog,
      skipIfLargerLog = skipIfLargerLog,
      keepBackupLog = keepBackupLog,
      verboseLog = verboseLog
    )
  })
  
  # Combine results ----
  reportDf = do.call(rbind, resultsList)
  
  # Save report ----
  outCsvPath = fText_output_csv_Path("recompress_rds_R")
  
  if (requireNamespace("readr", quietly = TRUE)) {
    readr::write_csv(reportDf, outCsvPath)
  } else {
    write.csv(reportDf, outCsvPath, row.names = FALSE)
  }
  
  cat("\n[SAVED] Report:", outCsvPath, "\n")
  
  # Summary statistics ----
  cat("\n========================================\n")
  cat("SUMMARY\n")
  cat("========================================\n")
  
  convertedLogVec = reportDf$action == "converted"
  skippedXzLogVec = reportDf$action == "skipped_already_xz"
  skippedLargerLogVec = reportDf$action == "skipped_larger"
  failedLogVec = reportDf$action == "failed"
  
  cat("Total files:", nrow(reportDf), "\n")
  cat("  Converted:", sum(convertedLogVec), "\n")
  cat("  Already xz:", sum(skippedXzLogVec), "\n")
  cat("  Skipped (larger):", sum(skippedLargerLogVec), "\n")
  cat("  Failed:", sum(failedLogVec), "\n")
  
  if (sum(convertedLogVec) > 0) {
    totalOldDbl = sum(reportDf$old_size[convertedLogVec], na.rm = TRUE)
    totalNewDbl = sum(reportDf$new_size[convertedLogVec], na.rm = TRUE)
    totalSavedDbl = totalOldDbl - totalNewDbl
    totalPctDbl = if (totalOldDbl > 0) {
      100 * totalSavedDbl / totalOldDbl
    } else {
      0
    }
    
    cat("\nSpace savings:\n")
    cat("  Original:", format(totalOldDbl, big.mark = ","), "bytes\n")
    cat("  New:", format(totalNewDbl, big.mark = ","), "bytes\n")
    cat("  Saved:", format(totalSavedDbl, big.mark = ","),
        "bytes (", sprintf("%.2f%%", totalPctDbl), ")\n")
  }
  
  cat("========================================\n\n")
  
  invisible(reportDf)
}


# Bash Backend Integration ----

#' Check if Bash Tools are Available
#'
#' @return Logical. TRUE if xz, gzip, bzip2 are on PATH.
#'
#' @export
fLogical_bash_tools_available = function() {
  all(
    Sys.which("xz") != "",
    Sys.which("gzip") != "",
    Sys.which("bzip2") != ""
  )
}


#' Recompress via Bash Pipeline (Fastest Method)
#'
#' @description
#' Executes external bash script for maximum performance.
#' Uses byte-stream transcoding with xz -9 -e.
#'
#' @param rootDirText Character(1). Root directory.
#' @param threadsPerFileInt Integer. xz -T threads per file.
#' @param jobsInt Integer. Parallel file processing.
#' @param skipIfLargerLog Logical. Skip if result larger.
#' @param dryRunLog Logical. Preview only.
#' @param verboseLog Logical. Print output.
#'
#' @return Character vector of log lines from bash.
#'
#' @details
#' Requires: bash, xz, gzip, bzip2, find, xargs, mktemp, stat
#'
#' @export
fPathText_recompress_rdsTree_Bash_LogsVec = function(
    rootDirText = ".",
    threadsPerFileInt = 0L,
    jobsInt = 1L,
    skipIfLargerLog = TRUE,
    dryRunLog = FALSE,
    verboseLog = VERBOSE
) {
  
  if (!fLogical_bash_tools_available()) {
    stop("Error: Required bash tools not found (xz, gzip, bzip2)")
  }
  
  cat("\n========================================\n")
  cat("RDS Recompression: Bash Pipeline\n")
  cat("========================================\n")
  cat("Threads per file:", threadsPerFileInt, "\n")
  cat("Parallel jobs:", jobsInt, "\n")
  if (dryRunLog) {
    cat("Mode: DRY RUN\n")
  }
  cat("\n")
  
  # Build bash command ----
  bashScriptLines = c(
    "set -euo pipefail",
    sprintf("ROOT=%s", shQuote(normalizePath(rootDirText, winslash = "/", mustWork = TRUE))),
    sprintf("THREADS=%s", threadsPerFileInt),
    sprintf("JOBS=%s", jobsInt),
    sprintf("SKIP_IF_LARGER=%s", if (skipIfLargerLog) "1" else "0"),
    sprintf("DRY=%s", if (dryRunLog) "1" else "0"),
    
    # Helper functions
    'filesize() { stat -c%s "$1" 2>/dev/null || stat -f%z "$1"; }',
    'detect() { f="$1"; xz -t -- "$f" >/dev/null 2>&1 && { echo xz; return; }; gzip -t -- "$f" >/dev/null 2>&1 && { echo gzip; return; }; bzip2 -t -- "$f" >/dev/null 2>&1 && { echo bzip2; return; }; echo none; }',
    
    # Main processing function
    'repack_one() {
      f="$1"
      [[ "${f,,}" == *.rds ]] || { echo "skip (not rds): $f"; return; }
      c="$(detect "$f")"
      [[ "$c" == xz ]] && { echo "skip (already xz): $f"; return; }
      (( DRY )) && { echo "[DRY] $f ($c) -> xz -9e"; return; }
      tmp="$(mktemp "${f}.XXXXXX")"
      old=$(filesize "$f")
      if [[ "$c" == gzip ]]; then
        gzip -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"
      elif [[ "$c" == bzip2 ]]; then
        bzip2 -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"
      else
        cat -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"
      fi
      new=$(filesize "$tmp")
      if (( SKIP_IF_LARGER )) && [[ "$new" -ge "$old" ]]; then
        rm -f "$tmp"
        echo "skip (larger): $f"
        return
      fi
      touch -r "$f" "$tmp" 2>/dev/null || true
      chmod --reference="$f" "$tmp" 2>/dev/null || true
      mv -f "$tmp" "$f"
      echo "ok: $f ($old -> $new)"
    }',
    
    # Export and execute
    'export -f repack_one detect filesize',
    'find "$ROOT" -type f -iname "*.rds" -print0 | xargs -0 -n1 -P "$JOBS" bash -c \'repack_one "$0"\''
  )
  
  cmdText = paste(bashScriptLines, collapse = " ; ")
  
  # Execute bash pipeline ----
  logsVec = system2("bash", c("-c", cmdText), stdout = TRUE, stderr = TRUE)
  
  if (verboseLog) {
    cat("\n[BASH OUTPUT]\n")
    cat(paste(logsVec, collapse = "\n"), "\n")
  }
  
  cat("\n========================================\n\n")
  
  invisible(logsVec)
}


# Auto-Selector Front End ----

#' Auto-Select Best Backend and Execute
#'
#' @description
#' Intelligent orchestrator that chooses fastest available method:
#' 1. Bash pipeline (if tools available) - FASTEST
#' 2. Pure R streaming (fallback) - PORTABLE
#'
#' @param rootDirText Character(1). Root directory.
#' @param preferBashLog Logical. Prefer bash if available.
#' @param verboseLog Logical. Print progress.
#' @param ... Additional arguments passed to chosen backend.
#'
#' @return Data frame with compression statistics.
#'
#' @details
#' This is the recommended entry point. It automatically selects
#' the best available backend and provides consistent reporting.
#'
#' @examples
#' \dontrun{
#' # Auto-select best method
#' resultDf = fPathText_recompress_rdsTree_auto_ReportDf(
#'   rootDirText = ".",
#'   preferBashLog = TRUE,
#'   useExtremeLog = TRUE
#' )
#' }
#'
#' @export
fPathText_recompress_rdsTree_auto_ReportDf = function(
    rootDirText = ".",
    preferBashLog = TRUE,
    verboseLog = VERBOSE,
    ...
) {
  
  cat("\n")
  cat("╔══════════════════════════════════════════════════════════════╗\n")
  cat("║  RDS Auto-Recompression: Intelligent Backend Selection      ║\n")
  cat("╚══════════════════════════════════════════════════════════════╝\n")
  cat("\n")
  
  # Check for bash tools ----
  bashAvailableLog = fLogical_bash_tools_available()
  
  if (preferBashLog && bashAvailableLog) {
    cat("[AUTO-SELECT] Using Bash pipeline (fastest)\n")
    cat("[INFO] For pure R streaming, set preferBashLog = FALSE\n\n")
    
    # Execute bash pipeline ----
    logsVec = fPathText_recompress_rdsTree_Bash_LogsVec(
      rootDirText = rootDirText,
      verboseLog = verboseLog,
      ...
    )
    
    # Create minimal report for audit trail ----
    pathsVec = fPathText_list_rdsFiles_Vec(rootDirText, TRUE, verboseLog = FALSE)
    
    reportDf = data.frame(
      path = pathsVec,
      old_codec = NA_character_,
      old_size = NA_real_,
      new_size = NA_real_,
      saved_bytes = NA_real_,
      saved_pct = NA_real_,
      action = "processed_via_bash",
      error = NA_character_,
      stringsAsFactors = FALSE
    )
    
    outCsvPath = fText_output_csv_Path("recompress_rds_bash")
    
    if (requireNamespace("readr", quietly = TRUE)) {
      readr::write_csv(reportDf, outCsvPath)
    } else {
      write.csv(reportDf, outCsvPath, row.names = FALSE)
    }
    
    cat("[SAVED] Report:", outCsvPath, "\n")
    
    return(invisible(reportDf))
    
  } else {
    if (!bashAvailableLog) {
      cat("[AUTO-SELECT] Bash tools not available\n")
    }
    cat("[AUTO-SELECT] Using pure R streaming (portable)\n\n")
    
    # Execute pure R streaming ----
    reportDf = fPathText_recompress_rdsTree_R_ReportDf(
      rootDirText = rootDirText,
      verboseLog = verboseLog,
      ...
    )
    
    return(invisible(reportDf))
  }
}


# Cleanup Functions ----

#' Remove Backup Files After Verification
#'
#' @param rootDirText Character(1). Root directory.
#' @param verboseLog Logical. Print progress.
#'
#' @return Integer. Number of backups removed.
#'
#' @export
fBackup_removeAll_countInt = function(
    rootDirText = ".",
    verboseLog = VERBOSE
) {
  
  backupPathVec = fs::dir_ls(
    path = rootDirText,
    recurse = TRUE,
    regexp = "\\.rds\\.bak$"
  )
  
  if (length(backupPathVec) == 0) {
    if (verboseLog) {
      cat("[INFO] No backup files found\n")
    }
    return(0L)
  }
  
  if (verboseLog) {
    cat("[INFO] Found", length(backupPathVec), "backup files\n")
    userResponse = readline(prompt = "Remove all backups? (yes/no): ")
    if (tolower(trimws(userResponse)) != "yes") {
      cat("[CANCELLED] Backup removal cancelled\n")
      return(0L)
    }
  }
  
  file.remove(backupPathVec)
  
  if (verboseLog) {
    cat("[REMOVED]", length(backupPathVec), "backup files\n")
  }
  
  return(as.integer(length(backupPathVec)))
}


# Example Usage ----

if (FALSE) {
  
  # RECOMMENDED: Auto-select best backend
  options(verbose = TRUE)
  
  resultDf = fPathText_recompress_rdsTree_auto_ReportDf(
    rootDirText = ".",
    preferBashLog = TRUE,      # Use bash if available
    useExtremeLog = TRUE,       # Attempt xz -e mode
    skipIfLargerLog = TRUE,     # Skip if compression makes file larger
    keepBackupLog = TRUE        # Create .bak files for safety
  )
  
  # View results
  print(resultDf)
  
  # Cleanup backups after verification
  fBackup_removeAll_countInt(rootDirText = ".")
  
  # Force pure R streaming (even if bash available)
  resultDf = fPathText_recompress_rdsTree_R_ReportDf(
    rootDirText = ".",
    nWorkersInt = 4L,           # Use 4 parallel workers
    useExtremeLog = TRUE,
    skipIfLargerLog = TRUE,
    keepBackupLog = TRUE
  )
}
