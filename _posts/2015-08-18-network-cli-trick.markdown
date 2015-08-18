---
layout: post
title:  "Some Internet command line tricks"
date:   2015-08-19 22:30:00
categories: network
---

## Get my Internet ip address after NAT
{% highlight sh %}
curl www.ip.cn
{% endhighlight %}


## Get all IP address range of an AS
{% highlight sh %}
whois -h asn.shadowserver.org prefix $asnumber
{% endhighlight %}


## Get AS number which  IP address belong
{% highlight sh %}
whois -h whois.cymru.com $ip
{% endhighlight %}
