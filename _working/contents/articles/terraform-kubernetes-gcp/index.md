---
title: Build a Kubernetes Cluster on Google Cloud Platform with Terraform
author: Adron Hall
date: 2017-10-19 19:20:39
template: article.jade
---
Recently I did a series of talks focused around building Kubernetes Clusters. In the talks I demoed how Terraform can be used to build out a Kubernetes cluster and then ideas for working with that Kubernetes cluster or building out other infrastructure with Terraform around the Kubernetes cluster. This is the first of several blog entries where I'll be talking about individual parts of the talks with greater detail.

In this blog entry I'm going to detail the exact configuration and cover in some additional details the collateral resources you can expect to find once the configuration is executed against with Terraform.

<span class="more"></span>

First things first, locally you'll want to have the respective CLI tools installed for Google Cloud Platform, Terraform, and Kubernetes.

* [Install the gcloud CLI](https://cloud.google.com/sdk/downloads) and get it configured with [gcloud init](https://cloud.google.com/sdk/gcloud/reference/init)
* [Install the latest Terraform](https://www.terraform.io/intro/getting-started/install.html)
* With gcloud CLI installed you can then easily install kubectl with `gcloud components install kubectl`.

<div class="image float-right">
    ![Google Cloud Platform](gcp.png)
</div>

<div class="image float-right">
    ![Terraform](terraform.png)
</div>
