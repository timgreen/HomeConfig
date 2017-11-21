#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

rm -fr test_home
mkdir -p test_home

docker-compose -f docker/docker-compose.yml run --user="$UID:$GID" debian
