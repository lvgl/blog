---
layout: post
title: Riverdi STM32 Embedded 10.1" display - board certification review
author: "kisvegabor"
cover: /assets/cover_cert_standard.webp
---

**STM32 Embedded 10.1” display is all-in-one complete and open-platform solution being able to independently handle the visual layer of devices with the need for high computing performance. The STM32 Embedded Displays series are industrial-quality LCD-TFT solutions based on the STM32H757XIH6 microcontroller. It has been designed in a way that allows to meet most of the hardware and programming challenges faced by engineers, including access to all interfaces.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/NGfRHC7HjAs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The STM32 Embedded 10.1" display board earned Standard LVGL board certification which ensures that the device has a decent performance and quality..


<img src="https://lvgl.io/assets/images/cert_standard.png" alt="Standard LVGL certificate for Riverdi STM32 Embedded 10.1" display">

### Buy now

You can purchase the STM32 Embedded 10.1" display from various sources:

- [Riverdi's website](https://riverdi.com/product/10-1-inch-lcd-display-capacitive-touch-panel-optical-bonding-uxtouch-stm32h7-rvt101hvsnwc00-b)
- [Mouser](https://www.mouser.pl/c/?q=RVT101HVSNWC00)
- [TME](https://www.tme.com/us/en-us/katalog/?queryPhrase=RVT101HVSNWC00) 

<hr/>

## Specification

### CPU and memory

- **MCU** STM32H757XIH6 (Cortex-M7 + M4 core, 480MHz)
- **RAM** 1MB internal, 8MB external (32 bit access)
- **Flash** 2MB internal, 64MB external flash
- **GPU** Chrom-Art (DMA2D)

### Display

- **Resolution** 1280x800
- **Display size** 10.1"
- **Interfase** LVDS
- **Color depth** 24bit
- **Technology** IPS
- **DPI** 150 px/inch
- **Touch pad** Industrial Capacitive or no touch

### Connectivity
- CAN FD
- RS232, RS485
- USB
- DRV2605L (haptic driver)
- [RiBUS](https://riverdi.com/ribus/)
- ETH addon
- universal interface connector (ability to connect  I2C, UART, USART, SPI, USB, PWM, DAC, ADC)
 
### Others

- **Power supply** 6-48V

<hr/>

## Performance

The drivers are configured for standard double buffering. It means even is a single pixel changes on the screen, the whole screen is updated. 

While the music was played the MCU as running at 100% and reached 20-22 FPS, which is really decent on this high resolution display.

### Frame rate (FPS)

Finally the average frame rate was 25 and it was mostly above 20.

### Memory

The 1280 x 800 display is likely one of the largest I've ever seen driven by a standard MCU. Such a large display necessitates a substantial amount of RAM for frame buffers and general rendering. However, the Riverdi STM32 Embedded 10.1" display board rises to the challenge, offering all the power and memory needed to effectively utilize this exceptional display.

In the video, LVGL was operating in 16-bit mode. This setup required 1280 x 800 x 2 bytes = 2MB for a single frame buffer. Given that the driver configuration used three frame buffers, there was still 2MB available in the 8MB external RAM, and the internal RAM was not utilized by the draw buffers or frame buffers at all.

LVGL itself requires approximately 64kB RAM for the widgets (though the actual size varies depending on the specific user interface). Beyond this, the entire 1MB of internal RAM and the remaining 2MB of external RAM are available for the application. Additionally, images or fonts can be loaded into this space from an SD card or external flash.

The 8MB external RAM is also capable of supporting two 32-bit frame buffers. Therefore, with an adjusted driver configuration, by sacrificing some memory, enhanced color depth can also be achieved.

<hr/>

## Quality

### Display
This board comes with an IPS display so it has amazing viewing angles and brightness too. 

![Viewing angles of the STM32 Embedded 10.1" display](/assets/cert_STM32_embedded_10/display.jpg)

### Touchpad

Riverdi's STM32 Embedded 10.1" display can be ordered with an industrial grade capacitive touch pad or without touchpad as well.

During our evaluation the touchpad was very accurate and we haven't found any issues with it.

### Robustness


This board is designed for integration into a final product, even in challenging environments. It features a durable build, a smooth front surface, pre-drilled mounting holes, and reliable connectors.

## Development

To get started with the software part you can just clone [this repository](https://github.com/riverdi/riverdi-101-stm32h7-lvgl) from GitHub, and import it into CubeIDE. And that's it. You will find all peripherals pre-configured for you. All you need to do is connect the board and hit the build and flush buttons.

As you are probably used to you from ST you will find a very fast and stable debugger.

## Conclusion


Riverdi's STM32 Embedded 10.1" display stands out as a high-caliber, professional device, tailored for serious industrial applications. Its exceptional quality is evident, aligning perfectly with the standards of a Professional certificate. The display boasts high brightness, excellent visibility, and vibrant colors, all complemented by an industrial-grade touch panel. These features are integrated into a robust and stable construction. At its core, the device is powered by a powerful and contemporary STM32H7 microcontroller unit (MCU).

On the software front, it utilizes ST's renowned and well-established CubeIDE, ensuring reliability and performance. This display is an ideal choice for those seeking a combination of stability and high performance in industrial applications.
