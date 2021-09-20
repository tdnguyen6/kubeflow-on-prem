#!/usr/bin/env bash

# helm vendors
helmfile -f vendors/helm sync

# kustomize vendors
kubectl apply -k vendors/kustomize

# yaml vendors
kubectl apply -f vendors/yaml

# install components
kubectl apply -k .