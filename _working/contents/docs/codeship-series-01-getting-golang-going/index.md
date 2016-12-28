---
title: codeship series 01 getting golang going
author: Adron Hall
date: 2016-12-19:09:14:25
template: doc.jade
---
I sat down recently to put a project together. The idea is to build a data generation service. Something that will generate random data in usable chunks; name generation, addresses, and related data. To get a wide range of use out of this capability I needed to build a web service application and a respective CLI (Command Line Interface) to go along with the web application.

## A Microservice is Born!

The web service is going to generate pseudo-random data around name, addresses, phone numbers, and location. Over the course of this series I'll add more data generation types and implement a schema for the actual data generation. This web service will be created based on microservice architectural and design ideas. However in the early stages of this effort I'll keep it simple and will stick to implementing a minimally viable product (MVP). From here on out I'll refer to this project as the *deluge* project.

## Microservice Client CLI

For the client side, I want to provide a CLI in which to interface with the microservice itself. With this CLI I want to be able to provide basic configuration or passed parameters that will allow me to take the generated data and pass it directly into terminal output, out to a file, or prospectively as things develop directly into databases of various kinds themselves.

## The Tooling & Language

Overall this could be built in a number of technology stacks. I could use Node.js, .NET, Java, Erlang, or Go to build both the CLI and the microservice. With the multitude of choices it can be somewhat difficult picking the right stack to get things done as quickly, efficiently, well organized, and cleanly as possible. For this particular effort I'm going to go with Go to implement the microservice and the CLI.

Why Go you might ask? For the CLI, I'd want a cleanly built, fast, and responsive CLI that I can setup on any machine with minimal fuss. For Node.js for instance, one doesn't get a built executable, but instead a kind of morass of tooling, and preinstallation software required. For Java and .NET one ends up with a great array of tooling to build a microservice and CLI, but the knowledge and time just to setup the initial development environments leads me away from those. With Erlang, maybe a day in the future, since it is indeed hugely and almost mystically powerful (yes, I just wrote mystically, it sounds appropriate).

## Kick Off

First things first, I need the projects themselves. Here are the steps I took to get some basic parts building together for the two projects. The first step was simply to create two directories for each of these projects, one I named *deluge* and one *deluge-cli*. Inside both of those directories I put together a basic structure for each of these folders.

### Basic Project Files

The frame of each included the following:

* I created a folder titled *.github* and placed the following files: *CONTRIBUTING.md*, *ISSUE_TEMPLATE.md*, and *PULL_REQUEST.md*.

* Next the standard .gitignore file with the following contents. This is the basic file Github starts a Go project with if selected during the creation of the repository. It has the minor addition of *.DS_Store* to keep that OS-X file out of the repository and the *.idea* director to keep out the IntelliJ or WebStorm IDE settings directory.

```
# Compiled Object files, Static and Dynamic libs (Shared Objects)
*.o
*.a
*.so

# Folders
_obj
_test

# Architecture specific extensions/prefixes
*.[568vq]
[568vq].out

*.cgo1.go
*.cgo2.c
_cgo_defun.c
_cgo_gotypes.go
_cgo_export.*

_testmain.go

*.exe
*.test
*.prof

.DS_Store
.idea
```

* I added the *LICENSE* file with the standard Apache 2.0 license legalese.

* Finally the *README.md*.

### Build Files

It is important at this stage to create a build and get that build passing with some basic element of code. At this point I need some basic executing code and the respective build configuration files. For this I'll create three files and name them respectively: *main.go*, *codeship-steps.yml*, and *codeship-services.yml*.
