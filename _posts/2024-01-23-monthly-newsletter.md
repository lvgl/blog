---
layout: post
title: LVGL v9 is released
author: "kisvegabor"
cover: /assets/release_cover.png
---

> This is the copy of the monthly newsletter sent out to our subscribers. 

## Finally we have released LVGL v9! 🎉

We have already updated these projects:

- [lv_port_pc_eclipse](https://github.com/lvgl/lv_port_pc_eclipse/)
- [lv_port_pc_visual_studio](https://github.com/lvgl/lv_port_pc_visual_studio)
- [lv_port_linux_frame_buffer](https://github.com/lvgl/lv_port_linux_frame_buffer)
- [lv_port_pc_visual_studio](https://github.com/lvgl/lv_port_pc_visual_studio)
- [lv_renesas](https://github.com/lvgl/lv_renesas)
- [lv_port_stm32f769_disco](https://github.com/lvgl/lv_port_stm32f769_disco)
- [lv_web_emscripten](https://github.com/lvgl/lv_web_emscripten)
- [GitHub codespace](https://blog.lvgl.io/2023-04-13/monthly-newsletter)

And v9 is also available as a
 
- [PlatformIO library](https://registry.platformio.org/libraries/lvgl/lvgl)
Arduino library
- [CMSIS-PACK](https://www.keil.arm.com/packs/lvgl-lvgl/versions/)

In the past few days, I've conducted extensive benchmarking, and here are my findings:

- v9 is approximately 10% faster in the most basic bare-metal software rendering configuration.
- When testing with the Renesas DAVE2D GPU, the CPU usage calculated from the FreeRTOS idle task is half that of pure software rendering.
- Next week, I plan to conduct further tests with an i.MX 9 multi-core MPU board to assess the benefits of parallel software rendering.
- There is [significant potential](https://github.com/lvgl/lvgl/issues/4926#issuecomment-1905860994) to enhance performance on the ESP32 as well. 

I hope you will try out the new version soon! As always, your feedback is highly appreciated. If you encounter any performance issues, instability, bugs, or documentation concerns, please let us know in a [GitHub issue](https://github.com/lvgl/lvgl/issues).

While migrating to v9, remember that LVGL now includes built-in drivers for SDL, X11, Windows, various display controllers, and many others. The [CHANGELOG](https://docs.lvgl.io/master/CHANGELOG.html) can also be very useful. 😉
