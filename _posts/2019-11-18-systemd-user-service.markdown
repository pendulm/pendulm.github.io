---
layout: post
title:  "Systemd User Service"
date:   2019-11-17 12:47:00
categories: linux
---

Systemd is a powerful init-system which has a lot of feature set, hence [controversially][lwn-systemd].

User Service is a facility that enable non-root user to manage service with the huge feature set, in the [podman clash post]({% post_url 2019-11-16-podman-clash %}) we show how to run podman container with systemd user service, in this post we will explore more.

[ArchLinux wiki][arch-wiki] has a detailed content about Systemd user service, and should be recommended to read first.

## Unit File Example

We use a simple service called sleep333 to demonstrate

{% highlight sh %}
$ cat sleep333.service
[Unit]
Description=Sleep 333

[Service]
ExecStart=/usr/bin/sleep 333

[Install]
WantedBy=default.target
{% endhighlight %}

and save this file in your config folder

{% highlight sh %}
$ mkdir -p ~/.config/systemd/user
$ pwd
/home/mike/.config/systemd/user
$ ls
sleep333.service
{% endhighlight %}

enable the service
{% highlight sh %}
systemctl --user enable sleep333.service
{% endhighlight %}

That it, now you shoud expect sleep333 service is Automatic started after your user login the system and be killed when user logout.

## Automatical Issue
But I found the service wasn't started when user logout and relogin, something wrong again. After some effortless search I got this [issue][github-issue] which same as my problem, the solution is reenable service and reboot the system. After rebooted and user logined, the sleep333 service was started Automatically. In this issue I found some practical troubleshooting skill for systemd and should be highlighted in this post.

Archlinux wiki has this description:
> When a systemd user instance starts, it brings up the target default.target. Other units can be controlled manually with systemctl --user.
So how do we get current target and if the target is wrong that failed to start our service?

{% highlight sh %}
# get current target
$ systemctl --user -t target
UNIT           LOAD   ACTIVE SUB    DESCRIPTION
basic.target   loaded active active Basic System
default.target loaded active active Main User Target
paths.target   loaded active active Paths
sockets.target loaded active active Sockets
timers.target  loaded active active Timers

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

5 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.

# is sleep333 wanted by default.target, the dot is green if service is ok
$ systemctl --user list-dependencies default.target
default.target
● ├─sleep333.service
● └─basic.target
●   ├─paths.target
●   ├─sockets.target
●   │ └─dbus.socket
●   └─timers.target
●     └─grub-boot-success.timer

# get the service status
$ systemctl --user status sleep333.service
● sleep333.service - Sleep 333
   Loaded: loaded (/home/mike/.config/systemd/user/sleep333.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2019-11-18 01:55:37 CST; 1min 1s ago
 Main PID: 1501 (sleep)
    Tasks: 1 (limit: 2349)
   Memory: 216.0K
      CPU: 1ms
   CGroup: /user.slice/user-1000.slice/user@1000.service/sleep333.service
           └─1501 /usr/bin/sleep 333

Nov 18 01:55:37 fedora-vm systemd[1493]: Started Sleep 333.
{% endhighlight %}

Service is started when a new systemd user instance starts, if you login again in same instance the service will not be restarted or start a new one, this is often happended in [ssh connection multiplexing][ssh-controlmaster].

## Kill User Service When Logout
By default user service is not killed after user logout, set `KillUserProcesses` to yes in /etc/systemd/logind.conf to enable this behavior, and here we show how to verify it.

{% highlight sh %}
# show user session
$ ps -ef|grep user
root         923       1  0 01:03 ?        00:00:00 /usr/lib/systemd/systemd --user
mike        1493       1  0 01:55 ?        00:00:00 /usr/lib/systemd/systemd --user
root        1555     931  0 02:09 pts/0    00:00:00 grep --color=auto user

# logout
$ logout

# close ssh connection and check
MyHost ~> ssh -O exit mike@fedora29_vm
MyHost ~> ssh -O check mike@fedora29_vm

# In root session
# ps -ef|grep user
root         923       1  0 01:03 ?        00:00:00 /usr/lib/systemd/systemd --user
root        1562     931  0 02:11 pts/0    00:00:00 grep --color=auto user

# ps -ef|grep sleep
root        1564     931  0 02:12 pts/0    00:00:00 grep --color=auto sleep
{% endhighlight %}

[lwn-systemd]: https://lwn.net/Articles/804254/
[arch-wiki]: https://wiki.archlinux.org/index.php/Systemd/User
[github-issue]: https://github.com/systemd/systemd/issues/2690
[ssh-controlmaster]: http://man7.org/linux/man-pages/man5/ssh_config.5.html#ControlMaster
