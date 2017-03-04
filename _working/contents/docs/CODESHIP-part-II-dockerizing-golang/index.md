---
title: CODESHIP part II dockerizing golang
author: Adron Hall
date: 2016-11-20:03:40:46
template: doc.jade
---
Previously in this series I've put together all of the basic elements to insure I have a working build to develop from. This insures I have the ability to make changes rapidly, change direction when needed, insure the code base is always building, tested, and able to be deployed. If you want to catch up and follow along step through the previous article of the series [here](#part1).

In this article I'm going to start stepping toward a working services product, and provide a description and details of what I intend to build.

## Application Description

The idea behind this application is to generate data. However I don't want to create just a simple data generator alone. Instead I want a system which can generate data and also place it into an appropriate location after generating the data. With this basic setup I would need 2 key pieces of information to pass along to the API, so that it can then generate the data and put the data into the location designated.

## Core Application Goals

* Provide an API that accepts parameters, via a schema, that then will be used to generate and identify where to put the data after generation. 
* In the schema, the basic data will describe the structure of the data store in which the generated data will be inserted.
* In the schema, I'll also want to be able to designate the type, and how many of the specific piece of data to generate.

I've created an example below, to provide an idea of what would be passed into the API. At this point I'm not trying to determine exactly how something would work, specific criteria, or the details of verifying the data, but just simply a workflow to achieve basic functionality around the core goals. 

```javascript
[
  {
    "schema": "relational",
    "database": "postgresql",
    "connection": [
      {
        "connectionData": "stringForConnectionEtc",
        "username": "theUser",
        "password": "thePassword",
        "otherConnectionParam": "TheOtherValue"
      }
    ],
    "structure": [
      {
        "table": "Users",
        "generate": "4234908",
        "columns": [
          {"name": "id", "type": "uuid"},
          {"name": "firstname", "type": "firstname"},
          {"name": "lastname", "type": "lastname"},
          {"name": "email_address", "type": "email"}
        ]
      },
      {
        "table": "Addresses",
        "generate": "2323498",
        "columns": [
          {"name": "id", "type": "uuid"},
          {"name": "userFkId", "type": "uuid", "keyParentTable": "Users", "keyParentColumn": "id"},
          {"name": "street", "type": "address"},
          {"name": "city", "type": "city"},
          {"name": "state", "type": "state"},
          {"name": "postalcode", "type": "zip"}
        ]
      },
      {
        "table": "Transactions",
        "generate": "1432434908",
        "columns": [
          { "name": "id", "type": "uuid" },
          {"name": "userFkId", "type": "uuid", "keyParentTable": "Users", "keyParentColumn": "id"},
          { "name": "transaction", "type": "money" },
          { "name": "stamp", "type": "date" }
        ]
      }
    ]
  }
]
```

Alright, this example covers the core features. I've setup a schema and database key value pair, which I've set here to a relational schema setup for the portgresql relational database. The connection parameter would be an array of key value pairs that would have the necessary information for connecting to the database. Below that the structure is where the database, which will be filled with generated data, is described.

At this point there are many other stories and features requests I could come up with. But before getting to far ahead of ourselves, there are some specific things we could break out right now to put together. I'll get right into that, and step back into describing features after getting more of a feel for building this API service.


```javascript

```

```javascript

```