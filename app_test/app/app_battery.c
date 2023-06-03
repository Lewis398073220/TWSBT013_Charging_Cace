#include "app_battery.h"
#include "app_status_ind.h"
#include "app_state_machine.h"

enum APP_BATTERY_STATUS_T battery_status = APP_BATTERY_STATUS_INVALID;
enum APP_EARPHONE_STATUS_T earphone_status = APP_EARPHONE_STATUS_INVALID;
enum APP_HALL_STATUS_T hall_status = APP_HALL_STATUS_INVALID;
enum APP_NTC_STATUS_T NTC_status = APP_NTC_STATUS_INVALID;

U8_T battery_percentage = 100; //电量百分比

U8_T is_system_active = TRUE;
U8_T is_wireless5V_enable = FALSE;

struct APP_100_MILLISECOND_TIMER_STRUCT app_100_millisecond_array[] =
{
    INIT_APP_TIMER(APP_DEEP_SLEEP_TIMER_ID, FALSE, FALSE, 0, 100, system_goto_deepsleep_mode, 0),
	INIT_APP_TIMER(APP_BATTERY_TIMER_ID, FALSE, TRUE, 0, 80, BatteryPowerCheck, 0),
	INIT_APP_TIMER(APP_EARPHONE_STATUS_CHECK_TIMER_ID, FALSE, FALSE, 0, 20, EarphoneStatusCheck, 0),//延时拉高2秒5V使POGO Pin电压稳定
	INIT_APP_TIMER(APP_OVERCURRENT_TIMER_ID, FALSE, TRUE, 0, 2, EarphoneOvercurrentCheck, 0),
	INIT_APP_TIMER(APP_EARPHONE_WAKEUP_TIMER_ID, FALSE, FALSE, 0, 4, EarphoneWakeUp, 0),//延时拉高400ms 5V唤醒耳机
	INIT_APP_TIMER(APP_NTC_TIMER_ID, FALSE, TRUE, 0, 50, NTCStatusCheck, 0),
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

S8_T pogo_pin_output_contrl(enum APP_OUTPUT_TYPE_T output_type)
{
	printf("%s: %d\r\n",__func__, output_type);
	switch(output_type)
	{
		case APP_OUTPUT_TYPE_BOOST5V:
			GPIO_Write_High(charge_5V_boost_pin);
			GPIO_Init(pattern_TX_pin, Output);
			GPIO_Write_Low(pattern_TX_pin);
			GPIO_InPutOutPut_Disable(pattern_RX_pin);
			GPIO_Write_Low(pattern_RX_pin);
			UART2_Int_Disable();
		break;

		case APP_OUTPUT_TYPE_SENDDATA:
			GPIO_Write_Low(charge_5V_boost_pin);
			UART_IO_Init(IO_UART2, 2);
			GPIO_Init(pattern_RX_pin, Output);
			GPIO_Write_High(pattern_RX_pin);
			UART2_Int_Disable();//禁止uart接收中断
		break;

		case APP_OUTPUT_TYPE_REVDATA:
			GPIO_Write_Low(charge_5V_boost_pin);
			UART_IO_Init(IO_UART2, 2);
			UART2_Int_Enable();//启用uart接收中断
		break;

		case APP_OUTPUT_TYPE_OUTPUTLOW:
			GPIO_Write_Low(charge_5V_boost_pin);
			GPIO_Init(pattern_TX_pin, Output);
			GPIO_Write_Low(pattern_TX_pin);
			GPIO_InPutOutPut_Disable(pattern_RX_pin);
			GPIO_Write_Low(pattern_RX_pin);
			UART2_Int_Disable();
		break;

		default:
			printf("invaild output type!\r\n");
		break;
	}
	return 0;
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

enum APP_NTC_STATUS_T ntc_status_get(void)
{
	return NTC_status;
}

void ntc_status_update(enum APP_NTC_STATUS_T status)
{
	printf("%s: %d\r\n",__func__, status);

	NTC_status = status;
}

S8_T charge_current_control(enum APP_NTC_STATUS_T ntc_status, enum APP_CHARGE_TYPE_T charge_type)
{
	printf("%s: %d %d\r\n",__func__, ntc_status, charge_type);

	switch(ntc_status)
	{
		case APP_NTC_STATUS_STOPCHG:
			GPIO_InPutOutPut_Disable(charge_wireless_iset_pin);
			GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
			GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
			GPIO_PullHighLow_DIS(charge_wired_iset_pin);
		break;

		case APP_NTC_STATUS_NORMAL_HIGH_TEMP:
			if(charge_type == APP_CHARGE_TYPE_WIRED) {
				GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
				GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
				GPIO_Write_Low(charge_wireless_iset_pin);

				GPIO_Init(charge_wired_iset_pin, Output); /* 输出模式，输入禁止 */
				GPIO_PullHighLow_DIS(charge_wired_iset_pin);
				GPIO_Write_Low(charge_wired_iset_pin);
			} else if(charge_type == APP_CHARGE_TYPE_WIRELESS){
				GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
				GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
				GPIO_Write_Low(charge_wireless_iset_pin);
			
				GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
				GPIO_PullHighLow_DIS(charge_wired_iset_pin);
			} else{
				GPIO_InPutOutPut_Disable(charge_wireless_iset_pin);
				GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
				GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
				GPIO_PullHighLow_DIS(charge_wired_iset_pin);
			}
		break;

		case APP_NTC_STATUS_NORMAL_LOW_TEMP:
			GPIO_InPutOutPut_Disable(charge_wireless_iset_pin);
			GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
			GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
			GPIO_PullHighLow_DIS(charge_wired_iset_pin);
		break;
			
		default:
		break;
	}
	return 0;
}

//判断NTC状态
enum APP_NTC_STATUS_T ntc_status_measure(U32_T ntc_mv) 
{
	enum APP_NTC_STATUS_T ntc_status = APP_NTC_STATUS_INVALID;

	switch(ntc_status_get())
	{
		case APP_NTC_STATUS_STOPCHG:
			if(ntc_mv <= APP_NTC_RECHG_HIGH_MV && ntc_mv >= APP_NTC_RECHG_LOW_MV)//复充温度
			{
				if(ntc_mv <= APP_NTC_STOPCHG_HIGH_MV && ntc_mv >= APP_NTC_NORMAL_MV) {
					ntc_status = APP_NTC_STATUS_NORMAL_LOW_TEMP;
				} else if(ntc_mv < APP_NTC_NORMAL_MV && ntc_mv >= APP_NTC_STOPCHG_LOW_MV){
					ntc_status = APP_NTC_STATUS_NORMAL_HIGH_TEMP;
				}
			}
		break;

		case APP_NTC_STATUS_NORMAL_HIGH_TEMP:
		case APP_NTC_STATUS_NORMAL_LOW_TEMP:
			if(ntc_mv > APP_NTC_STOPCHG_HIGH_MV || ntc_mv < APP_NTC_STOPCHG_LOW_MV) 
				ntc_status = APP_NTC_STATUS_STOPCHG;
		break;
			
		default:
			if(ntc_mv > APP_NTC_STOPCHG_HIGH_MV || ntc_mv < APP_NTC_STOPCHG_LOW_MV) {
				ntc_status = APP_NTC_STATUS_STOPCHG;
			} else if(ntc_mv <= APP_NTC_STOPCHG_HIGH_MV && ntc_mv >= APP_NTC_NORMAL_MV) {
				ntc_status = APP_NTC_STATUS_NORMAL_LOW_TEMP;
			} else if(ntc_mv < APP_NTC_NORMAL_MV && ntc_mv >= APP_NTC_STOPCHG_LOW_MV){
				ntc_status = APP_NTC_STATUS_NORMAL_HIGH_TEMP;
			}
		break;
	}

	return ntc_status;
}

void NTCStatusCheck(U8_T parm)
{
	static U8_T ntc_trigger_cnt = 0, status_change_flag = FALSE;
	U32_T ntc_mv = 0;
	static enum APP_NTC_STATUS_T pre_ntc_status = APP_NTC_STATUS_INVALID;
	enum APP_NTC_STATUS_T ntc_status = APP_NTC_STATUS_INVALID;

	ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
	printf("NTC: %ldmv\r\n", ntc_mv);
	ntc_status = ntc_status_measure(ntc_mv);

	if(pre_ntc_status != ntc_status) {//NTC状态改变
		status_change_flag = TRUE;
		ntc_trigger_cnt = 0;
		pre_ntc_status = ntc_status;
	} else{
		if(status_change_flag == TRUE)
		{
			ntc_trigger_cnt++;
			if(ntc_trigger_cnt >= 2)//连续检测到三次一样则更新NTC状态
			{
				ntc_trigger_cnt = 0;
				status_change_flag = FALSE;
				ntc_status_update(ntc_status);
				app_stop_100_millisecond_timer(APP_NTC_TIMER_ID);//更新后停止定时器，作为信号量发送用
			}
		}
	}
}

//检测耳机状态前要先升5V
void EarphoneStatusCheck(U8_T parm)
{
	U32_T L_pogo_adc, R_pogo_adc;
	
	printf("enter function->%s\r\n", __func__);

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
	/*
	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
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
	*/
	if(pogo_adc_to_mA(L_pogo_adc) <= 0 && pogo_adc_to_mA(R_pogo_adc) <= 0){
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
		earphone_status_update(APP_EARPHONE_STATUS_NO_IN_BOX);
		printf("no earphones in box: L: %lu, %lumA  R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
	} else{
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
		earphone_status_update(APP_EARPHONE_STATUS_CHARGING);
		if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
		printf("charge for earphones: L: %lu, %lumA  R: %lu, %lumA\r\n",\
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
	}
}

void EarphoneOvercurrentCheck(U8_T parm)
{
	U32_T L_pogo_adc, R_pogo_adc;
	static U8_T overcur_cnt = 0;

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);

	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {//过流保护检测
		overcur_cnt++;
	}else overcur_cnt = 0;
	
	if(overcur_cnt >= 3) {//过流保护处理
		overcur_cnt = 0;
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
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

	pogo_pin_output_contrl(APP_OUTPUT_TYPE_REVDATA);
	earphone_status_update(APP_EARPHONE_STATUS_COMM);
}

void app_deinit(void)
{
	//charging
	GPIO_InPutOutPut_Disable(charge_status_pin);
	GPIO_PullHighLow_DIS(charge_status_pin);
	GPIO_Write_Low(charge_5V_boost_pin);
	GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
	GPIO_InPutOutPut_Disable(charge_wireless_iset_pin);
	GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
	GPIO_InPutOutPut_Disable(charge_enable_pin);
	GPIO_PullHighLow_DIS(charge_enable_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
	GPIO_Write_Low(NTC_detect_pin);
	EXTI_trigger_CMD(DISABLE, EXI_PIN3, _EXIFT);//禁用拔出USB唤醒
	EXTI_trigger_CMD(DISABLE, EXI_PIN0, _EXIFT);//禁用移开无线充电源唤醒

	//adc
	ADC12_ready_wait();
	ADC12_Control(ADC12_STOP); //休眠前不停止ADC转换，这会造成唤醒后，MCU卡机
	ADC12_CMD(DISABLE);
	GPIO_InPutOutPut_Disable(chg_l_adc_pin);
	GPIO_InPutOutPut_Disable(chg_r_adc_pin);
	GPIO_InPutOutPut_Disable(bat_adc_pin);
	GPIO_InPutOutPut_Disable(ntc_adc_pin);

	//LED
	GPIO_InPutOutPut_Disable(red_led_pin);
	GPIO_InPutOutPut_Disable(blue_led_pin);
	GPIO_InPutOutPut_Disable(green_led_pin);

	//communicate
	GPIO_Init(pattern_TX_pin, Output);
	GPIO_Write_Low(pattern_TX_pin);
	GPIO_InPutOutPut_Disable(pattern_RX_pin);
	
	GPIO_InPutOutPut_Disable(debug_RX_pin);
	GPIO_InPutOutPut_Disable(debug_TX_pin);

	GPIO_InPutOutPut_Disable(key_pin);//改善按下按键会增加功耗问题，合盖按键不唤醒
	GPIO_PullHighLow_DIS(key_pin);
}

void app_recover(void)
{
	//communicate
	UART1_CONFIG(115200);
	Coret_DelayMs(20);//延时使NTC电压稳定

	//charging
	GPIO_Init(charge_status_pin, Intput);
	GPIO_PullHigh_Init(charge_status_pin);
	GPIO_Init(charge_enable_pin, Output);
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE) 
	{
		GPIO_Write_High(charge_enable_pin);
		GPIO_Write_High(NTC_detect_pin);
		Coret_DelayMs(20);//延时使NTC电压稳定
		ntc_status_update(ntc_status_measure(ntc_adc_to_mv(adc_get_val(NTC_ADC))));
		charge_current_control(ntc_status_get(), app_charge_type_get());
		app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
	}
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIFT);//启用拔出USB唤醒
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIFT);//启用移开无线充电源唤醒

	//adc
	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
	ADC12_CMD(ENABLE);
	ADC12_ready_wait();

	//LED
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
	GPIO_Init(blue_led_pin, Output);
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);

	//communicate
	GPIOA0_EXI_Init(EXI4); /* GPIOA0.04设置为输入模式，输出禁止 */ 
	GPIO_PullLow_Init(key_pin);
}

void system_goto_deepsleep_mode(U8_T parm)
{	
	is_system_active = FALSE;
	app_status_indication_set(APP_STATUS_INDICATION_DSLEEP);
	printf("system goto deepsleep\r\n");
	printf("bye bye~~\r\n");
	app_deinit();
	PCLK_goto_deepsleep_mode();
	Coret_DelayMs(100); //系统唤醒后，延时使其稳定
	do {
		app_recover();
		Coret_DelayMs(20);//延时使初始化稳定
		is_system_active = TRUE;
		printf("\r\n\r\nsystem wakeup!!!\r\n");
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
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
					earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
					printf("earphone charge NTC error!!!\r\n");
				} else if(battery_power_get() > 0){
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
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
							if(is_earphone_fully_charged()) {
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
								earphone_status_update(APP_EARPHONE_STATUS_FULLCHARGE);
								if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
								if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FULL_CHARGE);
							}else {
								if(app_status_indication_get() != APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE)
								{
									if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
								}
							}
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
								earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
								printf("earphone charge NTC error!!!\r\n");
							}
							break;

						case APP_EARPHONE_STATUS_WAIT_FOR_CHARFE:
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
							{
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
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
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
					earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_COMM);
					printf("earphone charge NTC error!!!\r\n");
				} else if(battery_power_get() > 0){
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
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
						case APP_EARPHONE_STATUS_WAIT_FOR_COMM:
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
							{
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
								app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
								printf("earphone charge exit NTC error status!!!");
							}
							break;

						case APP_EARPHONE_STATUS_OVER_CURRENT:
							app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
							break;
						
						case APP_EARPHONE_STATUS_COMM:
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
								earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_COMM);
								printf("earphone charge NTC error!!!\r\n");
							}
							break;

						default:
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
				pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
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
			app_stop_100_millisecond_timer(APP_NTC_TIMER_ID);
			battery_status = status;
			pre_status = APP_BATTERY_STATUS_INVALID;
			break;
	}
	return 0;
}

S8_T app_battery_handle_process_charge(enum APP_BATTERY_STATUS_T status)
{
	static enum APP_BATTERY_STATUS_T pre_status = APP_BATTERY_STATUS_INVALID;
	static U16_T time_cnt = 0;
	static U8_T full_charge_cnt = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);

	switch(battery_status)
	{
		case APP_BATTERY_STATUS_CHARGING:
			if(battery_status != pre_status) {
				time_cnt = full_charge_cnt = 0;
				pre_status = battery_status;
				if(ntc_status_get() == APP_NTC_STATUS_STOPCHG)
				{
					printf("NTC error!!!: %d\r\n", ntc_status_get());
					battery_status = APP_BATTERY_STATUS_NTC_ERROR;
					break;
				}
				GPIO_Write_High(charge_enable_pin);
				charge_current_control(ntc_status_get(), app_charge_type_get());
				app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
				printf("charging....\r\n");
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
						//合盖状态耳机和仓满充要进休眠
						if(earphone_status_get() == APP_EARPHONE_STATUS_FULLCHARGE || earphone_status_get() == APP_EARPHONE_STATUS_NO_IN_BOX)
						{
							if(app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID) == TRUE)
								app_stop_100_millisecond_timer(APP_NTC_TIMER_ID);//关闭NTC检测定时器
							if(app_get_100_millisecond_timer_status(APP_DEEP_SLEEP_TIMER_ID) == FALSE)
								app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
						}
						//仓电量低于4.1V，回充
						if(APP_BATTERY_RECHARGE_MV >= battery_adc_to_mv(adc_get_val(BATTERY_ADC)))
						{
							GPIO_Write_High(charge_enable_pin);
							if(app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID) == FALSE)
								app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
							app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
							app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
							printf("start recharge....\r\n");
						}
					}
				}	
			}
			/*
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
			*/
			if(FALSE == app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID))//等待NTC状态发送变化
			{
				charge_current_control(ntc_status_get(), app_charge_type_get());
				if(ntc_status_get() == APP_NTC_STATUS_STOPCHG)
				{
					printf("NTC error!!!: %d\r\n", ntc_status_get());
					battery_status = APP_BATTERY_STATUS_NTC_ERROR;
				}
				app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
			}
			break;

		case APP_BATTERY_STATUS_NTC_ERROR:
			if(battery_status != pre_status) {
				time_cnt = 0;
				GPIO_Write_Low(charge_enable_pin);
				pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
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

			/*
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
			*/
			if(FALSE == app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID))//等待NTC状态发送变化
			{
				charge_current_control(ntc_status_get(), app_charge_type_get());
				if(ntc_status_get() != APP_NTC_STATUS_STOPCHG)
				{
					printf("NTC error-->recover charge!!!: %d\r\n", ntc_status_get());
					battery_status = APP_BATTERY_STATUS_CHARGING;
				}
				app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
			}
			break;

		case APP_BATTERY_STATUS_ERROR:
			if(battery_status != pre_status) {
				time_cnt = 0;
				GPIO_Write_Low(charge_enable_pin);
				pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
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
			ntc_status_update(ntc_status_measure(ntc_adc_to_mv(adc_get_val(NTC_ADC))));
			app_start_100_millisecond_timer(APP_NTC_TIMER_ID);
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
		if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_current_control(ntc_status_get(), app_charge_type_get());
		else 
		{
			charge_current_control(ntc_status_get(), app_charge_type_get());//有线充转无线充时，充电电流要转换
			if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
		}
	}
}

void EXI0IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
	{
		SYSCON->EXICR = EXI_PIN0;
		if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) charge_current_control(ntc_status_get(), app_charge_type_get());
 		else 
		{
			charge_current_control(ntc_status_get(), app_charge_type_get());
			if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
		}
	}
}

