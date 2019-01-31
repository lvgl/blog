---
layout: post
title: "Hardware button usage"
author: "seyyah, ogunduz"
cover: /assets/hardware_button/logo.jpg
image:
  path: /assets/hardware_button/logo.jpg
  height: 600
  width: 600

---

**We use the STM32F429I-DISC1 Discovery kit to test for the LittlevGL hardware button capability. The board have two push-buttons: USER and RESET [1]. We use USER push-button. User button connected to the I/O PA0 of STM32F429ZIT6 [2].  The board have six LEDs. We use LD3 (green LED). The green LED is a user LED connected to the I/O PG13 of the STM32F429ZIT6 [2].**

We aim to toggle LD3 LED when both harware button (USER push-pull) and UI button click.

Our hardware button driver register function is

```c
void my_button_init(void)
{
  static lv_indev_t *indev;
  lv_indev_drv_t indev_drv;

  lv_indev_drv_init(&indev_drv);

  indev_drv.read = my_input_read;
  indev_drv.type = LV_INDEV_TYPE_BUTTON;
  indev = lv_indev_drv_register(&indev_drv);

  static lv_point_t points_array[] = { { 20, 20 } };
  lv_indev_set_button_points(indev, points_array);
}
```

where

- `type`: `LV_INDEV_TYPE_BUTTON`: External (hardware button) which is assinged to a specific point of the screen
- `read`: `my_input_read` is function for harware button status (press-release).
- `points_array`: these points will be assigned to the buttons to press a specific point on the screen.

We create a button. The `points_array`'s first element (20px,20px) is selected any point in the UI button's area (x: 0-40px, y: 0-40px).


```c
static lv_obj_t *btn = lv_btn_create(lv_scr_act(), NULL);  
lv_obj_set_size(btn, 40, 40);
lv_obj_set_pos(btn, 0, 0);
lv_btn_set_action(btn, LV_BTN_ACTION_CLICK, btn_click_action);
```

Our `btn_click_action` toggles only LD3 LED.

```c
static lv_res_t btn_click_action(lv_obj_t *btn) {
  HAL_GPIO_TogglePin(GPIOG, GPIO_PIN_13);
}
```

`my_btn_read` function read hardware button data and return hardware button ID.

```c
uint8_t my_btn_read() {
  if(HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0) == 0) {
    return 1;
  } else {
    return 0;
  }
}
```

`my_input_read` function return `true` if there is still data to be read (buffered), otherwise `false`.

```c
bool my_input_read(lv_indev_data_t *data){
    static int8_t last_btn = 0;     /* Store the last pressed button */
    int8_t btn_pr = my_btn_read();  /* Get the ID (0,1,2...) of the pressed button */

    if(btn_pr > 0) {                /* Is there a button press? */
       last_btn = btn_pr;           /* Save the ID of the pressed button */
       data->state = LV_INDEV_STATE_PR;  /* Set the pressed state */
    } else {
       data->state = LV_INDEV_STATE_REL; /* Set the released state */
    }

    data->btn = last_btn;            /* Set the last button */

    return false;                    /* No buffering so no more data read */
}
```

In last step we call `button_init`.

```c
main() {
  // GPIO Init: LED, Button
  // LittlevGL
  button_init();

  while(1) {
    // ...
  }
}
```

TODO: Share the complete project

Acknowledgment: We preapare this tutorial with [Orhan Gunduz](https://github.com/ogunduz).

### Reference
1. [STM32F429I-DISC1 website](http://www.st.com/en/evaluation-tools/32f429idiscovery.html)
2. [UM1670 User manual Discovery kit with STM32F429ZI MCU](https://www.st.com/content/ccc/resource/technical/document/user_manual/6b/25/05/23/a9/45/4d/6a/DM00093903.pdf/files/DM00093903.pdf/jcr:content/translations/en.DM00093903.pdf)
3. [LittlevGL issue](https://github.com/littlevgl/lvgl/issues/567#issuecomment-446586421)
4. [Youtube video](https://www.youtube.com/watch?v=dk772McmJs4)
