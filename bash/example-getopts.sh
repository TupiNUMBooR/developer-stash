#!/usr/bin/env bash
set -euo pipefail

# https://habr.com/ru/articles/169133/

while getopts "abc:" o; do
  case $o in
    a) echo "-a";;
    b) echo "-b";;
    c) echo "-c $OPTARG";;
    ?) exit 1;;
  esac
done
shift "$((OPTIND - 1))"

echo "--"
for f in "$@"; do echo $f; done

# example-getopts.sh -ab -a -b -c 1 -a -- -a ololo "s p a c e"
# example-getopts.sh -abc
# example-getopts.sh -ada
