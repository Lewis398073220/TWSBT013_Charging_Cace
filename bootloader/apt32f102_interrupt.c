/*
  ******************************************************************************
  * @file    apt32f102_interrupt.c
  * @author  APT AE Team
  * @version V0.50
  * @date    2020/05/14
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

/* Includes ------------------------------------------------------------------*/
#include "apt32f102.h"
#include "apt32f102_gpio.h"
#include "apt32f102_syscon.h"
#include "apt32f102_uart.h"
#include "apt32f102_ifc.h"
#include "apt32f102_types_local.h"
#include "bootloader.h"
/* externs--------------------------------------------------------------------*/
extern void delay_nms(unsigned int t);
//volatile int R_CMPA_BUF,R_CMPB_BUF;
volatile U8_T ifc_step,f_Drom_write_complete;
//volatile int R_SIOTX_count,R_SIORX_count;
//volatile int R_SIORX_buf[10];
//volatile int SPI_DATA[8];
//volatile U8_T r_uart_buf[9];
//volatile U8_T r_urat_cont;

//volatile U8_T f_io_toggle;

extern void ProgUartPageRec(void);
/*************************************************************/
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    // ISR content ...
	//并行写模式
	/*if(IFC->MISR&ERS_END_INT)			//擦除指令完成
	{
		IFC->ICR=ERS_END_INT;
		if((ifc_step==1)&&(f_Drom_writing==1))
		{
			SetUserKey;
			IFC->CMR=0x01;					//将页缓存的数据写入闪存中
			IFC->FM_ADDR=R_INT_FlashAdd;		//
			IFC->CR=0X01;					//Start Program
			ifc_step=2;
		}
	}
	else if(IFC->MISR&RGM_END_INT)		//编译指令完成
	{
		IFC->ICR=RGM_END_INT;
		if((ifc_step==2)&&(f_Drom_writing==1))
		{
			f_Drom_writing=0;
			f_Drom_write_complete=1;
		}
	}
	else if(IFC->MISR&PEP_END_INT)		//预编程指令完成
	{
		IFC->ICR=PEP_END_INT;
		if((ifc_step==0)&&(f_Drom_writing==1))
		{
			SetUserKey;
			IFC->CMR=0x02;					//页擦除
			IFC->FM_ADDR=R_INT_FlashAdd;			//
			IFC->CR=0X01;					//Start Program
			ifc_step=1;
		}
	}*/
}
/*************************************************************/
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
    // ISR content ...
	//Interupt
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)
	{
		
		UART0->ISR=UART_RX_INT_S;
	}
}
/*************************************************************/
//UART1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1IntHandler(void) 
{
    // ISR content ...
	//Interupt
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)
	{
		ProgUartPageRec();
		UART1->ISR=UART_RX_INT_S;
	}
	
}
/*************************************************************/
//UART2 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART2IntHandler(void) 
{
    // ISR content ...
	//Interupt
	/*if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)
	{
		UART2->ISR=UART_RX_INT_S;
		RxDataFlag = TRUE;
	}*/
	
}

/*************************************************************/
/*************************************************************/
/*************************************************************/
void PriviledgeVioHandler(void) 
{
    // ISR content ...

}

void SystemDesPtr(void) 
{
    // ISR content ...

}

void MisalignedHandler(void) 
{
    // ISR content ...

}

void IllegalInstrHandler(void) 
{
    // ISR content ...

}

void AccessErrHandler(void) 
{
    // ISR content ...

}

void BreakPointHandler(void) 
{
    // ISR content ...

}

void UnrecExecpHandler(void) 
{
    // ISR content ...

}

void Trap0Handler(void) 
{
    // ISR content ...

}

void Trap1Handler(void) 
{
    // ISR content ...

}

void Trap2Handler(void) 
{
    // ISR content ...

}

void Trap3Handler(void) 
{
    // ISR content ...

}

void PendTrapHandler(void) 
{
    // ISR content ...

}
/******************* (C) COPYRIGHT 2020 APT Chip *****END OF FILE****/

