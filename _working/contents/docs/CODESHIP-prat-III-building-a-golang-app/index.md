---
title: CODESHIP prat III building a golang app
author: Adron Hall
date: 2017-03-03:22:33:18
template: doc.jade
---
# Getting Go Going Continuously with Integration & Delivery on Codeship Pro - Stage III

In this article it's time to dive into some heavier Go coding. Here are the key objectives.

* Gain some basic functionality that processes a basic JSON schema file as outlined in [INSERT LINK TO PREVIOUS BLOG ENTRY HERE]().
* Break out the code into some logical files to organize ongoing development.
* Add a few tests to confirm for the build & deployment as a gated step of the build.

## Data Diluvii ad Populum

Now I'm going to pull together some basic processing for the data deluge for the people, or in Latin "data diluvii ad populum". The first thing I'll need is to add is one more dependency. By using Glide I'll add that with the following command.
 
```
glide get github.com/Pallinder/go-randomdata
```

This will put the dependency into the `glide.yaml` file. With this update the file now contents now look like this.

```
package: github.com/adron/datadiluvium
import:
- package: github.com/gorilla/mux
  version: ^1.4.0
- package: github.com/Pallinder/go-randomdata
```

Once that's added I'm going to also add the ingestion of a basic JSON schema file via one of the service end points.
