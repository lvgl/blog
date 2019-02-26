---
layout: post
title: "Micropython + LittlevGL"
author: "amirgon"
cover: /assets/micropython/cover.png
image:
  path: /assets/micropython/mp_lvgl.png
  height: 960
  width: 723

---

![LittlevGL + Micropython](/assets/micropython/mp_lvgl.png)

--- 

<center>LittlevGL as a Micropython Library</center>

---

# What is Micropython?

[Micropython](http://micropython.org/) is Python for microcontrollers.  
With Micropython you can write Python3 code and run it on bare metal architectures with limited resources.

### Micropython highlights

- **Compact** - fit and run within just 256k of code space and 16k of RAM. No OS is needed, although you can also run it with OS, if you want.
- **Compatible** - strives to be as compatible as possible with normal Python (known as CPython)
- **Verstile** - Supports many architectures (x86, x86-64, ARM, ARM Thumb, Xtensa)
- **Interactive** - No need for the compile-flash-boot cycle. With the REPL (interactive prompt) you can type commands and execute them immediately, run scripts etc.
- **Popular** - Many platforms are supported. User base is growing bigger.  
Notable forks: [MicroPython](https://github.com/micropython/micropython), [CircuitPython](https://github.com/adafruit/circuitpython), [MicroPython_ESP32_psRAM_LoBo](https://github.com/loboris/MicroPython_ESP32_psRAM_LoBo)
- **Embedded Oriented** - Comes with modules specifically for embedded systsems, such as the [machine module](https://docs.micropython.org/en/latest/library/machine.html#classes) for accessing low-level hardware (I/O pins, ADC, UART, SPI, I2C, RTC, Timers etc.)

---

# Why Micropython + LittlevGL?

Micropython today [does not have a good high-level GUI library](https://forum.micropython.org/viewtopic.php?f=18&t=5543).  
LittlevGL is a good high-level GUI library, it's implemented in C and its API is in C.  
LittlevGL is an [Object Oriented Compenent Based](https://blog.littlevgl.com/2018-12-13/extend-lvgl-objects) library, which seems a natural candidate to map into a higher level language, such as Python.

### Here are some advantages of using LittlevGL in Micropython:

- Develop GUI in Python, a very popular high level language. Use paradigms such as Object Oriented Programming.
- GUI development requires multiple iterations to get things right.  
With C, each iteration consists of **`Change code` &#x27a5; `Build` &#x27a5; `Flash` &#x27a5; `Run`**.  
In Micropython it's just **`Change code` &#x27a5; `Run`**. You can even run commands interactively using the [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (the interactive prompt)

### Micropython + LittlevGL could be used for:

- Fast prototyping GUI.  
- Shorten the cycle of changing and fine-tuning the GUI.
- Model the GUI in a more absract way by defining reusable composite objects, taking advantage of Python's language features such as Inheritance, Closures, List Comprehension, Generators, Exception Handling, Arbitrary Precision Integers and others.
- Make LittlevGL accessible to a larger audiance. No need to know C in order to create a nice GUI on an embedded system.  
This goes well with [CircuitPython vision](https://learn.adafruit.com/welcome-to-circuitpython/what-is-circuitpython). CircuitPython was designed with education in mind, to make it easier for new or unexperienced users to get started with embedded development.

---

# So how does it look like?

> TL;DR:
> It's very much like the C API, but Object Oriented for LittlevGL componets.

Let's dive right into an example!  
In this example I'll assume you already have some basic knowledge of LittlevGL. If you don't - please have a quick look at [LittlevGL tutorial](https://github.com/littlevgl/lv_examples/tree/master/lv_tutorial).

```python
class SymbolButton(lv.btn):
    def __init__(self, parent, symbol, text):
        super().__init__(parent)
        self.symbol = lv.label(self)
        self.symbol.set_text(symbol)
        self.symbol.set_style(symbolstyle)
        
        self.label = lv.label(self)
        self.label.set_text(text)

```

In this example we create a **reusable composite component** called `SymbolButton`.  
It's a class, so we can create object instances from it. It's composite, because it consists of several native LittlevGL objects:

- **A Button** - `SymbolButton` inherits from `lv.btn`. `lv.btn` is a native LittlevGL Button component.
- **A Symbol label** - a label with a symbol style (symbol font) as a child of `self`, ie. child of the parent button that SymbolButton inherits from. `lv.label` is a native LittlevGL label component that represents some text inside another component.
- **A Text label** - a label with some text as another child of `self`.

`SymbolButton` constructor (`__init__` function) does nothing more than create the two labels and set their contents and style.  

Here is an example of how to use our `SymbolButton`:

```python
self.btn1 = SymbolButton(page, lv.SYMBOL.PLAY, "Play")
self.btn1.set_size(140,100)
self.btn1.align(None, lv.ALIGN.IN_TOP_LEFT, 10, 0)

self.btn2 = SymbolButton(page, lv.SYMBOL.PAUSE, "Pause")
self.btn2.set_size(140,100)
self.btn2.align(self.btn1, lv.ALIGN.OUT_RIGHT_TOP, 10, 0)
```

Here, we set the size of each button, align `btn1` to the page and align `btn2` relative to `btn1`.  
We call `set_size` and `align` methods of our composite component `SymbolButton` - these methods were inherited from `SymbolButton` parent, `lv.btn`, which is a LittlevGL native object.

The result would look something like this:

![Play and Pause buttons](/assets/micropython/play_pause_btns.png)

For a more complete example, which includes other object types as well as action callbacks and driver registration, please have a look at [this little demo script](https://github.com/littlevgl/lv_binding_micropython/blob/master/gen/advanced_demo.py).

Here are some more examples of how to use LittlevGL in Micropython:

#### Creating a screen with a button and a label
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
`symbolstyle.text.color` would be initialized to the color struct returned by `lv_color_hex`

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
for btn, name in [(self.btn1, 'Play'), (self.btn2, 'Pause')]:
            btn.set_action(lv.btn.ACTION.CLICK, lambda action,name=name: self.label.set_text('%s click' % name))
```
Here, we have a loop that sets an action for buttons `btn1` and `btn2`.  
The action of `btn1` is to set `label` text to "Play click", and the action of `btn2` click is to set `label` text to "Pause click".  

How does this work?  
There are two Python features you first need to understand: [lambda](https://www.w3schools.com/python/python_lambda.asp) and [Closure](https://www.programiz.com/python-programming/closure).  
`set_action` function expects two parameters: an action enum (`CLICK` in this case) and a function. In Python a [functions are "first class"](https://stackoverflow.com/a/23037588/619493), this means they can be treated as values, and can be passed to another function, like in this case.  
The function we are passing is a `lambda`, which is an anonymous function. Its first parameter is the action, and its second parameter is the `name` variable from the `for` loop. The function does not use the `action` parameter, but it uses the `name` for setting the label's text.  

You might ask yourself - why do we need to pass `name` as a parameter? Why not use it directly in the lambda like this: `lambda action: self.label.set_text('%s click' % name)`?  
Well, **this will not work correctly!** Using `name` like this would create a *Closure*, which is a function object that remembers values in enclosing scopes, `name` in this case. The problem is, that in Python the resolution of `name` is done when `name` is executed. If we put `name` in the lambda function, it's too late, name was already set to `Pause` so both buttons will set "Pause click" text. We need `name` to be set when the for loop iteration is executed, not when the lambda function is executed, therefore we pass `name` as a parameter and this is the moment it is resolved. Here is a [short SO post](https://stackoverflow.com/a/28494140/619493) that explains this.


[The complete script](https://github.com/littlevgl/lv_binding_micropython/blob/master/gen/advanced_demo.py).

Currently the binding is limited to only one callback per object.

---

# How does it work?

> TL;DR:
> A script parses LittlevGL headers and creates a Micropython module.

To use LittlevGL in Micropython, you need [Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython).  
This binding is a generator for LittlevGL Micropython module.  
It's essentialy a python script that reads and parses LittlevGL C headers and generates Micropython module from them. This module can be used in Micropython to access most of LittlevGL API.

LittlevGL is an Object Oriented component-based library. There is a base class called `lv_obj` from which all other components inherit from, and a hierarchy between the components. Objects have their method functions, inherit their parent methods etc.  
Micropython Binding for LittlevGL tries to take advantage of this design, and models this class hierarchy in Python. You can create your own (pure Python) composite components from existing LittlevGL components by inheritance.

For more details, please refer to the [README of Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython/blob/master/README.md).

---

# How can I use it?

> TL;DR:
> The quickest way to start: Fork [`lv_micropython`](https://github.com/littlevgl/lv_micropython). It has working Unix (Linux) and ESP32 ports of Micropython + LittlevGL.

[Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython) (`lv_binding_micropython`) was designed to make it simple to use LittlevGL with Micropython. In principle it can support any micropython fork.  
To add it to some Micropython fork you need to add `lv_binding_micropython` under Micropython lib as a git submodule. `lv_binding_micropython` itself contains LittlevGL as a git submodule.  
In the Micropython code itself, very few changes are needed. You need to add some lines to Micropython Makefile in order to create LittlevGL Binding module and in order to compile LittlevGL, and you also need to add the new `lvgl` module to Micropython by editing `mpconfigport.h`.  

As an example, I've created [`lv_micropython`](https://github.com/littlevgl/lv_micropython) - a Micropython fork with LittlevGL binding.  
You can use it as is, or as an example of how to integrate LittlevGL with Micropython.  
[`lv_micropython`](https://github.com/littlevgl/lv_micropython) can currently be used with LittlevGL on the unix port and on the ESP32 port.

LittlevGL needs drivers for the display and for the input device.
The Micropython binding contains some example drivers that are registered and used on [`lv_micropython`](https://github.com/littlevgl/lv_micropython):

- SDL unix drivers (display and mouse)
- ILI9341 driver for ESP32.  
- Raw Resistive Touch for ESP32 (ADC connected to screen directly, no touch IC)

It is easy to create new drivers for other displays and input devices. If you add some new driver, we would be happy to add it to Micropython Binding, so please send us a PR!

---

# FAQ

## How can I know which LittlevGL objects and functions are available on Micropython?

Actually, almost all of them are available!  
If some are missing and you need them, please open an issue on [Micopython Binding Issues section](https://github.com/littlevgl/lv_binding_micropython/issues), and I'll try to add them.

- Run Micropython with LittlevGL module enabled (for example, [`lv_micropython`](https://github.com/littlevgl/lv_micropython))
- Open the REPL (interactive console)
- `import lvgl as lv`
- Type `lv.` + <kbd>TAB</kbd> for completion. All supported classes and functions of LittlevGL will be displayed.
- Another option: `help(lv)`
- Another option: `print('\n'.join(dir(lv)))`
- You can also do that recursively. For example `lv.btn.` + <kbd>TAB</kbd>, or `print('\n'.join(dir(lv.btn)))`

You can also have a look at the LittlevGL binding module itself. It is generated during Micropython build, and is ususally called `lv_mpy.c`.

## That's a huge API! There are more than 25K lines of code on the LittlevGL binding module only! Before counting LittlevGL code itself!

It depends on LittlevGL configuration. It can be small or large.  
Remember that LittlevGL binding module is generated when you build Micropython, based on LittlevGL headers **and configuration file** - `lv_conf.h`.  
If you enabled everything on `lv_conf.h` - the module will be large. You can disable features and remove unneeded components by changing definitions in `lv_conf.h`, and the module will become much smaller.  

Anyway, remember that the module is on *Progam Memory*. It does not consume RAM by itself, only ROM.  
From RAM perpective, every **instance** of LittlevGL object will usually consume only a few bytes extra, to represent a Micropython wrapper object around LittlevGL object.

## I would like to try it out! What is the quickest way to start?

The quickest way to start: Fork [`lv_micropython`](https://github.com/littlevgl/lv_micropython). It has working unix (Linux) and ESP32 ports of Micropython + LittlevGL.

## LittlevGL on Python? Isn't it kinda.. slow?

No.  
All LittlevGL functionality (such as rendering the graphics) is still in C.  
The Micropython binding only provides wrappers for LittlevGL API, such as creating components, setting their properties, layout, styles etc. Very few cycles are spent over there compared to other LittlevGL functionality.

## Can I use LittlevGL binding on XXXX Micropython fork?

Probably yes!  
You would need to add [Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython) as a submodule in your fork, and make some small changes to the Makefile and `mpconfigport.h` in your port, but that's about it.  
For more details please have a look at the [README](https://github.com/littlevgl/lv_binding_micropython/blob/master/README.md).

## Can I use LittlevGL binding with XXXX display/input-device hardware?
Yes, but [you need a driver](https://docs.littlevgl.com/#Porting).  
LittlevGL requires a driver for Display and Input device.  
Once you have a C driver for your hardware, it's very simple to wrap it as a module in Micropython and use it with LittlevGL Binding for Micropython.  
You can see some examples of such drivers (and their wrapper Micopython module) on [the `driver` directory](https://github.com/littlevgl/lv_binding_micropython/tree/master/driver) of LittlevGL Binding for Micopython.

## I need to allocate a LittlevGL struct (such as Style, Color etc.) How can I do that? How do I allocate/deallocate memory for it?
In most cases **you don't need to worry about memory allocation**.  
That's because LittlevGL can take advantage of Micropython's gc! ([Garbage Collection](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)))  
When some memory is allocated, Micropython will know when to release it, when it is no longer needed.  
LittlevGL structs are implemented as Micropython classes under `lvgl` module.  
You can create them as any other object:

```python
import lvgl as lv
s = lv.style_t()
```

You can also create a struct which is a copy of another struct:

```python
import lvgl as lv
s = lv.style_t(lv.style_plain)
```

You can access them much like C structs, using Python attributes:

```python
s.text.color = lv.color_hex(0xffffff)
```

## Something is wrong / not working / missing in LittlevGL on Micopython!

Please report bugs and problems on the [Micopython Binding Issues section](https://github.com/littlevgl/lv_binding_micropython/issues) of [Micropython Binding for LittlevGL](https://github.com/littlevgl/lv_binding_micropython) on GitHub.  
You can also contact us on [LittlevGL Forum](https://forum.littlevgl.com/) for questions, or any other discussions.


