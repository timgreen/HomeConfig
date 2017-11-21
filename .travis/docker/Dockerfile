FROM debian

# for hcm
RUN apt-get update && apt-get install -y \
  coreutils \
  findutils \
  grep \
  bash \
  zsh \
  ncurses-bin \
  rsync \
  wget \
  jq \
  python-pip \
  && pip install yq

# required tools
RUN apt-get install -y \
  curl \
  vim \
  tmux \
  git \
  unzip

USER timgreen
ENV HOME /home/timgreen
