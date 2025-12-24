#!/usr/bin/env bash

ip=$1 #127.0.0.1
h=$2  #vpn
u=$3  #user

echo "
Host          $h
Hostname      $ip
HostKeyAlias  $h
User          $u
" >> ~/.ssh/config

ssh root@$h <<EOF
set -e
useradd -ms /bin/bash $u
adduser $u sudo
passwd $u

apt update
apt install -y sudo rsync ufw
ufw allow 22
ufw --force enable

apt upgrade
apt install -y sudo rsync ufw
apt autoremove -y
apt clean
EOF

# ssh-keygen -q -N ""
ssh-copy-id $h            #ask user pass

ssh $h
