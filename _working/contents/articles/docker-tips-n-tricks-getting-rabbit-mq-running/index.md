---
title: Docker Tips n' Tricks - Gettging Rabbit MQ Running
author: Adron Hall
date: 2015-11-10 17:09:33
template: article.jade
---
There are a few clean ways to get started running  RabbitMQ with Docker. The easiest is of course just to grab the Kitematic UI and pull the repo and start it. However, here are the actual commands to get the Rabbit MQ started from the command line.

```
docker run -d -p 5672:5672 -p 15672:15672 dockerfile/rabbitmq
```

If you want persistent shared directories, then make sure to run the command like this.

```
docker run -d -p 5672:5672 -p 15672:15672 -v <log-dir>:/data/log -v <data-dir>:/data/mnesia dockerfile/rabbitmq
```

Now that the instance is up and running, you can get to work playing around and using RabbitMQ on your new docker container.

