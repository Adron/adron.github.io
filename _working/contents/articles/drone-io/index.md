---
title: Introduction to Drone.io
author: Adron Hall
date: 2017-1-25
template: article.jade
---
* **Research & Learn**: [Drone.io Github Repo](https://github.com/drone/drone), [Trying Drone.io](http://try.drone.io/), and [Drone.io Docs](http://readme.drone.io/).
* **Objective**: What Drone.io is and getting started.

I've dived into a new effort to figure out [Drone.io](http://try.drone.io/), get it running, and if plausible contribute in some way to the project. This was kick started yesterday while I was speaking with Joachim (T [@lindyhop](https://twitter.com/lindyhop) && G [@josmo](https://github.com/josmo)) about some projects we're working on. We discussed the design of Drone.io, how we're using it on some projects internally here [@PelotonTechio](https://twitter.com/PelotonTechio). I will, and others will be posting more on what we're doing with Drone.io later, but for now, I've put together this introduction to what Drone.io is, and getting started with it.

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

Alright, so after digging through a bit I realized I just needed to dig in and get a Drone service running for myself. So this was my first attempt at getting Drone up and running. I saw the "*click this one cool button to make it work on Azure*" button but I have two issues with this: 1. I'm not actually learning anything about what is being done, and if it breaks I'm up the proverbial creek without a paddle 2. I currently, among all clients and people I cohack with, have zero need to know how it works on Azure. But hey, maybe in the future. For now, I just want to get something working locally, as it seems like this would be reasonable.

*Prerequisite Knowledge*

Digging through the documentation it is immediately clear that it behooves the admin of Drone to know a thing or three about Docker Compose, in addition to merely Docker. The first sample file that is in the docs [here](http://readme.drone.io/admin/installation-guide/) in the [installation guide](http://readme.drone.io/admin/installation-guide/) is simply a Docker Compose yaml file.

```
version: '2'

services:
  drone-server:
    image: drone/drone:0.5
    ports:
      - 80:8000
    volumes:
      - ./drone:/var/lib/drone/
    restart: always
    environment:
      - DRONE_OPEN=true
      - DRONE_GITHUB=true
      - DRONE_GITHUB_CLIENT=${DRONE_GITHUB_CLIENT}
      - DRONE_GITHUB_SECRET=${DRONE_GITHUB_SECRET}
      - DRONE_SECRET=${DRONE_SECRET}

  drone-agent:
    image: drone/drone:0.5
    command: agent
    restart: always
    depends_on: [ drone-server ]
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - DRONE_SERVER=ws://drone-server:8000/ws/broker
      - DRONE_SECRET=${DRONE_SECRET}
```

The installation guide generally follows the setup with the assumption of hosting it with a public access URI so that Github OAUTH can be setup. I simply wanted to get some basic elements tested out so I just thought I'd give it a go without any of that setup. Just run the basic service and get the UI setup first.

With that, I thought I'd just try to copy and paste the Docker Compose file into a *docker-compose.yaml* and just `docker-compose up` the thing. Theoretically it *shouldn't* hurt anything right? Well, without even setting the environment variables I kicked off the command.

Well, that was kind of useless. But you know, I immediately learned a few things just from observation of this attempt. Obviously it would, it should fail considering. So for attempt two I set the environment variables. It was a bit LOLz...

```
$ docker-compose up
WARNING: The DRONE_SECRET variable is not set. Defaulting to a blank string.
WARNING: The DRONE_GITHUB_CLIENT variable is not set. Defaulting to a blank string.
WARNING: The DRONE_GITHUB_SECRET variable is not set. Defaulting to a blank string.
Creating network "drone_default" with the default driver
Pulling drone-server (drone/drone:0.5)...
0.5: Pulling from drone/drone
a3ed95caeb02: Pull complete
802d894958a2: Pull complete
f294f54a4453: Pull complete
Digest: sha256:f04adc8fd1097671af6d74dd809eefea6e5062a881912322d3d908e167253a97
Status: Downloaded newer image for drone/drone:0.5
Creating drone_drone-server_1
Creating drone_drone-agent_1
Attaching to drone_drone-server_1, drone_drone-agent_1
drone-server_1  | time="2017-01-25T18:59:14Z" level=fatal msg="failed to generate token from DRONE_AGENT_SECRET"
drone-agent_1   | 1:M 25 Jan 18:59:15.243 * connecting to server ws://drone-server:8000/ws/broker
drone-agent_1   | 1:M 25 Jan 18:59:15.283 # connection failed, retry in 15s. websocket.Dial ws://drone-server:8000/ws/broker: dial tcp: lookup drone-server on 127.0.0.11:53: no such host
```

So even without the environment variables set it attempted to go about launching a *drone-server_1* and go through various steps. I quickly killed the efforts of the executing Docker Compose with Ctrl+C and then a quick call to `docker-compose down`.

```
$ docker-compose down
WARNING: The DRONE_SECRET variable is not set. Defaulting to a blank string.
WARNING: The DRONE_GITHUB_CLIENT variable is not set. Defaulting to a blank string.
WARNING: The DRONE_GITHUB_SECRET variable is not set. Defaulting to a blank string.
Removing drone_drone-agent_1 ... done
Removing drone_drone-server_1 ... done
Removing network drone_default
```

It appears at this point that it stopped and cleaned up appropriately. Also I wanted to see if I could get things going without the Github integration. I removed those environment variables form the list. That included deleting these lines.

```
- DRONE_GITHUB=true
- DRONE_GITHUB_CLIENT=${DRONE_GITHUB_CLIENT}
- DRONE_GITHUB_SECRET=${DRONE_GITHUB_SECRET}
```

I also made a change for the DRONE_SERVER, set the variables remaining. My yaml looked like this when completed.

```
version: '2'

services:
  drone-server:
    image: drone/drone:0.5
    ports:
      - 80:8000
    volumes:
      - ./drone:/var/lib/drone/
    restart: always
    environment:
      - DRONE_OPEN=true
      - DRONE_SECRET=${DRONE_SECRET}

  drone-agent:
    image: drone/drone:0.5
    command: agent
    restart: always
    depends_on: [ drone-server ]
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - DRONE_SERVER=ws://localhost:8000/ws/broker
      - DRONE_SECRET=${DRONE_SECRET}
```

To run this I setup a .env file, which can be used beside a docker-compose.yaml file to store environment variables. Since I didn't want to clutter up my actual environment variables on my machine while testing this out, this seemed a better route. The initial .env file had the following content.

```
DRONE_SECRET='thesecret'
```

After running `docker-compose` this time, I got the following.

```
$ docker-compose up
Creating network "drone_default" with the default driver
Creating drone_drone-server_1
Creating drone_drone-agent_1
Attaching to drone_drone-server_1, drone_drone-agent_1
drone-server_1  | time="2017-01-25T19:11:53Z" level=fatal msg="version control system not configured"
drone-agent_1   | 1:M 25 Jan 19:11:53.770 * connecting to server ws://localhost:8000/ws/broker
drone-agent_1   | 1:M 25 Jan 19:11:53.772 # connection failed, retry in 15s. websocket.Dial ws://localhost:8000/ws/broker: dial tcp [::1]:8000: getsockopt: connection refused
drone_drone-server_1 exited with code 1
drone-server_1  | time="2017-01-25T19:11:53Z" level=fatal msg="version control system not configured"
```

Well that escalated quickly to hostility! Egads! No version control system configured! Ugh. Ok, I guess I've got to have that as a default. I was hoping that it would present some type of default setup for this and just let me get running, especially since I want to host this locally, not out in internet land where I'd have a valid URI to use. With a quick change I added a few things back to the file with the following changes.

```
version: '2'

services:
  drone-server:
    image: drone/drone:0.5
    ports:
      - 80:8000
    volumes:
      - ./drone:/var/lib/drone/
    restart: always
    environment:
      - DRONE_OPEN=true
      - DRONE_GITHUB=true
      - DRONE_GITHUB_CLIENT=${DRONE_GITHUB_CLIENT}
      - DRONE_GITHUB_SECRET=${DRONE_GITHUB_SECRET}
      - DRONE_SECRET=${DRONE_SECRET}

  drone-agent:
    image: drone/drone:0.5
    command: agent
    restart: always
    depends_on: [ drone-server ]
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - DRONE_SERVER=ws://drone-server:8000/ws/broker
      - DRONE_SECRET=${DRONE_SECRET}
```

Then I navigated out to *https://github.com/settings/applications/new* and created an application for my *localhost*, guessing what it would prospectively be.

![New OAuth Application](New_OAuth_Application.png)

(Made a screenshot, then realized I had to take off the port numbers. No need for those)

Next accepted the permissions.

![Authorized Adron's Drone.io Application](Authorize_Adron_s_Drone_io.png)

The screen upon confirmation has the appropriate secret and client info for the application.

![OAuth Application Information](github-oauth.png)

The *.env* file then included the following changes.

```
DRONE_SECRET='thesecret'
DRONE_GITHUB_CLIENT=30clientbclient8d
DRONE_GITHUB_SECRET=8csecret09fesecret3be1a2427b80easecretcf
```

I then spooled up with `docker-compose up` again and progress was made!

```
$ docker-compose up
Recreating drone_drone-server_1
Recreating drone_drone-agent_1
Attaching to drone_drone-server_1, drone_drone-agent_1
drone-server_1  | time="2017-01-25T21:03:20Z" level=warning msg="agents can connect with token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoiJ3RoZXNlY3JldCciLCJ0eXBlIjoiYWdlbnQifQ.q8qhOlPLQePSxKfnTe-uURfMOKSQznA2iaLQZnuOYgE"
drone-server_1  | [GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
drone-agent_1   | 1:M 25 Jan 21:03:21.763 * connecting to server ws://drone-server:8000/ws/broker
drone-server_1  |  - using env:	export GIN_MODE=release
drone-server_1  |  - using code:	gin.SetMode(gin.ReleaseMode)
drone-server_1  |
drone-server_1  | [GIN-debug] GET    /static/*filepath         --> github.com/drone/drone/router.Load.func1 (2 handlers)
drone-server_1  | [GIN-debug] GET    /login                    --> github.com/drone/drone/server.ShowLogin (15 handlers)
drone-server_1  | [GIN-debug] GET    /login/form               --> github.com/drone/drone/server.ShowLoginForm (15 handlers)
drone-server_1  | [GIN-debug] GET    /logout                   --> github.com/drone/drone/server.GetLogout (15 handlers)
drone-server_1  | [GIN-debug] GET    /api/user                 --> github.com/drone/drone/server.GetSelf (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/user/feed            --> github.com/drone/drone/server.GetFeed (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/user/repos           --> github.com/drone/drone/server.GetRepos (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/user/repos/remote    --> github.com/drone/drone/server.GetRemoteRepos (16 handlers)
drone-server_1  | [GIN-debug] POST   /api/user/token           --> github.com/drone/drone/server.PostToken (16 handlers)
drone-server_1  | [GIN-debug] DELETE /api/user/token           --> github.com/drone/drone/server.DeleteToken (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/users                --> github.com/drone/drone/server.GetUsers (16 handlers)
drone-server_1  | [GIN-debug] POST   /api/users                --> github.com/drone/drone/server.PostUser (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/users/:login         --> github.com/drone/drone/server.GetUser (16 handlers)
drone-server_1  | [GIN-debug] PATCH  /api/users/:login         --> github.com/drone/drone/server.PatchUser (16 handlers)
drone-server_1  | [GIN-debug] DELETE /api/users/:login         --> github.com/drone/drone/server.DeleteUser (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/teams/:team/secrets  --> github.com/drone/drone/server.GetTeamSecrets (16 handlers)
drone-server_1  | [GIN-debug] POST   /api/teams/:team/secrets  --> github.com/drone/drone/server.PostTeamSecret (16 handlers)
drone-server_1  | [GIN-debug] DELETE /api/teams/:team/secrets/:secret --> github.com/drone/drone/server.DeleteTeamSecret (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/global/secrets       --> github.com/drone/drone/server.GetGlobalSecrets (16 handlers)
drone-server_1  | [GIN-debug] POST   /api/global/secrets       --> github.com/drone/drone/server.PostGlobalSecret (16 handlers)
drone-server_1  | [GIN-debug] DELETE /api/global/secrets/:secret --> github.com/drone/drone/server.DeleteGlobalSecret (16 handlers)
drone-server_1  | [GIN-debug] POST   /api/repos/:owner/:name   --> github.com/drone/drone/server.PostRepo (15 handlers)
drone-server_1  | [GIN-debug] GET    /api/repos/:owner/:name   --> github.com/drone/drone/server.GetRepo (18 handlers)
drone-server_1  | [GIN-debug] GET    /api/repos/:owner/:name/builds --> github.com/drone/drone/server.GetBuilds (18 handlers)
drone-server_1  | [GIN-debug] GET    /api/repos/:owner/:name/builds/:number --> github.com/drone/drone/server.GetBuild (18 handlers)
drone-server_1  | [GIN-debug] GET    /api/repos/:owner/:name/logs/:number/:job --> github.com/drone/drone/server.GetBuildLogs (18 handlers)
drone-server_1  | [GIN-debug] POST   /api/repos/:owner/:name/sign --> github.com/drone/drone/server.Sign (19 handlers)
drone-server_1  | [GIN-debug] GET    /api/repos/:owner/:name/secrets --> github.com/drone/drone/server.GetSecrets (19 handlers)
drone-server_1  | [GIN-debug] POST   /api/repos/:owner/:name/secrets --> github.com/drone/drone/server.PostSecret (19 handlers)
drone-server_1  | [GIN-debug] DELETE /api/repos/:owner/:name/secrets/:secret --> github.com/drone/drone/server.DeleteSecret (19 handlers)
drone-server_1  | [GIN-debug] PATCH  /api/repos/:owner/:name   --> github.com/drone/drone/server.PatchRepo (19 handlers)
drone-server_1  | [GIN-debug] DELETE /api/repos/:owner/:name   --> github.com/drone/drone/server.DeleteRepo (19 handlers)
drone-server_1  | [GIN-debug] POST   /api/repos/:owner/:name/chown --> github.com/drone/drone/server.ChownRepo (19 handlers)
drone-server_1  | [GIN-debug] POST   /api/repos/:owner/:name/builds/:number --> github.com/drone/drone/server.PostBuild (19 handlers)
drone-server_1  | [GIN-debug] DELETE /api/repos/:owner/:name/builds/:number/:job --> github.com/drone/drone/server.DeleteBuild (19 handlers)
drone-server_1  | [GIN-debug] GET    /api/badges/:owner/:name/status.svg --> github.com/drone/drone/server.GetBadge (15 handlers)
drone-server_1  | [GIN-debug] GET    /api/badges/:owner/:name/cc.xml --> github.com/drone/drone/server.GetCC (15 handlers)
drone-server_1  | [GIN-debug] POST   /hook                     --> github.com/drone/drone/server.PostHook (15 handlers)
drone-server_1  | [GIN-debug] POST   /api/hook                 --> github.com/drone/drone/server.PostHook (15 handlers)
drone-server_1  | [GIN-debug] GET    /ws/broker                --> github.com/drone/drone/server.Broker (15 handlers)
drone-server_1  | [GIN-debug] GET    /ws/feed                  --> github.com/drone/drone/server.EventStream (15 handlers)
drone-server_1  | [GIN-debug] GET    /ws/logs/:owner/:name/:build/:number --> github.com/drone/drone/server.LogStream (18 handlers)
drone-server_1  | [GIN-debug] GET    /authorize                --> github.com/drone/drone/server.GetLogin (15 handlers)
drone-server_1  | [GIN-debug] POST   /authorize                --> github.com/drone/drone/server.GetLogin (15 handlers)
drone-server_1  | [GIN-debug] POST   /authorize/token          --> github.com/drone/drone/server.GetLoginToken (15 handlers)
drone-server_1  | [GIN-debug] GET    /api/builds               --> github.com/drone/drone/server.GetBuildQueue (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/agents               --> github.com/drone/drone/server.GetAgents (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/         --> github.com/drone/drone/server.IndexHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/heap     --> github.com/drone/drone/server.HeapHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/goroutine --> github.com/drone/drone/server.GoroutineHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/block    --> github.com/drone/drone/server.BlockHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/threadcreate --> github.com/drone/drone/server.ThreadCreateHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/cmdline  --> github.com/drone/drone/server.CmdlineHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/profile  --> github.com/drone/drone/server.ProfileHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/symbol   --> github.com/drone/drone/server.SymbolHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] POST   /api/debug/pprof/symbol   --> github.com/drone/drone/server.SymbolHandler.func1 (16 handlers)
drone-server_1  | [GIN-debug] GET    /api/debug/pprof/trace    --> github.com/drone/drone/server.TraceHandler.func1 (16 handlers)
drone-agent_1   | 1:M 25 Jan 21:03:21.966 * connection established, ready to process builds.
drone-agent_1   | 1:M 25 Jan 21:03:51.766 - stomp: send heart-beat.
drone-agent_1   | 1:M 25 Jan 21:03:51.866 - stomp: received heart-beat
drone-agent_1   | 1:M 25 Jan 21:04:21.770 - stomp: send heart-beat.
drone-agent_1   | 1:M 25 Jan 21:04:21.870 - stomp: received heart-beat
drone-agent_1   | 1:M 25 Jan 21:04:51.765 - stomp: send heart-beat.
drone-agent_1   | 1:M 25 Jan 21:04:51.867 - stomp: received heart-beat
```

Alright. So that actually gave me something useful. From this point I opened up Kitematic, just to see the instances and have an easy to navigate to the UI.

![Kitematic Display](kitematic.png)

There were the running instances. I clicked on the link for the UI on the server and immediately it served up my request.

![Welcome Drone!](welcome_drone.png)

At this point I'm ready to get going on some builds. More on that in a coming article, for now I'm gonna go enjoy good talk on machine learning and a beer with the [#SEASCALE](https://twitter.com/search?q=%23seascale) crew. Cheers!
