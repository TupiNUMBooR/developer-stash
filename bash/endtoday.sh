#!/usr/bin/env bash
cd "/c/k"
d0="history/$(date +%Y/%m/%d)"
mkdir -vp "$d0"/{bin,dev/patches/{gps,emp}}

find . bin dev/patches/*  -maxdepth 1 -type f -mtime 0 -exec cp -v {} "$d0/{}" \;
find /c/Users/$user/{.m2,.bash_profile}  -maxdepth 1 -type f -mtime 0 -exec cp -v {} "$d0" \;

rm -vf "$d0/bin/bkp time.txt"
find "$d0" -type d -empty -delete
