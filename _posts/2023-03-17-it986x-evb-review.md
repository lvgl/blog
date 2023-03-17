---
layout: post
title: IT986x EVB - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_gold.webp
---

**IT986x SoC series is equipped with dual ARM9 CPUs which can operate at up to 800MHz.
It has a powerful 2D graphics engine that supports up to 1080p video, allowing for the
implementation of a GUI that is both vivid and responsive. As for the panel resolution, it can
display up to 2160*1080 pixels. MIPI, RGB, LVDS and other panel interfaces are also
supported. It is embedded with up to 1Gb DDR3 memory, with various peripheral interfaces
reserved, giving designers great expandability. Support FreeRTOS within the
comprehensive ITE SoC SDK.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/ksQeSIyR8EY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

IT986x EVB earned Professional LVGL board certification which means user can use it to create amazing user interfaces without worrying about performance and quality.

<img src="https://lvgl.io/assets/images/cert_pro.png" alt="Professional LVGL certificate for IT986x EVB ">

### Buy now

The IT986x EVB board can be purchased from the manufacturer by contacting them at [https://soc.ite.com.tw/en/Contact](https://soc.ite.com.tw/en/Contact).

<hr/>

## Specification

### Micorcontroller

- **MCU** SoC CPU: 800MHz 32-bit ARM9 (CPU1) + 400MHz 32-bit ARM9 (CPU2)
- **RAM** Built-in 64MB DDR2
- **Flash** External NOR flash 32MB
- **GPU** 2D Engine

### Display

- **Resolution** 1280x480
- **Display size** 6.8"
- **Color depth** 24 bit, RGB888
- **Technology** IPS
- **DPI** 200 px/inch
- **Touch pad** Capacitive
- **Interface** MIPI

### Connectivity
- USB 2.0 OTG
- SD/SDIO
- NOR/Nand Flash QSPI
- Ethernet MAC 10/100 Mbps
- Audio CODEC ADC, DAC
- 4 I2C
- 6 UART
- 2 SPI
- 8 ADC
- 2 CAN
- 1 RTC
- Wireless Module (Plug in) 4G, WiFi, Bluetooth

### Others

- **Power supply** External (12V)

<hr/>

## Performance

### Frame rate (FPS)

The MCU's 800 MHz clock speed results in a great performance even on the larger, 1280x480 display. Large animations and image transformation, screen sized fading effects are working well too. The FPS drops only at the beginning of the video where there are huge stripes are going into the album cover, but it's a quite uncommon case for an application and still considered a great for such a large screen.

The board reached 42 FPS on the LVGL's certification benchmark. 


### Memory

IT986x EVB comes with a huge 64MB DDR2 RAM. One frame buffer needs only 2.4MB RAM so you will have a lot of space for the application and assets. 

The 32 MB flash is also capable of storing wallpapers, other images, fonts, or videos.

If needed the assets can be preloaded to RAM from SD card or a website. 

<hr/>

## Quality

### Display

The display is built with IPS technology so its viewing angles are amazing. The brightness is also great.

The 1280x480 resolution means a quite wide display (8:3) which is rare among the development boards. It can be a good choice if your project needs a display with a special aspect ratio like this. 

![Viewing angles of the IT986x EVB board's display](/assets/cert_it986x-evb/display.jpg)

### Touchpad

IT986x EVB is built with a capacitive touchpad. Therefore it provides a smartphone-like experience, however it doesn't sense pens, or fingers in gloves. 

### Robustness

According to manufacturer majority of their customers use this board to pre-develop projects to present to the end-customer. 

Multiple display panels are available for this board therefore the display is not mounted the board.

<hr/>
 
## Development

IT986x EVB comes with a custom SDK. After registering to [the website](https://soc.ite.com.tw/en/Contact) the SDK, compiler and documentation can be downloaded. The documentation explains step-by-step how to get started, create a project and compile it.


It's recommended to use Windows for development, but Linux is also supported.

The SDK uses FreeRTOS so you can develop in a well-known environment.

The SDK is shipped with many examples for various use cases, including demos for LVGL.

## Conclusion

IT986x SoC is equipped with a really powerful microcontroller and a beautiful display with a rare aspect ratio. The documentation explains very well how to use this board and you can try out all the features with the help of many available examples.



