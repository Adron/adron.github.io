---
title: Building a Base Docker Image for a Go Service
author: Adron Hall
date: 2017-1-13
template: article.jade
---

![Gopher, Whale, and Friends](docker-friends.png)

I've been building out an image for deployment of my Go application and wanted to get a write up put together, which is what this is about. Enjoy Gophers, any questions, comments, or suggestions please direct them at me [@Adron](https://twitter.com/Adron). Thanks!

<span class="more"></span>

I started testing, development, and research of what I'd need for an image with the [official Docker image](https://hub.docker.com/_/golang/) and [@ngauthier](https://twitter.com/ngauthier)'s "[Building Minimal Docker Containers for Go Applications](https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/)" Article. The end goal was simple, create an image that could be used for local builds (such as with [Jet](https://documentation.codeship.com/pro/getting-started/cli/) available with [Codeship](https://www.codeship.com/))
