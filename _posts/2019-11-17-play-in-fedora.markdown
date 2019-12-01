---
layout: post
title:  "Some Note for work in Fedora/CentOS/RHEL"
date:   2019-11-17 12:47:00
categories: linux, fedora, dnf
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

# show hidden group
dnf grouplist --hidden

# download srpm
dnf download --source kernel

# only use this repo
dnf --disablerepo="*" --enablerepo="fedora" search glibc

# list package content
dnf repoquery -l podman

# install build dependency
dnf builddep systemd

# which depend podman
dnf repoquery --whatrequires podman

# podman depends which
dnf deplist podman

# install java # see: https://docs.fedoraproject.org/en-US/quick-docs/installing-java/
dnf install java-1.8.0-openjdk-devel

{% endhighlight %}

See also fedora magazine RPM packages series [1][rpm1],[2][rpm2],[3][rpm3]


## flatpak

### fix CJK font missing in telegram
see: https://github.com/flathub/org.telegram.desktop/issues/63

[key-link]: https://cinhtau.net/2016/12/22/import-and-remove-gpg-key-with-rpm/
[rpm1]: https://fedoramagazine.org/rpm-packages-explained/
[rpm2]: https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/
[rpm3]: https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/

