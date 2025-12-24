#!/usr/bin/env bash
set -euo pipefail

echo $#
if test $# -lt 3; then
  echo "Usage: $0 127.0.0.1 server_name user"
  exit 1
fi

ip=$1 #127.0.0.1
h=$2  #vpn
u=$3  #user

#need root pass
ssh root@$h "
set -euo pipefail
useradd -ms /bin/bash $u
adduser $u sudo
passwd $u

apt update
apt install -y sudo rsync ufw ncdu htop btop
ufw allow ssh
ufw --force enable

apt upgrade -y
apt autoremove -y
apt clean
"

# ssh-keygen -q -N ""
#need user pass
ssh-copy-id $h

ssh $h

echo -n "
Host          $h
Hostname      $ip
HostKeyAlias  $h
User          $u
" >> ~/.ssh/config
