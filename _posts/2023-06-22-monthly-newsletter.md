---
layout: post
title: Riverdi cooperation, Renesas GPU, RT-Thread board certification, and LVGL-Zig experiments
author: "kisvegabor"
cover: /assets/monthly_newsletters/2023_june.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 

It might look like there aren't many new things around LVGL recently, however I can assure you under the surface we are preparing huge things which will position LVGL into an entirely new category. I hope I can tell more in the next month. Until then, let's start with something that is already the beginning of this new era. 


<img src="/assets/monthly_newsletters/riverdi.png" style="display:block;width:300px;max-width:80%;margin-left:0px;padding-top:48px">
## Riverdi Collaboration

Have you already heard about [Riverdi](https://riverdi.com/)? They are manufacturing truly amazing STM32 based display modules in various sizes and resolutions. Now their displays support only TouchGFX but in the near future LVGL will be available as well! I will let you know when it's ready. 😉


<img src="/assets/monthly_newsletters/renesas.png" style="display:block;width:300px;max-width:80%;margin-left:0px;padding-top:48px">

## Renesas GPU integration 
Thanks to the contribution of RT-Thread, LVGL v8.3 now has support for the Rensas GPU, called Dave-2D. Similarly to other GPUs supported in LVGL you just need to enable a config option in "lv_conf.h". Click [here](https://docs.lvgl.io/8.3/get-started/platforms/renesas.html) to learn more.

<a href="https://www.youtube.com/watch?v=_lB6Mu711Kg"><img src="/assets/monthly_newsletters/ra6m3.png" style="display:block;width:300px;max-width:80%;margin-left:0px;padding-top:48px"></a>

## RT-Thread - Renesas RA6M3 HMI Board Certification

Once we are talking about Renesas, we have certified a Renesas-RT-Thread board! It's only a 120 MHz MCU but by utilizing the Dave-2D GPU it reached 23 FPS on average in our benchmark. Check it out [here](https://www.youtube.com/watch?v=_lB6Mu711Kg).

<img src="/assets/monthly_newsletters/zig.jpeg" style="display:block;width:300px;max-width:80%;margin-left:0px;padding-top:48px">

## LVGL-Zig on Pine64 PinePhone and Browser

Lup Yuen Lee made it again. Now he combined LVGL, NuttX, and a Zig binding and made all these work on a Pine64 PinePhone smartphone and in a web browser too. Check it out [here](https://forum.lvgl.io/t/feature-phone-ui-in-lvgl-zig-and-webassembly/11987). He continuously shares mind blowing LVGL related content, so I highly recommend following [@Lup Yuen Lee](https://www.linkedin.com/in/lupyuen/) on LinkedIn.

And that it's for now! Have a nice weekend!
