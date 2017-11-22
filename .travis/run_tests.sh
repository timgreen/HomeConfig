#!/bin/bash

set -x
cd "$(dirname "$(readlink -f "$0")")"

images=(
  arch
  debian
)

for image in ${images[@]}; do
  mkdir -p test_home_$image
  docker-compose \
    -f docker/docker-compose.yml \
    run \
    --user="$(id -u):$(id -g)" \
    $image
done
