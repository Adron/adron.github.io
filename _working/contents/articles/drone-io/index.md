---
title: Introduction to Drone.io
author: Adron Hall
date: 2017-1-25
template: article.jade
---
* **Research & Learn**: [Drone.io Github Repo](https://github.com/drone/drone), [Trying Drone.io](http://try.drone.io/), and [Drone.io Docs](http://readme.drone.io/).
* **Objective**: What Drone.io is and getting started.

I've dived into a new effort to figure out [Drone.io](http://try.drone.io/), get it running, and if plausible contribute in some way to the project. This was kick started yesterday while I was speaking with Joachim ([T @lindyhop](https://twitter.com/lindyhop) && G [@josmo](https://github.com/josmo)) about some projects we're working on. We discussed the design of Drone.io, how we're using it on some projects internally here [@PelotonTechio](https://twitter.com/PelotonTechio). I will, and others will be posting more on what we're doing with Drone.io later, but for now, I've put together this introduction to what Drone.io is, and getting started with it.

<span class="more"></span>

## My First Steps

I was fortunate to join Joachim a few weeks ago for a Share-out [@PelotonTechio](https://twitter.com/PelotonTechio) where someone from the team shares information they've recently gained while working on a project, toying around with a personal project, or other research they've been doing. From this, I had a little head start of what Drone.io is about, but still dug in from the very start. Which in my case, that meant grabbing the code and looking directly into things.

## What is Drone.io?

In simple terms, Drone is a continuous integration platform using containers, primarily Docker based containers. These containers provide complete control over each build environment with the obvious isolation that containers provide. The goal of Drone is to help ship code similar to the way Github does, as per the stated objective in the README.md. Check out more on that specific [here](https://github.com/blog/1241-deploying-at-github#always-be-shipping).

If you're curious about what Github does, and it's TLDR; and you don't want to click through, here's the synopsis in one graph:

Always be shipping:
[![Always Be Shipping](abs-graph.png)](https://github.com/blog/1241-deploying-at-github#always-be-shipping)

A secondary goal is to replace Jenkins as an industry wide integration tool. We'll all get to see how that goes as time rolls onward.

## Getting a Build Started

The first step, if you've got a build environment already, is simply to create a .drone.yml file. This file is a subset of the [docker-compose](https://docs.docker.com/compose/) style format. This yaml file describes the services and the container image that will be used. For instance, here's an example from the docs.

```shell-script
pipeline:
  build:
    image: golang
    commands:
      - go get
      - go build
      - go test

services:
  postgres:
    image: postgres:9.4.5
    environment:
      - POSTGRES_USER=myapp
```

This is a simple service running postgres using the postgres 9.4.5 docker image and the pipeline is based on the golang image. The first pipeline step is to build using the commands `go get`, `go build`, and `go test`. The service in this situation would likely be available for that build to use for integration tests with the database server.

This also points to how the architecture works for this particular process. Drone starts these containers up based on the specified images. That image acts as the starting point for the container point which will be used to put code on that will eventually be built, tested, or otherwise used for this processing.

Once the image is pulled, Drone automatically clones the repository you specify onto a locally mounted volume, called a workspace, on the running container. The clone process is parallel to executing a command similar to the following (from the docs [here](http://readme.drone.io/usage/getting-started/)):

```shell-script
git clone --depth=50 --recusive=true \
    https://github.com/octocat/hello-world.git \
    /drone/src/github.com/octocat/hello-world
git checkout 7fd1a60
```

That the basic steps and idea for getting a build setup. It's one seriously clean, smooth, and seamless way to setup a build. In the coming weeks I'll have more information about builds for specific stacks, but for now, let's take a look at some other elements beyond setting up a simple build.

## Setting up Some Drone(s)

Alright, so after digging through a bit I realized I just needed to dig in and get a Drone service running for myself. So this was my first attempt at getting Drone up and running.



<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>
