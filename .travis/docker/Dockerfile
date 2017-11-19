FROM alpine

# for hcm
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

# required tools
RUN apk add --no-cache \
  vim \
  tmux

USER timgreen
ENV HOME /home/timgreen
