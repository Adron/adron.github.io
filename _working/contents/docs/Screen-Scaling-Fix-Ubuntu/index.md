---
title: That Scaling Frustration Fix in Ubuntu Linux
author: Adron Hall
date: 2016-07-02:17:43:04
template: doc.jade
---
![Hadron Collidor](hadron-collider.png)

If you're dorking around with the resolution and scaling settings in Ubuntu it's a good idea to have this particular command available.

    dconf reset /com/ubuntu/user-interface/scale-factor

This command will reset the configuration to the default scaling factor. So if you've accidentally set the scale to something like 4 and all you can do is get to a bash, then you're set. This is the command that will get you back in action.