---
title: dev boxes
author: Adron Hall
date: 2017-08-28 14:06:22
template: article.jade
---

I work on and off in maintaining two repositories I use to simplify creation of and installation of software on development machines. The two repostiories have a focus on Ubuntu and MacOS Specifically. The reason is that those are the two operating systems that I tend to do development on the most (or, use development tools on, not do development for, that tends to be Alpine or a related Linux Server OS).

I've been using a number of commands that I wanted to post here, just to provide a collection of them in one place, that I use most often during setup. If you have them all memorized, it probably won't help you one bit, but if you're mere mortal as most of us, they might be useful.

<span class="more"></span>

Determine what version of Ubuntu you're running.
```
lsb_release -a
```
Determine what version of MacOS you're running. This one has a few options which can show a range of information about versions.
```
adron$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.12.6
BuildVersion:	16G29
```
To get just the OS version, add the `-productVersion` switch.
```
adron$ sw_vers -productVersion
10.12.6
```
Then there is this monster, which provides a lot of additional version information.
```
adron$ system_profiler SPSoftwareDataType
Software:

    System Software Overview:

      System Version: macOS 10.12.6 (16G29)
      Kernel Version: Darwin 16.7.0
      Boot Volume: Pile
      Boot Mode: Normal
      Computer Name: Adron’s iMac
      User Name: Adron Hall (adron)
      Secure Virtual Memory: Enabled
      System Integrity Protection: Enabled
      Time since boot: 4:27
```



<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>
