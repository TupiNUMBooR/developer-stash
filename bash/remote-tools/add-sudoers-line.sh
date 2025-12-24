#!/usr/bin/env bash
set -euo pipefail

USERNAME="$1"

SUDOERS_LINE="$USERNAME ALL=(ALL) NOPASSWD:ALL"
if ! grep -q "^$SUDOERS_LINE" /etc/sudoers; then
  echo "$SUDOERS_LINE" >> /etc/sudoers
fi
