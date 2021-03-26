---
layout: post
title: YeaCreate Nscreen32 - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_standard.png
---

**[YeaCreate Nscreen32](https://yeacreate.com/en/product/nscreen32.html) is a [ESP32](https://www.espressif.com/en/products/socs/esp32) based display development board kit.
It includes [ESP32-WROVER-IE](https://www.espressif.com/sites/default/files/documentation/esp32-wrover-e_esp32-wrover-ie_datasheet_en.pdf)(16M Flash + 8M PSRAM), a 480x320 4 inch TFT display, and a GT911 capacitance touch screen. 
It's also the 1st LVGL official certified board in the world. Nscreen32 is a cost-effective solution for IoT applications and for embedded systems in general.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/9lDxJRI9BwM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Certification
Nscreen32 earned Standard LVGL board certification which means the users can be sure that it's easy to use with LVGL and they can expect decent performance and quality.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for YeaCreate Nscreen32">

### Buy now
The Nscreen32 board can be purchased directly from YeaCreate. 
See [here](https://store.yeacreate.com/products/3).

<hr/>

## Specification
### Mirocontroller
- **MCU** [ESP32-WROVER-IE](https://www.espressif.com/sites/default/files/documentation/esp32-wrover-e_esp32-wrover-ie_datasheet_en.pdf) 240MHz dual core, 600 DMIPS
- **RAM** 520 kB internal, 8 MB PSRAM
- **Flash** 16 MB
- **GPU** None

### Display
- **Resolution** 480x320
- **Display size** 4.0"
- **Color depth** 16 bit, RGB565
- **Technology** TN
- **DPI** 144 px/inch
- **Touch pad** Capcitive (Goodix GT911)
- **Brightness** ???
- **Interface** Parallel 8 bit (ST7796)

### Connectivity
- WIFI 802.11 B/G/N HT40 (up to 150Mbps)
- Bluetooth 4.2 BR/EDR/BLE
- Antenna	2.4G onboard antenna and PXE antenna
- 4 GPIO, 4 Input-only pins
- 2 serial port (RX0/TX0, RX1/TX1)

### Others
- **Power supply** USB mini (5V)
- **Dimensions** 96.52 x 73.66 x 14.99mm
- **Weight** 79g

<hr/>

## Performance

ESP32-WROVER-IE is the best ESP32 module of Espressif. See this summary from [docs.espressif.com](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/hw-reference/modules-and-boards.html):
 

| Module 	| Chip	| Flash, MB	| PSRAM, MB |
|---------|-------|-----------|-----------|
|ESP32-WROOM-32|ESP32-D0WDQ6|4|-|
|ESP32-WROOM-32D|ESP32-D0WD|4, 8, or 16|-|
|ESP32-WROOM-32U|ESP32-D0WD|4, 8, or 16|-|
|ESP32-SOLO-1|ESP32-S0WD|4|-|
|ESP32-WROVER (PCB)|ESP32-D0WDQ6|4|8|
|ESP32-WROVER (IPEX)|ESP32-D0WDQ6|4|8|
|ESP32-WROVER-B|ESP32-D0WD|4, 8, or 16|8|
|ESP32-WROVER-IB|ESP32-D0WD|4, 8, or 16|8|

Similarly to the other modules, its chip has 2 x 240 MHz cores, but it comes with plenty of memories.

### Frame rate (FPS)

The Nscreen32 board reached 20 FPS on the LVGL's certification benchmark. In the video, you can see that smaller changes were drawn quickly, and scrolling the list was smooth. 
However, the most complex part of the benchmark - the album cover with the zoom animation and the moving bars - caused some drop in FPS.

It's very difficult to get high FPS with the ESP32 chips because they have neither LCD controller nor parallel port peripheries. Therefore, you can usually see maximum 320x240 screens driven by ESP32 with low FPS. 
However, YeaCreate made an amazing job to make the most out of their ESP32 chip. Nscreen32 has a 480x320 display and still a relatively good FPS.

### Memory

ESP32-WROVER-IE comes with huge internal and external memories. Let's see how these memories can be used in graphics applications.

Nscreen32 uses ST7796 that already contains a frame buffer, therefore the application needs to allocate only a smaller draw buffer in RAM for LVGL. 

As the ESP32 chips in usual, ESP32-WROVER-IE doesn't have internal flash, however, it has a large external flash (16 MB). The external flash is connected via an 80 MHz 4 line SPI interface to the chip. Compared to an internal flash this interface is quite slow. 
For code execution, this slowness is very well compensated with caches inside the chip, however, the cache doesn't help much if large (e.g. screen-sized) images need to be read. 

PSRAM might have similar issues because it shares the same SPI bus with the flash.

To reach a good performance the assets (images and fonts) should be kept in internal RAM which is lightning fast. 
For comparison, the internal RAM has (240 MHz x 32 bit = 960 MB/s throughput while the PSRAM and flash have 80 MHz x 4 bit = 40 MHz theoretical throughput which is even smaller in real life due to some overhead in the communication and because both the memories use the same bus. 

Anyway, the 520 kB internal RAM is enough even to hold a 480x320x16bit = 300kB screen-sized wallpaper, or a smaller image that can be tiled. 
It is also possible to store a lot of image assets in the external flash and load them on demand to the internal RAM.
Note that the performance difference between internal and external memories is notable only for large images. So probably it's fine to store icons or other smaller images in any of the memories.

Regardless of the bandwidth issues, the huge PSRAM can be used for various purposes. 
For example, it can store a large [canvas](https://docs.lvgl.io/latest/en/html/widgets/canvas.html) for custom drawings (e.g. a special chart) which is later used in LVGL or any other data independently of LVGL.
 
<hr/>

## Quality
### Display
The display is built with TN technology however it has excellent viewing angle and color correctness.  The DPI of the screen is also high.  These bring a premium look and feel to the display.

![Viewing angles of the Nscreen32 board's display](/assets/cert_nscreen32/display.jpg)

### Touchpad
Nscreen32 is built with a capacitive touchpad hence it provides a smartphone-like experience but it doesn't recognize touches with a pen or in gloves.

### Robustness
Nscreen32 is designed to be integrated to an end product. It has holes to mount the board and the display attached to the board in a stable way. 

Probably a secondary board will be also required for sensors or other peripheries.

<hr/>
 
## Development

UI applications for NScreen32 can be developed with both ESP-IDF and Ardunio. As an IDE you can use [PlatformIO](https://platformio.org/) too.

It's also possible to develop the UI first in a [simulator on PC](https://docs.lvgl.io/latest/en/html/get-started/pc-simulator.html) and copy the source files to the embedded project later. 

YeaCreate provides 3 demos hosted on GitHub: https://github.com/yeacreate-opensources/Nscreen_32

On GitHub, you can also find the schematic of the board and various other documents. 

Regarding the development experience, it's pity that the is no "real" debugging opportunity. 

## Conclusion

The tightly integrated Bluetooth, WiFi and UI features make Nscreen32 an amazing board for IoT. 
Its performance is surprisingly good and it should be enough for most of the applications.

If you are already familiar with the development in Arduino or ESP-IDF, working Nscreen32 should be straightforward!

