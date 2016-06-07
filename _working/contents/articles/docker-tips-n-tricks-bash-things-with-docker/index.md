---
title: Docker Tips n' Tricks - Bash Things With Docker
author: Adron Hall
date: 2016-03-10
template: article.jade
---
If you use Docker frequently, you've likely memorized a few repetitive commands...

<div class="code-highlight " >
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
docker-machine start XyZvirtualMachine</code>
</pre> 
</div>

Then you run...

<div class="code-highlight " >
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
docker-machine env XyZvirtualMachine</code>
</pre> 
</div>

...and then you type...

<div class="code-highlight " >
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
eval $(docker-machine env XyZvirtualMachine)</code>
</pre> 
</div>

One does this about a zillion times if there are multiple virtual machines or for other various reasons. I wanted to simplify this repetitive task so I wrote a bash function, thanks to a <a href="http://stackoverflow.com/questions/35761480/scripting-docker-not-connected-after-running-script" target="_blank">fumble I posted on Stackoverflow</a> and then an assist by my good friend Troy Howard (<a href="https://twitter.com/thoward37" target="_blank">@thoward37</a>).

This quick hack consisted of this <a href="https://gist.github.com/Adron/8dc06eb398f403225daa" target="_blank">Github gist</a>.

<div class="code-highlight " >
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
gimmedocker() { if [ $1 ]; then
	docker-machine start $1
	docker-machine env $1
	eval $(docker-machine env $1)
	docker ps -a
fi }</code>
</pre> 
</div>

Stick that in your ~/.bash_profile (or ~/.bashrc if you're on *nix) and you're good to go. Then at the bash prompt just type in this.

<div class="code-highlight " >
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
gimmedocker XyZvirtualMachine</code>
</pre> 
</div>

BOOM! Less typing for the win!