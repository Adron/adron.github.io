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

This example covers the core features. I've setup a schema and database key value pair, which I've set here to a relational schema setup for a Postgresql relational database. The connection parameter would be an array of key value pairs that would have the necessary information for connecting to the database. Below that the structure is where the database, which will be filled with generated data, is described.

At this point there are many other stories and feature requests I could come up with. At this point I know enough of the story to start building out some more of the systemic elements that are needed. I'll get right into that and step back into describing features after getting more of a feel for building this API service.

## Next Step Dependencies

I really need to get into the services at this point. Get something working to actually work from. Similar to how I have already put together the actual build. At the end of the last article in this series I had written a *hello world* style service, but that won't cut it. For this I want to use something that has features and capabilities focused around microservices. This could and should cut back on a lot of the standard work that is needed. For this I'll use [go-kit](https://github.com/go-kit/kit).

To get this library, I use the standard [Go Get](https://golang.org/cmd/go/) command. This command will retrieve an available dependency. In this case I want to get the go-kit and start using it.

`go get github.com/go-kit/kit`

Go-kit focuses on a few key goals. The framework is designed to operate in a heterogenous environment, with the intent to communicate with any and all non go-kit services. RPC is the primary messaging pattern, it includes pluggable transport and serialization, and is designed to operate with existing infrastructures.

```javascript

```

```javascript

```
