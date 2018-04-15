#!/usr/bin/env bash

WORKING_GCP_PROJECT="that-big-universe"
WORKING_GCP_ZONE="us-west1-a"
WORKING_KUBY_DEV_WORK="kuby-dev-work"
#terraform init

#echo yes | terraform apply

case $1 in
    "kuby")
        echo "Creating a Kubernetes Cluster with gcloud."
        gcloud components install kubectl
        gcloud config set project $WORKING_GCP_PROJECT
        gcloud config set compute/zone $WORKING_GCP_ZONE
        gcloud container clusters create $WORKING_KUBY_DEV_WORK
        ;;
    "kubyremove")
        echo  "Destroying a Kubernetes Cluster with gcloud."
        gcloud container clusters remove
        ;;
    *)
        echo "Terraform executed."
        ;;
esac