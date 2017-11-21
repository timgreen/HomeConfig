#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

images=(
  arch
  debian
)

for image in ${images[@]}; do
  rm -fr test_home
  mkdir -p test_home
  docker-compose \
    -f docker/docker-compose.yml \
    run --user="$UID:$GID" "$image"
done
