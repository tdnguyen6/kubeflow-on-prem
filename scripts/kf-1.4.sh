#!/usr/bin/env zsh

MINIKUBE_SCRIPT_DIR="$0:a:h"
. "$MINIKUBE_SCRIPT_DIR/base.sh"

MINIKUBE_PROFILE=kf-1.4
MINIKUBE_K8S_VER=1.21.5

activate_minikube "$MINIKUBE_PROFILE.sh"
