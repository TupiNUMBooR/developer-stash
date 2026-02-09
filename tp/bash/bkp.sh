#!/usr/bin/env bash
set -e
t0="$(date +%Y-%m-%d_%H-%M-%S)"
dir="/c/k/bkp/$t0"
mkdir -vp "$dir"/{local,remote}

cd "$dir/local"
git clone --mirror "/c/k/dev/example" &

cd "$dir/remote"
git clone --mirror https://example.com &

wait

cd "$dir/.."
echo making archive "$t0.tgz"
tar -czf "$t0.tgz" "$t0"
echo removing folder "$t0"
rm -rf "$t0" ||
  sleep 1 &&
    rm -rf "$t0"
echo bkp finished
