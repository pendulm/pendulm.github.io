---
layout: post
title:  "Some Note for work in Fedora/CentOS/RHEL"
date:   2019-11-17 12:47:00
categories: fedora
---

## RPM keys management

import and remove gpg key with rpm: [ref][key-link]

{% highlight sh %}
# import
rpm --import ***

# query
rpm -q gpg-pubkey
rpm -qi gpg-pubkey-*

# remove
rpm --erase --allmatches gpg-pubkey-*-*

{% endhighlight %}


## Package Management

{% highlight sh %}
# install base development tools
dnf groupinstall --skip-broken "C Development Tools and Libraries"

# install virtual tools 
# see: https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
dnf install @virtualization

# remove old kernel
dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q)

edit /etc/dnf/dnf.conf and set installonly_limit=2

# install extra module (eg: netem)
dnf install  kernel-modules-extra

# show hidden group
dnf grouplist --hidden

# download srpm
dnf download --source kernel

# only use this repo
dnf --disablerepo="*" --enablerepo="fedora" search glibc

# list repo
dnf repolist

# disable repo
dnf config-manager --set-disabled zerotier tailscale-stable
# see: https://docs.fedoraproject.org/en-US/Fedora/23/html/System_Administrators_Guide/sec-Managing_DNF_Repositories.html
sudo dnf --disablerepo="*" --enablerepo="tailscale-stable" update tailscale

sudo dnf --disablerepo="*" --enablerepo="zerotier" update zerotier-one

# list package content
dnf repoquery -l podman

# install build dependency
dnf builddep systemd

# which depend podman
dnf repoquery --whatrequires podman

# podman depends which
dnf deplist podman

# search file in which repo
dnf provides *netem*

# install java # see: https://docs.fedoraproject.org/en-US/quick-docs/installing-java/
dnf install java-1.8.0-openjdk-devel

{% endhighlight %}

dnf configuration example

{% highlight txt %}
[main]
gpgcheck=1
installonly_limit=2
max_parallel_downloads=10
clean_requirements_on_remove=True
proxy=http://192.168.99.1:7890
{% endhighlight %}

See also fedora magazine RPM packages series [1][rpm1],[2][rpm2],[3][rpm3]

## flatpak

### fix CJK font missing in telegram
see: https://github.com/flathub/org.telegram.desktop/issues/63


### use flatpak in toolbox
see: https://github.com/containers/toolbox/issues/147

## Debug

### enable kdump
[https://fedoraproject.org/wiki/How_to_use_kdump_to_debug_kernel_crashes](https://fedoraproject.org/wiki/How_to_use_kdump_to_debug_kernel_crashes)

## Other
### grub
https://www.thegeekdiary.com/centos-rhel-7-how-to-modify-grub2-arguments-with-grubby/

[key-link]: https://cinhtau.net/2016/12/22/import-and-remove-gpg-key-with-rpm/
[rpm1]: https://fedoramagazine.org/rpm-packages-explained/
[rpm2]: https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/
[rpm3]: https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/

