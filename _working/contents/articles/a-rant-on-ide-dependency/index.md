---
title: A Small Rant About Being IDE-Dependent
author: Adron Hall
date: 2015-09-15 00:36:14
template: article.jade
---
{Sort of a Rant}

I recently saw this tweet.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">You can&#39;t create a project in visual studio code? This seems like an odd decision</p>&mdash; gregyoung (@gregyoung) <a href="https://twitter.com/gregyoung/status/643741277977210880?ref_src=twsrc%5Etfw">September 15, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I responded with this tweet.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/gregyoung?ref_src=twsrc%5Etfw">@gregyoung</a> yeah, projects being a tightly coupled dependency to the IDE needs to be ripped from the minds. <a href="https://twitter.com/hashtag/yeoman?src=hash&amp;ref_src=twsrc%5Etfw">#yeoman</a></p>&mdash; Λdrøn @ ¯\_(ツ)_/¯ (@Adron) <a href="https://twitter.com/Adron/status/643742088987836416?ref_src=twsrc%5Etfw">September 15, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Now I need to describe some context around this response real quick. Here are the key points behind this tweet from my context in the software development industry.

<span class="more"></span>

1. I'm not a .NET Developer. I'm a software developer, or application programming, coder, hacker or more accurately I'm a solutions developer. I don't tie myself to one stack. I've developed with C# & VB.NET with Visual Studio. I've done C++ and VB 4. I've done VBA and all sorts of other things in the Microsoft space on Windows and for the web with Windows technology. About 5 years ago I completely dropped that operating system dependency and have been free of it for those 5 years. I doubt I ever want to couple an application up to that monstrous operating system again, it is far to limiting and has no significant selling point anymore.</li>

2. In addition to the .NET code I've written over the years I've also built a few dozen Erlang Applications (wish I'd known about Elixir at the time), built a ton of Node.js based API and web applications, and have even done some Ruby on Rails and Sinatra. These languages and tooling stacks really introduced me to reality I longed for. A clean, fast, understandable reality. A reality with configuration files that are readable and convention that gives me real power to get things done and move on to the next business need. These stacks gave me the ability to focus more on code and business and research value and less on building the tool stack up just to get one single deployment out the door. Since, I've not looked back, because the heavy handed stacks of legacy Java, .NET, and related things have only laid heavily on small business and startups trying to add business value. In the lands I live in, that is San Francisco to Vancouver BC and the cities in between, Java and .NET can generally take a hike. Because businesses have things to do, namely make money or commit to getting research done and not piddling around building a tool stack up.

So how was this new reality created? It isn't a new one, really the new reality was this heavy handed IDE universe of fat editors that baby a developer through every step. They create laziness in thinking and do NOT encourage a lean, efficient, simple way to get an application built and running. It doesn't have to be this way. A small amount of developer discipline, or dare I say craftsmanship, and most of these fat IDEs and tightly coupled projects with massive XML files for configuration in their unreadable catastrophofuck of spaghetti can just go away.

Atom, Sublime, and other editors before that harnessed this clean, lean, and fast approach to software development. A Node.js Project only needs one file and one command to start a project.

```
npm init
```

A Ruby on Rails Project is about the same.

```rails new path/to/your/new/application
```

That's it, and BOOM you've got an application project base to start from.

Beyond that however, using a tool like Yeoman opens up a very Unix style way of doing something. Yeoman has a purpose, to build scaffolding for applications. That is its job and it does that job well. It has a pluggable architecture to enable you to build all sorts of scaffold packaging that you want. Hell, you can even create projects with the bloated and unreadable XML blight that pervades many project types out there from enterprisey platforms.

Take a look at <a href="http://yeoman.io/" target="_blank" rel="noopener">Yeoman</a>, it is well worth a look. This is a tool that allows us to keep our tooling, what we do use, loosely coupled so we don't have a massive bloated (5+ GB) installation of nonsense to put on our machines. Anybody on any platform can load up Yeoman, and grab an editor like Atom, Submlime, Visual Studio Code (not to be confused with the bloated Visual Studio) and just start coding!

Take a look at some of the generators that yeoman will build projects for you with -> http://yeoman.io/generators/ There are over 1500! No more need to tightly couple this into an IDE. Just provide a yeoman plugin in your editor of choice. Boom, all the features you need without the tight coupling in editor! Win, win, win, win, and win!

As a bit more of my rant about bloated editors, and don't get me wrong, I love some of the features of the largesse of some like Visual Studio and WebStorm. But one huge rant I have is the absolutely zero motivation or vested interest that a community has to add features, bug fix, or do anything in relation to editors like Visual Studio or WebStorm. ZERO reason to help, only to file complaints or maybe file a bug complaint. That's cool, I'm glad that the editors exist but this model isn't the future. It's slowly dying and having tightly coupled, slow, massively bloated editors isn't going to be sustainable. They don't adapt to new stacks, languages, or even existing ones.

Meanwhile, Atom, Sublime, and even Visual Studio Code and other lean editors have plugin and various adaptar patterns that allow one to add support for new languages, stacks, frameworks, and related tooling and not have tight coupling to that thing. This gives these editors the ability to add features and capabilities for stacks at a dramatically faster rate than the traditional fat IDEs.

This is the same idea toward tooling that is used in patterns that a software developer ought to know. Think of patterns like seperation of concerns and loose coupling, don't tie yourself into an untenable and frustrating toolchain. Keep it loosely coupled and I promise, your life will get easier and that evening beer will come a little bit sooner.

{Sort of a Rant::End}

...and this is why I say, do NOT tie project creation into an editor. Instead keep things loosely coupled and let's move into the future.
