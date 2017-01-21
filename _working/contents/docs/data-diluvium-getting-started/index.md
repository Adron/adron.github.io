---
title: The Data Diluvium
author: Adron Hall
date: 2016-1-17:09:16:17
template: doc.jade
---
Welcome to the first of more than a few blog entries on Data Diluvium. Data Diluvium is a project I've started focused around generating data for the purposes of testing, capacity, or whatever other needs might arise.

Definition of ***data***

1. :  factual information (as measurements or statistics) used as a basis for reasoning, discussion, or calculation <the data is plentiful and easily available — H. A. Gleason, Jr.> <comprehensive data on economic growth have been published — N. H. Jacoby>
2. :  information output by a sensing device or organ that includes both useful and irrelevant or redundant information and must be processed to be meaningful
3. :  information in numerical form that can be digitally transmitted or processed

Definition of ***deluge*** which is the English version of the latin ***diluvium***.

1. a :  an overflowing of the land by water. b :  a drenching rain "a deluge causing mudslides in the area".
2. :  an overwhelming amount or number <received a deluge of angry phone calls>

<span class="more"></span>

The idea is to build a data generation service. Something that will generate random data in usable chunks; name generation, addresses, and related data. To get a wide range of use out of this capability I needed to build a web service application and a respective CLI (Command Line Interface) to go along with the web application.

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

* I created a folder titled *[.github](https://github.com/Adron/datadiluvium/tree/master/.github)* and placed the following files: *[CONTRIBUTING.md](https://github.com/Adron/datadiluvium/blob/master/.github/CONTRIBUTING.md)*, *[ISSUE_TEMPLATE.md](https://github.com/Adron/datadiluvium/blob/master/.github/ISSUE_TEMPLATE.md)*, and *[PULL_REQUEST.md](https://github.com/Adron/datadiluvium/blob/master/.github/PULL_REQUEST_TEMPLATE.md)*.

* Next the standard [.gitignore](https://github.com/Adron/datadiluvium/blob/master/.gitignore) file with the following contents. This is the basic file Github starts a Go project with if selected during the creation of the repository. It has the minor addition of *.DS_Store* to keep that OS-X file out of the repository and the *.idea* director to keep out the IntelliJ, WebStorm, or Goland IDE (or any Jetbrains IDE) settings directory.

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

* I added the *[LICENSE](https://github.com/Adron/datadiluvium/blob/master/LICENSE)* file with the standard Apache 2.0 license legalese.

* Finally the *[README.md](https://github.com/Adron/datadiluvium/blob/master/README.md)*.

### Build Files

It is important at this stage to create a build and get that build passing with some basic element of code. At this point I need some basic executing code and the respective build configuration files. For this I'll create three files and name them respectively: *[main.go](https://github.com/Adron/datadiluvium/blob/master/main.go)*, *[codeship-steps.yml](https://github.com/Adron/datadiluvium/blob/master/codeship-steps.yml)*, and *[codeship-services.yml](https://github.com/Adron/datadiluvium/blob/master/codeship-services.yml)*.

In the main.go file I wrote some basic Go code just to have something to build. I wanted a little bit more than just a *Hello World!* code sample so I added a little bit more. I did some research and found the [Fake](https://github.com/icrowley/fake) library written by Dmitry Afanasyev from Ulyanovsk, Russia. I used `Go get` to pull that into the project and then added an `import` after `package main` with the various bits of code I'd want for my getting started code.

```javascript
package main

import (
    "encoding/json"
    "fmt"
    "io/ioutil"
    "os"
    "github.com/icrowley/fake"
    "time"
)
```

The other libraries I knew I would need for various other output, date stamps, and other library features I'd want. Then I went to coding, my first sample of working code to prove out key functionality of the libraries looked like this.

```javascript
type Page struct {
    Title string `json:"title"`
    Schema   string `json:"schema"`
}

func (p Page) toString() string {
    return toJson(p)
}

func toJson(p interface{}) string {
    bytes, err := json.Marshal(p)
    if err != nil {
        fmt.Println(err.Error())
        os.Exit(1)
    }
    return string(bytes)
}

func main() {
    pages := getPages()
    for _, p := range pages {
        fmt.Println(p.toString())
    }

    fmt.Println(toJson(pages))

    fmt.Println("\nSome Russian Random Data")
    fake.SetLang("ru")
    fmt.Println(fake.FirstName())
    fmt.Println(fake.FullName())

    fmt.Println("\n\n\nSome English Random Data")
    fake.SetLang("en")
    fmt.Println(fake.FirstName())
    fmt.Println(fake.FullName())

    thisMany := 10
    counter := 1
    t := time.Now().Format(time.RFC850)

    fmt.Println("\n\n\nPrinting", thisMany)

  	for i := 0; i < thisMany; i++ {
      fmt.Println(counter, fake.FirstName())
      counter += 1
      fake.FirstName()
  	}

    fmt.Println("Start Time: ", t)
    t = time.Now().Format(time.RFC850)
    fmt.Println("End Time: ", t)
}

func getPages() []Page {
    raw, err := ioutil.ReadFile("./deluge.json")
    if err != nil {
        fmt.Println(err.Error())
        os.Exit(1)
    }

    var c []Page
    json.Unmarshal(raw, &c)
    return c
}
```

Now, this all was a small mess at this point. I know I needed to get it cleaned up. However the *priority* at this point is to get a build working that will provide a trusted basis to continue work from. Since I intend to use this to teach, for everyday testing, and hopefully to gain contributors (want to help?) it needs to have a good build, end of story.

## Continuous Integration Build

At this point I have the main.go file executing with some Go code that pulls together some functionality on random data generation, file I/O (at least reading) with a JSON file for config, and displaying this out the console. So far, so good.

I've decided to use [Codeship](https://codeship.com) for this particular project. They're a service provider the specializes in continuous integration and delivery services, and I might add that they're good at it (* Also note declarations, etc at the bottom of this blog entry).

Two significant reasons I like to use Codeship are: remote builds & deploys with Docker and local builds with Docker. Having that combination is very effective, providing the capability to effectively to builds that include systemic deployments to my own local machine in addition to combining efforts with a prospective team together via the remote build.

To setup the repository on Codeship for *Docker* support I went through these steps.

First select create new project. This is up on the Select Project bar or if you've just signed up it is available as the default screen when navigating to builds. Codeship just added [Gitlab](https://about.gitlab.com/) as a repository option recently, which I opted for the Data Diluvium Client, [Colligere](https://gitlab.com/adron/colligere), using Gitlab just to test it out. At this time I really like my experience with Gitlab, but that's for another blog entry, for now, onward!

![Codeship Docker Setup](codeship01.png)

Next enter the path for the git repo.

![Codeship Docker Setup](codeship02.png)

Select pro infrastructure. This will provide Docker capabilities.

![Codeship Docker Setup](codeship03.png)

Then it is time to setup the Docker configuration and yaml files for the build. The page at this point on Codeship has some links and such, for the two yaml files needed, but I'll describe them here in detail a bit. In the image below a quick review of each element of the page: (1), the project settings, which will navigate to an area to setup notification, configure and add team members, repository details or reconnecting to a different repository, and general settings, which can be navigated to via (2), and (3) lists the current project the settings are displaying and available for changing.

![Codeship Docker Setup](codeship.png)

#### Declarations & References

* Codeship - I've worked for Codeship providing technical writing and good coding fun with the crew there. They're not currently paying me, but I will likely do more work for them, so take that into account when judging my judgement of their products. As always, I'm not into any shill work and wanted you dear reader, to have full clarity into my use of the tech. Cheerio!
* Collected Links - [Codeship](https://codeship.com/), [Data Diluvium](http://datadiluvium.com/), [Data Diluvium Github Project](https://github.com/Adron/datadiluvium), [Colligere](https://gitlab.com/adron/colligere).
