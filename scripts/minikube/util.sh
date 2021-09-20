#!/usr/bin/env bash

$CMD

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

pname=$(head -n 1 "$SCRIPT_DIR/profile.txt")

minikube "$CMD" -p "$pname"
