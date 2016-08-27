---
title: Generate or Regenerate gcloud ssh Keys - How Ya Linux Series - 0001
author: Adron Hall
date: 2016-08-26
template: article.jade
---
Sometimes while working with the various ssh keys you have you might need to regenerate them. Specifically I ran into this need while working with some Google Cloud Platform (GCP) instances with Terraform and GCP's *gcloud* CLI tool. Generally, when you start working with the *gcloud* CLI it will, upon need if it doesn't exist, create a key for you. When it does so it sticks the key it generates in the `~/.ssh/` directory and names the key `google_compute_engine`. To create a new ssh key pair here, navigate to the `~/.ssh/` directory and issue the following command.

        sudo ssh-keygen -t rsa -f ~/.ssh/google_compute_engine -C you_fancy_username@whatever.com

Once that is command is executed, a few moments later and a few prompts later you'll have a new key.

        13:16 $ sudo ssh-keygen -t rsa -f ~/.ssh/google_compute_engine -C adron_hall@homedepot.comPassword:
        Generating public/private rsa key pair.
        /Users/axh6454/.ssh/google_compute_engine already exists.
        Overwrite (y/n)? y
        Enter passphrase (empty for no passphrase):
        Enter same passphrase again:
        Your identification has been saved in /Users/axh6454/.ssh/google_compute_engine.
        Your public key has been saved in /Users/axh6454/.ssh/google_compute_engine.pub.
        The key fingerprint is:
        SHA256:8xHVr19EdgPxLr2nWAkuZa8exMdEqbHNzoBxlHhFkZM adron_hall@ataplace.com
        The key's randomart image is:
        +---[RSA 2048]----+
        |           ooBB= |
        |          o.=.E.+|
        |          .= *.*o|
        |          .o+o= o|
        |        S . *=o= |
        |         o * +=.o|
        |          o o +oo|
        |           . = .o|
        |           .+ .  |
        +----[SHA256]-----+
        ✔ ~/.ssh
        13:16 $

That's it.
