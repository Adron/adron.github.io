---
title: All That Tech SitRep - Elastic Meetup and Quote Center Updates
author: Adron Hall
date: 2016-01-26
template: article.jade
---
<div class="image float-right">
    ![Quote Center](qc_377x285.png)
</div>

I started working with the Quote Center (QC) back in November, and wrote about it in "[After 816 Days I’m Taking a Job!](http://compositecode.com/2015/10/31/after-816-days/)" Now that I'm a few months into the effort, it's ***sitrep*** time. Sitrep, btw is military speak for

*S* ituational *R* eport.

The three core priorities I have at Quote Center in my role are: Community Contributions, Site Reliability, and Talent Recon.

## Community Contributions (and Organizing)

Some of the progress I've made, is direct and immediate involvement with some really interesting groups here in Portland. The first seemed a prime option, and that's the [Elastic User Group](http://www.meetup.com/The-Portland-ElasticSearch-Meetup-Group/).

<span class="more"></span>

Myself and some of the QC Team traveled late last year to check out the [Elasticon Tour stop in Seattle](http://compositecode.com/2015/12/03/elasticon-tour-2015-in-seattle/). It was an educational experience where I got some of my first introductions to [Elasticsearch](https://www.elastic.co/products/elasticsearch) and also a new product [Elastic](https://www.elastic.co/) had just released recently called [Beats](https://www.elastic.co/products/beats). I was fairly impressed by what I saw and several other things aligned perfectly for follow up community involvement after that.

I've since kept in touch with the Elastic Team and started coordinating the [Elastic User Group in Portland](http://www.meetup.com/The-Portland-ElasticSearch-Meetup-Group/) (Join the group on [Meetup](http://www.meetup.com/The-Portland-ElasticSearch-Meetup-Group/) for future meetings &amp; content). In March the group will be hosting a great meetup from Ward &amp; Jason...

http://www.meetup.com/The-Portland-ElasticSearch-Meetup-Group/events/228064228/

So be sure to <a href="http://www.meetup.com/The-Portland-ElasticSearch-Meetup-Group/events/228064228/" target="_blank">RSVP</a> for that <a href="http://www.meetup.com/The-Portland-ElasticSearch-Meetup-Group/events/228064228/" target="_blank">meetup</a> as it's looking to be a really interesting presentation.

The second group I've stepped up to help out with is the <a href="http://www.meetup.com/Docker-Portland-OR/" target="_blank">Docker Meetup</a> here in Portland. The first meetup we have planned at this time is from Casey West.

http://www.meetup.com/Docker-Portland-OR/events/228249211/

## Site Reliability

One of the other priorities I've been focusing on is standard site reliability. Everything from automation to continuous integration and deployment. I've been making progress, albeit at this stage going from zero to something, in the space of a site reliability practice takes time. I've achieved a few good milestones however, which will help build upon the next steps of the progress.

We've started to slowly streamline and change our practice around Rackspace and AWS Usage. This is a very good thing as we move toward a faster paced continuous integration process around our various projects. At this time it's a wide mixture of .NET Solutions that we're moving toward .NET Core. At the same time there are some Node.js and other project stacks that we're adding to our build server process.

*Team City*

Our build server at this time is shaping up to be Team City. We have some build processes that are running in Jenkins, but those are being moved off and onto a TeamCity Server for a number of reasons. I'm going to outline these reasons and I'm happy to hear any reasons there may be other better options. So feel free to throw a tweet at me or leave a comment or three.

<ol>
	<li>Jetbrains has a pretty solid and reliable product in Team City. It tends to be cohesive in building the core types of applications that we would prospectively have: Java, .NET, Node.js, C/C++ and a few others. That makes it easy to get all projects onto one build server type.</li>
	<li>TeamCity has intelligence about what is and isn't available for Java &amp; .NET, enabling various package management and other capabilities without extensive scripting or extra coding needed. There are numerous plugins to help with these capabilities also.</li>
	<li>TeamCity has fairly solid, quick, and informative support.</li>
</ol>

Those are my top reasons at this point. Another reason, which isn't really something I felt should be enumerated, because it's a feeling versus something I've confirmed. That is, the Jenkins Community honestly feels a bit haphazard and disconnected. Maybe I'm just not asking or haven't seen the right forums to read or something, but I've found it a frustrating experience to deal with the Jenkins Server and find information and help regarding getting a disparate and wide ranging set of tech stacks building on it. TeamCity has always just been easy, and getting some continuous integration going the easiest way possible is very appealing.

*Monitoring*

We use a number of resources for monitoring of our systems. New Relic is one of them, and they're great, however it's a bit tough when things are locked down inside of a closed (physically closed) network. How does one monitor those systems and the respective network? Well, you get <a href="http://compositecode.com/2015/11/25/nagios-and-ubuntu-64-bit-14-04-lts-setup-configuration/">Nagios or something of the sort installed and running</a>.

I installed it, but Nagios left me with another one of those dirty feelings like I just spilled a bunch of sour milk everywhere. I went about cleaning up the Nagios mess I'd made and, upon attending the aforementioned Elasticon Tour Stop in Seattle, decided to give Beats a try. After a solid couple weeks of testing and confirming the various things work well and would work well for our specific needs, I went about deploying Beats among our systems.

So far, albeit only being a few weeks into using Beats (and still learning how to actually make reports in Kibana) Beats appears to have been a good decision. Dramatically more cohesive and not spastically splintered all over the place like Nagios. I'm already looking into adding additional Beats beyond the known three; Topbeats, Packetbeats, and Filebeats. There are a number of other beats that we could add specific to our needs, that would be good open source projects. Stay tuned for those, I'll talk about them in this space and get a release out to all as soon as we lay a single line of code for those.

## Talent Recon

*Currently, nothing to report, but more to come in the space of talent recon.*
