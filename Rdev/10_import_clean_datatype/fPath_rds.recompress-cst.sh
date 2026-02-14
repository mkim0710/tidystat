#!/usr/bin/env bash
# ==============================================================================
# RDS Recompression: gzip → xz (RECOMMENDED METHOD)
# ==============================================================================
# Fast byte-stream transcoding without deserializing R objects
# Usage: ./recompress_rds_stream.sh [DIRECTORY]
#        JOBS=8 THREADS=0 DRY=1 ./recompress_rds_stream.sh .
#
# Environment variables:
#   THREADS - xz threads per file (0 = all cores, default: 0)
#   JOBS    - parallel file processing (default: 1)
#   DRY     - dry run mode (1 = preview only, default: 0)
# ==============================================================================

set -euo pipefail

# Configuration ----
ROOT="${1:-.}"
THREADS="${THREADS:-0}"   # xz threads; 0 = auto/all cores
JOBS="${JOBS:-1}"         # files in parallel (xargs -P)
DRY="${DRY:-0}"           # 1 = dry-run (log only)

# Dependency check ----
need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Error: Missing required command: $1" >&2
    echo "Install: sudo apt-get install $1" >&2
    exit 1
  }
}

need gzip
need xz
need find
need xargs
need mktemp

# Statistics tracking ----
declare -i PROCESSED=0 SKIPPED_XZ=0 SKIPPED_NOT_GZIP=0 FAILED=0
ORIGINAL_SIZE=0
NEW_SIZE=0

# Single file transcoding function ----
transcode_one() {
  local f="$1"
  local result=""
  
  # Check if already xz compressed ----
  if xz -t -- "$f" >/dev/null 2>&1; then
    echo "skip (already xz): $f"
    return 0
  fi
  
  # Check if gzip compressed ----
  if ! gzip -t -- "$f" >/dev/null 2>&1; then
    echo "skip (not gzip-compressed): $f"
    return 0
  fi
  
  # Get original size ----
  local orig_size
  orig_size=$(stat -c%s "$f" 2>/dev/null || stat -f%z "$f" 2>/dev/null || echo 0)
  
  # Dry run mode ----
  if (( DRY )); then
    echo "[DRY RUN] $f → xz -9e (original: $(numfmt --to=iec-i --suffix=B "$orig_size" 2>/dev/null || echo "$orig_size bytes"))"
    return 0
  fi
  
  # Create temporary file ----
  local tmp
  tmp="$(mktemp "${f}.XXXXXX")"
  
  # Transcode: gzip → xz with extreme preset ----
  # -c  : write to stdout
  # -9  : maximum compression level
  # -e  : extreme mode (better compression, more CPU/RAM)
  # -T  : threads (0 = all cores)
  if gzip -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"; then
    
    # Get new size ----
    local new_size
    new_size=$(stat -c%s "$tmp" 2>/dev/null || stat -f%z "$tmp" 2>/dev/null || echo 0)
    
    # Calculate reduction ----
    local reduction=0
    if (( orig_size > 0 )); then
      reduction=$(awk "BEGIN {printf \"%.2f\", (1 - $new_size / $orig_size) * 100}")
    fi
    
    # Preserve metadata ----
    touch -r "$f" "$tmp" 2>/dev/null || true
    chmod --reference="$f" "$tmp" 2>/dev/null || chmod $(stat -c%a "$f" 2>/dev/null || echo 644) "$tmp" 2>/dev/null || true
    
    # Replace atomically ----
    mv -f "$tmp" "$f"
    
    echo "ok: $f ($(numfmt --to=iec-i --suffix=B "$orig_size" 2>/dev/null || echo "$orig_size") → $(numfmt --to=iec-i --suffix=B "$new_size" 2>/dev/null || echo "$new_size"), -${reduction}%)"
    
  else
    # Cleanup on failure ----
    rm -f "$tmp"
    echo "FAILED: $f" >&2
    return 1
  fi
}

# Export function and variables for xargs ----
export -f transcode_one
export THREADS DRY

# Main execution ----
echo "========================================"
echo "RDS Recompression: gzip → xz -9e"
echo "========================================"
echo "Root directory: $ROOT"
echo "xz threads per file: $THREADS $([ "$THREADS" -eq 0 ] && echo "(all cores)" || echo "")"
echo "Parallel files: $JOBS"
[ "$DRY" -eq 1 ] && echo "Mode: DRY RUN (preview only)"
echo ""

# Find and process all RDS files ----
find "$ROOT" -type f -name '*.rds' \
  ! -path '*/.git/*' \
  ! -path '*/renv/*' \
  ! -path '*/packrat/*' \
  ! -path '*/backup_*' \
  -print0 | xargs -0 -n1 -P "$JOBS" bash -c 'transcode_one "$0"'

echo ""
echo "========================================"
echo "Complete"
echo "========================================"

# Usage examples ----
cat <<'USAGE_EXAMPLES'

EXAMPLES:

  # Preview what will be processed (dry run)
  DRY=1 ./recompress_rds_stream.sh .

  # Recompress using all CPU cores, one file at a time
  THREADS=0 ./recompress_rds_stream.sh .

  # Process 8 files in parallel, each using 1 thread
  JOBS=8 THREADS=1 ./recompress_rds_stream.sh .

  # Maximum speed: all cores across all files
  THREADS=0 JOBS=$(nproc) ./recompress_rds_stream.sh .

  # Process specific subdirectory
  ./recompress_rds_stream.sh ./data

USAGE_EXAMPLES
