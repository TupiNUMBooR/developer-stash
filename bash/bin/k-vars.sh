#!/bin/bash
year=2023

k=~/k
kl=/run/media/keller/kret/k
khist=$k/store/personal
khist_l=$kl/store/personal

c_red="\e[91m"
c_green="\e[32m"
c_blue="\e[36m"
c_0="\e[0m"
c_bold="\e[1m"

header() { echo -e "$c_blue$c_bold$1$c_0"; }
header2() { echo -e "$c_blue==========$c_bold $1 $c_0$c_blue==========$c_0"; }
log-rsync () { echo -e "${c_green}${1}${c_blue} ==rsync=> ${c_green}${2}${c_0}"; }

err() {
  echo -e "$c_red$1$c_0"
  [ ! -z $2 ] && exit $2
}

test-mount () {
  if ! mount | grep " ${1%/} " >/dev/null; then
    echo -e "${c_green}${1} ${c_red}not mounted${c_0}"
    return 1
  fi
}
