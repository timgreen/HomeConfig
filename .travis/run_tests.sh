#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

rm -fr test_home
mkdir -p test_home

images=(
  arch
  debian
)

for image in ${images[@]}; do
  docker-compose \
    -f docker/docker-compose.yml \
    run --user="$UID:$GID" "$image"
done
