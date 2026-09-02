#!/bin/bash
set -euo pipefail

NAME="${1:-훈련생}"
echo "안녕하세요, ${NAME}님"
echo "오늘은 $(date '+%Y년 %m월 %d일') 입니다"
echo "현재 위치: $(pwd)"
echo "인자 개수: $#"
