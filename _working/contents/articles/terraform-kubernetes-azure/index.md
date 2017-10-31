---
title: Build a Kubernetes Cluster on Azure with Terraform
author: Adron Hall
date: 2017-10-24 15:57:14
template: article.jade
---
<div class="image float-right">
    ![Terraform](terraform.png)
</div>

In the previous post I wrote about building a Kubernetes Cluster with Terraform, I covered the bases of building a cluster in Google Cloud Platform. Today I'm going to tackle the Azure Platform. There are a lot of similarities being the same task, but there are some differences which I'll take a look at.

First things first, locally you’ll want to have the respective CLI tools installed for Azure, Terraform, and Kubernetes.

<span class="more"></span>

* Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) and get it configured with `az configure` command.
* Install the latest [Terraform](https://www.terraform.io/intro/getting-started/install.html)
* With Azure CLI installed you can then easily install kubectl with `az acs kubernetes install-cli [--client-version] [--install-location]` command.

Dive in time!

Alright, first let's take a look at the before, before we look at the after. In Azure, the user interface is very tablet oriented with a sideways scroll. Some people love it, some adamantly despise it. I'm kind of in the, "enjoy it but wouldn't use it for work" camp. But it's rather nice looking to show a demo, elaborate on where and what is located where within the cloud service, and provides a nice way to visualize resources.






<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>
