#!/bin/bash
set -euo pipefail

TARGET="${1:-}"

if [ -z "$TARGET" ]; then
    echo "사용법: $0 <경로>" >&2
    exit 2
fi

if [ -d "$TARGET" ]; then
    echo "[OK] 디렉토리입니다"
    echo "  파일 수: $(ls -1 "$TARGET" | wc -l)"
    echo "  용량:   $(du -sh "$TARGET" | cut -f1)"
elif [ -f "$TARGET" ]; then
    echo "[OK] 파일입니다"
    echo "  크기: $(stat -c%s "$TARGET") bytes"
    echo "  권한: $(stat -c%A "$TARGET")"
else
    echo "[ERROR] 존재하지 않습니다: $TARGET" >&2
    exit 1
fi
