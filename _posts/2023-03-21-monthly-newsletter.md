---
layout: post
title: Embedded world 2023, Xiaomi collaboration, New maintainer, and others
author: "kisvegabor"
cover: /assets/monthly_newsletters/2023_march.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 


I am thrilled to be back again to update you on the latest happenings with LVGL. This past month has been quite eventful and I am excited to share some exciting news with you.
 

## Embedded World Conference
We recently attended the Embedded World Conference where we had the pleasure of meeting some of the biggest vendors in the industry, including NXP, STM, Espressif, Nuvoton, Infineon, Zephyr, and NuttX. We were delighted to see that our demos were showcased at some of their booths. To give you a glimpse of our experience, we have put together a short video.

 
<iframe width="560" height="315" src="https://www.youtube.com/embed/Ey2zkG55fZI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Xiaomi Collaboration
We are delighted to announce that Xiaomi has chosen LVGL for their latest S1 Pro Smart Watch. We received a sample from them and it looks phenomenal. We couldn't be more thrilled to work with such an innovative company.

![Xiaomi S1 Pro (powered by LVGL)](/assets/monthly_newsletters/s1_pro_2.jpg)

## New Maintainer
We are excited to welcome [Eric Poulsen](https://github.com/MrSurly) (aka MrSurly) as the new maintainer of the [lvgl_esp32_drivers](https://github.com/lvgl/lvgl_esp32_drivers/) and [lv_port_esp32](https://github.com/lvgl/lv_port_esp32) repositories. We recently had a kick-off meeting to discuss our plans, which includes updating the ESP drivers to v8. We will then explore how to reuse these drivers for LVGL v9, where the driver will be hosted directly in the v9 repository.


## ITE Professional Board Certification
We have just certified a new board with a wide display from ITE. This board has received professional certificate and looks incredibly sleek and modern.

[![IT986x_EVB LVGL board certification](/assets/monthly_newsletters/IT986x_EVB.png)](https://blog.lvgl.io/2023-03-17/it986x-evb-review)

## Multi-core Rendering
We are thrilled to announce that with the [new driver architecture](https://github.com/lvgl/lvgl/issues/4011) merge, we have begun working on parallel rendering. We have established an operating system abstraction layer and are currently working on making all widgets function effectively in the new architecture. To track our progress, check out [this issue](https://github.com/lvgl/lvgl/issues/4016).

## New SquareLine Studio Release
Our latest SquareLine Studio release, [v1.2.2, is now available](https://forum.squareline.io/t/v1-2-2-is-released/1024/3). We have included a few fixes and some simple but very useful new features. One of the most significant updates is the addition of a hook for component creation, which allows for inserting any custom code when the components are created. We have also introduced initial actions on startup, allowing you to start animations or adjust settings when the UI starts. Additionally, we have created an image animation widget to handle image sequences as an animation.


