---
title: Instrumentation for Observability
author: Adron Hall
date: 2018-03-13 19:18:11
template: article.jade
---
This is the first of a few posts around research I've done around observability over the last month. This post I'm specificaly focusing the details of what you do or don't get during ingest of data into systems used to build observable software. In this post I'm going to reference two specific tool & service providers: Elastic.co with Elasticsearch and Honeycomb.io.

For both of these I've created some simple CLI apps to send data to the service providers: the **[data-writer-honeycomb](https://github.com/Adron/data-writer-honeycomb)** and **[data-wrtier-elasticsearch](https://github.com/Adron/data-writer-elasticsearch)** repositories.

<span class="more"></span>






<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>
