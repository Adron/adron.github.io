---
title: Holy Shit Watch Out for That Enterprise Open Source!
author: Adron Hall
date: 2016-10-12
template: article.jade
---
This blog entry is going to be the conjoined events of open source work at Home Depot, enterprise open source in general, and the ideas and punch lists for a talk I have coming up in London on open source enterprise practices. So this will be a hard drifting whirlwind, buckle up!

In the last year there's been several specific projects I've led and consulted on:

* My work at Home Depot included efforts to bring various closed sourced solutions into the open, some which have been and others that have not been - but may be on their way! Read to the end to see how you might be able to help with this.
* I've provided consulting to several enterprise efforts over the last year as they've looked toward bolstering their experience and effort providing a coordinated participation within the open source community.
* Putting together a talk related specifically to helping enterprises bridge the gap between insular, closed source, limiting internal development to a inclusive, open source, community oriented contributor and user of software solutions.

<span class="more"></span>

## Enterprise software

First let's talk a little bit about enterprise software in general. There is an extremely wide range of disparity in Enterprise software. Some software turns out pretty good, others are complete catastrophes to the point the projects are cancelled and the software is deleted without remorse.

Just recently this disparity in quality was brought up on via some tweets.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I don&#39;t understand how huge companies with major $$$ can release software that&#39;s such a shit-show - don&#39;t they test it, dogfood, etc.?</p>&mdash; Dave Glick (@daveaglick) <a href="https://twitter.com/daveaglick/status/786247215660621824">October 12, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Dave Glick stated this and it spiraled into a conversation about how big companies, with seemingly endless budgets still produce such horrible applications sometimes. It reminds me of this article I read on the Pivatol Blog by Stacey Schneider ([@sparkystacey](https://twitter.com/sparkystacey) ), "Quiz Your Company: How Well Are You Setup to Develop Great Software?"

Over time this horrible disparity can be narrowed, and the band of good to bad can move toward the "good software" end of the spectrum for enterprises. One of the key steps that helps to produce a better culture around good software for enterprises is moving the effort toward a more open practice with transparent communications, public involvement, and of course actual open source code and licensing.

## Enterprise Open Source

Let's take a look at one of the best examples of an open source enterprise. Let's talk about [Netflix](https://www.netflix.com). Ok, you may be screaming in your head that Netflix doesn't count, but at 19 years old (August 29th, of 1997 it was founded), $6.78 billion in 2015 revenue, $10.2 billion in assets, 83 million worldwide users, and 3,500 employees Netflix absolutely counts as a large enterprise.

<div class="image float-right">
    [![Netflix OSS](netflix-oss-logo.png)](https://netflix.github.io/)
</div>

Netflix has gone hard core into the OSS realm. They've [written about it](http://techblog.netflix.com/2015/10/evolution-of-open-source-at-netflix.html) on their [Netflix Tech Blog](http://techblog.netflix.com/). They've even gone so far as to create a [Netflix Open Source Software Center](https://netflix.github.io/) too. Of course all of this is is rolled together in the repositories on Github under the [Netflix Organization](https://github.com/Netflix).

This has given Netflix massive credibility within the world of developers, providing a true resource and partner to the developer community. But what does that give Netflix from a more tactical point of view? I'll list a few things:

1. More eyes on their code that they use to run production. Which translates into more ideas on improvements, catching issues faster, bug fixes inside and outside of the company, and more from this angle.
2. Credibility in the industry translates to gaining the eye of the top tier people that Netflix wants and needs for their organization.
3. Massive clout as a leader in innovation and technological change, which provides even more of both 1 and 2.

# Home Depot, Open Source Enterprise

Ok, so Netflix is a big enterprise that has done it right. They've also been reaping the rewards in a huge way, and they've set a kind of guidance to others trying to tread that path. At Home Depot it's been a bit work, but the effort has started with some tangible progress. Since software development and computer tech things is not the focus point at Home Depot, it is a logical path for the company to shift with it's IT and related resources. As you probably know very well dear reader, Home Depot is a large brick and mortar storefront operation, and it's best for Home Depot to focus on this, where their customers are!

With that in mind, the idea for Home Depot to begin using more open source was super easy. But to start providing open source of their own and to get involved has been a dramatically larger challenge. The leadership has a very smart view of the matter, they want to be part of the community and provide and gain the advantages of going open source. Just like Netflix, there's a lot to be gained.

![Home Depot Contributors](homedepot-contributors.png)

## Getting Things Started

[Home Depot's OSS Manifesto](http://allspark-thd.github.io/manifesto/) reads with the intent of the efforts and a break out of six specific tenets:

### We Value

  * Giving Back
    * As developers we use tools provided by the wider community – it’s our responsibility to pay it forward
    * Beyond the ethics, as we contribute, so will others – which improves the software we use
  * Excellent Customer Server
    * By using and improving open source, the software we provide to our associates and customers is of higher quality
  * Creating shareholder value
    * Making use of open source makes us more productive and efficient
    * As we contribute software, we get the benefit of improvements from the entire community
  * Entrepreneurial Spirit
    * Encouraging associates to develop the software that interests them provides a creative outlet
    * Many key software components we rely on were created as side projects
  * Taking care of our people
    * Allows associates to contribute, gives them a public showcase for their talents
    * Participating in open source is a fantastic forum for learning from industry experts
  * Respect for all people
    * Open source is one of the most diverse communities available
    * Great feedback and communication skills can be developed working on large open source efforts
  * Doing the right thing
    * Making code public is the best way to ensure that you take pride in your work
  * Building strong relationships
    * Open source allows developers to build relationships beyond their team

### We Believe

  * Have a readme file
  * Have a contributing file
  * Have a license file
  * Follow semantic versioning
  * Have easily visible CI
  * Tag all releases

### Have an Idea?

  * Could my code be helpful for other devs, and is it something that doesn’t already exist?
  * Do I feel comfortable that work I’m doing does not include trade secrets?
  * Do I have CI setup, and is it publically visible?
  * Why are you still asking questions, push some code!

### Readme file

  * The readme is the first thing will people will see about your project. This should provide an explanation for why it exists, and why anyone would care about it.

    > * What are my rights?
    > You also should include license information, so they understand how to use it. Our default license is Apache 2
    > How can I help?
    > If you’re open sourcing something, you are hopefully open to outside contributions. Make sure your expectations and process are clearly laid out for people who want to help. You should tell them how to make the thing run and how to test it – in simple, easy to follow steps.
    > * Does this thing even work?
    > A sign of a high quality project is well written tests, that are continuously run. By having CI setup and publicly shown, visitors to your repo can have confidence in the code. This could include badges or a link to an example of the live application
    > * Is anyone maintaining this and/or what just changed?
    > As you update the project, you should provide semantic versioning to allow consumers to understand the types of changes made, and allow them to use the project with security. You should include release notes that detail any important features or bug fixes, and specifics on any breaking changes.

### Trade Secrets - What shouldn’t be open sourced?

  * Code that includes work that is licensed by someone else
  * Work that provides a significant competetive advantage over other retailers
  * Projects that are dependent on THD specific environment
    * This should be only true in rare cases
  * Code that does not have CI or automated unit tests
    * Please don’t do this, even if you aren’t open sourcing
  * Code that is essentially the same as other open source projects
    * Could you contribute to those projects instead?

### Tactical Process

  * Ensure your manage/team lead approves the effort
  * Request open source submission approval
  * Push the code

This is of course our version of the OSS Manifesto as detailed at http://ossmanifesto.org/ (after I posted, realized this site is dead!  :( But here's the [repo of the HD Manifesto](https://github.com/allspark-thd/manifesto)). This is one piece I highly suggest any group of individuals at an enterprise to give a read to, and create their own manifesto per their enterprise they work for. It's good for many reasons to write this out and provide it.

The main two reasons I really like the OSS Manifesto include:

1. The transparency it provides to users of the project(s) of a particular enterprise.
2. The other thing is that it provides a much needed brain storming session to identify and define the groups intent and efforts on a more metaphsycial level, which is hugely needed to understand how a team working on a project and it's prospective contributors would interact with each other. Defining these core tenants is fundamental to a smooth workflow between contributors.

That's it for this part of the series. In the next part I'll dive into some of the tactical problems we ran into. Where to put code, how to identify what, where, and how people could or should contribute, and related practices. ***[Will update this to link to subsequent part when it is published.]***

**References:**

* [Netflix](https://www.netflix.com) and [Netflix Wikipedia](https://en.wikipedia.org/wiki/Netflix).
* [Home Depot](https://www.homedepot.com) and [Home Depot Github Org](https://github.com/homedepot).
