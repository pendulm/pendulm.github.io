---
layout: post
title:  "Linux Dynamic Trace"
date:   2019-12-03 00:07:00
categories: Linux
---

## bpftrace

simple syscall inspect
{% highlight sh %}
$ bpftrace -e 'tracepoint:syscalls:sys_enter_ptrace {printf("%d %ld %ld %ld %ld\n", pid, args->request, args->pid, args->addr, args->data)}'
Attaching 1 probe...
2130 16 2051 0 0
2130 16896 2051 0 1
2130 12 2051 0 824634117616
2130 13 2051 0 824634117616
{% endhighlight %}

