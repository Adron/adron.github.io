---
title: setting up gcp container cluster droneio part 3
author: Adron Hall
date: 2017-02-13 15:24:37
template: article.jade
---
At this point in the series I've got a few key elements put together. I'll quickly review and then dive into the final steps to get Drone.io up and running.

* A Google Container Cluster is up and running.

* I've got a Terraform config file for that container cluster.

With those two things I'm ready to get Drone.io running on the container cluster. I'm going to dive into that but also add a few other little tidbits. For instance, I definitely want to run it with https/ssl enabled, so I'll snag a cdertifcate for that for [Let's Encrypt](https://letsencrypt.org/).
 
The first thing I need to do, and this might seem crazy at first, is some assets to define the server, the agent, and related assets that will build in the container cluster.

*


<span class="more"></span>

<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>
