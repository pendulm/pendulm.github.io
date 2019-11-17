---
layout: post
title:  "Some Note for work in Fedora/CentOS/RHEL"
date:   2019-11-17 12:47:00
categories: linux
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


## Package install

{% highlight sh %}
# install base development tools
sudo dnf groupinstall --skip-broken "C Development Tools and Libraries"

{% endhighlight %}


[key-link]: https://cinhtau.net/2016/12/22/import-and-remove-gpg-key-with-rpm/
