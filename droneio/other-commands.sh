#!/usr/bin/env bash

# https://cloud.google.com/sdk/gcloud/reference/container/clusters/describe
gcloud container clusters describe drone

# https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials
gcloud container clusters get-credentials drone

# https://cloud.google.com/sdk/gcloud/reference/container/clusters/list
gcloud container clusters list

# https://cloud.google.com/sdk/gcloud/reference/container/get-server-config
gcloud container get-server-config