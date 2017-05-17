---
title: Git and Bash Commands I Never Remember
author: Adron Hall
date: 2017-05-17:15:47:07
template: doc.jade
---
### Generating a New ssh Key.

```shell-script
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

### Setting a Git branch to Track to a Remote.

Given a branch localfoo, the first command shown is for tracking to the remote upstream. The second shows the command if setting without the localfoo being the current branch.

<script src="https://gist.github.com/Adron/025d88548527d107c272e836ab9e0cc6.js"></script>

Longform Git Branch Tracking Commands.

<script src="https://gist.github.com/Adron/d9c6fc041f01f1b298bbea9793de3bb3.js"></script>