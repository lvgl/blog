/*
 * GENERATED FILE - DO NOT EDIT
 * Copyright (c) 2008-2013 Code Red Technologies Ltd,
 * Copyright 2015, 2018-2019 NXP
 * (c) NXP Semiconductors 2013-2021
 * Generated linker script file for LPC54S018
 * Created from linkscript.ldt by FMCreateLinkLibraries
 * Using Freemarker v2.3.30
 * MCUXpresso IDE v11.3.0 [Build 5222] [2021-01-11] on Mar 31, 2021 2:53:20 PM
 */

INCLUDE "lpcxpresso54s018_littlevgl_demo_widgets_bm_Debug_library.ld"
INCLUDE "lpcxpresso54s018_littlevgl_demo_widgets_bm_Debug_memory.ld"

ENTRY(ResetISR)

SECTIONS
{
     /* MAIN TEXT SECTION */
    .text : ALIGN(4)
    {
        FILL(0xff)
        __vectors_start__ = ABSOLUTE(.) ;
        KEEP(*(.isr_vector))
        /* Global Section Table */
        . = ALIGN(4) ;
        __section_table_start = .;
        __data_section_table = .;
        LONG(LOADADDR(.data));
        LONG(    ADDR(.data));
        LONG(  SIZEOF(.data));
        LONG(LOADADDR(.data_RAM2));
        LONG(    ADDR(.data_RAM2));
        LONG(  SIZEOF(.data_RAM2));
        LONG(LOADADDR(.data_RAM3));
        LONG(    ADDR(.data_RAM3));
        LONG(  SIZEOF(.data_RAM3));
        LONG(LOADADDR(.data_RAM4));
        LONG(    ADDR(.data_RAM4));
        LONG(  SIZEOF(.data_RAM4));
        __data_section_table_end = .;
        __bss_section_table = .;
        LONG(    ADDR(.bss));
        LONG(  SIZEOF(.bss));
        LONG(    ADDR(.bss_RAM2));
        LONG(  SIZEOF(.bss_RAM2));
        LONG(    ADDR(.bss_RAM3));
        LONG(  SIZEOF(.bss_RAM3));
        LONG(    ADDR(.bss_RAM4));
        LONG(  SIZEOF(.bss_RAM4));
        __bss_section_table_end = .;
        __section_table_end = . ;
        /* End of Global Section Table */

        *(.after_vectors*)

    } > BOARD_FLASH

    .text : ALIGN(4)
    {
		*(EXCLUDE_FILE(*lv_disp.o *lv_group.o *lv_indev.o *lv_obj.o *lv_refr.o *lv_style.o *lv_draw_arc.o *lv_draw_blend.o *lv_draw_img.o *lv_draw_label.o *lv_draw_line.o *lv_draw_mask.o *lv_draw_rect.o *lv_draw_triangle.o *lv_img_buf.o *lv_img_cache.o *lv_img_decoder.o *lv_hal_disp.o *lv_hal_indev.o *lv_hal_tick.o *lv_anim.o *lv_area.o *lv_async.o *lv_bidi.o *lv_color.o *lv_fs.o *lv_gc.o *lv_ll.o *lv_math.o *lv_mem.o *lv_task.o *lv_templ.o *lv_txt.o *lv_txt_ap.o *lv_utils.o *lv_theme.o *lv_theme_empty.o *lv_theme_material.o *lv_theme_mono.o *lv_anim_img.o *lv_arc.o *lv_bar.o lv_btn.o *lv_btnmatrix.o *lv_calendar.o *lv_canvas.o *lv_chart.o *lv_checkbox.o *lv_cont.o *lv_cpicker.o *lv_dropdown.o *lv_gauge.o *lv_img.o *lv_imgbtn.o *lv_keyboard.o *lv_label.o *lv_led.o *lv_line.o *lv_linemeter.o *lv_list.o *lv_msgbox.o *lv_objmask.o *lv_objx_templ.o *lv_page.o *lv_roller.o *lv_slider.o *lv_spinbox.o *lv_spinner.o *lv_switch.o *lv_table.o *lv_tabview.o *lv_textarea.o *lv_tileview.o *lv_win.o) .text*)
		*(EXCLUDE_FILE(*lv_disp.o *lv_group.o *lv_indev.o *lv_obj.o *lv_refr.o *lv_style.o *lv_draw_arc.o *lv_draw_blend.o *lv_draw_img.o *lv_draw_label.o *lv_draw_line.o *lv_draw_mask.o *lv_draw_rect.o *lv_draw_triangle.o *lv_img_buf.o *lv_img_cache.o *lv_img_decoder.o *lv_hal_disp.o *lv_hal_indev.o *lv_hal_tick.o *lv_anim.o *lv_area.o *lv_async.o *lv_bidi.o *lv_color.o *lv_fs.o *lv_gc.o *lv_ll.o *lv_math.o *lv_mem.o *lv_task.o *lv_templ.o *lv_txt.o *lv_txt_ap.o *lv_utils.o *lv_theme.o *lv_theme_empty.o *lv_theme_material.o *lv_theme_mono.o *lv_anim_img.o *lv_arc.o *lv_bar.o lv_btn.o *lv_btnmatrix.o *lv_calendar.o *lv_canvas.o *lv_chart.o *lv_checkbox.o *lv_cont.o *lv_cpicker.o *lv_dropdown.o *lv_gauge.o *lv_img.o *lv_imgbtn.o *lv_keyboard.o *lv_label.o *lv_led.o *lv_line.o *lv_linemeter.o *lv_list.o *lv_msgbox.o *lv_objmask.o *lv_objx_templ.o *lv_page.o *lv_roller.o *lv_slider.o *lv_spinbox.o *lv_spinner.o *lv_switch.o *lv_table.o *lv_tabview.o *lv_textarea.o *lv_tileview.o *lv_win.o) .rodata)
		*(EXCLUDE_FILE(*lv_disp.o *lv_group.o *lv_indev.o *lv_obj.o *lv_refr.o *lv_style.o *lv_draw_arc.o *lv_draw_blend.o *lv_draw_img.o *lv_draw_label.o *lv_draw_line.o *lv_draw_mask.o *lv_draw_rect.o *lv_draw_triangle.o *lv_img_buf.o *lv_img_cache.o *lv_img_decoder.o *lv_hal_disp.o *lv_hal_indev.o *lv_hal_tick.o *lv_anim.o *lv_area.o *lv_async.o *lv_bidi.o *lv_color.o *lv_fs.o *lv_gc.o *lv_ll.o *lv_math.o *lv_mem.o *lv_task.o *lv_templ.o *lv_txt.o *lv_txt_ap.o *lv_utils.o *lv_theme.o *lv_theme_empty.o *lv_theme_material.o *lv_theme_mono.o *lv_anim_img.o *lv_arc.o *lv_bar.o lv_btn.o *lv_btnmatrix.o *lv_calendar.o *lv_canvas.o *lv_chart.o *lv_checkbox.o *lv_cont.o *lv_cpicker.o *lv_dropdown.o *lv_gauge.o *lv_img.o *lv_imgbtn.o *lv_keyboard.o *lv_label.o *lv_led.o *lv_line.o *lv_linemeter.o *lv_list.o *lv_msgbox.o *lv_objmask.o *lv_objx_templ.o *lv_page.o *lv_roller.o *lv_slider.o *lv_spinbox.o *lv_spinner.o *lv_switch.o *lv_table.o *lv_tabview.o *lv_textarea.o *lv_tileview.o *lv_win.o) .rodata.*)
		*(EXCLUDE_FILE(*lv_disp.o *lv_group.o *lv_indev.o *lv_obj.o *lv_refr.o *lv_style.o *lv_draw_arc.o *lv_draw_blend.o *lv_draw_img.o *lv_draw_label.o *lv_draw_line.o *lv_draw_mask.o *lv_draw_rect.o *lv_draw_triangle.o *lv_img_buf.o *lv_img_cache.o *lv_img_decoder.o *lv_hal_disp.o *lv_hal_indev.o *lv_hal_tick.o *lv_anim.o *lv_area.o *lv_async.o *lv_bidi.o *lv_color.o *lv_fs.o *lv_gc.o *lv_ll.o *lv_math.o *lv_mem.o *lv_task.o *lv_templ.o *lv_txt.o *lv_txt_ap.o *lv_utils.o *lv_theme.o *lv_theme_empty.o *lv_theme_material.o *lv_theme_mono.o *lv_anim_img.o *lv_arc.o *lv_bar.o lv_btn.o *lv_btnmatrix.o *lv_calendar.o *lv_canvas.o *lv_chart.o *lv_checkbox.o *lv_cont.o *lv_cpicker.o *lv_dropdown.o *lv_gauge.o *lv_img.o *lv_imgbtn.o *lv_keyboard.o *lv_label.o *lv_led.o *lv_line.o *lv_linemeter.o *lv_list.o *lv_msgbox.o *lv_objmask.o *lv_objx_templ.o *lv_page.o *lv_roller.o *lv_slider.o *lv_spinbox.o *lv_spinner.o *lv_switch.o *lv_table.o *lv_tabview.o *lv_textarea.o *lv_tileview.o *lv_win.o) .constdata)
		*(EXCLUDE_FILE(*lv_disp.o *lv_group.o *lv_indev.o *lv_obj.o *lv_refr.o *lv_style.o *lv_draw_arc.o *lv_draw_blend.o *lv_draw_img.o *lv_draw_label.o *lv_draw_line.o *lv_draw_mask.o *lv_draw_rect.o *lv_draw_triangle.o *lv_img_buf.o *lv_img_cache.o *lv_img_decoder.o *lv_hal_disp.o *lv_hal_indev.o *lv_hal_tick.o *lv_anim.o *lv_area.o *lv_async.o *lv_bidi.o *lv_color.o *lv_fs.o *lv_gc.o *lv_ll.o *lv_math.o *lv_mem.o *lv_task.o *lv_templ.o *lv_txt.o *lv_txt_ap.o *lv_utils.o *lv_theme.o *lv_theme_empty.o *lv_theme_material.o *lv_theme_mono.o *lv_anim_img.o *lv_arc.o *lv_bar.o lv_btn.o *lv_btnmatrix.o *lv_calendar.o *lv_canvas.o *lv_chart.o *lv_checkbox.o *lv_cont.o *lv_cpicker.o *lv_dropdown.o *lv_gauge.o *lv_img.o *lv_imgbtn.o *lv_keyboard.o *lv_label.o *lv_led.o *lv_line.o *lv_linemeter.o *lv_list.o *lv_msgbox.o *lv_objmask.o *lv_objx_templ.o *lv_page.o *lv_roller.o *lv_slider.o *lv_spinbox.o *lv_spinner.o *lv_switch.o *lv_table.o *lv_tabview.o *lv_textarea.o *lv_tileview.o *lv_win.o) .constdata.*)
		. = ALIGN(4);
    } > BOARD_FLASH
    /*
     * for exception handling/unwind - some Newlib functions (in common
     * with C++ and STDC++) use this.
     */
    .ARM.extab : ALIGN(4)
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > BOARD_FLASH

    .ARM.exidx : ALIGN(4)
    {
        __exidx_start = .;
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
        __exidx_end = .;
    } > BOARD_FLASH
 
    _etext = .;
        
 
    /* USB_RAM */
    .m_usb_data (NOLOAD) :
    {
        *(m_usb_global)
    } > USB_RAM AT> USB_RAM
    /* DATA section for SRAM_0_1_2_3 */

    .data_RAM2 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM2 = .) ;
        PROVIDE(__start_data_SRAM_0_1_2_3 = .) ;
        *(.ramfunc.$RAM2)
        *(.ramfunc.$SRAM_0_1_2_3)
        *(.data.$RAM2)
        *(.data.$SRAM_0_1_2_3)
        *(.data.$RAM2.*)
        *(.data.$SRAM_0_1_2_3.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM2 = .) ;
        PROVIDE(__end_data_SRAM_0_1_2_3 = .) ;
        . = ALIGN(4);
        *lv_*.o(.text*)
		    *lv_*.o(.rodata .rodata.* .constdata .constdata.*)
     } > SRAM_0_1_2_3 AT>BOARD_FLASH

    /* DATA section for USB_RAM */

    .data_RAM3 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM3 = .) ;
        PROVIDE(__start_data_USB_RAM = .) ;
        *(.ramfunc.$RAM3)
        *(.ramfunc.$USB_RAM)
        *(.data.$RAM3)
        *(.data.$USB_RAM)
        *(.data.$RAM3.*)
        *(.data.$USB_RAM.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM3 = .) ;
        PROVIDE(__end_data_USB_RAM = .) ;
     } > USB_RAM AT>BOARD_FLASH

    /* DATA section for BOARD_SDRAM */

    .data_RAM4 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM4 = .) ;
        PROVIDE(__start_data_BOARD_SDRAM = .) ;
        *(.ramfunc.$RAM4)
        *(.ramfunc.$BOARD_SDRAM)
        *(.data.$RAM4)
        *(.data.$BOARD_SDRAM)
        *(.data.$RAM4.*)
        *(.data.$BOARD_SDRAM.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM4 = .) ;
        PROVIDE(__end_data_BOARD_SDRAM = .) ;
     } > BOARD_SDRAM AT>BOARD_FLASH

    /* MAIN DATA SECTION */
    .uninit_RESERVED (NOLOAD) : ALIGN(4)
    {
        _start_uninit_RESERVED = .;
        KEEP(*(.bss.$RESERVED*))
       . = ALIGN(4) ;
        _end_uninit_RESERVED = .;
    } > SRAMX AT> SRAMX

    /* Main DATA section (SRAMX) */
    .data : ALIGN(4)
    {
       FILL(0xff)
       _data = . ;
       PROVIDE(__start_data_RAM = .) ;
       PROVIDE(__start_data_SRAMX = .) ;
       *(vtable)
       *(.ramfunc*)
       KEEP(*(CodeQuickAccess))
       KEEP(*(DataQuickAccess))
       *(RamFunction)
		
		
		. = ALIGN(4);
		*(.data*)       
		. = ALIGN(4);
       _edata = . ;
       PROVIDE(__end_data_RAM = .) ;
       PROVIDE(__end_data_SRAMX = .) ;
    } > SRAMX AT>BOARD_FLASH

    /* BSS section for SRAM_0_1_2_3 */
    .bss_RAM2 : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM2 = .) ;
       PROVIDE(__start_bss_SRAM_0_1_2_3 = .) ;
       *(.bss.$RAM2)
       *(.bss.$SRAM_0_1_2_3)
       *(.bss.$RAM2.*)
       *(.bss.$SRAM_0_1_2_3.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM2 = .) ;
       PROVIDE(__end_bss_SRAM_0_1_2_3 = .) ;
    } > SRAM_0_1_2_3 AT> SRAM_0_1_2_3

    /* BSS section for USB_RAM */
    .bss_RAM3 : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM3 = .) ;
       PROVIDE(__start_bss_USB_RAM = .) ;
       *(.bss.$RAM3)
       *(.bss.$USB_RAM)
       *(.bss.$RAM3.*)
       *(.bss.$USB_RAM.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM3 = .) ;
       PROVIDE(__end_bss_USB_RAM = .) ;
    } > USB_RAM AT> USB_RAM

    /* BSS section for BOARD_SDRAM */
    .bss_RAM4 : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM4 = .) ;
       PROVIDE(__start_bss_BOARD_SDRAM = .) ;
       *(.bss.$RAM4)
       *(.bss.$BOARD_SDRAM)
       *(.bss.$RAM4.*)
       *(.bss.$BOARD_SDRAM.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM4 = .) ;
       PROVIDE(__end_bss_BOARD_SDRAM = .) ;
    } > BOARD_SDRAM AT> BOARD_SDRAM

    /* MAIN BSS SECTION */
    .bss : ALIGN(4)
    {
        _bss = .;
        PROVIDE(__start_bss_RAM = .) ;
        PROVIDE(__start_bss_SRAMX = .) ;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4) ;
        _ebss = .;
        PROVIDE(__end_bss_RAM = .) ;
        PROVIDE(__end_bss_SRAMX = .) ;
        PROVIDE(end = .);
    } > SRAMX AT> SRAMX

    /* NOINIT section for SRAM_0_1_2_3 */
    .noinit_RAM2 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM2 = .) ;
       PROVIDE(__start_noinit_SRAM_0_1_2_3 = .) ;
       *(.noinit.$RAM2)
       *(.noinit.$SRAM_0_1_2_3)
       *(.noinit.$RAM2.*)
       *(.noinit.$SRAM_0_1_2_3.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM2 = .) ;
       PROVIDE(__end_noinit_SRAM_0_1_2_3 = .) ;
    } > SRAM_0_1_2_3 AT> SRAM_0_1_2_3

    /* NOINIT section for USB_RAM */
    .noinit_RAM3 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM3 = .) ;
       PROVIDE(__start_noinit_USB_RAM = .) ;
       *(.noinit.$RAM3)
       *(.noinit.$USB_RAM)
       *(.noinit.$RAM3.*)
       *(.noinit.$USB_RAM.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM3 = .) ;
       PROVIDE(__end_noinit_USB_RAM = .) ;
    } > USB_RAM AT> USB_RAM

    /* NOINIT section for BOARD_SDRAM */
    .noinit_RAM4 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM4 = .) ;
       PROVIDE(__start_noinit_BOARD_SDRAM = .) ;
       *(.noinit.$RAM4)
       *(.noinit.$BOARD_SDRAM)
       *(.noinit.$RAM4.*)
       *(.noinit.$BOARD_SDRAM.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM4 = .) ;
       PROVIDE(__end_noinit_BOARD_SDRAM = .) ;
    } > BOARD_SDRAM AT> BOARD_SDRAM

    /* DEFAULT NOINIT SECTION */
    .noinit (NOLOAD): ALIGN(4)
    {
        _noinit = .;
        PROVIDE(__start_noinit_RAM = .) ;
        PROVIDE(__start_noinit_SRAMX = .) ;
        *(.noinit*)
         . = ALIGN(4) ;
        _end_noinit = .;
       PROVIDE(__end_noinit_RAM = .) ;
       PROVIDE(__end_noinit_SRAMX = .) ;        
    } > SRAMX AT> SRAMX

    /* Reserve and place Heap within memory map */
    _HeapSize = 0x1000;
    .heap :  ALIGN(4)
    {
        _pvHeapStart = .;
        . += _HeapSize;
        . = ALIGN(4);
        _pvHeapLimit = .;
    } > SRAMX

     _StackSize = 0x1000;
     /* Reserve space in memory for Stack */
    .heap2stackfill  :
    {
        . += _StackSize;
    } > SRAMX
    /* Locate actual Stack in memory map */
    .stack ORIGIN(SRAMX) + LENGTH(SRAMX) - _StackSize - 0:  ALIGN(4)
    {
        _vStackBase = .;
        . = ALIGN(4);
        _vStackTop = . + _StackSize;
    } > SRAMX

    /* ## Create checksum value (used in startup) ## */
    PROVIDE(__valid_user_code_checksum = 0 - 
                                         (_vStackTop 
                                         + (ResetISR + 1) 
                                         + (NMI_Handler + 1) 
                                         + (HardFault_Handler + 1) 
                                         + (( DEFINED(MemManage_Handler) ? MemManage_Handler : 0 ) + 1)   /* MemManage_Handler may not be defined */
                                         + (( DEFINED(BusFault_Handler) ? BusFault_Handler : 0 ) + 1)     /* BusFault_Handler may not be defined */
                                         + (( DEFINED(UsageFault_Handler) ? UsageFault_Handler : 0 ) + 1) /* UsageFault_Handler may not be defined */
                                         ) );

    /* Provide basic symbols giving location and size of main text
     * block, including initial values of RW data sections. Note that
     * these will need extending to give a complete picture with
     * complex images (e.g multiple Flash banks).
     */
    _image_start = LOADADDR(.text);
    _image_end = LOADADDR(.data) + SIZEOF(.data);
    _image_size = _image_end - _image_start;

    /* Provide symbols for LPC540xx parts for startup code to use
     * to set image to be plain load image or XIP.
     * Config : Plain load image = false
     */
    __imghdr_loadaddress = LOADADDR(.text);
    __imghdr_imagetype = 3;
}
