---
title: Hacking Fsharp Systems Not Windows
author: Adron Hall
date: 2016-07-02:21:52:13
template: talk.jade
---
## Hacking Fsharp Systems Not Windows
### *on 2015-09-05*

The basic idea behind this talk is to bring everybody through a quick history of Visual Studio Code, Atom and other editors in relation to F# development and take a look at .NET's compatibility across operating systems. I'll be giving this <a href="http://devday.pl/" target="_blank">presentation at Dev Day Poland in Krakow on September the 18th</a>.

<h2>Prerequisites to Follow Along &amp; Other Details</h2>
<ul>
	<li><a href="https://compositecode.wordpressfiles.wordpress.com/2015/06/ah_f_256.png"><img class="alignright size-thumbnail wp-image-11288" src="https://compositecode.wordpressfiles.wordpress.com/2015/06/ah_f_256.png?w=150" alt="" width="150" height="150" /></a>Install <a href="https://git-scm.com/" target="_blank">Git</a>.</li>
	<li><a href="https://www.apple.com/osx/" target="_blank">OS-X</a>, <a href="http://www.ubuntu.com/" target="_blank">Ubuntu</a>, and <a href="http://www.microsoftstore.com/store/msusa/en_US/cat/Windows-8.1/categoryID.62684800" target="_blank">Windows</a> (At least, these are the operating systems I've tested the presentation code on - specifically OS-X Yosemite, Ubuntu Server/Desktop 14.04.2 LTS, and Windows 8.1)</li>
	<li><a href="https://code.visualstudio.com/" target="_blank">Visual Studio Code</a> - <a href="https://code.visualstudio.com/Docs/setup" target="_blank">Getting Started with Visual Studio Code</a></li>
	<li>Check out <a href="http://compositecode.wordpress.com/2015/05/07/os-x-and-f-clone-it-build-it-install-it-hack-it/">OS-X and F# [Clone It, Build It, Install It, Hack It]</a> and <a href="http://compositecode.wordpress.com/2015/05/15/simplifying-bash-repl-use-with-f/">Simplifying bash &amp; repl Use With F#</a> for more information on setting up and using <a href="http://compositecode.wordpress.com/2015/05/10/why-f-and-why-not-windows/">F# on non-Windows Platforms</a> (and Windows to some degree).</li>
	<li>Also I've started a series on F# which includes a lot of the troubleshooting and steps I took to get things running on the various operating systems;
<ul>
	<li><a href="http://compositecode.wordpress.com/2015/06/16/_______1-f-getting-started-thinking-functionally/" target="_blank">_______1 |&gt; F# – Getting Started, Thinking Functionally (Notes)</a></li>
	<li><a href="http://compositecode.wordpress.com/2015/06/22/______11-f-some-hackery-a-string-calculator-ka/" target="_blank">______11 |&gt; F# – Some Hackery – A String Calculator Kata</a></li>
	<li><a href="http://compositecode.wordpress.com/2015/06/24/______10-f-moar-thinking-functionally-notes/">______10 |&gt; F# – Moar Thinking Functionally (Notes)</a></li>
	<li><a href="http://compositecode.wordpress.com/2015/06/28/_____100-f-some-troubleshooting-linux/" target="_blank">_____100 |&gt; F# Some Troubleshooting Linux</a></li>
	<li><a href="http://compositecode.wordpress.com/2015/08/23/_____101-f-coding-ecosystem-paket-atom-w-paket/" target="_blank">_____101 |&gt; F# Coding Ecosystem: Paket &amp;&amp; Atom w/ Paket</a></li>
</ul>
</li>
	<li>Some of the issues I discussed are available on <a href="http://www.stackoverflow.com/" target="_blank">Stack Overflow</a> titled "<a href="http://stackoverflow.com/questions/30972220/how-can-i-resolve-the-could-not-fix-timestamps-in-error-the-requested" target="_blank">How can I resolve the “Could not fix timestamps in …” “…Error: The requested feature is not implemented.”</a>" and "<a href="http://stackoverflow.com/questions/30992501/projectscaffold-error-on-linux-generating-documentation" target="_blank">ProjectScaffold Error on Linux Generating Documentation</a>"</li>
	<li>Even though<a href="https://github.com/ThrashingCode/nodejs-training-prerequisites" target="_blank"> these are primarily prerequisites focused around having Node.js and JavaScript working</a> on your machine they're also extremely helpful to have installed for a number of reasons, such as using yo as a scaffold builder for F# Projects and such. To paraphrase, get JavaScript &amp; Node.js working on any development machine, it will pay off big over time, even if you're not writing JavaScript code.</li>
</ul>
<h2>Presentation Collateral</h2>
<ul>
	<li><strong><strong>Demo Code:</strong> Just checkout the <a href="https://github.com/Adron/sharpdev" target="_blank">sharpdev repository</a>.</strong></li>
	<li><strong>Slides:</strong> <a href="https://speakerdeck.com/adron/hacking-f-number-on-systems-not-windows" target="_blank">https://speakerdeck.com/adron/hacking-f-number-on-systems-not-windows</a></li>
</ul>