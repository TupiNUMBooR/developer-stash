#!/usr/bin/env bash
#http://blog.sedicomm.com/2018/02/06/kak-ustanovit-i-nastroit-openvpn-server-na-debian-9-za-5-minut/
# [GitHub - Nyr/openvpn-install: OpenVPN road warrior installer for Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS and Fedora](https://github.com/Nyr/openvpn-install)
h=vpn1
u=keller

ssh $h
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo reboot

ssh $h
sudo apt install ufw
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
sudo ufw status

wget https://git.io/vpn -O openvpn-install.sh
sudo bash openvpn-install.sh

mkdir vpn
sudo su
cp /root/*.ovpn vpn
chown $u vpn/*
exit
exit
scp $h:~/vpn/*.ovpn .

sudo cp vpn/*.ovpn /etc/openvpn/client.conf
sudo /etc/init.d/openvpn start

