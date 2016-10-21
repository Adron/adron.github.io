---
title: Enterprise Open Source Anti-patterns
author: Adron Hall
date: 2016-10-20
template: article.jade
---
[Part I](/articles/holy-shit-watch-out-for-that-enterprise-open-source/), [Part II](/articles/enterprise-open-source-tactical/), [Part III](/articles/enterprise-cultural-characteristics/),
[Part IV (That's this article)](/articles/enterprise-open-source-anti-patterns).

In the [first part](/articles/holy-shit-watch-out-for-that-enterprise-open-source/) of this series I kicked off writing about how we created a manifesto at [Home Depot](http://www.homedepot.com). This is something I'd strongly urge anybody that is helping to lead an enterprise toward open source efforts. The [second part](/articles/enterprise-open-source-tactical/) focused on tactical tools used with open source software development. I'll be adding more to the tools conversation a bit later in this series. Then in [part three](/articles/enterprise-cultural-characteristics/) I delved into some of the positive cultural characteristics of a team working on open source projects.

In this part of the series I want to share a few thoughts on some of the anti-patterns that came up in the process. These are specific hurdles that continue to afflict the efforts, and range from a general disturbance or an outright conflict with efforts.

<span class="more"></span>

As I was creating these, I did a quick search to see what prospective open source anti-patterns existing with or without the context of enterprise open source. Not surprisingly there were a few, and the few that I found via the search I've attributed to who I found had written about them just under each description.

## 1. Insular Anti-Pattern

This is the idea that a group is so used to interacting behind closed doors, only among each other, that they fail to message, market, or even discuss the actual open source project with prospective contributors or others that are interested in public. This makes for code repositories that are starkly devoid of any conversation or information about what is being developed or why. It's also a pretty sure fire way of killing your project, or insuring that the only group that uses it and develops the code for the project are those that started it.

## 2. No Source Anti-pattern
*via [Bryan Cantrill @bcantrill](https://twitter.com/bcantrill)*

This is when a project is announced, usually by upper management that has somehow failed to determine where, who, or who they're going to create or get the source code written. Companies that do this look embarrassingly absurd and out of touch with their actual employees that do the actual work at the company. Do NOT be this company.

## 3. Wishful Thinking Anti-pattern
*via [Bryan Cantrill @bcantrill](https://twitter.com/bcantrill)*

This is the broken idea that because a project is brought into the open (new or existing) someone else will join in and do the work. If you're not ready to do the work yourself, then don't expect others to want to jump in and help you.

## 4. Extroverted Anti-pattern

This is similar to the No Source Anti-pattern. The pattern here is that a group - not particularly management - has gotten so excited preaching the idea of the project even when the project may or may not be moving forward. They see talk of the project as the means to an end even more than the actual code and project itself. This is most identifiable when a marketing or recruitment team sees the project as a means to market or recruit people but don't have any vested interest in the actual code or project itself.

## 5. Forkaphobia Anti-pattern
*via [Bryan Cantrill @bcantrill](https://twitter.com/bcantrill)*

This is one of the craziest anti-patterns. The juxtoposition of this anti-pattern is the *forking paradox*. The forking paradox is stated as *the easier it is to fork the software, the more difficult it is to the fork the community. If forking is easy, experimentation with ideas is persued while still remaining safely downstream. If forking is difficult, experimenters are reduced to dissenters - resulting in endless arguments (best case) or divorce (worst case).* Bryan summarizes this one well with "Corporate Entities must therefore encourage forking - open source that cannot be forked has no vitality".

## 6. Governance Anti-pattern

This is best seen in governance of real things, like people. The massive and complex ordeal of maintaining governance around a software project can become so large and unwieldy to to enforce an order and dictate on the future progress of the project. Necessitating a governance body or board is often a sign the project has become unwieldy with to many influencers who can't agree on the direction. At this point, to maintain health and vitality it's often best to fork the solution to break the stranglehold of the Governance Anti-pattern.

## 7. Eschewing Leadership Anti-pattern
*via [Bryan Cantrill @bcantrill](https://twitter.com/bcantrill)*

Good open source have good leadership. When consensus isn't available, good leadership turns that into positive direction and inspires people to move forward regardless. Projects that are started but nobody wants to take a leading role, even among people who generally decide on the direction, leads to a project that quickly spirals out of control into branches and forks and gets lost.

## 8. Demanding Assignment Anti-pattern

Demanding assignment relies on a community trusting a commercial entity. Bad actors in open source (a notorious example is Oracle) however have destroyed that trust. To prevent this anti-pattern a contributor agreement to protect the source base from 3rd party claims of copyright and patent infringement. Copyright assignment still may make sense, but should be used only as a social contract.

## 9. Apathy Anti-pattern

This anti-pattern is a combination of things like the Extroverted, Wishful Thinking, or No Source Anti-patterns. When this occurs a group simply throws their source code into a public repository but then does nothing else with it in the public repository. If active development isn't done in the public repository, or a very effective story and information is provided as to why it's a read-only kind of copy, there is an immediate threat that the project won't just have apathetic developers that created it but worse, an apathetic audience who simply just won't use it.

## 10. Opaque Anti-pattern

In this anti-pattern a tool, set of tools, or other medium in which communication about the project is done almost entirely in a closed and invisible way. There are Github repositories for instance that the issues and wiki are turned off, and nobody communicates around the repository itself. Sometimes the communiation occurs in a closed email thread or other medium, like a closed Slack channel that is invite only. This isn't to say that some communication could and should be kept in private, because there is some that should, but the bulk of the community's communication should be available via public means. This is needed for others to use, understand, and work with the project. Otherwise the trust to make the project effective and move forward is simply not there. Don't make your open source project efforts opaque!

That's my list of anti-patterns to watch out for when starting or moving an enterprise project into an open source model. There are probably more, and as usual, it's an open invite to add more. Just let me know via twitter [@Adron](https://twitter.com/Adron) and I'll get them added right away.

---

For more on Bryan's talk on the anti-patterns he discusses, here is a video of the talk: <iframe width="960" height="540" src="https://www.youtube.com/embed/NhgXQFk9noI?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

Here's what I believe is the [slide deck](http://www.slideshare.net/bcantrill/corporate-open-source-antipatterns).

[Part I](/articles/holy-shit-watch-out-for-that-enterprise-open-source/), [Part II](/articles/enterprise-open-source-tactical/), [Part III](/articles/enterprise-cultural-characteristics/),
[Part IV (That's this article)](/articles/enterprise-open-source-anti-patterns).
