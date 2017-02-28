---
title: want a what golang
author: Adron Hall
date: 2017-02-26 12:57:24
template: article.jade
---
Recently I was dorking about with some Go code on OS-X. Just working with it via iTerm 2 and using some basic `go run whateverthefile.go` commands and displaying results out the the terminal. All was well, and then I dived into some code that used so Go Routines. The code looked something like this.

```go
package main

import (
	"time"
	"fmt"
)

func say(s string) {
	for i := 0; i<5; i++ {
		time.Sleep(2 * time.Second)
		fmt.Println(s)
	}
}

func main() {
	go say("1. First thread is running.")
	go say("  2. Second thread is running.")
	say("    3. Thread is running in main.")
	fmt.Println("Ended.")
}
```

<span class="more"></span>

That was fine. I ran the code and the results were as expected.

```shell-script
OSX$   2. Second thread is running.
    3. Thread is running in main.
1. First thread is running.
1. First thread is running.
  2. Second thread is running.
    3. Thread is running in main.
    3. Thread is running in main.
1. First thread is running.
  2. Second thread is running.
  2. Second thread is running.
    3. Thread is running in main.
1. First thread is running.
1. First thread is running.
  2. Second thread is running.
    3. Thread is running in main.
Ended.
```

Then I ran it again. Also these results were expected.

```shell-script
OSX$     3. Thread is running in main.
  2. Second thread is running.
1. First thread is running.
    3. Thread is running in main.
1. First thread is running.
  2. Second thread is running.
  2. Second thread is running.
    3. Thread is running in main.
1. First thread is running.
1. First thread is running.
    3. Thread is running in main.
  2. Second thread is running.
    3. Thread is running in main.
Ended.
1. First thread is running.
```

You'll notice the slightly out of order response as each thread completes. With the first set of results the last response is "Ended." and with the second set of results "Ended." is second to last. This of course is expected as the threads are likely to be executing while the last line of code is executed. But, there's a catch to this depending where you run this code.

On the MacOS/OS-X platforms, when you run the terminal it runs certain things with an assumed "&" after the command. Now, I'm not sure the specifics of what is going (I'm looking it up and will happily post a super detailed reference link if you've got one, lemme know [@Adron](https://twitter.com/adron).) The "&" is however used on Linux/Unix systems to designate to the terminal, *run this command on the background so that the user remains in control of the terminal*. Specifically, from the *man* pages.
 
 > If a command is terminated by the control operator &, the shell executes the command in the background in a subshell. The shell does not wait for the command to finish, and the return status is 0.

The reason I bring this up, is if I run the same thing and those same results come back on Linux or Unix, you wouldn't see anything after the "Ended." runs, because the application terminates at that point and none of the background threads are actively connected to the terminal. In other words the result where "Ended." occurs second to last would look like this.

```shell-script
LINUX-SHELL$     3. Thread is running in main.
  2. Second thread is running.
1. First thread is running.
    3. Thread is running in main.
1. First thread is running.
  2. Second thread is running.
  2. Second thread is running.
    3. Thread is running in main.
1. First thread is running.
1. First thread is running.
    3. Thread is running in main.
  2. Second thread is running.
    3. Thread is running in main.
Ended.
```

At first glance, it might seem like the application has run successfully, but look closely and count the number of responses from each thread. In this example, the terminal has lost priority when the "Ended." message appears and there is only four messages that read "1. First thread is running.". However, after the "Ended." message there should have been another one, like the second example above that I ran on OS-X. On Linux, the solution to executing this example is actually to add the ampersand at the end of the command.

`go run whateverthefile.go &` and then you'll see the execution of the program with the correct results.

Well that's it for this often overlooked and confusing behavior on Linux versus OS-X. Happy hacking, cheers!
