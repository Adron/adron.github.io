---
title: Docker Tips n' Tricks - Delete All The Images & Containers
author: Adron Hall
date: 2015-11-02
template: article.jade
---
Two simple commands that'll wipe your installation clean of images and containers.

Deletes all containers

<div class="code-highlight">
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
docker rm $(docker ps -a -q)</code>
</pre> 
</div>

Deletes all images

<div class="code-highlight">
<span class="js-copy-to-clipboard copy-code">copy</span> 
<pre>
<code class="language-markup js-code">
docker rmi $(docker images -q)</code>
</pre> 
</div>