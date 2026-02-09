#!/usr/bin/env bash
set -euo pipefail

version=$(cat version.txt)

docker build --progress=plain -t "k-alpine:$version" -t "k-alpine:latest" .
