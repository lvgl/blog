---
layout: post
title: "Use PNG images in LittlevGL"
author: "kisvegabor"
cover: /assets/png_converter/cover.png
image:
  path: /assets/png_converter/cover.png
  height: 300
  width: 300
---

If you already used images in LittlevGL probably you used the [Online image converter](https://littlevgl.com/image-to-c-array) to convert an image to a C array and you compiled the C array into your code. However, since v5.2 LittlevGL has an image decoder interface which allows adding your own decoder functions to open and read any type of images. In this post, I will show you how to add and use the [lodepng](https://github.com/lvandeve/lodepng) library to display PNG images in real time. 

## Before get started
You need to know that opening PNG images in resource-limited embedded systems has advantages and disadvantages too. The main advantage is that PNG images have much smaller size than an uncompressed image. The disadvantage is that you need a big buffer to describe the whole image and in addition, the decoding needs some time. However, some considerations can be done. For example, keep the last image in the buffer, probably it will be required again or, if you have more RAM, keep the last 3 images buffered. This way you can save ROM because you store the images as PNG and you decode only those which are required. These all depend on your system and resources.

## Start LittlevGL in a PC simulator
It's much faster and easier to work on PC compared to an embedded hardware. Therefore to help your development LittlevGL is ported to Windows, Linux and OSX too. If you didn't set-up you PC simulator environment yet here is a great time to do it! Read this tutorial: https://littlevgl.com/pc-simulator

## Add and test the PNG decoder library with a file
If you are not interested in the implementation details you can **download** a ready use [PNG decoder for LittelvGL](https://github.com/littlevgl/blog/raw/master/assets/png_converter/png_decoder.zip).

There are some PNG decoder libraries even for embedded systems. Basically, you can choose any of them because they all work similarly, however, there can be differences in speed and performance. For this tutorial, I've chosen the [lodepng](https://github.com/lvandeve/lodepng) library. This library consists of only 2 files: 
- lodepng.cpp
- lodepng.h

Download this two files and copy into your project next to your *main.c* file.  As you can see it's a **cpp** file but don't worry, you can rename it to **lodepng.c** if you want.

So to see how *lodepng* works we will decode a PNG image file into an array and use this array as an image source in LittlevGL.   

I used the image below and copied into the project's root folder. 

![Example PNG image to decode with LittlevGL](/assets/png_converter/png_decoder_test.png)

For simplicity, I added all the code into *main.c*.   

So the first thing is to include *lodepng*.

```c
#include "lodepng.h"
```

Now read the file and load it's content to a buffer. It should be after *lv_init()* :

```c
uint32_t error;                 /*For the return values of png decoder functions*/

/*Load the PNG file into buffer. It's still compressed (not decoded)*/
unsigned char * png_data;      /*Pointer to the loaded data. Same as the original file just loaded into the RAM*/
size_t png_data_size;          /*Size of `png_data` in bytes*/

error = lodepng_load_file(&png_data, &png_data_size, "png_decoder_test.png");   /*Load the file*/
if(error) {
    printf("error %u: %s\n", error, lodepng_error_text(error));
    while(1);
}
```

Now decode the PNG image from the buffer.

```c
/*Decode the PNG image*/
unsigned char * png_decoded;    /*Will be pointer to the decoded image*/
uint32_t png_width;             /*Will be the width of the decoded image*/
uint32_t png_height;            /*Will be the width of the decoded image*/

/*Decode the loaded image in ARGB8888 */
error = lodepng_decode32(&png_decoded, &png_width, &png_height, png_data, png_data_size);   

if(error) {
    printf("error %u: %s\n", error, lodepng_error_text(error));
    while(1);
}
```

The image is decompressed into *png_decoded*. We only need to set-up a LittlevGL image descriptor and create an image object.

```c
/*Initialize an image descriptor for LittlevGL with the decoded image*/
lv_img_dsc_t png_dsc;
png_dsc.header.always_zero = 0;                          /*It must be zero*/
png_dsc.header.cf = LV_IMG_FORMAT_TRUE_COLOR_ALPHA;      /*Set the color format*/
png_dsc.header.w = png_width;
png_dsc.header.h = png_height;
png_dsc.data_size = png_width * png_height * 4;
png_dsc.data = png_decoded;

/*Create an image object and set the decoded PNG image as it's source*/
lv_obj_t * img_obj = lv_img_create(lv_scr_act(), NULL);     /*Create the an image object in LittlevGL*/
lv_img_set_src(img_obj, &png_dsc);                          /*Set the image source to the decoded PNG*/
lv_obj_set_drag(img_obj, true);                             /*Make to image dragable*/

/*Set a non-white background color for the scren to see the alpha is working on the image*/
lv_style_scr.body.main_color = LV_COLOR_MAKE(0x40, 0x70, 0xAA);
```

After compile and run I got this:

![PNG image decoded in LittlevGL with lodepng](/assets/png_converter/png_decode_one.png)

## Test the PNG decoder library with a PNG file stored in ROM

If you **don't have a file system** on your device and you'd like to store the PNG image in ROM and decode it when you need it you can use the [Online image converter](https://littlevgl.com/image-to-c-array) to get a C array from an uncompressed PNG file. Just upload the PNG image, select the**Raw with alpha** color format and **C array** output format. Here is [the result file](/blog/png/png_decoder_test.c). Copy this file in your project and modify the decoder code like below. You just need to remove the "load from file" section and use the data from the converted file.

```c
LV_IMG_DECLARE(png_decoder_test);   /*Declare the C array*/
uint32_t error;                     /*For the return values of png decoder functions*/

/*Decode the PNG image*/
unsigned char * png_decoded;    /*Will be pointer to the decoded image*/
uint32_t png_width;             /*Will be the width of the decoded image*/
uint32_t png_height;            /*Will be the width of the decoded image*/

 /*Decode the loaded image in ARGB8888 */
error = lodepng_decode32(&png_decoded, &png_width, &png_height, png_decoder_test.data, png_decoder_test.data_size);  

if(error) {
    printf("error %u: %s\n", error, lodepng_error_text(error));
    while(1);
}

/*Initialize an image descriptor for LittlevGL with the decoded image*/
... from here the same as above ..
```

It resulted in the same image.

## Test the PNG decoder's speed on a microcontroller
I tested the PNG decoder's speed with an [STM32F429ZI](https://www.st.com/en/microcontrollers/stm32f429zi.html) microcontroller which runs at 180MHz and has 2 MB flash and 256 kB RAM. The test image had **100 x 65** resolution. The decompression lasted for **7 ms**.  Note that the result is in ARGB8888 format which might be converted to the systems color format (e.g. RGB565). This conversion required 1 ms. 

## Connect the PNG decoder to LittlevGL
LittlveGL requires 4 functions to decode your custom image formats:
1. **decoder info**  used to get the most basic information about the image like it's width, height and color format.
2. **decoder open**  can work in two ways:
  * Open and decode the whole image into a buffer and return with this buffer. (it will be used with PNG images) 
  * Only prepare the decoding and return with `NULL`. In this case `decoder read` will be called to read the relevant parts of the image line-by-line.
3. **decoder read line** as described above it is called to read ONLY the required lines of the image. If the image decoder supports partial decompression it can save RAM and time. 
4. **decoder close** free the used resources

So let's see how to implement these function to decode PNG images!

## Decoder info
```c
/**
 * Get info about a PNG image
 * @param src can be file name or pointer to a C array
 * @param header store the info here
 * @return LV_RES_OK: no error; LV_RES_INV: can't get the info
 */
lv_res_t decoder_info(const void * src, lv_img_header_t * header)
{
     lv_img_src_t src_type = lv_img_src_get_type(src);          /*Get the source type*/

     /*If it's a PNG file...*/
     if(src_type == LV_IMG_SRC_FILE) {
         const char * fn = src;
         if(!strcmp(&fn[strlen(fn) - 3], "png")) {              /*Check the extension*/

             /* Read the width and height from the file. They have a constant location:
              * [16..23]: width
              * [24..27]: height
              */
             FILE* file;
             file = fopen(fn, "rb" );
             if(!file) return LV_RES_INV;
             fseek(file, 16, SEEK_SET);
             uint32_t size[2];
             fread(size, 1 , 8, file);
             fclose(file);

             /*Save the data in the header*/
             header->always_zero = 0;
             header->cf = LV_IMG_FORMAT_RAW_ALPHA;
             /*The width and height are stored in Big endian format so convert them to little endian*/
             header->w = (lv_coord_t) ((size[0] & 0xff000000) >> 24) +  ((size[0] & 0x00ff0000) >> 8);
             header->h = (lv_coord_t) ((size[1] & 0xff000000) >> 24) +  ((size[1] & 0x00ff0000) >> 8);

             return LV_RES_OK;
         }
     }
     /*If it's a PNG file in a  C array...*/
     else if(src_type == LV_IMG_SRC_VARIABLE) {
         const lv_img_dsc_t * img_dsc = src;
         header->always_zero = 0;
         header->cf = img_dsc->header.cf;       /*Save the color format*/
         header->w = img_dsc->header.w;         /*Save the color width*/
         header->h = img_dsc->header.h;         /*Save the color height*/
         return LV_RES_OK;
     }

     return LV_RES_INV;         /*If didn't succeeded earlier then it's an error*/
}
```

## Decoder open
```c
static unsigned char * png_decoded;    /*Will be pointer to the decoded image*/

/**
 * Open a PNG image and return the decided image
 * @param src can be file name or pointer to a C array
 * @param style style of the image object (unused now but certain formats might use it)
 * @return pointer to the decoded image or  `LV_IMG_DECODER_OPEN_FAIL` if failed
 */
const uint8_t * decoder_open(const void * src, const lv_style_t * style)
{
    uint32_t error;                 /*For the return values of PNG decoder functions*/

    lv_img_src_t src_type = lv_img_src_get_type(src);          /*Get the source type*/

    /*If it's a PNG file...*/
    if(src_type == LV_IMG_SRC_FILE) {
        const char * fn = src;

        if(!strcmp(&fn[strlen(fn) - 3], "png")) {              /*Check the extension*/

            /*Load the PNG file into buffer. It's still compressed (not decoded)*/
            unsigned char * png_data;      /*Pointer to the loaded data. Same as the original file just loaded into the RAM*/
            size_t png_data_size;          /*Size of `png_data` in bytes*/

            error = lodepng_load_file(&png_data, &png_data_size, fn);   /*Load the file*/
            if(error) {
                printf("error %u: %s\n", error, lodepng_error_text(error));
                return LV_IMG_DECODER_OPEN_FAIL;
            }

            /*Decode the PNG image*/
            uint32_t png_width;             /*Will be the width of the decoded image*/
            uint32_t png_height;            /*Will be the width of the decoded image*/

            /*Decode the loaded image in ARGB8888 */
            error = lodepng_decode32(&png_decoded, &png_width, &png_height, png_data, png_data_size);

            if(error) {
                printf("error %u: %s\n", error, lodepng_error_text(error));
                return LV_IMG_DECODER_OPEN_FAIL;
            }

            return png_decoded;     /*The image is fully decoded. Return with its pointer*/
        }
    }
    /*If it's a PNG file in a  C array...*/
    else if(src_type == LV_IMG_SRC_VARIABLE) {
        const lv_img_dsc_t * img_dsc = src;
        uint32_t png_width;             /*No used, just required by he decoder*/
        uint32_t png_height;            /*No used, just required by he decoder*/

        /*Decode the image in ARGB8888 */
        error = lodepng_decode32(&png_decoded, &png_width, &png_height, img_dsc->data, img_dsc->data_size);

        if(error) {
            return LV_IMG_DECODER_OPEN_FAIL;
        }

        return png_decoded;     /*Return with its pointer*/
    }

    return LV_IMG_DECODER_OPEN_FAIL;    /*If not returned earlier then it failed*/
}
</code></pre>

## Decoder close
/**
 * Free the allocated resources
 */
void decoder_close(void)
{
    free(png_decoded);
}
```

## Register the decoder functions in LittlevGL
And finally the created functions should be regitered in LittlevGL:
```c
lv_img_decoder_set_custom(decoder_info, decoder_open, NULL, decoder_close);
```

After this, if you can set PNG images from file or C array as the source of [image object's](https://docs.littlevgl.com/#Image) of LittlevGL 

## Conclusion
You just learned how to use the image decoder interface of LittlevGL to add a custom image format. It's a powerful feature which enables you to use any type of images according to your needs. You can even convert your images to a unique format which exactly meet your needs. 
 
