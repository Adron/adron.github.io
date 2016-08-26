---
title: how ya linux 0001 generate regenerate ssh key
author: Adron Hall
date: 2016-08-26
template: article.jade
---
Sometimes while working with the various ssh keys you have you might need to regenerate them. Specifically I ran into this need while working with some Google Cloud Platform (GCP) instances with Terraform and GCP's *gcloud* CLI tool. Generally, when you start working with the *gcloud* CLI it will, upon need if it doesn't exist, create a key for you. When it does so it sticks the key it generates in the `~/.ssh/` directory and names the key `google_compute_engine`. To create a new ssh key pair here, navigate to the `~/.ssh/` directory and issue the following command.

  sudo ssh-keygen -t rsa -f ~/.ssh/google_compute_engine -C you_fancy_username@whatever.com



<span class="more"></span>
