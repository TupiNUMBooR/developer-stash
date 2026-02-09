FROM alpine

WORKDIR /home
ENV LC_ALL=C.UTF-8

RUN apk update
RUN apk upgrade
RUN apk add python3 py-pip maven openjdk21 exiv2 imagemagick ffmpeg

RUN apk add \
  bash bash-completion mandoc man-pages \
  curl zip p7zip ncdu perl jq xq yq tmux screen htop btop \
  vim git cloc bat
