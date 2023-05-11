---
layout: post
title: Elecrow ESP Terminal 3.5" - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_standard.webp
---

**This Elecrow terminal is a microcontroller based on the ESP32 master. It adopts Xtensa 32-bit LX7 dual-core processor with a main frequency of up to 240Mhz, supports 2.4GHz Wi-Fi and Bluetooth 5 (LE), and can easily handle common edge terminal device application scenarios, such as industrial control, agricultural production environment detection and processing, intelligent logistics monitoring, smart home scenarios and more.This terminal also has a 3.5-inch parallel RGB interface capacitive touch screen with a resolution of 320*480 to ensure perfect image output at a frame rate (FPS) of 60. On the back of this terminal, we have introduced 4 Crowtail interfaces, which can be used with our Crowtail series sensors, plug and play, and create more interesting projects quickly and conveniently. In addition, it is also equipped with an SD card slot for extended storage (SPI leads) and a buzzer function. It support ESP-IDF and Arduino IDE development, and is compatible.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/OWOMkr3Ojz4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
ESP Terminal 3.5" earned Standard LVGL board certification which means the users can be sure that it’s easy to use that board with LVGL and they can expect decent performance and quality.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for ESP Terminal 3.5">

### Buy now

ESP Terminal 3.5" board can be purchased from [Elecrow's shop](https://www.elecrow.com/display/hmi-dispaly.html?cat=261_esp-hmi-display).

<hr/>

## Specification

### CPU and memory

- **MCU** ESP32-S3 (dual core, up to 240 MHz)
- **RAM** 8 MB PSRAM (Octo SPI)
- **Flash** 16MB Flash (Octo SPI)
- **GPU** None

### Display

- **Resolution** 480x320
- **Display size** 3.5"
- **Color depth** 16bit,RGB565
- **Technology** TN
- **DPI** 165 px/inch
- **Touch pad** Capacitive

### Connectivity
- 4 [Crowtail interfaces](https://www.elecrow.com/crowtail.html) (HY2.0-4P connector) , plug and play with various Crowtail sensor 

### Others

- **Power supply** 5V (USB C)

<hr/>

## Performance

ESP Terminal 3.5" uses the dual core ESP32-S3 chip. With it you can dedicate a core to the UI and and other core to the application

### Frame rate (FPS)

The ESP Terminal 3.5" board reached 26 FPS on the LVGL's certification benchmark. The animated stripes and the scaling cover were render with ~23 FPS. Even the animations of the screen sized stripes at the beginning were smooth. In general the performance is stable and absolutely suitable for most of the applications.

### Memory

The board comes with huge external flash and RAM. As ESP32-S3 has Octo-SPI to access the memories so the bandwidth is much better than with the previous ESP chips.

The PSRAM is big enough to let you use as many frame buffers as you wish. Plus, the flash storage is even bigger and can hold a ton of stuff. For instance, in the 16MB of flash storage you can store about 36 images that fit the whole screen.
 
<hr/>

## Quality

### Display
This board comes with a TN display. It's viewing angle as not as good as an IPS display but probably it's suitable for a lot of applications.

![Viewing angles of the TESP Terminal 3.5" board's display](/assets/cert_ESP_Terminal_3_5/display.jpg)

### Touchpad

The display is equipped with a capactive touchpad. Therefore it recognizes touches with a good precision and provides a smartphone like experience.
The drawback is that the touchpad can not be used in gloves or with a pen.

### Robustness

ESP Terminal 3.5" comes with nice and robust case. Thanks to it, the ESP Terminal 3.5" board can be built into products as well. 

## Development

[Elecrow](https://www.elecrow.com/) supports Arduino for ESP Terminal 3.5". It has the advantage of that you can use the rich Arduino ecosystem and leverage the huge Arduino community. 

To get help you can also use [Forum of Elecrow](https://forum.elecrow.com/).


[Elecrow](https://www.elecrow.com/) has a great [Wiki page](https://www.elecrow.com/wiki/index.php?title=ESP_Terminal_with_3.5inch_RGB_Capacitive_Touch_Display) about ESP Terminal 3.5". On this page you can find all the information to get started. 
 
For [Crowtail interfaces](https://www.elecrow.com/crowtail.html) you can find 100+ sensors and other modules to extend the features of the board. These images how to put together a smart home application fro Crowtail modules:
![Viewing angles of the TESP Terminal 3.5" board's display](/assets/cert_ESP_Terminal_3_5/smart_home.png)



The only issue we have found is that board can not be debugged. Of course, debugging with `print` is always an option as a workaround. 

## Conclusion

A powerful chip, a lot of fast memories, a robust case, Arduino support, and decent performance. Well, what else can I say? Recommended! 



