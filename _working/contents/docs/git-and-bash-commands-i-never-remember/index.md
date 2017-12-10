---
title: Git and Bash Commands I Never Remember
author: Adron Hall
date: 2017-05-17:15:47:07
template: doc.jade
---
### Generating a New ssh Key.

<script src="https://gist.github.com/Adron/9a6955d88ee9f14a5c388638291f1704.js"></script>

### Setting a Git branch to Track to a Remote.

Given a branch localfoo, the first command shown is for tracking to the remote upstream. The second shows the command if setting without the localfoo being the current branch.

<script src="https://gist.github.com/Adron/025d88548527d107c272e836ab9e0cc6.js"></script>

Longform Git Branch Tracking Commands.

<script src="https://gist.github.com/Adron/d9c6fc041f01f1b298bbea9793de3bb3.js"></script>

How to free up space when the boot disk gets full form kernal installations and such.

First find packages.

```
dpkg -l linux-image*
```

Identify the kernal version in use.

```
uname -r
```

Delete the old kernals.

sudo apt-get remove linux-image-4.4.0-{101,103}-server
sudo apt-get remove linux-image-4.8.0-{36,56,58}-server

