---
layout: post
title: NuMaker-HMI-N9H30 - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_standard.webp
---

**Nuvoton N9H30 series with ARM926EJ-S core can operate at up to 300 MHz and can drive up to 1024x768 pixels in RGB parallel port. 
It integrated TFT LCD controller and 2D graphics accelerator, up to 16.7 million colors (24-bit) LCD screen output, and provides high resolution and high chroma to deliver gorgeous display effects. 
It embedded up to 64 MB DDRII SDRAM, along with ample hardware storage and computing space for excellent design flexibility.
For more information on Nuvoton HMI platforms, you can visit [https://www.nuvoton.com/products/gui-solution/gui-platform/](https://www.nuvoton.com/products/gui-solution/gui-platform/)**

<iframe width="560" height="315" src="https://www.youtube.com/embed/EqTG-3NHHAs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

NuMaker-HMI-N9H30 earned Standard LVGL board certification which means the users can be sure that it's easy to use that board with LVGL and they can expect decent performance and quality.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">

### Buy now

You can buy NuMaker-HMI-N9H30 [directly from Nuvoton](https://direct.nuvoton.com/en/numaker-hmi-n9h30).

<hr/>

## Specification

### Micrcontroller

- **MCU** [N9H30F61IEC (or N9H30F63IEC)](https://www.nuvoton.com/products/microprocessors/arm9-mpus/-n9h-series/n9h30f61iec/?tab=1) ARM926EJ-S core, 300 MHz
- **RAM** Built in Built-in 64 MB DDR II Memory, 56 KB internal SRAM
- **Flash** 16 KB internal Boot ROM (IBR), external 128 MB NAND Flash and 16 MB SPI Flash
- **GPU** GE2D

### Display

- **Resolution** 800x480
- **Display size** 7"
- **Color depth** 24 bit, RGB888
- **Technology** TN
- **DPI** 133 px/inch
- **Touch pad** Resistive
- **Interface** RGB

### Connectivity
- 10/100Mb Ethernet RJ45 
- TF socket for SD card
- USB2.0 HS and FS
- MAX3485 for RS485
- SN65HVD230 for CAN
- 2 pcs of RS232 port

### Others

- **Power supply** USB micro (5V)

<hr/>

## Performance

### Frame rate (FPS)

The MCU's 300 MHz clock speed and 800x480 resolution result in a decent performance which should be suitable for most of the cases.

To evaluate the board we used a project provided by Nuvoton (see the details below). 
With the driver shipped with this project the board reached 22 FPS on the LVGL's certification benchmark.

In the video you can see, that even the most complex transformations or scrolling the whole screen with all the animations were smooth.


### Memory

NuMaker-HMI-N9H30 has 128 MBs of external flash. Let's count what is it enough for! 
One screen-sized wallpaper has `800x480x32bit=1500kB` size. Into 128MB you can fit 85 uncompressed wallpapers (not counting the program size).
Or 128 MB can be size of a one hour long video too.

As there is no internal RAM in this MCU "only" the 64 MB built-in DDR RAM can be used. Into this 2 or 3 frame buffers can fit easily.
You can also load assets into this memory from slower memories (e.g. SD card or SPI flash)

#### Storing assets

Images and fonts can be stored in 4 kinds of memories:

1. SPI flash: slow, non volatile, and middle sized
2. NAND flash: faster, non volatile, large
3. SD card: the slowest but can have a huge size
4. DDR RAM: fast, volatile, and large. 

<hr/>

## Quality

### Dispay

The display is built with TN technology so its viewing angle and color correctness are only average.

![Viewing angles of the NuMaker-HMI-N9H30 board's display](/assets/cert_NuMaker-HMI-N9H30/display.jpg)

### Touchpad

NuMaker-HMI-N9H30 is built with a resistive touchpad. Therefore it recognizes touch with a pen or in gloves. On the other hand customers might get used to the capacitive touchpads that are found in smartphones.

### Robustness

NuMaker-HMI-N9H30 is a development board for evaluation and not designed to be added to an end-product. 
Although there are holes to mount the board is quite robust.

For real life applications a secondary board might be required for sensors or other peripheries.

The [schematic of the board](https://www.nuvoton.com/products/gui-solution/index.html)
is publicly available and it can be a good starting point to develop your custom board based on N9H30F61IEC.

<hr/>
 
## Development

NuMaker-HMI-N9H30 is supported by [RT-Thread](https://www.rt-thread.io/).

In its core RT-Thread is an RTOS but in reality it's much more than that. It's a complete ecosystem with
- [Rt-Thread Studio](https://www.rt-thread.io/studio.html) which a custom IDE with many useful features
- [Env](https://www.rt-thread.io/download.html?download=Env) which is a command line tool to covert a project to an other kind of project/build system
- [Software Package](https://packages.rt-thread.org/en/index.html) manager. (LVGL is also [available](https://packages.rt-thread.org/en/detail.html?package=LVGL))
- Many [Supported boards](https://www.rt-thread.io/board.html)

Nuvoton provided a ready to use RT-Thread project for us to test the board. You can find it here: [https://github.com/OpenNuvoton/LVGL_NUMAKER-HMI-N9H30](https://github.com/OpenNuvoton/LVGL_NUMAKER-HMI-N9H30).
It also uses the fill features of the N9H30F61IEC MCU's GPU.


As RT-Thread Studio is not available for Linux and we tested on Linux we have used the [Linux version of Env](https://github.com/RT-Thread/env) to convert.
[This video](https://www.youtube.com/watch?v=dEK94o_YoSo) was really helpful to quickly learn how to use `Env`.

We converted the project to both Makefile and built it. We also tried CMake which also worked well.

Finally, we used [NuWriter Linux](https://github.com/OpenNuvoton/NUC970_NuWriter_CMD) to flash the board. It was less than 1 seconds to upload the bin file to DDRAM and only a few seconds to load to flash.
 

## Conclusion

NuMaker-HMI-N9H30 is versatile and powerful board with state of the art peripheries. 

The fact NuMaker-HMI-N9H30 is supported by RT-Thread makes the development easy and fast.

We highly recommend NuMaker-HMI-N9H30 for UI projects!


