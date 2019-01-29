LCD for iPod Nano6 uses MIPI Display Serial Interface (MIPI DSI) which is a high-speed serial interface between a host processor and a display module. LCDs belong to this category are very common for smartphones, tablets, and smartwatches. Reference is available from MIPI alliance page at https://www.mipi.org/specifications/dsi. Some MIPI LCDs are shown here.
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/Some_mipi_displays.jpg)
Google the keyword MIPI specification pops up several pdf documents of something like hundred pages. It is always fun to learn from specifications like this - http://bfiles.chinaaet.com/justlxy/blog/20171114/1000019445-6364627609238902374892404.pdf
It states "MIPI DSI specifies the interface between a host processor and a display... building on existing MIPI alliance... finally a picture like below shows up that I can finally understand.
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/mipi_IF.jpg)<br>
If a 100-pages specification takes too much time, this is all you need to know about MIPI D'PHY RX<br>
https://www.edn.com/Pdf/ViewPdf?contentItemId=4440302<br>
There are several versions of MIPI DSI from DSI 1.0 to DSI-2 1.0, 5 versions. Transmission speed ranges from 1.0Gbps/lane to 4.5Gbps/lane with 1-4 data lane plus 1 clock signal, all in differential buses. Voltage swing driven by the difference buses is also different from RGB/MCU-typed MCU. For MIPI DSI there are high-speed (HS) and low-speed (LS) modes driving 200mV peak-to-peak and 1.2V respectively. For RGB/MCU-typed LCDs data is carried with single-ended signals matching VDDIO to its MCU host.<br>
Table below summaries the difference.<br>
![](https://github.com/techtoys/blog/blob/master/assets/iPodNano6/mipi_vs_conventional-LCD.jpg)<br>

Interface of a MIPI LCD needs much less pins and lower voltage than its MCU/RGB counterpart. 
