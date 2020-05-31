#!/usr/bin/env bash

set -o errexit
set -o pipefail

cmd=( "$@" )

# Start database
taosd -c /app/taos.cfg &

# Add user and DB
taos -f db_create.sql

# Stop DB
kill %1

case "$cmd" in
    *)
        $cmd  # usage start.sh
    ;;
esac