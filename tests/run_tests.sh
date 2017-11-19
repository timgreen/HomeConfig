#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

mkdir -p test_home
docker-compose -f docker/docker-compose.yml run --user="$UID:$GID" test_init_sync
