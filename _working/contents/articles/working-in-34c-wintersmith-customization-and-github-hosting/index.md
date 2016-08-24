---
title: Working in -34c Wintersmith Customization and Github Hosting
author: Adron Hall
date: 2014-02-19
template: article.jade
---
Getting Wintersmith customized, building and deployed to Github and a domain name pointed takes a few extra steps. So let's roll...

<div class="image float-right">
    [![Wintersmith Icon 1](wintersmith-01.png)](http://wintersmith.io/)
</div>

<span class="more"></span>

**Step #1**

Setup <a href="http://wintersmith.io/" target="_blank">Wintersmith</a>. See my previous blog entry "[Wintersmith Creating Documentation](/articles/wintersmith-creating-documentation)" for this information.

<div class="image float-right">
	[![Wintersmith Icon 2](wintersmith-02.png)](http://wintersmith.io/)
</div>

**Step #2**

Now it's time to get things deployed to Github. This takes a few interesting, non-intuitive steps, but once done things work extremely well. To get the appropriate git branch setup I worked with an existing git repo. This repo is the same repo that I’ve used for the public facing [Deconstructed Site](/docs/deconstructed-once-upon-a-time). The code repo is located @ [Deconstructed Github Repo](/docs/deconstructed-once-upon-a-time). I added a [github pages branch](/docs/deconstructed-once-upon-a-time) to this repository, for more information on how to do this check out my Jekyll how-to “[Bringing to Life an Open Source Project via Github &amp; Jekyll - Part 1](/docs/deconstructed-once-upon-a-time)” which I detail at the beginning how to get a Github Pages site running.

Once the site is up and running I switched over to it and cleared out that path. I kept a few things I’d need like the .gitignore, README.md and a few other files. I then put the repo directory that I detailed in “[Wintersmith Creating Documentation](/articles/wintersmith-creating-documentation)” right here in the gh-pages branch. With that in place I then just committed and pushed this code to the gh-pages repository. That gave me the initial baseline for the site.

<div class="image float-right">
	[![Wintersmith Icon 3](wintersmith-03.png)](http://wintersmith.io/)
</div>

**Step #3**

Get the customizations done and site domain/subdomain redirected. The steps to get the domain setup to have a custom domain pointed at your gh-pages github site is as follows:

1. Create a file named CNAME in the root of your gh-pages branch and in that CNAME file add one line with the domain that is being directed to this gh-pages site. My <a href="https://github.com/Adron/deconstructed/blob/gh-pages/CNAME" target="_blank">CNAME file</a> looks simply like this: `docs.deconstructed.io`

2. Next setup either an DNS A record or cname record. The cname will give you the advantage of having Github manage which IPs are in use in their system, so if there is any failover, DDOS or IP changes then you're protected from that. To setup an A record add the A record to point to 204.232.175.78 or setup a cname to point to your github .io account, which in my case is http://adron.github.io/. The following is what the record looked like in my Route 53 settings.![DNS Setting](dns-deconstructed.png)

3. Last but not least the configuration settings that need to be made in Wintersmith.

	* First set the locals url setting to the appropriate domain or subdomain. In my case that meant changing the value from *http://localhost:8080/* to *[http://docs.deconstructed.io/](/docs/deconstructed-once-upon-a-time)*.

		"locals": {
			"url": "http://docs.deconstructed.io",
			"name": "Deconstructed Docs",
			"owner": "Adron Hall",
			"description": "This site provides the documentation around the Deconstructed API Services."
		}

	* In the root of the project (where the Wintersmith build ends up) add a .nojekyll file so that Jekyll won't be used unnecessarily to try and build the Wintersmith project.

...and with that, I've covered the bases for getting a Wintersmith site (blog or whatever you're like to use it for) up and running. Feel free to ask any questions in the comments and I'll help work through any issues you've encountered. Cheers!