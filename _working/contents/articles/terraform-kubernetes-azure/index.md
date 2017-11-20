---
title: Build a Kubernetes Cluster on Azure with Terraform
author: Adron Hall
date: 2017-11-15 20:00:14
template: article.jade
---
<div class="image float-right">
    ![Azure](Azure.png)
</div>

In the previous post I wrote about building a Kubernetes Cluster with Terraform, I covered the bases of building a cluster in Google Cloud Platform. Today I'm going to tackle the Azure Platform. There are a lot of similarities being the same task, but there are some differences which I'll take a look at. The repository to this write up is located in *[another_new_world](https://github.com/Adron/another_new_world)* on Github.

First things first, locally you’ll want to have the respective CLI tools installed for Azure, Terraform, and Kubernetes.

<span class="more"></span>

* Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) and get it configured with `az configure` command.
* Install the latest [Terraform](https://www.terraform.io/intro/getting-started/install.html)
* With Azure CLI installed you can then easily install kubectl with `az acs kubernetes install-cli [--client-version] [--install-location]` command.

Dive in time!

<div class="image float-right">
    ![Terraform](terraform.png)
</div>

Alright, first let's take a look at the before, before we look at the after. In Azure, the user interface is very tablet oriented with a sideways scroll. Some people love it, some adamantly despise it. I'm kind of in the, "enjoy it but wouldn't use it for work" camp. But it's rather nice looking to show a demo, elaborate on where and what is located where within the cloud service, and provides a nice way to visualize resources.

Let's take a look at what we start with before building anything. The initial dashboard as one would expect, is empty.

![Azure](azure-empty-01.png)


 
![Azure](azure-empty-02.png)
 
![Azure](azure-empty-03.png)
 
![Azure](azure-empty-04.png)
 
Alright. That's the starting point, so let's get started on building out a Kubernetes Cluster using Terraform.

**References:**

* [Github Repo]()