---
title: Docker Tips n' Tricks - Bash Things With Docker
author: Adron Hall
date: 2016-03-10
template: article.jade
---
If you use Docker frequently, you've likely memorized a few repetitive commands...

    docker-machine start XyZvirtualMachine

Then you run...

    docker-machine env XyZvirtualMachine

...and then you type...

    eval $(docker-machine env XyZvirtualMachine)

<span class="more"></span>

One does this about a zillion times if there are multiple virtual machines or for other various reasons. I wanted to simplify this repetitive task so I wrote a bash function, thanks to a <a href="http://stackoverflow.com/questions/35761480/scripting-docker-not-connected-after-running-script" target="_blank">fumble I posted on Stackoverflow</a> and then an assist by my good friend Troy Howard (<a href="https://twitter.com/thoward37" target="_blank">@thoward37</a>).

This quick hack consisted of this <a href="https://gist.github.com/Adron/8dc06eb398f403225daa" target="_blank">Github gist</a>.

    gimmedocker() { if [ $1 ]; then
        docker-machine start $1
        docker-machine env $1
        eval $(docker-machine env $1)
        docker ps -a
    fi }

Stick that in your ~/.bash_profile (or ~/.bashrc if you're on *nix) and you're good to go. Then at the bash prompt just type in this.

    gimmedocker XyZvirtualMachine

BOOM! Less typing for the win!