---
layout: post
title:  "Ptrace & Debugger"
date:   2019-11-25 19:06:00
categories: linux
---
# Ptrace
manpage：[http://man7.org/linux/man-pages/man2/ptrace.2.html](http://man7.org/linux/man-pages/man2/ptrace.2.html)

- Playing with ptrace（for i386，not work on x64）
  - Part I：[https://www.linuxjournal.com/article/6100](https://www.linuxjournal.com/article/6100)
  - Part II：[https://www.linuxjournal.com/article/6210](https://www.linuxjournal.com/article/6210)

## code example

- code_injection
  - [https://github.com/HotIce0/code_injection](https://github.com/HotIce0/code_injection)
  - post：[https://blog.csdn.net/u011580175/article/details/82831889](https://blog.csdn.net/u011580175/article/details/82831889)
- setns
  - [https://github.com/baloo/setns](https://github.com/baloo/setns)
- ptrace-call-userspace
  - [https://github.com/eklitzke/ptrace-call-userspace](https://github.com/eklitzke/ptrace-call-userspace)
- gtrace
  - [https://github.com/agis/gtrace](https://github.com/agis/gtrace)
- strace: ptrace kaleidoscope, the code is clear
  - [https://github.com/strace/strace](https://github.com/strace/strace)

# Debugger

- How debuggers really work
  - post：[https://opensource.com/article/18/1/how-debuggers-really-work](https://opensource.com/article/18/1/how-debuggers-really-work)
  - talk & code：[https://github.com/levex/debugger-talk](https://github.com/levex/debugger-talk)
- debugger in Go
  - [post 1](https://medium.com/@lizrice/a-debugger-from-scratch-part-1-7f55417bc85f)
  - [post 2](https://medium.com/@lizrice/a-debugger-from-scratch-part-2-9954006850bd)
- Writing a Linux Debugger
  - Part 1: Setup：[https://blog.tartanllama.xyz/writing-a-linux-debugger-setup/](https://blog.tartanllama.xyz/writing-a-linux-debugger-setup/)
  - Part 2: Breakpoints ：[https://blog.tartanllama.xyz/writing-a-linux-debugger-breakpoints/](https://blog.tartanllama.xyz/writing-a-linux-debugger-breakpoints/)
  - Part 3: Registers and memory ：[https://blog.tartanllama.xyz/writing-a-linux-debugger-registers/](https://blog.tartanllama.xyz/writing-a-linux-debugger-registers/)
  - Part 4: Elves and dwarves：[https://blog.tartanllama.xyz/writing-a-linux-debugger-elf-dwarf/](https://blog.tartanllama.xyz/writing-a-linux-debugger-elf-dwarf/)
  - Part 5: Source and signals ：[https://blog.tartanllama.xyz/writing-a-linux-debugger-source-signal/](https://blog.tartanllama.xyz/writing-a-linux-debugger-source-signal/)
  - Part 6: Source-level stepping：[https://blog.tartanllama.xyz/writing-a-linux-debugger-dwarf-step/](https://blog.tartanllama.xyz/writing-a-linux-debugger-dwarf-step/)
  - Part 7: Source-level breakpoints ：[https://blog.tartanllama.xyz/writing-a-linux-debugger-source-break/](https://blog.tartanllama.xyz/writing-a-linux-debugger-source-break/)
  - Part 8: Stack unwinding ：[https://blog.tartanllama.xyz/writing-a-linux-debugger-unwinding/](https://blog.tartanllama.xyz/writing-a-linux-debugger-unwinding/)
  - Part 9: Handling variables：[https://blog.tartanllama.xyz/writing-a-linux-debugger-variables/](https://blog.tartanllama.xyz/writing-a-linux-debugger-variables/)
  - Part 10: Advanced topics：[https://blog.tartanllama.xyz/writing-a-linux-debugger-advanced-topics/](https://blog.tartanllama.xyz/writing-a-linux-debugger-advanced-topics/)
- Julia Evans
  - How does gdb work?：[https://jvns.ca/blog/2016/08/10/how-does-gdb-work/](https://jvns.ca/blog/2016/08/10/how-does-gdb-work/)
  - How does gdb call functions?：[https://jvns.ca/blog/2018/01/04/how-does-gdb-call-functions/](https://jvns.ca/blog/2018/01/04/how-does-gdb-call-functions/)

# System Call

- LWN: Anatomy of a system call
  - [part 1](https://lwn.net/Articles/604287/)
- Packagecloud: The Definitive Guide to Linux System Calls
  - [https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/](https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/)
- StackOverflow: What are the calling conventions for UNIX & Linux system calls on i386 and x86-64
  - [https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-on-i386-and-x86-6](https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-on-i386-and-x86-6)

# Security
- PTRACE_TRACEME 本地提权漏洞解析
 - [https://paper.seebug.org/1087/](https://paper.seebug.org/1087/)


# ELF
- PLT and GOT - the key to code sharing and dynamic libraries
  - [https://www.technovelty.org/linux/plt-and-got-the-key-to-code-sharing-and-dynamic-libraries.html](https://www.technovelty.org/linux/plt-and-got-the-key-to-code-sharing-and-dynamic-libraries.html)
- tinylab
  - [上手 9 套工具，玩转二进制文件](https://tinylab.org/binary-tools/)
