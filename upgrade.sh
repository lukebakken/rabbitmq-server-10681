#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

# NB: https://github.com/docker/compose/issues/1262
_tmp="$(docker compose ps -q rmq0)"
readonly container_id="$_tmp"
unset _tmp

docker exec "$container_id" /opt/rabbitmq/sbin/rabbitmqctl enable_feature_flag all
docker exec "$container_id" /opt/rabbitmq/sbin/rabbitmq-upgrade drain
docker compose stop rmq0
sleep 5
docker compose build --pull --build-arg VERSION=3.13-management
docker compose up --detach rmq0
