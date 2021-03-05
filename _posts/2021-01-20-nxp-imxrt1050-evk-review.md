---
layout: post
title: NXP i.MX RT1050 EVK review for LVGL
author: "kisvegabor"
cover: /assets/gui_guider/cover.png
---

**The i.MX RT1050 EVK is a 4-layer through-hole USB-powered PCB. 
At its heart lies the i.MX RT1050 crossover MCU, featuring NXP’s advanced implementation of the Arm® Cortex®-M7 core. 
This core operates at speeds up to 600 MHz to provide high CPU performance and great real-time response.
Support for FreeRTOS™ available within the MCUXpresso SDK.
The i.MX RT1050 EVK board is now supported by Arm® Mbed™ OS and Zephyr™ OS, both open source embedded operating systems for developing the Internet of Things.**


<iframe width="560" height="315" src="https://www.youtube.com/embed/D9RLVtzd3eE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### Certification
i.MX RT1050 EVK earned Standard LVGL board certification which means the users can be sure that it's easy to use that board with LVGL and they can expect decent performance and quality.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">

### Buy now
The i.MX RT1050 EVK board can be purcuased directly from NXP or distributors. See [here](https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK#buy).

<hr/>

## Specification
### Micorcontroller
- **MCU** [i.MX RT1050](https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/i-mx-rt-crossover-mcus/i-mx-rt1050-crossover-mcu-with-arm-cortex-m7-core:i.MX-RT1050) ARM-Coretx-M7, 600 MHz
- **RAM** 512 kB internal, 32 MB SDRAM
- **Flash** 64 MB Hyper Flash, 8 MB QSPI Flash
- **GPU** PXP

### Display
- **Resolution** 480x272
- **Display size** 4.3"
- **Color depth** 16 bit, RGB565
- **Technology** TN
- **DPI** 100 px/inch
- **Touch pad** Resistive
- **Brightness**
- **Interface** RGB

### Connectivity
- TF socket for SD card
- 6-Axis FXOS8700CQ Digital Motion Sensor: 3D Accelerometer (±2g/±4g/±8g) + 3D Magnetometer
- USB PD-PHY and CC-Logic: PTN5110 : USB PD TCPC PHY IC

### Others
- **Board dimmensions** 
- **Power supply** USB mini (5V)

<hr/>

## Perfromance

### Frame rate (FPS)

### Memory

The i.MX RT1050 chip has plenty of internal RAM (512 kB), external SDRAM (32 MB), has no internal flash but has 2 type of external flashes. Let's what graphicsa configuration can work with these memory.

#### Only internal RAM
The 512 kB internal RAM can be used to store a frame buffer directly. LVGL still needs 1 or 2 smaller (1/10..1/5 screen sized) draw buffers where rendering hapens and these buffer content should be copied to the frame buffer. 
IF the frame buffer is placed into the internal RAM, accessign the frame buffer will be very fast. Unfortunatly 2 frame buffers can not fit into the internal RAM so this way "real double buffering" can not be achieved. 
Therefore some tearing might be visible but it needs to be tested with the concarate application.
 
#### Framebuffer in external RAM
The large external RAM makes possible to store 2 frame buffers and handle VSYNC (swap the frame buffers when in the moment when the dislay is not being refreshed therefore no tearing will be visible).
The draw buffers of LVGL still should be stored in internal RAM becaue:
1. they are small and can fit easily into internal RAM
2. they are read/written many times per pixel so it's important to keep memory access fast

#### Storing assets
Images and fonts can be stored in 3 kind of non-volatile memories:
1. Hyper flash: fast, non volatile and large
2. QSP flash: slower, non volatile and middle sized
3. SD card: the slowest but can have a huge size

If there are performance issues due to the memory bandwidth it's possible to load the assets to internal or external RAM durng initialization.
 
 
<hr/>

## Quality
### Dispay
The display is built with TN technology therefore its viewving angle and color correctness is only average.

<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">
<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">
<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">
<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">
<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for i.MX RT1050-EVK">

### Touchpad
i.MX RT1050-EVK is built with a resistive touchpad. Therefore it recognises touch with pen or in gloves. On the other hand costumers might get used to the capacitve touchpads that are found in smarphones. 

### Roubustness
i.MX RT1050-EVK is a develpment board for evelaotaion and not designed to be added into a product. Altough there are holes to mount the board but the display is not glued to the board.

For real life application probably a secondary board with the required sensors or other pheriphheries will be required.


<hr/>
 
## Development
### IDE
asd

### SDK
asd

### Drivers
asd

### Programming/Debugging
The board is equipped with programmer/debugger so all you need to do is connect the USB cable and hit Run or Debug buttons. The debug experiement was very smooth. The usual debug features of Eclipse was working well. 
Steping throgh the instruction was fast.


## Conclusion


