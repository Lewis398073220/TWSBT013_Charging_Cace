#ifndef _APP_STATE_MACHINE_H
#define _APP_STATE_MACHINE_H

#include "apt32f102.h"
#include "platform_driver.h"

#define TIMER_100US_FLAG  		0x01
#define TIMER_1MS_FLAG  		0x02
#define TIMER_10MS_FLAG  		0x04
#define TIMER_50MS_FLAG         0x08
#define TIMER_100MS_FLAG  		0x10
#define TIMER_1S_FLAG  			0x20
#define TIMER_5S_FLAG  			0x40
#define TIMER_10S_FLAG  		0x80

extern volatile U8_T TimerFlag;


#endif
