#!/usr/bin/env bash
set -euo pipefail

#http://blog.sedicomm.com/2018/02/06/kak-ustanovit-i-nastroit-openvpn-server-na-debian-9-za-5-minut/
# [GitHub - Nyr/openvpn-install: OpenVPN road warrior installer for Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS and Fedora](https://github.com/Nyr/openvpn-install)

mkdir -p ~/bin
wget https://git.io/vpn -O ~/openvpn-install.sh
sudo bash openvpn-install.sh

mkdir vpn

sudo su
cp /root/*.ovpn vpn
chown $u:$u vpn/*
exit

exit

dir=~/k/store/personal/docs/ovpn/$h
mkdir -p "$dir"
rsync -ahPi "$h:~/vpn/" "$dir"

