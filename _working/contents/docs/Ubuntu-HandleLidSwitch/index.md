---
title: Ubuntu HandleLidSwitch
author: Adron Hall
date: 2016-07-02:17:45:26
template: doc.jade
---
![Hadron Collidor](hadron-collider.png)

I just purchased a new monitor, an LG 34" wide display monitor and want to be able to shut my XPS 13 Developer Edition laptop and set it under or out of the way of the screen and such itself. Well, it isn't a setting in settings (even though it ought to be). Instead, here's how to turn off the sleep when closed setting that otherwise prevents the laptop from working in the situation I detailed.

First open up logind.conf with sudo to insure you can save the file after making the necessary changes.

    sudo -H gedit /etc/systemd/logind.conf

Next, find the line in the file that has the setting for HandleLidSwitch and uncomment the line and change the setting to ignore.

    HandleLidSwitch=ignore

Then restart the systemd-logind process.

    sudo restart systemd-logind

The file should look like this now.

    #  This file is part of systemd.
    #
    #  systemd is free software; you can redistribute it and/or modify it
    #  under the terms of the GNU Lesser General Public License as published by
    #  the Free Software Foundation; either version 2.1 of the License, or
    #  (at your option) any later version.
    #
    # See logind.conf(5) for details
    
    [Login]
    #NAutoVTs=6
    #ReserveVT=6
    #KillUserProcesses=no
    #KillOnlyUsers=
    #KillExcludeUsers=root
    Controllers=blkio cpu cpuacct cpuset devices freezer hugetlb memory perf_event net_cls net_prio
    ResetControllers=
    #InhibitDelayMaxSec=5
    #HandlePowerKey=poweroff
    #HandleSuspendKey=suspend
    #HandleHibernateKey=hibernate
    HandleLidSwitch=ignore
    #PowerKeyIgnoreInhibited=no
    #SuspendKeyIgnoreInhibited=no
    #HibernateKeyIgnoreInhibited=no
    #LidSwitchIgnoreInhibited=yes
    #IdleAction=ignore
    #IdleActionSec=30min