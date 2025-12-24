#!/usr/bin/env bash
set -e
directory="."
num_files=4

while getopts ":d:n:" opt; do
  case $opt in
  d) directory="$OPTARG" ;;
  n)
    if [[ "$OPTARG" =~ ^[0-9]+$ ]]; then
      num_files="$OPTARG"
    else
      echo "Error: -n option must be a number"
      exit 1
    fi
    ;;
  *)
    echo "Usage: $0 [-d directory] [-n num_files]"
    exit 1
    ;;
  esac
done

cd "$directory"
find -mindepth 1 -type d | tac | while read dir; do
  n=$(find "$dir" -maxdepth 1 -type f | wc -l)
  if ((n < num_files && n > 0)); then
    find "$dir" -maxdepth 1 -type f -exec mv -v {} "$directory" \;
  fi
done

find -type d -empty -delete
