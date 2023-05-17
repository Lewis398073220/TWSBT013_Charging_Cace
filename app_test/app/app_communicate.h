#ifndef _APP_COMMUNICATE_H
#define _APP_COMMUNICATE_H

#include "apt32f102.h"
#include "platform_driver.h"
#include <string.h>

extern volatile U32_T SYSCLK;

#define BUFFER_SIZE        16
#define BUFFER_NUMBER      5

/* 串口数据缓冲队列 */
struct UART_QUEUE{
	U8_T (*phead)[BUFFER_SIZE + 1]; /* 当数据出队后，队列头指针+1 */
	U8_T (*ptail)[BUFFER_SIZE + 1]; /* 当数据入队后，队列尾指针+1 */
	U8_T buffer[BUFFER_NUMBER + 1][BUFFER_SIZE + 1];
	U8_T data_lenth[BUFFER_NUMBER + 1];
};

#define TICK                             50 //50ms中断
#define KEY_DOUBLECLICK_THRESHOLD		(400/TICK)
#define KEY_LONGPRESS_THRESHOLD	  	    (3000/TICK)
#define KEY_LLONGPRESS_THRESHOLD	  	(10000/TICK)

#define KEY_IDLE_TIMEOUT                (20000/TICK)

enum KEY_CODE_T {
	KEY_CODE_NONE = 0,
	KEY_CODE_PWR = (1 << 0),
};

enum KEY_EVENT_T {
	KEY_EVENT_NONE = 0,
	KEY_EVENT_DOWN,
	KEY_EVENT_CLICK,
	KEY_EVENT_DOUBLECLICK,
	KEY_EVENT_TRIPLECLICK,
	KEY_EVENT_FOURTHCLICK,
	KEY_EVENT_FIFTHCLICK,
	KEY_EVENT_LONGPRESS,
	KEY_EVENT_LLONGPRESS,
	KEY_EVENT_UPAFTER_LONGPRESS,
};

#define MAX_KEY_CLICK_COUNT             (KEY_EVENT_FIFTHCLICK - KEY_EVENT_CLICK)

struct KEY_STATUS_T {
	enum KEY_CODE_T code;
	enum KEY_EVENT_T event;
};

#define KEY_QUE_SIZE        5	
struct KEY_QUEUE {
	struct KEY_STATUS_T key_status[KEY_QUE_SIZE];
	struct KEY_STATUS_T *phead;
	struct KEY_STATUS_T *ptail;
};

enum COMMUNICATE_EVENT_T {
	COMMUNICATE_EVENT_NONE = 0,
	COMMUNICATE_EVENT_PTP_PAIR,
	COMMUNICATE_EVENT_BT_PAIR,
	COMMUNICATE_EVENT_FACTORY_RESET,
	COMMUNICATE_EVENT_FREEMAN,
};

#define COM_QUE_SIZE        5
struct COMMUNICATE_QUEUE {
	enum COMMUNICATE_EVENT_T com_event[COM_QUE_SIZE];
	enum COMMUNICATE_EVENT_T *phead;
	enum COMMUNICATE_EVENT_T *ptail;	
};

#if 1
#define uart_TX_high      GPIO_Write_High(pattern_TX_pin)
#define uart_TX_low       GPIO_Write_Low(pattern_TX_pin)
#else
#define uart_TX_high      GPIO_Write_High(charging_5v_en_pin)
#define uart_TX_low       GPIO_Write_Low(charging_5v_en_pin)
#endif

//4600 5MHZ 1.2v禁止中断/2.3v不禁中断
//1406 5MHZ 2.3v禁中断
//2300 5MHZ 2.3v不禁中断 baudrate=400
//4800 48MHZ 禁止中断
//3033 5MHZ 1.6v不禁中断 baudrate=300
#define BIT_WIDTH_US      	3033//1406//4600//4800//1466

S8_T handle_uart2_recv_data(void);
S8_T key_debounce_handler(void);
S8_T app_key_event_handle(void);
S8_T IO_port_analog_uart_send_data(const char *data);
S8_T communicate_process_handle(void);


#endif
