#!/usr/bin/env bash
set -e

bkp_time_file="/c/k/bin/bkp time.txt"
bkp_time_format="+%F %T"
bkp_time_increment="+2hours"
bkp_dir="/c/k/bkp"

run() {
  while true; do
    write_timer

    local bkp_time=$(cat < "$bkp_time_file")

    if is_working_hours && is_after_bkp_time; then
      bkp
    fi

    sleep 600
  done
}

write_timer() {
  date +"%F %T"
}

is_working_hours() {
  local t=$(date +%T)
  local wd=$(date +%u)
  [[ 09:00 < $t ]] && [[ $t < 21:00 ]] && [[ $wd < 6 ]]
}

is_after_bkp_time() {
  [[ "$(date "$bkp_time_format")" > "$bkp_time" ]]
}

bkp() {
  new_bkp_time=$(date "$bkp_time_format" -d "$bkp_time_increment")
  echo "previous backup at: $bkp_time"
  echo "making backup at $(date "$bkp_time_format")"
  echo "next backup at: $bkp_time_increment -> $new_bkp_time"
  echo "$new_bkp_time" > "$bkp_time_file"
  endtoday.sh
  bkp.sh
  delete_old_bkp
}

delete_old_bkp() {
  find "$bkp_dir" -maxdepth 1 -type f -mtime +14 -exec rm -v {} \;
}

run
