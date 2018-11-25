http://registry.gimp.org/node/25275

This script "dithers" RGB images to 16-bit color, either:

ARGB4444/4096colors+16levels of transparency,
RGB565/65536colors+ no transparency, or
ARGB1555/32768colors + fully transparent or not.

The higher-depth dither is especially useful for mobile developers who need to pre-dither
assets for 12-bit screens.

Version 0.2 - Added RGB565 and ARGB1555.

Please email me for any issues... I'm pretty swamped, but I'll try to address!

INSTALL:
Copy the dither16bit.scm file to your scripts dir.
Extract the 4 separate *BitGrayscale.gpl files from the zipfile and copy to your palettes dir.
To run, start up GIMP, go to Image->Mode->Dither to ARGB4444/RGB565/RGB1555
