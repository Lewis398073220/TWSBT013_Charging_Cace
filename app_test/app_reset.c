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
#include "math.h" 
#include <string.h>


#define RECBUFSIZE 30
#define SYNC_PIN_AS_INPUT  GPIO_Init(GPIOA0,13,1)
#define MCURST_SYNC_IN 	GPIO_Read_Status(GPIOA0,13)
const char rstpattern[9] = {0xF5,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0x00};
volatile U8_T progDatabuf[32]={0};
volatile int indx =0;
const char jmpIAPstr[11] = {"JumptoISP\n"};
const char rststr[8] = {"RSTACK\n"};

void delayus_Bycode(unsigned int t)
{
	volatile unsigned int i =  t>1?t-2:0;
	while(i--){
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
	}
}

void delayms_Bycode(unsigned int t)
{
	volatile unsigned int i = t;
	while(i--){
		delayus_Bycode(103);
	}
}

void JumpToIAP(void)
{
	SYSCON -> RSR = 0xFFFFFFFF;
	SYSCON -> IDCCR = 0xE11E0081; //系统软复位
	//SYSCON_Software_Reset();
}

char inline Prog_get_char(void){
	return UART1 -> DATA;
}

void prog_uart_send(const char * cc,int len){
	int i;
	for(i=0;i<len;i++){
		UARTTxByte(UART1,cc[i]);
	}
}

void SendRstACK(void){
	delayms_Bycode(1);
	prog_uart_send(rststr,7);
	delayms_Bycode(1);
	prog_uart_send(rststr,7);
	delayms_Bycode(1);
	prog_uart_send(rststr,7);
	delayms_Bycode(1);
}

void wait_syncpin_release(U8_T logic, U32_T timeout){
	int deglitchcnt;
	U32_T timecnt=0;
	volatile U8_T level =0;
	if(logic) level =1;
	SYNC_PIN_AS_INPUT;
	deglitchcnt =0;
	while(1){				
		delayms_Bycode(10);
		if( MCURST_SYNC_IN == level) {
			deglitchcnt++;
		}
		else {
			deglitchcnt=0;
		}
		if(deglitchcnt >= 10) break;
		timecnt++;
		if(timeout > 0) {
			if(timecnt >= timeout) break;
		}
	}
}

void program_trig_check(void){
	U8_T rstflag =0;

	if(strstr((const char *)progDatabuf,rstpattern)) rstflag =1;
	if(rstflag){
		rstflag =0;
		prog_uart_send(jmpIAPstr,10);
		SendRstACK();
		delayms_Bycode(10);
		CK_CPU_DisAllNormalIrq();//关闭所有中断
		wait_syncpin_release(0, 600);
		JumpToIAP();
	}
}