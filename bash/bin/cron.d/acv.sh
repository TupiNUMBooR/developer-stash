#!/usr/bin/env bash

set -e

dir=~/k/port/acv/
c_green="\e[32m"
c_blue="\e[36m"
c_0="\e[0m"

run() {
  mkdir -p "$dir"
  cd "$dir"
  mkdir -p {25,28,opus}/{to-process,processed,result,error}

  if [ -f .lock ]; then
    echo "lock file exists"
    exit
  fi

  touch .lock

  if is_dir_not_empty opus/to-process; then cv opus
  elif is_dir_not_empty 28/to-process; then cv 28
  elif is_dir_not_empty 25/to-process; then cv 25
  else echo "no files to process"
  fi

  cd "$dir"
  rm .lock
}

is_dir_not_empty() {
  find "$1" -maxdepth 1 -type d -not -empty | read
}

cv() {
  cd $1 &&
  f=$(smallest_file to-process) &&
  echo acv $1 "$f" &&
  notification=$(notify-send -p -t $((24*60*60*1000)) --icon process-working -a acv "acv $1" "<span color='cyan'>started</span>\n$f") || : &&
  cv$1 "to-process/$f" "result/${f%.*}" &&
  mv "to-process/$f" "processed" ||
  mv "to-process/$f" "error"
  notify-send -r $notification -t $((24*60*60*1000)) --icon process-stop -a acv "acv $1" "<span color='lime'>finished</span>\n$f" || :
}

cv28() {
  ffmpeg -y -i "$1" -map 0 -c copy -c:v libx265 -c:a libopus $video_metas "$2.mkv"
}

cv25() {
  ffmpeg -y -i "$1" -map 0 -c copy -c:v libx265 -crf 25 -c:a libopus $video_metas "$2.mkv"
}

cvopus() {
  local f=$1
  local fn=$2
  #ffmpeg can't add album images to opusvorbis
  local o=
  [[ "$f" == *.ogg ]] || [[ "$f" == *.opus ]] && o="-map_metadata 0:s:0"
  ffmpeg -i "$f" -f flac -c:v copy $o - | opusenc - "$fn.opus"
}

smallest_file() {
  ls $1 -Sr | grep -v / | head -1
}

# запихнул сюда, потому что сбивается форматирование в vscode
video_metas=$(echo -metadata:s' '{encoder,ENCODER,{BPS,DURATION,NUMBER_OF_{FRAMES,BYTES},_STATISTICS_{WRITING_{APP,DATE_UTC},TAGS}}{'',-eng}}='')

run
