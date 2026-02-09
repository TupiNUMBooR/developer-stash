#!/usr/bin/env bash
set -euo pipefail

awk -F. -v OFS=. '{$NF++; print}' < version.txt > .version.tmp.txt
mv .version.tmp.txt version.txt
cat version.txt
