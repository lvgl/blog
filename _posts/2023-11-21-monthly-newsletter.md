---
layout: post
title: v9 schedule, ESP32-S3-BOX-3, and a cool project
author: "kisvegabor"
cover: /assets/monthly_newsletters/2023_november.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 

I would like to share some great things with you! 

## v9 schedule

I'm happy to share that everything is going according to plan with v9. 😊
Here is our schedule for the last few weeks:

- December 4: Feature stop, start updating the docs and testing
- December 18: Release candidate version and call to test
- January 15: Release of v9.0


Just to highlight a few key news and features: 

- **Official partners:** In this year, LVGL LLC has been successfully established official partnerships with several leading vendors. This means we are actively collaborating to make LVGL better in their platform and provide the best possible UI library for you.   
- **GitHub Code Space:** You can try out LVGL v9 right in your browser with just 3 clicks in a VSCode IDE. Click [here](https://blog.lvgl.io/2023-04-13/monthly-newsletter#github-codespace-integration) for the details. 
Improved rendering pipe line: The entire rendering pipeline has been rewritten to better utilize GPUs and multiple CPU cores. A high-level description can be found [here](https://github.com/lvgl/lvgl/issues/4016).  
- **Observer:**  It's a seemingly simple but very powerful and versatile feature to create API for your GUIs and to bind internal or external data to the UI elements. Check out its [docs and the examples](https://docs.lvgl.io/master/others/observer.html).  
- **Drivers in the LVGL repo:** You can find several [drivers right in the LVGL repository](https://github.com/lvgl/lvgl/tree/master/src/dev) which can be easily enabled in lv_conf.h or menuconfig just like any other feature.  These are mainly high level drivers but drivers for display controllers (e.g. ILI9341) on their way as well.
- **Vector graphics:** [ThorVG](https://github.com/thorvg/thorvg), a powerful vector graphics library was integrated into LVGL. We are planning to use it for SVG, Lottie, and vector font rendering. However until that you can already [draw any vector graphics to canvas widget](https://github.com/lvgl/lvgl/blob/0c8a1f22a4652fc74b741147af6b798ad674a17a/examples/widgets/canvas/lv_example_canvas_8.c).

If you're interested in trying out LVGL prior to the official testing phase, you can find in in the [master branch on GitHub](https://github.com/lvgl/lvgl). For a ready-to-use project take a look at [lv_port_pc_eclipse](https://github.com/lvgl/lv_port_pc_eclipse/).


## ESP32-S3-BOX-3

Guys, I've just received my ESP32-S3-BOX-3 and I was shocked. I thought it was just a dev kit with a display, but it's much more.

Here's what I found in the initial demo: a well-designed, elegant UI (powered by LVGL 🙂), numerous interesting menus, and the best part: very accurate voice recognition. You can command it to play music or change the color of lamps. It was even able to recognize the English of my 5-year-old child 😄.

So, in summary, this device offers:
- WiFi
- Bluetooth Low Energy
- TFT with Touch
- Voice recognition
- Audio playback

All these features are packaged in a new, innovative design. If you'd like to try it out, you can grab one from [Espressif's AliExpress store](https://www.aliexpress.com/item/1005006169541505.html).

![ESP32-S3-BOX-3](ESP32-S3-BOX-3.png)

## Balanced Robot from 100ask

100ask just shared a cool project on Forum about a balancing robot. It has a really nice LVGL base UI too, running on an  Allwinner R128.

Enjoy! 😊

<iframe width="560" height="315" src="https://www.youtube.com/embed/xA0qwZVbR8Q?si=BXFDCUZqO0elO575" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
