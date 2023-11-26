# Tim Green Home Config

[![Ansible Lint check](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-linting-check.yml/badge.svg)](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-linting-check.yml)

Non-Interactive Installation Test

[![Ansible check debian:stable](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-debian-stable.yml/badge.svg)](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-debian-stable.yml)
[![Ansible check debian:latest](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-debian-latest.yml/badge.svg)](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-debian-latest.yml)
[![Ansible check archlinux:latest](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-archlinux-latest.yml/badge.svg)](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-archlinux-latest.yml)
[![Ansible check ubuntu:latest](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-ubuntu-latest.yml/badge.svg)](https://github.com/timgreen/HomeConfig/actions/workflows/ansible-ubuntu-latest.yml)

## Try it in Docker

```sh
docker run -e TERM -e COLORTERM -w /root -it --rm ubuntu sh -uec '
  apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ansible git
  ansible-pull -U https://github.com/timgreen/HomeConfig.git -d $PWD/HomeConfig --tags mini,cli --accept-host-key
  zsh
'
```

## Init

```sh
ansible-pull -U https://github.com/timgreen/HomeConfig.git -d $PWD/HomeConfig --tags mini,cli --ask-become-pass --accept-host-key
```
