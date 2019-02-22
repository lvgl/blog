---
layout: post
title: "LittlevGL as a Micropython library"
author: "amirgon"
cover: /assets/micropython/mp_lvgl.png
image:
  path: /assets/micropython/mp_lvgl.png
  height: 960
  width: 723

---

![LittlevGL + Micropython](/assets/micropython/mp_lvgl.png)

# What is Micropython?

[Micropython](http://micropython.org/) is Python for microcontrollers.  
With Micropython you can write Python3 code and run it on bare metal architectures with limited resources.

### Micropython highlights

- **Compact** - fit and run within just 256k of code space and 16k of RAM. No OS is needed, although you can also run it with OS, if you want.
- **Compatible** - strives to be as compatible as possible with normal Python (known as CPython)
- **Verstile** - Supports many architectures (x86, x86-64, ARM, ARM Thumb, Xtensa)
- **Iteractive** - No need for the compile-flash-boot cycle. With the REPL (interactive prompt) you can type commands, run scripts etc.
- **Popular** - More users and more platform supported. Notable forks: [MicroPython](https://github.com/micropython/micropython), [CircuitPython](https://github.com/adafruit/circuitpython), [MicroPython_ESP32_psRAM_LoBo](https://github.com/loboris/MicroPython_ESP32_psRAM_LoBo)
- **Embedded Oriented** - Comes with modules specifically for embedded systsems, such as "machine" for accessing low-level hardware (I/O pins, ADC, UART, SPI, I2C, RTC, Timers etc.)

# Why Micropython + LittlevGL?

Micropython today does not have a good GUI library.
LittlevGL is a good GUI library, but it's implemented in C and its API is in C.
Here are some advantages of using LittlevGL in Micropython:

- Develop GUI in Python, a very popular high level language. Use paradigms such as Object Oriented Programing.
- GUI development requires multiple iterations to get things right. With C, each iteration consists of **`Change code` -> `Build` -> `Flash` -> `Run`**.  
In micropython it's just **`Change code` -> `Run`**. You can even run commands interactively using the [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (the interactive prompt)

Micropython + LittlevGL could be used for 
- Fast prototyping GUI, 
- Shorten the cycle of changing and fine-tuning the GUI.
- Model the GUI in a more absract way, by defining reusable composite objects, taking advantage of Python's language features such as inheritance, closures, list comprehension, generators, exception handling, arbitrary precision integers and others.
- Make LittlevGL accessible to larger audiance. No need to know C in order to create a nice GUI on an embedded system. This goes well with [CircuitPython vision](https://learn.adafruit.com/welcome-to-circuitpython/what-is-circuitpython) which was designed with education in mind, to make it easier for new or unexperienced users to get started with embedded development.

# So how does it look like?

> TL;DR:
> It's very much like the C API, but Object Oriented for LittlevGL componets.

Let's dive right into an example.
In this example I'll assume you already have some basic knowledge of LittlevGL. If you not - please have a look at [LittlevGL tutorial](https://github.com/littlevgl/lv_examples/tree/master/lv_tutorial)

```python
class SymbolButton(lv.btn):
    def __init__(self, parent, symbol, text):
        super().__init__(parent)
        self.symbol = lv.label(self)
        self.symbol.set_text(symbol)
        self.symbol.set_style(symbolstyle)
        self.symbol.align(self, lv.ALIGN.CENTER,0,0)
        
        self.label = lv.label(self)
        self.label.set_text(text)
        self.label.align(self, lv.ALIGN.CENTER,20,0)

```

In this example we create a reusable composite component called `SymbolButton`.
It's a class, so we can create object instances from it. It's composite, because it consists of several native LittlevGL objects:

- **A Button** - SymbolButton inherits from lv.btn
- **A Symbol label** - a label with a symbol style (symbol font) as a child of `self`, ie. child of the parent button that SymbolButton inherits from.
- **A Text label** - a label with some text as another child of `self`.

SymbolButton constructor does nothing more than creating the two labels, set their content and align them.
Here is an example of how to use our SymbolButton:

```python
play_btn = SymbolButton(page, lv.SYMBOL.PLAY, "Play")
pause_btn = SymbolButton(page, lv.SYMBOL.PAUSE, "Pause")
```

and the result would look something like this:

![Play and Pause buttons](/assets/micropython/play_pause_btns.png)

For a more complete example, which includes other object types and also action callbacks, please have a look at [this little demo script](https://github.com/littlevgl/lv_binding_micropython/blob/master/gen/advanced_demo.py)

Some more examples of how to use LittlevGL in Micropython:

### Creating a screen with a button and a label
```python
scr = lv.obj()
btn = lv.btn(scr)
btn.align(lv.scr_act(), lv.ALIGN.CENTER, 0, 0)
label = lv.label(btn)
label.set_text("Button")

# Load the screen

lv.scr_load(scr)

```

#### Creating an instance of a struct
```python
symbolstyle = lv.style_t(lv.style_plain)
```
symbolstyle would be an instance of `lv_style_t` initialized to the same value of `lv_style_plain`

#### Setting a field in a struct
```python
symbolstyle.text.color = lv.color_hex(0xffffff)
```
symbolstyle.text.color would be initialized to the color struct returned by `lv_color_hex`

#### Setting a nested struct using dict
```python
symbolstyle.text.color = {"red":0xff, "green":0xff, "blue":0xff}
```

#### Creating an instance of an object
```python
self.tabview = lv.tabview(lv.scr_act())
```
The first argument to an object constructor is the parent object, the second is which element to copy this element from

#### Calling an object method
```python
self.symbol.align(self, lv.ALIGN.CENTER,0,0)
```
In this example `lv.ALIGN` is an enum and `lv.ALIGN.CENTER` is an enum member (an integer value).

#### Using callbacks
```python
btn.set_action(lv.btn.ACTION.CLICK, lambda action,name=name: self.label.set_text('%s click' % name))
```
Currently the binding is limited to one callback per object.

# How does it work?

> TL;DR:
> A script parses LittlevGL headers and creates a Micropython module.

To use LittlevGL in Micropython, you need [Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython).
This binding is a generator for LittlevGL Micropython module.  
It's essentialy a python script that reads and parses LittlevGL C headers and generates Micropython module from them. This module can be used in Micropython to access most of LittlevGL API.

LittlevGL is an object oriented component-based library. There is a base object `lv_obj` which all other components inherit from, and a hierarchy between the components. Objects have their method functions, inherit their parent methods etc.
Micropython Binding for LittlevGL tries to take advantage of this design, and models this class hierarchy in Python. You can create your own (pure Python) composite components from existing LittlevGL components by inheritance.

For more details, please refer to the [README of Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython/blob/master/README.md).

# How can I use it?

> TL;DR:
> The quickest way to start: Fork [`lv_micropython`](https://github.com/littlevgl/lv_micropython). It has working unix and ESP32 ports of Micropython + LittlevGL.

[Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython) (`lv_binding_micropython`) was designed to make it simple to use LittlevGL with Micropython. In principle it can support any micropython fork.  
To add it to some Micropython fork you need to add `lv_binding_micropython` under Micropython lib as a git submodule. `lv_binding_micropython` itself contains LittlevGL as a git submodule.
In Micropython code very few changes are needed. You need to add some lines to Micropython Makefile in order to create LittlevGL Binding module and in order to compile LittlevGL, and you need to add the new `lvgl` module to Micropython by editing `mpconfigport.h`.  

As an example, I've create [`lv_micropython`](https://github.com/littlevgl/lv_micropython) - a Micropython fork with LittlevGL bindings. You can use it as is, or as an example of how to intergate LittlevGL with Micropython.  
[`lv_micropython`](https://github.com/littlevgl/lv_micropython) can currently be used with LittlevGL on the unix port and on the ESP32 port.

LittlevGL needs drivers for the display and for the input device.
The Micropython bindings contains some example drivers that are registered and used on [`lv_micropython`](https://github.com/littlevgl/lv_micropython):

- SDL unix drivers (display and mouse)
- ILI9341 driver for ESP32.  
- Raw Resistive Touch for ESP32 (ADC connected to screen directly, no touch IC)

It is easy to create new drives for other displays and input devices. If you add some new driver, we would be happy to add it to Micropython Binding, so please send us a PR!

# FAQ

## How can I know which LittlevGL objects and functions are available on Micropython?

- Run Micropython with LittlevGL module enabled (for example, [`lv_micropython`](https://github.com/littlevgl/lv_micropython))
- Open the REPL (interactive console)
- `import lvgl as lv`
- Type `lv.` and <btn>TAB</btn> for completion. All supported classes and functions of LittlevGL will be displayed.
- Another option: `help(lv)`
- Another option: `print('\n'.join(dir(lvgl)))`
- You can also do that recursively. For example `lv.bt.` + <btn>TAB</btn>, or `print('\n'.join(dir(lvgl.btn)))`

You can also have a look at the LittlevGL bindings module itself. It is generated after build, and ususally called `lv_mpy.c`.

## That's a huge API! There are more than 25K lines of code on the LittlevGL binding module!

It depends on LittlevGL configuration. It can be small or large.
Remember that LittlevGL binding module is generated when you build Micropython, based on LittlevGL headers **and configuration file** - `lv_conf.h`.  
If you enabled everything on `lv_conf.h` - the module will be large. You can disable features and remove unneeded components by changing definitions in `lv_conf.h`, and the module will become much smaller.  

Anyway, remember that the module is on *Progam Memory*. It does not consume RAM by itself, only ROM.  
From RAM perpective, every **instance** of LittlevGL object will usually consume only a few bytes extra, to represent a Micropython wrapper object around LittlevGL object.

## I would like to try it out! What is the quickest way to start?

The quickest way to start: Fork [`lv_micropython`](https://github.com/littlevgl/lv_micropython). It has working unix and ESP32 ports of Micropython + LittlevGL.

## LittlevGL on Python? Isn't it kinda.. slow?

No.  
All LittlevGL functionality (such as rendering the graphics) is still in C.  
The Micropython binding only provides wrappers for LittlevGL API, such as creating componenets, setting their properties, layout, styles etc. Very few cycles are spent over there compared to other LittlevGL functionality.


