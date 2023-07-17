#!/usr/bin/env sh
set -u
set -e

: "$GRAFANA_API_KEY"

CONFIG_FILE=/prometheus.yaml

echo $GRAFANA_API_KEY

sed -i s/GRAFANA_API_KEY_PLACEHOLDER/$GRAFANA_API_KEY/g $CONFIG_FILE

/bin/prometheus \
    --config.file=$CONFIG_FILE \
    --storage.tsdb.retention.size=512MB

