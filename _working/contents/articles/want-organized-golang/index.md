---
title: I Want an Organized Go Project
author: Adron Hall
date: 2016-11-04
template: article.jade
---
[![Hacking @ Peloton](peloton.jpg)](http://www.pelotonseattle.com/)

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

I moved to.

```shell-script
github.com/adron/golang-cli
github.com/adron/golang-service
```

Important to note, is that I moved these folders into a multi-level deep directory structure. I created a github.com directory instide the src directory and inside that I created the adron directory and then moved the golang-cli and golang-service projects respectively. I note this because if one navigates into `src` with finder, some other manager, or uses the command to move and attempts to *move* the directory like this:

```shell-script
mv src golang-cli github.com/adron/golang-cli
```

Many of the managers or otherwise will attempt to, and by default will create a folder called *github.com/adron/golang-cli* NOT a folder called *golang-cli* inside of a folder called *adron* inside of a folder called *github.com*. This is a pretty basic thing, but often can lead even the most experienced to mistakenly moving files around incorrectly.

## 4. Go Install (Making a Program)

Now using the two existing Go Programs that I've just cloned, I can execute either of those via the command line by using the `go install` command. Navigating in the terminal to the root of the golang-cli program I then execute this at the root of that project.

```shell-script
go install
```

The other option, which can be typed in a terminal regardless of location.

```shell-script
go install github.com/adron/golang-cli
```

Now, for this particular application, with it installed I can now use the command `golang-cli`.

```shell-script
$ golang-cli
Hello, Person With No Name, please enter some text: Heather
Heather

word:  the-word
numb:  42012
fork:  true
```

Here I've entered the command and followed the prompt. Again, for reference check out the [quick CLI I put together previously](http://blog.adron.me/articles/want-a-golang-cli/).

For the the golang-service project it's a little trickier because of how I setup the code. I had written the code to show a quick example of creating a service and then running that service via the command `go run service.go` or `go run service-twosi.go`. If I were to try to install the project via the `go install` command I'd get the following results.

```shell-script
go install github.com/adron/golang-service
# github.com/adron/golang-service
Codez/GOLANG_WORK/src/github.com/adron/golang-service/service.go:9: handler redeclared in this block
	previous declaration at Codez/GOLANG_WORK/src/github.com/adron/golang-service/service-twosi.go:10
Codez/GOLANG_WORK/src/github.com/adron/golang-service/service.go:13: main redeclared in this block
	previous declaration at Codez/GOLANG_WORK/src/github.com/adron/golang-service/service-twosi.go:30
```

The package `main` and the *handler* is declared twice. This causes a problem since the compiler doesn't have a way to inform which one to build. For this example, what I would need to do is remove one of the handlers and one of the packages and just keep a singular one. With that I did a quick replace of the *service.go* file and replaced it with the contents of the *service-twosi.go*  example code. At this point my *service.go* code file looks like this.

```javascript
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

   m := Message{"Welcome to the Twosi API, build v0.0.001."}
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

Now I can run `go install` and run the service via the command line, from anywhere on machine. Just to test it out I issue the `golang-service` command and navigate in the browser to the http://localhost:8080/about/ path. Sure enough, the JSON appears.

```javascript
{
"Text": "Welcome to the Twosi API, build v0.0.001."
}
```

## 5. Project Collateral

It's all nice and groovy that I have a Go project and some code, but if I really want to make something out of it I should be a good open source citizen. This is where a few other pieces of the repository come together for the project. Now, one might say, "but that's not part of the Go ecosystem/tooling/whatyamakallit" but that's not being very respectable about your intent. I'll admit, I make a mess of a repo now and again too, but these are some good things to include so your repository isn't a confusing mess of code trash waiting to be set on fire.

* .github Directory and *gasp* some basic instructions and documentation. Inside the .github directory there are three key files that ought to be included with some notion of useful information. For these two projects I've added some basic contribution information [here](/articles/want-a-golang-cli/) and [here](/articles/want-a-golang-service/).
* README.md with some simple instructions on getting started, installing, etc. This file also should always describe what a project is and what it is for. Another way to put it, the README.md should have some sort of mission description.
* Badges & Status should be shown in the README.md or in some way somewhere on or in the project. A popular way is using badges to show the status of the build, license, dependencies status, and related information about the project. I don't have those displayed as of this blog entry, but will dive into that and continuous integration and delivery of Go in subsequent blog entries.

That's it for this write up. More to come and more news about these projects, paths to production, and related patterns and deployment techniques in the coming weeks. Stay tuned and if you'd like blog entry summaries and other updates delivered to your mailbox, check out [Thrashing Code News](/docs/thrashing-code-news/).

Cheers!

**References:**

* Peloton Seattle - This is the image at the top of this blog entry, and where I wrote 90% and put together 90% of the code. Per their website, "Peloton is a different approach to the traditional bike shop.  In addition to being a full service repair shop, our cafe offers meals made from ingredients sourced from local farms, coffee made from locally roasted beans, and beer brewed in Washington.  Peloton is your destination whether you’re craving a morning coffee and snack, you need bicycle maintenance and advice, or you want to grab a beer with your riding buddies.  Peloton provides delicious healthy food, professional bicycle service, and a variety of beverages for any time of the day.  We’d love to share our passions with you."
* The [Go CLI Sample App](https://github.com/Adron/golang-cli) and [Go Service Sample](https://github.com/Adron/golang-service) Repositories.