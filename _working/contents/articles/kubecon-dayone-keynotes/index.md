---
title: Good Morning KubeCon?
author: Adron Hall
date: 2017-12-06 08:57:22
template: article.jade
---
<div class="image float-right">
    ![KubeCon Logo](kubelogo-wide.png)
</div>

I hope you're having a good morning so far. KubeCon has kicked off in full force like the pro-conference that it is. With 4k+ people in attendance the crowds are distinctive, even among a city like Austin. The conference lit off the day with an absurdly early registration time of 7am, and a continental breakfast of some fruit and pastries.

<span class="more"></span>

## Keynote(s)

### [Dan Kohn](https://twitter.com/dankohn1)

The keynotes this morning kicked off at 9am. [Dan Kohn](https://twitter.com/dankohn1), the executive director of the Cloud Native Computing Foundation (CNCF), started off the keynote session. He started off with a simple story about communities building. Outlining a quote from Tim Hockin, "existing time for boring infrastructure". This really wraps up so much of everything happening in this space these days.

> "Exciting time for boring infrastructure."

Dan continued, pointing out that Linux is one of the largest projects on Github and probably one of *the*, if not *the* most important project on Github. Kubernetes is in the top 10 on Github too, as Jim Zemlin said, "Kubernetes is the Linux of the Cloud". The commit and member involvement in Kubernetes. The growth of the KubeCon event and how this event in Austin is 4x the last 4 KubeCon events! Huge growth.

> "Kubernetes is the Linux of the Cloud" - Jim Zemlin

Dan then introduced an unexpected speaker from Alibaba that elaborated on the massive scale of Alibaba, its leading position in China, and other projects Alibaba is doing with Kubernetes.

> **NOTE: Diveristy Scholarship**

> The US failed to provide visas for 4 of the diversity scholarship recipients. However they've been offered to attend the Copenhagen event, which in the end the US has taken more more hit because of our poor immmigration and border control rules in the United States. Something that needs to be modernized, and I'm sure we'll keep losing out for years to come until national leadership has the spine to fix this. But I digress, onward with the keynote.

### [Michelle Noorali](https://twitter.com/michellenoorali)

Michelle Noorali, Senior Software Engineer at Microsoft, then was introduced and came out to provide information on Special Interest Groups (SIGs), the deep dive sessions, techincal salons, and hallway tracks, and more details.

She continued to give us the story of KubeCon, Kubernetes, and the distinct history of how the rise of microservices, cloud, and container technology has changed the landscape of infrastructure and related technology. This is something important as the story isn't always clear, but the story is a fundamental detail that informs and provides a more clearly defined path to where we're all going with this technology.

Next Michelle dove into some specifics about the Workloads API coming in Kubernetes 1.9. For one it'll be stable. Another is Windows Server container support beta, which I guess is stable - I haven't used it and am curious who is, I'd love to talk!

Michelle then introduced Tom Wilkie to talk about observability and [Prometheus](https://prometheus.io).

Next up she introduced [Eduardo Silva](https://twitter.com/edsiper) to discuss [fluentd](https://www.fluentd.org) and announce the v1.0 release. Highlights include multi-process workers, sub-second time resolution, native TLS/SSL, otimized protocol buffers, and improved Fluentd protocol buffers. He continued and elaborated on the data streaming options, and flowing to technology like [Kafka](https://kafka.apache.org). Also, fluentd has been ported to Windows finally so Windows Server users can now natively use fluentd.

Reliability? What's that? [Oliver Gould](https://twitter.com/olix0r) then introduced by Michelle to talk about [linkerd](https://linkerd.io) and give us some insight to the progress of the tool. Oliver then introduced [Conduit](https://github.com/runconduit) too, and then gave us a demo of it working.

Michelle then came back around to wrap up her section of the keynote and cover some additional projects within the CNCF; grpc, envoy, and such.

### [Imad Sousou](https://twitter.com/imadsousou)

Next up Imad Sousou came out to talk about introducing container runtimes at Intel.

> **NOTE: Just for your information, Intel isn't just processor chips.**

> Intel have thousands of software developers actually working on a lot of various software projects. Intel is also a company that has a fairly large number of people working on open source projects.

Imad then elaborated on [Kata containers](https://katacontainers.io) that are hardware accelerated containers that use virtualization technology.

### [Diane Marsh](https://twitter.com/dmarsh)

Diane Marsh of Netflix came out next to discuss the importance of culture of building these tools, and what happens with these tools. The core of the talk focused around tools Spinnaker, Asgard - *namely continuous delivery* - and other Netflix OSS and how culture plays a part. She detailed how Netflix culture affected how people accepted and were able to use Asgard or Spinnaker. For instance, the culture at Netflix is one of freedom, and many companies don't have this level of maturity. Netflix has this level of freedom, to deploy, because of a very strong level of trust.

### [Adrian Cockroft](https://twitter.com/adrianco)

Finally to wrap up the morning keynote, Adrian Cockroft came out to show us a few things. Leading of with cloud native principles; immutable code deployments, high utilization with aggressive efficiency by turning things off, pay as you go, no waiting globally deployed and distributed models. At AWS he's working to increase the contributions AWS makes, working with CNCF (which they've joined), pushing cloud native, and integrating CNCF components (all those projects) into AWS.

Some of the projects AWS is involved in include; [containerd](), kubernetes installers and security, and CNI, the [Container Networking Interface](https://github.com/containernetworking/cni).

Adrian also noted, importantly, that all AWS work with Kubernetes is upstreamed to Kubernetes itself and not a fork of the project. They're working toward making all integration at all levels within AWS. Some of the work even include work and partnerships with Heptio around authentication for IAM within AWS. Lots of good things, and a lot of high integrity work!

Beyond Kubernetes and other elements Adrian's teams are working on integrations with SPIFFE, HashiCorp Vault, and other open source tooling. I for one am pretty excited aobut these tools coming online at AWS as it'll make my life easier to get some great things deployed and enabling customers and groups I work with! "Much excite, much wow" as the internet would say.

Adrian then dove into Fargate, discussed how it folds in with EKS, and how the integration is going to work.

For now, that's that for the keynote.