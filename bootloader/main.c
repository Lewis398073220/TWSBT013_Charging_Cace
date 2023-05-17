/*
  ******************************************************************************
  * @file    main.c
  * @author  APT AE Team
  * @version V0.50
  * @date    2020/05/18
  ******************************************************************************
  *THIS SOFTWARE WHICH IS FOR ILLUSTRATIVE PURPOSES ONLY WHICH PROVIDES 
  *CUSTOMER WITH CODING INFORMATION REGARDING THEIR PRODUCTS.
  *APT CHIP SHALL NOT BE HELD RESPONSIBILITY ADN LIABILITY FOR ANY DIRECT, 
  *INDIRECT DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT OF 
  *SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION 
  *CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.AND APT CHIP RESERVES 
  *THE RIGHT TO MAKE CHANGES IN THE SOFTWARE WITHOUT NOTIFICATION
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/ 
/* Includes ------------------------------------------------------------------*/
#include "apt32f102.h"
#include "apt32f102_gpio.h"
#include "apt32f102_syscon.h"
#include "apt32f102_uart.h"
#include "apt32f102_ifc.h"
#include "apt32f102_types_local.h"
#include "uartx_config.h"
#include "bootloader.h"

char ifc_data_buf[8]={0x12,0X23,0X56,0X89,0XFF,0xBB,0XCC,0XDD};
/* defines -------------------------------------------------------------------*/
/* externs Register-------------------------------------------------------------------*/
volatile U8_T sysState= 0;
volatile int ret =0;
/* externs function-------------------------------------------------------------------*/
extern void delay_nms(unsigned int t);
extern void APT32F102_init(void);	
/*************************************************************/
//main
/*************************************************************/
int main(void) 
{
	//delay_nms(10000);
	APT32F102_init();
	//PageErase(0X2000);
	//Page_ProgramData(0x2000,8,ifc_data_buf);
	sysState = 0;
    while(1)
	{
		SYSCON_IWDCNT_Reload(); 
		switch(sysState){
			case 0:
				sysState = check_boot_option();
				break;
			case 'p':
				ret = program_process();
				if(ret ==0) sysState = 'b';
				else sysState = 'w';
				break;
			case 'b':
				ret = boot_process();	
				if(ret ==1) sysState = 'w';
				else rst_mcu();
				break;
			case 'w':
				wait_cmd();
				break;
			default:
				rst_mcu();
				break;
		}	
    }
}
/******************* (C) COPYRIGHT 2019 APT Chip *****END OF FILE****/