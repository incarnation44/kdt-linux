#!/bin/bash
set -euo pipefail
readonly ROOT=~/kdt-linux/dataset

printf "%-15s %8s %8s %10s\n" "DATASET" "IMAGES" "LABELS" "SIZE"
printf "%-15s %8s %8s %10s\n" "-------" "------" "------" "----"

for ds in "$ROOT"/*/; do
    [ -d "$ds" ] || continue
    name=$(basename "$ds")
    imgs=$(find "$ds" -name "*.jpg" 2>/dev/null | wc -l)
    lbls=$(find "$ds" -name "*.txt" 2>/dev/null | wc -l)
    size=$(du -sh "$ds" 2>/dev/null | cut -f1)
    printf "%-15s %8d %8d %10s\n" "$name" "$imgs" "$lbls" "$size"
done
