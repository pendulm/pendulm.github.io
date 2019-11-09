---
layout: post
title:  "Use wine in Fedora 31"
date:   2019-11-09 12:27:00
categories: linux
---

I installed Fedora 31 in my laptop recently, and all my computer run with system of MacOS or Linux system. But I need run a windows application for register some apply.

I tried install a Windows XP in my VirtualBox, but it was too old to use. So I had to try wine. The experience is somehow smoothly, I'd like to share with you.

## Install Wine
Nothing special In Fedora 31

{% highlight sh %}
sudo dnf install wine
{% endhighlight %}

Wine has a large dependencies, Fedora has split up packages in small installations, you can refer the WIKI: https://docs.fedoraproject.org/en-US/quick-docs/wine/

All wine file get installed in $HOME/.wine when you first run a wine program, like WineMine which a mine game for Windows. You can explore wine folder and you'll recall some memory in Windows.

## Install winetricks
I use wine to run my windows program, and it failed, complained with: "import_dll Library MFC42.DLL not found", so something missing. It's not surprising some Windows program forget to include library which dependent, So there is a tool called winetricks to fix this problem

{% highlight sh %}
winetricks dlls list
winetricks dlls mfc42
{% endhighlight %}


## Run it
{% highlight sh %}
wine something.exe
{% endhighlight %}

that works!
