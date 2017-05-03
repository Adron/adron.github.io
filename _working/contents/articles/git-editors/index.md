---
title: Four Quick Git Tips (AKA Things I Always Forget and Have to Look Up)
author: Adron Hall
date: 2017-05-03 11:02:58
template: article.jade
---
Are you ever working in git, then all of a sudden you do a pull or push and boom, you've got a request to make a merge text file. Often this pops up as VI or Nano on Linux. But it can depend based on what editor is actually set. Did you know you could set the editor? Obviously you can right? Here's the details on getting that done in git.

<span class="more"></span>

## 1

Want Atom as your editor to make merge comments and errata in?

<script src="https://gist.github.com/Adron/d86eac58a61b726ea8f1e416a386a32b.js"></script>

How about Sublime?

<script src="https://gist.github.com/Adron/296050d3f6dde3e6f7245aa56324230a.js"></script>

You get the idea. Basically, whatever editor you want just issue the command to change the git config so it can launch that editor via a CLI call.

## 2

Moving beyond the mere merge editor, we can also set the merge IDE or editor. This can help dramatically if you're digging through merge conflicts regularly or needing to run diffs on code. For instance, let's set Intellij as the merge and diff tool. Open up the ~/.gitconfig file and add the respective snippets.

<script src="https://gist.github.com/Adron/b650ef841453ca676d247105eb684a3b.js"></script>

## 3

Another git helper, is setting up autocomplete for your shell.

<script src="https://gist.github.com/Adron/5fb1e87e7dd18cf3330ba24671d522f3.js"></script>

Some of my crew uses zsh, so if you're one of those users the steps involve a bit more. Add the following to your `~/.zshrc` file.

<script src="https://gist.github.com/Adron/30d8555ad25c12049e05d899aaea364e.js"></script>

## 4

Gah, seriously, type less already. Alias git to the 'g' key. Add the following to your .bashrc or .zshrc:

```
alias g='git'
```

To enable Git Autocompletion as previously stated, complete this additional step. Add this to your `.bashrc` or `.zshrc`.

<script src="https://gist.github.com/Adron/c2ccc9b27e165c7d282e4d776a03422f.js"></script>

That's it for my quick tips list. I'd been wanting to put this short list together since these are things I always forgot how to do when setting up git on a new machine and am tired of looking them up. So now, I've got em' all right here!

Cheers,
Happy git-ing and coding - Adron