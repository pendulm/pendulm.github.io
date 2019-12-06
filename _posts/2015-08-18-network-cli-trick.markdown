---
layout: post
title:  "Some Internet command line tricks"
date:   2015-08-19 22:30:00
categories: network
---

## Get my Internet ip address after NAT
{% highlight sh %}
curl www.ip.cn
curl ifconfig.me
curl ifconfig.me
dig +short myip.opendns.com @resolver1.opendns.com # UDP
{% endhighlight %}


## Get all IP address range of an AS
{% highlight sh %}
whois -h asn.shadowserver.org prefix $asnumber
{% endhighlight %}


## Get AS number which  IP address belong
{% highlight sh %}
whois -h whois.cymru.com $ip
{% endhighlight %}

## get ip announcement information
{% highlight sh %}
curl  "https://stat.ripe.net/data/looking-glass/data.json?resource=140.205.1.0/24"
{% endhighlight %}

## monitor tcp metrics
{% highlight sh %}
hping3 www.baidu.com -S -p 80 -i u10000
{% endhighlight %}

## get curl time decompose
{% highlight sh %}
curl -s -o /dev/null -w  '%{time_namelookup}\
     %{time_connect}\
     %{time_appconnect}\
     %{time_pretransfer}\
     %{time_starttransfer}\
     %{time_total}'  "$URL"
{% endhighlight %}

## scan port of a list of host
{% highlight sh %}
nmap -iL ip.txt -p 12200 -oG output
{% endhighlight %}

## advance network tools
- [nmap](https://nmap.org/)
- [ncat](https://nmap.org/ncat/)
- [nping](https://nmap.org/nping/)
- [hping3](http://www.hping.org/)
- [socat](http://www.dest-unreach.org/socat/)
- [sstunnel](https://www.stunnel.org/)
- [iperf3](https://iperf.fr/)
- [vegata](https://github.com/tsenart/vegeta)
- [packetdrill](https://github.com/google/packetdrill)
