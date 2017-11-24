#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

all_images=(
  arch
  debian
)
read -ra images <<< "$@"
if (( ${#images[@]} == 0 )); then
  images=(${all_images[@]})
fi

set -e
for image in ${images[@]}; do
  mkdir -p test_home/$image
  docker-compose \
    -f docker/docker-compose.yml \
    run \
    --user="$(id -u):$(id -g)" \
    $image
done
