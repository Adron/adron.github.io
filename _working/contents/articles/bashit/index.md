---
title: Bashit... Just a Custom Bash Prompt Setup for Git
author: Adron Hall
date: 2014-10-9
template: article.jade
---
I use git. I'm honestly shocked when someone doesn't use git (<em>or at least some DVCS</em>) these days. It just seems somewhat draconian to use any of the legacy source control systems (<em>albeit there are some rare exceptions, like game development graphics collateral</em>). I was reminded of something by the great hands on session that Pamela Ocampo [@pmocampo](https://twitter.com/pmocampo) and Rachel <a href="https://twitter.com/raychatter" target="_blank">@raychatter</a> gave at <a href="http://opensourcebridge.org/" target="_blank">OS Bridge</a> titled "<a href="http://opensourcebridge.org/sessions/1378" target="_blank">NerdCred++; How to Customize your Bash Prompt</a>".

<span class="more"></span>

After the session I dug into customizing my bash prompt. After doing a lot of manual editing I ended up just forking and implementing Michael Gonderman's (<a href="https://twitter.com/magicmonty" target="_blank">@magicmonty</a>) <a href="https://github.com/Adron/bash-git-prompt" target="_blank">bash-git-prompt</a>. The way to get this installed is pretty simple, albeit it does include a few steps (<em>and yes, the <a href="https://github.com/Adron/bash-git-prompt/blob/master/README.md" target="_blank">README.md</a> basically has the instructions, but I've copied them here just to discuss and for ease of readability). </em>Another key points of reference include Sebastian Celis's (<a href="https://twitter.com/scelis" target="_blank">@scelis</a>) "<a href="http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/" target="_blank">A zsh prompt for git users</a>" on his <a href="http://sebastiancelis.com/" target="_blank">blog</a>.

<!--more-->First clone the repo (even though I've forked it I still pulled directly from

```shell-script
$ cd ~
$ git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
```

To verify that it is cloned ok, source the gitprompt.sh file from bash. It should immediately dive into a new prompt with a check mark and current directory, with the time immediately under that. Sweet, that worked!

```shell-script
$ source ~/.bash-git-prompt/gitprompt.sh
✔ ~
10:48 $
```

Where the check mark is where git changes will display when navigating into a directory path that is a git repository and making changes. The format will look something like (<branch> <branch tracking>|<local status>). The symbols on the prompt, when working with git are as follows:

✔: repository clean
●n: there are n staged files
✖n: there are n unmerged files
✚n: there are n changed but unstaged files
…n: there are n untracked files
⚑n: there are n stash entries
↑n: ahead of remote by n commits
↓n: behind remote by n commits
↓m↑n: branches diverged, other by m commits, yours by n commits

The next step is to make this permanent. Open up your ~/.bashrc file (or whichever you use, in my case I'm using ~./bash_profile, so be sure to figure out which one your system is using to actually load your bash). In the bash file add a single line to source the gitprompt.sh file.

```shell-script
# a bunch of other stuff in the file, whatever it might be... etc., etc.

source ~/.bash-git-prompt/gitprompt.sh
```

I've added some links below that add additional options to customize your bash prompt (thank Pamela & Rachel). Even though all of this might seem like such a small little thing, having that extra information readily displayed on the prompt can be a huge time saver. Especially if you're regularly in the code, committing from TDD or BDD practices or even just paired with somebody going through doing a refactor. It can be HUGE time saver, it definitely has for me.

...and thanks to ALL that gave me the motivation & for putting together the presentation and code for the prompt. Props to <a href="https://twitter.com/scelis" target="_blank">@scelis</a>, <a href="https://twitter.com/pmocampo" target="_blank">@pmocampo</a>, <a href="https://twitter.com/raychatter" target="_blank">@raychatter</a> & the others that have contributed to making bad ass bash prompts!

Enjoy!

## Resources:

Pamela & Rachel's Slide Deck & Additional Information:

* <a href="http://pamo.github.io/nerdcred/slides/#/" target="_blank">Slide Deck</a></li>
* <a href="http://pamo.github.io/nerdcred/" target="_blank">Additional Info from Pamela & Rachel</a></li>
* <a href="https://www.kirsle.net/wizards/ps1.html" target="_blank">Bash $PS1 Generator 2.0</a></li>
* <a href="http://andrewray.me/bash-prompt-builder/" target="_blank">Bash Prompt Builder</a></li>
* <a href="http://ezprompt.net/" target="_blank">Ez Prompt</a></li>
