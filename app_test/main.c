#include "apt32f102.h"
#include "platform_driver.h"
#include "app_status_ind.h"
#include "app_battery.h"
#include "app_state_machine.h"
#include "app_communicate.h"

extern void APT32F102_init(void);	

int main(void)
{	
	APT32F102_init();
	printf("\r\n\r\nTWSBT013-charging case: V0.0.6\r\n");
	Coret_DelayMs(20); /* 延时使系统稳定 */
	
	ReduceSYSCLKto5556KHZ();

	/* 待机电流Debug
	Coret_DelayMs(8000);
	system_goto_deepsleep_mode(0);
	*/
	
	battery_power_update(battery_level_calculate(battery_adc_to_mv(adc_get_val(BATTERY_ADC))));
	app_start_100_millisecond_timer(APP_BATTERY_TIMER_ID);
	app_start_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);//常开过流保护检测定时器
	
	while(1)
	{
		/* time_1ms_handle */
		if(TimerFlag & TIMER_1MS_FLAG)
		{
			TimerFlag &= ~TIMER_1MS_FLAG;
			app_key_event_handle();
		}
		
		/* time_10ms_handle */
		if(TimerFlag & TIMER_10MS_FLAG)
		{
			TimerFlag &= ~TIMER_10MS_FLAG;
			handle_uart2_recv_data();
			app_battery_handle_process();
			box_open_close_handle_progress();
		}
		
		/* time_100ms_handle */
		if(TimerFlag & TIMER_100MS_FLAG)
		{
			TimerFlag &= ~TIMER_100MS_FLAG;	
			communicate_process_handle();
			app_status_handle_process();
			app_100_millisecond_timer_check();
		}
		
		/* time_1s_handle */
		if(TimerFlag & TIMER_1S_FLAG)
		{
			TimerFlag &= ~TIMER_1S_FLAG;
			
			U32_T L_pogo, R_pogo;
			L_pogo = adc_get_val(L_EARBUD_POGO_ADC);
			R_pogo = adc_get_val(R_EARBUD_POGO_ADC);
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
			
			//printf("wireless5V: %d, usb5V: %d\r\n",GPIO_Read_Status(charge_wireless5V_dectect_pin), GPIO_Read_Status(charge_USB5V_detect_pin));
			//printf("****: %f\r\n",APP_BATTERY_MV_BASE);	
			//IO_port_analog_uart_send_data("hello word! ABCDEFG abcdefg 1234567 \r\n");
			//printf("RX: %d\r\n",GPIO_Read_Status(GPIOA0, 15));
			//printf("battery: %lumV\r\n",battery_adc_to_mv(adc_get_val(BATTERY_ADC)));
			//printf("battery adc: %lu\r\n",adc_get_val(BATTERY_ADC));
		}
	}
}

