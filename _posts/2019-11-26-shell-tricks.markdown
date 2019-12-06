---
layout: post
title:  "Shell Tricks Note"
date:   2019-11-26 20:04:00
categories: shell
---

## Bash

file descriptor with bash
see: https://unix.stackexchange.com/questions/131801/closing-a-file-descriptor-vs

{% highlight shell %}
# read open a file
exec 3< /etc/passwd

# write open a file
exec 4> foo

# dup a read fd
exec 5<&3

# dup a write fd
exec 6>&4

# close read open
exec 3<&-

# close write open
exec 4>&-

{% endhighlight %}

play with two files
see: https://stackoverflow.com/questions/1016244/unix-command-to-find-string-set-intersections-or-outliers

{% highlight shell %}
# intersect with two sorted file
comm -12 file1 file2

# intersect two unsorted file
grep -Fx -f file1 file2
sort file1 file2 | uniq -d

# Left unique file1 from file2
comm -23 <(sort -u file1) <(sort -u file2)

{% endhighlight %}
