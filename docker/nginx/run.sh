#!/usr/bin/env sh
set -u
set -e

: "$HUB_SERVICE"
: "$SERVER_NAME"

CONFIG_FILE=/etc/nginx/nginx.conf

sed -i s/HUB_SERVICE_PLACEHOLDER/$HUB_SERVICE/g $CONFIG_FILE
sed -i s/SERVER_NAME_PLACEHOLDER/$SERVER_NAME/g $CONFIG_FILE

./docker-entrypoint.sh nginx -g "daemon off;"