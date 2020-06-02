---
layout: post
title: "Announce LVGL LLC and v7.0"
author: "kisvegabor"

---

**A lot of exciting things have happened in the past couple of months around  LVGL. We have released v7, renamed LittlevGL to LVGL, established a company for the library, created a new website and started services. You might have already noticed some of them, for example, the forum is already running at https://forum.lvgl.io. I'm very excited to announce all the news and tell you about them in more detail.**
#### Table of content

- [LittlevGL is now LVGL](#heading-rename)
- [New website](#heading-new-website)
- [Services](#heading-services)
- [Roadmap](#heading-roadmap)
- [v7 is released](#heading-v7)
- [New release policy](#heading-release-policy)
- [Join the development!](#heading-help-wanted)

<h2 id="heading-rename"> LittlevGL is now LVGL</h2>

We found the name "LittlevGL" too long and meaningless so we simplified it to "LVGL" which means "Light and Versatile Graphics Library". The name of the [organization on GitHub](https://github.com/lvgl) is also changed to LVGL. Fortunately, GitHub makes a great work in managing renaming and redirect all the queries to the new name. So all the earlies cloned repos keep working. 

<h2 id="heading-new-website"> New website</h2>

We have created a new website at https://lvgl.io. On this site, you can subscribe to newsletters to be sure you won't miss any news. Don't panic we won't send more than 1-2 mail/month :)  

All the related sites are also redirected to the lvgl.io main domain:
- https://forum.lvgl.io
- https://docs.lvgl.io
- https://blog.lvgl.io
- https://sim.lvgl.io

<h2 id="heading-lvgl-llc"> Establishing LVGL LLC</h2>

It was so good to see that how the user base of LVGL grows. Now LVGL has almost 100 contributors, more than 3,500 stars, and it's downloaded every 5 minutes from GitHub. As time passed LVGL was integrated into ESP-IDF, MCUXpresso, Zephyr OS, and AliOS. This is amazing!

To provide solid background for this growing interest in LVGL we have decided to establish a company. Basically, everything will remain the same, e.g. LVGL will be available under MIT license as before. The company allows us to run LVGL in a more reliable way and makes it easier to get partners and provide professional services. 
And the company is called - you'd never guess it - LVGL LLC. :) 


<h2 id="heading-services"> Services</h2>

With LVGL LLC we started some services:

- Graphics design
- UI implementation
- Prototyping
- Widget development
- Dedicated support

To learn more visit https://lvgl.io/services and don't hesitate to contact us if you have any questions.

<h2 id="heading-roadmap"> Roadmap</h2>
Besides services we have lot of plans and created a Roadmap to share it with you. We started to develop a Drag and drop UI editor, a toolbox with advanced image, font, and audio converter, and we will create custom hardware modules too. 

See the roadmap at lvgl.io/about

<h2 id="heading-cla">Contributors License Agreement</h2>

As a company, we need to face a lot of new challenges. One of them is the more complicated legal stuff...  LVGL can't be so successful without you, the tireless contributors. However, we need to be sure that all the contributors are aware of the legal part of their contribution. It's nothing more than what is already stated in the MIT license but accepting it in a more explicit form might help to clarify any possible issues in the future. 

So similarly to some other projects (e.g. [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/contribute/contributor-agreement.html)) we also integrated a [tool](https://cla-assistant.io/) (provided by SAP) into all repositories of LVGL which automatically comments on pull requests if a related contributor hasn't signed the agreement yet. The agreement is based on  [SAP's CLA](https://gist.github.com/thojansen/125001de00e5888cf4c7), only the company's name has changed.
It's super easy to sign it, you just need to click on an "I agree" button (it's connected to your GitHub account).

<h2 id="heading-v7"> v7 is released</h2>

On 18 May a new major version has been released and it brought a bunch of improvements. The release's official announcement was delayed a little to allow as to quickly fix some initial issues. 

The most important upgrades are

- [New drawing engine](https://docs.lvgl.io/v7/en/html/overview/drawing.html) which provides better anti-aliasing and cool new effects.
- [New CSS-like style system](https://docs.lvgl.io/v7/en/html/overview/style.html) which allows more flexibility, less memory usage, and new style properties. 

Besides some widgets and enums were renamed or reworked. See the full [Release note](https://github.com/lvgl/lvgl/releases/tag/v7.0.0) for more details.

Today (01.06.2020) v7.0.1 is also released where (hopefully) most of the initial bug are fixed.

<h2 id="heading-release-policy">New release policy</h2>

We've improved LVGL's versioning policy a little. In the future, you will find branches for every major release such as `release/v6` and `release/v7`. They contain the last released versions from that major version. It makes possible to support the older versions without bothering the newer ones.

The most recent version of LVGL is available in the `master` branch. Features and fixes are continuously merged into `master` and there are bugfix or minor releases every two weeks.

From now a [CHANGLELOG.md](https://github.com/lvgl/lvgl/blob/master/CHANGELOG.md) is maintained to easily keep track of the changes.

<h2 id="heading-help-wanted">Join the development!</h2>

To make the development of LVGL more transparent, and to make contribution easier we will create issues for every planned feature labeled with [Help wanted](https://github.com/lvgl/lvgl/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22). If you find a feature interesting and you have some thought to share feel free to comment on that issue!

Some of these issues are also labeld as [Good first issue](https://github.com/lvgl/lvgl/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22). If you are new to LVGL and have some spare time to spend with programming, these issues are the best place to get your feet wet. 

<h2 id="heading-summary">Summary</h2>

We hope that you will like the new things! 
As always we are looking forward to hearing your feedback!



