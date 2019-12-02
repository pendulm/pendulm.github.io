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

$ bpftrace -e 'kprobe:arch_ptrace {printf("%d %p %ld %ld %ld\n", pid, arg0, arg1,arg2,arg3)}'
Attaching 1 probe...
2273 0xffff8ba3a1a71f40 16896 0 1
2273 0xffff8ba3a1a71f40 12 0 824634150384
2273 0xffff8ba3a1a71f40 13 0 824634150384
2273 0xffff8ba3a1a71f40 17 0 0
{% endhighlight %}

