---
layout: post
title:  "Linux Dynamic Trace"
date:   2019-12-03 00:07:00
categories: Linux
---

# BPF
- [BPF: A New Type of Software](http://www.brendangregg.com/blog/2019-12-02/bpf-a-new-type-of-software.html)
- [从DPDK和eBPF感受一下Smart NIC](https://blog.csdn.net/dog250/article/details/103301816)
- [how to add a bpf type: KRSI](https://lore.kernel.org/bpf/kcqxzhenen1b.fsf@jackmanb.zrh.corp.google.com/T/)
- [Writing BPF code in Rust](https://blog.redsift.com/labs/writing-bpf-code-in-rust/)
- [bpftrace 2020](https://mmi.hatenablog.com/entry/2020/12/02/031534)
- [Title iconeBPF Updates #1: eBPF Summit Coverage, libbpf 0.2, BTF Developments, Bulk API for XDP, Local Task Storage for eBPF LSM](https://ebpf.io/news/ebpf-updates-intro)
- [pingcap: Why We Switched from bcc-tools to libbpf-tools for BPF Performance Analysis ](https://en.pingcap.com/blog/why-we-switched-from-bcc-tools-to-libbpf-tools-for-bpf-performance-analysis)
- [bpftrace 2020](https://mmi.hatenablog.com/entry/2020/12/02/031534)
- [Part 1: Debugging Go in prod using eBPF](https://blog.pixielabs.ai/ebpf-function-tracing/post/)
- [Part 2: Full body HTTP request/responses tracing using eBPF](https://blog.pixielabs.ai/ebpf-http-tracing/)
- [Tracing Go Functions with eBPF Part 1](https://www.grant.pizza/blog/tracing-go-functions-with-ebpf-part-1/)
- [Tracing Go Functions with eBPF Part 2](https://www.grant.pizza/blog/tracing-go-functions-with-ebpf-part-2/)
- [1. An eBPF overview, part 1: Introduction](https://www.collabora.com/news-and-blog/blog/2019/04/05/an-ebpf-overview-part-1-introduction/)
- [An eBPF overview, part 2: Machine & bytecode](https://www.collabora.com/news-and-blog/blog/2019/04/15/an-ebpf-overview-part-2-machine-and-bytecode/)
- [An eBPF overview, part 3: Walking up the software stack](https://www.collabora.com/news-and-blog/blog/2019/04/26/an-ebpf-overview-part-3-walking-up-the-software-stack/)
- [An eBPF overview, part 4: Working with embedded systems](https://www.collabora.com/news-and-blog/blog/2019/05/06/an-ebpf-overview-part-4-working-with-embedded-systems/)
- [An eBPF overview, part 5: Tracing user processes](https://www.collabora.com/news-and-blog/blog/2019/05/14/an-ebpf-overview-part-5-tracing-user-processes/)
- [How to Trace Linux System Calls in Production with Minimal Impact on Performance](https://pingcap.com/blog/how-to-trace-linux-system-calls-in-production-with-minimal-impact-on-performance)
- [Tips and Tricks for Writing Linux BPF Applications with libbpf](https://pingcap.com/blog/tips-and-tricks-for-writing-linux-bpf-applications-with-libbpf)
- [Features of bpftool: the thread of tips and examples to work with eBPF objects](https://qmonnet.github.io/whirl-offload/2021/09/23/bpftool-features-thread/)



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

$ bpftrace -e 'kretprobe:arch_ptrace { printf("%d\n", retval) }'
Attaching 1 probe...
0
0
0
0
{% endhighlight %}

SEE MORE: [bpftrace git doc](https://github.com/iovisor/bpftrace/tree/master/docs)

# USDT
- [Exploring USDT Probes on Linux](https://leezhenghui.github.io/linux/2019/03/05/exploring-usdt-on-linux.html)
- [Installing debugging tools into a Red Hat OpenShift container with oc-inject](https://developers.redhat.com/blog/2020/01/15/installing-debugging-tools-into-a-red-hat-openshift-container-with-oc-inject/)
- [GDB and SystemTap probes -- part 1](https://blog.sergiodj.net/2012/03/29/gdb-and-systemtap-probes-part-1.html)
- [GDB and SystemTap Probes -- part 2](https://blog.sergiodj.net/2012/10/27/gdb-and-systemtap-probes-part-2.html)
- [GDB and SystemTap Probes -- part 3](https://blog.sergiodj.net/2012/11/02/gdb-and-systemtap-probes-part-3.html)


# Systemd
- [How to access global kernel struct](https://sourceware.org/systemtap/SystemTap_Beginners_Guide/targetvariables.html)
- [SystemTap Cheat Sheet](https://github.com/calio/systemtap-cheat-sheet)

