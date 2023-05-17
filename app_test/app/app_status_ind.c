#include "app_status_ind.h"
#include "app_battery.h"

enum APP_STATUS_INDICATION_T app_status = APP_STATUS_INDICATION_NUM;

void app_close_all_led(void)
{
	GPIO_InPutOutPut_Disable(red_led_pin);
	GPIO_Write_High(red_led_pin);
	GPIO_InPutOutPut_Disable(green_led_pin);
	GPIO_Write_High(green_led_pin);
	GPIO_InPutOutPut_Disable(blue_led_pin);
	GPIO_Write_High(blue_led_pin);
	EPT_Vector_Int_Disable();
	EPT_Stop();
}

void app_red_led_turn_solid(void)
{
	GPIO_Init(red_led_pin, Output);
	GPIO_Write_Low(red_led_pin);
}

void app_green_led_turn_solid(void)
{
	GPIO_Init(green_led_pin, Output);
	GPIO_Write_Low(green_led_pin);
}

void app_blue_led_turn_solid(void)
{
	GPIO_Init(blue_led_pin, Output);
	GPIO_Write_Low(blue_led_pin);	
}

void app_red_led_pwm_contrl(U16_T comp_val, U8_T breath)
{
	GPIO_InPutOutPut_Disable(green_led_pin);
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, comp_val, 0, 0);
	if(breath == TRUE) {
		EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0);
		EPT_Vector_Int_Enable();
	} else EPT_Vector_Int_Disable();
	EPT_Start();
}

void app_green_led_pwm_contrl(U16_T comp_val, U8_T breath)
{
	GPIO_InPutOutPut_Disable(red_led_pin);
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, comp_val, 0, 0);
	if(breath == TRUE) {
		EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0);
		EPT_Vector_Int_Enable();
	} else EPT_Vector_Int_Disable();
	EPT_Start();
}

S8_T app_status_indication_set(enum APP_STATUS_INDICATION_T status)
{
	printf("%s: %d\r\n",__func__, status);

	if(app_status == status) return 0;
	
	app_status = status;
	app_close_all_led();
	
	return 1;
}

U8_T app_status_indication_get(void)
{
	return app_status;
}

S8_T app_status_handle_process(void)
{
	static enum APP_STATUS_INDICATION_T pre_status = APP_STATUS_INDICATION_NUM;
	static enum APP_STATUS_INDICATION_T cur_status = APP_STATUS_INDICATION_NUM;
	static U16_T time_cnt = 0;
	static U8_T led_reverse_flag, led_flash_cnt = 0;
	
	switch(app_status)
	{
		case APP_STATUS_INDICATION_CHARGING:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_red_led_pwm_contrl(2000, TRUE);
			} else{
				time_cnt++;
				if(time_cnt >= 30) {
					time_cnt = 0;
					app_red_led_pwm_contrl(2000, TRUE);
				}
			}
			pre_status = cur_status;
			break;
		
		case APP_STATUS_INDICATION_FULLCHARGE:
			/*
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_green_led_turn_solid();
			} else{
				;
			}
			pre_status = cur_status;
			*/
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_green_led_pwm_contrl(2000, TRUE);
			} else{
				time_cnt++;
				if(time_cnt >= 30) {
					time_cnt = 0;
					app_green_led_pwm_contrl(2000, TRUE);
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_PLUGOUT:
			pre_status = app_status;
			break;
			
		case APP_STATUS_INDICATION_NTC_ERROR:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				led_flash_cnt = 0;
				led_reverse_flag = 1;
				app_red_led_turn_solid();
			} else{
				time_cnt++;
				if(led_flash_cnt < 3) {
					if(led_reverse_flag == 0 && time_cnt >= 2) {
						time_cnt = 0;
						led_reverse_flag = 1;
						app_red_led_turn_solid();
					} else if(led_reverse_flag == 1 && time_cnt >= 2)
					{
						time_cnt = 0;
						led_reverse_flag = 0;
						led_flash_cnt++;
						app_close_all_led();
					}
				} else{
					if(time_cnt >= 10) {
						led_flash_cnt = 0;
					}
				}
			}
			pre_status = cur_status;
			break;
			
		case APP_STATUS_INDICATION_BATTERY_HIGH:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_green_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 20) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;
			
		case APP_STATUS_INDICATION_BATTERY_MIDDLE:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_green_led_pwm_contrl(1680, FALSE);
				app_red_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 20) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;
		case APP_STATUS_INDICATION_BATTERY_LOW:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_red_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 20) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;
			
		case APP_STATUS_INDICATION_BATTERY_WARNING:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				led_flash_cnt = 0;
				led_reverse_flag = 1;
				app_red_led_turn_solid();
			} else{
				time_cnt++;
				if(led_reverse_flag == 0 && time_cnt >= 2) {
					time_cnt = 0;
					led_reverse_flag = 1;
					app_red_led_turn_solid();
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
				{
					time_cnt = 0;
					led_reverse_flag = 0;
					led_flash_cnt++;
					if(led_flash_cnt >= 5) {
						led_flash_cnt = 0;
						app_status = APP_STATUS_INDICATION_NUM;
					}
					app_close_all_led();
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				led_reverse_flag = 1;
				app_red_led_turn_solid();
			} else{
				time_cnt++;
				if(led_reverse_flag == 0 && time_cnt >= 50) {
					time_cnt = 0;
					led_reverse_flag = 1;
					app_red_led_turn_solid();
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
				{
					time_cnt = 0;
					led_reverse_flag = 0;
					app_close_all_led();
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_EARPHONE_FULL_CHARGE:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_close_all_led();
			} else{
				;
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				led_reverse_flag = 1;
				app_red_led_turn_solid();
			} else{
				time_cnt++;
				if(led_reverse_flag == 0 && time_cnt >= 2) {
					time_cnt = 0;
					led_reverse_flag = 1;
					app_red_led_turn_solid();
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
				{
					time_cnt = 0;
					led_reverse_flag = 0;
					app_close_all_led();
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_EARPHONE_PTP_PAIR:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_blue_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 10) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_EARPHONE_BT_PAIR:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_blue_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 10) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_EARPHONE_RESET:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_blue_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 10) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;

		case APP_STATUS_INDICATION_EARPHONE_FREEMAN:
			cur_status = app_status;
			if(cur_status != pre_status)
			{
				time_cnt = 0;
				app_blue_led_turn_solid();
			} else{
				time_cnt++;
				if(time_cnt >= 10) {
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
			break;
			
		case APP_STATUS_INDICATION_DSLEEP:
			pre_status = app_status;
			break;
			
		default:
			pre_status = app_status;
			break;
	}
	
	return 0;
}

