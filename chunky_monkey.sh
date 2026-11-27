#!/usr/bin/env bash
set -euo pipefail

SRC_FILE="${SRC_FILE:-/path/to/large_file.bin}"
OUT_DIR="${OUT_DIR:-/path/to/output_dir}"
CHUNK_MIB="${CHUNK_MIB:-1024}"
N="${1:-0}"

if [ ! -f "$SRC_FILE" ]; then
  echo "Source file not found: $SRC_FILE" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"
BASE_NAME="$(basename "$SRC_FILE")"
OUT_FILE="$OUT_DIR/${BASE_NAME}.part$(printf '%02d' "$N")"

dd if="$SRC_FILE" of="$OUT_FILE" bs=1M count="$CHUNK_MIB" skip=$((N * CHUNK_MIB))
ls -lh "$OUT_FILE"
