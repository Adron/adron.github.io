---
title: Build a Kubernetes Cluster on Google Cloud Platform with Terraform
author: Adron Hall
date: 2017-10-19 19:20:39
template: article.jade
---
<div class="image float-right">
    ![Terraform](terraform.png)
</div>

In this blog entry I'm going to detail the exact configuration and cover in some additional details the collateral resources you can expect to find once the configuration is executed against with Terraform.

First things first, locally you'll want to have the respective CLI tools installed for Google Cloud Platform, Terraform, and Kubernetes.

<span class="more"></span>

* [Install the gcloud CLI](https://cloud.google.com/sdk/downloads) and get it configured with [gcloud init](https://cloud.google.com/sdk/gcloud/reference/init)
* [Install the latest Terraform](https://www.terraform.io/intro/getting-started/install.html)
* With gcloud CLI installed you can then easily install kubectl with `gcloud components install kubectl` command.

Now that all the prerequisites are covered, let's dive into the specifics of setup.

<div class="image float-right">
    ![Google Cloud Platform](gcp.png)
</div>

If you take a look at the Google Cloud Platform Console, it's easy to get a before and after view of what is and will be built in the environment. The specific areas where infrastructure will be built out for Kubernetes are in the following areas, which I've taken a few screenshots of just to show what the empty console looks like. Again, it's helpful to see a before and after view, it helps to understand all the pieces that are being put into place.

The first view is of the Google Compute Engine page, which currently on this account in this organization I have no instances running.

![GCP Console](gcp-01.png)

This view shows the container engines running. Basically this screen will show any Kubernetes clusters running, Google just opted for the super generic Google Container Engine as a title with Kubernetes nowhere to be seen. Yet.

![GCP Console](gcp-02.png)

Here I have one ephemeral IP address, which honestly will disappear in a moment once I delete that forwarding rule.

![GCP Console](gcp-03.png)

These four firewall rules are the default. The account starts out with these, and there isn't any specific reason to change them at this point. We'll see a number of additional firewall settings in a moment.

![GCP Console](gcp-04.png)

Load balancers, again, currently empty but we'll see resources here shortly.

![GCP Console](gcp-05.png)

Alright, that's basically an audit of the screens where we'll see the meat of resources built. It's time to get the configurations built now.

## Time to Terraform Our New World
