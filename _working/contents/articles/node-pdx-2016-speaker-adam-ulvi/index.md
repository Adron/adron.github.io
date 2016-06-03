---
title: Ops for Devs by Adam Ulvi
author: Adron Hall
date: 2016-06-01
template: article.jade
---
![Node PDX 2016](nodepdx-2016-logo.png)

Node applications exist at the end of a long, somewhat magical series of tubes. What spells are being cast to make this all work? Let's find out!

In this talk Adam will explore the steps required to host a Node application on a small, affordable linux virtual private server (like a DigitalOcean droplet). This is not a tutorial, but rather, a walk-through of the configuration steps, background information the role each step plays, and the "why" behind the choices we are making.

<span class="more"></span>

<img class="image" src="adamulvi.jpg" style="float: right;margin-left: 15px;margin-top: 15px;" />

The reference implementation is taken from the current production gruntjs.com server.

By following the request lifecyle, we will touch on basic tcp/ip networking, DNS configuration and history, node application development, nginx proxy configuration, and basic linux system configuration.

At the end of the presentation developers should have a better understanding of the simple application's infrastructure requirements, external dependencies, and targets of opportunity for future improvement.

* Github: [github.com/aulvi](http://github.com/aulvi)
* IRC: s5fs