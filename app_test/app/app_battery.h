#ifndef _APP_BATTERY_H
#define _APP_BATTERY_H

#include "apt32f102.h"
#include "platform_driver.h"

enum ADC_CONV_SEQ {
	BATTERY_ADC           = 0,
	R_EARBUD_POGO_ADC 	  = 1,
	L_EARBUD_POGO_ADC     = 2,
	NTC_ADC               = 3,
};

enum APP_CHARGE_TYPE_T {
	APP_CHARGE_TYPE_DISCHARGE,
	APP_CHARGE_TYPE_WIRED,
	APP_CHARGE_TYPE_WIRELESS,
};

enum APP_BATTERY_STATUS_T {
	APP_BATTERY_STATUS_NORMAL,
	APP_BATTERY_STATUS_CHARGING,
	APP_BATTERY_STATUS_FULLCHARGE,
	APP_BATTERY_STATUS_NTC_ERROR,
	APP_BATTERY_STATUS_ERROR,
	APP_BATTERY_STATUS_INVALID,
};

enum APP_HALL_STATUS_T {
	APP_HALL_STATUS_OPEN_BOX,
	APP_HALL_STATUS_CLOSE_BOX,
	APP_HALL_STATUS_INVALID,
};

enum APP_EARPHONE_STATUS_T {
	APP_EARPHONE_STATUS_NO_IN_BOX,
	APP_EARPHONE_STATUS_CHARGING,
	APP_EARPHONE_STATUS_FULLCHARGE,
	APP_EARPHONE_STATUS_OVER_CURRENT,
	APP_EARPHONE_STATUS_WAIT_FOR_CHARFE,
	APP_EARPHONE_STATUS_INVALID,
};

//bat_adc = (VBAT / (820+390) * 390) / (2982 / 4096)
#define APP_BATTERY_LEVEL_MIN    (0)
#define APP_BATTERY_LEVEL_MAX    (100)
#define APP_BATTERY_LEVEL_NUM    (APP_BATTERY_LEVEL_MAX-APP_BATTERY_LEVEL_MIN)//电量分成100份

#define APP_BATTERY_MAX_MV	     (4170)
#define APP_BATTERY_MIN_MV 	     (3350) //低电报警电压
#define APP_BATTERY_PD_MV        (3200) //低电关机电压
#define APP_BATTERY_RECHARGE_MV	 (4140) //电池复充电压
#define APP_BATTERY_MV_BASE     ((float)(APP_BATTERY_MAX_MV-APP_BATTERY_PD_MV)/(float)(APP_BATTERY_LEVEL_NUM))

#define battery_mv_to_adc(vbat)      (U32_T)((vbat / (820.0+390) * 390) / (2982.0 / 4096))
#define battery_adc_to_mv(bat_adc)   (U32_T)(bat_adc * (2986.0 / 4096.0) / 39.0 * (82.0+39.0))//2997//2982.0

//ntc_adc = (2988 / (Rntc+10) * Rntc) / (2982 / 4096)
//ntc_mv = (2988 / (Rntc+10) * Rntc)
#define APP_NTC_STOPCHG_HIGH_MV  (2191)     //27.523  0℃
#define APP_NTC_STOPCHG_LOW_MV   (983)      //4.904   45℃
#define APP_NTC_RECHG_HIGH_MV    (2060)     //22.206  5℃
#define APP_NTC_RECHG_LOW_MV     (1099)     //5.818   40℃

#define adc_to_mv(adc)               (U32_T)(adc * (2986.0 / 4096.0))//2997
#define pogo_adc_to_mA(adc)          (U32_T)(adc * (2997.0 / 4096.0) / 2.0)
#define ntc_adc_to_mv(ntc_adc)       (U32_T)(2988.0 - (4096 - ntc_adc) * (2982.0 / 4096))
#define ntc_resist_to_mv(ntc_resist) (U32_T)(2988.0 / (ntc_resist + 10) * ntc_resist)

#define EARPHONE_FULL_CHARGE_MA      5
#define EARPHONE_OVER_CURRENT_MA     70

#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))

typedef void (*APP_100_MILLISECOND_TIMER_CB_T)(U8_T parm);

struct APP_100_MILLISECOND_TIMER_STRUCT {
    U8_T timer_id;
    U8_T timer_en;
	U8_T timer_periodic;
    U32_T timer_count;
    U32_T timer_period;
    APP_100_MILLISECOND_TIMER_CB_T cb;
	U8_T parm;
};

#define INIT_APP_TIMER(_id, _en, _periodic, _count, _period, _cb, _parm) \
    { \
        .timer_id = _id, \
        .timer_en = _en, \
        .timer_periodic = _periodic, \
        .timer_count = _count, \
        .timer_period = _period, \
        .cb = _cb, \
        .parm = _parm, \
    }

#define APP_DEEP_SLEEP_TIMER_ID   				 0
#define APP_BATTERY_TIMER_ID      				 1
#define APP_EARPHONE_STATUS_CHECK_TIMER_ID		 2
#define APP_OVERCURRENT_TIMER_ID		 	 	 3
#define APP_EARPHONE_WAKEUP_TIMER_ID			 4


extern enum APP_BATTERY_STATUS_T battery_status;
extern enum APP_EARPHONE_STATUS_T earphone_status;
extern enum APP_HALL_STATUS_T hall_status;

U32_T adc_get_val(enum ADC_CONV_SEQ adc_seq);
S8_T app_battery_handle_process(void);
S8_T box_open_close_handle_progress(void);
void system_goto_deepsleep_mode(U8_T parm);
S8_T battery_level_calculate(U32_T battery_mv);
void battery_power_update(U8_T percent);
void BatteryPowerCheck(U8_T parm);
enum APP_EARPHONE_STATUS_T earphone_status_get(void);
void EarphoneStatusCheck(U8_T parm);
void EarphoneOvercurrentCheck(U8_T parm);
void EarphoneWakeUp(U8_T parm);
void app_start_100_millisecond_timer(U8_T timer_id);
void app_stop_100_millisecond_timer(U8_T timer_id);
void app_set_100_millisecond_timer(U8_T timer_id, U8_T enable, U8_T periodic, U8_T period, U8_T parm);
U8_T app_get_100_millisecond_timer_status(U8_T timer_id);
void app_100_millisecond_timer_check(void);


#endif

