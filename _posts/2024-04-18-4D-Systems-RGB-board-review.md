---
layout: post
title: 4D Systems gen4-ESP32-50CT - board certification review
author: "zjanosy"
cover: /assets/cover_cert_gold.webp
---

**The [gen4 – ESP32](https://4dsystems.com.au/product-category/intelligent-display-modules/gen4-esp32-display-modules/) series of modules Designed and Manufactured by 4D Systems range from 4.3" to 9" display sizes with a resolution of 800x480 offering an RGB Interface between the screen and the ESP32-S3R8 Processor. Available in Non-Touch, Resistive Touch, Capacitive Touch, and Capacitive Touch with Cover Lens Bezel (CLB). The ESP32-S3R8 Processor makes available multiple GPIO which include UART, SPI, I2C, PWM, and Analog functionality, while also serving interfaces for the LCD Touch screen, Quad SPI Flash, microSD Card, and Native USB-C. The user interface to the gen4-ESP32 series is a 30-pin FPC/ZIF socket, designed for a 30-way 0.5mm pitch FFC cable, for easy and simple connection to an application or motherboard, or for connecting to accessory boards for a range of functionality advancements.**


<iframe width="560" height="315" src="https://www.youtube.com/embed/af4orz9v7Bc?si=Z_3P-WW07Soz1dGR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

The 4D Systems gen4-ESP32-50CT board has earned the Professional LVGL Board Certification. This means users can create impressive user interfaces without worrying about performance and quality.

<img src="https://lvgl.io/assets/images/cert_pro.png" alt="Professional LVGL certificate for gen4-ESP32-50CT" style="display:block;">

### Buy now

You can purchase the 4D Systems gen4-ESP32-50CT board directly from the manufacturer.

Check it out [Here](https://4dsystems.com.au/product-category/intelligent-display-modules/gen4-esp32-display-modules/).

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

The ESP32-S3 is a high performance microcontroller with two Xtensa RISC cores running at up to 240MHz. It has decent graphics performance even without a dedicated GPU. The display is connected via the RGB interface of the ESP32-S3, which is faster than the SPI interface, however, it needs a frame buffer in the memory of the microcontroller. Since the internal SRAM of the ESP32-S3 is not enough for a full framebuffer at this resolution, the frame buffer must be allocated in the external PSRAM. The PSRAM is connected to the processor via an octal SPI serial port which is much slower than the internal memory. This affects the performance, especially where the whole screen must be updated in every frame.

The RGB interface requires quite a lot of GPIO pins, thus there are fewer GPIOs available for interfacing to external hardware. To solve this problem 4D Systems added an I2C IO extender to this board.

### Frame rate (FPS)

Since the release of LVGL v9 in February 2024 we use the "Benchmark Demo" test for board certification instead of the "Music Demo". This is a suite of various basic widget test. This benchmark gives a more in-depth view of the performance of individual widgets than the Music Demo. Please note that this benchmark depends heavily on the resolution of the screen, so comparing different displays only by looking at the FPS may be misleading.

Using the 9.1.0 release of LVGL we have measured an average of 22 FPS with this board, which is quite good for this size of screen. The Widget Demo test ran at 14 FPS. The most difficult test are the "Rotated ARGB images", which ran at only 4 FPS, and the "Screen sized text", which ran at 11 FPS.

The display driver was configured in "direct" mode with two full screen sized buffers allocated in PSRAM. The benchmark used VSync synchronization to avoid tearing.

### Memory

The board has 8MB Octal SPI PSRAM, which is large enough to allocate two full screen sized framebuffers. It makes also possible to pre-render some complex widgets (e.g. charts, gauges) into the memory for faster refresh.

<hr/>

## Quality

### Display

This particular board uses an IPS display, therefore the viewing angles are good and the colors are vivid. The 475 nits specified brightness is above the average. There is some visible darkening from the side, but the colors are not affected.  Overall, the display looks very sharp and detailed.

![Viewing angles of the 4D Systems gen4-ESP32-50CT 5.0" display](/assets/cert_4D-Systems-RGB-board/display.webp)

### Touchpad

The 4D Systems gen4-ESP32-50CT board comes with a quite responsive capacitive touch screen. During our evaluation the touch screen was very accurate and we haven't found any issues with it.

### Robustness

This board looks impressive with the tiny SMD components. It has a solid frame made of plastic, which includes mounting holes as well. Overall it seems to be robust even for industrial applications.

## Development

4D Systems provides their own IDE for their HMI products called Workshop 4. The IDE fully supports the ESP32-based boards with its own drag & drop style of programming environment. 4D Systems also provides an [display/touch driver](https://github.com/4dsystems/GFX4dESP32) for Arduino.

Configuring the board in Arduino IDE was fairly easy, although the Arduino environment has a number of quirks.

It is also possible to use Espressif's ESP-IDF 5.2 framework, which is a better choice for serious development, although it has a steeper initial learning curve.

4D Systems provides a lot of useful information [here](https://resources.4dsystems.com.au/manuals/workshop4/esp32/).

The board can be programmed via its USB-C interface from within the Arduino IDE or from the Eclipse-based Espressif-IDE. 4D Systems also sent me a 4D-UPA universal programmer board, which can be used to program the ESP32-S3 via UART, but I did not use this. Unfortunately there is no JTAG connector on the board, although it would be useful for debugging, especially if the USB port was used for custom purposes.

## Conclusion

The 4D Systems gen4-ESP32-50CT board offers a good quality, high resolution IPS screen with an integrated ESP32-S3 dual-core processor. The ESP32-S3 can do much more than just running the GUI, although its graphical performance is a little limited by the slow external PSRAM. The board has lot of GPIO pins for interfacing to external hardware.

Software support is good. 4D Systems provides examples for both Arduino and ESP-IDF.
