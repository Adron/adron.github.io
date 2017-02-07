#!/usr/bin/env bash

# https://cloud.google.com/sdk/gcloud/reference/container/clusters/describe
gcloud container clusters describe drone

# https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials
gcloud container clusters get-credentials drone

# https://cloud.google.com/sdk/gcloud/reference/container/clusters/list
gcloud container clusters list

# https://cloud.google.com/sdk/gcloud/reference/container/get-server-config
gcloud container get-server-config


# https://kubernetes.io/docs/user-guide/kubectl/kubectl_config_set-cluster/
kubectl config set-cluster drone

kubectl config current-context

# https://kubernetes.io/docs/user-guide/kubectl/kubectl_cluster-info/
kubectl cluster-info

# https://kubernetes.io/docs/user-guide/kubectl/kubectl_cluster-info_dump/
kubectl cluster-info dump

kubectl config get-clusters

kubectl describe nodes
kubectl describe pods
kubectl config view

# Getting kubectl started as a proxy to work with the cluster.

kubectl proxy --port=8080 &