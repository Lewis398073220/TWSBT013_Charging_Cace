#ifndef _APP_STATUS_IND_H
#define _APP_STATUS_IND_H

#include "apt32f102.h"
#include "platform_driver.h"

#define APP_LED_DEBUGx

enum APP_STATUS_INDICATION_T {
	APP_STATUS_INDICATION_CHARGING,
	APP_STATUS_INDICATION_FULLCHARGE,
	APP_STATUS_INDICATION_PLUGOUT,
	APP_STATUS_INDICATION_NTC_ERROR,
	APP_STATUS_INDICATION_BATTERY_HIGH,
	APP_STATUS_INDICATION_BATTERY_MIDDLE,
	APP_STATUS_INDICATION_BATTERY_LOW,
	APP_STATUS_INDICATION_BATTERY_WARNING,
	APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE,
	APP_STATUS_INDICATION_EARPHONE_FULL_CHARGE,
	APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT,
	APP_STATUS_INDICATION_EARPHONE_PTP_PAIR,
	APP_STATUS_INDICATION_EARPHONE_BT_PAIR,
	APP_STATUS_INDICATION_EARPHONE_RESET,
	APP_STATUS_INDICATION_EARPHONE_FREEMAN,
	APP_STATUS_INDICATION_DSLEEP,
	APP_STATUS_INDICATION_NUM,
};
 
void app_close_all_led(void);
void app_red_led_pwm_contrl(U16_T comp_val, U8_T breath);
void app_green_led_pwm_contrl(U16_T comp_val, U8_T breath);
void app_green_led_turn_solid(void);
void app_blue_led_turn_solid(void);
S8_T app_status_indication_set(enum APP_STATUS_INDICATION_T status);
U8_T app_status_indication_get(void);
S8_T app_status_handle_process(void);


#endif
