---
layout: post
title: 4D Systems gen4-ESP32-50CT - board certification review
author: "zjanosy"
cover: /assets/cover_cert_standard.webp
---

**The []gen4 – ESP32](https://4dsystems.com.au/product-category/intelligent-display-modules/gen4-esp32-display-modules/) series of modules Designed and Manufactured by 4D Systems range from 4.3" to 9" display sizes with a resolution of 800x480 offering an RGB Interface between the screen and the ESP32-S3R8 Processor. Available in Non-Touch, Resistive Touch, Capacitive Touch, and Capacitive Touch with Cover Lens Bezel (CLB). The ESP32-S3R8 Processor makes available multiple GPIO which include UART, SPI, I2C, PWM, and Analog functionality, while also serving interfaces for the LCD Touch screen, Quad SPI Flash, microSD Card, and Native USB-C. The user interface to the gen4-ESP32 series is a 30-pin FPC/ZIF socket, designed for a 30-way 0.5mm pitch FFC cable, for easy and simple connection to an application or motherboard, or for connecting to accessory boards for a range of functionality advancements.**



<iframe width="560" height="315" src="https://www.youtube.com/embed/KBP-5gL0S0g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The 4D Systems gen4-ESP32-50CT board earned Standard LVGL board certification which means users can use it to create a graphical user interface with LVGL, albeit with some limitations.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for 4D Systems gen4-ESP32-50CT board">

### Buy now

You can purchase the 4D Systems gen4-ESP32-50CT board directly from the manufacturer:

https://4dsystems.com.au/product-category/intelligent-display-modules/gen4-esp32-display-modules/

<hr/>

## Specification

### CPU and memory

- **SoC** ESP32-S3R8 (dual-core Xtensa, up to 240 MHz)
- **RAM** 512kB SRAM (internal) + 8MB Octal SPI PSRAM (external)
- **ROM** 384kB ROM (internal)
- **Flash** 16MB Quad SPI NOR flash (external, XIP)
- **GPU** no

### Display

- **Part number** Gen4-ESP32-xx
- **Resolution** 800x480
- **Display size** 5.0"
- **Interfase** RGB
- **Color depth** 16bit RGB565
- **Technology** IPS
- **Brightness** 475 nit
- **Touch pad** Capacitive

### Connectivity

- Wi-Fi: 802.11 b/g/n
- Bluetooth: BLE 5
- TF socket for microSD card
- USB-C: USB2.0 FS host/device
- 30 pin FPC socket for GPIO/UART/SPI/I2C/PWM/analog

### Others

- U.FL connector for external antenna
- coin battery holder

<hr/>

## Performance

The ESP32-S3 is a high performance microcontroller with two Xtensa RISC cores running at up to 240MHz. It has a decent graphics performance even without a dedicated GPU. The display is connected via the RGB interface of the ESP32-S3, which is in theory faster than the SPI interface, however, it needs a frame buffer in the memory of the microcontroller. Since the internal SRAM of the ESP32-S3 is not enough for a full framebuffer at this resolution, the frame buffer must be allocated in the external PSRAM. PSRAM is, however, it is rather slow, compared to the internal memory, which leads to a reduced performance.

Another disadvantage of the RGB interface is that it requires more GPIO pins – thus there are fewer GPIOs available for interfacing to external hardware. To solve this problem 4D Systems added an IO extender to this board.

The display does not use VSync synchronization, which may cause visible artifacts (tearing) during refresh (for example, in the colored screen, colored rectangles tests). This is especially prominent in portrait mode, because it is different from the physical orientation (scan direction) of the screen. 
On the other hand, the display looks very sharp and detailed.

### Frame rate (FPS)

Since the release of LVGL v9 in February 2024 we use the "Benchmark Demo" test for board certification instead of the "Music Demo". This is a suite of various basic widget test. This benchmark gives a more in-depth view of the performance of individual widgets than the Music Demo. Please note that this benchmark depends heavily on the resolution of the screen, so comparing different displays only by looking at the FPS may be misleading.

Using the 9.0.1 release of LVGL we have measured an average of 21 FPS with this board, which is quite good for this size of screen. The Widget Demo test ran at 13 FPS. The most difficult test are the "Rotated ARGB images", which ran at only 3 FPS, and the "Screen sized text", which ran at 7 FPS.

The display driver was configured in "partial" mode with two 1/8 screen sized buffers. In partial mode when only a small area changes on the screen, only that small area will be updated. This makes the rendering very fast, and saves precious memory at the same time.

### Memory

The board has 8MB Octal SPI PSRAM, which can be used for even a full screen sized framebuffer. It makes also possible to pre-render some complex widgets (e.g. charts, gauges) into the memory for faster refresh.

<hr/>

## Quality

### Display

This particular board uses an IPS display, therefore the viewing angles are good. The brightness is good as well, and the colors are vivid. There is some visible darkening from the side, but the colors are not affected.

![Viewing angles of the 4D Systems gen4-ESP32-50CT 5.0" display](/assets/cert_xxx/display.jpg)

### Touchpad

The 4D Systems gen4-ESP32-50CT board comes with a quite responsive capacitive touch screen. During our evaluation the touch screen was very accurate and we haven't found any issues with it.

### Robustness

This board looks impressive with the tiny SMD components. It has a solid frame made of plastic, which includes mounting holes as well. Overall it seems to be robust even for industrial applications.

## Development

Although 4D Systems provides their own IDE for their HMI products, called Workshop4 IDE, apparently this does not yet fully support their ESP32-based boards. Instead, they provided me with an Arduino project for testing. They have also implemented a driver library for the gen4-ESP32 boards, called GFX4dESP32. This can be installed from withing the Arduino IDE, and it includes a []display/touch driver](https://github.com/4dsystems/GFX4dESP32) as well.


Configuring the board was fairly easy, although the Arduino environment has a number of quirks.

It is also possible to use Espressif's ESP-IDF 5.2 framework, which is a better choice for serious development, although it has a steeper initial learning curve.

4D Systems provides a lot of useful information [here](https://resources.4dsystems.com.au/manuals/workshop4/esp32/).

The board can be programmed via its USB-C interface from within the Arduino IDE or from the Eclipse-based Espressif-IDE. 4D Systems also sent me a 4D-UPA universal programmer board, which can be used to program the ESP32-S3 via UART, but I did not use this. Unfortunately I did not find a JTAG connector on the board, although it would be useful for debugging, especially if the USB port was used for custom purposes.

## Conclusion

The 4D Systems gen4-ESP32-50CT board offers a good quality screen, a bit hampered by the rather slow memory used as the frame buffer. Software support is good. 4D Systems supports several development environments.

The board has lot of GPIO pins for interfacing to external hardware. It is a solid, simple to install, nice board. The ESP32-S3 is a very capable microcontroller, which can do much more than just running the GUI. Unfortunately its graphical performance is a little limited by the slow external PSRAM, but for a UI with little of no animation it works well.
