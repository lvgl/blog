---
layout: post
title: RT-Thread, Renesas Electronics RA6M3 HMI board - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_standard.webp
---

**This is a high-cost-performance graphic evaluation kit brought to you by RT-Thread in collaboration with Renesas and LVGL. Say goodbye to traditional HMI + main control board hardware and hello to the full capabilities of HMI + IoT + control with just one set of hardware. With Renesas’ high-performance RA6M3 chip and RT-Thread’s software ecosystem at its core, the HMI Board packs a punch with its strong hardware performance and rich software ecosystem. This makes it easier than ever for developers to create cutting-edge GUI smart hardware products.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/TU4m8xGO8aE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
The RA6M3 HMI board earned Standard LVGL board certification which means the users can be sure that it’s easy to use that board with LVGL and they can expect decent performance and quality.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for ESP Terminal 3.5">

### Buy now

You can order your RA6M3 HMI board by filling [this form](https://docs.google.com/forms/d/e/1FAIpQLSfGcS7HENxMaOib-a1NWe0SQI6m1aoNT1z6T2dEXSiGNXxqFw/viewform?pli=1). 

<hr/>

## Specification

### CPU and memory

- **MCU** Renesas RA6M3 (Cortex-M4F core, 120MHz)
- **RAM** 640KB internal
- **Flash** 2MB internal
- **GPU** Dave2D + JPEG decoder

### Display

- **Resolution** 480x272
- **Display size** 4.3"
- **Interfase** RGB
- **Color depth** 16bit,RGB565
- **Technology** IPS
- **DPI** 128 px/inch
- **Touch pad** Capacitive

### Connectivity
- Ethernet
- Audio
- RW007 (SPI high-speed WIFI)
### Others

- **Power supply** 5V (USB C)

<hr/>

## Performance

You can expect moderate performance from the 120MHz MCU on a 480x272 display size. The RA6M3 Renesas MCU is equipped with Dave2D GPU which helps to offload the MCU.

### Frame rate (FPS)


The RA6M3 HMI board reached 24 FPS on the LVGL's certification benchmark. The animated stripes that can not be GPU accelerated caused a drop to ~20 FPS, however for the more common parts (where the list was being scrolled) there was steady 33 FPS.

### Memory

The huge internal SRAM (640kB) allows storing even two full frame buffers (255 kB each) or one frame buffer and a smaller draw buffer for LVGL.

The 2MB internal flash should be enough for the application, LVGL, and some images and assets, however it might be tight for multiple wallpapers and large fonts with many characters. 
 
<hr/>

## Quality

### Display
This board comes with an IPS display so it has an amazing viewing angle. We have found the brightness a little bit low but it should be suitable for most of the applications. 

![Viewing angles of the RA6M3 HMI board's display](/assets/cert_RA6M3_HMI/display.jpg)

### Touchpad

The display is equipped with a capacitive touchpad. Therefore it recognizes touches with a good precision and provides a smartphone like experience.
The drawback is that the touchpad can not be used in gloves or with a pen.

### Robustness

The display of the RA6M3 HMI board is attached to the board in a robust way. The board has 4 holes in each corner making it simple to mount to any end product.

## Development

As this board was developed by RT-Thread and Renesas Electronics, the environment for development is [RT-Thread Studio](https://www.rt-thread.io/download.html?download=Studio). If you are not familiar with it yet, we highly recommend trying it out. It's a modern, elegant, Eclipse based IDE where you can manage your project and its packages.


In [this video](https://www.youtube.com/watch?v=YGR2pw3ZXtc) you can learn how to get started with the RA6M3 HMI board in RT-Thread Studio. And [here](https://github.com/RT-Thread/rt-thread/tree/master/bsp/renesas/ra6m3-hmi-board) you can find a getting started guide for MDK Keil too. 

The board is equipped with a DAP link so you need only an USB-C cable to flash and debug the board.

If you need any support you can contact RT-Thread directly via contact@rt-thread.org


## Conclusion

RA6M3 HMI board is a compact board with a decent display and a lot of pins for extension. Its performance should be enough to handle UI with average complexity and visual effects.
With RT-Thread Studio you will have access to many packages hosted in [RT-Thread's Software Package manager](https://packages.rt-thread.org/en/index.html). 


