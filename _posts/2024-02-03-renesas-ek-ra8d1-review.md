---
layout: post
title: Renesas EK-RA8D1 - Board Certification Review
author: "kisvegabor"
cover: /assets/cover_cert_gold.webp
---

**The EK-RA8D1 evaluation kit enables users to effortlessly evaluate the features of the RA8D1 MCU Group and develop embedded systems applications using Renesas' Flexible Software Package (FSP) and e2 studio IDE. Utilize rich on-board features along with your choice of popular ecosystem add-ons to bring your big ideas to life.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/LHPIqBV_MGA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The Renesas EK-RA8D1 board has earned the Professional LVGL Board Certification. This means users can create impressive user interfaces without worrying about performance and quality.

<img src="https://lvgl.io/assets/images/cert_professional.png" alt="Professional LVGL certificate for Renesas EK-RA8D1" style="display:block;">

### Buy Now

You can purchase the Renesas EK-RA8D1 board from various sources:
- [List of sources]

<hr/>

## Specification

### CPU and Memory

- **MCU:** R7FA8D1BHECBD (Cortex-M85, 480MHz)
- **RAM:** 1MB internal, 64MB external SDRAM
- **Flash:** 2MB internal, 64MB External Octo-SPI Flash
- **GPU:** Dave2D

### Display

- **Resolution:** 480x854
- **Display Size:** 4.5"
- **Interface:** 2-lane MIPI
- **Color Depth:** 24-bit
- **Technology:** IPS
- **DPI:** 217 px/inch
- **Touch Pad:** Capacitive

### Connectivity
- Camera expansion board
- Micro USB device cable (type-A male to micro-B male)
- Micro USB host cable (type-A male to micro-B male)
- Ethernet patch cable

### Others
- **Power Supply:** 5V Micro USD

<hr/>

## Performance

The RA8D1 MCU is packed with a lot of horsepower:
- It operates at 480 MHz.
- It includes the new Cortex-M85 core with Helium (SIMD) instructions.
- It features the Dave2D GPU.

It is noteworthy that this is the first board we certified with LVGL v9. LVGL v9:
- Offers better performance than v8 even with pure software rendering.
- Provides better GPU integration.
- Works more efficiently with an RTOS, allowing other tasks to run while the GPU is active.
- Includes more detailed benchmarks.

As observed in the video, the FPS only drops in highly complex scenarios, while CPU usage remains low. For instance, when multiple ARGB images were rotated, the FPS dropped to 12 and the rendering time increased to 66 ms, but the CPU usage stayed at 10%. Using software rendering only the FPS would be significantly lower, and the CPU usage would peak at 100%.

## Memory

In our benchmark, we used [this project](https://github.com/lvgl/lv_renesas/tree/master/lv_ek_ra8d1), which utilizes two screen-sized buffers in "direct mode". This means that LVGL updates only the changed areas in screen-sized buffers, which are directly used as frame buffers.

Unfortunately the internal RAM is insufficient for storing two full frame buffers, therefore the frame buffers were allocated in the slower external SDRAM. This limits the performance. However, with a smaller display, better performance can be achieved by placing one frame buffer in the internal RAM, and allocating a 1/10 screen-sized buffer for partial rendering. 

The board's substantial amount of external RAM and flash makes it an excellent choice for a wide variety of applications, from advanced networking to AI-related products.

<hr/>

## Quality

### Display
The board features an IPS display, offering exceptional viewing angles and brightness. 

![Viewing angles of the Renesas EK-RA8D1](/assets/cert_renesas_rA8d1/display.webp)

### Touchpad

The Renesas EK-RA8D1 includes a capacitive touchpad that provides a modern, smartphone-like experience. During our evaluation, the touchpad was highly accurate and we encountered no issues.

### Robustness

While the Renesas EK-RA8D1 is a development board, it is equipped with the necessary mounting points for stable installation of the display to the main PCB.

## Development

As an Official LVGL Partner, Renesas ensures first-class support for this board. We host a [ready-to-use project on GitHub](https://github.com/lvgl/lv_renesas/tree/master/lv_ek_ra8d1) where LVGL is continuously tested and updated. We work closely with Renesas engineers to resolve any issues and optimize performance and the developer experience.

To get started, simply clone the [lv_renesas](https://github.com/lvgl/lv_renesas) repository with submodules, open the `lv_ek_ra8d1` project in E2 Studio, compile, and run. 

E2 Studio, an Eclipse-based IDE from Renesas, offers everything needed for a great development experience, including:
- Device configuration tools.
- Special Renesas Views for tracing and debugging.
- Familiar Eclipse debugging tools.

## Conclusion

What truly sets the EK-RA8D1 apart is its seamless integration with LVGL, which allows developers to create stunning, high-performance user interfaces. The board's Professional LVGL Board Certification is a testament to its capabilities, ensuring that performance and quality are never compromised. The IPS display and capacitive touchpad further enhance the user experience, offering crisp visuals and responsive touch interactions.

Moreover, the continuous support and updates provided through our partnership with Renesas make this board a reliable choice for developers. Whether it's for advanced networking, AI-related projects, or any innovative embedded system application, the Renesas EK-RA8D1 board is undoubtedly a top-tier choice. Its performance in our benchmarks, especially with LVGL v9, showcases its capability to handle complex tasks with ease while maintaining efficiency.

In conclusion, the Renesas EK-RA8D1 board is a testament to the innovation and quality that Renesas brings to the table. Its compatibility with LVGL, robust features, and exceptional performance makes it an ideal choice for developers looking to push the boundaries of what's possible in embedded systems.







