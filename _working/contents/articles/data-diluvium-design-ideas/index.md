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

*   *https://datadiluvium.com/schema/generate* - This API end point would take a schema with the various properties needed. For any that aren't set, a default would be set. The generation process would then randomize, generate, and insert this data into any destination source specified. Here are some prospective examples I've created:

    *A very basic sample JSON schema*

    ```javascript
    [
      {
        "schema": "relational",
        "database": "text"
      }
    ]
    ```
    
    In this particular example, I've created the simplist schema that could be sent into the service. For this particular situation I'd have (currently not decided yet) defaults that would randomly create a table, with a single column, and generate one element of data in that table. Other properties could be set, which would give control over the structure created in which to insert the data into. An example would be the following.
    
    ```javascript
    [
      {
        "schema": "relational",
        "database": "postgresql",
        "structure": [
          {
            "table": "Users",
            "columns": [
              {"name": "id", "type": "uuid"},
              {"name": "firstname", "type": "firstname"},
              {"name": "lastname", "type": "lastname"},
              {"name": "email_address", "type": "email"}
            ]
          },
          {
            "table": "Addresses",
            "columns": [
              {"name": "id", "type": "uuid"},
              {"name": "street", "type": "address"},
              {"name": "city", "type": "city"},
              {"name": "state", "type": "state"},
              {"name": "postalcode", "type": "zip"}
            ]
          },
          {
            "table": "Transactions",
            "columns": [
              { "name": "id", "type": "uuid" },
              { "name": "transaction", "type": "money" },
              { "name": "stamp", "type": "date" }
            ]
          }
        ]
      }
    ]
    ```
    
    In this example, the properties included are three tables; *Users*, *Addresses*, and *Transactions*. In the first table, *Users*, the columsn would be; *id*, *firstname*, *lastname*, and *email_address*. Each of these then have a *type* property which sets the type of data to be generated for the columns. The same type of set of properties is then included for the *Addresses* and *Transactions* tables and their respective columns.
    
    Some additional questions remain, such as if the tables exist in the database, would the insertion build SQL to create the tables? Should it be assumed that the tables exist already and have the appropriate settings set to insert the data into the tables? Again, a great thing to discuss on the [thread here](https://github.com/Adron/datadiluvium/issues/9).

* *https://datadiluvium.com/schema/validate* - This could be used to validate a schema request body. Simply submit a schema and a validation response would be returned with "Valid" or "Invalid". In the case of an invalid response, a list of prospective and known errors would be returned.

These two API end points focus around building out large data to test systemic environments and the respective construction of those environments. The actual generation of the data is assumed for this API service and the individual generation of data is discussed below in the individual request APIs.

## Individual Request APIs

The following API calls could be implemented with fairly straight forward random data generation. A number can easily be randomized and returned, a word can be chosen from a dictionary, and a city returned from a list of cities. The following are prospective API calls to return data of this type.

* *https://datadiluvium.com/random/number/*
* *https://datadiluvium.com/random/word/*
* *https://datadiluvium.com/random/city/*

The next level of complexity for data generation would be the slightly structured data generation. Instead of having an arbitrary list of addresses, we could or would prospectively generate one. But on the other hand, maybe we should just randomly create actual addresses that can be validated against an actual real address? That seems to have the possiblity of issues in the real world in spite of the fact all the addresses out there in the world are basically publicly accessible data. But questioning how or what the data would or could actually represent will be a great thing to discuss in the [thread](https://github.com/Adron/datadiluvium/issues/9).

* *https://datadiluvium.com/random/address/*
* *https://datadiluvium.com/random/name/*

The next level of data generation complexity would be to generate sentences and other related data. This could be done a number of ways. If we wanted to have it generate intelligent sentences that made sense, it would take a little bit more work then for example generating lorum ipsum.

* *https://datadiluvium.com/random/sentence/*

### TLDR;

This blog entry just details the starting point of features for the [Data Diluvium Project](http://datadiluvium.com/). If you'd like to jump into the project too, let me know. I'm generally working on the project during the weekends and a little during the week. There's already a [building project base](https://github.com/Adron/datadiluvium) that I'm starting with. If you're interested in writing some F#, check out the work Dave Curylo has done [here](). I've been pondering breaking it out to another project and sticking to the idea of microservice but with F# for the work he put in. Anyway if you've got ideas on how to generate data, how you'd like to use it in your applications, or other related ideas please dive into the conversation on the [Github Thread here](https://github.com/Adron/datadiluvium/issues/9).