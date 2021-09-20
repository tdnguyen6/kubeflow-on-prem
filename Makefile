.SILENT:
SHELL := /bin/bash

profile=kubeflow-on-prem


apply:
	./build.py | kubectl apply -

build:
	sjsonnet \
	-J "/home/tidu/repos/jsonnet-lib-gen/gen/github.com/jsonnet-libs" \
	-J "/home/tidu/repos/kubeflow-on-prem" \
	-c \
	--yaml-out \
	.

files:
	for file in $(find apps/base/src -type f)
	do
		echo $(file)
	done