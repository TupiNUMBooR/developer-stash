```sh
#!/usr/bin/env bash
set -euo pipefail
```

```sh
apt update
apt upgrade -y
apt autoremove -y
apt autoclean
```

```sh
apt install -y docker.io docker-compose
usermod -aG docker "$USER"
systemctl enable docker
# need reboot
```

```sh
apt install -y bash bash-completion sudo nano ufw \
  wget curl ncdu net-tools htop btop vim lsof tcpdump \
  zip p7zip perl jq xq yq tmux screen neofetch \
  git build-essential

ufw allow OpenSSH
ufw --force enable
```

```sh
useradd -ms /bin/bash $u
passwd $u
adduser $u sudo
```

det4