#!/usr/bin/env bash
# tools/repack-rds-to-xz.sh
# Usage: THREADS=0 JOBS=$(nproc) DRY=0 SKIP_IF_LARGER=1 ./tools/repack-rds-to-xz.sh [DIR]
set -euo pipefail
ROOT="${1:-.}"; THREADS="${THREADS:-0}"; JOBS="${JOBS:-1}"; DRY="${DRY:-0}"; SKIP_IF_LARGER="${SKIP_IF_LARGER:-1}"
need(){ command -v "$1" >/dev/null 2>&1 || { echo "Missing $1" >&2; exit 1; }; }
need xz; need gzip; need bzip2; need find; need xargs; need mktemp; need stat
filesize(){ stat -c%s "$1" 2>/dev/null || stat -f%z "$1"; }
detect(){ f="$1"; xz -t -- "$f" >/dev/null 2>&1 && { echo xz; return; }
          gzip -t -- "$f" >/dev/null 2>&1 && { echo gzip; return; }
          bzip2 -t -- "$f" >/dev/null 2>&1 && { echo bzip2; return; }
          echo none; }
repack_one(){ f="$1"
  [[ "${f,,}" == *.rds ]] || { echo "skip (not rds): $f"; return; }
  c="$(detect "$f")"; [[ "$c" == xz ]] && { echo "skip (already xz): $f"; return; }
  (( DRY )) && { echo "[DRY] $f ($c) -> xz -9e"; return; }
  tmp="$(mktemp "${f}.XXXXXX")"; old=$(filesize "$f")
  if [[ "$c" == gzip ]]; then gzip -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"
  elif [[ "$c" == bzip2 ]]; then bzip2 -cd -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"
  else cat -- "$f" | xz -c -9 -e -T"$THREADS" > "$tmp"; fi
  new=$(filesize "$tmp")
  if (( SKIP_IF_LARGER )) && [[ "$new" -ge "$old" ]]; then rm -f "$tmp"; echo "skip (newer larger): $f"; return; fi
  touch -r "$f" "$tmp" 2>/dev/null || true; chmod --reference="$f" "$tmp" 2>/dev/null || true
  mv -f "$tmp" "$f"; echo "ok: $f ($old -> $new)"
}
export -f repack_one detect filesize
find "$ROOT" -type f -iname '*.rds' -print0 | xargs -0 -n1 -P "$JOBS" bash -c 'repack_one "$0"'
