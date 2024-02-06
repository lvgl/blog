---
layout: post
title: Riverdi STM32 Embedded 5.0" display - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_gold.webp
---

**The Riverdi RVT50HQSNWC00-B STM32 Embedded 5.0” display is all-in-one complete and open-platform solution being able to independently handle the visual layer of devices with the need for high computing performance. The STM32 5.0” Embedded Displays series are industrial-quality LCD-TFT solutions based on the STM32U599NJH6Q/STM32U5A9NJH6Q microcontroller. They have been designed in a way that allows to meet most of the hardware and programming challenges faced by engineers, including access to all interfaces.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/3sdUdsvtNio" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The Riverdi STM32 Embedded 5.0" display board earned Professional LVGL board certification which means users can use it to create amazing user interfaces without worrying about performance and quality.


<img src="https://lvgl.io/assets/images/cert_pro.png" alt="Professional LVGL certificate for Riverdi 5 STM32 Embedded Display">

### Buy now

You can purchase the Riverdi STM32 Embedded 5.0" display from various sources:

- [Riverdi's website](https://riverdi.com/product/5-inch-lcd-display-capacitive-touch-panel-optical-bonding-uxtouch-stm32u5-rvt50hqsnwc00-b)
- [Mouser](https://www2.mouser.com/ProductDetail/Riverdi/RVT50HQSNWC00-B?qs=17ckDYBRdekaIIA5WqJAmw%3D%3D)
- [TME](https://www.tme.com/us/en-us/details/sm-rvt50hqsnwc00-b/intelligent-displays-modules/riverdi/) 
- [DigiKey](https://www.digikey.pl/pl/products/detail/riverdi/SM-RVT50HQSNWC00-B/22077604?s=N4IgTCBcDaIEoDUAqBWADACQIoGUByA6gMJpoC0AQiALoC%2BQA)
<hr/>

## Specification

### CPU and memory

- **MCU** STM32U599NJH6Q/STM32U5A9NJH6Q
- **RAM** 2.5MB
- **Flash** 4MB
- **GPU** Neo-Chrom (GPU2D), Chrom-Art (DMA2D), Chrom-GRC (GFXMMU)

### Display

- **Resolution** 800x480
- **Display size** 5.0”
- **Color depth** 24bit
- **Technology** IPS
- **Brightness** 850 nits
- **DPI** 188 px/inch
- **Touch pad** Projected Capacitive

### Connectivity
- USB
- RS485
- CAN FD
- Micro SD card
- Battery holder
- [RiBUS](https://riverdi.com/ribus/)
- 1.27mm double row female pin header expansion connector (ability to connect  I2C, UART, USART, SPI, USB, PWM, DAC, ADC)

### Others

- 1 user push button
- 1 user LED
- **Power supply** 6-48V

<hr/>

## Performance

As you can see from the video it's clear that you won't have any issues with performance. 

### Frame rate (FPS)

We have measured a stable 33 FPS with 90-96% CPU load. While the frame rate is very good, the CPU use is a bit on the high side (it should be noted that the current software example does not utilize the GPU built into the STM32U599). Nevertheless, the animations were fluid, without any noticable hickups.

### Memory

The 2.5MB internal memory allows to use full size frame buffers. This improves the performance considerably, as it is not necessary to copy data from the display buffer into the frame buffer. The internal RAM is also significantly faster then the external RAM.

Although this board is not equipped with external RAM or flash the 2.5 MB internal RAM and the 4 MB internal flash should be enough for most of the UI applications.

## Quality

The board is very compact and it feels robust. It also looks professional. The display is flat, and it can be mounted without any additional holes in the housing using the attached double-sided adhesive tape. The connectors are robust, 1.25mm Molex type. They were designed to attach to external connectors, which is a good choice for an industrial product, as it does not limit the design.

### Display

This board comes with an IPS display so it has very good viewing angles. The display is also exceptionally bright.

![Viewing angles of the STM32 Embedded 5.0" display](/assets/cert_riverdi_STM32_embedded_5/display.webp)

### Touchpad

The display can be ordered with either an industrial grade projective capacitive touch panel or without touch panel. During our evaluation the touchpad was quite sensitive and accurate. We haven't found any issues with it.

### Robustness

This board was created with the definite purpose of being mounted into an end product even in a harsh environment.

## Development

To get started with the software part you can just clone [this repository](https://github.com/riverdi/riverdi-50-stm32u5-lvgl) from GitHub, and import it into STM32CubeIDE. You will find all peripherals pre-configured for you.

STM32CubeIDE is a powerful development environment with a fast and stable debugger. Note that for debugging you will need an external in-circuit debugger, like ST's own ST-LINK, or Segger's J-Link.

## Conclusion

Riverdi's 5.0" STM32 Embedded display is an outstanding product that perfectly aligns with our Professional certification standards. To sum it up, this display offers high brightness, exceptional visibility, and vibrant colors. It features an industrial touch panel, all impeccably assembled for stability. At its core, it boasts the power and modernity of an STM32U599 MCU.

On the software front, it utilizes ST's well-established and mature STM32CubeIDE.

If you're in search of a dependable solution that seamlessly combines stability and performance, you should definitely explore the Riverdi STM32 Embedded 5.0" display.
