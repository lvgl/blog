---
layout: post
title: NuMaker-HMI-MA35D1-S1 - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_gold.webp
---

**The NuMaker-HMI-MA35D1-S1 is an evaluation board for Nuvoton NuMicro MA35D1 series microprocessors, and consists of three parts: a NuMaker-SOM-MA35D16A81 SOM board, a NuMaker-BASE-MA35D1B1 base board and a 7” TFT-LCD daughter board. The SOM board integrates core components to simplify the system design, based on MA35D16A887C (BGA312 package, and stacking a 256 MB DDR), PMIC power solution, a 16 GB eMMC Flash, and two Gigabit Ethernet PHY. The NuMaker-HMI-MA35D1-S1 has rich peripherals such as 2 sets of Gigabit Ethernet, USB2.0 high-speed host and device, 2 sets of CAN FD, and SPI, I2C, UART, RS-485 serial communication ports for users to facilitate the evaluation in HMI and industrial control, home appliances, 2-wheel cluster, medical device, new energy applications, Machine Learning or your creative applications.**

Video with larger assets:
<iframe width="560" height="315" src="https://www.youtube.com/embed/cQvobSRDeis" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


Video with smaller assets:
<iframe width="560" height="315" src="https://www.youtube.com/embed/ONKWS5xem00" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


NuMaker-HMI-MA35D1-S1 earned Professional LVGL board certification which means user can use it to create amazing user interfaces without worrying about performance and quality.


<img src="https://lvgl.io/assets/images/cert_pro.png" alt="Professional LVGL certificate for NuMaker-HMI-MA35D1-S1">

### Buy now 

The NuMaker-HMI-MA35D1-S1 board can be purchased from the [Nuvoton Direct](https://direct.nuvoton.com/tw/numaker-hmi-ma35d1-s1?search_query=NuMaker-HMI-MA35D1-S1&results=1).

<hr/>

## Specification

### Microprocessor

- **MCU** MPU MA35D16A887C, Dual Cortex-A35 Cores (800MHz), Single Cortex-M4 Core (180MHz)
- **RAM** Internal stacking a 256MB DDR, Internal SRAM 128 + 256 KB
- **Flash** 128 KB Internal Boot ROM (IBR), 16 GB external eMMC Flash, 512MB external SPI NAND Flash, 1GB external raw NAND Flash
- **GPU** GC520L 2D GPU

### Display
- **Part number** TRICOMTEK CO., LTD ST70IPS1024600-C-M051
- **Resolution** 1024x600
- **Display size** 7"
- **Color depth** 24 bit, RGB888
- **Technology** IPS
- **DPI** 170 px/inch
- **Interface** RGB
- **Touch pad** 5-point capacitive, or 4 or 5 wire resistive

### Connectivity
- 1 Host/Device port and one Host port
- 1 LCM connector to connect
- 1 audio codec with microphone input and speaker output (With NAU88C22)
- 1 SIM card slot
- 1 External Bus Interface (EBI) header connector
- 1 Standard-SD (SD2.0) memory card slot
- 1 8-channel ADC header connector
- 1 MEMS Microphone. (MP34DT01-M)
- 1 MEMS G-Sensor. (MPU6500)
- 1 set of buzzer pads
- 2 Gigabit Ethernet transformer devices and two RJ45 port connectors
- 2 camera capture (CMOS sensor) header connectors
- 2 sets of UART transceivers and DB9 connectors. (With SN75C3232EDR)
- 2 sets of RS485 transceivers and header connectors. (With SN65HVD11DR)
- 2 sets of CAN FD transceivers and header connectors. (TCAN337GDR)
- 2 user LEDs
- 3 user key buttons

### Others

- **Power supply** 5V external power supply

<hr/>

## Performance

In NuMaker-HMI-MA35D1-S1 you get the power of an MPU with the simplicity of an MCU. 

### Frame rate (FPS)
Although the board is equipped with a high resolution display (1024x600) the 800 MHz Cortex-A35 CPU can handle the graphics with a great performance. Using teh smaller version of the Music player demo with got 60 FPS in average and 47 FPS with the larger version. It's not a surprise that the FPS drops with the larger demo as all the images and other widgets are larger, so it takes more time to render them.


### Memory
With the 256MB DDR RAM and the large flashes (512MB external SPI NAND Flash, 1GB external raw NAND Flash) you won't be out of memory any time soon. The 256MB DDR is absolutely enough for frame buffers (2.3MB/frame) and a lot of RAM will remain for the rest of your application. The flashes are enough to easily store large amounts of images, fonts or even videos.  

<hr/>

## Quality

### Display

The display is built with IPS technology and it has amazing viewing angle and brightness.

![Viewing angles of the NuMaker-HMI-MA35D1-S1 board's display](/assets/cert_numaker-hmi-ma35d1-s1/display.png)

### Touchpad

NuMaker-HMI-MA35D1-S1 can support capacitive and 4 or 5-wire resistive touchpads. With the capacive version it provides a smartphone-like experience, however it doesn't sense pens, or fingers in gloves. 

### Robustness

NuMaker-HMI-MA35D1-S1 is quite a robust development board. The display is mounted to the board in a very stable way, there are no hanging cables or loose parts. The board also offers a lot of peripherals so it can be used even for products manufactured in small quantities. 

<hr/>
 
## Development

We have tested the board using [RT-Thread](https://www.rt-thread.org/) (so without a Linux-like operating system) and the developer experience was great. RT-Thread and Nuvoton provide tools to build and flash the projects on Windows and Linux too. 

We have used the [GitHub repository of the board](https://github.com/OpenNuvoton/LVGL_NUMAKER-HMI-MA35D1) and we have found all the required information for the development in the README. 

[SquareLine Studio](https://squareline.io/) also supports exporting projects directly for this board. 

In addition to RT-Thread, MA35D1 also supports Linux development with Yocto, Buildroot and OpenWRT. For details you can visit [Nuvoton MA35D1 series page](https://www.nuvoton.com/products/microprocessors/arm-cortex-a35-mpus/ma35d1-high-performance-edge-iiot-series/).


## Conclusion

NuMaker-HMI-MA35D1-S1 is an amazing board with a powerful CPU, high quality and large display, and great developer experience. It's a great choice if you want to create something that really stands out! 
