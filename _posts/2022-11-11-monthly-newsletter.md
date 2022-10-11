---
layout: post
title: New releases, boards and features
author: "kisvegabor"
cover: /assets/monthly_newsletters/2022_october.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 


**New bugfix release**
We have released v8.3.2 with [these changes](https://blog.lvgl.io/2022-09-27/release_v8.3.2). By accident the version number in lvgl.h wasn't updated so we also released v8.3.3 where we fixed only  the version numbers. 

**TinyTTF**
Thanks to [@codewitch-honey-crisis](https://github.com/codewitch-honey-crisis) LVGL got an embedded system compatible TTF font engine, called [Tiny TTF](https://docs.lvgl.io/master/libs/tiny_ttf.html). Now you can convert the TTF files to hex arrays or use them as files to create fonts with any size in run time.  

**New STM and NXP boards**
We have 2 new repositories:
- [lv_port_nxp_mimxrt1064-evk](https://github.com/lvgl/lv_port_nxp_mimxrt1064-evk) A simple project to easily get started with LVGL and the i.MX RT1064 EVK dev. board using MCUXpresso.
- [lv_port_stm_nucleo_g071rb](https://github.com/lvgl/lv_port_stm_nucleo_g071rb) LVGL ported to a 128kB flash, 48kB RAM STM32G071 MCU. It also contains a demo directly for this board. 

**Great progress with unit tests**

The first topic where we started spending the donations you sent for LVGL is unit tests. The result was surprisingly positive. Things were spined up greatly and now almost all widget have a unit test with >=95% coverage. If you want to jump into unit testing and get paid for your work, please refer to the [#2337](https://github.com/lvgl/lvgl/issues/2337) issue. We have two other sponsored issues as well:
- [Micropython support ESP32-S2, ESP32-C3, ESP32-S3](https://github.com/lvgl/lv_binding_micropython/issues/227) 100 USD
- [Add C++ binding to LVGL](https://github.com/lvgl/lv_binding_cpp/issues/4#issuecomment-1205832153) 400 USD


If you would like to support LVGL's development and learn more about how we spend the donations check out this part of the [README](https://github.com/lvgl/lvgl#heart-sponsor). Every dollar is highly appreciated!  

**What we are working on now?**
As you might now v9 is under development and the following updates are in progress:
- **New driver architecture:** The API of drivers is simplified. lv_disp_drv_t, lv_disp_draw_buf_t, and lv_indev_drv_t are merged into lv_disp_t and lv_indev_t. It results in a simpler and cleaner API. It's even better that all the drivers will be part of the main LVGL repository. So all will be maintained and developed in one central place ensuring more consistency.  You can take a look at for example the [SDL driver](https://github.com/lvgl/lvgl/blob/arch/drivers/src/dev/sdl/lv_sdl_window.c#L62) which already supports creating multiple resizable windows. 
- **RGB888 rendering:** While reworking the drivers I also added RGB888 rendering features. I hope the new driver architecture can be merged in a 1-2 weeks so you can try out all these new goodies.  
- **Parallel rendering:** In [#3700](https://github.com/lvgl/lvgl/issues/3700) we are discussing how to make LVGL use multiple threads to speed up rendering and off load the CPU as much as possible. It will be a longer development and we are still at the beginning but it will also be part of v9.  

**SquareLine Studio v1.1.1** 
SLS v1.1.1 is released with [some minor features and bug fixes](https://docs.squareline.io/docs/miscellanos/changelog#version-111). Most importantly now you can run multiple SLS instances simultaneously. 

**Some videos**
And finally here are some videos from the community and some SquareLine Studio tutorials:

<iframe width="560" height="315" src="https://www.youtube.com/embed/HeJPX-fPN6Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Omqit9cUYkk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/FBLUbB98dfE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/QTAMKLhsH7E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/8D03rIzTz38" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

