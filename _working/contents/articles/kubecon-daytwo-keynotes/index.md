---
title: KubeCon Keynote Day Two
author: Adron Hall
date: 2017-12-07 09:33:54
template: article.jade
---
<div class="image float-right">
    ![KubeCon Logo](kubelogo-wide.png)
</div>

[Kelsey Hightower](https://twitter.com/kelseyhightower), [Chen Goldberg](https://twitter.com/goldbergchen), and [Anthony Yeh](https://twitter.com/enisoc)

Day two kicked off (read on for day one wrap up) with Kelsey Hightower, Chen Goldberg, and Anthony Yeh. The big push from Kelsey and team focused their keynote around the development story around Kubernetes. Specifically, that a developers and apps users, should never need to know they're using Kubernetes. He, Chen, and Anthony all talked about the idea we developers - as I'll offer is true - want to work within our workflow committing, tagging, and knowing our applications will appear in test, development, QA, UAT, and production as we work.

[Clayton Coleman](smarterclayton)

Next Clayton Coleman from Red Hat came up to talk about "Boring is Good". I found Clayton's quote "Red Hat helsp build boring software" to be well stated and also an apt description of how Red Hat succeeds today. Red Hat currently, boringly, runs some of the largest Kubernetes clusters. They use Prometheus to gain observability into those clusters and work dilligently to improve Kubernetes.

<span class="more"></span>

[Zihao Yu](https://twitter.com/zihaoyu) & [Illya Chekrygin](https://twitter.com/illya_chekrygin)

Zihao & Illya took the stage to talk about how HBO has used Kubernetes, with a lot of Node.js and Go Services and Apps, for Season 7 of Game of Thones! Illya started in on their traditional hosting patterns with AWS and how much of the resources they needed led to excessive waste. For instance they had to use EC2 instances, for the Node.js apps, that had multiple cores but only 1 core could be used for the apps. So one core was wasted just so better network could be relied on with those EC2 instances. Multiple other issues existed, which Illya then dove into how they resolved those.

Their process started toward Kubernetes in 2015. This alone says a lot about the capabilities and stability of Kubernetes. Zhao then took lead of the keynote and talked about how they moved toward Kubernetes. HBO moved onto Kubernetes with HA multi-masters, masters and minions are in autoscaling groups, which also are multi-az, with OIDC authenitcation for CoreOS Dex and Github. Overall a slick implementation.

Zhao also talked about what a lot of us do for management of our infrastructure and clusters, which is use of Terraform use for underlying infrastructure. He then continued on to layout how Terraform is used for their instance creation and type management, module use, and more.

The wrap up for Illya's and Zihao's talk focused on the great benefits of community; the diversity, inspiration, innovation, friendly, capable, and smart people that work in and around the system to keep things going and move forward. Great wrap up for the talk!

[Spike Curtis](https://twitter.com/SpikeCurtis)

Spike, working with Tigera, came out to talke about progress toward zero trust Kubernetes networks. As I often say too, security is oft ignored, seeing a security related topic in the keynote is hugely important. Spike went on to talk about end to end encryption, network policy access control, and ore security related details. One thing Spike likes is the capabilities around mutually secured TLS connections without a need to change a thing in development.

Today Tigera annuonced new product features and capabilities around securing Kubernetes with zero trust designs. Check out more at [Tigera](https://tigera.io/).

[Craig McLuckie](https://twitter.com/cmcluck)

To wrap up the keynote, Kelsey introduced [Craig McLuckie](https://twitter.com/cmcluck) of [Heptio](https://www.heptio.com/). Craig came out to talk about the road ahead, and also talk about the community itself. He spoke of developer productivity, multi-cloud, and the complexity of enterprise use of... well... anything.