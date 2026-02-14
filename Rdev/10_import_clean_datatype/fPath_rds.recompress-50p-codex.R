#!/usr/bin/env Rscript
# tools/recompress_rds_auto.R

VERBOSE = isTRUE(getOption("verbose"))

# ---- File listing & detection ----------------------------------------------

#' List .rds files under a root
#' @param rootDirText character(1)
#' @param recursive logical
#' @return character vector of file paths
#' @export
fPathText_list_rdsFiles_Vec = function(rootDirText = ".", recursive = TRUE) {
  stopifnot(is.character(rootDirText), length(rootDirText) == 1L)
  if (!dir.exists(rootDirText)) stop("Directory not found: ", rootDirText)
  filesVec = list.files(rootDirText, pattern = "\\.rds$", ignore.case = TRUE,
                        recursive = recursive, full.names = TRUE, include.dirs = FALSE)
  unname(filesVec[file.exists(filesVec)])
}

#' Detect compression by magic bytes
#' @param pathText character(1) file path
#' @return "xz"|"gzip"|"bzip2"|"none"
#' @export
fPathText_detect_compression_Text = function(pathText) {
  con = file(pathText, "rb"); on.exit(close(con), add = TRUE)
  sig = readBin(con, what = "raw", n = 6L)
  if (length(sig) >= 6L && identical(sig[1:6], as.raw(c(0xfd,0x37,0x7a,0x58,0x5a,0x00)))) return("xz")
  if (length(sig) >= 2L && identical(sig[1:2], as.raw(c(0x1f,0x8b)))) return("gzip")
  if (length(sig) >= 3L && identical(sig[1:3], as.raw(c(0x42,0x5a,0x68)))) return("bzip2")
  "none"
}

# Build a timestamped CSV path under ./output/
fText_output_csv_Path = function(stemText = "recompress_rds") {
  if (!dir.exists("output")) dir.create("output", recursive = TRUE)
  base = tryCatch({
    tools::file_path_sans_ext(basename(rstudioapi::getSourceEditorContext()$path))
  }, error = function(e) stemText)
  stamp = format(Sys.time(), "%y%m%dT%H%M")
  file.path("output", paste0(base, "-", stamp, ".csv"))
}

# ---- Internal helpers ------------------------------------------------------

.fList_get_backend_args = function(backend_fun, dotsList,
                                   reservedArgsChr = c("rootDirText", "VERBOSE")) {
  if (!length(dotsList)) return(list(args = list(), unused = character()))
  dotsNames = names(dotsList)
  if (is.null(dotsNames) || any(!nzchar(dotsNames))) {
    stop("All arguments passed via ... must be named.")
  }
  backendFormals = names(formals(backend_fun))
  backendFormals = backendFormals[nzchar(backendFormals) & backendFormals != "..."]
  allowed = setdiff(backendFormals, reservedArgsChr)
  matched = dotsNames %in% allowed
  list(args = dotsList[matched], unused = unique(dotsNames[!matched]))
}

# ---- Pure-R streaming backend ----------------------------------------------

#' Stream a single .rds to xz (no deserialization, bounded memory)
#'
#' @param pathText character(1) input .rds path
#' @param use_extreme logical request xz "extreme"; falls back to level 9 if unsupported
#' @param skip_if_larger logical keep original if the xz result is not smaller
#' @param keep_backup logical write .bak before replacing
#' @param chunk_bytesInt integer buffer size (bytes)
#' @param VERBOSE logical
#' @return data.frame (one row) with path, old_codec, sizes, action, error
#' @export
fPathText_stream_to_xz_RowDf = function(
  pathText,
  use_extreme = TRUE,
  skip_if_larger = TRUE,
  keep_backup = FALSE,
  chunk_bytesInt = 1024L * 1024L,
  VERBOSE = VERBOSE
) {
  stopifnot(is.character(pathText), length(pathText) == 1L, file.exists(pathText))
  oldInfo = file.info(pathText)
  oldSize = as.double(oldInfo$size)
  oldPerm = oldInfo$mode
  oldTime = oldInfo$mtime
  oldCodec = fPathText_detect_compression_Text(pathText)

  if (oldCodec == "xz") {
    return(data.frame(path = pathText, old_codec = oldCodec, old_size = oldSize,
                      new_size = oldSize, saved_bytes = 0, saved_pct = 0,
                      action = "skipped_already_xz", error = NA_character_))
  }

  inCon = switch(oldCodec,
                 gzip  = gzfile(pathText, "rb"),
                 bzip2 = bzfile(pathText, "rb"),
                 xz    = xzfile(pathText, "rb"),
                 file(pathText, "rb"))
  on.exit(try(close(inCon), silent = TRUE), add = TRUE)

  tmpPath = paste0(pathText, ".tmp.xz")
  level <- 9L
  reqLevel <- if (isTRUE(use_extreme)) -abs(level) else level

  # Attempt extreme; fall back to +9 if negative levels are unsupported on this build
  outCon <- try(xzfile(tmpPath, "wb", compression = reqLevel), silent = TRUE)
  if (inherits(outCon, "try-error")) {
    outCon <- xzfile(tmpPath, "wb", compression = 9L)
  }
  on.exit({
    try(close(outCon), silent = TRUE)
    if (file.exists(tmpPath)) unlink(tmpPath)
  }, add = TRUE)

  repeat {
    buf = readBin(inCon, what = "raw", n = chunk_bytesInt)
    if (length(buf) == 0L) break
    writeBin(buf, outCon, useBytes = TRUE)
  }
  try(close(outCon), silent = TRUE)

  newSize = as.double(file.info(tmpPath)$size)
  if (!is.finite(newSize) || newSize <= 0) {
    unlink(tmpPath)
    return(data.frame(path = pathText, old_codec = oldCodec, old_size = oldSize,
                      new_size = NA_real_, saved_bytes = NA_real_, saved_pct = NA_real_,
                      action = "failed", error = "empty_output"))
  }

  if (isTRUE(skip_if_larger) && newSize >= oldSize) {
    unlink(tmpPath)
    return(data.frame(path = pathText, old_codec = oldCodec, old_size = oldSize,
                      new_size = oldSize, saved_bytes = 0,
                      saved_pct = 0,
                      action = "skipped_newer_larger", error = NA_character_))
  }

  if (isTRUE(keep_backup)) {
    bak = paste0(pathText, ".bak"); try(file.copy(pathText, bak, overwrite = TRUE), silent = TRUE)
  }

  ok = file.rename(tmpPath, pathText)
  if (!ok) { ok = file.copy(tmpPath, pathText, overwrite = TRUE); unlink(tmpPath) }
  if (!ok) {
    return(data.frame(path = pathText, old_codec = oldCodec, old_size = oldSize,
                      new_size = oldSize, saved_bytes = 0,
                      saved_pct = 0,
                      action = "failed", error = "replace_failed"))
  }
  try(Sys.setFileTime(pathText, oldTime), silent = TRUE)
  try(Sys.chmod(pathText, mode = as.octmode(oldPerm)), silent = TRUE)

  saved = oldSize - as.double(file.size(pathText))
  if (VERBOSE) message(sprintf("[OK] %s %s → xz | %.0f → %.0f bytes (%.2f%% saved)",
                               pathText, oldCodec, oldSize, file.size(pathText),
                               if (oldSize > 0) 100*saved/oldSize else 0))
  data.frame(path = pathText, old_codec = oldCodec, old_size = oldSize,
             new_size = file.size(pathText), saved_bytes = saved,
             saved_pct = if (oldSize > 0) 100*saved/oldSize else NA_real_,
             action = "converted", error = NA_character_)
}

#' Batch streaming in R with optional parallelism and CSV report
#' @param rootDirText character(1)
#' @param recursive logical
#' @param n_workersInt integer; if >1 and furrr/future exist → parallel
#' @param use_extreme logical; see fPathText_stream_to_xz_RowDf
#' @param skip_if_larger logical
#' @param keep_backup logical
#' @param VERBOSE logical
#' @return data.frame report (also written to ./output/)
#' @export
fPathText_recompress_rdsTree_R_ReportDf = function(
  rootDirText = ".",
  recursive = TRUE,
  n_workersInt = 1L,
  use_extreme = TRUE,
  skip_if_larger = TRUE,
  keep_backup = FALSE,
  VERBOSE = VERBOSE
) {
  paths = fPathText_list_rdsFiles_Vec(rootDirText, recursive)
  if (!length(paths)) {
    message("[INFO] No .rds files found."); return(data.frame())
  }

  map_fun = lapply
  if (n_workersInt > 1L && requireNamespace("furrr", quietly = TRUE) && requireNamespace("future", quietly = TRUE)) {
    future::plan(future::multisession, workers = n_workersInt)
    on.exit(try(future::plan(future::sequential)), add = TRUE)
    map_fun = function(X, FUN) furrr::future_map(X, FUN, .progress = VERBOSE)
  }

  resList = map_fun(paths, function(p) fPathText_stream_to_xz_RowDf(
    p, use_extreme = use_extreme, skip_if_larger = skip_if_larger, keep_backup = keep_backup, VERBOSE = VERBOSE
  ))
  reportDf = do.call(rbind, resList)

  outCsv = fText_output_csv_Path("recompress_rds_R")
  if (requireNamespace("readr", quietly = TRUE)) readr::write_csv(reportDf, outCsv) else utils::write.csv(reportDf, outCsv, row.names = FALSE)
  if (VERBOSE) message("[INFO] Wrote report: ", outCsv)
  reportDf
}

# ---- Bash-backed fast path --------------------------------------------------

#' Recompress via external tools (gzip/bzip2/none → xz -9e), in parallel
#' @param rootDirText character(1)
#' @param threadsPerFileInt integer; xz -T
#' @param jobsInt integer; files in parallel via xargs -P
#' @param skip_if_larger logical
#' @param dry_run logical
#' @param VERBOSE logical
#' @return character vector of log lines from bash
#' @export
fPathText_recompress_rdsTree_Bash_LogsVec = function(
  rootDirText = ".",
  threadsPerFileInt = 0L,
  jobsInt = 1L,
  skip_if_larger = TRUE,
  dry_run = FALSE,
  VERBOSE = VERBOSE
) {
  if (Sys.which("xz") == "" || Sys.which("gzip") == "") stop("xz/gzip not found on PATH.")
  bash = c(
    "set -euo pipefail",
    sprintf("ROOT=%s", shQuote(normalizePath(rootDirText, winslash = "/", mustWork = TRUE))),
    sprintf("THREADS=%s", threadsPerFileInt), sprintf("JOBS=%s", jobsInt),
    sprintf("SKIP_IF_LARGER=%s", if (skip_if_larger) "1" else "0"),
    sprintf("DRY=%s", if (dry_run) "1" else "0"),
    'detect(){ f="$1"; xz -t -- "$f" >/dev/null 2>&1 && { echo xz; return; }; gzip -t -- "$f" >/dev/null 2>&1 && { echo gzip; return; }; bzip2 -t -- "$f" >/dev/null 2>&1 && { echo bzip2; return; }; echo none; }',
    'filesize(){ if stat --version >/dev/null 2>&1; then stat -c%s -- "$1"; else stat -f%z -- "$1"; fi; }',
    'copymeta(){ src="$1"; dst="$2"; touch -r "$src" "$dst" 2>/dev/null || true; if stat --version >/dev/null 2>&1; then mode=$(stat -c%a -- "$src"); else mode=$(stat -f%p "$src"); mode=${mode#??}; fi; if [[ -n "$mode" ]]; then chmod "$mode" "$dst" 2>/dev/null || true; fi; }',
    'repack_one(){ f="$1"; case "$f" in (*.[Rr][Dd][Ss]) ;; *) echo "skip (not rds): $f"; return ;; esac; c="$(detect "$f")"; [[ "$c" == "xz" ]] && { echo "skip (already xz): $f"; return; }; (( DRY )) && { echo "[DRY] $f ($c) -> xz -9e"; return; }; tmp="$(mktemp "${f}.XXXXXX")"; old=$(filesize "$f"); if [[ "$c" == "gzip" ]]; then gzip -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"; elif [[ "$c" == "bzip2" ]]; then bzip2 -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"; else xz -c -9 -e -T"$THREADS" < "$f" > "$tmp"; fi; new=$(filesize "$tmp"); if (( SKIP_IF_LARGER )) && [[ "$new" -ge "$old" ]]; then rm -f "$tmp"; echo "skip (newer larger): $f"; return; fi; copymeta "$f" "$tmp"; mv -f "$tmp" "$f"; echo "ok: $f $c->$new"; }',
    'export -f repack_one detect filesize copymeta',
    'find "$ROOT" -type f -iname "*.rds" -print0 | xargs -0 -n1 -P "$JOBS" bash -c \'repack_one "$0"\''
  )
  cmd = paste(bash, collapse = " ; ")
  if (VERBOSE) message("[INFO] Running bash pipeline...")
  system2("bash", c("-c", cmd), stdout = TRUE, stderr = TRUE)
}

# ---- Auto-select front end --------------------------------------------------

#' Auto-select best backend and write a CSV report
#' @param rootDirText character(1)
#' @param prefer_bash logical; if TRUE and tools exist → bash; else pure R streaming
#' @param VERBOSE logical
#' @param ... forwarded to chosen backend
#' @return data.frame report (pure R) or minimal placeholder (bash path)
#' @export
fPathText_recompress_rdsTree_auto_ReportDf = function(
  rootDirText = ".",
  prefer_bash = TRUE,
  VERBOSE = VERBOSE,
  ...
) {
  dots = list(...)

  use_bash = prefer_bash && Sys.which("xz") != "" && Sys.which("gzip") != ""

  if (use_bash) {
    filtered = .fList_get_backend_args(fPathText_recompress_rdsTree_Bash_LogsVec, dots)
    args = c(list(rootDirText = rootDirText, VERBOSE = VERBOSE), filtered$args)
    logs = do.call(fPathText_recompress_rdsTree_Bash_LogsVec, args)
    if (length(filtered$unused)) {
      warning("Unused argument(s) for bash backend: ", paste(filtered$unused, collapse = ", "))
    }
    # produce a minimal CSV for audit trail when using bash directly
    paths = fPathText_list_rdsFiles_Vec(rootDirText, TRUE)
    rep = data.frame(path = paths, old_codec = NA_character_, old_size = NA_real_,
                     new_size = NA_real_, saved_bytes = NA_real_, saved_pct = NA_real_,
                     action = NA_character_, error = NA_character_)
    outCsv = fText_output_csv_Path("recompress_rds_bash")
    if (requireNamespace("readr", quietly = TRUE)) readr::write_csv(rep, outCsv) else utils::write.csv(rep, outCsv, row.names = FALSE)
    if (VERBOSE) message("[INFO] Bash logs:\n", paste(logs, collapse = "\n"))
    rep
  } else {
    if (VERBOSE) message("[INFO] Falling back to pure R streaming.")
    filtered = .fList_get_backend_args(fPathText_recompress_rdsTree_R_ReportDf, dots)
    args = c(list(rootDirText = rootDirText, VERBOSE = VERBOSE), filtered$args)
    if (length(filtered$unused)) {
      warning("Unused argument(s) for R backend: ", paste(filtered$unused, collapse = ", "))
    }
    do.call(fPathText_recompress_rdsTree_R_ReportDf, args)
  }
}

# ---- CLI glue ---------------------------------------------------------------
if (identical(environment(), globalenv()) && !interactive()) {
  args = commandArgs(trailingOnly = TRUE)
  root = if (length(args)) args[[1]] else "."
  fPathText_recompress_rdsTree_auto_ReportDf(rootDirText = root, prefer_bash = TRUE, VERBOSE = TRUE)
}
