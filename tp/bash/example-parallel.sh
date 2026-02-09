#!/usr/bin/env bash

i=0
for n in {10..1}; do
  ((++i > 3)) && wait -n
  (
    echo start $n
    sleep $n
    echo end $n
  ) &
done
wait
