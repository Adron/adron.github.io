---
title: Data Diluvium Design Ideas
author: Adron Hall
date: 2017-02-04 12:44:58
template: article.jade
---
<div class="image float-right">
    ![Data Diluvium](dd-logo.jpg)
</div>

This post includes a collection of my thoughts on design and architecture of a data generation service project I've started called [Data Diluvium](http://datadiluvium.com). I'm very open to changes, new ideas, or completely different paradigms around these plans altogether. You can jump into the conversation [thread](https://github.com/Adron/datadiluvium/issues/9). What kind of data do you often need? What systems do you want it inserted into?

Breakdown of Article Ideas:

* **Collected Systems API** - This API service idea revolves around a request that accepts a schema type for a particular database type, an export source for inserting the data into, and generating an amount of data per the requested amount. The response then initiates that data generation, while responding with a received message and confirmation based on what it has received.
* **Individual Request API** - This API service idea (thanks to Dave Curylo for this one, [posted in the thread](https://github.com/Adron/datadiluvium/issues/9#issuecomment-276117856)) revolves around the generation of data, requested at end points for a particular type of random data generation.

Alright, time to dive deeper into each of these.

<span class="more"></span>

## Collected Systems APIs

* *https://datadiluvium.com/schema/generate* - This API end point would take a schema with the various elements needed, and using the custom data from the schema and convention based defaults for any that isn't selected begin the generation process. The generation process would then randomize, generate, and insert this data into any destination source specified. Here are some prospective examples I've created:

*A very basic sample JSON schema*
```

```

* *https://datadiluvium.com/schema/validate* - This could be used to validate a schema request body. Simply submit a schema and a validation response would be returned with "Valid" or "Invalid". In the case of and invalid response, a list of prospective and known errors would be returned.

These two API end points focus around building out large data to test systemic environments and the respective construction of those environments. The actual generation of the data is assumed for this API service and the individual generation of data is discussed below in the individual request APIs.

## Individual Request APIs

The following API calls could be implemented with fairly straight forward random data generation. A number can easily be randomized and returned, a word can be chosen from a dictionary, and a city returned from a list of cities. The following are prospective API calls to return data of this type.

* *https://datadiluvium.com/random/number/*
* *https://datadiluvium.com/random/word/*
* *https://datadiluvium.com/random/city/*

The next level of complexity for data generation would be the slightly structured data generation. Instead of having an arbitrary list of addresses, we could or would prospectively generate one. But on the other hand, maybe we should just randomly create actual addresses that can be validated against an actual real address? That seems to have the possiblity of issues in the real world in spite of the fact all the addresses out there in the world are basically publicly accessible data. But questioning how or what the data would or could actually represent will be a great thing to discuss in the [thread](https://github.com/Adron/datadiluvium/issues/9).

* *https://datadiluvium.com/random/address/*
* *https://datadiluvium.com/random/name/*

The next level of data generation complexity would be to generate sentences.

* *https://datadiluvium.com/random/sentence/*

* *https://datadiluvium.com/random/*
* *https://datadiluvium.com/random/*

If you've got ideas on how to generate data, how you'd like to use it in your applications, or other related ideas please dive into the conversation on the [Github Thread here](https://github.com/Adron/datadiluvium/issues/9).