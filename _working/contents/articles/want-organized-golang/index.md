---
title: I Want an Organized Go Project
author: Adron Hall
date: 2016-11-04
template: article.jade
---
After the last two cookbook style blog entries on a [basic CLI](/articles/want-a-golang-cli/) with a [simple service](/articles/want-a-golang-service/) with Go there needed to be some organization around the projects. Here's the next steps on getting those projects organized.

<span class="more"></span>

## 1. Workspace Directory

Workspaces in Go are a simple structure of directories within a root. They include the following three directories:

* src - Used to store the Go source files.
* pkg - This contains the package objects.
* bin - As in so many other projects with compilable code, this contains the binary executable commands.

The Go tool specifically uses this directory structure to place the respective files in the respective directories. One thing that isn't entirely obvious is that the `src` directory is the only directory that should be put in source control.

Let's setup one of the existing projects, I'll take the [golang-cli](https://github.com/Adron/golang-cli) that I wrote about here and set it up according to the actual workspace configuration that go tool expects.

Create a directory to use as the workspace and then create the three directories. I'm going to create this workspace directory within my own code project directory that I call `Codez`. It's a directory I put all of my code projects of varying sorts in, be it C++, Erlang, or F# they all are somewhere in this directory.

```shell-script
mkdir GOLANG_WORK
cd GOLANG_WORK
mkdir src bin pkg
```

## 2. GOPATH Environment Variable

The GOPATH environment variable specifies the location of the working area for Go coding. It's setup, and in this particular situation it would point to the `GOLANG_WORK` directory that I just created previously.

```shell-script
$ export GOPATH=$HOME/Codez/GOLANG_WORK
```

I wanted to have this upon restart, so I added an appropriate append to the $PATH variable by adding this to my `~/.bash_profile` file.

```shell-script
# GO Path Workspace
export GOPATH=~/Codez/GOLANG_WORK
export PATH=$PATH:$GOPATH/bin
```

With a simple sourcing of the file the new path variables were ready for use.

```shell-script
source ~/.bash_profile
```

Next I pulled in the previous projects. I'll use these projects to show how the various Go tools work. I simply cloned both of them into the `src` path.

```shell-script
git clone
```

## 3. Import Paths

Now, the import path is something that isn't always immediately intuitive. I had to dive in and RTFM before I realized what was going on here. It also isn't something that isn't regularly discussed as a "first step" when learning Go. It isn't, after all, part of the actual code syntax, it's part of the ecosystem around the language and tooling. Ya know, the part that often is somewhat neglected as a first step in the learning process.

The import path is basically the path where the code goes within the `src` directory as relating to where it would be publicly shared. For a standard [Github](https://github.com) account such as mine I should use github.com/Adron as the base path. To straighten out the organization here, from a Go perspective I changed the name of the folders in which I just cloned to the following.

These two folders within `$HOME/src/`:

```shell-script
golang-cli
golang-service
```

I renamed to.

```shell-script
github.com/adron/golang-cli
github.com/adron/golang-service
```

Important to note, is that I named the folders the projects are in to *github.com/adron/golang-cli* so that the contents of those directories are still under source control just as before. Also the folder is called *github.com/adron/golang-cli*, the */* are merely part of the folder name, not breaks in the folder structure hierarchy in this particular case.

## 4. Go Install (Making a Program)

Now using the two existing Go Programs that I've just cloned, I can execute either of those via the command line by using the `go install` command. Navigating in the terminal to the root of the golang-cli program I then execute this at the root of that project.

```javascript
go install
```
