#!/usr/bin/env bash
set -euo pipefail

USERNAME="$1"
PASSWORD="$2"
if id "$USERNAME" &>/dev/null; then
  echo "Пользователь $USERNAME уже существует."
else
  useradd -m "$USERNAME"
  echo "$USERNAME:$PASSWORD" | chpasswd
  usermod -aG sudo,docker "$USERNAME"
fi


# install docker


# list ip:name:password
