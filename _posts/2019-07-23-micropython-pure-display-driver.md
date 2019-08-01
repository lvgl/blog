---
layout: post
title: "Pure Micropython Display Driver"
author: "amirgon"
cover: /assets/micropython/kisspng-clip-art-illustration-drawing-micropython-5c8fbdeeca47b9.2330618015529241428286.png
image:
  path: /assets/micropython/kisspng-clip-art-illustration-drawing-micropython-5c8fbdeeca47b9.2330618015529241428286.png
  height: 960
  width: 723

---

![LittlevGL + Micropython](/assets/micropython/kisspng-clip-art-illustration-drawing-micropython-5c8fbdeeca47b9.2330618015529241428286.png)

**I created a *Pure Micropython* display driver for ILI9341 on ESP32. [Here it is](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/ili9341.py).  
"Pure Micropython", in this sense, means that all logic is implemented in Micropython, and uses the standard API for LittlevGL and ESP-SDK libraries.**

LittlevGL by itself is very portable and can be used on many hardware devices and architectures.
However, it requires a display driver, specific to the hardware it runs on.
So if you use ESP32 and you want to display a nice GUI on your ILI9341 display, you need a "LittlevGL-ESP32-ILI9341" display driver.  

LittlevGL project [already provides C implementation of that driver](https://github.com/littlevgl/esp32_ili9341), and there's even a [micropython API for it](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/modILI9341.c), but I wanted to create a **Pure Micropython implementation** of the same driver.

This driver uses DMA and double buffering to acheive high performance.  
At the bottom of this post you can find performance statistics and conclusions about using Micropython for a display driver.

This display driver can run in two modes:
- Pure Micropython mode - **all** the display driver logic is done in Micropython.
- Hybrid mode - Setup and initialization is done in Micropython, but the critical path (flush and ISR functions) is implemented in C.


# Why?

Why would I re-write in micropython a module that is already written in C?  

For two reasons:

 - It's a showcase for many interesting/advanced features related to Micropython Binding
 - I wanted to see how it would perform, compared to the C driver


Here are some interesting features that are used in the Pure Micropython Display Driver:

## Micropython API to \*any\* C library!

The driver needs to interact with LittlevGL and ESP-IDF.  
LittlevGL provides C API for registering a driver, and ESP-IDF provides C API for interacting with ESP32 hardware, access GPIO, and SPI devices for example.  

Traditionally, when you want to expose a C API to Micropython, you have to [add a native Micropython Module](https://micropython-dev-docs.readthedocs.io/en/latest/adding-module.html).  
This means wrapping every C API function with special code to convert parameters, and later register it in Micropython.  
For a few functions, that's not so bad, but for a large library this becomes tedious to create and maintain.  
Another thing is the issue of structs and pointers. C uses them a lot, but Micropython doesn't really have a notion of pointers and structs, so they need to be handled in a special way when creating the API manually.  
LittlevGL is a large C library, and creating an lvgl Micropython module manually was out of the question.  

Instead, I've created the [Micropython LittlevGL Binding](https://github.com/littlevgl/lv_binding_micropython), 
which is at it's core a Python script that parses C header files and generates Micropython module automatically from them.  
The automatically generated Micropython module not only handles function calls. It also provides API to structs, enums, callbacks etc.  

I was working on this for a while, then I realized Micropython Binding could be used in a wider scope.  

**Why use it only for LittlevGL? What about other libraries?**  

In this blog post I'm going to show you how **Micropython Bindings was used to create a Micropython API for ESP-IDF**, in addition to LittlevGL Micropython API!  

By the way, I also used it to provide an API for [lodepng](https://github.com/lvandeve/lodepng), which is a library for encoding and decoding PNG files. But this is out of the scope of this blog post. If you are interested in that, have a look at [this example script](https://github.com/littlevgl/lv_binding_micropython/blob/master/examples/example2.py).


## Using Pointers in Micropython

C API usually relies heavily on pointers.  
Some C functions allocate or consume buffers, which are passed as pointers.  
Many functions receive a pointer and update the value it points at, instead of returning a value.  

Micropython, on the other hand, just like Python, doesn't need and doesn't have a native pointers like we have in C.
In python (as well as other languages such as JavaScript), an object is accessed by reference. There are no Pointers per-se, no pointer-dereferencing, no pointer-arithmetic etc.  

**The Micropython Binding bridge that gap** - it makes it possible to use Pointers in Micropython.  
Either pass them to functions, assign them to fields in structs, dereference them, or convert them into [MemoryView](https://docs.python.org/3/library/stdtypes.html#memoryview).  

The Pure Micropython Display Driver uses pointers in several contexts:
- For allocating DMA-able RAM
- When sending a DMA transaction
- On ESP-IDF functions that receive pointers.

## Using Callbacks from C to Micropython

When we want to register a C callback we pass a function pointer.  
But what if we want the callback to call uPy code?  

The Pure Micropython Display Driver code illustrates several callback use-cases:

- Registering C function as a callback (both caller and callee are defined in C, but the callback registration is performed by uPy code).
- Registering uPy data to pass to a C callback function. 
- Registering uPy function as a callback on LittlevGL API, which supports uPy callbacks. (Caller is defined in C while the callee is defined in uPy).
- Registering uPy function as a callback on ESP-IDF API, which **doesn't** support uPy callbacks, therefore requires special handling.

## Interrupt handling in Micropython

Micropython allows you to [write an ISR in micropython](https://docs.micropython.org/en/latest/reference/isr_rules.html) and handle interrupts without writing dedicated function for it.
This involves several limitation and considerations.

The Pure Micropython Display Driver implements a DMA completion interrupt, to signal LittlevGL that the display "flush" was completed.


# How?

Below are snippets from [ili9341.py](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/ili9341.py), [espidf.h](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/espidf.h), [espidf.c](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/espidf.c) to illustrate and explain different features in the Pure Micropython Driver.

## Auto generated C API

```python
import espidf as esp
import lvgl as lv
```

These two modules are **automatically generated** by the Micropython Binding script.  
- `lvgl` is generated from [lvgl.h](https://github.com/littlevgl/lvgl/blob/master/lvgl.h) and provides API to the entire LittlevGL library.  
- `espidf` is generated from [espidf.h](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/espidf.h) to provide API to some of the ESP-IDF.  

Here is the most important part from `espidf.h`:

```c
// The following includes are the source of the esp-idf micropython module.
// All included files are API we want to include in the module

#include "driver/gpio.h"
#include "driver/spi_master.h"
#include "esp_heap_caps.h"
#include "esp_log.h"
#include "esp_clk.h"
```

So we are not providing a full ESP-IDF API. That would be huge. At this point, only an API for functions and structs in these include files.  

So what is the rest of the content of `espidf.h`?  

- A few include guard defines (such as `#define INC_FREERTOS_H`). This is a trick to prevent an inner include to be applied.  
While we are interested in the included files above, these files in turn include addition headers we are not interested in (we don't want the entire FreeRTOS API!). This trick would exlude them.
- A few helper functions we want to include in ESP-IDF API although they are not really part of it. For example, `get_ccount` to measure CPU cycles.
- A few additional enums. Enums will become part of the API while defines won't, so I added what I though would be useful.
- ILI9341 hybrid mode functions (for example `ili9341_flush`). These functions are optional, the Pure Micropython display driver don't require them. 
But when hybrid mode is enabled, these functions are used for the critical path and the driver performance increase significantly.  
See more details on the "Performance" section below.   

When building the ESP32 port of [the Micropython project](https://github.com/littlevgl/lv_micropython), [the Makefile](https://github.com/littlevgl/lv_micropython/blob/master/ports/esp32/Makefile) contains rules to genreate these modules. For example:

```makefile
#esp-idf generated module
ESPIDFMOD_SOURCE = $(TOP)/lib/lv_bindings/driver/esp32/espidf.h
ALL_ESPIDFMOD_SRC = $(shell find $(subst -I,,$(INC_ESPCOMP)) -type f) $(ESPIDFMOD_SOURCE) $(SDKCONFIG_H)
ESPIDFMOD_MODULE = $(BUILD)/espidfmod/mp_espidf.c
ESPIDFMOD_PP = $(BUILD)/espidfmod/mp_espidf.pp.c
CFLAGS_MOD += $(ESPIDFMOD_CFLAGS) -Wno-deprecated-declarations

$(ESPIDFMOD_MODULE): $(ALL_ESPIDFMOD_SRC) $(LVGL_BINDING_DIR)/gen/gen_mpy.py 
    $(ECHO) "ESPIDFMOD-GEN $@"
    $(Q)mkdir -p $(dir $@)
    $(Q)$(CPP) $(ESPIDFMOD_CFLAGS) -DPYCPARSER -I $(LVGL_BINDING_DIR)/pycparser/utils/fake_libc_include $(INC) $(INC_ESPCOMP) $(ESPIDFMOD_SOURCE) > $(ESPIDFMOD_PP)
    $(Q)$(PYTHON) $(LVGL_BINDING_DIR)/gen/gen_mpy.py -M espidf -E $(ESPIDFMOD_PP) $(ESPIDFMOD_SOURCE) > $@
```

This mumbo jumbo does essentialy two important things:  

- Preprocess `espidf.h` by the C preprocessor. This applies all nested "includes" and produces a single preprocessed file with the entire API we want to generate.
- Run `gen_mpy.py` on the preprocessed file. This is where the magic hanppens, and C functions and structs are transformed into a Micropython module. 
The output of this step is `mp_espidf.c`, which is the implementation of the ESP-IDF micropython module.

Eventaully, the ESP-IDF micropython module is compiled, linked and referenced in the project, making it available for import by Micropython scripts.

So how does the generated API look like?  

```
MicroPython v1.11-194-g29bbfd8-dirty on 2019-07-22; ESP32 module with ESP32
Type "help()" for more information.
>>> 
>>> import espidf as esp
>>> help(esp)
object <module 'espidf'> is of type module
  __name__ -- espidf
  get_ccount -- <function>
  esp_err_to_name -- <function>
  esp_err_to_name_r -- <function>
  _esp_error_check_failed -- <function>
  _esp_error_check_failed_without_abort -- <function>
  gpio_init -- <function>
  gpio_output_set -- <function>
  gpio_output_set_high -- <function>
  gpio_input_get -- <function>
  gpio_input_get_high -- <function>
  gpio_intr_handler_register -- <function>
  gpio_intr_pending -- <function>
  gpio_intr_pending_high -- <function>
  gpio_intr_ack -- <function>
  gpio_intr_ack_high -- <function>
  gpio_pin_wakeup_enable -- <function>
  gpio_pin_wakeup_disable -- <function>
  gpio_matrix_in -- <function>
  gpio_matrix_out -- <function>
  gpio_pad_select_gpio -- <function>
  gpio_pad_set_drv -- <function>
  gpio_pad_pullup -- <function>
  gpio_pad_pulldown -- <function>
  gpio_pad_unhold -- <function>
  gpio_pad_hold -- <function>
  esp_intr_mark_shared -- <function>
  esp_intr_reserve -- <function>
  esp_intr_alloc -- <function>
  esp_intr_alloc_intrstatus -- <function>
  esp_intr_free -- <function>
  esp_intr_get_cpu -- <function>
  esp_intr_get_intno -- <function>
  esp_intr_disable -- <function>
  esp_intr_enable -- <function>
  esp_intr_set_in_iram -- <function>
  esp_intr_noniram_disable -- <function>
  esp_intr_noniram_enable -- <function>
  gpio_config -- <function>
  gpio_reset_pin -- <function>
  gpio_set_intr_type -- <function>
  gpio_intr_enable -- <function>
  gpio_intr_disable -- <function>
  gpio_set_level -- <function>
  gpio_get_level -- <function>
  gpio_set_direction -- <function>
  gpio_set_pull_mode -- <function>
  gpio_wakeup_enable -- <function>
  gpio_wakeup_disable -- <function>
  gpio_isr_register -- <function>
  gpio_pullup_en -- <function>
  gpio_pullup_dis -- <function>
  gpio_pulldown_en -- <function>
  gpio_pulldown_dis -- <function>
  gpio_install_isr_service -- <function>
  gpio_uninstall_isr_service -- <function>
  gpio_isr_handler_add -- <function>
  gpio_isr_handler_remove -- <function>
  gpio_set_drive_capability -- <function>
  gpio_get_drive_capability -- <function>
  gpio_hold_en -- <function>
  gpio_hold_dis -- <function>
  gpio_deep_sleep_hold_en -- <function>
  gpio_deep_sleep_hold_dis -- <function>
  gpio_iomux_in -- <function>
  gpio_iomux_out -- <function>
  spicommon_periph_claim -- <function>
  spicommon_periph_in_use -- <function>
  spicommon_periph_free -- <function>
  spicommon_dma_chan_claim -- <function>
  spicommon_dma_chan_in_use -- <function>
  spicommon_dma_chan_free -- <function>
  spicommon_bus_initialize_io -- <function>
  spicommon_bus_free_io -- <function>
  spicommon_bus_free_io_cfg -- <function>
  spicommon_cs_initialize -- <function>
  spicommon_cs_free -- <function>
  spicommon_cs_free_io -- <function>
  spicommon_setup_dma_desc_links -- <function>
  spicommon_hw_for_host -- <function>
  spicommon_irqsource_for_host -- <function>
  spicommon_dmaworkaround_req_reset -- <function>
  spicommon_dmaworkaround_reset_in_progress -- <function>
  spicommon_dmaworkaround_idle -- <function>
  spicommon_dmaworkaround_transfer_active -- <function>
  spi_bus_initialize -- <function>
  spi_bus_free -- <function>
  spi_bus_add_device -- <function>
  spi_bus_remove_device -- <function>
  spi_device_queue_trans -- <function>
  spi_device_get_trans_result -- <function>
  spi_device_transmit -- <function>
  spi_device_polling_start -- <function>
  spi_device_polling_end -- <function>
  spi_device_polling_transmit -- <function>
  spi_device_acquire_bus -- <function>
  spi_device_release_bus -- <function>
  spi_cal_clock -- <function>
  spi_get_timing -- <function>
  spi_get_freq_limit -- <function>
  multi_heap_malloc -- <function>
  multi_heap_free -- <function>
  multi_heap_realloc -- <function>
  multi_heap_get_allocated_size -- <function>
  multi_heap_register -- <function>
  multi_heap_set_lock -- <function>
  multi_heap_dump -- <function>
  multi_heap_check -- <function>
  multi_heap_free_size -- <function>
  multi_heap_minimum_free_size -- <function>
  multi_heap_get_info -- <function>
  heap_caps_malloc -- <function>
  heap_caps_free -- <function>
  heap_caps_realloc -- <function>
  heap_caps_calloc -- <function>
  heap_caps_get_free_size -- <function>
  heap_caps_get_minimum_free_size -- <function>
  heap_caps_get_largest_free_block -- <function>
  heap_caps_get_info -- <function>
  heap_caps_print_heap_info -- <function>
  heap_caps_check_integrity_all -- <function>
  heap_caps_check_integrity -- <function>
  heap_caps_check_integrity_addr -- <function>
  heap_caps_malloc_extmem_enable -- <function>
  heap_caps_malloc_prefer -- <function>
  heap_caps_realloc_prefer -- <function>
  heap_caps_calloc_prefer -- <function>
  heap_caps_dump -- <function>
  heap_caps_dump_all -- <function>
  ets_run -- <function>
  ets_set_idle_cb -- <function>
  ets_task -- <function>
  ets_post -- <function>
  ets_set_user_start -- <function>
  ets_set_startup_callback -- <function>
  ets_set_appcpu_boot_addr -- <function>
  ets_unpack_flash_code_legacy -- <function>
  ets_unpack_flash_code -- <function>
  ets_printf -- <function>
  ets_write_char_uart -- <function>
  ets_install_putc1 -- <function>
  ets_install_putc2 -- <function>
  ets_install_uart_printf -- <function>
  ets_timer_init -- <function>
  ets_timer_deinit -- <function>
  ets_timer_arm -- <function>
  ets_timer_arm_us -- <function>
  ets_timer_disarm -- <function>
  ets_timer_setfn -- <function>
  ets_timer_done -- <function>
  ets_delay_us -- <function>
  ets_update_cpu_frequency -- <function>
  ets_update_cpu_frequency_rom -- <function>
  ets_get_cpu_frequency -- <function>
  ets_get_xtal_scale -- <function>
  ets_get_detected_xtal_freq -- <function>
  ets_isr_attach -- <function>
  ets_isr_mask -- <function>
  ets_isr_unmask -- <function>
  ets_intr_lock -- <function>
  ets_intr_unlock -- <function>
  ets_waiti0 -- <function>
  intr_matrix_set -- <function>
  esp_log_level_set -- <function>
  esp_log_set_vprintf -- <function>
  esp_log_timestamp -- <function>
  esp_log_early_timestamp -- <function>
  esp_log_write -- <function>
  esp_log_buffer_hex_internal -- <function>
  esp_log_buffer_char_internal -- <function>
  esp_log_buffer_hexdump_internal -- <function>
  esp_clk_slowclk_cal_get -- <function>
  esp_clk_slowclk_cal_set -- <function>
  esp_clk_cpu_freq -- <function>
  esp_clk_apb_freq -- <function>
  esp_clk_xtal_freq -- <function>
  esp_clk_rtc_time -- <function>
  task_delay_ms -- <function>
  spi_transaction_set_cb -- <function>
  spi_pre_cb_isr -- <function>
  spi_post_cb_isr -- <function>
  ili9341_post_cb_isr -- <function>
  ili9341_flush -- <function>
  ESP -- <class 'ESP'>
  TRANS -- <class 'TRANS'>
  CAP -- <class 'CAP'>
  GPIO_PIN_INTR -- <class 'GPIO_PIN_INTR'>
  GPIO_NUM -- <class 'GPIO_NUM'>
  GPIO_INTR -- <class 'GPIO_INTR'>
  GPIO_MODE -- <class 'GPIO_MODE'>
  GPIO_PULLUP -- <class 'GPIO_PULLUP'>
  GPIO_PULLDOWN -- <class 'GPIO_PULLDOWN'>
  GPIO -- <class 'GPIO'>
  GPIO_DRIVE_CAP -- <class 'GPIO_DRIVE_CAP'>
  enum -- <class 'enum'>
  ETS -- <class 'ETS'>
  ESP_LOG -- <class 'ESP_LOG'>
  gpio_config_t -- <class 'gpio_config_t'>
  spi_bus_config_t -- <class 'spi_bus_config_t'>
  spi_device_interface_config_t -- <class 'spi_device_interface_config_t'>
  multi_heap_info_t -- <class 'multi_heap_info_t'>
  ETSTimer -- <class 'ETSTimer'>
  spi_transaction_t -- <class 'spi_transaction_t'>
  C_Pointer -- <class 'C_Pointer'>
```

It can be, of course, larger or smaller depending on what's in the H file that is fed into the Micropython Binding script.  

It's easy to include too many functions/structs in an API.  
That's because a public C API might include private headers, which are not usually used by the user. But the script doesn't know that and takes every function/struct/enum from the preprocessed file.  
To overcode this you can either 
- Disable some of the includes (by defining some include guard, for example)
- Or write a seperate C API header file that delegates calls to the real API. (the calls would be on the C file which is not considered by the script). 
This requires more work but has the advantage of letting you control the API and make it more "python-friendly".

Another thing to take into account is that C macros are not handled by the Binding Script, because it analyzes the preprocessed file.  
A workaround for this is to wrap the macros in an enum, which is converted to Micropython.  
An example from `espidf.h`:

```c
// Useful constants

enum{
    CAP_DMA = MALLOC_CAP_DMA,
    CAP_INTERNAL = MALLOC_CAP_INTERNAL,
    CAP_SPIRAM = MALLOC_CAP_SPIRAM
};

```

This would generate a Micropython object `esp.CAP` which has a field for each enum member.
For example here we use `esp.CAP.DMA`:

```python
    trans_buffer = esp.heap_caps_malloc(trans_buffer_len, esp.CAP.DMA)

```

A few footnotes
- Ideally the process of adding a new API to Micropython should be automated too, such that converting a C library to Micropython would be even easier and won't require messing with Makefile scripts, which is never plesant.
- Some naming should be changed. Perhaps `gen_mpy.py` should be called `gen_upy.py` etc.


## ILI9341 python class


```python
class ili9341:

    width = const(240)
    height = const(320)

    ######################################################

    disp_buf = lv.disp_buf_t()
    disp_drv = lv.disp_drv_t()

    def __init__(self, miso=5, mosi=18, clk=19, cs=13, dc=12, rst=4, backlight=2, spihost=esp.enum.HSPI_HOST, mhz=40, factor=4, hybrid=True):

        # Make sure Micropython was built such that color won't require processing before DMA

        if lv.color_t.SIZE != 2:
            raise RuntimeError('ili9341 micropython driver requires defining LV_COLOR_DEPTH=16')
        if not hasattr(lv.color_t().ch, 'green_l'):
            raise RuntimeError('ili9341 micropython driver requires defining LV_COLOR_16_SWAP=1')
``` 


When declaring the class, first thing we check that color mode is correct.   
LittlevGL can be configured to use different color modes, starting from 1 bit monochrome up to 32 bit RGB with alpha channel.  
For the Pure Python display driver to work correctly, LittlevGL color mode must match ILI9341 color mode,  16-bit RGB565. If we didn't do that we would have to translate every pixel to RGB565, and this is a lot of work for a display driver.
  
So this is achieved by building `lv_micropython` with this parameter:


```
LV_CFLAGS="-DLV_COLOR_DEPTH=16 -DLV_COLOR_16_SWAP=1"
```

## Using Pointers

If we just pass pointers around, this is very easy. Each pointer is wrapped in a Micopython "Blob" object which is convertible to pointer between API functions, even if they belong to different libraries.  
For example:

```python

        self.buf1 = esp.heap_caps_malloc(self.buf_size, esp.CAP.DMA)
        self.buf2 = esp.heap_caps_malloc(self.buf_size, esp.CAP.DMA)
        
        ...

        lv.disp_buf_init(self.disp_buf, self.buf1, self.buf2, self.buf_size // lv.color_t.SIZE)
```

Here we allocate two DMA capable buffers using ESP-IDF API function, and pass them to LittlevGL function that initializes the display buffers.  

But what if we want to read or write to the data the pointer points at, in Micropython?  
Each "Blob" has a `__dereference__` functions which allows you to convert it to a [MemoryView](https://docs.python.org/3/library/stdtypes.html#memoryview).  

```python
    trans_buffer_len = const(16)
    trans_buffer = esp.heap_caps_malloc(trans_buffer_len, esp.CAP.DMA)

...

    def send_data(self, data):
        esp.gpio_set_level(self.dc, 1)	    # Data mode
        if len(data) > self.trans_buffer_len: raise RuntimeError('Data too long, please use DMA!')
        trans_data = self.trans_buffer.__dereference__(len(data))
        trans_data[:] = data[:]
        self.spi_send(trans_data)
```

`send_data` function receives `data` which is an array of bytes, and sends it by calling `spi_send`.  
But `spi_send` expects to receive a DMA-able buffer! We need to copy `data` into a DMA-able memory.  
So we prepare `trans_buffer` which is a pointer to DMA-able memory, and copy `data` into it. 
To do that, we dereference `trans_buffer` (`self.trans_buffer.__dereference__(len(data))`), and copy the data into it (`trans_data[:] = data[:]`)

Another case is using a pointer as a function output.  
What if we have an API function that recieves a pointer, and updates the data it points at?  

[For example](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/spi_master.html#_CPPv418spi_bus_add_device17spi_host_device_tPK29spi_device_interface_config_tP19spi_device_handle_t):   

```c
esp_err_t spi_bus_add_device(spi_host_device_thost, const spi_device_interface_config_t *dev_config, spi_device_handle_t *handle);
```

On this function, `dev_config` is an input. That's easy, just create a struct, fill it up, and pass it over.

For example:

```python
    devcfg = esp.spi_device_interface_config_t({
        "clock_speed_hz": self.mhz*1000*1000,   # Clock out at DISP_SPI_MHZ MHz
        "mode": 0,                              # SPI mode 0
        "spics_io_num": self.cs,                # CS pin
        "queue_size": 2,
        "flags": esp.ESP.HALF_DUPLEX,
        "duty_cycle_pos": 128,
    })

    ...

    ret = esp.spi_bus_add_device(self.spihost, devcfg, ptr_to_spi)
```

Here, by the way, we used a dict to initialize a struct by passing it to `esp.spi_device_interface_config_t` constructor.  
This is only possible on struct initialization. On other cases, fields can be accessed as object attributes.  
For example `devcfg.pre_cb = None` would assign `NULL` to `pre_cb` field of `devcfg` struct.  


But what about the last parameter of `spi_bus_add_device`?  
`spi_device_handle_t *handle` is an output. We need to create a pointer, pass it over to `spi_bus_add_device` and dereference it.  
The trick is to use a struct called `C_Pointer`, like this:

```python
    ptr_to_spi = esp.C_Pointer()
    ret = esp.spi_bus_add_device(self.spihost, devcfg, ptr_to_spi)
    if ret != 0: raise RuntimeError("Failed adding SPI device")
    self.spi = ptr_to_spi.ptr_val
```

In this case we pass `ptr_to_spi` of type `C_Pointer` to the function, and later access `ptr_to_spi.ptr_val` to dereference it and extract the output value written by `spi_bus_add_device`.  
So what's this `C_Pointer` is about? It's a simple helper union that looks like this:

```c
typedef union {
    void *ptr_val;
    int int_val;
    unsigned int uint_val;
    const char *str_val;
} C_Pointer;
```

So we create an instance of `C_Pointer`, pass it over to a function that writes something into it (either a string, an int, or another pointer like our case).  
After the function updated it, it's very easy to extract the relevant data from it, by accessing the right union field.


## Using Callbacks

Callbacks on Micropython C API is a subtle subject. While in C all you need is a function pointer (code only), on Micropython a callable object is needed (which contains data, not only code).  
So when we want to register a Micropython function to be called from C, we need to find a way to record the callable object on C and pass it to the callback.  
On LittlevGL this is done using the `user_data` field, that is present on structs where callbacks are used. 
On other libraries that do not follow this convention, you might need to wrap the callback registration/invocation and find another way to pass the callable object.

```python
    disp_drv = lv.disp_drv_t()

    def __init__(self, miso=5, mosi=18, clk=19, cs=13, dc=12, rst=4, backlight=2, spihost=esp.enum.HSPI_HOST, mhz=40, factor=4, hybrid=True):

        ...
        self.disp_drv.user_data = {'dc': self.dc, 'spi': self.spi}
        self.disp_drv.flush_cb = esp.ili9341_flush if self.hybrid and hasattr(esp, 'ili9341_flush') else self.flush
        self.disp_drv.monitor_cb = self.monitor
```

Here, the display driver instantiates and fills `disp_drv_t` struct. This struct describes the display driver.  
The display driver implements two callbacks: `flush_cb` and `monitor_cb`.  
In case of `flush_cb`: 

- if running in hybrid mode, the callback is set to the C implementation of flush (`esp.ili9341_flush`). This case is simply a pointer assignmnet.  
- If not running in hybrid mode (but in "pure python" mode), the flush is registered as `self.flush` function, which is the pure python implementation of flush.  

Under the hoods, the assignment to `flush_cb` saves the callable object `self.flush` in `user_data` member of `disp_drv`, this is automatic and hidden from the user.  
Later on I'll show an example of registering callbacks on ESP-IDF, where the callback convetion is not followed as it is in LittlevGL, 
and the copy of the callable object to `user_data` does not happen automatically.  

Consider the case of hybrid mode.  
In this case we register a the C function `esp.ili9341_flush` to `flush_cb`. When LittlevGL wants to flush the display data to the display it calls it.  
`esp.ili9341_flush` in turn should access the SPI device and DMA the data.
However, the SPI device was initialized in uPy code - how can `esp.ili9341_flush` access it?  

On LittlevGL, every callback receives as the first parameter a struct which contains data related to the callback, in our case - `lv_disp_drv_t`.  
Every such struct contains a field called `user_data`, the same field that holds the callable object when registering uPy function.  
We can use it to store our own custom data, in a addition to callable objects!

```python
        self.disp_drv.user_data = {'dc': self.dc, 'spi': self.spi}
```

`esp.ili9341_flush` needs the SPI device and DC pin, which were initialized in the uPy side, in order to do its work.
`user_data` is a `void *` member of `lv_disp_drv_t`. But since it was initialized to a python `dict` it can be casted back.  
Let's have a look at it, on ESP32 interactive console after the driver was initalized:

```
MicroPython v1.11-330-g6f2b2e2-dirty on 2019-07-29; ESP32 module with ESP32
Type "help()" for more information.
>>> import ili9341
ILI9341 initialization completed
Enable backlight
Double buffer
>>> print(ili9341.disp.disp_drv.user_data.cast())
{'lv_disp_drv_t_flush_cb': <function>, 'lv_disp_drv_t_monitor_cb': <bound_method>, 'dc': 12, 'spi': Blob}
```

As you can see, `user_data` dict contains our `dc` and `spi` members, as well as the callable objects for `flush_cb` and `monitor_cb`.  

Now, how can `esp.ili9341_flush` extract this data from `user_data`?
Let's have a loot at it:

```c
void ili9341_flush(void *_disp_drv, const void *_area, void *_color_p)
{
    ...

    // We use disp_drv->user_data to pass data from MP to C
    // The following lines extract dc and spi
    
    int dc = mp_obj_get_int(mp_obj_dict_get(disp_drv->user_data, MP_OBJ_NEW_QSTR(MP_QSTR_dc)));
    mp_buffer_info_t buffer_info;
    mp_get_buffer_raise(mp_obj_dict_get(disp_drv->user_data, MP_OBJ_NEW_QSTR(MP_QSTR_spi)), &buffer_info, MP_BUFFER_READ);
    spi_device_handle_t *spi_ptr = buffer_info.buf;
```

`dc` is read in a straightforward way - get the dict from `user_data` and convert `dc` field (it's name is given as a [qstr](https://docs.micropython.org/en/latest/reference/constrained.html#string-operations)) to `int`.
`spi` on the other hand, is a pointer. Pointers are saved using [buffer protocol](https://docs.python.org/3/c-api/buffer.html), therefore an `mp_get_buffer_raise` is used to extract it.

So far I've showed you how a callback (either C or Micropython) is registered to LittlevGL, which was designed to automatically save the callable object in `user_data`.  
But what if the API was not designed that way?  

When DMA completes, ESP-IDF calls `post_cb` function, (in ISR context, but that does not matter for this point).  
We might want to register a uPy function as `post_cb`, but `post_cb` doesn't recieve a struct with `user_data` member, so the Binding Script
cannot automatically save the callable object there.  

Fortunately, `post_cb` receives a struct with `user` field that can be used exactly for that!
We will use the `user` field to pass over the callable object, but this time, without using a `dict`.  
Instead, `user` will contain a new object of type `spi_transaction_ptr_type` that holds information for the callback, such as the `post_cb` callable object.

```c
DEFINE_PTR_OBJ_TYPE(spi_transaction_ptr_type, MP_QSTR_spi_transaction_ptr_t);

typedef struct{
    mp_ptr_t spi_transaction_ptr;
    mp_obj_t pre_cb;
    mp_obj_t post_cb;
} mp_spi_device_callbacks_t;

void *spi_transaction_set_cb(mp_obj_t pre_cb, mp_obj_t post_cb)
{
    mp_spi_device_callbacks_t *callbacks = m_new_obj(mp_spi_device_callbacks_t);
    callbacks->spi_transaction_ptr.base.type = &spi_transaction_ptr_type;
    callbacks->pre_cb = pre_cb != mp_const_none? pre_cb: NULL;
    callbacks->post_cb = post_cb != mp_const_none? post_cb: NULL;
    return callbacks;
}
```

`spi_transaction_set_cb` is a C function declared on `espidf.h`, therefore it will be included in ESP-IDF Micropython API automatically.  
It receives two callable objects `pre_cb` and `post_cb`, registers them in a `spi_transaction_ptr_type` object and returns.

The uPy code of the display driver calls this function:
```python
    def disp_spi_init(self):
        ...
        if self.hybrid and hasattr(esp, 'ili9341_post_cb_isr'):
            devcfg.pre_cb = None
            devcfg.post_cb = esp.ili9341_post_cb_isr
        else:
            devcfg.pre_cb = esp.spi_pre_cb_isr
            devcfg.post_cb = esp.spi_post_cb_isr

        ...
        self.spi_callbacks = esp.spi_transaction_set_cb(None, flush_isr)
    ...
    def spi_send_dma(self, data):
        ...
        self.trans.user = self.spi_callbacks
        esp.spi_device_queue_trans(self.spi, self.trans, -1)
```

The init code registers `flush_isr` callback, and saves the `spi_callbacks` result (of type `spi_transaction_ptr_type`)  
When sending DMA, the transaction `user` field is set to that `spi_callbacks`.  
On pure python mode, the `post_cb` C callback is set to `esp.spi_post_cb_isr`, which extracts the callback from the `user` field:

```c
void spi_post_cb_isr(spi_transaction_t *trans)
{
    mp_spi_device_callbacks_t *self = (mp_spi_device_callbacks_t*)trans->user;
    if (self) {
        self->spi_transaction_ptr.ptr = trans;
        cb_isr(self->post_cb, MP_OBJ_FROM_PTR(self));
    }
}

```

The `cb_isr` receives `post_cb` callable Micropython object, and will call it in ISR context.


## Calling uPy code in ISR context

When you want to run uPy in ISR context you have two options:

- Schedule uPy function to run when Micropython core is ready.
- Run uPy immediately - with some limitations. 

The easiest thing to do it to schedule uPy. This means that uPy will not run in ISR context, but shortly after in standard user mode FreeRTOS task context.  
The drawback is that the function will not run immediately. It will take some time, may require a context switch etc.  
What if you want to do something **right now**?

Two options:

- Write the ISR in C.
- Run uPy immediately - with some limitation.

What limitations are there, to run uPy directly in ISR?

Micropython docs have a chapter [discussing exactly this](https://docs.micropython.org/en/latest/reference/isr_rules.html), how to write interrupt handlers in uPy.  
ESP32, apparently, has some [additional complications](https://github.com/micropython/micropython/issues/4895) but this is still doable.

In the Pure Micropython Driver we register `flush_isr` uPy function to be called directly in ISR context when DMA completion `post_cb` is called, when running in Pure uPy mode (non-hybrid)

# Performance?

Test conditions:

- SPI is configured to 40MHz
- Sending ~104KB every frame (That's ~70% of the total display area of ILI9341 being refreshed every frame) 
- DMA, [Double Buffering](https://docs.littlevgl.com/en/html/porting/display.html#display-buffer) with Two non-screen-sized buffers
- Each display buffer consumes 25% of the display area
- LittlevGL configured with `LV_COLOR_DEPTH=16` and `LV_COLOR_16_SWAP=1`, which makes the display buffer compatible with ILI9341, 
and does not require processing every pixel. Otherwise every pixel would have to be converted to RGB in the right format.
- LittlevGL refreshes large area of the screen every frame, but does not do a lot of work to render it.  
That's because we are measuring the display driver performance, not lvgl rendering performance, so we don't want lvgl to be the bottleneck in this measurement.

Results:

## Pure Micropython Driver
- 35ms per frame (28.5FPS)
- DMA is 20ms out of the 35ms
- Micropython code is 15ms out of the 35ms

## Hybrid Micropython Driver

SPI setup, ILI9341 initialization etc. remain in Micropython.  
Only the critical "flush" function and interrupt handling done in C (see `ili9341_flush` [here](https://github.com/littlevgl/lv_binding_micropython/blob/master/driver/esp32/espidf.c))

- 20ms per frame (50FPS)
- Limiting factor is DMA and ILI9341.  
From DMA perspective, Higher FPS up to 100FPS may be possible with higher SPI frequency (80MHz), 
but requires using dedicated IO pins (IOMUX instead of GPIO matrix), therefore not tested.  
From ILI9341 perspective, running it faster than 10MHz is out of spec, but a common practice. Many people ran it [at higher rates up to 40Mhz](https://www.eevblog.com/forum/microcontrollers/ili9341-lcd-driver-max-spi-clock-speed/), and some even [up to 80Mhz](https://www.esp32.com/viewtopic.php?t=6627)!

# Conclusion?

Does it make sense to write a display driver in pure Micropython?
Probably not :) at least not the critical paths.  
It can still be useful to write the setup code in Micropython (setting up SPI and initializing ILI9341 for example),
 but paying 15ms every frame only to run Micropython code that would flush data to the display, feels too much for me.

But there is still hope!  
Micropython has a [Native Code Emitter](http://docs.micropython.org/en/v1.9.3/pyboard/reference/speed_python.html#the-native-code-emitter) and [Viper Code Emmiter](http://docs.micropython.org/en/v1.9.3/pyboard/reference/speed_python.html#the-viper-code-emitter) which translate Micropython code directly to native CPU opcodes! That would boost performance significantly.  
Unfortunately, these code emitters are [not avaiable for ESP32 yet](https://github.com/micropython/micropython/issues/4607). Let's hope someday they will be.



