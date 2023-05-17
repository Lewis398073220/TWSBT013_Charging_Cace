#include "app_battery.h"
#include "app_status_ind.h"
#include "app_state_machine.h"

enum APP_BATTERY_STATUS_T battery_status = APP_BATTERY_STATUS_INVALID;
enum APP_EARPHONE_STATUS_T earphone_status = APP_EARPHONE_STATUS_INVALID;
enum APP_HALL_STATUS_T hall_status = APP_HALL_STATUS_INVALID;

U8_T battery_percentage = 100; //电量百分比

U8_T is_system_active = TRUE;
U8_T is_wireless5V_enable = FALSE;

struct APP_100_MILLISECOND_TIMER_STRUCT app_100_millisecond_array[] =
{
    INIT_APP_TIMER(APP_DEEP_SLEEP_TIMER_ID, FALSE, FALSE, 0, 100, system_goto_deepsleep_mode, 0),
	INIT_APP_TIMER(APP_BATTERY_TIMER_ID, FALSE, TRUE, 0, 80, BatteryPowerCheck, 0),
	INIT_APP_TIMER(APP_EARPHONE_STATUS_CHECK_TIMER_ID, FALSE, FALSE, 0, 20, EarphoneStatusCheck, 0),//延时拉高2秒5V使POGO Pin电压稳定
	INIT_APP_TIMER(APP_OVERCURRENT_TIMER_ID, FALSE, TRUE, 0, 1, EarphoneOvercurrentCheck, 0),
	INIT_APP_TIMER(APP_EARPHONE_WAKEUP_TIMER_ID, FALSE, FALSE, 0, 4, EarphoneWakeUp, 0),//延时拉高400ms 5V唤醒耳机
};

void app_stop_100_millisecond_timer(U8_T timer_id)
{
	printf("%s: %d\r\n",__func__, timer_id);
	
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = &app_100_millisecond_array[timer_id];

    timer->timer_en = 0;
    timer->timer_count = 0;
}

void app_start_100_millisecond_timer(U8_T timer_id)
{
	printf("%s: %d\r\n",__func__, timer_id);
	
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = &app_100_millisecond_array[timer_id];

    timer->timer_en = 1;
    timer->timer_count = 0;
}

void app_set_100_millisecond_timer(U8_T timer_id, U8_T enable, U8_T periodic, U8_T period, U8_T parm)
{
	printf("%s: %d\r\n",__func__, timer_id);
	
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = &app_100_millisecond_array[timer_id];

    timer->timer_en = enable;
	timer->timer_periodic = periodic;
    timer->timer_period = period;
	timer->parm = parm;
}

//可以获取一些延时任务的完成信号，作为线程阻塞用
U8_T app_get_100_millisecond_timer_status(U8_T timer_id)
{
	//printf("%s: %d\r\n",__func__, timer_id);
	
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = &app_100_millisecond_array[timer_id];

	return timer->timer_en;
}

void app_100_millisecond_timer_check(void)
{
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = app_100_millisecond_array;
    U8_T i;

    for(i = 0; i < ARRAY_SIZE(app_100_millisecond_array); i++) {
        if (timer->timer_en) {
            timer->timer_count++;
            if (timer->timer_count >= timer->timer_period) {
                if(timer->timer_periodic == FALSE) timer->timer_en = 0;
				else timer->timer_count = 0;
                if (timer->cb) timer->cb(timer->parm);
            }
        }
        timer++;
    }
}

enum APP_CHARGE_TYPE_T app_charge_type_get(void)
{
	enum APP_CHARGE_TYPE_T charge_type = APP_CHARGE_TYPE_DISCHARGE;

	if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_type = APP_CHARGE_TYPE_WIRED;
	else if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) charge_type = APP_CHARGE_TYPE_WIRELESS;
	
	return charge_type;
}

enum APP_BATTERY_STATUS_T app_battery_status_get(void)
{
	return battery_status;
}

void app_battery_status_update(enum APP_BATTERY_STATUS_T status)
{
	battery_status = status;
}

void battery_power_update(U8_T percent)
{
	printf("%s: %d%%\r\n",__func__, percent);

	battery_percentage = percent;
}

U8_T battery_power_get(void)
{
	return battery_percentage;
}

S8_T battery_level_calculate(U32_T battery_mv)
{
	S8_T level = 0;
	
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
	else {
		level = ((battery_mv - APP_BATTERY_PD_MV) / APP_BATTERY_MV_BASE + 1);
		if(level > APP_BATTERY_LEVEL_MAX) level = APP_BATTERY_LEVEL_MAX;
	}
	printf("%s: %ldmV %d%%\r\n",__func__, battery_mv, level);
	
	return level;
}

void BatteryPowerCheck(U8_T parm)
{
	static U8_T battery_check_count;
	S8_T level = 0;
	U32_T battery_mv = 0;
	
	printf("enter function->%s\r\n", __func__);
	
	battery_mv = battery_adc_to_mv(adc_get_val(BATTERY_ADC));
	level = battery_level_calculate(battery_mv);

	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
		if(level > battery_power_get()) battery_check_count++;
		else battery_check_count = 0;
	} else{//没使能充电IC时，电量只能减不能加
		if(level < battery_power_get()) battery_check_count++;
		else battery_check_count = 0;
	}
	
	if(battery_check_count >= 3)
	{
		battery_check_count = 0;
		battery_power_update(level);
	}
}

void earphone_status_update(enum APP_EARPHONE_STATUS_T status)
{
	earphone_status = status;  
}

enum APP_EARPHONE_STATUS_T earphone_status_get(void)
{
	return earphone_status;
}

//检测耳机状态前要先升5V
void EarphoneStatusCheck(U8_T parm)
{
	U32_T L_pogo_adc, R_pogo_adc;
	
	printf("enter function->%s\r\n", __func__);

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {
		GPIO_Write_Low(charge_5V_boost_pin);
		GPIO_Init(pattern_TX_pin, Output);
		GPIO_Write_Low(pattern_TX_pin);
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
		GPIO_Write_Low(charge_enable_pin);
		earphone_status_update(APP_EARPHONE_STATUS_OVER_CURRENT);
		app_battery_status_update(APP_BATTERY_STATUS_ERROR);//设置电池处理错误状态
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
		app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
		app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
		app_stop_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);
		app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);	
		printf("earphone charging overcurrent!!!: L: %lu, %lumA  R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
	} else if(pogo_adc_to_mA(L_pogo_adc) <= 0 && pogo_adc_to_mA(R_pogo_adc) <= 0){
		GPIO_Write_Low(charge_5V_boost_pin);
		GPIO_Init(pattern_TX_pin, Output);
		GPIO_Write_Low(pattern_TX_pin);
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
		earphone_status_update(APP_EARPHONE_STATUS_NO_IN_BOX);
		printf("no earphones in box: L: %lu, %lumA  R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
	} else{
		GPIO_Write_High(charge_5V_boost_pin);
		GPIO_Init(pattern_TX_pin, Output);
		GPIO_Write_Low(pattern_TX_pin);
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
		earphone_status_update(APP_EARPHONE_STATUS_CHARGING);
		app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
		printf("charge for earphones: L: %lu, %lumA  R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
	}
}

void EarphoneOvercurrentCheck(U8_T parm)
{
	U32_T L_pogo_adc, R_pogo_adc;

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {//过流保护检测
		GPIO_Write_Low(charge_5V_boost_pin);
		GPIO_Init(pattern_TX_pin, Output);
		GPIO_Write_Low(pattern_TX_pin);
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
		GPIO_Write_Low(charge_enable_pin);
		earphone_status_update(APP_EARPHONE_STATUS_OVER_CURRENT);
		app_battery_status_update(APP_BATTERY_STATUS_ERROR);//设置电池处理错误状态
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
		app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
		app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
		app_stop_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);
		app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
		printf("earphone charging overcurrent!!!: L: %lu, %lumA  R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
	}
}

//要延时拉高5V一段时间唤醒耳机后再掉到通信电平
void EarphoneWakeUp(U8_T parm)
{
	printf("enter function->%s\r\n", __func__);

	GPIO_Write_Low(charge_5V_boost_pin);
	GPIO_Init(pattern_TX_pin, Output);
	GPIO_Write_High(pattern_TX_pin);
	GPIO_InPutOutPut_Disable(pattern_RX_pin);
}

void app_deinit(void)
{
	GPIO_Write_Low(charge_5V_boost_pin);
	GPIO_Init(pattern_TX_pin, Output);
	GPIO_Write_Low(pattern_TX_pin);
	GPIO_InPutOutPut_Disable(pattern_RX_pin);

	ADC12_ready_wait();
	ADC12_Control(ADC12_STOP); //休眠前不停止ADC转换，这会造成唤醒后，MCU卡机
	ADC12_CMD(DISABLE);
	GPIO_InPutOutPut_Disable(chg_l_adc_pin);
	GPIO_InPutOutPut_Disable(chg_r_adc_pin);
	GPIO_InPutOutPut_Disable(bat_adc_pin);
	GPIO_InPutOutPut_Disable(ntc_adc_pin);
	
	GPIO_InPutOutPut_Disable(red_led_pin);
	GPIO_InPutOutPut_Disable(blue_led_pin);
	GPIO_InPutOutPut_Disable(green_led_pin);
	GPIO_InPutOutPut_Disable(NTC_detect_pin);
	GPIO_Write_Low(NTC_detect_pin);
}

void app_recover(void)
{
	if(battery_status == APP_BATTERY_STATUS_NORMAL) {
		if(hall_status == APP_HALL_STATUS_CLOSE_BOX) {
			if(earphone_status == APP_EARPHONE_STATUS_CHARGING) {
				GPIO_Write_High(charge_5V_boost_pin);
				GPIO_Init(pattern_TX_pin, Output);
				GPIO_Write_Low(pattern_TX_pin);
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
			}
		}
	}

	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
	ADC12_CMD(ENABLE);
	ADC12_ready_wait();
	
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
	GPIO_Init(blue_led_pin, Output);
	GPIO_Init(green_led_pin, Output);
	GPIO_Init(NTC_detect_pin, Output);
	if(GPIO_Read_Status(charge_USB5V_detect_pin)) GPIO_Write_High(NTC_detect_pin);
	else GPIO_Write_Low(NTC_detect_pin);
}

void system_goto_deepsleep_mode(U8_T parm)
{	
	is_system_active = FALSE;
	app_deinit();
	app_status_indication_set(APP_STATUS_INDICATION_DSLEEP);
	printf("system goto deepsleep\r\n");
	printf("bye bye~~\r\n");
	PCLK_goto_deepsleep_mode();
	Coret_DelayMs(100); //系统唤醒后，延时使其稳定
	do {
		app_recover();
		is_system_active = TRUE;
		printf("\r\n\r\nsystem wakeup~~\r\n");
	}while(is_system_active == FALSE);
}

void system_shutdown(void)
{
	EXI1_WakeUp_Disable();
	EXI3_WakeUp_Disable();
	EXTI_trigger_CMD(DISABLE, EXI_PIN3, _EXIFT);//禁止USB-C拔出唤醒
	printf("system shutdown!!!\r\n");
	system_goto_deepsleep_mode(0);
}

/* 获取NTC检测脚的ADC转换数值 */
U32_T adc_get_val(enum ADC_CONV_SEQ adc_seq)
{
	ADC12_ready_wait();
	ADC0->CSR |= (1 << (16 + adc_seq)); /* 清除SEQ0序列转换完成中断 */
	ADC12_Control(ADC12_START);	/* 开始模数转换 */
	ADC12_SEQEND_wait(adc_seq);
	return ADC12_DATA_OUPUT(adc_seq);
}

S8_T is_hall_active(void)
{
	if(GPIO_Read_Status(hall_en_pin)) return 0;
	else return 1;
}

S8_T charging_case_battery_indication_handle(void)
{
	S8_T level = 0;

	level = battery_power_get();

	if(level <= 10){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_WARNING);
	} else if(level > 10 && level <= 50){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_MIDDLE);	
	} else if(level > 50){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_HIGH);
	}
	
	return level;
}

S8_T is_earphone_fully_charged(void)
{
	U32_T L_pogo_adc, R_pogo_adc;

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
	if(pogo_adc_to_mA(L_pogo_adc) <= EARPHONE_FULL_CHARGE_MA && pogo_adc_to_mA(R_pogo_adc) <= EARPHONE_FULL_CHARGE_MA)
	{
		printf("earphones are fully charged: L: %lu, %lumA	R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
		return TRUE;
	} 

	return FALSE;
}

S8_T box_open_close_handle_progress(void)
{
	static enum APP_HALL_STATUS_T pre_status = APP_HALL_STATUS_INVALID;
	static U16_T time_cnt = 0;

	if(app_status_indication_get() == APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT) return -1;//过流保护
	
	hall_status = is_hall_active()? APP_HALL_STATUS_CLOSE_BOX : APP_HALL_STATUS_OPEN_BOX;

	switch(hall_status)
	{
		case APP_HALL_STATUS_CLOSE_BOX:
			if(hall_status != pre_status) {
				time_cnt = 0;
				if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
					GPIO_Write_Low(charge_5V_boost_pin);
					GPIO_Init(pattern_TX_pin, Output);
					GPIO_Write_Low(pattern_TX_pin);
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
					earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
					printf("earphone charge NTC error!!!\r\n");
				} else if(battery_power_get() > 0){
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
					GPIO_Write_High(charge_5V_boost_pin);
					GPIO_Init(pattern_TX_pin, Output);
					GPIO_Write_Low(pattern_TX_pin);
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
					app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
				}
				EXI3_WakeUp_Disable(); //合盖，按键动作不唤醒
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
				app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
				pre_status = hall_status;
			} else{
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_STATUS_CHECK_TIMER_ID)) return 1;//等待耳机状态检测结束
				time_cnt++;
				if(time_cnt >= 200)
				{
					time_cnt = 0;
					switch(earphone_status_get())
					{
						case APP_EARPHONE_STATUS_CHARGING:
							if(is_earphone_fully_charged())
							{
								GPIO_Write_Low(charge_5V_boost_pin);
								GPIO_Init(pattern_TX_pin, Output);
								GPIO_Write_Low(pattern_TX_pin);
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
								earphone_status_update(APP_EARPHONE_STATUS_FULLCHARGE);
								if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
								app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FULL_CHARGE);
							}
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
								GPIO_Write_Low(charge_5V_boost_pin);
								GPIO_Init(pattern_TX_pin, Output);
								GPIO_Write_Low(pattern_TX_pin);
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
								earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
								printf("earphone charge NTC error!!!\r\n");
							}
							break;

						case APP_EARPHONE_STATUS_WAIT_FOR_CHARFE:
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
							{
								GPIO_Write_High(charge_5V_boost_pin);
								GPIO_Init(pattern_TX_pin, Output);
								GPIO_Write_Low(pattern_TX_pin);
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
								app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
								printf("earphone charge exit NTC error status!!!");
							}
							break;

						case APP_EARPHONE_STATUS_OVER_CURRENT:
							app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
							break;
						
						case APP_EARPHONE_STATUS_NO_IN_BOX:							
						case APP_EARPHONE_STATUS_FULLCHARGE:
							if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE)
							{
								if(app_get_100_millisecond_timer_status(APP_DEEP_SLEEP_TIMER_ID) == FALSE)
									app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
							}
							break;
							
						default:
							break;
					}
				}
			}
			break;
			
		case APP_HALL_STATUS_OPEN_BOX:
			if(hall_status != pre_status) {
				time_cnt = 0;
				if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
					GPIO_Write_Low(charge_5V_boost_pin);
					GPIO_Init(pattern_TX_pin, Output);
					GPIO_Write_Low(pattern_TX_pin);
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
					earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
					printf("earphone charge NTC error!!!\r\n");
				} else if(battery_power_get() > 0){
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
					GPIO_Write_High(charge_5V_boost_pin);
					GPIO_Init(pattern_TX_pin, Output);
					GPIO_Write_Low(pattern_TX_pin);
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
					app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
				}
				EXI3_WakeUp_Enable(); //开盖，按键动作要唤醒
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
				app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
				pre_status = hall_status;
			} else{
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_WAKEUP_TIMER_ID)) return 1;//等待耳机状态检测结束
				time_cnt++;
				if(time_cnt >= 200)
				{
					time_cnt = 0;
					switch(earphone_status_get())
					{
						case APP_EARPHONE_STATUS_WAIT_FOR_CHARFE:
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
							{
								GPIO_Write_High(charge_5V_boost_pin);
								GPIO_Init(pattern_TX_pin, Output);
								GPIO_Write_Low(pattern_TX_pin);
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
								app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
								printf("earphone charge exit NTC error status!!!");
							}
							break;

						case APP_EARPHONE_STATUS_OVER_CURRENT:
							app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
							break;
						
						case APP_EARPHONE_STATUS_CHARGING:
						case APP_EARPHONE_STATUS_NO_IN_BOX:							
						case APP_EARPHONE_STATUS_FULLCHARGE:					
						default:
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
								GPIO_Write_Low(charge_5V_boost_pin);
								GPIO_Init(pattern_TX_pin, Output);
								GPIO_Write_Low(pattern_TX_pin);
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
								earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
								printf("earphone charge NTC error!!!\r\n");
							}
							break;
					}
				}
			}
			break;

		default:
			break;
	}
	
	return 0;
}


S8_T app_battery_handle_process_normal(enum APP_BATTERY_STATUS_T status)
{
	static enum APP_BATTERY_STATUS_T pre_status = APP_BATTERY_STATUS_INVALID;
	static U16_T time_cnt = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);
	
	switch(battery_status)
	{
		case APP_BATTERY_STATUS_NORMAL:
			if(battery_status != pre_status) {
				time_cnt = 0;
				pre_status = battery_status;
			} else{
				time_cnt++;
				if(time_cnt >= 500) {
					time_cnt = 0;
					if(battery_power_get() <= 0) system_shutdown();
				}
			}
			break;
			
		case APP_BATTERY_STATUS_ERROR:
			if(battery_status != pre_status) {
				time_cnt = 0;
				GPIO_Write_Low(charge_enable_pin);
				GPIO_Write_Low(charge_5V_boost_pin);
				GPIO_Init(pattern_TX_pin, Output);
				GPIO_Write_Low(pattern_TX_pin);
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
				pre_status = battery_status;
			} else{
				time_cnt++;
				if(time_cnt >= 400)
				{
					time_cnt = 0;
					if(battery_power_get() <= 0) system_shutdown();
				}	
			}
			break;
			
		default:
			GPIO_Write_Low(charge_enable_pin);
			GPIO_Write_Low(NTC_detect_pin);
			battery_status = status;
			pre_status = APP_BATTERY_STATUS_INVALID;
			break;
	}
	return 0;
}

S8_T app_battery_handle_process_charge(enum APP_BATTERY_STATUS_T status)
{
	static enum APP_BATTERY_STATUS_T pre_status = APP_BATTERY_STATUS_INVALID;
	static U16_T time_cnt = 0, ntc_time_cnt = 0;;
	static U8_T full_charge_cnt = 0, ntc_trigger_cnt = 0;
	U32_T ntc_mv = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);

	switch(battery_status)
	{
		case APP_BATTERY_STATUS_CHARGING:
			if(battery_status != pre_status) {
				time_cnt = full_charge_cnt = 0;
				GPIO_Write_High(charge_enable_pin);
				Coret_DelayMs(50);
				if(!GPIO_Read_Status(charge_status_pin)) {
					GPIO_Write_Low(charge_enable_pin);
					app_status_indication_set(APP_STATUS_INDICATION_FULLCHARGE);
					printf("fully charge!!!\r\n");
				} else{
					app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
					printf("charging....\r\n");
				}
				pre_status = battery_status;
			} else{
				time_cnt++;
				if(time_cnt >= 400)
				{
					time_cnt = 0;
					if(APP_STATUS_INDICATION_FULLCHARGE != app_status_indication_get()) {
						if(!GPIO_Read_Status(charge_status_pin)) full_charge_cnt++;
						else full_charge_cnt = 0;
						if(full_charge_cnt >= 3)
						{
							full_charge_cnt = 0;
							GPIO_Write_Low(charge_enable_pin);
							app_status_indication_set(APP_STATUS_INDICATION_FULLCHARGE);
							printf("fully charge!!!\r\n");
						}
					} else{
						if(APP_BATTERY_RECHARGE_MV >= battery_adc_to_mv(adc_get_val(BATTERY_ADC)))
						{
							GPIO_Write_High(charge_enable_pin);
							app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
							printf("start recharge....\r\n");
						}
					}
				}	
			}

			ntc_time_cnt++;
			if(ntc_time_cnt >= 500)
			{
				ntc_time_cnt = 0;
				ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
				printf("NTC: %ldmv\r\n", ntc_mv);
				if(ntc_mv > APP_NTC_STOPCHG_HIGH_MV || ntc_mv < APP_NTC_STOPCHG_LOW_MV) ntc_trigger_cnt++;
				else ntc_trigger_cnt = 0;
				
				if(ntc_trigger_cnt >= 3)
				{
					ntc_trigger_cnt = 0;
					printf("NTC error!!!: %ldmv\r\n", ntc_mv);
					battery_status = APP_BATTERY_STATUS_NTC_ERROR;
				}
			}
			break;

		case APP_BATTERY_STATUS_NTC_ERROR:
			if(battery_status != pre_status) {
				time_cnt = 0;
				GPIO_Write_Low(charge_enable_pin);
				GPIO_Write_Low(charge_5V_boost_pin);
				GPIO_Init(pattern_TX_pin, Output);
				GPIO_Write_Low(pattern_TX_pin);
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
				app_status_indication_set(APP_STATUS_INDICATION_NTC_ERROR);
				pre_status = battery_status;
			} else{
				time_cnt++;
				if(time_cnt >= 400)
				{
					time_cnt = 0;
					if(battery_power_get() <= 0) system_shutdown();
				}	
			}

			ntc_time_cnt++;
			if(ntc_time_cnt >= 500)
			{
				ntc_time_cnt = 0;
				ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
				printf("NTC: %ldmv\r\n", ntc_mv);
				if(ntc_mv <= APP_NTC_RECHG_HIGH_MV && ntc_mv >= APP_NTC_RECHG_LOW_MV) ntc_trigger_cnt++;
				else ntc_trigger_cnt = 0;
				
				if(ntc_trigger_cnt >= 3)
				{
					ntc_trigger_cnt = 0;
					printf("NTC error-->recover charge!!!: %ldmv\r\n", ntc_mv);
					battery_status = APP_BATTERY_STATUS_CHARGING;
				}
			}
			break;

		case APP_BATTERY_STATUS_ERROR:
			if(battery_status != pre_status) {
				time_cnt = 0;
				GPIO_Write_Low(charge_enable_pin);
				GPIO_Write_Low(charge_5V_boost_pin);
				GPIO_Init(pattern_TX_pin, Output);
				GPIO_Write_Low(pattern_TX_pin);
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
				pre_status = battery_status;
			} else{
				time_cnt++;
				if(time_cnt >= 400)
				{
					time_cnt = 0;
					if(battery_power_get() <= 0) system_shutdown();
				}	
			}
			break;
			
		default:
			GPIO_Write_High(NTC_detect_pin);
			battery_status = status;
			pre_status = APP_BATTERY_STATUS_INVALID;
			break;
	}
	
	return 0;
}

S8_T app_battery_handle_process(void)
{
	switch(app_charge_type_get())
	{
		case APP_CHARGE_TYPE_WIRED:
		case APP_CHARGE_TYPE_WIRELESS:	
			app_battery_handle_process_charge(APP_BATTERY_STATUS_CHARGING);
		break;

		case APP_CHARGE_TYPE_DISCHARGE:
			app_battery_handle_process_normal(APP_BATTERY_STATUS_NORMAL);
		break;
	}
	return 0;
}

void EXI2to3IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 
	{
		SYSCON->EXICR = EXI_PIN2;
		
	} 
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
	{
		SYSCON->EXICR = EXI_PIN3;
		if(GPIO_Read_Status(charge_USB5V_detect_pin)) ;
		else app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
	}
}

void EXI0IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
	{
		SYSCON->EXICR = EXI_PIN0;
		if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) ;
 		else app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
	}
}

