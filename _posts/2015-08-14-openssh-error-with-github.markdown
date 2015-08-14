---
layout: post
title:  "Github \"protocol error: bad line length character\""
date:   2015-08-14 11:15:00
categories: openssh github
---
Recently, I found error in push to my Github repos, things like this:

{% highlight sh %}
$ git clone git@github.com:pendulm/OrgNote.git
Cloning into 'OrgNote'...
fatal: protocol error: bad line length character: this
{% endhighlight %}

It's a confusing message. Google for this only get some discussion about gitlab. I even suspect it's a disruption from `GFW`, but everything is OK in another PC of mine, so there are something wrong in my local setting.

Actually, it a obscure setting in my ssh config file.

> LocalCommand echo this is %n
>
> PermitLocalCommand yes

I add it for curiosity when I found these options in [document] of `openssh`. when I comment the `LocalCommand` line, Github is back.

This is useless an option, as demonstrated.


[document]: http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man5/ssh_config.5
