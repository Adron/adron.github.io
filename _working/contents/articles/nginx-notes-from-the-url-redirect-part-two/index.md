---
title: NGinx Notes from URL Redirect Project on Google Cloud with Terraform & Packer - Part 2
author: Adron Hall
date: 2016-08-01
template: article.jade
---
<div class="image float-right">
    ![Google Cloud Platform](google-cloud-platform.png)
</div>

In the [first blog entry, "NGinx Notes from URL Redirect Project on Google Cloud with Terraform & Packer - Part 1"](http://blog.adron.me/articles/nginx-notes-from-the-url-redirect/) I covered getting a basic Nginx URL Redirector setup and running. Now it's time to dig into some of the next steps.

Since we have an operative server running that we want to automate, I'll actually just wipe out the server we built in the first part of this series. Albeit I will refer back to it when I get to the process of recreating this server with Packer and Terraform. So first things first, let's actually setup the networking elements needed to put the server into action.

<span class="more"></span>

## Infrastructure : The first Terraform Resources

The first thing I need is an IP and an A Record in DNS to map to the server that'll be in charge of the redirection. With Terraform, I can automate this, and for a quick review of how to get started with Google Cloud and Terraform, check out my post "[Working With Google Compute Engine (GCE) using Terraform (With a load of Bash Scripts too)](http://blog.adron.me/articles/working-with-google-compute-engine/)". With that, I'll add the following files to this project including the following Terraform resources. The way I do this is simply create a directory and run `git init` to make that a repo, then just push it up to Github or wherever the remote needs to be stored. I'll work based on that from here on out with this series. 

* Filename: `connections.tf`

This file will simply host the connection for the provider I'll be building the infrastructure resources against. In this case, I'll be working against Google Cloud. The `credentials` section in the file has the interpolated local file `account.json` that I have my secret key in. It's one of the multiple ways you can setup your Google Cloud key to use with Packer, Terraform, or other tools. For more information or for specific directions on getting an account.json file just read my previous post on using [Google Cloud & Terraform](http://blog.adron.me/articles/working-with-google-compute-engine/).

    provider "google" {
      credentials = "${file("../secrets/account.json")}"
      project     = "that-big-universe"
      region      = "us-central1"
    }

* Filename: `addresses.tf`

This file will include the resources for the static IPs for use with the server and assigning a subdomain within the DNS Zone to redirect.
 
    resource "google_compute_address" "nginx-server" {
      name = "nginx-server"
    }

* Filename: `zone-adronme.tf`

This file has more than the entries below, such as for this very blog. But I've just included the specifics of what are needed to provide the subdomain that will direct to the server, which will then provide the redirect.

    resource "google_dns_managed_zone" "adronme" {
        name = "adronme"
        dns_name = "adron.me."
        description = "Production http://adron.me Domain."
    }
    
    resource "google_dns_record_set" "data" {
        managed_zone = "${google_dns_managed_zone.adronme.name}"
        name = "data.${google_dns_managed_zone.adronme.dns_name}"
        type = "CNAME"
        ttl = 5
        rrdatas = ["${google_compute_address.nginx-server.address}"]
    }

Note that the rrdatas value of `google_compute_address.nginx-server.address` references whatever static IP is created in the `addresses.tf` file resource.

That will give me the DNS entries needed to get any requests sent to the actual server from within Google Cloud using their respective DNS Server & static IP assigned for their network.

The next thing I want now is the actual server that Nginx will be installed on. I don't want Terraform just to whimsically make this Nginx Server from scratch though. I know what needs to be on the server, namely Nginx, but also how it should be configured by default. The easiest way to insure Terraform builds a Virtual Machine in a repeatable way is to simply create an image in Google Cloud first. That way I can use that as the base of the virtual machine whenever it needs created. The way I generally manage this, is I simply create a folder within the repository called *Packer*.

