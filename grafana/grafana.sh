#!/usr/bin/env bash

docker build -t lewandowskim/grafana -f- https://github.com/taosdata/grafanaplugin.git <<EOF
FROM grafana/grafana
COPY . /var/lib/grafana/plugins/
EOF