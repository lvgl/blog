---
layout: post
title: Riverdi STM32 Embedded 7.0" display - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_gold.webp
---

**STM32 Embedded 7.0” display is all-in-one complete and open-platform solution being able to independently handle the visual layer of devices with the need for high computing performance. The STM32 Embedded Displays series are industrial-quality LCD-TFT solutions based on the STM32H757XIH6 microcontroller. It has been designed in a way that allows to meet most of the hardware and programming challenges faced by engineers, including access to all interfaces.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/Uly8U6KlTzE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The STM32 Embedded 7.0" display board earned Professional LVGL board certification which means users can use it to create amazing user interfaces without worrying about performance and quality.


<img src="https://lvgl.io/assets/images/cert_professional.png" alt="Professional LVGL certificate for Riverdi STM32 Embedded 7.0" display">

### Buy now

You can purchase the STM32 Embedded 7.0" display from various sources:

- [Riverdi's website](https://riverdi.com/product/7-inch-lcd-display-capacitive-touch-panel-optical-bonding-uxtouch-stm32h7-rvt70hssnwc00-b)
- [Mouser](https://www.mouser.pl/c/?q=RVT70HSS)
- [TME](https://www.tme.com/us/en-us/katalog/intelligent-displays-modules_113439/?params=2:968;1134:1478578;1132:1584266;1136:1904411) 

<hr/>

## Specification

### CPU and memory

- **MCU** STM32H757XIH6 (Cortex-M7 + M4 core, 480MHz)
- **RAM** 1MB internal, 8MB external (32 bit access)
- **Flash** 2MB internal, 64MB external flash
- **GPU** Chrom-Art (DMA2D)

### Display

- **Resolution** 1024x600
- **Display size** 7"
- **Interfase** MIPI
- **Color depth** 24bit
- **Technology** IPS
- **DPI** 170 px/inch
- **Touch pad** Industrial Capacitive or no touch

### Connectivity
- SD Card slot
- Battery holder
- 2 x CAN FD
- RS232, RS485, 
- USB, 
- DRV2605L (haptic driver)
- [RiBUS](https://riverdi.com/ribus/)
- ETH addon with PoE
- universal interface connector (ability to connect  I2C, UART, USART, SPI, USB, PWM, DAC, ADC)

### Others

- **Power supply** 6-48V

<hr/>

## Performance

As you can see from the video it's clear that you won't have any issues with performance. 

### Frame rate (FPS)

We have measured a stable 33 FPS with ~50% CPU load. Even in the case of the jumping strides the CPU usage peaked at about 60%.

In the video a very simple yet effective buffering strategy was used. There is a single frame buffer, 60 lines of draw buffer for LVGL, and DMA2D (Chorma Art) is used to copy the rendered image from the draw buffer to the frame buffer.

### Memory

In the end, the aforementioned draw buffer utilizes 64 x 1024 x 4 = 256kB of internal RAM from the available 1MB.

The remaining internal RAM can be allocated for application use, or to load images or fonts from an SD card or external flash. The external RAM serves a similar purpose.

A single frame buffer with a 32-bit color depth (as LVGL v8 does not directly support 24-bit output) requires 1024 x 600 x 4 = 2.3 MB of RAM. Unfortunately, this size exceeds the capacity of the internal RAM. However, the 8 MB external RAM can comfortably accommodate two full frame buffers while still leaving more than 3 MB available for the application.

Opting for the standard double buffering strategy (with two frame buffers in the external RAM) ensures tearing-free rendering, as the display controller can present the new frame on VSYNC. However, this comes with the trade-off of slower rendering since the entire screen is updated each time and the rendering occurs directly in the slower external RAM.


<hr/>

## Quality

### Display
This board comes with an IPS display so it has amazing viewing angles and brightness too. 

![Viewing angles of the STM32 Embedded 7.0" display](/assets/cert_STM32_embedded_7/display.jpg)

### Touchpad

Riverdi's STM32 Embedded 7.0" display can be ordered with an industrial grade capacitive touch pad or without touchpad as well.

During our evaluation the touchpad was very accurate and we haven't found any issues with it.

### Robustness

This board was created with the definite purpose of being mounted into an end product even in a harsh environment. It's robust, has an even front surface, mounting holes, and stable connectors. 

## Development

To get started with the software part you can just clone [this repository](https://github.com/riverdi/riverdi-70-stm32h7-lvgl) from GitHub, and import it into CubeIDE. And that's it. You will find all peripherals pre-configured for you. All you need to do is connect the board and hit the build and flush buttons.

As you are probably used to you from ST you will find a very fast and stable debugger.

## Conclusion

We have already certified a huge number of boards but when I held the Riverdi boards in my hand for the first time I knew something for sure: these are not toys, but professional devices made for  serious industrial applications.

Riverdi's STM32 Embedded 7.0" display is an exceptionally good product. I feel like we have the Professional certificate exactly for these kinds of devices. 

In summary its display has high brightness, great visibility and vivid colors. It's equipped with an industrial touch panel, and all these are put together in a very stable way. In its core it has a powerful and modern STM32H7 MCU.
 
For the software side, it uses the ST's well known and mature CubeIDE.

If you need something stable which combines stability and performance you need to try out the STM32 Embedded 7.0" display. 
