---
title: Researching & Learning About Zookeeper - A Guide
author: Adron Hall
date: 2016-02-01 16:30
template: article.jade
---
I've started working with Zookeeper. Since I've started doing that I've put together this blog post. It's aim is to provide a structured approach to learning Zookeeper and researching the elements that make its features tick. Along the way I have a few call outs to people that have also provided excellent talks, material, or contributions to learning about Zookeeper along the way. With that, let's get started.

Zookeeper is a consensus system written based on ideas presented via consensus algorithms. The idea is key value stores that keep all of their data in memory for read heavy workloads. The qualities in this context present a system that is highly consistent, with intent for access from distributed systems to data that won't be lost.

<span class="more"></span>

### Start Learning

The starting point should be a complete read of the [Apache Zookeeper Project Home Page](https://zookeeper.apache.org/).

At this point I took an administrators' angle on determining what I needed to know and do next. I knew that my situation would meet the basic assumptions of reliability around Zookeeper; First is that only a minority of servers in a deployment would fail at a particular time or become inaccessible from a crash, partition, or related issue, and second is that deployed machines would have correctly operating clocks, storage, and network components that perform consistently.

I had also made an assumption that I would need <em><strong>2 x F + 1</strong> </em>machines in order to maintain data consistency. The F here is the number of failed or inaccessible machines. This meant that if I wanted to have 2 failures, I'd need at least 5 machines. For a failure of up to 3 machines, that would be 7 machines. Pretty easy, just a little simple math.

The other thing I was curious about, especially on a single machine, would be Zookeeper's overall overhead. Would it come into contention with the services that are already running? Would it be ok to put Zookeeper on the machines that run the micro-services that Zookeeper is providing information to? Well, Zookeeper does indeed content with other application for CPU, network, memory, and storage. For this reason I have to balance the deployment of Zookeeper in relation to the other applications, as my server loads may not be super high, and thus I'd be able to have Zookeeper on some of the servers that have actual other services deployed. But YMMV depending on your services you've got deployed.

While I was thinking through how I'd build out the architecture for my implementation of Zookeeper I came upon a very important note in the documentation,

> "ZooKeeper's transaction log must be on a dedicated device. (A dedicated partition is not enough.) ZooKeeper writes the log sequentially, without seeking Sharing your log device with other processes can cause seeks and contention, which in turn can cause multi-second delays.
>
> Do not put ZooKeeper in a situation that can cause a swap. In order for ZooKeeper to function with any sort of timeliness, it simply cannot be allowed to swap. Therefore, make certain that the maximum heap size given to ZooKeeper is not bigger than the amount of real memory available to ZooKeeper. For more on this, see Things to Avoid below."

After reading up on the following documentation it seemed like a good time to do a test deployment:

* <a href="https://zookeeper.apache.org/doc/trunk/zookeeperAdmin.html" target="_blank">Zookeeper Admin</a>
* <a href="https://zookeeper.apache.org/doc/trunk/zookeeperAdmin.html#sc_minimumConfiguration" target="_blank">Zookeeper Minimum Configuration</a>

**BEGIN BUG DESCRIPTION - 1ST DOCKER ATTEMPT**

NOTE: If you just want to get to the Zookeeper installation & setup and skip this issue, GOTO [here](#awsInstallation).

My first go was to pull up a clean Ubuntu docker image and prep it as a container. Then start installing the necessary parts of Zookeeper. These steps consisted of the following. I made a video for it (see toward the bottom of this entry), so you can actually see the flow and I also wrote the commands I'm tying in bash below. Then you can pick your preferred use.

    docker-machine start fusion-fire

Docker machine starts my virtual machine on OS-X that runs the Docker daemon, which I've named fusion-fire, thus the command above. Then after that I pulled down an Ubuntu image, started a container from the image, connecting to the container and all set for installation.

    docker pull ubuntu
    docker run -it ubuntu

To install the Zookeeper server and begin execution I then issued the following.

    sudo apt-get update
    sudo apt-get -Y install default-jdk

While this was executing I also ran into a situation where the Java Development Kit was hanging on getting the certificates put into place.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">The last dozen or so <a href="https://twitter.com/hashtag/Ubuntu?src=hash">#Ubuntu</a> <a href="https://twitter.com/hashtag/docker?src=hash">#docker</a> images I&#39;ve tried to run &quot;sudo apt-get install default-jre&quot; on have all ended up spiking the CPU.</p>&mdash; Λdrøn (@Adron) <a href="https://twitter.com/Adron/status/693219719441096704">January 29, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I began looking into this problem, and found currently on Ubuntu 14.04, running sudo-apt-get update and then running the install will trigger the bug. Two other points of reference are <a href="https://github.com/docker/docker/issues/18180" target="_blank">here</a>, <a href="https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/1396760" target="_blank">here</a>, and there are other postings and issues related to the issue, just google. So what I did at that point to fix this issue was the following.

First I forcefully killed the docker container by just restarting the whole docker VM.

    docker-machine stop fusion-fire
    docker-machine start fusion-fire

Once that stopped I then started the virtual machine again.

    sudo apt-get -y install default-jre

When it started I ran sudo apt-get install again. At that point apt-get attempted to recover but the install kept getting stuck on registering the certificates. So I gave up on this avenue for now. Hopefully a future Docker &amp; Linux Kernal fixes the problem. So instead I went out and just spooled up some AWS instances for now, I'll update this blog entry with a "Part II: Docker is Zookeeper Fixed" when the Java + Linux Kernal + Docker issue is remedied, until then, here's the installation process on the AWS instances.

<a name="awsInstallation"></a>
**END BUG DESCRIPTION - AWS Instance Zookeeper Installation**

Once this was setup I started 5 nano instances for Zookeeper (nano, since it's just a test example for learning) and then logged in using broadcast with iTerm 2. From there each instance had the following commands executed.

    sudo apt-get update
    sudo apt-get install -y default-jdk
    cd /opt/
    sudo mkdir zookeeper
    cd zookeeper/
    sudo wget http://mirror.tcpdiag.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
    sudo tar -zxvf zookeeper-3.4.6.tar.gz
    cd conf/
    sudo nano zoo.cfg

NOTE: Nano is the text editor I used above for "sudo nano zoo.cfg". If you don't have it available just install it with "sudo apt-get install nano".

In that zoo.cfg I entered the following. For the IPs I actually used the AWS private IPs for the config file example below.

> tickTime=2000
> dataDir=/var/zookeeper
> clientPort=2181
> initLimit=5
> syncLimit=2
> server.1=172.31.19.66:2888:3888
> server.2=172.31.19.67:2888:3888
> server.3=172.31.19.68:2888:3888
> server.4=172.31.19.69:2888:3888
> server.5=172.31.19.70:2888:3888

Now I started the service using the zkServer.sh script file.

    sudo /opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start-foreground

When I booted up I ran into an error about the myid file, so I added the file with a sequential number for the byid in the /var/zookeeper directory.

    sudo nano /var/zookeeper/myid

In each of the files I added a number, respectively 1 through 5 for the id of each and saved those files. Upon attempting to start the zookeeper service with the following command I finally got to see the various nodes in the ensemble gain access to each other and start working. Which, I gotta admit, was a pretty damn cool feeling.

After all that fussing it seemed good to note, especially since they're hard to find in the documentation (which is kind of a bit hard to use), here are some of the switches for zkServer.sh.

> start
> start-foreground (super useful for debugging)
> stop
> restart
> status
> upgrade
> print-cmd

Once this is done, restart the service but this time instead of using the start-foreground command, just use the start command and that will start the service and return the bash back to you to issues commands or whatnot. An easy way to test out Zookeeper now that it is running is to use the Zookeeper CLI. This is the zkCli.sh shell script (or zkcli.bat file if you're running it on windows - which I'd strongly suggest NOT to do).

Ok, that's it for this entry. More to come in the near future. Cheers!

**Excellent Additional References**

* <a title="raft" href="https://compositecode.files.wordpress.com/2016/01/raft.pdf">In Search of an Understandable Consensus Algorithm (Extended Version)</a> - Diego Ongaro &amp; John Ousterhout @ Stanford University
* <a title="paxos-simple" href="https://compositecode.files.wordpress.com/2016/01/paxos-simple.pdf">Paxos Made Simple</a> by Leslie Lamport
* Camille Fournier (<a href="https://twitter.com/skamille" target="_blank">@skamille</a>) provided an excellent talk about <a href="http://www.infoq.com/interviews/fournier-consensus" target="_blank">Zookeeper (Consensus Systems) on InfoQ</a>. In this talk Camille also mentions the <a title="chubby-osdi06" href="https://compositecode.files.wordpress.com/2016/01/chubby-osdi06.pdf">The Chubby Lock Service for Loosely Coupled Distributed Systems</a>.
* <a href="https://youtu.be/j4uwKP7WJFk" target="_blank">Zookeeper for the Skeptical Architect by Camille Fournier</a> - RICON East 2013
<iframe width="560" height="315" src="https://www.youtube.com/embed/j4uwKP7WJFk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
Talks about why Riak, Cassandra, and even the company Camille works at (Rent the Runway) doesn't use Zookeeper. An interesting talk from the regard of why not to use it in some cases.