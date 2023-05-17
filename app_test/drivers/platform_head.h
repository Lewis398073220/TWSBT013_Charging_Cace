#ifndef _DEV_HEAD_H_
#define _DEV_HEAD_H_

#include "apt32f102.h"
#include "apt32f102_syscon.h"
#include "apt32f102_coret.h"
#include "apt32f102_gpio.h"
#include "apt32f102_crc.h"
#include "apt32f102_wwdt.h"
#include "apt32f102_lpt.h"
#include "apt32f102_countera.h"
#include "apt32f102_bt.h"
#include "apt32f102_hwdiv.h"
#include "apt32f102_sio.h"
#include "apt32f102_uart.h"
#include "apt32f102_i2c.h"
#include "apt32f102_spi.h"
#include "apt32f102_rtc.h"
#include "apt32f102_ept.h"
#include "apt32f102_gpt.h"
#include "apt32f102_et.h"
#include "apt32f102_adc.h"
#include "apt32f102_ifc.h"
#include "apt32f102_types_local.h"

extern void delay_timeout(void);
extern void delay_ms(U16_T t);


#endif
