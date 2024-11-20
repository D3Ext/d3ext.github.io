---
layout: post
title: HackTheBox Bug Bounty Hunter - Course Review
---

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/bug_bounty/course_finish.png" alt="htb_image">

# Introduction

Hi there!

Today I bring you a **review of a the Bug Bounty Hunter course** offered by ***HackTheBox (HTB)***, which I have recently completed. I will discuss its main aspects, price and subscriptions, its content, the certification, my personal opinion, if it's worth or not, and more. Having said so, let's start with this review.

# Course main aspects

First of all, this is a course aimed to people who want to become bug bounty hunters (I will cover this later) and that's why most of the content is focused on how web works, web concepts, web vulnerabilities and so on. It's also really remarkable the fact that the course has been made in collaboration with ***HackerOne***, the most famous and probably the best bug bounty platform, and it actually allows its users to verify their Bug Bounty Hunter certification in their profiles so that it can increase their visibility in order to get invited to private programs. Or maybe in the future it gets even more value for hiring companies, who knows?

It contains 20 different modules with its own submodules and it's intended to take you about 18 days to complete it. Anyway, have in mind that it may vary depending on your previous knowledge. For example, in my case I skipped a few explanations because I already knew at 100% what I was going to be taught.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/bug_bounty/course_index.png" alt="index">

This course is also aimed for those who want to pass their Bug Bounty certification called ***CBBH***. In my case I haven't passed it yet because it obviously requires an exam voucher, which costs ***217 euros***, in order to take the exam. However it gives you 2 attempts so it's not much expensive considering the price of other certs from eLearnSecurity or OffensiveSecurity.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/bug_bounty/cbbh.webp" alt="cert_logo">

# Who is this course for?

As HackTheBox says on the description of this course: **"The Bug Bounty Hunter Job Role Path is for individuals who want to enter the world of Bug Bounty Hunting with little to no prior experience. This path covers core web application security assessment and bug bounty hunting concepts and provides a deep understanding of the attack tactics used during bug bounty hunting. Armed with the necessary theoretical background, multiple practical exercises, and a proven bug bounty hunting methodology, students will go through all bug bounty hunting stages, from reconnaissance and bug identification to exploitation, documentation, and communication to vendors/programs. Upon completing this job role path, you will have become proficient in the most common bug bounty hunting and attack techniques against web applications and be in the position of professionally reporting bugs to a vendor."**

Aside from that, I think that is such a great entry-point for those who want to start hunting bugs, or also for those who simply want to directly learn web pentesting. I would say that **you don't need to know almost anything about web vulnerabilities**, but it will certainly be much easier for you if you are already familiar with the basics of Linux as it is used all the time by running a wide variety of commands. And obviously, that is not covered in this course so in case you need it, you could start one of the other available courses. In my opinion, what HTB says about this path is right... but not at 100% and I will explain this later on this post.

# Do I recommend it?

Absolutely ***YES***.

However, I wanted to clarify one main aspect of the HTB Academy which made me get interested in it. The academy works with ***"cubes"*** and they work in the same way as if they were coins. You exchange them for single modules or the whole paths. Those cubes are obtained with real money and, to be honest, they are quite expensive. The good thing here is that they offer a ***Student subscription*** which is considerably cheaper and works completely different. Before explaining how it works you will obviously need an official student email. When I discoverd this plan I thought that it wouldn't recognize my email because its domain is not from a well-known university, but instead it got recognized automatically so I was able to take the student subscription.

What are the main aspects of this subscription?

The other HTB Academy pricing options are pretty much expensive in terms of price and the content you receive. The student option costs around 8 euros per month but you don't get cubes, instead you get access to all **Tier II**, which means, that **you will have access to multiple courses like Bug Bounty, Penetration Tester, SOC Analyst, Privilege Escalation and a lot of modules**.

On the other hand, if you pay the Silver monthly subscription you will only get 200 cubes which is not really much considering the massive amount of content the student subscription gives you.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/bug_bounty/pricing.png" alt="pricing">

Having discussed this, I would say that this course is worth but in case you can't access the student subscription maybe you prefer to save the money, that's up to you.

# Things that I liked

In this section I will discuss some of the things that I believe that are worth it to mention, I'm already taking for granted that in general terms this course is simply awesome. I won't cover everything I like as this post will never end.

First of all, this is a significant course for all those who want to learn web exploitation and maybe event pass the ***eWPT*** exam. Moreover, this path is beginner friendly and explain some basic concepts at the beginning. Even though, I recommend you to take a easier path before taking this one as it will provide you a much better understanding of Linux and how pentesting works. So in a few words, this is a course for beginners.

Now, one of the things that I absolutely love about HTB paths. On every module, you can take a look at a cheat sheet that they provide you. What I love is the fact that you can download that cheat sheet as a PDF which is really useful as you will always have interesting info and commands everything together in the same PDF, thus, this may help you to create your own personal notes. In my opinion is such a good feature.

This may seem obvious, but I'm glad that almost all of the modules have practical laboratories. This is essentially important because makes you work based on what they have taught you and in that way you won't probably forget the information or at least you will remember how you exploited it. In my opinion, all courses should be practical rather than full theory-based.

# Things that I didn't like

Before saying anything, I must say that the advantages are much more important than the disadvantages that I'm going to describe. First of all, the path is called "**Bug Bounty Hunter**". The exploitation of the different vulnerabilities are perfect as they teach you almost everything, but on the other side I would say that the recon is really based on classic pentesting like you would do on a HTB Machine. I'm not saying that it shouldn't be taught, but out there the real bug hunters use a lot of different techniques that they don't explain. For example, they rely too much on web fuzzing which is a great technique but it's obviously not the only way to discover assets of a target. You only have to take a look at some videos on YouTube or blog posts on the Internet to notice that bug hunters use some other techniques that may give you even better results in a half of the time. It's as simple as searching for [ProjectDiscovery](https://github.com/projectdiscovery) on GitHub and you will discover a bunch of tools designed for external recon. I won't give you a huge list of tools as it isn't the purpose of this post, but this ones are really useful: [subfinder](https://github.com/projectdiscovery/subfinder), [nuclei](https://github.com/projectdiscovery/nuclei), [dnsx](https://github.com/projectdiscovery/dnsx), [gau](https://github.com/lc/gau), [httpx](https://github.com/projectdiscovery/httpx), [gf](https://github.com/tomnomnom/gf), [dalfox](https://github.com/hahwul/dalfox), [wafw00f](https://github.com/EnableSecurity/wafw00f). You can also even create your own one-liners to automate certain tasks or even exploit vulnerabilities like XSS in-mass. Unluckily, they didn't include this on the path. In a few words, I personally believe that the reconnaissance could be more realistic and applied to real bugs.

The second thing that I didn't like about this course is that the forgot a lot of vulnerabilities that are commonly found on real web pages. I didn't expect them to include tons and tons of vulnerabilities but I believe that it should have been a great idea to explain the most common vulns appart from the ones that we all know like XSS, RCE, SQLi, SSRF and so on. They could have shown more details about **Open Redirects** (it's quite common in bug bounty), **Race Condition** or other vulns like this. Why I think this? Because I checked it out by my own. Some time ago (when I didn't know much about bug bounty), I spent a couple of hours doing bug bounty (only for learning on real web pages) and I easily found multiple **Race Conditions** using the same estrategy. Now you may think that they didn't even mention it because it has not much impact, right? Meanwhile most of these vulns I found had ***Low*** impact, there were one of them that was ***High*** and had a really serious impact for the business of the company. That's why they should have, at least, mentioned other vulnerabilities that you will find on real target but not on CTFs.

This is not a horrible thing, but I felt that some skill assessments weren't as well explained as I would like to. In some of them I didn't know what to, but not because I hadn't understood the module itself. Moreover, not all of them, but a few skill assessments didn't have anything to do with the section you read before or was simply like a CTF.

# My opinion and final thoughts

Having discussed most aspects about this course, I could say, in a few words, that this course is totally worth, specially if you have access to a student subscription (in order to pay 8 eur/month). You will learn everything about web exploitation. Although the course could contain a little bit more info about certain vulnerabilities, it contains everything you need to know to become a successfull bug bounty hunter. Furthermore, you can also practice your skills by solving the machines that HTB offers on their main platform, you will notice that the enumeration and exploitation are exactly the same.

In case you wonder which score I would give to this course, **I would say that it's a 8.7 over 10**.

I hope you have finally decided whether this course if for you or not.

[Go back to top](#)




