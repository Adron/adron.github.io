---
title: Reading Up on Observability and Monitoring
author: Adron Hall
date: 2018-02-04:11:27:22
template: doc.jade
---
In the next few weeks I’ll be doing some work for Honeycomb.io. In preparation I’ve been ramping up on a number of topics, namely the big one is the specific differences in things like observability and monitoring. The aside that makes this relatively easy, is I live and breath this space from a site reliability, apps, and services perspective. Not only am I fortunate in my situation to dive into this topic, I’m excited to do so as well.

I started this research just checking out what material Honeycomb.io has available onsite and additionally what Charity Majors has written, or spoken about at conferences. The first two were easy to find with a simple Google search and checking out the Honeycomb.io Blog. For each of these materials I’ve provided a summary before each linked reference. Enjoy.

## Title: [Charity Majors on Observability and Understanding the Operational Ramifications of a System](https://www.infoq.com/articles/charity-majors-observability-failure)

This article is in interview form, with Daniel Bryant interviewer and Charity Majors the interviewee. When asked the question

> Can you explain a little about how operational and infrastructure monitoring has evolved over the last five years? How have cloud, containers, and new (old) modular architectures impacted monitoring?

Charity goes on to lay out a stance.

> What’s interesting is that monitoring hasn’t really changed. Not in the past … 20 years.

> You’ve still got metrics, dashboards, and logs. You’ve got much better ones! But monitoring is a very stable set of tools and techniques, with well known edge cases and best practices, all geared around monitoring and making sure the system is still in a known good state.

> However, I would argue that the health of the system no longer matters. We’ve entered an era where what matters is the health of each individual event, or each individual user’s experience, or each shopping cart’s experience (or other high cardinality dimensions). With distributed systems you don’t care about the health of the system, you care about the health of the event or the slice.

> This is why you’re seeing people talk about observability instead of monitoring, about unknown-unknowns instead of known-unknowns, and about distributed tracing, honeycomb, and other event-level tools aimed at describing the internal state of the system to external observers.

Let’s elaborate for a moment. Monitoring not changing in the last 20 years is truth. I worked at WebTrends years ago, which was a company that was formed around basically taking logs files and churning through them to get reports out of them. In the process they became one of the first web analytics company. But even way back 20 years ago almost WebTrends was basically laying out what we deal with and have for monitoring. Starting with log files and on up through basic pinging of services, with related APM style monitoring. This has been and continues to be effectively the same thing, needed, but unchanging for decades.

But jump over to her point about tracking events instead of worrying about the health of the overall system. Maybe stating “it no longer matters” is slightly hyperbolic, but she’s making a point, so don’t get derailed. The idea is we don’t actually care about the system, we care about what activity we’re trying to make possible; buying some food on Amazon, that rare book on a book finders site, issuing a search with esoteric terms, triggering a compute action of some sort, analyzing a flight path for an upcoming trip, or other event. In the end, I’d even add to the argument that we end users don’t even really care if it’s done by a computer or some magical sky pixie, the only thing that matters is we get the result of the event we’ve requested and that it is correct for us to take action on.

We want the event, the correct result, and the rest is irrelevant in the grand scheme of the universe. This is an extremely important point she’s brought up and it is key in understanding the difference in monitoring — the combing of data to determine the state or well-being of a system — versus observability — the view into and understanding of the state of events within a system.

Distributed systems also amplify, exacerbate with complexity, this intent to know the state of events versus the state of the system. Anybody who has dealt with any list of distributed systems, from Kubernetes to Riak to Cassandra to others, knows that the key is the event and data, as one may never really know when a system is under duress or what the state is of the entire system. Simply put, you cannot know the full state of a truly complex distributed system, and often if you do it still doesn’t tell you if your events are being performed accurately or at all. Sure, monitor it, but what we really need to know is what the data is, if it’s really the data we want, and the event the data is relevant to. This paradigm around distributed systems Charity also summarized up in an answer I found spot on.

> "Monitor everything”. Dude, you can’t. You *can’t*. People waste so much time doing this that they lose track of the critical path, and their important alerts drown in fluff and cruft. In the chaotic future we’re all hurtling toward, you actually have to have the discipline to have radically *fewer* paging alerts … not more. Request rate, latency, error rate, saturation. Maybe some end-to-end checks that stress critical Key Performance Indicator (KPI) code paths.

That’s just a review of some of the discussion, definitely suggest reading more…

[Charity Majors on Observability and Understanding the Operational Ramifications of a System](https://www.infoq.com/articles/charity-majors-observability-failure)

## Title: [Monitoring and Observability](https://medium.com/@copyconstruct/monitoring-and-observability-8417d1952e1c)

Next up I found an article by [Cindy Sridharan](https://medium.com/@copyconstruct) ([@copyconstruct](https://twitter.com/copyconstruct)). Cindy brings up an often snarky emoted statement, as per the tweet…

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">OH - &quot;Observability - because devs don&#39;t like to do &quot;monitoring&quot; we need to package it in new nomenclature to make it palatable and trendy.&quot;</p>&mdash; Cindy Sridharan (@copyconstruct) <a href="https://twitter.com/copyconstruct/status/891066003844546560?ref_src=twsrc%5Etfw">July 28, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

…because devs don’t like to do “monitoring”… oh really?

Cindy writes a really great post, but before even diving into that, follow the thread of comments on that tweet. Some of them are pretty good. I’ve included a few gems.

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="en" dir="ltr">disagree with the substance, but A+ snark</p>&mdash; Charity Majors (@mipsytipsy) <a href="https://twitter.com/mipsytipsy/status/891588725829795840?ref_src=twsrc%5Etfw">July 30, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Yes, yes the snark gets a high rating.

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="en" dir="ltr">It would be nice if everyone understood how to look at data. This is why we can&#39;t have nice things.</p>&mdash; Samantha Zeitlin (@SamanthaZeitlin) <a href="https://twitter.com/SamanthaZeitlin/status/891089379099238401?ref_src=twsrc%5Etfw">July 29, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

If I were to cry of pity for people, this is one of the things I’d cry about for all.

Cindy goes on to bring up three other articles that I also highly recommend. These posts are all over on the Twitter blog: [Observability at Twitter](https://blog.twitter.com/engineering/en_us/a/2013/observability-at-twitter.html), [Observability at Twitter: technical overview part 1](https://blog.twitter.com/engineering/en_us/a/2016/observability-at-twitter-technical-overview-part-i.html), and [Observability at Twitter: technical overview part 2](https://blog.twitter.com/engineering/en_us/a/2016/observability-at-twitter-technical-overview-part-ii.html). In this she points to the quote, “…observability is a superset of monitoring…” which is succinctly put. Again, so many great phrases describing observability versus what monitoring is. It seems like the nebulous snarky quotes like “Observability — because devs don’t like to do “monitoring” we need to package it in new nomenclature to make it palatable and trendy.” would just be laid to rest. But I digress, read Cindy’s article, it’s long and got great links, descriptions, and is well worth the read.

## Title: [Observability vs. Monitoring, is it about Active vs. Passive or Dev vs. Ops?](https://medium.com/@steve.mushero/observability-vs-monitoring-is-it-about-active-vs-passive-or-dev-vs-ops-14b24ddf182f)

This post is by Steve Mushero, and starts off by referring to Cindy Sridharan’s post reviewed above. Steve posits the question in the title of the piece, which my first thought is that it isn’t vs. but complementary right? Reading throught the beginning of the post I get to another gem of a quote.

I Monitor you, but you make yourself Observable.

Onward in the piece Steve hits home some specific detailed points.

> For Observability, the system, code, developers, etc. are taking step to make things available to make the system more observable. This often starts with increasingly rich and structured logs, plus events or markers, JMX data points, and Etsy-style emitted metrics. Loved and tended to by Developers and the most modern Ops.

…and…

> Observability elements, on the other hand, are often much detailed, more diverse, and used more for debugging, complex troubleshooting, performance analyses, and generally going ‘deeper’.

Both points are very interesting, the first getting into some details of what exactly observability and the second one a little obfuscated but driving home the idea behind observability versus just monitoring.

Toward the end Steve writes, “In the end, we need them all, and what it’s called doesn’t matter much.” which I disagree with, but not wanting to delve into pedantic response I’ll hold off, but suffice it to say, words matter and have meanings that help us describe our world and communicate, so it does indeed matter what we call things.

That’s it for my current reading up on observability and monitoring. As always, if you’ve found this useful (or just interesting) follow me Adron Hall here on Medium, or one of my other mediums depending on how you like to consume content.