---
title: Let's Talk Tactical Tools for Enterprise Open Source
author: Adron Hall
date: 2016-10-16
template: article.jade
---
[Part I](/articles/holy-shit-watch-out-for-that-enterprise-open-source/), [Part II (That's this article)](/articles/enterprise-open-source-tactical/), [Part III](/articles/enterprise-cultural-characteristics/),
[Part IV](/articles/enterprise-open-source-anti-patterns).

In the first part I wrote about the Enterprise Open Source Manifesto that was written up for Home Depot's open source efforts. In this part I'm going to tactical some of tooling & cultural characteristics that came into play.

<span class="more"></span>

### Enterprise Open Source Tooling

Every team had a number of tools in use upon the beginning of these efforts. I'm going to dive into a few of the tools we used and how those helped and hurt us all at the same time. After that Iv'e got a discussion on future tool choices, current tool migrations, and goals.

### Existing Pre-OSS Efforts

* JIRA
* Confluence
* Stash

#### JIRA, Stash, and Confluence

JIRA has a lot of pluses and negatives, and I do mean a lot! I'm going to start with the pain points and then move onto the positives.

Access - One of the major pain points was that JIRA had harbored a completely closed communication practice. What I mean by this was that all communications, as one would assume, were being done in a very insular way. Since the tool had traditionally been used only for closed source development, it was by it's very nature configured to be exclusionary to any and all possible open source efforts.

User Limits - The way JIRA is configured, one doesn't merely get added or become a contributor in any general sense. One needs to fall under a particular user paradigm like Active Directory, controlled auth SSO style accounts, or something of that sort. This leaves JIRA very limited for public access and contributions from an organizational perspective.

JIRA is extremely heavy and many open source efforts are super lean. I realize for a project with a lot of pull requests and interactions there needs some way to oganize all the interactions, but for small projects or even reasonably sized projects JIRA is overkill.

Another issue is that JIRA becomes a practice that dictates effort versus effort and results that dictate practice. This in turn makes it even more difficult to break certain practices and dogma to move toward lighter weight practices. More seamless open source projects and the practices that would and can move an open source project forward are disregarded because X, Y, and Z activities must be performed because of the "JIRA".

Confluence is actually a great wiki tool. Albeit again, it's a matter of overkill. Often the wiki that is needed is just a simple tool that can provide absolutely minimalistic wiki features. Maybe markdown is the standard mechanism to markup wiki pages with even. Whatever the case it needs to be simple.

However, again just like with JIRA, these tools work great for dramatically larger and more complex projects. They can and do provide a great ability to cohesively bring together larger teams of people to work together in a more effective manner.

Stash is useful in some ways, but again just like with JIRA, Confluence and related tooling it tends to be used to provide a way to hide away the source code internally. This in turn, just as with JIRA and Confluence work toward hiding software and not toward bringing it forward in an open and transparent way for others to work with.

### New Tools for Enterprise OSS Efforts

#### Github

So Github comes to the rescue. For the most part there is a simple reason that it is the defacto go-to place for open source. It's in the open, millions already use it, their git intergration is good, they have pretty straight forward minimalist focused interfaces and features, and it gets the job done.

Does Github miss key features for some? Absolutely. Do issues get cumbersome and out of control after moderate conversation. Of course they do, especially with their single depth style of forum comments. Even with whatever disadvantages it has, Github was the go-to for us when we wanted to open source software too. It provided many of the key features we need; wiki, issues, and simple ways to track for simple projects.

Now, with all the negatives pointed out, one could actually use JIRA, Stash, and Confluence for open source work. You just need to open up all of the software to the public. They've be perfectly capable from a technical point of view to accomplish the mission, albeit it'd probably cost a ton of cash.

#### Jell

Need a quick tool for managing the daily punch list, or more simply, what I generally call the *My GSD for Today* items? Jell is a great tool for this. Others that come to mind are Trello or even just plain old Google Docs (I guess that's G-suite now). Whatever the case, it helps members to have a punch list if it's a day-to-day, regularly worked on project. This helps with that communication across any contributors, even if contributors are all in a single office.

[Part I](/articles/holy-shit-watch-out-for-that-enterprise-open-source/), [Part II (That's this article)](/articles/enterprise-open-source-tactical/), [Part III](/articles/enterprise-cultural-characteristics/),
[Part IV](/articles/enterprise-open-source-anti-patterns).

That's it for part II. More to come for this series real soon, and I'll update the post with a link right here to Part III as soon as it's published.
