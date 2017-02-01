---
title: Setting up a GCP Container Cluster - Part II
author: Adron Hall
date: 2017-02-01 11:06:11
template: article.jade
---
<div class="image float-right">
    ![Google Compute & Container Engines together with Kubernetes](gce-kube-gce.png)
</div>

Yesterday I wrote up the experience around getting a Google Container Cluster up and running and adding a Terraform config to automate the process. Today my plan is to dig into getting containers into the Google Container Repository and then using those containers to launch various things within the Google Container Cluster. With my end goal being to get a Drone.io setup for production use.

<span class="more"></span>



Google Container Engine

Container Clusters > https://cloud.google.com/container-engine/docs/clusters/

https://cloud.google.com/container-engine/docs/clusters/operations
