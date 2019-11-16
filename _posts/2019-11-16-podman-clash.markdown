---
layout: post
title:  "Use clash in Fedora with podman"
date:   2019-11-16 17:43:00
categories: linux
---

I use clash for proxy management, and run clash in containers. In Linux, it's common run containers with docker, but In fedora 31 a switch from [CgroupV1 to CgroupV2][switch], and [docker broken][docker-broken].

So, it's time to just use [podman][podman] for running containers. Podman is an alternative container runtime with some extra attention, the most significant of it is rootless container.


## Migrate

Start Container mannully is awkward because we need pass a lot of options to docker, and docker-compose let us use a file to achieve that goal with less pain.

clash give a example [docker-compose.yml][clash-example] you can just type `docker-compose up -d` in the config folder, we want use podman like that way.

Luckily, there is a project called [podman-compose][podman-compose], we can use docker-compose file with this tool. There are some obscure differents in docker-compose and podman-compose, for example: service is create as a pod, all network is setup in the pause container, all other containers share network namespace with this pause container.

When you started compose file, you get an error:

> Error: name clash is in use: container already exists

this is the pod container name conflict with clash container, so we need change the container name to `clash-1`

## Security Matters
run Podman-compose again, clash complainted with:

> time="2019-11-16T10:41:34Z" level=fatal msg="Parse config error: Configuration file /root/.config/clash/config.yaml is empty"

and check system log we got:
> audit[8440]: AVC avc:  denied  { read } for  pid=8440 comm="clash" name="config.yaml" dev="dm-2" ino=5374461 scontext=system_u:system_r:container_t:s0:c330,c358 tcontext=system_u:object_r:container_file_t:s0:c315,c750 tclass=file permissive=0

something wrong with SElinux, check the config and the clash process

{% highlight sh %}
$ ls -lZ
total 52
-rw-rw-r--. 1 mike mike unconfined_u:object_r:user_home_t:s0 46065 Nov 16 18:42 config.yaml
-rw-rw-r--. 1 mike mike unconfined_u:object_r:user_home_t:s0   438 Nov 16 18:40 docker-compose.yml
$ ps -efZ|grep clash
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 mike 8943 5555  0 18:48 pts/3 00:00:00 grep --color=auto clash
{% endhighlight %}

the context mismatch, it a security enforcement that processes in container can't access files belong to host, when we need share file to container we must set a special mount option and let podman to label the content which allow container access with. We can change the volume Configuration to this:

{% highlight yaml %}
volumes:
      - ./config.yaml:/root/.config/clash/config.yaml:Z
{% endhighlight %}

Now, podman-compose starts clash container and it works.

## Start-up Automatically
podman is a deamonless container runtime, when you reboot the host, all podman container stopped. If you want your clash container in the background when you boot the host you must run it with systemd.

a [systemd user service][systemd-user] is fine with this usage.

podman support this with `podman-generate`:
{% highlight sh %}
$ podman generate systemd --files --name clash
/home/mike/.config/systemd/user/pod-clash.service
/home/mike/.config/systemd/user/container-clash-1.service
$ pwd
/home/mike/.config/systemd/user
$ systemctl --user enable pod-clash
Created symlink /home/mike/.config/systemd/user/multi-user.target.wants/pod-clash.service → /home/mike/.config/systemd/user/pod-clash.service.
{% endhighlight %}


[switch]: https://www.redhat.com/sysadmin/fedora-31-control-group-v2
[docker-broken]: https://medium.com/nttlabs/cgroup-v2-596d035be4d7 
[podman]: https://podman.io/
[clash-example]: https://github.com/Dreamacro/clash/wiki/Run-clash-in-docker
[podman-compose]: https://github.com/containers/podman-compose 
[systemd-user]: https://www.brendanlong.com/systemd-user-services-are-amazing.html
