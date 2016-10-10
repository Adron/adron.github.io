---
title: The Curse of Windows Server & Windows Server 2016 Salvation
author: Adron Hall
date: 2016-10-07 14:38
template: article.jade
---
Over the last year I've worked with [Home Depot](https://homedepot.com), specifically the [Quote Center](http://www.quotecenter.com/) Group, strive forward toward a better future. Yeah, that sounds a bit campy, but seriously. The aim start out with [three core objectives I wrote about previously](http://blog.adron.me/articles/after-816-days-taking-a-job/).

* Community Contributions
* Site Reliability
* Talent Recon

I've been able to help with each of those things over the last year, with more progress being made on some than others. Right now, I want to tell you a bit about the adventure of [Site Reliability](https://landing.google.com/sre/interview/ben-treynor.html) at Quote Center. First off, before hiring me the Quote Center didn't really have any particular role of this sort. I had a lot to do just to set some groundwork on what that position really meant. In addition to the other two *roles*, err, *priorities*, it was like taking a job that would have three roles rolled into one. For this article though, I'm going to write about specifically the site reliability and what I did to get some practice and culture around the notion of site reliability at Quote Center.

The first thing, was simply to write out some ideas about what this would involve. Here are a few of my original scribbling on the matter.

<span class="more"></span>

* Servers/Instances - Need to figure out where and what servers are magical black magic servers versus ones that are able to be recreated in an automated way.
* Networking - What's where and who's doing this?
* Monitoring - What do we know exists, where, and how are we alerted when something goes down? How many things are there? How many could go down?

I was working entirely from a blank slate. One thing I did do was read up on what the notion of Site Reliability Engineer was. I wanted to have a good industry definition of the role. That led to a quick set of resources via Google. Google seems to be the creator of said position, whether they are or not doesn't matter, because the material they have on the role is excellent. To paraphrase a summary, what an SRE is,

> An SRE is basically a software engineer that is responsible for designing operations functions. This includes interacting with production environments, automation, high availability improvements, monitoring, and more. All approached from a programmatic perspective versus the more traditional notion of hands on systems administration or network administration. Other terms most commonly associated with and responsibilities of SREs include; availability, latency, performance, efficiency, change management, monitoring, emergency response, and capacity planning.

As I dove into this work, amid all the others, I was spending about ~15-20 hours a week on the efforts under this priority (or role). This was ok to get things off the ground. Here are a few other key things I put together within the first 6 months.

1. We needed action ASAP to modernize and build on modern cloud infrastructure. I went through working with various partners in the organization to insure that our decisions would work with, or align with, or utilize software, services, and solutions that would jive with corporate. Even though I'd started down the route with Amazon Web Services (AWS), Home Depot made a [higher level decision to move forward with Google Cloud Platform](http://www.reuters.com/article/us-google-home-depot-cloud-idUSKCN0WO380). This was an easy switch to make, because I'd also started a trial with various [HashiCorp](https://www.hashicorp.com/) tools (Atlas, Terraform, and Packer specifically) that made it a breeze to swap out anything already done.
2. The next thing was to get some practices put into place to handle change management of infrastructure. I started working on this in the subsequent 3 months but made very little movement forward. This was because my other priorities took precedence during this time - the Talent Recon & Community Contributions priorities. During this time I worked with Troy Howard ([@thoward37](https://twitter.com/thoward37/)) to put on two conferences we'd co-founded: [.NET Fringe 2016](http://dotnetfringe.org/) and [Node PDX 2016](http://nodepdx.org/). However, even in spite of all those work, I was able to implement another major HashiCorp Server with Atlas. This helped to start shaping our workflow in a tremendous way.

This was great, and in that first 6 months I was able to get a lot of traction on those efforts. Then it started...

## The Windows Server Nightmares

More than a few things we wanted to get deployed using container technology. But because of the limitations of Windows Server around its complete lack of container technology and the limited support of drivers within .NET, our container hopes were dashed for the time being. Even with this in our way of moving forward with containers, we knew it would eventually be the future. So what did we do in the meantime to move forward and build out our microservices now?

The team delved into deployment per Windows Server using a Windows Services Service based approach. In other words, the services you see when you pull up the MMC on Windows Server? Yeah, that's what we used in the meantime to deal wtih the lack of container support. This gave our microservices the ability to get deployed with many of the feature notions we wanted and will eventually use with container tech.

## Yay Windows Server 2016 to the Rescue!

Then, enter Windows Server 2016. The news that Windows Server 2016 would have container support was huge. We would absolutely move onto that to gain the advantage of containers if, and only if .NET Core didn't gain enough driver and related capabilities that we didn't get to move to Linux first. You see, if we had our druthers, we'd just move to Linux and forgo Windows Server altogether. But Windows Server 2016 at least provided us a path forward if .NET Core drivers and such weren't ported before it's release.

On the flip of all this, you might ask, "why would you deploy .NET stuff to *Linux* instead of *Windows Server*?" There are a host of reasons, and the first that always pops into my mind wasn't one of our concerns. That would be pricing, which wasn't particularly an issue, but holy bajeezuz the licensing costs add a lot of running Windows Server instances. I makes many multi-VM solutions cost prohibitive to many. But if you are in the search for server tech for microservice hosting, I have to stay honest and tell you, Windows Server is ***NOT*** the way to move forward unless you have tons of Windows proprietary code base or IIS demands of some other proprietary demand for Windows Server. There is an extreme minimum of reasons to use Windows Server if you're trying to deploy and efficiently manage microservices and the related infrastructure, practices, and advantages. The ecosystem, market, and industry as a whole has generally moved onto or has just been using *JVM + Cloud Provider + Automation Toolchain*. This usually equates to *JVM + AWS + HashiCorp Tools* or *JVM + GCP + Chef* or *JVM + Azure + Puppet*. Most of the future looks something like that. These tools are all dramatically better places to start than using a Windows OS based environment. But alas, back to the pending salvation of Windows Server 2016.

If you are a Windows advocate and you do have legitimate needs to use Windows Server, but still want all the good bits that come along with container technology, Windows Server 2016 is going to be your salvation! Maybe. Soon it'll even be available in Google Cloud (I hope REAL soon) and I can spool up a few examples of said OS with said .NET Core bits and then migrate said .NET Core bits directly to Linux! At least, I'm looking forward to doing just that.

Next up, open source efforts of the last year.