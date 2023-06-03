#include "app_communicate.h"
#include "app_status_ind.h"
#include "app_battery.h"

struct UART_QUEUE uart2_que = {
	.phead = uart2_que.buffer,
	.ptail = uart2_que.buffer,
};

struct KEY_QUEUE key_que = {
	.phead = key_que.key_status,
	.ptail = key_que.key_status,
};

struct COMMUNICATE_QUEUE com_que = {
	.phead = com_que.com_event,
	.ptail = com_que.com_event,
};

const char ptp_pairing[] =	 {0xF1, 0x08, 0x39, '\0'};
const char bt_pairing[] = 	 {0xF1, 0x07, 0x14, '\0'};
const char factory_reset[] = {0xF1, 0x02, 0x0F, '\0'};
const char freeman_mode[] =  {0xF1, 0x06, 0x13, '\0'};

void UART2IntHandler(void) 
{
    // ISR content ...
	//Interupt
	if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)
	{
		UART2->ISR=UART_RX_INT_S;

		static U8_T buff_index = 0;
		static U8_T col_offset = 0;
		
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
		
		if((UART2->SR & (1 << 1)) != 0) // 接收缓冲区不为空
		{
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;

			if((*uart2_que.ptail)[col_offset - 1] == 0x0A) //回车符
			{
				uart2_que.data_lenth[buff_index] = col_offset;
				col_offset = 0;
				uart2_que.ptail++; // 准备下次数据接收
				/* 防止溢栈，从头接收 */
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
			}
			
			if(col_offset >= BUFFER_SIZE) col_offset = 0; /* 防止溢栈，从头接收 */
		}
	}
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    {
		UART2->ISR=UART_TX_INT_S;
		TxDataFlag = TRUE;
	}
	else if ((UART2->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
	{
		UART2->ISR=UART_RX_IOV_S;
	}
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART2->ISR=UART_TX_IOV_S;
	}
}

S8_T handle_uart2_recv_data(void)
{
	U8_T buff_index = 0;
	U8_T col_offset = 0;
	U8_T temp = 0;

	if(uart2_que.phead != uart2_que.ptail)
	{		
		buff_index = (U32_T)(uart2_que.phead - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);

		/*
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
		{
			temp = (*uart2_que.phead)[col_offset];
			
			if(temp == 0xAA)
			{
				bluetooth_que.ptail->command_id = (*uart2_que.phead)[col_offset + 1];
				bluetooth_que.ptail->data = (*uart2_que.phead)[col_offset + 2];
				(bluetooth_que.ptail)++;
				//防止溢栈，从头接收
				if(bluetooth_que.ptail == bluetooth_que.command + COMMAND_NUMBER) bluetooth_que.ptail = bluetooth_que.command;
				break;
			}
		}
		*/
		
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
		{
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
		}
		printf("\r\n");

		uart2_que.data_lenth[buff_index] = 0;
		uart2_que.phead++; /* 准备下次数据处理 */
	    /* 防止溢栈，从头处理 */
		if(uart2_que.phead == uart2_que.buffer + BUFFER_NUMBER) uart2_que.phead = uart2_que.buffer;
	}

	return 0;
}

S8_T IO_port_analog_uart_send_data(const char *data)
{
	U16_T data_length = strlen(data);
	U8_T i, j;

	//发码前先拉高RX电平
	pogo_pin_output_contrl(APP_OUTPUT_TYPE_SENDDATA);

	//CK_CPU_DisAllNormalIrq();
	for(i = 0; i < data_length; i++)
	{
		#if 0
		uart_TX_low;
		Coret_DelayUs(BIT_WIDTH_US);
		for(j = 0; j < 8; j++)
		{
			if((data[i] >> j) & 0x01) uart_TX_high;
			else uart_TX_low;
			Coret_DelayUs(BIT_WIDTH_US);
		}
		uart_TX_high;
		Coret_DelayUs(BIT_WIDTH_US);
		
		#else
		while((UART2->SR & 0X1) != 0);
		UART2->DATA = data[i];
		#endif
	}

	//发码后恢复RX输入功能
	pogo_pin_output_contrl(APP_OUTPUT_TYPE_REVDATA);
	//CK_CPU_EnAllNormalIrq();
	return 0;
}

S8_T send_communicate_event(enum COMMUNICATE_EVENT_T event)
{
	*com_que.ptail = event;

	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
		com_que.ptail = com_que.com_event;
	} else{
		com_que.ptail++;
	}
	
	return 0;
}

S8_T communicate_event_get(enum COMMUNICATE_EVENT_T *pevent)
{
	if(com_que.phead != com_que.ptail) {
		*pevent = *com_que.phead;
		if(com_que.phead == com_que.com_event + COM_QUE_SIZE - 1) {
			com_que.phead = com_que.com_event;
		} else{
			com_que.phead++;
		}
		return 0;
	}
	return -1;
}

S8_T communicate_process_handle(void)
{
	static U8_T comt_status = 0; //0：通信结束，1: 开始通信，2：通信中
	static enum COMMUNICATE_EVENT_T event = COMMUNICATE_EVENT_NONE;

	switch(comt_status)
	{
		case 0:
			if(communicate_event_get(&event) == -1) return -1;
			if(battery_status != APP_BATTERY_STATUS_NTC_ERROR && hall_status == APP_HALL_STATUS_OPEN_BOX && earphone_status != APP_EARPHONE_STATUS_OVER_CURRENT) {
				comt_status = 1;
				printf("%s: %d\r\n", __func__, event);
			}		
			break;
		
		case 1:
			if(hall_status == APP_HALL_STATUS_CLOSE_BOX) 
			{
				comt_status = 0;
				break;
			}
			
			switch(event)
			{
				case COMMUNICATE_EVENT_PTP_PAIR:
					IO_port_analog_uart_send_data(ptp_pairing);
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_PTP_PAIR);
					}	
					break;

				case COMMUNICATE_EVENT_BT_PAIR:
					IO_port_analog_uart_send_data(bt_pairing);
					break;

				case COMMUNICATE_EVENT_FACTORY_RESET:
					IO_port_analog_uart_send_data(factory_reset);
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_RESET);
					}
					break;

				case COMMUNICATE_EVENT_FREEMAN:
					IO_port_analog_uart_send_data(freeman_mode);
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FREEMAN);
					}
					break;
				default:
					break;
			}
			comt_status = 2;
			break;
		
		case 2:
			//等待耳机应答
			comt_status = 0;
			break;
			
		default:
			break;	
	}
	
	return 0;
}

S8_T pwr_key_handle(enum KEY_CODE_T code, enum KEY_EVENT_T event)
{
	printf("%s: %d %d\r\n", __func__, code, event);
	switch(event)
	{
		case KEY_EVENT_TRIPLECLICK:
			send_communicate_event(COMMUNICATE_EVENT_PTP_PAIR);
			break;

		case KEY_EVENT_LONGPRESS:
			if(battery_status == APP_BATTERY_STATUS_NORMAL) {
				app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_BT_PAIR);
			}
			break;

		case KEY_EVENT_UPAFTER_LONGPRESS:
			send_communicate_event(COMMUNICATE_EVENT_BT_PAIR);
			break;

		case KEY_EVENT_LLONGPRESS:
			send_communicate_event(COMMUNICATE_EVENT_FACTORY_RESET);
			break;
			
		default:
			break;

	}
	return 0;
}

S8_T send_key_event(enum KEY_CODE_T code, enum KEY_EVENT_T event)
{
	key_que.ptail->code = code;
	key_que.ptail->event = event;

	if(key_que.ptail == key_que.key_status + KEY_QUE_SIZE - 1) {
		key_que.ptail = key_que.key_status;
	} else{
		key_que.ptail++;
	}
	
	return 0;
}

S8_T key_event_get(struct KEY_STATUS_T *pkey_status)
{
	if(key_que.phead != key_que.ptail) {
		pkey_status->code = key_que.phead->code;
		pkey_status->event = key_que.phead->event;
		
		if(key_que.phead == key_que.key_status + KEY_QUE_SIZE - 1) {
			key_que.phead = key_que.key_status;
		} else{
			key_que.phead++;
		}
		return 0;
	}
	return -1;
}

S8_T app_key_event_handle(void)
{
	struct KEY_STATUS_T key_status;
	
	if(key_event_get(&key_status) == -1) return -1; 
	
	switch(key_status.code)
	{
		case KEY_CODE_PWR:
			pwr_key_handle(key_status.code, key_status.event);
			break;
		
		default:
			break;
	}
	
	return 0;
}

enum KEY_CODE_T key_scanf(void)
{
	enum KEY_CODE_T code_down = KEY_CODE_NONE;
	
	if(GPIO_Read_Status(key_pin)) code_down |= KEY_CODE_PWR;

	return code_down;
}

S8_T key_debounce_handler(void)
{
	static enum KEY_CODE_T pre_keyval; //前一个按键值
	static enum KEY_EVENT_T key_event; //按键事件
	static enum KEY_CODE_T code_click; //多击键值
	static U32_T key_press_cnt; //按下时间计数
	static U8_T cnt_click; //多击计数
	enum KEY_CODE_T key_buffer;
	
	key_buffer = key_scanf();
	
	if(pre_keyval != key_buffer) {
		if(pre_keyval > KEY_CODE_NONE && key_buffer == KEY_CODE_NONE) { //按键释放
			if(key_event == KEY_EVENT_LONGPRESS || key_event == KEY_EVENT_LLONGPRESS) {
				if(key_event == KEY_EVENT_LONGPRESS) {
					send_key_event(pre_keyval, KEY_EVENT_UPAFTER_LONGPRESS);
				}
				key_press_cnt = 0;
				cnt_click = 0;
				key_event = KEY_EVENT_NONE;
				code_click = KEY_CODE_NONE;
			}
		} else if(pre_keyval == KEY_CODE_NONE && key_buffer > KEY_CODE_NONE) { //按下按键
			key_press_cnt = 0;
			code_click = key_buffer;
			if(key_event == KEY_EVENT_NONE) key_event = KEY_EVENT_DOWN;
			else if(key_event == KEY_EVENT_DOWN){
				cnt_click++;
			}
			/*
			if(battery_status == APP_BATTERY_STATUS_NORMAL && hall_status == APP_HALL_STATUS_OPEN_BOX && earphone_status != APP_EARPHONE_STATUS_OVER_CURRENT) {
				printf("aaaap\r\n");
				//app_stop_5_second_timer(APP_DEEP_SLEEP_TIMER_ID);
			}
			*/
		}
		pre_keyval = key_buffer;	
	} else{
		key_press_cnt++;
		if(key_buffer == KEY_CODE_NONE) {
			if(key_event == KEY_EVENT_DOWN) {
				if(key_press_cnt >= KEY_DOUBLECLICK_THRESHOLD || cnt_click >= MAX_KEY_CLICK_COUNT) {
					send_key_event(code_click, KEY_EVENT_CLICK + cnt_click);
					key_press_cnt = 0;
					cnt_click = 0;
					key_event = KEY_EVENT_NONE;
					code_click = KEY_CODE_NONE;
				}
			} else if(key_event == KEY_EVENT_NONE){
				if(key_press_cnt >= KEY_IDLE_TIMEOUT) {
					key_press_cnt = 0;
					/*
					if(battery_status == APP_BATTERY_STATUS_NORMAL && hall_status == APP_HALL_STATUS_OPEN_BOX && earphone_status != APP_EARPHONE_STATUS_OVER_CURRENT) {
						app_set_5_second_timer(APP_DEEP_SLEEP_TIMER_ID, TRUE, 4);
					}
					*/
				}	
			}
		} else{
			switch(key_event)
			{				
				case KEY_EVENT_DOWN:
					if(key_press_cnt >= KEY_LONGPRESS_THRESHOLD) {
						key_event = KEY_EVENT_LONGPRESS;
						send_key_event(key_buffer, key_event);
					}
					break;
					
				case KEY_EVENT_LONGPRESS:
					if(key_press_cnt >= KEY_LLONGPRESS_THRESHOLD) {
						key_event = KEY_EVENT_LLONGPRESS;
						send_key_event(key_buffer, key_event);
					}
					break;
					
				default:
					break;
			}
		}	
	}
	return 0;
}

