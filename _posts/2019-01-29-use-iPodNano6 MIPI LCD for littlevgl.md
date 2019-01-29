This blog tells you something about **How to use the iPodNano6 LCD for LittlevGL.** I am going to hack the LCD that is supposed to display on an Apple's iPodNano6 for LittlevGL with Espressif ESP32 Wifi/BLE SoC.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/Running_littlevGL.JPG)
LCD for iPod Nano6 uses MIPI Display Serial Interface (MIPI DSI) which is a high-speed serial interface between a host processor and a display module. LCDs belong to this category are very common for smartphones, tablets, and smartwatches. Reference is available from MIPI alliance page at https://www.mipi.org/specifications/dsi. Some MIPI LCDs on hands are displayed here.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/Some_mipi_displays.jpg)
*Googling* the keyword MIPI brings up several pdf documents of hundred pages. It is always fun to learn from specifications like this - http://bfiles.chinaaet.com/justlxy/blog/20171114/1000019445-6364627609238902374892404.pdf.
It states *"MIPI DSI specifies the interface between a host processor and a display..."* and finally a picture like this shows up that I can barely understand.
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/mipi_IF.jpg)<br>
If a 100-pages specification takes too much time, this may be all you need to know about MIPI D'PHY RX<br>
https://www.edn.com/Pdf/ViewPdf?contentItemId=4440302<br>
Transmission speed of MIPI is very high, ranging from 1.0Gbps/lane to 4.5Gbps/lane with 1-4 data lane plus 1 clock signal all in differential buses. Voltage swing driven by the difference buses is also different from RGB/MCU-typed LCD. For MIPI DSI there are high-speed (HS) and low-speed (LS) modes driving 200mV peak-to-peak and 1.2V respectively. In contrast, data of RGB/MCU-typed LCDs is carried with single-ended signals matching VDDIO of MCU host.<br>
Table below summaries the difference.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/mipi_vs_conventional-LCD.jpg)<br>

Usually interface of a MIPI LCD needs much less pins and lower voltage than its MCU/RGB counterpart. 
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/Pinout_compare.jpg)<br>

The problem is, how are we going to drive a MIPI display when there is no DSI output from our MCU (like ESP32) and how to port it to LittlevGL? Here comes the MIPI bridge IC - SSD2805, which is an interface chip to convert between RGB/8080 video signal to MIPI signal.<br> ![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/SSD2805_top.jpg)<br>
This is a very tiny chip of 5*5mm with 0.5mm pitch BGA!<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/SSD2805_bottom.jpg)

The block diagram of my setup is shown below.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/block_diagram.jpg?raw=true)<br>
ESP32 is programmed with ESP-IDF (Espressif IoT Development Framework). Its installation procedure is described in full details at https://docs.espressif.com/projects/esp-idf/en/latest/get-started/index.html. My host computer is a Windows 7 Pro SP1 64-bit Operating System. Hardware is an old Intel Core i5 with 8GB RAM. I have followed the default installation path described in ESP-IDF's Getting Started Guide. It gave me back a mingw32.exe application under C:\msys32\.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/mingw32_folders.jpg)<br>
At first I was not comfortable with command line tool like mingw32.exe. So I have spent almost two days to install Eclipse IDE with innumerable Google searches trying to make it work. Unfortunately all hours in Eclipse became futile. At the end I found the time spent on configuring Eclipse was even more than programming itself so I just gave it up. Don't mean Eclipse is bad. It is just me not able to get it work.<br>
Because there is no standard evaluation kit for ESP32 + SSD2805 + MIPI Display combo, I was forced to use jumper cables to wire up things with mess like this :(<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/messy_wireup.JPG)<br>
The pinout diagram is illustrated below.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/pinout_eps32_LCD.jpg)
Although the main theme of this article is about LittlevGL, the prerequisite is a fully working LCD and touch screen drivers outside LittlevGL. I started with a program with 5 source files to drive the LCD. 
List of source files are:<br>
```
(1) i2s_8080_hello_world.c
(2) SSD2805_8080_drv.c and .h
(3) i2s_lcd.c and .h
```
Low level driver files i2s_lcd.c and .h have been modified from github source:<br>
https://github.com/espressif/esp-iot-solution/tree/master/components/i2s_devices/lcd_common
Full source code of the first project can be downloaded from this link:<br>
To compile this project, just copy the whole folder containing relevant configuration files including Makefile, sdkconfig, etc to a convenient path at D:\esp32\i2s_8080_lcd<br>

