#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

pname=$(head -n 1 "$SCRIPT_DIR/profile.txt")

minikube start \
--cpus 6 \
--memory 12288 \
--disk-size=60GB \
--kubernetes-version='1.21.4' \
--addons dashboard metrics-server \
--extra-config kubelet.runtime-request-timeout=30m0s \
--insecure-registry "192.168.1.0/24" "a.io" \
-p "$pname"
