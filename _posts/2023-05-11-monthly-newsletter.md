---
layout: post
title: Official Rust binding, LVGL and SLS releases, DASQI and Elecrow board certifications and more
author: "kisvegabor"
cover: /assets/monthly_newsletters/2023_may.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 

I have a lot of exciting things to share with you this month. So let's dive right in!


## Official Rust binding
In the previous newsletter, I mentioned "lvgl-rs," an unofficial Rust binding for LVGL. I'm thrilled to announce that it has now become official! 🎉 You can find it in the lvgl/[lv_binding_rust](https://github.com/lvgl/lv_binding_rust) repository. I believe the possibility of creating embedded UIs in Rust will captivate many.

Furthermore, I'd like to express my gratitude to [Nia](https://github.com/nia-e), the new maintainer of this repository, for their outstanding work!

## LVGL v8.3.7
A new patch version of LVGL has been released with several bug fixes. For more details, refer to the [changelog](https://github.com/lvgl/lvgl/blob/release/v8.3/docs/CHANGELOG.md#v837-3-may-2023).


## SLS v1.3.0
We have also launched a new version of SquareLine Studio. The major new features include:

- Multilanguage support
- Organizing exported files into folders
- Exporting CMakeFile.txt and a general filelist for easier integration
- Ability to send crash logs

You can find the complete list of new features and fixes [here](https://forum.squareline.io/t/v1-3-0-is-released/1201).

## DASQI board certification
DASQI Apollo4B is a powerful board specifically designed for smartwatch applications. With a wide range of sensors and an impressive display, it is the perfect choice for developers aiming to create cutting-edge wearables.
<iframe width="560" height="315" src="https://www.youtube.com/embed/1fkQWptttp4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Elecrow board certification

Elecrow's ESP Terminal 3.5" board is fantastic, featuring the powerful ESP32-S3 chip with a dual-core processor running at 240MHz. Its Octo-SPI technology enables fast and efficient access to both flash memory and RAM.

<iframe width="560" height="315" src="https://www.youtube.com/embed/OWOMkr3Ojz4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Presentation at RT-Thread conference

In June, I will be giving a presentation on the new version of SquareLine Studio at the RT-Thread Global Tech Conference. It will be the first event where we showcase the completely revamped version of our editor. You can register for the conference [here](https://rt-thread.medium.com/june-1-june-3-2023-rt-thread-global-tech-conference-online-free-8d30cff95771) 

By the way, among the participants, we will be drawing five RT-Thread - Renesas boards. So it's definitely worth registering! For more information about the board, check [here](https://rt-thread.medium.com/heads-up-rt-thread-renesas-lvgl-is-about-to-drop-a-cost-effective-hmi-board-30c55b676be3).

![Poster of Gabor Kiss-Vamosi at RT-Thread Global Tech Conference 2023](/assets/monthly_newsletters/rt-thread-conf-2023.jpeg)

## Migrate to RST documentation

We use [Sphinx](https://www.sphinx-doc.org/en/master/) as a documentation engine and its native file format is "reStructuredText" (RST). Thanks to the amazing work of [Kevin Schlosser](https://github.com/kdschlosser), we now have our entire documentation in RST instead of Markdown. This allows us to leverage the full power of Sphinx, including more cross-links within the documentation and a better API summary. Take a look at the documentation of the Arc widget as an example. You'll find that all functions and constants are now hyperlinked!

By the way, Kevin is currently developing a Python3 binding for LVGL. I will keep you informed and let you know when it's ready for you to try out.

## FreeType on ESP

[100ask](https://github.com/100askTeam) just created something incredibly useful again: they have been released a [FreeType-LVGL component for ESP32](https://forum.lvgl.io/t/lvgl-esp32-freetype/11741). With this component, you can now generate fonts at runtime directly from TTF or OTF files.


And that's all for now. I'll be back in a month with more updates. Stay tuned!  🙂
