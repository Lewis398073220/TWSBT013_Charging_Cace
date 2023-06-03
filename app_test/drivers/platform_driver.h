#ifndef _DEV_DRIVER_H
#define _DEV_DRIVER_H

#include "platform_head.h"
#include "app_delay.h"
#include <stdio.h>

#define DRIVER_LED_DEBUGx

extern volatile U32_T SYSCLK;

#define charge_USB5V_detect_pin           GPIOA0, 3
#define charge_5V_boost_pin               GPIOB0, 1
#define charge_status_pin                 GPIOA0, 11
#define charge_enable_pin                 GPIOA0, 6//GPIOA0, 14//GPIOB0, 4
#define charge_wireless_iset_pin          GPIOA0, 7
#define charge_wired_iset_pin             GPIOA0, 15
#define charge_wireless5V_dectect_pin	  GPIOA0, 0
#define NTC_detect_pin                    GPIOA0, 14//GPIOA0, 0

#define hall_en_pin                       GPIOA0, 1
#define key_pin                           GPIOA0, 4

#define blue_led_pin                      GPIOA0, 8
#define green_led_pin                     GPIOB0, 3
#define red_led_pin                       GPIOB0, 2

#define pattern_TX_pin                    GPIOB0, 4//GPIOA0, 14
#define pattern_RX_pin                    GPIOB0, 5//GPIOA0, 15

#define chg_l_adc_pin                     GPIOA0, 5
#define chg_r_adc_pin                     GPIOA0, 12
#define bat_adc_pin			              GPIOA0, 9
#define ntc_adc_pin                       GPIOA0, 10

#define debug_RX_pin			          GPIOA0, 13
#define debug_TX_pin                      GPIOB0, 0

void LPT_Init(void);
void led_hardware_setup(void);
void charging_hardware_setup(void);
void adc_hardware_setup(void);
void communicate_hardware_setup(U32_T BaudRate);
S8_T EPT0_pwm_effect_set(U8_T on);
void ReduceSYSCLKto5556KHZ(void);


#endif

