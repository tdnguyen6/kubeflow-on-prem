#!/usr/bin/env zsh

set -a

function mn () {
    minikube -p "$MINIKUBE_PROFILE" "$@"
}

function minikube_start () {
    # change to podman if you use podman
    docker network inspect minikube > /dev/null 2>&1 || docker network create minikube --subnet 192.168.49.0/24 --gateway 192.168.49.1

    minikube start \
	--cpus 6 \
	--memory 12288 \
	--disk-size=60GB \
	--kubernetes-version=$MINIKUBE_K8S_VER \
	--addons dashboard metrics-server \
    --profile "$MINIKUBE_PROFILE" \
	--extra-config kubelet.runtime-request-timeout=30m0s \
    --embed-certs \
    --network minikube \
    --v=10 \

    mn dashboard &
    mn tunnel &
}

function start_port_forward() {
    # ssh -M -S "$MINIKUBE_SCRIPT_DIR/ip80" -fNT -R 80:localhost:80 win
    # ssh -M -S "$MINIKUBE_SCRIPT_DIR/ip443" -fNT -R 443:localhost:443 win
    autossh -M -S "$MINIKUBE_SCRIPT_DIR/ip" -fNT -R 443:localhost:443 win
}

function check_port_forward() {
    # ssh -S "$MINIKUBE_SCRIPT_DIR/ip80" -O check win
    # ssh -S "$MINIKUBE_SCRIPT_DIR/ip443" -O check win
    autossh -M -S "$MINIKUBE_SCRIPT_DIR/ip" -fNT -R 443:localhost:443 win
}

function close_port_forward() {
    # ssh -S "$MINIKUBE_SCRIPT_DIR/ip80" -O exit win
    # ssh -S "$MINIKUBE_SCRIPT_DIR/ip443" -O exit win
}

function minikube_stop() {
    minikube stop \
    --profile "$MINIKUBE_PROFILE" \
    --keep-context-active=true
}

function mk() {
    # unalias k 2>/dev/null
    mn kubectl -- "$@"
}

MINIKUBE_ZSHRC=~/.zshenv.d/minikube.zsh

function activate_minikube() {
    echo . "$MINIKUBE_SCRIPT_DIR/$1" > "$MINIKUBE_ZSHRC"
}

function deactivate_minikube() {
    rm $MINIKUBE_ZSHRC
    exec $SHELL
}

set +a
