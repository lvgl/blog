---
layout: post
title: Cool new LVGL features, ESP conference, and Zephyr and NuttX updates
author: "kisvegabor"
cover: /assets/monthly_newsletters/2023_october.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 


## Observer

We have just added a very important feature to LVGL. Finally we have a standard pattern to create API and data binding for your UI. It puts LVGL based UI development into a whole new 
perspective, so I highly recommend checking its [docs here](https://docs.lvgl.io/master/others/observer.html). 

## Scale

We have realized that a universal scale widget could have a wide variety of uses. Some effective applications include pairing a horizontal scale with charts, bars, or sliders, and a round scale with arcs. So we have just added such a widget with really flexible features. In LVGL v9 it will replace the built-in ticks of the chart, and the meter widget as well. You can check it out [here](https://docs.lvgl.io/master/widgets/scale.html).   

## Espressif DevCon 2023

We have participated in the amazing conference of Espressif and presented some new features of SquareLine Studio v2. If you haven't heard about SquareLine Studio v2 yet, it's our new - still under development - UI editor which runs right in your browser. You can check out the video on  [YouTube here](https://www.youtube.com/watch?v=84fSTQZwr8E).

## Zephyr updates

Thanks to [Fabian Blatz](https://github.com/faxe1008), we now have an introduction and a get started guide for Zephyr and LVGL. Zephyr now powers a huge number of devices and systems, so I really encourage you to get familiar with it. I'm pretty sure that you will find this knowledge useful sooner or later in your work. Besides, Zephyr 3.5 was just released. Be sure to check it out [here](https://www.zephyrproject.org/introducing-zephyr-3-5/%C2%A0)!

## NuttX updates

Thanks to the engineers at Xiaomi now we have ready to use display and touchpad drivers for NuttX right in LVGL. Besides that they integrated LVGL into NuttX's highly effective event loop to save power and gain even more performance. You can find it [here](https://github.com/lvgl/lvgl/tree/master/src/dev/nuttx).


