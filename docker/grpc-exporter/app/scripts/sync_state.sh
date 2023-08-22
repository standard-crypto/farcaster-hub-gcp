#!/bin/sh
set -u
set -e

: "$FC_HOSTNAME"

grpcurl \
    -plaintext \
    -proto rpc.proto \
    $FC_HOSTNAME:2283 \
    HubService/GetSyncStatus