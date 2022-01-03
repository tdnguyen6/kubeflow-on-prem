#!/usr/bin/env zsh

MINIKUBE_SCRIPT_DIR="$0:a:h"
. "$MINIKUBE_SCRIPT_DIR/base.sh"

MINIKUBE_PROFILE=test-1
MINIKUBE_K8S_VER=1.20.11

activate_minikube "$MINIKUBE_PROFILE.sh"
