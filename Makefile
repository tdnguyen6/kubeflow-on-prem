.SILENT:
SHELL := /bin/bash

minikube-start:
	./mn start \
	--cpus 6 \
	--memory 12288 \
	--disk-size=60GB \
	--kubernetes-version=$$K8S_VER \
	--addons dashboard metrics-server \
	--extra-config kubelet.runtime-request-timeout=30m0s \
