---
title: Open Source Part III
author: Adron Hall
date: 2016-10-17
template: article.jade
---
My friend Glenn Block [@gblock](https://twitter.com/gblock) contacted me via Twitter and we discussed some of what I had discussed in the previous post. He brought up some good points and I realized there were a few points I ought to bring up regarding what I'd previously written about.

<span class="more"></span>

### Atlassian Tools, Good Stuff

Most of the fight I've had undertake has been what appears to be against the aforementioned Atlassian Tools: JIRA, Confluence, and Stash. I think it is important to clarify my position however, the tools are perfectly capable of and well suited for any closed source internal development, and even being used for open source if they're paired with the appropriate practices and usage patterns. If they're not, their use can amplify the difficulty in creating open source solutions - but that amplification is merely the amplification of those cultural practices that make it difficult to change to a process that helps build useful and effective open source projects.

The other thing I mentioned, was the price tag of the Atlassian tools. I failed to mention that for open source, Github pricing for Enterprise efforts just like anybody else's is free. I believe that's the same for Bitbucket, so the comparison was rather disingenous on my behalf. The comparison and migration path before me, to get solutions into the open, was the free utilization of Github. JIRA, Confluence, and Stash on the other hand required practices that were costly and time consuming on our behalf. Such things as maintaining the servers running the software, management of security needs (SSL/TLS/HTTPS, etc), and the whole host of managing the entirety of these servers when all we really needed for open source work was repo + wiki + issues.

But I do digress, I'm ready to move from tools to practices and how those have to change. Moving from internal software development that is hidden from prying eyes to open source development, beyond tools or manifestos, has it's largest barriers simply in cultural change that is necessary.

### Enterprise Open Source Cultural Characteristics

The section of this part of the series could have been named "The Hard Part". Cultural change is something that moves at a glacial pace in an enterprise and must be a top down and bottom up effort. If it isn't supported by management, it'll likely fail, and if it isn't supported by the contributors themselves, it will surely fail.

First, here are some of the positive characteristics that always help. Whether it is a brand new greenfield project or an existing project that will be started or moved to be developed in the open, these are the characteristics that are invaluable.

### My Current Top 5
*...key culteral characteristics for enterprise open source development.*

* Self-Organizing - Leaders that lead and followers that follow. Don't be the person that won't get out of the way. Open source projects need followers that want to dive in, prospectively lead on parts, cut out corners to build, and projects need leaders to insure that the project stays true to its intent.

* Decisive - We're talking about the internet, the wild wide open internet, being decisive in an intelligent way is vital to help an open source project grow into what it is deemed to be.

* Aware - It's important when working on company projects in the open, as mention in the entry where I layed out the [Home Depot Manifesto](/articles/holy-shit-watch-out-for-that-enterprise-open-source/) which includes important awareness around trade secrets.

* Inclusive - The project needs to be aware of it's particular cultural characteristics, but it's also important to pick up new traits and characteristics to improve development practices over time. Encourage others to join the project and actually provide some type of outreach and support for anybody that wants to help out with the project. This alone I have found is one of the most difficult features that Enterprise Open Source projects need to build and encourage. Usually enterprise projects are simply insular because of their internal facing needs. Often they don't even realize when they could have things easier or expanded to help all involved - until it happens.

* Learning - The members of the project team on an Enterprise Open Source Project need to encourage learning new ways, practices, tools, and capabilities for the project. Encouraging some to always learn puts a project on a trajectory with continued innovation, improved practices, and perpetuating a healthy balance of progress into the future. Getting a project stuck on X set of tools and such doesn't help anyone in the long run, just take a look at the past of so many infrastructure open source projects like Cloud Foundry, HashiCorp tools, etc that were once Ruby but have migrated almost entirely to Go. In this particularly situation, learning and keeping up on the new technology has helped those platforms move forward.

There are more, but these are the top 5 at the moment. If you think I've missed any really important trait that should be mentioned, tweet at me [@Adron](https://twitter.com/Adron) and it's possible we could get the top 6.  ;)
