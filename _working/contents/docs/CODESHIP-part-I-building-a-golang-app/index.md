---
title: CODESHIP part I building a golang app
author: Adron Hall
date: 2016-11-20:03:40:28
template: doc.jade
---
Today Go enjoys a lot of popularity for a number of reasons. It's a solid language that enjoys a lot of advantages. Some include its simple nature and how it works exceptionally well in the container based, cloud native, distributed world of today.

With this post I'm kicking off a series focused around building out and implementing a services application, based on container tech and cloud native principles.

## Tech, Capabilities, Implementation

In this series there are several key ideas behind the technologies, capabilities, and implementation details that I'll cover.

* Microservices - Building an application that will provide data generation.

* Containers - Use, creation, and management of containers for the build and delivery process.

The project I'll create is an example, but it is important to note the practices I'll follow are just as valid to a full blown project getting started.

## A Go Project

As a first step, I need a simple Go project. I'll use this to start building the systems for continuous integration and delivery around it. Whenever starting a project it is most ideal to implement the systems around the project as early as possible.

To accomplish this task it seemed reasonable to go ahead and create a repository on Github. I could then use it of course to manage the tasks at hand and of course store my code in. When I created the project I used Github's option to add a README.md, LICENSE, and Go based .gitignore file.

![Sailing-Delivery-01](sailing-delivery-01)

Once created I went ahead and created an [issue "Create a minimal Go Service to work with for CI/CD."](https://github.com/Adron/sailing-delivery/issues/1), just for a process flow and to ensure good visibility into what the project is for on Github.

Next I cloned the repository.

```
git clone git@github.com:Adron/sailing-delivery.git
```

With the repository cloned I added a *main.go* file and went about creating the basic Go service to work with.

```go
package main

import (
   "encoding/json"
   "fmt"
   "net/http"
   "log"
)

func handler(w http.ResponseWriter, r *http.Request) {
   fmt.Fprintf(w, "Welcome to the early morning Amtrak Cascades, %s!", r.URL.Path[1:])
}

type Message struct {
   Text string
}

func about (w http.ResponseWriter, r *http.Request) {
   m := Message{"Welcome to the app for setting up the initial CI/CD, build v0.0.001."}
   b, err := json.Marshal(m)

   if err != nil {
       panic(err)
   }

    w.Write(b)
}

func main() {
   http.HandleFunc("/", handler)
   http.HandleFunc("/about/", about)
   log.Fatal(http.ListenAndServe(":8080", nil))
}
```



To accomplish this task called *main.go*.
