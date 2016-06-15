---
title: Immutable Infrastructure - Some Reads and Clarification of What It Is
author: Adron Hall
date: 2016-04-12 13:39
template: article.jade
---

First let's get these terms a little more defined with the help of some well written articles on the matter.

## An Introduction to Immutable Infrastructure

A well written piece by <a href="https://twitter.com/joshstella" target="_blank">@joshstella</a> on O'Reilly Radar titled "<a href="http://radar.oreilly.com/2015/06/an-introduction-to-immutable-infrastructure.html" target="_blank">An Introduction to Immutable Infrastructure</a>". Here are some key elements in Josh's description of immutable infrastructure.

<span class="more"></span>

> Immutable infrastructure (II) provides stability, efficiency, and fidelity to your applications through automation and the use of successful patterns from programming.

This provides a basic description, at a very high level, of what immutable infrastructure is. The keys to note are the idea of programming the infrastructure instead of tediously setting it up manually as has traditionally been done.

> Immutable infrastructure requires full automation of your runtime environment. This is only possible in compute environments that have an API over all aspects of configuration and monitoring. Therefore, II can be fully realized only in true cloud environments. It is possible to realize some benefits of II with partial implementations, but the true benefits of efficiency and resiliency are realized with thorough implementation.

In this part another key point, from a functional perspective of what immutable infrastructure is, is brought up. The availability of APIs to control all aspects of the infrastructure and beyond are needed to truly implement this pattern of infrastructure use. Without APIs to programmatically enable this there is no way to truly create immutable infrastructure.

> Historically, we’ve thought of machine uptime and maintenance as desirable because we associate the health of the overall service or application with them. In the data center, hardware is expensive and we need to carefully craft and maintain each individual server to preserve our investments over time. In the cloud, this is an anachronistic perspective and one we should give up on in order to create more resilient, simpler, and ultimately more secure services and applications.

Paraphrased - kill your tediously and manually managed servers! <em>Woohoo!</em>

## Why You Should Build an Immutable Infrastructure

"<a href="https://blog.codeship.com/immutable-infrastructure/" target="_blank">Why You Should Build an Immutable Infrastructure</a>" by <a href="http://Even though the  https://twitter.com/flomotlik" target="_blank">@flomotlik</a> is an excellent write up with a bit more detail about how, where, and why to build out immutable infrastructure. The blog <a href="https://twitter.com/codeship" target="_blank">@Codeship</a> overall is an excellent place to find more implementation details about designing, uses, and ways to put together your own immutable infrastructure. In the article I've linked Florian draws some solid points about their experience with immutable infrastructure. Some of the key features Florian details include:


* State Isolation
* Atomic Deployments and Validation
* Fast Recovery by Preserving History
* Simple Experimentation

All of these are valid reasons to go with an immutable infrastructure design practice. Florian also puts together some great links &amp; reference material at the end of the article too.

## Summary...

So these are reasonable good reads on immutable infrastructure, something, that if you're in charge of any type of application deployment will benefit from in some significant ways. So learn up, and feel free to ping me for further discussion on twitter <a href="https://twitter.com/adron" target="_blank">@Adron</a>. Cheers!