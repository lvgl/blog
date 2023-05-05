---
layout: post
title: DASQI - Apollo4B - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_standard.webp
---

**Apollo4 Blue is a microcontroller chip developed by Ambiq Micro that is purpose-built to serve as both an application processor and a coprocessor for battery-powered endpoint devices, including smartwatches, children’s watches, fitness bands, animal trackers, far-field voice remotes, predictive health and more1. It is built on the 32-bit Arm® Cortex®-M4 core with Floating Point Unit (FPU) and has up to 2MB of MRAM and 2.75MB of SRAM2. With this amount of compute power and storage, it can handle complex algorithms and neural networks while displaying vibrant, crystal-clear, and smooth graphics. If additional memory is required, external memory is supported through Ambiq’s high-bandwidth multi-bit SPI and eMMC interfaces. DASQI Apollo4B board can display 454*454 Round AMOLED Display, QSPI interface, Capacitive touch pad, and  has SD-CARD slot , supported LVGL file system interface.The board also also has RTK GPS high accuracy location positioning, Accelerometer + GYRO + E-Compass, Barometer, Current Sensor features, and  I2C/SPI/UART/MIPI interfaces.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/1fkQWptttp4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Apollo4B earned Standard LVGL board certification which means the users can be sure that it’s easy to use that board with LVGL and they can expect decent performance and quality.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for Apollo4B">

### Buy now

The Apollo4B board can be purchased directly from DASQI via the form at [https://dasqi.com/apollo4b/](https://dasqi.com/apollo4b/). 
<hr/>

## Specification

### CPU and memory

- **MCU** Ambiq Apollo4 Blue (192MHz)
- **RAM** 1.8MB SRAM 
- **Flash** 2MB of MRAM
- **GPU** 2D and 2.5D 

### Display

- **Resolution** 454x454
- **Display size** 1.39"
- **Color depth** 16bit,RGB565
- **Technology** AMOLED 
- **DPI** 460 px/inch
- **Touch pad** Capacitive

### Connectivity
- Bluetooth 5.1 Low Energy Technology


### Others
- SD card slot
- I2C/SPI/UART/MIPI
- Accelerometer
- BMP390 Barometer, High Performance Barometric Pressure Sensor for Altitude Tracking
- Current
- Compass
- Gyro
- GNSS

- **Power supply** USB Type C (5V)

<hr/>

## Performance

### Frame rate (FPS)

The Apollo4B board reached 22 FPS on the LVGL's certification benchmark. In the video, you can see that smaller changes were drawn quickly, and scrolling the list was smooth. However, the stripes jumping on the rhythm of the music and scaling of the cover image worked with ~17 FPS. 

### Memory

The chip is equipped with 2MB of MRAM (which is a non-volatile memory, similar to flash). It is enough to store the code of the UI and application, and some assets, but if you need a lot of images or many large fonts probably an external flash will be required too. 

On the other hand the internal 1.8MB SRAM is quite large. 2 full frame buffers will use only 50% of the RAM.

In case you would need extra memory, the chip has memory interfaces, so it's possible to add external RAM and flash.
 
<hr/>

## Quality

### Display
This board comes with an AMOLED display and an exceptional (460 dpi) pixel density. So the quality of the display is just amazing.

![Viewing angles of the Apollo4B board's display](/assets/cert_Apollo4B/display.jpg)

### Touchpad

The display is equipped with a capacitive touchpad. Therefore it recognizes touches with a good precision and provides a smartphone like experience.
The drawback is that the touchpad can not be used in gloves or with a pen.

### Robustness

Apollo4B is development board, not intended to placed to an end product. Regardless to it's quite robust. 


## Development

DASQI recommends the [Keil MDK IDE](https://developer.arm.com/Tools%20and%20Software/Keil%20MDK) to develop the project. They have placed the required get started material to [https://github.com/DASQI-CORP/apollo4bplusv10](https://github.com/DASQI-CORP/apollo4bplusv10). 

For more information visit [https://dasqi.com/apollo4b/](https://dasqi.com/apollo4b/)

## Conclusion

The DASQI Apollo4B board is compact product with many sensors and peripheries to try out. It's clearly designed to be used in smart watches. Its display is fantastic and can compete with smartwatches in the market. The performance of the board is okay. You can do a lot of great things with it, but for complex animations and transformation the FPS can drop below 15.

