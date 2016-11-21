---
title: Notes on Go / Future Writings
author: Adron Hall
date: 2016-11-20
template: article.jade
---
<div class="image float-right">
    ![Go Language Mascot](golang-mascot.png)
</div>

**Notes & Thoughts on Go:**

So far I like Go. Primarily because it is just simple. Simply RTFMing it gets one pretty far without any fuss. The hardest part of the language to grasp seems to be the same things I often have issue with, which is the ecosystem has it's own conventions are related things one just simply doesn't *know*. It involves going through the docs and just remembering where the GOPATH is, where the build files go, what the go commands do with the toolset, and related things.

One thing that required a bit of fiddling around with to get figured out was writing tests for Go. The convention to mark tests and have them executed is actually super easy once you know the specifics of the toolchain.

<span class="more"></span>

The first thing one does is create a file or add tests to the file that has the code you want to test. For example, here's a simple sample I created in an existing project I'm working on.

I created a file called `main_test.go`. The convention follows that any file with *test* at the end of the filename and before the extension will be processed as a file that includes tests. This by its very nature makes it necessary to place tests in the code with the functions that are being tested specifically. This could cause issue for some that are used to writing tests another way, but it also makes a lot of sense. But I'm not debating that in this write up, so onward.

I created the file `main_test.go` in the root of the project directory. Once I created the file I added the following code. The package is part of the *main* package, and I'd need the *test* library imported.

```javascript
package main

import "testing"
```

Next I added a struct to use for test data. Below that I created variable with the test data that I would use to test my average function. Then below that I wrote a test that would assert that the function averages numbers appropriately. In the *Error* I've followed the *for*, *expected*, *got* testing flow to asset the expectation of the result of the function.

```javascript
type testpair struct {
  values []float64
  result float64
}

var testAverages = []testpair{
  { []float64{1,2}, 1.5 },
  { []float64{1,1,1,1}, 1 },
  { []float64{-2,2}, 0 },
}

func TestAverage(t *testing.T) {
  for _, pair := range testAverages {
    v := Average(pair.values)
    if v != pair.result {
      t.Error(
        "For", pair.values,
        "expected", pair.result,
        "got", v,
      )
    }
  }
}
```

At this point, following this TDD style approach, the build fails without the `Average` func implemented. I continued forward and implement the function as shown below.

```javascript
func Average(xs []float64) float64 {
  total := float64(0)
  for _, x := range xs {
    total += x
  }
  return total / float64(len(xs))
}
```

I execute the test with the Go toolchain command. When executing this command it needs to be called from the root of the Go project code.

```shell-script
go test
```

With that I get a nice clean execution and shown that the test passes. More on this later. For now on to other news about myself and Go.

## Go Projects!

Over the last few weeks I've been speaking with the crew at Codeship. If you're not familiar with this company and its products you should check them out ASAP. They're easily producing some of the best material on continuous integration, delivery, and related conversations and implementations of immutable infrastructure, immutable deployments, and related container based development practices and patterns. I'm super stoked to announce that I've started working with them on some material that you'll see in the coming days related to just that.

Some of my first contributions to their blog will be step by step details on setting up Go projects within Codeship, stepping all the way through to continuous delivery, local development with Codeship Pro capabilities and container technology, and onward to more complex deployments including things like Terraform, Packer, Kubernetes, and other toolchains. Keep an eye out here and on their blog ([https://blog.codeship.com](https://blog.codeship.com)) and I'll be sure to let you know when the posts are going live ASAP.

Also, for a less regular bombardment of posts than my [@Adron](https://twitter.com/Adron) or [@ThrashingCode](https://twitter.com/ThrashingCode) Twitter accounts, you can also sign up for my very low volume email newsletter [Thrashing Code News](/docs/thrashing-code-news/) to get rolled up release notes and links.

Cheers!
