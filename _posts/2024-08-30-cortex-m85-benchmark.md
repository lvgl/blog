
layout: post  
title: Benchmarking Compilers on a Cortex-M85 MCU with the SIMD Helium Instruction Set  
author: "kisvegabor"  
cover: /assets/cm85-benchmark/cover.png

---

**Have you heard about the Helium instruction set in Cortex-M52, M55, and M85 MCUs? Helium is a SIMD (Single Instruction Multiple Data) instruction set that allows executing the same instruction on multiple data points in a single clock cycle. This is particularly advantageous for UI-related tasks where thousands of pixels need to be filled or blended efficiently. Let’s explore how different compilers can utilize this powerful instruction set!**

## Glossary

Let's start with a glossary to clarify some key terms:

- **Arm**: The provider of MCU (Cortex-M) and CPU (Cortex-R and A) core IP. Arm doesn’t manufacture chips but sells the blueprints of its cores to chip vendors.
- **SIMD**: Stands for Single Instruction Multiple Data. It is a form of instruction-level parallelism where the same instruction is executed on an array (vector) of data simultaneously.
- **Helium**: Arm's SIMD instruction set designed for MCUs with Cortex-M52, Cortex-M55, and Cortex-M85 cores.
- **Arm2D**: A [library maintained by Arm](https://github.com/ARM-software/Arm-2D) to fully leverage the Helium instruction set for 2D rendering. LVGL has built-in support for it. More details can be found [here](https://docs.lvgl.io/master/integration/chip/arm.html).
- **GCC**: A free and mature C compiler.
- **LLVM**: A flexible and modern compiler infrastructure that can be adapted to many languages.
- **Ac6**: Arm’s proprietary compiler, based on LLVM.

## Test Configuration

### Hardware

We tested the Helium instruction set on a [Renesas EK-RA8D1](https://www.renesas.com/us/en/products/microcontrollers-microprocessors/ra-cortex-m-mcus/ek-ra8d1-evaluation-kit-ra8d1-mcu-group) development board, featuring:
- **MCU**: R7FA8D1BHECBD (Cortex-M85, 480 MHz)
- **RAM**: 1 MB internal, 64 MB external SDRAM
- **Flash**: 2 MB internal, 64 MB external Octo-SPI Flash
- **Screen Resolution**: 480x854
- **Color Depth**: 16-bit

### Software

During the benchmark, we tested GCC, LLVM, and Ac6 compilers in various configurations. Ready-to-use LVGL projects for the Renesas EK-RA8D1 with each compiler can be found at the following links:
- [GCC Project](https://github.com/lvgl/lv_port_renesas_ek-ra8d1_gcc)
- [LLVM Project](https://github.com/lvgl/lv_port_renesas_ek-ra8d1_llvm)
- [Ac6 Project](https://github.com/lvgl/lv_port_renesas_ek-ra8d1_ac6)

### LVGL

For maximum speed, LVGL was configured in partial rendering mode with a 64 kB buffer placed in TCM. Other memory options were slower and couldn’t fully utilize the power of Helium.

`LV_USE_OS` was set to `LV_OS_NONE` to eliminate any overhead from FreeRTOS in LVGL's rendering pipeline.

We used `lv_demo_benchmark` to measure performance.

LVGL was slightly modified to measure rendering times with 0.1 ms precision instead of 1 ms.

## Results

The following chart shows the differences in average rendering times using the LVGL benchmark demo:

![Benchmark results in various configurations](/assets/cm85-benchmark/chart.png)

So, what do the results tell us?

1. GCC doesn't support Helium, so it served as our baseline reference.
2. LLVM 17 and LLVM 18 both support Helium. The results were slightly faster than GCC, though LLVM 18 was marginally slower than LLVM 17.
3. Enabling Arm2D provided approximately a 20% performance boost. In this case, LLVM 18 was slightly faster than LLVM 17.
4. Ac6, with Helium support disabled (similar to GCC), was slightly faster than GCC.
5. Ac6 with Helium support but without Arm2D utilized Helium better than LLVM 17 or 18.
6. Ac6 combined with Arm2D resulted in a 26% performance boost.

## Conclusion

Rendering times were around 10 ms across all configurations on a 480x854 screen. This indicates that even without a GPU, software rendering on this MCU is sufficiently fast for most use cases.

This suggests that MCUs, even those designed for non-UI applications (e.g., motor control), can effectively drive screens with higher resolutions and rich graphics. To maximize the performance of your MCU, you can switch to LLVM and add Arm2D, which is available for free. For those needing even more performance, Arm's commercial Ac6 compiler is an excellent option. ([Evaluation version](https://docs.lvgl.io/master/integration/chip/arm.html#getting-started-with-ac6) available.)

