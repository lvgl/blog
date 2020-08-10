---
layout: post
title: "LVGL's Micropython binding on STM32F746 Discovery"
author: "kisvegabor"
cover: /assets/microptyothon-and-lvgl/cover.png
---

**This post summarizes how to get started with Micropython and LVGL on STM32F746 Discovery**


## Get the Micropython

The fork of the [original Micropython](https://github.com/micropython/micropython) repository with LVGL is available at [https://github.com/lvgl/lv_micropython](https://github.com/lvgl/lv_micropython).

Simply clone it with *git*:
```sh
git clone --recurse-submodules https://github.com/micropython/micropython.git
```

These libraries also need to be installed:
```sh
sudo apt-get install build-essential libreadline-dev libffi-dev git pkg-config python
```

## Build for STM32F746 Discovery

Prepare Myropython for Cross compiling:
```sh
cd lv_micropython
make -C mpy-cross
```

Build the STM32 port and flash the board:
```sh
cd ports/stm32
make -j8  BOARD=STM32F7DISC MICROPY_PY_LVGL=1 deploy-stlink
```


When flashed, reset the board and connect to the boards serial port. Here `picocom` is used but other applications work as well. 
```sh
picocom /dev/ttyACM0 -b 115200
``

## Initialize the display and touch screen
When the terminal is active test if Micropython is really running. For example type `3 + 4` and it should print the result. 

If all good copy this line by line:
```python
import lvgl as lv
lv.init()

import lvstm32 as st
st.lvstm32()

import rk043fn48h as rk
rk.init()

disp_buf1 = lv.disp_buf_t()
buf1_1 = bytes(480 * 80)
disp_buf1.init(buf1_1, None, len(buf1_1) // 4)
disp_drv = lv.disp_drv_t()
disp_drv.init()
disp_drv.buffer = disp_buf1
disp_drv.flush_cb = rk.flush
disp_drv.hor_res = 480
disp_drv.ver_res = 272
disp_drv.register()

indev_drv = lv.indev_drv_t()
indev_drv.init()
indev_drv.type = lv.INDEV_TYPE.POINTER
indev_drv.read_cb = rk.ts_read
indev_drv.register()
```

## Test LVGL
Just create a button to see the display and touch is working:

```python
btn1 = btn.create(lv.scr_act())
```


