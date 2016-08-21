---
title: Quick Append to Text File with BASH
author: Adron Hall
date: 2016-03-14
template: article.jade
---
I commonly have the scenario where I want a bash script to throw in something at the tail end of the ~/.bash_profile or ~/.profile script or just append some results like a log file to some existing text file. Well here are two super easy ways to add text to a text file.

Method one, using echo to append the text with the I/O redirection to the text file like this.

    echo "line 1" >> greetings.txt

or even like this

    echo "line 1
    line 2
    line 3" >> greetings.txt

Method two, using cat to read until EOT and redirect it to append to text file.

    cat <<EOT >> greetings.txt
    line 1
    line 2
    line 3
    EOT

That’s it, easy peasy. Enjoy your shell hacking!
