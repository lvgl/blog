---
layout: post
title: New driver API, SLS v1.2 release, and others
author: "kisvegabor"
cover: /assets/monthly_newsletters/2023_february.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 


I hope you are doing well. I've summarized the news around LVGL in 2023 so far.

## New driver architecture
After a longer than expected polishing I have merged the driver architecture update to the "master" branch. It includes a lot of changes:
New color formats support and management with RGB888 support
API changes in display and input device (indev) drivers 
Built-in drivers

If you would like to try out these changes please take a look at [this GitHub issue](https://github.com/lvgl/lvgl/issues/4011) where I've summarized the changes in more detail. 

This update opens the door for moving more drivers into the main LVGL repository. The goal is to have vendor agnostic drivers for the various display and touch controllers to which any vendor's SPI, I2C or other periphery can be easily attached. 

## LVGL v9 plans
Besides many smaller changes for v9 will focus on 2 main topics:
1. Parallel rendering to better utilize multiple CPU cores and GPUs 
2. New image decoder and image format support

See the [Roadmap](https://github.com/lvgl/lvgl/blob/master/docs/ROADMAP.md) for more details.

I'll keep you updated if there is something to try out :) 

## LVGL patch release
We have [released LVGL v8.3.5](https://blog.lvgl.io/2023-02-07/release_v8.3.5) with several bug fixes and improved NXP and STM GPU support. 

From now on we will release a bugfix release at the beginning of each month. 

## Embedded World
I am happy to tell you that LVGL and SquareLine Studio will be presented on the booths of many vendors including NXP, STM, Nuvoton and Espressif. We have created new demos for this event, so be sure to check them out! 

We will also be there on March 15 all day, so if you want to meet us, just reply to this email and we can schedule a meeting. 

## New certified board
We certified an amazing board from Nuvoton. It received its well deserved Professional  certificate:
<iframe width="560" height="315" src="https://www.youtube.com/embed/cQvobSRDeis" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## SLS v1.2
SquareLine Studio v1.2 and v1.2.1 are released too. The main changes are:
- The Chart widget is added
- Flex layout is added
- 4 new Espressif boards are added (having 6 in total)
- 3 Nuvoton boards are added

A new Tutorial video about the Flex layout is also released:
<iframe width="560" height="315" src="https://www.youtube.com/embed/tXDXON9dYpI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## EBV seminar
I'm happy to tell you that we are participating in EBV's seminar tour across Europe to present SquareLine Studio and LVGL. There will be seminars in many countries, so if you are interested in it contact your local EBV representative or check out the [events here](https://www.avnet.com/wps/portal/ebv/resources/training-and-events/).

## Community projects
And finally some community projects:
- [LVGL running on PipePhone](https://www.linkedin.com/feed/update/urn:li:activity:7020880419944374274/?utm_source=share&utm_medium=member_desktop)
- [Rotary encoder + LVGL tutorial](https://forum.lvgl.io/t/esp32s3-interfacing-rotary-encoder-and-gc9a01-tft-rounded-display-with-lvgl/10844) 
- [NuttX terminal](https://forum.lvgl.io/t/lvgl-terminal-for-apache-nuttx-rtos/10910)

