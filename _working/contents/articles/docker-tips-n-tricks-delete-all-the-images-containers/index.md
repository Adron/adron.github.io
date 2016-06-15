---
title: Docker Tips n' Tricks - Delete All The Images & Containers
author: Adron Hall
date: 2015-11-02
template: article.jade
---
Two simple commands that'll wipe your installation clean of images and containers.

Deletes all containers

    docker rm $(docker ps -a -q)

Deletes all images

    docker rmi $(docker images -q)