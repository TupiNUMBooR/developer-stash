#!/usr/bin/env bash
set -euo pipefail

echo "start"

(
  echo "background task"
  sleep 1
  false   # 💣 гарантированная ошибка
) &

wait -n

echo "this will NOT be printed"
