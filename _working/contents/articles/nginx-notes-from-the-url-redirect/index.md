---
title: NGinx Notes from URL Redirect Project on Google Cloud with Terraform & Packer
author: Adron Hall
date: 2016-07-15
template: article.jade
---
I set out on a mission yesterday to put together a URL Redirect Server. Before I even get into the nitty gritty of how I got this to work via Nginx, I'll add two caveats:

* I don't really know much about Nginx at all. I've written up and configured one reverse proxy and handed that off to some ops team. Theoretically it worked (in their testing). But other than that, I've barely done anything myself with Nginx.
* I've no idea really if this is even a good practice. URL Redirects of this sort actually seem like a hack. They work, but it seems like there really ought to be a better less onion layer like way to do this type of redirection.

With those two caveats I'll add a few questions for you, dear reader.

1. If you have any suggestions for an easier way than spinning up a whole Nginx Server to do URL Redirects I'd love to hear them!
2. Is this a best practice way to do subdomain to URL Redirects? If not, I'd probably like to be doing whatever is best practice.

Anyway, now that we're past my caveats, questions, and requests for help, let's roll on the how-to of all this.

<span class="more"></span>

This whole setup started when I realized while doing a migration from one DNS Provider to Google DNS. Google DNS doesn't convolute their DNS Services with URL Redirect features or other non-DNS features. When I stumbled into the fact that there were some URL Redirects that had muddled themselves into Google DNS as actual CNAME DNS entries, I knew I'd need to get those migrated to something that could actually do URL redirects.

The need was super simple in scope. Have a subdomain, like [http://data.adron.me](http://data.adron.me) redirect (302 and eventually 301, more on that in a minute) to something like [http://api.compositecode.com/dataservices/information.html](http://api.compositecode.com/dataservices/information.html). I did some reading about [Apache vs. Nginx](https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations). I determined I'd go with Nginx as I knew it to be a solid server with minimal fuss.

## Setting up Nginx

Before getting into a smart way to setup Nginx, I just dove in to figure out how to setup a redirect.

First I spun up an Ubuntu 16.04 Server on Google Cloud. Here's the interface for creating a new instance on Google Compute Engine (GCE).

![Google Cloud Instance Setup](nginx-url-redirector-01.png)

Next setup the criteria for the instance. In my particular situation I'm assuming an almost non-existent need for resources so I've select the uber cheapo $4.49 instance. For that instance I named it url-redirector, stuck it in the us-central1-a zone, selected the micro (1 shared vCPU) with 0.6 GB Memory, using the Ubuntu 16.04 LTS image, gave it default access, selected HTTP traffic, and clicked create.

![Google Cloud Instance Setup](nginx-url-redirector-02.png)

Once created it displayed on the Compute Engine dashboard screen. There I have my IP and SSH options.

![Google Cloud Instance Setup](nginx-url-redirector-03.png)

Clicking on the SSH vertical elipsis I then selected the `View gcloud command` option. A dialog appears with the gcloud command to connect to this new instance.

![Google Cloud Instance Setup](nginx-url-redirector-04.png)

I copied the command to ssh into my Google Cloud server instance.

`gcloud compute --project "that-big-universe" ssh --zone "us-central1-a" "url-redirector"`

At this point I went ahead and logged into this new instance and installed Nginx.







---


### Packer File

Packer is a tool for building images in providers like AWS, Google Cloud, Windows Azure, VMware, and a host of other providers and tools.

### Terraform Resource



### Atlas Deploy



## Summary

Now I've got a solid redirect in place for [http://data.adron.me](http://data.adron.me) that is sending traffic to [http://api.compositecode.com/dataservices/information.html](http://api.compositecode.com/dataservices/information.html). For a full repo of all this work, I've put it right here via Apache-2.0 License for your use as reference. Enjoy!

**References:**

* [Nginx](https://www.nginx.com/)
* [Nginx Documentation](https://www.nginx.com/resources/wiki/)
* [Installing Nginx on Ubuntu Server 14.04 LTS](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-14-04-lts)
* [Installing Nginx on Ubuntu Server 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04)
* [Aapche vs. Nginx: Practice Considerations](https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations)







<div class="image float-left">
    ![Somebody](anImage.jpg)
</div>