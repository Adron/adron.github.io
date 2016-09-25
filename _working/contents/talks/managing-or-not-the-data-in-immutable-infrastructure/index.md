---
title: Managing (or not) the Data in Immutable Infrastructure
author: Adron Hall
date: 2016-09-24:17:33:02
template: talk.jade
---
## Managing (or not) the Data in Immutable Infrastructure
*@ [DataLayer](https://datalayer.com) on 2016-09-28*

The idea of immutable infrastructure is awesome. However a major problem immediately erupts when we get to the part where we actually have to connect application infrastructure with data infrastructure. In this talk I'll aim to start conversations about what specifics we can aim for now, and in the future, to remove this gap. I'll also talk about and show what and how I've worked up solutions in production with immutable infrastructure and data connectivity.

<div class="image float-right">
    ![Home Depot](home-depot.png)
</div>

In this talk I dive into the needs and problems of two specific data systems we've deployed at Home Depot. One is our use of [Elasticsearch](https://www.elastic.co/products/elasticsearch) and the other is [SQL Server](https://www.microsoft.com/en-us/cloud-platform/sql-server). 

Not Managing - AKA The Problems



Managing

<div class="image float-left">
    ![Google Cloud Platform](gcp.png)
</div>

