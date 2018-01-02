---
title: Building a Data Thrashing CLI Tool in Go, Data Generation
author: Adron Hall
date: 2018-01-02 14:26:54
template: article.jade
---
This post follows from the [previous post](/articles/building-cli-data-thrasher/) on building and setup of the data [Thrahser](https://github.com/Adron/thrasher) CLI. The previous post covers all of the prerequisites and dives into the initial configuration code and CLI setup.

In this post I'm going to share the next key functionality for the CLI. The first thing I'll need is a way to create the tests, either through CLI flags or through configuration files for the tests.

<div class="image float-right">
    ![Code Sharing](GOPHER_SHARE.png)
</div>

<span class="more"></span>



**Posts for this series.**

* Part 1 - "[Building a Data Thrashing CLI Tool in Go](/articles/building-cli-data-thrasher/)"
* This post "[Building a Data Thrashing CLI Tool in Go, Data Generation](/articles/building-cli-data-thrasher-part-duex/)"