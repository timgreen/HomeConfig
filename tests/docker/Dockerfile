FROM alpine

RUN apk add --no-cache \
  coreutils \
  findutils \
  grep \
  bash \
  zsh \
  ncurses \
  rsync \
  wget \
  jq \
  py-pip \
  && pip install yq

USER timgreen
ENV HOME /home/timgreen
