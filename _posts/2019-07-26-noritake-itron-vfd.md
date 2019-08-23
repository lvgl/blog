
## Example - Noritake Itron VFD Driver

For this post, I am implementing a driver for the graphic VFD I picked up. Noritake Itron provides libraries for STM32, Arduino, and TI MSP430 on their site. They work but are a bit clunky. Although my project will be running on an STM32F4, it’s easiest to tie into LittlevGL through this framework.
The Noritake display supports three interfaces, UART, I2C, and SPI. All three are extremely common in embedded systems and Mbed-OS provides drivers for each of them. The display doesn’t require any special differentiation of command and display data, so for this display we won’t have to write a custom DisplayInterface. From the factory, the display is configured for UART and requires bridging solder jumpers to change it, so I won’t.
Okay, so I lied a little bit. The DisplayDriver base class requires a DisplayInterface be passed to its constructor. So we can just make a little wrapper class to encapsulate Mbed’s RawSerial (essential UART) class. This may be a little wasteful in terms of program memory, but I think the benefits of C++ justify it. See the code listing below for the SerialInterface class I created for this example:
< INSERT CODE SNIPPET HERE>
Now that the interface is done, we can start writing the driver. As I mentioned before, Noritake Itron provides some code to interface with their displays. It serves as base to adapt for our driver and takes care of a lot of datasheet reading.
To make the driver, I just had to take the library from Noritake and reformat it to use the SerialInterface. I also made it a little more readable. The real magic is implementing DisplayDriver::flush. This function (among others, depending on your virtual display buffer configuration) serves as an API to LittlevGL, letting it know how to draw its graphics to the display. See the code snippet below:
< INSERT CODE SNIPPET HERE>
Now that we have our interface and driver implementations, let’s make an example to make sure it all works.
Example and Testing
Configuring LittlevGL
Mbed’s build system provides a nifty way to configure settings and features (essentially macros) using JSON files. To take advantage of this, my port has mbed_lib.json that allows you to reconfigure all the settings normally available through lv_conf.h. Check out Mbed’s documentation on compile-time configuration here.
Optimizations
DMA (not much of a concern in this case), restructuring my wrapper a bit, abstracting GPU operations away from DisplayDriver

Make sure to configure theme_mono to be enabled!
