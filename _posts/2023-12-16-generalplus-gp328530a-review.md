---
layout: post
title: Generalplus Technology Inc. GP328 HMI demo board - board certification review
author: "zjanosy"
cover: /assets/cover_cert_gold.webp
---

**GP328530A, a highly integrated SoC by Generalplus, is a high cost-performance ratio solution for multi-media and video streaming applications. It is developed with a high performance and power efficient ARM's ARM926EJ-S core operating at up to CPU/system 513/171MHz with significant enhancements in image, video processing, and power management for power savings. Other features include DDR/DDR2 memory, GPDLA Deep Learning Accelerator, JPEG CODEC engine, TFT-LCD/MIPI DSI interface, MIPI CSI interface, scaling engine, Image Processing Unit (IPU), Picture Process Unit (PPU), Sound Process Unit (SPU), Ethernet MAC, USB 2.0 High speed etc. The GP328530A processor is designed to connect with various types of memory card interfaces such as SD and MMC. Not only does GP328530A feature the high-speed performance, but it is also a cost-effective system and - the most importantly - compatible with all ARM based programs.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/T7D_-XyZns0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The Generalplus GP328 HMI demo board earned Professional LVGL board certification which means users can use it to create amazing user interfaces without worrying about performance and quality.


<img src="https://lvgl.io/assets/images/cert_pro.png" alt="Professional LVGL certificate for Generalplus GP328 HMI demo board">

### Buy now

You can purchase the Generalplus GP328 HMI demo board on [Alibaba](https://www.alibaba.com/product-detail/GP328530A-HMI-demo-board_10000014381929.html?spm=a2700.shop_plser.89.2.766738590NVIYM)

<hr/>

## Specification

### CPU and memory

- **SoC** GP328530A (ARM926EJ-S core, up to 513MHz)
- **RAM** 238kB SRAM + 32MB DDR (internal)
- **ROM** 36kB (internal)
- **Flash** 8MB NOR + 128MB NAND (external)
- **GPU** Generalplus proprietary 2D/2.5D Picture Process Unit
- **TPU** Generalplus proprietary AI Deep Learning Accelerator

### Display

- **Part number** JLL043JGI50-43103
- **Resolution** 800x480
- **Display size** 4.3"
- **Interfase** RGB888
- **Color depth** 24bit
- **Technology** IPS
- **Brightness** 500 nit
- **DPI** 217 px/inch
- **Touch pad** Capacitive

### Connectivity

- 10/100Mb Ethernet RMII interface
- TF socket for SD card/WIFI
- USB2.0 HS host/device
- MAX485 for RS485
- RS232 port
- EMAC connector for Ethernet or WIFI/BLE extension
- CSI connector for CSI or SD/SPI interface extension
- 4-channel ADC header connector
- Audio codec with microphone input and speaker output

### Others

- **Power supply** DC 5V, USB

<hr/>

## Performance

As you can see from the video the animations and scrolling run smoothly. There were no performance bottlenecks observed.

### Frame rate (FPS)

Using the 8.3.4 release of LVGL we have measured an average of 37 FPS with the Music Demo application. The animated arcs on the Widget Demo application run at a whopping 62 FPS with a CPU load of 38-44%. This performance is more than adequate for smooth UI experience in HMI applications.

Generalplus uses their own proprietary buffering scheme, therefore we did not test the board with various buffer configurations.

### Memory

The board has 32MB DDR SDRAM, which is enough for multiple frame buffers, and there is still a lot of memory available for user application.

<hr/>

## Quality

### Display

The board comes with an IPS display therefore it has good viewing angles, although the brightness is somewhat reduced when viewed from the sides. The brightness on the demo board was a little low despite of the claimed 500 nits, but this can be adjusted by replacing some resistors. The resolution of 800x480 pixels is very high for the size of the display (4.3"), which results in beautiful, razor sharp text and images.

![Viewing angles of the Generalplus GP328 HMI demo board 4.3" display](/assets/cert_gp328530a/display.jpg)

### Touchpad

The Generalplus GP328 HMI demo board comes with a very responsive capacitive touch screen. During our evaluation the touch screen was very accurate and we haven't found any issues with it.

### Robustness

This board looks solid and well laid out. It includes mounting holes as well. It has a number of connectors around the edges for various extensions, and includes a barrel-type DC power connector as well.

## Development

Generalplus provides their own software tools for the development. These include a fully-blown IDE, called G+, which integrates a GDB-based debugger. The board itself contains an emulator which can be connected via USB, so no external hardware is needed for development.

The G+ IDE editor has an English interface, and it includes all the tools we are used to on the more common platforms: syntax highlighting, autocomplete, auto suggest, matching braces, collapsible blocks, find declaration/definition of functions or variables, etc.

The SDK, which includes several application examples -- including the LVGL demo -- can be downloaded from [here] (https://nas.higherway.com.tw/sharing/bj9j2kidr). There is also a short User Guide, which can be downloaded from [here] (https://nas.higherway.com.tw/sharing/jWDwNWHCF). The included documentation is rather sparse, but at least it is in English. There is a detailed, English language Programming Guide available under NDA.

The LVGL demo project was simple to build. It compiled without problems, and downloading to the board worked like a breeze. The debugger also worked without glitches. Overall, the initial impressions were quite good.

## Conclusion

The Generalplus GP328 HMI demo board is a solid product with good software support. It is self-contained, includes a lot of interfaces including USB HS, Ethernet, RS232/485, MIPI CSI/DSI. Although the processor is based on a previous generation of ARM cores (ARM926EJ-S), its performance is more than adequate for HMI tasks, and the main SoC includes many specialized peripherals for various applications. The CPU copes with the rather high resolution display easily, and there is plenty of capacity left for user applications.

The IPS display has good visibility with wide viewing angles. The colors are vivid and the resolution is very high for the size of the display, resulting in razor sharp text and images. The touchscreen operates smoothly and responds quickly.

Development support is good, the tools are easy to use and available with an English interface. Documentation is also available in English.

In summary, Generalplus's HMI solution is recommended even for demanding industrial applications.
