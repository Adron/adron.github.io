---
title: Best Practice Way To Install Nodejs
author: Adron Hall
date: 2016-07-02:17:37:03
template: doc.jade
---
The latest, quickest, and easiest way to insure a clean install of Node.js is to use nvm. The Node Version Manager harkens to the rvm or Ruby Version Manager, basically managing which version or versions you have on your computer. First install nvm using curl as shown.

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

Then install node.js like this.

    nvm install stable

Then set the default version for use.

    nvm alias default stable

Once this is all installed, check the version of node.js with the following command.

    node --version

To see what versions are available for installation, run the following command with nvm.

    nvm ls-remote

To install a particular version.

    nvm install 4.2.1

Then list the installed versions.

    nvm ls

Then use the version just installed. This however is just temporary, as it will revert back to whichever is installed as the default version.

    nvm use 4.2.1

To set this version as the default issue this command.

    nvm alias default 4.2.1
