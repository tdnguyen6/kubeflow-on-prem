#!/usr/bin/env bash

DOMAIN=${1:-a.io}

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
OUT_DIR=$SCRIPT_DIR/../resources/tls

openssl req \
-x509 \
-newkey rsa:4096 \
-keyout "$OUT_DIR/key.pem" \
-out "$OUT_DIR/cert.pem" \
-days 365 \
-subj "/CN=$DOMAIN" \
-nodes # no password