#!/bin/bash
set -e -o pipefail -x -u

docker-compose up -d
dbmate wait
dbmate migrate
